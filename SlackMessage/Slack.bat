::SlackMessaging

:: curl must be installed
@echo off
setlocal

set /p "SLACKUSER=Enter your slack name: (eg. John Smith, Maria) "

echo Sending Slack message to %SLACKUSER%

if /i "%SLACKUSER%" == "Rita" (
    CALL:sendMessageFunction https://hooks.slack.com/services/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
)
if /i "%SLACKUSER%" == "Ria C" (
    CALL:sendMessageFunction https://hooks.slack.com/services/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
)

pause

:: function

:sendMessageFunction
curl -X POST -H "Content-type: application/json" --data "{'text':'\t*Success* :white_check_mark:\nYour Housekeeping script is finished!\n----------------------------------------------'}" %~1
EXIT /B 0
