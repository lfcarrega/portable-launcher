#Requires AutoHotkey v2.0

class PortableLauncher {
    static Run(Config) {
        if (Config.HasOwnProp("RequireAdmin") && Config.RequireAdmin) {
            FullCmdline := DllCall("GetCommandLine", "str")
            if not (A_IsAdmin or RegExMatch(FullCmdline, " /restart(?!\S)")) {
                try {
                    if A_IsCompiled
                        Run '*RunAs "' A_ScriptFullPath '" /restart'
                    else
                        Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '" /restart'
                }
                ExitApp
            }
        }

        LockFile := A_ScriptDir "\.lock"
        DataDir := A_ScriptDir "\data"
        
        if !DirExist(DataDir)
            DirCreate(DataDir)

        if FileExist(LockFile) {
            this.CleanUp(Config)
            FileDelete(LockFile)
        } else {
            FileAppend("", LockFile)
            FileSetAttrib("^H", LockFile)
        }

        if FileExist(Config.ApplicationExe) {
            this.CreateLink(Config.DataDirs, 0)
            if (Config.HasOwnProp("RegistryStr") && Config.RegistryStr != "") {
                this.RegistryApply(Config.RegistryStr, Config.RegistryParams)
            }
            
            RunWait(Config.ApplicationExe, Config.ApplicationWorkingDir)
        }

        this.CleanUp(Config)
        if FileExist(LockFile)
            FileDelete(LockFile)
    }

    static CleanUp(Config) {
        if (Config.HasOwnProp("RegistryStr") && Config.RegistryStr != "") {
            this.RegistryApply(Config.RegistryStr, ["-", Config.RegistryParams[2]]) 
        }
        this.CreateLink(Config.DataDirs, 1)
    }

    static CreateLink(DataDirs, Revert := 0) {
        for AppDir in DataDirs {
            Local Original := StrSplit(AppDir, "|")[1]
            Local Portable := StrSplit(AppDir, "|")[2]
            SplitPath(Original,, &ParentDir)
            
            if Revert {
                if (DirExist(Original) && InStr(FileGetAttrib(Original), "L"))
                    DirDelete(Original)
                if DirExist(Original ".backup")
                    DirMove(Original ".backup", Original, 1)
                continue
            }
            
            DirCreate(ParentDir)
            if (DirExist(Original) && InStr(FileGetAttrib(Original), "L")) {
                DirDelete(Original)
            } else if DirExist(Original) {
                if !DirExist(Original ".backup")
                    DirMove(Original, Original ".backup", 1)
            }
            
            if !DirExist(Portable)
                DirCreate(Portable)

            Cmd := A_ComSpec ' /c mklink /J "' Original '" "' Portable '"'
            if (RunWait(Cmd,, "Hide") != 0)
                Throw Error("Failed to create symlink for: " Original, -1)
        }
    }

    static RegistryApply(RegistryStr, Params) {
        local RegFile := A_ScriptDir "\temp.reg"
        if FileExist(RegFile)
            FileDelete(RegFile)
        
        RegData := Format(RegistryStr, Params*)
        FileAppend(RegData, RegFile, "UTF-8")
        FileSetAttrib("+H", RegFile)
        RunWait("reg import " RegFile,, "Hide")
        if FileExist(RegFile)
            FileDelete(RegFile)
    }
}
