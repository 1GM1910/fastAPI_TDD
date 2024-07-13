# run.ps1

param (
    [string]$task
)

function Start-FastAPI {
    Write-Host "Starting FastAPI with uvicorn..."
    Start-Process "uvicorn" -ArgumentList "store.main:app --reload"
}

function Install-Precommit {
    Write-Host "Installing pre-commit hooks..."
    poetry run pre-commit install
}

function Start-pytest{
    Write-Host "Starting pytest..."
    poetry run pytest
}

switch ($task) {
    "start" { Start-FastAPI }
    "install" { Install-Precommit }
    "pytest" {Start-pytest}
    default { Write-Host "Usage: .\run.ps1 -task <start|install|pytest>" }
}
