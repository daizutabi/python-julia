@echo off
setlocal

set ENV_NAME=daizu

(
  mamba update --name base conda mamba --yes --no-banner
  mamba create --name %ENV_NAME% --file pkg.txt --yes --no-banner
  mamba clean --all --yes --no-banner
)
