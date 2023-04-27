
<h1 align="center">
  <br>






                                             
     ^4________  ___  ___     ___    ___ ________          
    ^4|\   __  \|\  \|\  \   |\  \  /  /|\   __  \        
    ^4\ \  \|\  \ \  \\\  \  \ \  \/  / | \  \|\  \       
    ^4 \ \   _  _\ \  \\\  \  \ \    / / \ \  \\\  \      
    ^4  \ \  \\  \\ \  \\\  \  /     \/   \ \  \\\  \     
    ^4   \ \__\\ _\\ \_______\/  /\   \    \ \_______\    
    ^4    \|__|\|__|\|_______/__/ /\ __\    \|_______|     

                                   
                                  
                                  
                                  


           
                           
  <br>
  Ruxo-Admin-Menu-ESX
  <br>
</h1>

<h4 align="center">A FiveM Free Admin Menu ESX
.</h4>

<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>


## Key Features

* God Mode.
* Invisibility.
* Vehicle List.
  - Open Vehicle List in game with vehicle spawn.
* Clean area.
  - Vehicles
  - Peds
  - Props
* Player Group check for permission.
  - Each button with custom permissions.
* Admin Baypass from Config.
  - You can choose to check admin permission with group or from config.
* Vehicle Clean.
* Job List from Database.
  - Set job and grade from the list (Only job 1).
* Resmon 0.00.
  - Ban for Ip, steam, discord, fivem, xbox, game license.
* (!) lang ITA only for now
* ESX NUI


![Cattura](https://user-images.githubusercontent.com/113531412/234995532-c8b73fae-0110-40b5-9d8e-0d529b271969.PNG)

## How To Use

Insert the menu inside the RESOURCE server folder, and add ruxo_menu on the server config file!

If your database have different job table you can change the SQL query inside the server.lua file
```lua

ESX.RegisterServerCallback('RXO:Job', function(source, cb)
	
	local job = MySQL.Sync.fetchAll('SELECT * FROM jobs') 

	cb(job)
end)

ESX.RegisterServerCallback('RXO:Job_grade', function(source, cb)
	
	local jobGrade = MySQL.Sync.fetchAll('SELECT * FROM job_grades') 

	cb(jobGrade)
end)

```
![Cattura3](https://user-images.githubusercontent.com/113531412/234995551-f4f82c4d-d07e-4765-bdd6-f144addbfdb3.PNG)

You MUST add your discord and steam discord id in the config server file, for admin check if you set AdminControl = true.

with AdminControl = false you disable only the check for the config list, but the menu will check the group (mod,admin,superadmin.cofounder,founder) of the player anyway.

```lua
AdminControl = true,

	BypassAdmin = {
		"steam:110789014871fc9f", 
		"discord:849279969461577739",
		--this is an example
	},
```

This list inside the config is for base GTA vehicles, you can edit it:

```lua
ListedVehicle = {
		"adder",
		"Airbus",
		"Airtug",
		...	 
    },
```
![Cattura1](https://user-images.githubusercontent.com/113531412/234995542-edbbd444-60cd-4784-addc-eccaf3dfc476.PNG)

This list inside the config is for custom GTA vehicles, you can edit it:

```lua
ModVehicle = {
		'370z',
		"rs7",
		'a8audi',
		'x5e53',
		'boss429',
		's63w222',
		'teslax',
		...
	},
			 
```

> **Note**
> You need also to edit config files.


## Credits

Russo Giovanni M.

BostonG

## License

MIT

---

