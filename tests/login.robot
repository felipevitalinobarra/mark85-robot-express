*** Settings ***
Documentation        Cenários de autenticação do usuário

Library     Collections
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

Não deve logar com senha inválida

    ${user}    Create Dictionary
    ...    name=Steve Rogers
    ...    email=steve@mark85.com
    ...    password=123456

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Set To Dictionary    ${user}    password=123pwd

    Submit login form    ${user}

    Notice should be     Ocorreu um erro ao fazer login, verifique suas credenciais.