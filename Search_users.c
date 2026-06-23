public static List<string> FindChromeProfiles()
{
    string localAppData = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
    string chromeDirectory = localAppData + @"\Google\Chrome\User Data";

    List<string> profileDirectories = new List<string>();

    if (Directory.Exists(chromeDirectory))
    {
        //Add default profile location once existence of chrome directory is confirmed
        profileDirectories.Add(chromeDirectory + "\\Default");
        foreach (string directory in Directory.GetDirectories(chromeDirectory))
        {
            if (directory.Contains("Profile "))
            {
                profileDirectories.Add(directory);

            }
        }
    }

    return profileDirectories;
}
