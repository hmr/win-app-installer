@echo off
setlocal enabledelayedexpansion

set COMMENT=#
rem 「token」を使って二列目まで読み込むことを宣言
for /f "tokens=1,2" %%a in (list.chocolatey.txt) do (
  if not %%a==%COMMENT% (
    set PACKAGES=!PACKAGES! %%a
  )
)

echo Installing packages below:
echo %PACKAGES%
echo --------------------------------------------------
choco install %PACKAGES% --ignore-checksum 

endlocal
