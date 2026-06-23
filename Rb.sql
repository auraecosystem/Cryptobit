private SQLiteConnection ChromeDatabaseConnection(string databaseFilePath)
{
    FilePath = databaseFilePath;
    SQLiteConnection sqliteConnection = new SQLiteConnection(
        $"Data Source={FilePath};" +
        $"Version=3;" +
        $"New=True");

    sqliteConnection.Open();

    return sqliteConnection;
}
