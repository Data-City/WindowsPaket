dim sh
set sh=WScript.CreateObject("WScript.shell")
sh.SendKeys "use admin"
WScript.Sleep 800
sh.SendKeys "{ENTER}"
sh.SendKeys "db.dropDatabase{(}{)}"
WScript.Sleep 800
sh.SendKeys "{ENTER}"
sh.SendKeys "use einstellungen"
WScript.Sleep 800
sh.SendKeys "{ENTER}"
sh.SendKeys "db.dropDatabase{(}{)}"
WScript.Sleep 800
sh.SendKeys "{ENTER}"
sh.SendKeys "use prelife"
WScript.Sleep 800
sh.SendKeys "{ENTER}"
sh.SendKeys "db.dropDatabase{(}{)}"
WScript.Sleep 800
sh.SendKeys "{ENTER}"
WScript.Quit 
