*** Settings ***
Documentation    Suite Setup para limpeza automática de logs antigos
Library          Process
Library          OperatingSystem

Suite Setup      Limpar Logs Antigos


*** Keywords ***
Limpar Logs Antigos
    [Documentation]    Remove arquivos de log com mais de 24 horas antes de executar os testes
    ${python_exec}=    Evaluate    ${"python"}
    ${result}=    Run Process    ${python_exec}    cleanup_logs.py    cwd=${CURDIR}
    Log    ${result.stdout}
    Should Be Equal As Integers    ${result.rc}    0    msg=Erro ao executar limpeza de logs
