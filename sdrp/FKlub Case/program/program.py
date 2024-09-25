import pygrametl
from pygrametl.datasources import SQLSource, CSVSource
from pygrametl.tables import CachedDimension, FactTable

from config import load_config
from connect import connect

stregsystem_source_conn = connect(load_config(filename="stregsystem.ini"))
datawarehouse_conn = connect(load_config(filename="datawarehouse.ini"))

dw_conn_wrapper = pygrametl.ConnectionWrapper(connection=datawarehouse_conn)

name_mapping = "member_id", "product_id", "timestamp", "price"
query = "SELECT member_id, product_id, timestamp, price FROM stregsystem.stregsystem_sale"
sale_source = SQLSource(connection=stregsystem_source_conn, query=query,
        names=name_mapping)

name_mapping = "member_id", "active", "year", "gender", "want_spam", "balance", "undo_count"
query = "SELECT id, active, year, gender, want_spam, balance, undo_count FROM stregsystem.stregsystem_member"
member_source = SQLSource(connection=stregsystem_source_conn, query=query,
        names=name_mapping)

name_mapping = "product_id", "name", "price"
query = "SELECT id, name, price FROM stregsystem.stregsystem_product"
product_source = SQLSource(connection=stregsystem_source_conn, query=query,
        names=name_mapping)

def split_date(row):
    """Splits a date represented by a datetime into its three parts"""

    # Splitting of the date into parts
    date = row['timestamp']
    row['year'] = date.year
    row['month'] = date.month
    row['day'] = date.day

time_dimension = CachedDimension(
    name='time_dim',
    key='timeid',
    attributes=['day', 'month', 'year'])

member_dimension = CachedDimension(
    name="member_dim",
    key="member_id",
    attributes=["gender", "year", "balance", "active"],
    lookupatts=["member_id"])

product_dimension = CachedDimension(
    name="product_dim",
    key="product_id",
    attributes=["name", "price"],
    lookupatts=["product_id"])

fact_table = FactTable(
    name="sales_fact",
    keyrefs=["member_id", "product_id", "timeid"],
    measures=["price"])

#if __name__ == "__main__":

# Importing the product source
for row in member_source:
    member_dimension.ensure(row)

# Importing the product source
for row in product_source:
    product_dimension.ensure(row)

for row in sale_source:
    member_id = member_dimension.lookup(row)
    if member_id == None:
        continue

    product_id = product_dimension.lookup(row)
    if product_id == None:
        continue

    timestamp = row['timestamp']
    day = timestamp.day
    month = timestamp.month
    year = timestamp.year

    timeid = time_dimension.ensure({
        'day': day,
        'month': month,
        'year': year
    })

    fact_table.insert({
        "member_id": member_id,
        "product_id": product_id,
        "timeid": timeid,
        "price": row["price"],
    })

dw_conn_wrapper.commit()
dw_conn_wrapper.close()

datawarehouse_conn.close()