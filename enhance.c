# In x32dbg, navigate to 0x00475960 and extract bytes
rule CryptBot_v3 {
    meta:
        author = ""
        description = "Detects CryptBot v3 infostealer based on RC4 key, C2 strings, and configuration artifacts"
        reference = "https://0xw43l.com/posts/CryptBot-0x03/"
        date = "2025-08-30"

    strings:
        // RC4 Key
        $key = "LkgwUi" ascii fullword
        
        // C2 Domains and Paths
        $c2_1 = "tventyvx20pn.top" ascii
        $c2_2 = "analforeverlovyu.top" ascii
        $c2_3 = "/index.php" ascii
        $c2_4 = "/gate.php" ascii
        $c2_5 = "/zip.php" ascii
        $c2_6 = "/v1/upload.php" ascii
        $path_1 = "\\nuSONyiIRP" ascii
        $path_2 = "\\ServiceData" ascii
        $path_3 = "\\ServiceData\\Clip.au3" ascii
        $path_4 = "\\ServiceData\\Clip.exe" ascii
        
        // Persistence Command
        $persist = "/c schtasks /create /tn \\Service\\Data /tr" ascii
        
        // Stealer Strings
        $s1 = "UID:" ascii
        $s2 = "UserName:" ascii
        $s3 = "ComputerName:" ascii
        $s4 = "DateTime:" ascii
        $s5 = "UserAgent:" ascii
        $s6 = "Keyboard Languages:" ascii
        $s7 = "Display Resolution:" ascii
        $s8 = "CPU:" ascii
        $s9 = "RAM:" ascii
        $s10 = "GPU:" ascii
        $s11 = "Installed Apps:" ascii

    condition:
        $key and (2 of ($c2_*)) and (2 of ($path_*)) and $persist and 6 of ($s*)
}
