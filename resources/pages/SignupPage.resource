*** Settings ***
Documentation    Elementos e ações da página de cadastro

Library    Browser

Resource    ../env.resource

*** Keywords ***
Go to signup page
    Go To    ${BASE_URL}/signup
    Wait For Elements State   css=h1 >> text=Faça seu cadastro   visible    5

Submit signup form
    [Arguments]    ${user}
    Fill Text    css=input[name=name]        ${user}[name]
    Fill Text    css=input[name=email]       ${user}[email]
    Fill Text    css=input[name=password]    ${user}[password]
    
    Click        css=button[type=submit] >> text=Cadastrar

Notice should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.notice p >> text=${expected_text}    visible    5

Alert should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.alert-error >> text=${expected_text}    visible    5