# Automação - Farmacia Popular

Projeto de automação web usando **Robot Framework** e **Python** para a aplicação de vendas da Farmácia Popular.

## Estrutura do Projeto

```
.
├── data/                 # Dados de teste
│   └── test_data.robot   # Variáveis e massas de dados
├── keywords/             # Keywords (palavras-chave reutilizáveis)
│   └── common_keywords.robot   # Keywords comuns (navegação, login, etc)
├── tests/                # Testes automatizados
│   └── test_login.robot  # Testes de login
├── results/              # Relatórios e screenshots
└── README.md
```

## Pré-requisitos

- Python 3.8+
- Robot Framework
- SeleniumLibrary
- Google Chrome ou Edge
- ChromeDriver/EdgeDriver compatível

## Instalação

1. **Instalar Robot Framework e dependências:**

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
```

2. **Verificar instalação:**

```bash
robot --version
```

## Rodando os Testes

### Executar todos os testes:
```bash
robot tests/
```

### Executar teste específico:
```bash
robot tests/test_login.robot
```

### Executar com tag específica:
```bash
robot --include login tests/
```

### Executar com relatório detalhado:
```bash
robot --outputdir results/ tests/
```

## Dados de Teste

### Credenciais de Acesso
- **Matrícula**: 90008209
- **Senha**: 12345678

### Clientes
- **CPF 1**: 555.555.552-02 | CRM: 99999
- **CPF 2**: 999.999.993-01 | CRM: 1111
- **UF**: SP / CE

### Produtos
| Código de Barras | Nome |
|---|---|
| 7896269900150 | AEROLIN |
| 7896672202872 | CLENIL |
| 7896241274903 | NORESTIN |
| 7891058002657 | HIDROCLOROTIAZIDA 25MG |
| 7894916502900 | CONTRACEP INJ 150MG |

## Estrutura de Arquivos Robot

### `data/test_data.robot`
Centraliza todas as variáveis e dados de teste para fácil manutenção.

### `keywords/common_keywords.robot`
Define palavras-chave reutilizáveis como:
- `Abrir Navegador`
- `Fazer Login Com Matrícula`
- `Verificar Login Realizado`

### `tests/test_login.robot`
Contém os casos de teste que utilizam as keywords definidas.

## Próximas Etapas

1. ✓ Setup básico do Robot Framework
2. ✓ Login
3. [ ] Buscar e adicionar clientes
4. [ ] Criar vendas
5. [ ] Adicionar produtos à venda
6. [ ] Finalizar e processar venda
7. [ ] Gerar relatórios

## Dicas

- Use `Robot Framework` com a extensão do VS Code para melhor experiência
- Screenshots são salvos em `results/` automaticamente
- Relatórios HTML estão em `results/report.html` após execução
- Logs detalhados em `results/log.html`
