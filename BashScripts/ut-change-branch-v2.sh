#!/bin/bash
# 1) chmod +x ut-change-branch.sh
# 2) ./ut-change-branch.sh BRANCH-NAME
# Check if the branch name is provided as an argument

# Check if the branch name is provided as an argument
if [ -z "$1" ]; then
    echo "Please provide the branch name as an argument"
    exit 1
else
    branch_name="$1"
fi

echo "Change Started to other branch"


# Change to the directory where your Git repositories are stored
cd /Users/macbook/Desktop/CF/Projects/Turkcell/Sardis/sardis-main-2/

# Loop through each directory in the current directory
for dir in */; do
    # Exclude the directory you don't want to change
    if [ "$dir" == "dirA/" ] || [ "$dir" == "dirB/" ]; then
        continue
    fi

    # Change into the repository directory
    cd "$dir"

    echo $dir

    # Checkout the desired branch
    output=$(git checkout "$branch_name" 2>&1)

   # Check if the output contains the pathspec error message
    if [[ $output == *"error: pathspec '$branch_name' did not match any file(s) known to git"* ]]; then
        echo "Error: $dir does not have branch $branch_name"
        git checkout -b $branch_name
    else
        echo "Success: $dir now on branch $branch_name"
    fi


	
    # Return to the parent directory
    cd ..
done

echo "Done"
