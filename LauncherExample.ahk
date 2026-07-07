#Requires AutoHotkey v2.0
#SingleInstance Ignore

#Include Lib\PortableLauncher.ahk

; EXAMPLE CONFIGURATION

Config := {
	RequireAdmin: 1,
	ApplicationExe: A_ScriptDir "\installed_game\Game\Bin\TS3W.exe",
	ApplicationWorkingDir: A_ScriptDir "\installed_game\Game\Bin", 
	DataDirs: [
		EnvGet("USERPROFILE") "\Documents\Electronic Arts\The Sims 3" "|" A_ScriptDir "\data\Documents\Electronic Arts\The Sims 3"
	],
	RegistryParams: ["", StrReplace(A_ScriptDir "\installed_game", "\", "\\")],
	RegistryStr: "
	(	
	Windows Registry Editor Version 5.00

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims 3]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims 3\Launcher]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims 3\Launcher\Settings]
	"FirstRun"=dword:00000001
	"CCDisabled"=dword:00000000
	"PageIndex"=dword:00000000
	"DateTimeOffline"=dword:00000000
	"SoftwareUpdateMode"=dword:00000001
	"DiscAuthDrive"=""

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3\ergc]
	@="F8HH-YBIW-TGIR-BLRE-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 70s 80s & 90s Stuff]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 70s 80s & 90s Stuff\ergc]
	@="17QG-UL0H-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Ambitions]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Ambitions\ergc]
	@="F9PP-JAIA-TGIR-RLRE-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Diesel Stuff]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Diesel Stuff\ergc]
	@="T4PX-8N0J-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Fast Lane Stuff]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Fast Lane Stuff\ergc]
	@="F6P7-YUIR-TGIR-BLRE-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Generations]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Generations\ergc]
	@="I4VV-MT0S-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 High-End Loft Stuff]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 High-End Loft Stuff\ergc]
	@="FGMD-HRI3-TGIR-VLRE-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Into the Future]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Into the Future\ergc]
	@="W79R-4D0T-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Island Paradise]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Island Paradise\ergc]
	@="EU4C-6R0E-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Katy Perry Sweet Treats]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Katy Perry Sweet Treats\ergc]
	@="7UZZ-C31D-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Late Night]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Late Night\ergc]
	@="F2LU-NAI4-TGIR-3LRE-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Master Suite Stuff]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Master Suite Stuff\ergc]
	@="FFVM-ZF1J-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Movie Stuff]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Movie Stuff\ergc]
	@="ALXX-2S09-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Outdoor Living Stuff]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Outdoor Living Stuff\ergc]
	@="OP7F-2A0D-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Pets]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Pets\ergc]
	@="583B-UM0W-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Seasons]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Seasons\ergc]
	@="03D5-D803-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Showtime]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Showtime\ergc]
	@="FLR9-TZ1Q-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Supernatural]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Supernatural\ergc]
	@="UTHH-TE0G-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Town Life Stuff]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 Town Life Stuff\ergc]
	@="1N22-WU3J-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 University Life]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 University Life\ergc]
	@="8C6N-DM0L-0ANA-DIUS-PACK"

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 World Adventures]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims(Steam)\The Sims 3 World Adventures\ergc]
	@="FP99-LAIJ-TGIR-MLRE-PACK"

	Windows Registry Editor Version 5.00

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)]

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3]
	"locale"="en-US"
	"country"="US"
	"displayname"="The Sims 3"
	"exepath"="{2}\\Game\\Bin\\TS3.exe"
	"install dir"="{2}"
	"productid"=dword:000003e9
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 70s 80s & 90s Stuff]
	"locale"="en-US"
	"contentid"="sims3_Sp08_sku7"
	"country"="US"
	"displayname"="The Sims 3 70s, 80s, & 90s Stuff"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 70s 80s & 90s Stuff\\ergc"
	"exepath"="{2}\\SP8\\Game\\Bin\\TS3SP08.exe"
	"install dir"="{2}\\SP8"
	"productid"=dword:00000011
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Ambitions]
	"locale"="en-US"
	"contentid"="sims3_ep02_sku7"
	"country"="US"
	"displayname"="The Sims 3 Ambitions"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Ambitions\\ergc"
	"exepath"="{2}\\EP2\\Game\\Bin\\TS3EP02.exe"
	"install dir"="{2}\\EP2"
	"productid"=dword:00000004
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Diesel Stuff]
	"locale"="en-US"
	"contentid"="sims3_sp07_sku7"
	"country"="US"
	"displayname"="The Sims 3 Diesel Stuff"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Diesel Stuff\\ergc"
	"exepath"="{2}\\SP7\\Game\\Bin\\TS3SP07.exe"
	"install dir"="{2}\\SP7"
	"productid"=dword:0000000e
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Fast Lane Stuff]
	"locale"="en-US"
	"contentid"="sims3_sp02_sku7"
	"country"="US"
	"displayname"="The Sims 3 Fast Lane Stuff"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Fast Lane Stuff\\ergc"
	"exepath"="{2}\\SP2\\Game\\Bin\\TS3SP02.exe"
	"install dir"="{2}\\SP2"
	"productid"=dword:00000005
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Generations]
	"locale"="en-US"
	"contentid"="sims3_ep04_dd"
	"country"="US"
	"displayname"="The Sims 3 Generations"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Generations\\ergc"
	"exepath"="{2}\\EP4\\Game\\Bin\\TS3EP04.exe"
	"install dir"="{2}\\EP4"
	"productid"=dword:00000008
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 High End Loft Stuff]
	"locale"="en-US"
	"contentid"="sims3_sp01_sku7"
	"country"="US"
	"displayname"="The Sims 3 High End Loft Stuff"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 High-End Loft Stuff\\ergc"
	"exepath"="{2}\\SP1\\Game\\Bin\\TS3SP01.exe"
	"install dir"="{2}\\SP1"
	"productid"=dword:00000003
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Into the Future]
	"locale"="en-US"
	"contentid"="sims3_ep11_sku7"
	"country"="US"
	"displayname"="The Sims 3 Into the Future"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Into the Future\\ergc"
	"exepath"="{2}\\EP11\\Game\\Bin\\TS3EP11.exe"
	"install dir"="{2}\\EP11"
	"productid"=dword:00000015
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Island Paradise]
	"locale"="en-US"
	"contentid"="sims3_Ep10_sku7"
	"country"="US"
	"displayname"="The Sims 3 Island Paradise"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Island Paradise\\ergc"
	"exepath"="{2}\\EP10\\Game\\Bin\\TS3EP10.exe"
	"install dir"="{2}\\EP10"
	"productid"=dword:00000013
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Katy Perry Sweet Treats]
	"locale"="en-US"
	"contentid"="sims3_sp06_sku7"
	"country"="US"
	"displayname"="The Sims 3 Katy Perry's Sweet Treats"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Katy Perry Sweet Treats\\ergc"
	"exepath"="{2}\\SP6\\Game\\Bin\\TS3SP06.exe"
	"install dir"="{2}\\SP6"
	"productid"=dword:0000000d
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Late Night]
	"locale"="en-US"
	"contentid"="sims3_ep03_sku7"
	"country"="US"
	"displayname"="The Sims 3 Late Night"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Late Night\\ergc"
	"exepath"="{2}\\EP3\\Game\\Bin\\TS3EP03.exe"
	"install dir"="{2}\\EP3"
	"productid"=dword:00000006
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Master Suite Stuff]
	"locale"="en-US"
	"contentid"="sims3_sp05_dd"
	"country"="US"
	"displayname"="The Sims 3 Master Suite Stuff"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Master Suite Stuff\\ergc"
	"exepath"="{2}\\SP5\\Game\\Bin\\TS3SP05.exe"
	"install dir"="{2}\\SP5"
	"productid"=dword:0000000b
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Movie Stuff]
	"locale"="en-US"
	"contentid"="sims3_sp09_sku7"
	"country"="US"
	"displayname"="The Sims 3 Movie Stuff"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Movie Stuff\\ergc"
	"exepath"="{2}\\SP9\\Game\\Bin\\TS3SP09.exe"
	"install dir"="{2}\\SP9"
	"productid"=dword:00000014
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Outdoor Living Stuff]
	"locale"="en-US"
	"contentid"="sims3_sp03_dd"
	"country"="US"
	"displayname"="The Sims 3 Outdoor Living Stuff"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Outdoor Living Stuff\\ergc"
	"exepath"="{2}\\SP3\\Game\\Bin\\TS3SP03.exe"
	"install dir"="{2}\\SP3"
	"productid"=dword:00000007
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Pets]
	"locale"="en-US"
	"contentid"="sims3_ep05_dd"
	"country"="US"
	"displayname"="The Sims 3 Pets"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Pets\\ergc"
	"exepath"="{2}\\EP5\\Game\\Bin\\TS3EP05.exe"
	"install dir"="{2}\\EP5"
	"productid"=dword:0000000a
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Seasons]
	"locale"="en-US"
	"contentid"="sims3_ep08_sku7"
	"country"="US"
	"displayname"="The Sims 3 Seasons"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Seasons\\ergc"
	"exepath"="{2}\\EP8\\Game\\Bin\\TS3EP08.exe"
	"install dir"="{2}\\EP8"
	"productid"=dword:00000010
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Showtime]
	"locale"="en-US"
	"contentid"="sims3_ep06_dd"
	"country"="US"
	"displayname"="The Sims 3 Showtime"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Showtime\\ergc"
	"exepath"="{2}\\EP6\\Game\\Bin\\TS3EP06.exe"
	"install dir"="{2}\\EP6"
	"productid"=dword:0000000c
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Supernatural]
	"locale"="en-US"
	"contentid"="sims3_ep07_sku7"
	"country"="US"
	"displayname"="The Sims 3 Supernatural"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Supernatural\\ergc"
	"exepath"="{2}\\EP7\\Game\\Bin\\TS3EP07.exe"
	"install dir"="{2}\\EP7"
	"productid"=dword:0000000f
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 Town Life Stuff]
	"locale"="en-US"
	"contentid"="sims3_sp04_dd"
	"country"="US"
	"displayname"="The Sims 3 Town Life Stuff"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 Town Life Stuff\\ergc"
	"exepath"="{2}\\SP4\\Game\\Bin\\TS3SP04.exe"
	"install dir"="{2}\\SP4"
	"productid"=dword:00000009
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 University Life]
	"locale"="en-US"
	"contentid"="sims3_ep09_sku7"
	"country"="US"
	"displayname"="The Sims 3 University Life"
	"ergcregpath"="Electronic Arts\\Sims(Steam)\\The Sims 3 University Life\\ergc"
	"exepath"="{2}\\EP9\\Game\\Bin\\TS3EP09.exe"
	"install dir"="{2}\\EP9"
	"productid"=dword:00000012
	"sku"=dword:00000007
	"telemetry"=dword:00000000

	[{1}HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sims(Steam)\The Sims 3 World Adventures]
	"locale"="en-US"
	"country"="US"
	"displayname"="The Sims 3 World Adventures"
	"exepath"="{2}\\EP1\\Game\\Bin\\TS3EP01.exe"
	"install dir"="{2}\\EP1"
	"productid"=dword:00000002
	"sku"=dword:00000007
	"telemetry"=dword:00000000
	)"
}
PortableLauncher.Run(Config)
