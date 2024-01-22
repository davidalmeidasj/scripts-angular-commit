#!/bin/bash

echo "Enter the branch type (feature/release/hotfix):"
read branchType

echo "Enter the branch name:"
read branchName

case $branchType in
    feature)
        git checkout develop
        git checkout -b "feature/$branchName"
        echo "Feature branch created: feature/$branchName"
        ;;
    release)
        git checkout develop
        git checkout -b "release/$branchName"
        echo "Release branch created: release/$branchName"
        ;;
    hotfix)
        git checkout master
        git checkout -b "hotfix/$branchName"
        echo "Hotfix branch created: hotfix/$branchName"
        ;;
    *)
        echo "Invalid branch type."
        ;;
esac
