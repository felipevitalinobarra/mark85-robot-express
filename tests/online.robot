*** Settings ***
Documentation    Online

Resource    ../resources/base.resource

*** Test Cases ***
Webapp deve estar online
    Start Session
    
    Get Title      equal    Mark85 by QAx
    Wait For Elements State   css=h1 >> text=Faça seu login   visible    5

    Finish Session