*** Settings ***
Documentation        Cenários de autenticação do usuário

Resource    ../resources/base.resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***

Deve poder logar com um usuário pré-cadastrado

    ${user}    Create Dictionary
    ...    name=Tony Stark
    ...    email=tonystark@mark85.com
    ...    password=pwd123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Submit login form    ${user}
    User should be logged in    ${user}[name]