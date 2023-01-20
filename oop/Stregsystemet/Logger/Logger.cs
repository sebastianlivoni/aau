static class Logger {
    public static void LogInformation(string info) {
        string path = "db/logs.txt";
        DateTime now = DateTime.Now;

        using (StreamWriter sw = File.AppendText(path))
        {
            sw.WriteLine($"{now}: {info}");
        }
    }
}