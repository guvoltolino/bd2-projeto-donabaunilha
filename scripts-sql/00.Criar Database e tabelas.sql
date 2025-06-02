IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DonaBaunilha')

BEGIN
    CREATE DATABASE DonaBaunilha;
END;

USE DonaBaunilha;
GO

CREATE TABLE dendereco (
    id_endereco INT PRIMARY KEY,
    logradouro VARCHAR(100),
    numero INT,
    complemento VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    cep VARCHAR(10)
);

CREATE TABLE dcliente (
    id_cliente INT PRIMARY KEY,
    id_endereco INT,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    email VARCHAR(100),
    telefone VARCHAR(20),
    CONSTRAINT FK_dcliente_dendereco FOREIGN KEY (id_endereco) REFERENCES dendereco(id_endereco)
);

CREATE TABLE dbu (
    id_bu INT PRIMARY KEY,
    nome VARCHAR(50),
    logradouro VARCHAR(100),
    numero INT,
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(10)
);

CREATE TABLE dcategoria (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE dproduto (
    id_produto INT PRIMARY KEY,
    id_categoria INT,
    nome VARCHAR(100),
    preco_unit DECIMAL(10,2),
    custo_prod DECIMAL(10,2),
    CONSTRAINT FK_dproduto_dcategoria FOREIGN KEY (id_categoria) REFERENCES dcategoria(id_categoria)
);

CREATE TABLE fvendas (
    id_venda INT PRIMARY KEY,
    id_cliente INT,
    id_bu INT,
    valor_total DECIMAL(10,2),
    desconto DECIMAL(10,2),
    status VARCHAR(20),
    data_venda DATE,
    CONSTRAINT FK_fvendas_dcliente FOREIGN KEY (id_cliente) REFERENCES dcliente(id_cliente),
    CONSTRAINT FK_fvendas_dbu FOREIGN KEY (id_bu) REFERENCES dbu(id_bu)
);

CREATE TABLE ditemorder (
    id_item INT PRIMARY KEY,
    id_produto INT,
    id_venda INT,
    qtd_item INT,
    valor_item DECIMAL(10,2),
    CONSTRAINT FK_ditemorder_dproduto FOREIGN KEY (id_produto) REFERENCES dproduto(id_produto),
    CONSTRAINT FK_ditemorder_fvendas FOREIGN KEY (id_venda) REFERENCES fvendas(id_venda)
);

