use oficina;
CREATE TABLE EMPRESA (
    idEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEmpresa VARCHAR(120) NOT NULL,
    tipo VARCHAR(45)
);

CREATE TABLE DEPARTAMENTO (
    idDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeDepartamento VARCHAR(45) NOT NULL,
    descricaoDepartamento VARCHAR(100) NOT NULL,
    idEmpresa INT NOT NULL,
    
    CONSTRAINT fk_idEmpresa_departamento FOREIGN KEY (idEmpresa)
        REFERENCES Empresa (idEmpresa)
);

CREATE TABLE FUNCIONARIO (
    idFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Funcionario VARCHAR(100) NOT NULL,
    cpf_Funcionario VARCHAR(45) NOT NULL,
    idendereco_Funcionario INT NOT NULL,
    idDepartamento INT NOT NULL,
    
    CONSTRAINT fk_idEndereco_funcionario FOREIGN KEY (idendereco_Funcionario)
        REFERENCES Endereco (idEndereco),
        
    CONSTRAINT fk_idDfuncionarioepartamento_funcionario FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento)
);

CREATE TABLE OS (
    idOS INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    datasolicitacao_OS VARCHAR(10) NOT NULL,
    dataprevisao_OS VARCHAR(10) NOT NULL,
    resposta VARCHAR(45) NOT NULL,
    idFuncionario INT NOT NULL,
    idDepartamento INT NOT NULL,
    idCliente INT NOT NULL,
    
    CONSTRAINT fk_idFuncionario_OS FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario (idFuncionario),
        
    CONSTRAINT fk_idDepartamento_OS FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento),
        
    CONSTRAINT fk_idCliente_OS FOREIGN KEY (idCliente)
        REFERENCES Cliente (idCliente)
);

CREATE TABLE CLIENTE (
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(120) NOT NULL,
    cpf_cliente VARCHAR(11) NOT NULL,
    idEndereco INT NOT NULL,
    
    CONSTRAINT fk_idEndereco_CLIENTE FOREIGN KEY (idEndereco)
        REFERENCES Endereco (idEndereco)
);

CREATE TABLE ENDERECO (
    idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rua_Endereco VARCHAR(100) NOT NULL,
    bairro_Endereco VARCHAR(100) NOT NULL,
    numero_Endereco VARCHAR(100) NOT NULL,
    cep_Endereco VARCHAR(100) NOT NULL
);

CREATE TABLE TELEFONE (
    idTelefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero_Telefone VARCHAR(13) NOT NULL,
    idFuncionario INT,
    idCliente INT,
    DDD_Telefone VARCHAR(5) NOT NULL,
    
    CONSTRAINT fk_idFuncionario_Telefone FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario (idFuncionario),
        
    CONSTRAINT fk_idCliente_Telefone FOREIGN KEY (idCliente)
        REFERENCES Cliente (idCliente)
);

CREATE TABLE SERVICO (
    idServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Servico VARCHAR(45) NOT NULL,
    recursos_Servico VARCHAR(200) NOT NULL
);

CREATE TABLE ITENS_OS (
    idServico INT NOT NULL,
    idOS INT NOT NULL,
    
    CONSTRAINT fk_idServico_Itens FOREIGN KEY (idServico)
        REFERENCES Servico (idServico),
        
    CONSTRAINT fk_idOS_Itens FOREIGN KEY (idOS)
        REFERENCES OS (idOS),
        
    PRIMARY KEY (idServico , idOS)
);

  -- INDEXS
  
create index IDX_IDEMPRESA ON Empresa(idEmpresa);
create index IDX_DEPARTAMENTO ON Departamento(idDepartamento);
create index IDX_FUNCIONARIO ON Funcionario(idFuncionario);
create index IDX_OS ON Os(idOs);
create index IDX_CLIENTE ON Cliente(idCliente);
create index IDX_ENDERECO ON Endereco(idEndereco);
create index IDX_TELEFONE ON Telefone(idTelefone);
create index IDX_SERVICO ON Servico(idServico);
create index IDX_IDSERVICO ON ITENS_OS(idServico);
create index IDX_IDOS ON ITENS_OS(idOS);

 -- ###################################################################
 

INSERT INTO EMPRESA(nomeEmpresa, tipo) VALUE ("Líbilly Negócios", "Roupas");
INSERT INTO ENDERECO(rua_Endereco, bairro_Endereco, numero_Endereco, cep_Endereco) VALUE ("Seminarista", "btn2", "3", "55555555");
INSERT INTO ENDERECO(rua_Endereco, bairro_Endereco, numero_Endereco, cep_Endereco) VALUE ("Otaviano", "Centro", "9a", "55555457");
INSERT INTO SERVICO(nome_Servico, recursos_Servico) VALUE ("Vendas", "Dinheiro");
INSERT INTO DEPARTAMENTO(nomeDepartamento, descricaoDepartamento, idEmpresa ) VALUE ("Departament", "Responsável por documentos da empresa", "01" )
INSERT INTO FUNCIONARIO(nome_Funcionario, cpf_Funcionario, idendereco_Funcionario, idDepartamento) VALUE ("Geovana", "888.666.555-33", "02", "01");
INSERT INTO CLIENTE(nome_cliente, cpf_cliente, idEndereco) VALUE ("Alícia", "111.111.111-11", "01");
INSERT INTO OS(datasolicitacao_OS, dataprevisao_OS, resposta, idFuncionario, idDepartamento, idCliente) VALUE ("20/05/2022" , "25/05/2022", "Em andamento", "01", "01", "01");
INSERT INTO TELEFONE(numero_Telefone, idFuncionario, idCliente, DDD_Telefone) VALUE ("4569-7895", "01", "01", "75");
INSERT INTO TELEFONE(numero_Telefone, idFuncionario, idCliente, DDD_Telefone) VALUE ("4569-5426", "01", "01", "75");

