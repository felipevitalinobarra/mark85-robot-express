*** Settings ***
Documentation    Cenários de testes do cadastro de usuários

Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***

Deve poder cadastrar um novo usuário
    [Tags]    smoke
    
    ${user}    Create Dictionary    
    ...    name=Tony Stark
    ...    email=tonystark@mark85.com
    ...    password=pwd123

    Remove user from database    ${user}[email]

    Go to signup page
    Submit signup form    ${user}
    Notice should be      Boas vindas ao Mark85, o seu gerenciador de tarefas.

Não deve permitir o cadastro com email duplicado
    [Tags]    dup

    ${user_dup}    Create Dictionary    
    ...    name=Tony Stark
    ...    email=tonystark@mark85.com
    ...    password=pwd123
    
    Remove user from database    ${user_dup}[email]
    Insert user from database    ${user_dup}
    
    Go to signup page
    Submit signup form    ${user_dup}
    Notice should be      Oops! Já existe uma conta com o e-mail informado.