*** Settings ***

Library     libs/database.py
Library     Browser

Resource    env.resource

Resource    pages/components/Alert.resource
Resource    pages/components/Notice.resource
Resource    pages/components/Header.resource

Resource    pages/SignupPage.resource
Resource    pages/LoginPage.resource

*** Keywords ***

Start Session
    New Browser    ${BROWSER}    headless=False
    New Page       ${BASE_URL}

Finish Session
    Take Screenshot    fullPage=True