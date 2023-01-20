CsvReader csvReaderProducts = new CsvReader(new StreamReader("db/products.csv"), new CsvReaderOptions(";"));
CsvReader csvReaderUsers = new CsvReader(new StreamReader("db/users.csv"), new CsvReaderOptions(","));

StregSystem stregSystem = new(csvReaderProducts, csvReaderUsers);
IStregSystemUI ui = new StregsystemCLI(stregSystem);
StregSystemController sc = new StregSystemController(ui, stregSystem);

ui.Start();