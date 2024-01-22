@echo off
SET /P branchType="Enter the branch type (feature/release/hotfix): "
SET /P branchName="Enter the branch name: "

IF "%branchType%"=="feature" (
    git checkout develop
    git checkout -b "feature/%branchName%"
    echo Feature branch created: feature/%branchName%
) ELSE IF "%branchType%"=="release" (
    git checkout develop
    git checkout -b "release/%branchName%"
    echo Release branch created: release/%branchName%
) ELSE IF "%branchType%"=="hotfix" (
    git checkout master
    git checkout -b "hotfix/%branchName%"
    echo Hotfix branch created: hotfix/%branchName%
) ELSE (
    echo Invalid branch type.
)

pause
