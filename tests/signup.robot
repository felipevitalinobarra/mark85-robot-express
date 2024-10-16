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

    ${user}    Create Dictionary    
    ...    name=Tony Stark
    ...    email=tonystark@mark85.com
    ...    password=pwd123
    
    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    
    Go to signup page
    Submit signup form    ${user}
    Notice should be      Oops! Já existe uma conta com o e-mail informado.

Campos obrigatórios
    [Tags]    required

    ${user}    Create Dictionary    
    ...    name=${EMPTY}
    ...    email=${EMPTY}
    ...    password=${EMPTY}

    Go to signup page
    Submit signup form    ${user}
    Alert should be    Informe seu nome completo
    Alert should be    Informe seu e-email
    Alert should be    Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com email incorreto
    [Tags]    inv_email

    ${invalid_emails}    Create List
    ...    emailgmail.com
    ...    email@@gmail.com
    ...    email@.com
    ...    email@gmailcom
    ...    email@gmail.
    #[BUG] ...    email!@gmail.com
    ...    email()@gmail.com
    ...    email@domain$%.com
    ...    email@ gmail.com
    ...    email@

    FOR    ${email}    IN    @{invalid_emails}
           ${user}    Create Dictionary    
           ...    name=Felipe Barra
           ...    email=${email}
           ...    password=pwd123

           Go to signup page
           Submit signup form    ${user}
           Alert should be    Digite um e-mail válido
    END

Não deve cadastrar com senha inferior a 6 dígitos
    [Tags]    short_pass

    ${short_pass}    Create List
    ...    1
    ...    12
    ...    123
    ...    1234
    ...    12345

    FOR    ${password}   IN    @{short_pass}
           ${user}    Create Dictionary    
           ...    name=Felipe
           ...    email=felipe@mark85.com
           ...    password=${password}

           Go to signup page
           Submit signup form    ${user}
           Alert should be    Informe uma senha com pelo menos 6 digitos
    END        