*** Settings ***
Documentation        Cenários de autenticação do usuário

Resource    ../resources/base.resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***

Deve poder logar com um usuário pré-cadastrado

    ${user}    Create Dictionary
    ...    name=Felipe Barra
    ...    email=felipe@gmail.com
    ...    password=pwd123

    Submit login form    ${user}
    User should be logged in    ${user}[name]