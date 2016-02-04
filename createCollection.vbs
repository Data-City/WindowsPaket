dim sh
set sh=WScript.CreateObject("WScript.shell")
sh.SendKeys "use admin"
WScript.Sleep 800
sh.SendKeys "{ENTER}"
sh.SendKeys "db.createUser{(}{{}user: +'mongoduser+', pwd: +'6cn7Hd8RGzrseqmB+', roles: {[}{{}role:+'readWrite+', db: +'local+'{}},{{}role: +'root+', db: +'admin+'{}},{{}role: +'readWrite+', db: +'production+'{}},{{}role: +'readWrite+', db: +'prelife+'{}},{{}role: +'readWrite+', db: +'admin+'{}},{{}role: +'userAdminAnyDatabase+', db: +'admin+'{}}{]}{}}{)}"
WScript.Sleep 1500
sh.SendKeys "{ENTER}"
sh.SendKeys "use einstellungen"
WScript.Sleep 1000
sh.SendKeys "{ENTER}"
sh.SendKeys "db.createCollection{(}+'ansichten+'{)}"
WScript.Sleep 1000
sh.SendKeys "{ENTER}"
sh.SendKeys "Die Collection wurde erzeugt und bitte schliessen diese Konsole zu"
WScript.Quit 