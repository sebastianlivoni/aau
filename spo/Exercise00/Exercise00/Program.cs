using Exercise00;

Value a = new("a");
Value n = new("n");
Value one = new("one");
Var var_a = new(a);
Var var_n = new(n);
Plus plus = new(var_a, var_n);
Int _int = new(one);
Times times = new(plus, _int);

times.PrintInorder();

string _string = "a + n + 1";
