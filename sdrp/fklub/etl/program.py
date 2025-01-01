import pygrametl
from pygrametl.datasources import SQLSource, CSVSource
from pygrametl.tables import CachedDimension, FactTable
from datetime import datetime

from config import load_config
from connect import connect

stregsystem_source_conn = connect(load_config(filename="stregsystem.ini"))
datawarehouse_conn = connect(load_config(filename="datawarehouse.ini"))

dw_conn_wrapper = pygrametl.ConnectionWrapper(connection=datawarehouse_conn)

name_mapping = "member_id", "product_id", "room_id", "timestamp", "price"
query = "SELECT member_id, product_id, room_id, timestamp, price FROM stregsystem.stregsystem_sale"
sale_source = SQLSource(connection=stregsystem_source_conn, query=query,
        names=name_mapping)

name_mapping = "member_id", "active", "year", "gender", "balance"
query = "SELECT id, active, year, gender, balance FROM stregsystem.stregsystem_member"
member_source = SQLSource(connection=stregsystem_source_conn, query=query,
        names=name_mapping)

name_mapping = "product_id", "name", "price", "active", "deactivate_date", "alcohol_content_ml", "start_date"
query = "SELECT id, name, price, active, deactivate_date, alcohol_content_ml, start_date FROM stregsystem.stregsystem_product"
product_source = SQLSource(connection=stregsystem_source_conn, query=query,
        names=name_mapping)

name_mapping = "room_id", "name", "description"
query = "SELECT id, name, description FROM stregsystem.stregsystem_room"
room_source = SQLSource(connection=stregsystem_source_conn, query=query,
        names=name_mapping)

time_dimension = CachedDimension(
    name='time_dim',
    key='timeid',
    attributes=['day', 'month', 'year', 'weekday_name', 'week_number'])

member_dimension = CachedDimension(
    name="member_dim",
    key="member_id",
    attributes=["gender", "year", "balance", "status"],
    lookupatts=["member_id"])

product_dimension = CachedDimension(
    name="product_dim",
    key="product_id",
    attributes=["name", "price", "status", "deactivate_date", "alcohol_content_ml", "start_date"],
    lookupatts=["product_id"])

room_dimension = CachedDimension(
    name="room_dim",
    key="room_id",
    attributes=["name", "description"],
    lookupatts=["room_id"])

fact_table = FactTable(
    name="sales_fact",
    keyrefs=["member_id", "product_id", "room_id", "timeid"], # maybe time of day 
    measures=["price"])

# Importing the product source
for row in member_source:
    row["status"] = "Active" if row.pop("active") else "Inactive"
    member_dimension.ensure(row)

# Importing the product source
for row in product_source:
    row["status"] = "Active" if row.pop("active") else "Inactive"
    product_dimension.ensure(row)

# Importing the room source
for row in room_source:
    room_dimension.ensure(row)

for row in sale_source:
    member_id = member_dimension.lookup(row)
    if member_id == None:
        continue

    product_id = product_dimension.lookup(row)
    if product_id == None:
        continue

    room_id = room_dimension.lookup(row)
    if room_id == None:
        continue

    timestamp = row['timestamp']
    day = timestamp.day
    month = timestamp.month
    year = timestamp.year
    date = datetime(year, month, day)
    weekday_name = date.strftime("%A")
    week_number = date.isocalendar()[1]

    timeid = time_dimension.ensure({
        'day': day,
        'month': month,
        'year': year,
        'weekday_name': weekday_name,
        'week_number': week_number
    })

    fact_table.insert({
        "member_id": member_id,
        "product_id": product_id,
        "room_id": room_id,
        "timeid": timeid,
        "price": row["price"],
    })

dw_conn_wrapper.commit()
dw_conn_wrapper.close()

datawarehouse_conn.close()