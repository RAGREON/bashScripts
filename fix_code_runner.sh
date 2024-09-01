username=$(whoami)

path="/c/Users/$username/AppData/Roaming/Code/User"

curl -s https://raw.githubusercontent.com/RAGREON/bashScripts/main/settings.json > "$path/settings.json"
curl -s https://raw.githubusercontent.com/RAGREON/bashScripts/main/vs_code_code_runner_key_mapping > "/bin/vs_code_code_runner_key_mapping"

echo "updated $path successfully"