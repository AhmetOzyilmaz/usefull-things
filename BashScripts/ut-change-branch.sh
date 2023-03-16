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
cd CHANGE_HERE_PARENT_DIR

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
    git checkout $branch_name

	echo " "
	
    # Return to the parent directory
    cd ..
done

echo "Done"
