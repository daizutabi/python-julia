@echo off
setlocal

set MAMBA_URL=https://github.com/conda-forge/miniforge/releases/latest/download
set MAMBA_EXE=Mambaforge-Windows-x86_64.exe

bitsadmin /transfer download_mamba %MAMBA_URL%/%MAMBA_EXE% %CD%\%MAMBA_EXE%
