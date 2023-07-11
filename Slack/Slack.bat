::SlackMessaging

:: curl must be installed
@echo off
setlocal

set /p "SLACKUSER=Enter your slack name: (eg. John Smith, Maria) "

echo Sending Slack message to %SLACKUSER%

if /i "%SLACKUSER%" == "Rita" (
    CALL:sendMessageFunction WebHookLinkHere
)
if /i "%SLACKUSER%" == "Ria C" (
    CALL:sendMessageFunction WebHookLinkHere

pause

:: function

:sendMessageFunction
curl -X POST -H "Content-type: application/json" --data "{'text':'\t*Success* :white_check_mark:\nYour Housekeeping script is finished!\n----------------------------------------------'}" %~1
EXIT /B 0
