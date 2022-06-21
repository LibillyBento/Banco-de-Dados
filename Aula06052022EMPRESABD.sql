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
INSERT INTO DEPARTAMENTO(nomeDepartamento, descricaoDepartamento, idEmpresa ) VALUE ("Departament", "Responsável por documentos da empresa", "01" );
INSERT INTO FUNCIONARIO(nome_Funcionario, cpf_Funcionario, idendereco_Funcionario, idDepartamento) VALUE ("Geovana", "888.666.555-33", "02", "01");
INSERT INTO CLIENTE(nome_cliente, cpf_cliente, idEndereco) VALUE ("Alícia", "111.111.111-11", "01");
INSERT INTO OS(datasolicitacao_OS, dataprevisao_OS, resposta, idFuncionario, idDepartamento, idCliente) VALUE ("20/05/2022" , "25/05/2022", "Em andamento", "01", "01", "01");
INSERT INTO TELEFONE(numero_Telefone, idFuncionario, idCliente, DDD_Telefone) VALUE ("4569-7895", "01", "01", "75");
INSERT INTO TELEFONE(numero_Telefone, idFuncionario, idCliente, DDD_Telefone) VALUE ("4569-5426", "01", "01", "75")


 
  
  INSERT INTO DEPARTAMENTO (nomeDepartamento,descricaoDepartamento,idEmpresa)
VALUES
  ("a nunc. In at","mattis ornare, lectus ante",1),
  ("Donec fringilla. Donec","nec, mollis vitae, posuere",1),
  ("eget laoreet posuere,","quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,",1),
  ("imperdiet dictum magna. Ut","egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum",1),
  ("dui, semper","elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar",1),
  ("Proin vel","mollis. Integer tincidunt aliquam",1),
  ("pellentesque eget, dictum","rutrum. Fusce dolor quam, elementum",1),
  ("pretium aliquet, metus","Maecenas malesuada fringilla est. Mauris eu turpis.",1),
  ("mollis non,","dui. Cum sociis natoque penatibus et magnis dis parturient montes,",1),
  ("vulputate velit eu","Aliquam vulputate ullamcorper magna. Sed",1);

INSERT INTO FUNCIONARIO (nome_Funcionario,cpf_Funcionario,idDepartamento,idendereco_Funcionario)
VALUES
  ("Hop Good","5554287779",3,15),
  ("Marvin Wooten","3237155781",3,7),
  ("Barrett Frederick","6345040945",4,18),
  ("Jameson Chase","2355205883",4,9),
  ("Harding Ruiz","7527863485",4,13),
  ("Denise Salas","7232774113",7,4),
  ("Brynn Guthrie","4452681835",9,7),
  ("Yeo Donaldson","2325103410",4,4),
  ("Hermione Ramsey","5860167612",4,20),
  ("Moana Robertson","1372833488",5,5),
  ("Courtney Moore","8954314742",4,19),
  ("Hedwig Watkins","7742468849",6,6),
  ("Jane Sharpe","3140510398",9,2),
  ("Kirby Hartman","0892463651",5,9),
  ("Lewis Hartman","3736066579",7,9),
  ("Timothy Larson","5580430857",3,9),
  ("Wesley Allison","3773801123",9,6),
  ("Iona Ray","6765108311",7,7),
  ("Nita Delaney","7149104428",10,2),
  ("Neil Foreman","5368144145",5,6);

INSERT INTO ENDERECO (bairro_Endereco,rua_Endereco,numero_Endereco, cep_Endereco)
VALUEScliente
  ("Trentino-Alto Adige","P.O. Box 699, 1271 Ac Rd.",13, 11111),
  ("Extremadura","Ap #311-9004 Dolor Street",5,22222222),
  ("Santa Catarina","565-911 Dui, Ave",3,33333333),
  ("North Island","4043 Et, Street",19, 44444444),
  ("Ogun","180-9542 Praesent St.",11),
  ("Limón","Ap #950-6380 Euismod Rd.",19),
  ("Junín","7933 Neque. Road",19),
  ("North West","P.O. Box 681, 6652 Molestie Street",8),
  ("Special Region of Yogyakarta","159-9093 Donec St.",18),
  ("Limón","2283 Est. Rd.",14),
  ("Oslo","303-8148 Egestas St.",17),
  ("Junín","456-810 Risus. Rd.",11),
  ("National Capital Region","1539 Elit, Street",16),
  ("Paraíba","2891 Mauris, St.",12),
  ("Gävleborgs län","8196 Eleifend. Avenue",11),
  ("Utrecht","9923 Cras Av.",5),
  ("Molise","Ap #698-3421 Mauris, St.",3),
  ("Saint Petersburg City","205-7469 Aliquet Rd.",3),
  ("North Island","567-1090 Erat, Rd.",9),
  ("Piemonte","Ap #651-6134 Eleifend Av.",2);

INSERT INTO CLIENTE (nome_cliente,cpf_cliente,idEndereco)
VALUES
  ("Richard Higgins","1944412",46),
  ("Idona Hunt","8975059",44),
  ("Gail Wiggins","7839832",49),
  ("Yael Bray","1187417",56),
  ("Chelsea Hobbs","8078314",44),
  ("Angelica Dalton","6459987",58),
  ("Kieran Hinton","6477231",61),
  ("Amery Mack","4912935",44),
  ("Ashely Espinoza","7673210",53),
  ("Willa Butler","7313795",62);
