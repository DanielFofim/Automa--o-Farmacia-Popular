*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${WAIT_TIME}

Fechar Navegador
    Close Browser

Fazer Login Com Matrícula
    [Arguments]    ${matricula}    ${senha}
    Wait Until Page Contains Element    id:Usuario    ${WAIT_TIME}
    Input Text    id:Usuario    ${matricula}
    Input Text    id:Senha    ${senha}
    Click Button    xpath://input[@type='submit' and @value='Efetuar Login']

Verificar Login Realizado
    Wait Until Page Contains Element    xpath://*[contains(@class, 'dashboard')] | xpath://*[contains(@class, 'home')]    ${WAIT_TIME}

Clicar Botão Acessar CosmosNet
    Click Button    xpath://button[@class='btn btn-primary' and contains(text(), 'Acessar CosmosNet')]

Abrir Farmacia Popular Pague Menos
    [Arguments]    ${timeout}=${TIMEOUT_PADRAO}
    Go To    ${URL_FARMACIA_POPULAR}
    Wait Until Page Contains Element    xpath://*[contains(@class, 'ReactFarmaciaPopular') or contains(@class, 'app')]    ${timeout}s
