@echo off
setlocal

set VERSION=1.9
set PATCH=2
set JULIA_URL=https://julialang-s3.julialang.org/bin/winnt/x64/%VERSION%
set JULIA_EXE=julia-%VERSION%.%PATCH%-win64.exe

bitsadmin /transfer download-%JULIA_EXE% %JULIA_URL%/%JULIA_EXE% %CD%\%JULIA_EXE%
