@echo off
setlocal enabledelayedexpansion

:: 从配置文件中读取配置
set CONFIG_FILE=lfs-test-server.conf
for /f "tokens=1,2 delims==" %%A in ('findstr /r "LFS_LISTEN LFS_HOST LFS_METADB LFS_CONTENTPATH LFS_ADMINUSER LFS_ADMINPASS LFS_CERT LFS_KEY LFS_SCHEME LFS_USETUS LFS_TUSHOST LFS_PUBLIC" "%CONFIG_FILE%"') do (
    set "key=%%~A"
    set "value=%%~B"
    set "!key!=!value!"
)

:: 清理管理员凭据
if not "%1"=="--admin" (
    set "LFS_ADMINUSER="
    set "LFS_ADMINPASS="
)

:: 启动服务
start "LFS Server" lfs-test-server.exe

endlocal