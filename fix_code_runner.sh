username=$(whoami)

path="/c/Users/$username/AppData/Roaming/Code/User/settings.json"

cat $path

curl -s https://raw.githubusercontent.com/RAGREON/bashScripts/main/settings.json > $path

clear

echo "updated $path successfully"