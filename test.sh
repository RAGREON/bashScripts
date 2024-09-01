function get_git_raw() {
    local username=$1
    local repo_name=$2
    local branch_name=$3
    local file_path=$4

    local raw_file_url="https://raw.githubusercontent.com/$username/$repo_name/$branch_name/$file_path"

    echo $raw_file_url
    curl -s $raw_file_url
}

get_git_raw $1 $2 $3 $4