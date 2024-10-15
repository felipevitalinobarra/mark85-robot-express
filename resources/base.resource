*** Settings ***

Library     libs/database.py
Library     Browser
Resource    env.resource
Resource    ../resources/pages/SignupPage.robot

*** Keywords ***

Start Session
    New Browser    ${BROWSER}    headless=False
    New Page       ${BASE_URL}

Finish Session
    Take Screenshot    fullPage=True