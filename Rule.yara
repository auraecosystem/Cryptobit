rule cryptbot {

    strings:
        $s1 = "UID:"
        $s2 = "UserName:"
        $s3 = "ComputerName:"
        $s4 = "DateTime:"
        $s5 = "UserAgent:"
        $s6 = "Keyboard Languages:"
        $s7 = "Display Resolution:"
        $s8 = "CPU:"
        $s9 = "RAM:"
        $s10 = "GPU:"
        $s11 = "isGodMod: yes"
        $s12 = "isGodMod: no"
        $s13 = "isAdmin: yes"
        $s14 = "isAdmin: no"
        $s15 = "Installed software:"
    condition:
        all of them
}
