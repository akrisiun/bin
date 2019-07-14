@REM npm config set proxy http://192.168.2.106:5868
@REM npm config set https-proxy http://192.168.2.106:5868

:: Created by npm, please don't edit manually.
@ECHO OFF

SETLOCAL

SET "NODE_EXE=%~dp0\node.exe"
IF NOT EXIST "%NODE_EXE%" (
  SET "NODE_EXE=node"
)

SET "NPM_CLI_JS=%~dp0\node_modules\npm\bin\npm-cli.js"
FOR /F "delims=" %%F IN ('CALL "%NODE_EXE%" "%NPM_CLI_JS%" prefix -g') DO (
  SET "NPM_PREFIX_NPM_CLI_JS=%%F\node_modules\npm\bin\npm-cli.js"
)
IF EXIST "%NPM_PREFIX_NPM_CLI_JS%" (
  SET "NPM_CLI_JS=%NPM_PREFIX_NPM_CLI_JS%"
)

@REM SET http_proxy=http://192.168.2.106:5868

echo NPM: %NODE_EXE% %NPM_CLI_JS% %http_proxy%

"%NODE_EXE%" "%NPM_CLI_JS%" %*
