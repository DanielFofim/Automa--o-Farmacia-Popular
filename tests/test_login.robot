*** Settings ***
Library    SeleniumLibrary
Resource    ../data/test_data.robot
Resource    ../keywords/common_keywords.robot

*** Test Cases ***
Teste 01: Realizar Login com Matrícula da Loja
    [Tags]    login    smoke
    Abrir Navegador
    Clicar Botão Acessar CosmosNet
    Fazer Login Com Matrícula    ${MATRICULA_LOJA}    ${SENHA_VENDEDOR}
    Verificar Login Realizado
    Abrir Farmacia Popular Pague Menos
    Fechar Navegador
