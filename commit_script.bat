@echo off
setlocal enabledelayedexpansion

REM Prompt for commit type
set /p commit_type="Commit Type (build, ci, docs, feat, fix, perf, refactor, test): "
if not "%commit_type%"=="" (
  REM Check if the commit type is valid
  set valid_commit_types=build ci docs feat fix perf refactor test
  if "!valid_commit_types: %commit_type%=!"=="%valid_commit_types%" (
    echo Invalid commit type. Please choose from the valid types.
    exit /b 1
  )
) else (
  echo Commit type cannot be empty.
  exit /b 1
)

REM Prompt for commit scope
set /p commit_scope="Scope: "

REM Prompt for commit summary
set /p commit_summary="Short Summary: "

REM Prompt for breaking change information
set /p breaking_change="Breaking Change (leave empty if none): "
set /p breaking_change_desc="Breaking Change Description (leave empty if none): "
set /p issue_number="Issue Number (leave empty if none): "

REM Generate the commit message
set commit_message=!commit_type!(!commit_scope!): !commit_summary!

REM Add breaking change information if provided
if not "!breaking_change!"=="" (
  set commit_message=!commit_message!
  set commit_message=!commit_message!BREAKING CHANGE: !breaking_change!
  if not "!breaking_change_desc!"=="" (
    set commit_message=!commit_message!
    set commit_message=!commit_message!!breaking_change_desc!
  )
)

REM Add issue number if provided
if not "!issue_number!"=="" (
  set commit_message=!commit_message!
  set commit_message=!commit_message!
  set commit_message=!commit_message!Fixes #!issue_number!
)

REM Output the final commit message
echo !commit_message!

REM Perform the actual git commit
git commit -m "!commit_message!"

endlocal
