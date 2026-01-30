# Limpeza Automática de Logs

## Descrição

Implementei uma solução para **deletar automaticamente logs com mais de 24 horas**. A limpeza é executada antes de cada suite de testes.

## Arquivos Criados

### 1. `cleanup_logs.py`
Script Python que:
- Verifica o diretório `results/` para arquivos de log antigos
- Remove arquivos com extensões: `.html`, `.xml`, `.txt`, `.log`
- Deleta apenas arquivos modificados há **mais de 24 horas**
- Exibe logs de quais arquivos foram removidos
- Trata erros graciosamente

### 2. `setup.robot`
Arquivo Robot Framework que:
- Define o Suite Setup para executar a limpeza antes dos testes
- Executa o script Python automaticamente
- Registra o resultado da limpeza nos logs

## Como Funciona

```
Execução de Testes
       ↓
Carrega setup.robot
       ↓
Suite Setup: Limpar Logs Antigos
       ↓
Executa cleanup_logs.py
       ↓
Remove logs com >24 horas
       ↓
Inicia testes normalmente
```

## Customizações

Se você quiser alterar o período de retenção de logs, edite o arquivo `cleanup_logs.py`:

```python
# Padrão: 24 horas
cleanup_old_logs(logs_dir="results", hours=24)

# Para 48 horas:
cleanup_old_logs(logs_dir="results", hours=48)

# Para 7 dias:
cleanup_old_logs(logs_dir="results", hours=168)
```

## Uso

Os testes continuam sendo executados normalmente. A limpeza é automática:

```bash
robot tests/
```

Você verá no console mensagens como:
```
✓ Deletado: results/log.html
✓ Deletado: results/report.html
1 arquivo(s) de log antigo(s) foi/foram removido(s).
```

## Notas

- A limpeza é **não-destrutiva**: só remove arquivos realmente antigos (>24h)
- Se nenhum arquivo antigo for encontrado, a limpeza executa silenciosamente
- O script pode ser executado manualmente também: `python cleanup_logs.py`
