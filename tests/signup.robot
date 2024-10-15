*** Settings ***
Documentation    Cenários de testes do cadastro de usuários

Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***

Deve poder cadastrar um novo usuário

    ${user}    Create Dictionary    
    ...    name=Tony Stark
    ...    email=tonystark@mark85.com
    ...    password=pwd123

    Remove user from database    ${user}[email]

    Go To    http://localhost:3000/signup

    Wait For Elements State   css=h1 >> text=Faça seu cadastro   visible    5

    Fill Text    id=name        ${user}[name]
    Fill Text    id=email       ${user}[email]
    Fill Text    id=password    ${user}[password]
    
    Click        id=buttonSignup

    Wait For Elements State    css=.notice p >> text=Boas vindas ao Mark85, o seu gerenciador de tarefas.    visible    5

Não deve permitir o cadastro com email duplicado
    [Tags]    dup

    ${user_dup}    Create Dictionary    
    ...    name=Tony Stark
    ...    email=tonystark@mark85.com
    ...    password=pwd123
    
    Remove user from database    ${user_dup}[email]
    Insert user from database    ${user_dup}
    
    Go To    http://localhost:3000/signup

    Wait For Elements State   css=h1 >> text=Faça seu cadastro   visible    5
    
    Fill Text    id=name        ${user_dup}[name]
    Fill Text    id=email       ${user_dup}[email]
    Fill Text    id=password    ${user_dup}[password]
    
    Click        id=buttonSignup

    Wait For Elements State    css=.notice p >> text=Oops! Já existe uma conta com o e-mail informado.    visible    5