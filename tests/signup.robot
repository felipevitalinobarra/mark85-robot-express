*** Settings ***
Documentation    Cenários de testes do cadastro de usuários

Library     FakerLibrary
Resource    ../resources/base.resource

*** Test Cases ***

Deve poder cadastrar um novo usuário

    ${name}         FakerLibrary.Name
    ${email}        FakerLibrary.Free Email
    ${password}     Set Variable    pwd123


    Start Session

    Go To    http://localhost:3000/signup

    Wait For Elements State   css=h1 >> text=Faça seu cadastro   visible    5

    Fill Text    id=name        ${name}
    Fill Text    id=email       ${email}
    Fill Text    id=password    ${password}
    
    Click        id=buttonSignup

    Wait For Elements State    css=.notice p >> text=Boas vindas ao Mark85, o seu gerenciador de tarefas.    visible    5

    Finish Session