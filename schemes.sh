#run this script :$ bash -c  "$(wget -qO- https://git.io/JyBsk)"
win_userprofile="$(cmd.exe /c "<nul set /p=%UserProfile%" 2>/dev/null)"
win_userprofile_dir="${win_userprofile#*:}"
win_home=${win_userprofile_dir/\\/\/}
win_home=${win_home/\\/\/}
cd "/mnt/c/$win_home"
cd AppData/Local/Packages
cd Microsoft.WindowsTerminal*
cd LocalState
echo $win_home


add_schemes (){
cat << EOF > ~/.add_schemes.py
import urllib, json ,ast ,urllib.request
path = "$pwd"
#Reading setting.json ---------------------------------------------------------
myfile = open (path+'/settings.json', "r")
mystring = myfile.read()
parts = mystring.split('"schemes":')
first = parts[0]
second = parts[1].split("[")
third = second[1].split("]")
myschems = '{"schemes":[' + third[0] + ']}'
myschems_json = eval(myschems)
present_schemes = set()
for sch in myschems_json['schemes']:
	present_schemes.add(sch['name'])
#print(present_schemes)
#Reading Schemes from github :https://github.com/mbadolato/iTerm2-Color-Schemes
jsons=[
"AdventureTime",
"3024 Night",
"Argonaut",
"Belafonte Night",
"BlueBerryPie",
"BlueDolphin",
"BlulocoDark",
"Borland",
"Builtin Solarized Dark",
"Builtin Tango Light",
"Cobalt2",
"CrayonPonyFish",
"Desert",
"Django",
"FishTank",
"Floraverse",
"FunForrest",
"Github",
"GitHub Dark",
"Grass",
"Gruvbox Light",
"HaX0R_R3D",
"HaX0R_GR33N",
"HaX0R_BLUE",
"Jackie Brown",
"Laser",
"Mathias",
"Ocean",
"Paraiso Dark",
"Pro",
"Pro Light",
"Red Alert",
"Solarized Dark - Patched",
"Spacedust",
"Spiderman",
"Tomorrow Night Burns",
"Tango Half Adapted",
"Ubuntu",
"Unikitty",
"Zenburn"
]
schemes=[]
i = 1
for j in jsons:
	i += 1
	myurl = "https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/windowsterminal/"+j+".json"
	myurl = myurl.replace(" ","%20")
	with urllib.request.urlopen(myurl) as url:
		data = json.loads(url.read().decode())
	r=str(data)
		
		
	if  r[:3] == "404":
		print('\x1b[0;{};{}m'.format(i%6+31,40) +"--------->  " + j + "Scheme not found !!!"'\x1b[0m')
	else:
		print('\x1b[0;{};{}m'.format(i%6+31,40) +"   downloading ....    "+  j + '\x1b[0m')
		schemes.append(data)
#Creating new setting.json ----------------------------------------------------
add = 0
not_add = 0
for scheme in schemes:
	if scheme['name'] not in present_schemes:
		add += 1
		myschems_json['schemes'].append(scheme)
	else:
		not_add += 1
near_to_last = str(myschems_json)[1 : -1]
near_to_last = near_to_last.replace(",", ",\n    ")
near_to_last = near_to_last.replace("{", "{\n    ")
near_to_last = near_to_last.replace("}", "}\n    ")
near_to_last = near_to_last.replace("[", "[\n    ")
near_to_last = near_to_last.replace("]", "]\n    ")
near_to_last = near_to_last.replace("},\n", "},\n        ")
near_to_last = near_to_last.replace("'", '"')
final_setting = first + near_to_last + "\n\n}"
#Writing new setting.json to the defult path-----------------------------------
with open(path + '/settings.json' ,'r+') as myfinalsetting:
    data = myfinalsetting.read()
    myfinalsetting.seek(0)
    myfinalsetting.write(final_setting)
    myfinalsetting.truncate()
print("!----------------------------------------------------------------!")
print("!               Schemes Installation Completed                    ")
print("!             {} Schemes was on your settings and                 ".format(not_add))
print("!           another {} Schemes were added by this code            ".format(add))
print("!----------------------------------------------------------------!")
EOF
python3 ~/.add_schemes.py
rm -rf ~/.add_schemes.py
}



if [[ ! -f settings.json ]]
then
    /bin/echo -e "\e[91m  !----------------------------------------------------------------!\e[0m"
    /bin/echo -e "\e[91m  !        settings.json does not exist on your filesystem!        !\e[0m" 
    /bin/echo -e "\e[91m  !  Please check to see if you have Windows Terminal installed!?  !\e[0m"
    /bin/echo -e "\e[91m  !----------------------------------------------------------------!\e[0m"
else
    /bin/echo -e "\e[32m  !----------------------------------------------------------------!\e[0m"
    /bin/echo -e "\e[32m  !           settings.json exist on your filesystem!              !\e[0m" 
    /bin/echo -e "\e[32m  !----------------------------------------------------------------!\e[0m"
	pwd=$(pwd)
	add_schemes
fi
