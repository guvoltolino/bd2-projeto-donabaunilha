# 📊 Projeto Dona Baunilha - Banco de Dados de E-commerce

Bem-vindo(a) ao repositório do projeto **Dona Baunilha**, desenvolvido como parte do curso de **Fundamentos de Banco de Dados 2**. Este projeto simula um ambiente de análise de dados para uma cafeteria fictícia com unidades nas cidades de **Araraquara, Matão e São Carlos**.

## 📚 Descrição do Projeto

O objetivo principal é criar um banco de dados relacional com modelagem dimensional (Data Warehouse), realizar a carga de dados simulados no **Databricks** e responder perguntas de negócio através de consultas SQL.

Como bônus, o banco também foi migrado para um ambiente local com **SQL Server Express**, permitindo sua integração com ferramentas de visualização como o **Power BI**.

---

## 🚀 Tecnologias e Ferramentas

- 🐍 **Databricks Community Edition**
- 🔥 **Apache Spark SQL**
- 🗄️ **SQL Server Express + SSMS**
- 📊 **Power BI**
- 📝 **SQL (T-SQL)**

---

## 🗂️ Estrutura do Projeto

O projeto está organizado em dois notebooks principais e scripts SQL:

### 🔧 Notebook 00 — Criação do Banco e Inserção dos Dados

- Criação do database `donabaunilha`
- Modelagem e criação das tabelas:
  - Tabelas Dimensionais:
    - `dcliente`
    - `dproduto`
    - `dcategoria`
    - `dbu` (unidade de negócio)
    - `dendereco`
  - Tabela Fato:
    - `fvendas`
  - Tabela Auxiliar:
    - `ditemorder` (itens dos pedidos)
- Geração e inserção de dados simulados
- Validação das inserções e integridade dos dados

### 📊 Notebook 01 — Análises e Perguntas de Negócio

Responde às seguintes perguntas estratégicas:

1. 🕑 **Quais clientes estão há mais tempo sem comprar?**
2. 🏆 **Quem são os 10 clientes que mais compraram em um determinado período?**
3. 📦 **Quais são os 3 produtos mais vendidos em um período específico?**
4. 🏷️ **Quais itens foram vendidos por categoria?**
5. 💰 **Qual o valor total de vendas por categoria em um período?**

### 🗄️ Banco de Dados SQL Server

- Scripts de criação das tabelas em T-SQL
- Scripts de inserção de dados
- Scripts para responder as mesmas perguntas de negócio

---

## 🏗️ Modelagem do Banco de Dados

O modelo segue o padrão estrela (Star Schema), com uma tabela fato central e várias tabelas dimensão.

> 🚧 Adicione aqui a imagem do modelo se desejar:
> 
> `![Modelo de Dados](./imagens/modelo_dados.png)`

---

## 💡 Como Executar

### ✅ Usando o Databricks

1. Crie uma conta gratuita no [Databricks Community](https://community.cloud.databricks.com).
2. Importe os notebooks do repositório.
3. Execute o notebook **00** para criar e popular as tabelas.
4. Execute o notebook **01** para gerar as análises.

### ✅ Usando SQL Server

1. Instale o **SQL Server Express** e o **SQL Server Management Studio (SSMS)**.
2. Execute os scripts `.sql` contidos na pasta `/sql` deste repositório:
   - Criação do banco e tabelas
   - Inserção dos dados
   - Consultas de análise de dados

### ✅ Power BI (Opcional)

1. Conecte o Power BI ao seu banco SQL local.
2. Crie dashboards e gráficos para visualização dos dados.

---

## 📁 Organização dos Arquivos

```plaintext
📦 bd2-projeto-donabaunilha
├── 📁 notebooks
│   ├── 00_criacao_e_insercao.sql
│   └── 01_perguntas.sql
├── 📁 sql
│   ├── criacao_tabelas.sql
│   ├── insercao_dados.sql
│   └── consultas_negocio.sql
├── 📁 imagens
│   └── modelo_dados.png
├── README.md
└── Documentação - Projeto Dona Baunilha.pdf
