*** Settings ***

Library    libs/database.py
Library    Browser
Resource    env.resource

*** Keywords ***

Start Session
    New Browser    ${BROWSER}    headless=False
    New Page       ${URL}

Finish Session
    Take Screenshot    fullPage=True