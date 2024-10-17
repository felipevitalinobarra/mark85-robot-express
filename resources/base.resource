*** Settings ***

Library     libs/database.py
Library     Browser
Library     JSONLibrary

Resource    env.resource

Resource    pages/components/Alert.resource
Resource    pages/components/Notice.resource
Resource    pages/components/Header.resource

Resource    pages/SignupPage.resource
Resource    pages/LoginPage.resource
Resource    pages/TaskCreatePage.resource

*** Keywords ***

Start Session
    New Browser    ${BROWSER}    headless=False
    New Page       ${BASE_URL}

Finish Session
    Take Screenshot    fullPage=True

# Helpers    
Get fixture
    [Arguments]    ${file_name}    ${scenario}

    ${data}     Load Json From File    
    ...         ${EXECDIR}/resources/fixtures/${file_name}.json
    ...         encoding=utf-8

    [RETURN]    ${data}[${scenario}]