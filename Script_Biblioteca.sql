
CREATE TABLE Assunto
( 
	IdAssunto            int  NOT NULL ,
	Cod_Assunto          int  NULL ,
	Descricao_Assunto    varchar(50)  NULL 
)
go



ALTER TABLE Assunto
	ADD CONSTRAINT XPKAssunto PRIMARY KEY  CLUSTERED (IdAssunto ASC)
go



CREATE TABLE Autor
( 
	IdAutor              int  NOT NULL ,
	Nome_Autor           varchar(100)  NULL 
)
go



ALTER TABLE Autor
	ADD CONSTRAINT XPKAutor PRIMARY KEY  CLUSTERED (IdAutor ASC)
go



CREATE TABLE Departamento
( 
	IdDepartamento       int  NOT NULL ,
	Nome_Departamento    varchar(100)  NULL ,
	IdFuncionario        int  NOT NULL 
)
go



ALTER TABLE Departamento
	ADD CONSTRAINT XPKDepartamento PRIMARY KEY  CLUSTERED (IdDepartamento ASC)
go



CREATE TABLE Devolucao
( 
	IdDevolucao          int  NOT NULL ,
	Data_Devolucao       datetime  NULL ,
	Horario_Devolucao    datetime  NULL ,
	IdFuncionario        int  NOT NULL ,
	IdEmprestimo         int  NOT NULL 
)
go



ALTER TABLE Devolucao
	ADD CONSTRAINT XPKDevolucao PRIMARY KEY  CLUSTERED (IdDevolucao ASC)
go



CREATE TABLE Editora
( 
	IdEditora            int  NOT NULL ,
	Cod_Editora          int  NULL ,
	Nome_Editora         varchar(100)  NULL ,
	Cidade_Editora       varchar(50)  NULL 
)
go



ALTER TABLE Editora
	ADD CONSTRAINT XPKEditora PRIMARY KEY  CLUSTERED (IdEditora ASC)
go



CREATE TABLE Empresa
( 
	IdEmpresa            int IDENTITY ( 1,1 ) ,
	Nome_Empresa         varchar(100)  NULL ,
	Razao_Empresa        varchar(100)  NOT NULL ,
	CNPJ_Empresa         varchar(13)  NOT NULL ,
	IE_Empresa           varchar(10)  NOT NULL ,
	End_Logradouro_Empresa varchar(100)  NULL ,
	End_Num_Empresa      varchar(50)  NULL ,
	End_Bairro_Empresa   varchar(50)  NULL ,
	End_Cidade_Empresa   varchar(50)  NULL ,
	End_UF_Empresa       varchar(2)  NULL ,
	End_CEP_Empresa      varchar(8)  NOT NULL ,
	Tel_Empresa          varchar(9)  NOT NULL 
)
go



ALTER TABLE Empresa
	ADD CONSTRAINT XPKEmpresa PRIMARY KEY  CLUSTERED (IdEmpresa ASC)
go



CREATE TABLE Emprestimo
( 
	IdEmprestimo         int  NOT NULL ,
	Cod_Emprestimo       int  NULL ,
	Data_Emprestimo      datetime  NOT NULL ,
	Horario_Emprestimo   datetime  NOT NULL ,
	Data_Prevista_Rec_Emprestimo datetime  NOT NULL ,
	IdUsuario            int  NOT NULL ,
	IdExemplar           int  NOT NULL 
)
go



ALTER TABLE Emprestimo
	ADD CONSTRAINT XPKEmprestimo PRIMARY KEY  CLUSTERED (IdEmprestimo ASC)
go



CREATE TABLE Exemplar
( 
	IdExemplar           int  NOT NULL ,
	Data_Aquisicao       datetime  NULL ,
	Situacao_Exemplar    varchar(1)  NULL ,
	IdObra               int  NOT NULL 
)
go



ALTER TABLE Exemplar
	ADD CONSTRAINT XPKExemplar PRIMARY KEY  CLUSTERED (IdExemplar ASC)
go



CREATE TABLE Funcionario
( 
	IdFuncionario        int  NOT NULL ,
	Nome_Funcionario     varchar(100)  NULL ,
	Numero_Matricula_Funcionario varchar(10)  NULL ,
	IdDepartamento       int  NOT NULL 
)
go



ALTER TABLE Funcionario
	ADD CONSTRAINT XPKFuncionario PRIMARY KEY  CLUSTERED (IdFuncionario ASC)
go



CREATE TABLE Manutencao
( 
	IdManutencao         int  NOT NULL ,
	Data_Manutencao      datetime  NULL ,
	IdFuncionario        int  NOT NULL ,
	IdExemplar           int  NOT NULL ,
	IdMotivo_Manutencao  int  NOT NULL 
)
go



ALTER TABLE Manutencao
	ADD CONSTRAINT XPKManutencao PRIMARY KEY  CLUSTERED (IdManutencao ASC)
go



CREATE TABLE Motivo_Manutencao
( 
	IdMotivo_Manutencao  int  NOT NULL ,
	Descricao_Manutencao varchar(100)  NULL 
)
go



ALTER TABLE Motivo_Manutencao
	ADD CONSTRAINT XPKMotivo_Manutencao PRIMARY KEY  CLUSTERED (IdMotivo_Manutencao ASC)
go



CREATE TABLE Obra
( 
	IdObra               int  NOT NULL ,
	Cod_Obra             int  NULL ,
	Titulos_Obra         varchar(50)  NULL ,
	Ano_Public_Obra      varchar(4)  NULL ,
	Tipo_Obra            varchar(10)  NULL ,
	IdEditora            int  NOT NULL 
)
go



ALTER TABLE Obra
	ADD CONSTRAINT XPKObra PRIMARY KEY  CLUSTERED (IdObra ASC)
go



CREATE TABLE Obra_Assunto
( 
	IdAssunto            int  NOT NULL ,
	IdObra               int  NOT NULL 
)
go



ALTER TABLE Obra_Assunto
	ADD CONSTRAINT XPKObra_Assunto PRIMARY KEY  CLUSTERED (IdAssunto ASC,IdObra ASC)
go



CREATE TABLE Obra_Autor
( 
	IdObra               int  NOT NULL ,
	IdAutor              int  NOT NULL ,
	Ordem                varchar(50)  NULL 
)
go



ALTER TABLE Obra_Autor
	ADD CONSTRAINT XPKObra_Autor PRIMARY KEY  CLUSTERED (IdObra ASC,IdAutor ASC)
go



CREATE TABLE Reserva
( 
	IdReserva            int  NOT NULL ,
	Cod_Reserva          int  NULL ,
	Data_Reserva         datetime  NOT NULL ,
	Horario_Reserva      datetime  NOT NULL ,
	Data_Retirada_Reserva datetime  NOT NULL ,
	IdUsuario            int  NOT NULL ,
	IdObra               int  NOT NULL 
)
go



ALTER TABLE Reserva
	ADD CONSTRAINT XPKReserva PRIMARY KEY  CLUSTERED (IdReserva ASC)
go



CREATE TABLE Usuarios
( 
	IdUsuario            int IDENTITY ( 1,1 ) ,
	Cod_Usuario          varchar(20)  NOT NULL ,
	Nome_Usuario         varchar(100)  NOT NULL ,
	End_Usuario          varchar(100)  NULL ,
	End_Num_Usuario      varchar(50)  NULL ,
	End_Compl_Usuario    varchar(100)  NULL ,
	End_Bairro_Usuario   varchar(50)  NULL ,
	End_Cidade_Usuario   varchar(50)  NULL ,
	End_UF_Usuario       varchar(2)  NULL ,
	End_CEP_Usuario      varchar(8)  NOT NULL ,
	Tel_Usuario          varchar(9)  NOT NULL ,
	CPF_Usuario          varchar(11)  NOT NULL ,
	End_Logradouro_Usuario varchar(100)  NULL ,
	IdEmpresa            int  NOT NULL 
)
go



ALTER TABLE Usuarios
	ADD CONSTRAINT XPKUsuarios PRIMARY KEY  CLUSTERED (IdUsuario ASC)
go




ALTER TABLE Departamento
	ADD CONSTRAINT R_23 FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Devolucao
	ADD CONSTRAINT R_27 FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Devolucao
	ADD CONSTRAINT R_28 FOREIGN KEY (IdEmprestimo) REFERENCES Emprestimo(IdEmprestimo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Emprestimo
	ADD CONSTRAINT R_18 FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Emprestimo
	ADD CONSTRAINT R_20 FOREIGN KEY (IdExemplar) REFERENCES Exemplar(IdExemplar)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Exemplar
	ADD CONSTRAINT R_19 FOREIGN KEY (IdObra) REFERENCES Obra(IdObra)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Funcionario
	ADD CONSTRAINT R_21 FOREIGN KEY (IdDepartamento) REFERENCES Departamento(IdDepartamento)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Manutencao
	ADD CONSTRAINT R_24 FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Manutencao
	ADD CONSTRAINT R_25 FOREIGN KEY (IdExemplar) REFERENCES Exemplar(IdExemplar)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Manutencao
	ADD CONSTRAINT R_26 FOREIGN KEY (IdMotivo_Manutencao) REFERENCES Motivo_Manutencao(IdMotivo_Manutencao)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Obra
	ADD CONSTRAINT R_10 FOREIGN KEY (IdEditora) REFERENCES Editora(IdEditora)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Obra_Assunto
	ADD CONSTRAINT R_11 FOREIGN KEY (IdAssunto) REFERENCES Assunto(IdAssunto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Obra_Assunto
	ADD CONSTRAINT R_12 FOREIGN KEY (IdObra) REFERENCES Obra(IdObra)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Obra_Autor
	ADD CONSTRAINT R_8 FOREIGN KEY (IdObra) REFERENCES Obra(IdObra)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Obra_Autor
	ADD CONSTRAINT R_9 FOREIGN KEY (IdAutor) REFERENCES Autor(IdAutor)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Reserva
	ADD CONSTRAINT R_15 FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Reserva
	ADD CONSTRAINT R_16 FOREIGN KEY (IdObra) REFERENCES Obra(IdObra)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Usuarios
	ADD CONSTRAINT R_14 FOREIGN KEY (IdEmpresa) REFERENCES Empresa(IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Usuarios
	ADD CONSTRAINT R_17 FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




CREATE TRIGGER tD_Assunto ON Assunto FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Assunto */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Assunto  Obra_Assunto on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000f47d", PARENT_OWNER="", PARENT_TABLE="Assunto"
    CHILD_OWNER="", CHILD_TABLE="Obra_Assunto"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="IdAssunto" */
    IF EXISTS (
      SELECT * FROM deleted,Obra_Assunto
      WHERE
        /*  %JoinFKPK(Obra_Assunto,deleted," = "," AND") */
        Obra_Assunto.IdAssunto = deleted.IdAssunto
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Assunto because Obra_Assunto exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Assunto ON Assunto FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Assunto */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdAssunto int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Assunto  Obra_Assunto on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00010ed8", PARENT_OWNER="", PARENT_TABLE="Assunto"
    CHILD_OWNER="", CHILD_TABLE="Obra_Assunto"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="IdAssunto" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdAssunto)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Obra_Assunto
      WHERE
        /*  %JoinFKPK(Obra_Assunto,deleted," = "," AND") */
        Obra_Assunto.IdAssunto = deleted.IdAssunto
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Assunto because Obra_Assunto exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Autor ON Autor FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Autor */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Autor  Obra_Autor on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000e896", PARENT_OWNER="", PARENT_TABLE="Autor"
    CHILD_OWNER="", CHILD_TABLE="Obra_Autor"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="IdAutor" */
    IF EXISTS (
      SELECT * FROM deleted,Obra_Autor
      WHERE
        /*  %JoinFKPK(Obra_Autor,deleted," = "," AND") */
        Obra_Autor.IdAutor = deleted.IdAutor
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Autor because Obra_Autor exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Autor ON Autor FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Autor */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdAutor int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Autor  Obra_Autor on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000102e0", PARENT_OWNER="", PARENT_TABLE="Autor"
    CHILD_OWNER="", CHILD_TABLE="Obra_Autor"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="IdAutor" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdAutor)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Obra_Autor
      WHERE
        /*  %JoinFKPK(Obra_Autor,deleted," = "," AND") */
        Obra_Autor.IdAutor = deleted.IdAutor
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Autor because Obra_Autor exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Departamento ON Departamento FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Departamento */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Departamento  Funcionario on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000244d0", PARENT_OWNER="", PARENT_TABLE="Departamento"
    CHILD_OWNER="", CHILD_TABLE="Funcionario"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="IdDepartamento" */
    IF EXISTS (
      SELECT * FROM deleted,Funcionario
      WHERE
        /*  %JoinFKPK(Funcionario,deleted," = "," AND") */
        Funcionario.IdDepartamento = deleted.IdDepartamento
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Departamento because Funcionario exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Funcionario  Departamento on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Departamento"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="IdFuncionario" */
    IF EXISTS (SELECT * FROM deleted,Funcionario
      WHERE
        /* %JoinFKPK(deleted,Funcionario," = "," AND") */
        deleted.IdFuncionario = Funcionario.IdFuncionario AND
        NOT EXISTS (
          SELECT * FROM Departamento
          WHERE
            /* %JoinFKPK(Departamento,Funcionario," = "," AND") */
            Departamento.IdFuncionario = Funcionario.IdFuncionario
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Departamento because Funcionario exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Departamento ON Departamento FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Departamento */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdDepartamento int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Departamento  Funcionario on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00028164", PARENT_OWNER="", PARENT_TABLE="Departamento"
    CHILD_OWNER="", CHILD_TABLE="Funcionario"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="IdDepartamento" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdDepartamento)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Funcionario
      WHERE
        /*  %JoinFKPK(Funcionario,deleted," = "," AND") */
        Funcionario.IdDepartamento = deleted.IdDepartamento
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Departamento because Funcionario exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Funcionario  Departamento on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Departamento"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="IdFuncionario" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdFuncionario)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Funcionario
        WHERE
          /* %JoinFKPK(inserted,Funcionario) */
          inserted.IdFuncionario = Funcionario.IdFuncionario
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Departamento because Funcionario does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Devolucao ON Devolucao FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Devolucao */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Funcionario  Devolucao on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00027dc7", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Devolucao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="IdFuncionario" */
    IF EXISTS (SELECT * FROM deleted,Funcionario
      WHERE
        /* %JoinFKPK(deleted,Funcionario," = "," AND") */
        deleted.IdFuncionario = Funcionario.IdFuncionario AND
        NOT EXISTS (
          SELECT * FROM Devolucao
          WHERE
            /* %JoinFKPK(Devolucao,Funcionario," = "," AND") */
            Devolucao.IdFuncionario = Funcionario.IdFuncionario
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Devolucao because Funcionario exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Emprestimo  Devolucao on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Emprestimo"
    CHILD_OWNER="", CHILD_TABLE="Devolucao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="IdEmprestimo" */
    IF EXISTS (SELECT * FROM deleted,Emprestimo
      WHERE
        /* %JoinFKPK(deleted,Emprestimo," = "," AND") */
        deleted.IdEmprestimo = Emprestimo.IdEmprestimo AND
        NOT EXISTS (
          SELECT * FROM Devolucao
          WHERE
            /* %JoinFKPK(Devolucao,Emprestimo," = "," AND") */
            Devolucao.IdEmprestimo = Emprestimo.IdEmprestimo
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Devolucao because Emprestimo exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Devolucao ON Devolucao FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Devolucao */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdDevolucao int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Funcionario  Devolucao on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002a83c", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Devolucao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="IdFuncionario" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdFuncionario)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Funcionario
        WHERE
          /* %JoinFKPK(inserted,Funcionario) */
          inserted.IdFuncionario = Funcionario.IdFuncionario
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Devolucao because Funcionario does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Emprestimo  Devolucao on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Emprestimo"
    CHILD_OWNER="", CHILD_TABLE="Devolucao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="IdEmprestimo" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdEmprestimo)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Emprestimo
        WHERE
          /* %JoinFKPK(inserted,Emprestimo) */
          inserted.IdEmprestimo = Emprestimo.IdEmprestimo
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Devolucao because Emprestimo does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Editora ON Editora FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Editora */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Editora  Obra on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000da12", PARENT_OWNER="", PARENT_TABLE="Editora"
    CHILD_OWNER="", CHILD_TABLE="Obra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="IdEditora" */
    IF EXISTS (
      SELECT * FROM deleted,Obra
      WHERE
        /*  %JoinFKPK(Obra,deleted," = "," AND") */
        Obra.IdEditora = deleted.IdEditora
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Editora because Obra exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Editora ON Editora FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Editora */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdEditora int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Editora  Obra on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0000f5a0", PARENT_OWNER="", PARENT_TABLE="Editora"
    CHILD_OWNER="", CHILD_TABLE="Obra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="IdEditora" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdEditora)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Obra
      WHERE
        /*  %JoinFKPK(Obra,deleted," = "," AND") */
        Obra.IdEditora = deleted.IdEditora
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Editora because Obra exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Empresa ON Empresa FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Empresa */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Empresa  Usuarios on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000eb11", PARENT_OWNER="", PARENT_TABLE="Empresa"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="IdEmpresa" */
    IF EXISTS (
      SELECT * FROM deleted,Usuarios
      WHERE
        /*  %JoinFKPK(Usuarios,deleted," = "," AND") */
        Usuarios.IdEmpresa = deleted.IdEmpresa
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Empresa because Usuarios exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Empresa ON Empresa FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Empresa */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdEmpresa int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Empresa  Usuarios on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000101a1", PARENT_OWNER="", PARENT_TABLE="Empresa"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="IdEmpresa" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdEmpresa)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Usuarios
      WHERE
        /*  %JoinFKPK(Usuarios,deleted," = "," AND") */
        Usuarios.IdEmpresa = deleted.IdEmpresa
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Empresa because Usuarios exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Emprestimo ON Emprestimo FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Emprestimo */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Emprestimo  Devolucao on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00034be2", PARENT_OWNER="", PARENT_TABLE="Emprestimo"
    CHILD_OWNER="", CHILD_TABLE="Devolucao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="IdEmprestimo" */
    IF EXISTS (
      SELECT * FROM deleted,Devolucao
      WHERE
        /*  %JoinFKPK(Devolucao,deleted," = "," AND") */
        Devolucao.IdEmprestimo = deleted.IdEmprestimo
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Emprestimo because Devolucao exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Usuarios  Emprestimo on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Emprestimo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="IdUsuario" */
    IF EXISTS (SELECT * FROM deleted,Usuarios
      WHERE
        /* %JoinFKPK(deleted,Usuarios," = "," AND") */
        deleted.IdUsuario = Usuarios.IdUsuario AND
        NOT EXISTS (
          SELECT * FROM Emprestimo
          WHERE
            /* %JoinFKPK(Emprestimo,Usuarios," = "," AND") */
            Emprestimo.IdUsuario = Usuarios.IdUsuario
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Emprestimo because Usuarios exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Exemplar  Emprestimo on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Exemplar"
    CHILD_OWNER="", CHILD_TABLE="Emprestimo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="IdExemplar" */
    IF EXISTS (SELECT * FROM deleted,Exemplar
      WHERE
        /* %JoinFKPK(deleted,Exemplar," = "," AND") */
        deleted.IdExemplar = Exemplar.IdExemplar AND
        NOT EXISTS (
          SELECT * FROM Emprestimo
          WHERE
            /* %JoinFKPK(Emprestimo,Exemplar," = "," AND") */
            Emprestimo.IdExemplar = Exemplar.IdExemplar
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Emprestimo because Exemplar exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Emprestimo ON Emprestimo FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Emprestimo */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdEmprestimo int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Emprestimo  Devolucao on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003b5d2", PARENT_OWNER="", PARENT_TABLE="Emprestimo"
    CHILD_OWNER="", CHILD_TABLE="Devolucao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="IdEmprestimo" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdEmprestimo)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Devolucao
      WHERE
        /*  %JoinFKPK(Devolucao,deleted," = "," AND") */
        Devolucao.IdEmprestimo = deleted.IdEmprestimo
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Emprestimo because Devolucao exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Usuarios  Emprestimo on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Emprestimo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="IdUsuario" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdUsuario)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Usuarios
        WHERE
          /* %JoinFKPK(inserted,Usuarios) */
          inserted.IdUsuario = Usuarios.IdUsuario
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Emprestimo because Usuarios does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Exemplar  Emprestimo on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Exemplar"
    CHILD_OWNER="", CHILD_TABLE="Emprestimo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="IdExemplar" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdExemplar)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Exemplar
        WHERE
          /* %JoinFKPK(inserted,Exemplar) */
          inserted.IdExemplar = Exemplar.IdExemplar
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Emprestimo because Exemplar does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Exemplar ON Exemplar FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Exemplar */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Exemplar  Emprestimo on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003008c", PARENT_OWNER="", PARENT_TABLE="Exemplar"
    CHILD_OWNER="", CHILD_TABLE="Emprestimo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="IdExemplar" */
    IF EXISTS (
      SELECT * FROM deleted,Emprestimo
      WHERE
        /*  %JoinFKPK(Emprestimo,deleted," = "," AND") */
        Emprestimo.IdExemplar = deleted.IdExemplar
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Exemplar because Emprestimo exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Exemplar  Manutencao on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Exemplar"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="IdExemplar" */
    IF EXISTS (
      SELECT * FROM deleted,Manutencao
      WHERE
        /*  %JoinFKPK(Manutencao,deleted," = "," AND") */
        Manutencao.IdExemplar = deleted.IdExemplar
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Exemplar because Manutencao exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Obra  Exemplar on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Exemplar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="IdObra" */
    IF EXISTS (SELECT * FROM deleted,Obra
      WHERE
        /* %JoinFKPK(deleted,Obra," = "," AND") */
        deleted.IdObra = Obra.IdObra AND
        NOT EXISTS (
          SELECT * FROM Exemplar
          WHERE
            /* %JoinFKPK(Exemplar,Obra," = "," AND") */
            Exemplar.IdObra = Obra.IdObra
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Exemplar because Obra exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Exemplar ON Exemplar FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Exemplar */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdExemplar int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Exemplar  Emprestimo on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000331a5", PARENT_OWNER="", PARENT_TABLE="Exemplar"
    CHILD_OWNER="", CHILD_TABLE="Emprestimo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="IdExemplar" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdExemplar)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Emprestimo
      WHERE
        /*  %JoinFKPK(Emprestimo,deleted," = "," AND") */
        Emprestimo.IdExemplar = deleted.IdExemplar
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Exemplar because Emprestimo exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Exemplar  Manutencao on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Exemplar"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="IdExemplar" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdExemplar)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Manutencao
      WHERE
        /*  %JoinFKPK(Manutencao,deleted," = "," AND") */
        Manutencao.IdExemplar = deleted.IdExemplar
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Exemplar because Manutencao exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Obra  Exemplar on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Exemplar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="IdObra" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdObra)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Obra
        WHERE
          /* %JoinFKPK(inserted,Obra) */
          inserted.IdObra = Obra.IdObra
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Exemplar because Obra does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Funcionario ON Funcionario FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Funcionario */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Funcionario  Departamento on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004321b", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Departamento"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="IdFuncionario" */
    IF EXISTS (
      SELECT * FROM deleted,Departamento
      WHERE
        /*  %JoinFKPK(Departamento,deleted," = "," AND") */
        Departamento.IdFuncionario = deleted.IdFuncionario
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Funcionario because Departamento exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Funcionario  Manutencao on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="IdFuncionario" */
    IF EXISTS (
      SELECT * FROM deleted,Manutencao
      WHERE
        /*  %JoinFKPK(Manutencao,deleted," = "," AND") */
        Manutencao.IdFuncionario = deleted.IdFuncionario
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Funcionario because Manutencao exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Funcionario  Devolucao on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Devolucao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="IdFuncionario" */
    IF EXISTS (
      SELECT * FROM deleted,Devolucao
      WHERE
        /*  %JoinFKPK(Devolucao,deleted," = "," AND") */
        Devolucao.IdFuncionario = deleted.IdFuncionario
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Funcionario because Devolucao exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Departamento  Funcionario on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Departamento"
    CHILD_OWNER="", CHILD_TABLE="Funcionario"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="IdDepartamento" */
    IF EXISTS (SELECT * FROM deleted,Departamento
      WHERE
        /* %JoinFKPK(deleted,Departamento," = "," AND") */
        deleted.IdDepartamento = Departamento.IdDepartamento AND
        NOT EXISTS (
          SELECT * FROM Funcionario
          WHERE
            /* %JoinFKPK(Funcionario,Departamento," = "," AND") */
            Funcionario.IdDepartamento = Departamento.IdDepartamento
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Funcionario because Departamento exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Funcionario ON Funcionario FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Funcionario */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdFuncionario int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Funcionario  Departamento on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004a95e", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Departamento"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="IdFuncionario" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdFuncionario)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Departamento
      WHERE
        /*  %JoinFKPK(Departamento,deleted," = "," AND") */
        Departamento.IdFuncionario = deleted.IdFuncionario
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Funcionario because Departamento exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Funcionario  Manutencao on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="IdFuncionario" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdFuncionario)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Manutencao
      WHERE
        /*  %JoinFKPK(Manutencao,deleted," = "," AND") */
        Manutencao.IdFuncionario = deleted.IdFuncionario
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Funcionario because Manutencao exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Funcionario  Devolucao on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Devolucao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="IdFuncionario" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdFuncionario)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Devolucao
      WHERE
        /*  %JoinFKPK(Devolucao,deleted," = "," AND") */
        Devolucao.IdFuncionario = deleted.IdFuncionario
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Funcionario because Devolucao exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Departamento  Funcionario on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Departamento"
    CHILD_OWNER="", CHILD_TABLE="Funcionario"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="IdDepartamento" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdDepartamento)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Departamento
        WHERE
          /* %JoinFKPK(inserted,Departamento) */
          inserted.IdDepartamento = Departamento.IdDepartamento
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Funcionario because Departamento does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Manutencao ON Manutencao FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Manutencao */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Funcionario  Manutencao on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003d69c", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="IdFuncionario" */
    IF EXISTS (SELECT * FROM deleted,Funcionario
      WHERE
        /* %JoinFKPK(deleted,Funcionario," = "," AND") */
        deleted.IdFuncionario = Funcionario.IdFuncionario AND
        NOT EXISTS (
          SELECT * FROM Manutencao
          WHERE
            /* %JoinFKPK(Manutencao,Funcionario," = "," AND") */
            Manutencao.IdFuncionario = Funcionario.IdFuncionario
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Manutencao because Funcionario exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Exemplar  Manutencao on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Exemplar"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="IdExemplar" */
    IF EXISTS (SELECT * FROM deleted,Exemplar
      WHERE
        /* %JoinFKPK(deleted,Exemplar," = "," AND") */
        deleted.IdExemplar = Exemplar.IdExemplar AND
        NOT EXISTS (
          SELECT * FROM Manutencao
          WHERE
            /* %JoinFKPK(Manutencao,Exemplar," = "," AND") */
            Manutencao.IdExemplar = Exemplar.IdExemplar
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Manutencao because Exemplar exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Motivo_Manutencao  Manutencao on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Motivo_Manutencao"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="IdMotivo_Manutencao" */
    IF EXISTS (SELECT * FROM deleted,Motivo_Manutencao
      WHERE
        /* %JoinFKPK(deleted,Motivo_Manutencao," = "," AND") */
        deleted.IdMotivo_Manutencao = Motivo_Manutencao.IdMotivo_Manutencao AND
        NOT EXISTS (
          SELECT * FROM Manutencao
          WHERE
            /* %JoinFKPK(Manutencao,Motivo_Manutencao," = "," AND") */
            Manutencao.IdMotivo_Manutencao = Motivo_Manutencao.IdMotivo_Manutencao
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Manutencao because Motivo_Manutencao exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Manutencao ON Manutencao FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Manutencao */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdManutencao int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Funcionario  Manutencao on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00041f86", PARENT_OWNER="", PARENT_TABLE="Funcionario"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="IdFuncionario" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdFuncionario)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Funcionario
        WHERE
          /* %JoinFKPK(inserted,Funcionario) */
          inserted.IdFuncionario = Funcionario.IdFuncionario
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Manutencao because Funcionario does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Exemplar  Manutencao on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Exemplar"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="IdExemplar" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdExemplar)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Exemplar
        WHERE
          /* %JoinFKPK(inserted,Exemplar) */
          inserted.IdExemplar = Exemplar.IdExemplar
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Manutencao because Exemplar does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Motivo_Manutencao  Manutencao on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Motivo_Manutencao"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="IdMotivo_Manutencao" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdMotivo_Manutencao)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Motivo_Manutencao
        WHERE
          /* %JoinFKPK(inserted,Motivo_Manutencao) */
          inserted.IdMotivo_Manutencao = Motivo_Manutencao.IdMotivo_Manutencao
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Manutencao because Motivo_Manutencao does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Motivo_Manutencao ON Motivo_Manutencao FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Motivo_Manutencao */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Motivo_Manutencao  Manutencao on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000111cc", PARENT_OWNER="", PARENT_TABLE="Motivo_Manutencao"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="IdMotivo_Manutencao" */
    IF EXISTS (
      SELECT * FROM deleted,Manutencao
      WHERE
        /*  %JoinFKPK(Manutencao,deleted," = "," AND") */
        Manutencao.IdMotivo_Manutencao = deleted.IdMotivo_Manutencao
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Motivo_Manutencao because Manutencao exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Motivo_Manutencao ON Motivo_Manutencao FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Motivo_Manutencao */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdMotivo_Manutencao int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Motivo_Manutencao  Manutencao on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00012e08", PARENT_OWNER="", PARENT_TABLE="Motivo_Manutencao"
    CHILD_OWNER="", CHILD_TABLE="Manutencao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="IdMotivo_Manutencao" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdMotivo_Manutencao)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Manutencao
      WHERE
        /*  %JoinFKPK(Manutencao,deleted," = "," AND") */
        Manutencao.IdMotivo_Manutencao = deleted.IdMotivo_Manutencao
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Motivo_Manutencao because Manutencao exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Obra ON Obra FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Obra */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Obra  Obra_Autor on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004adf6", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Obra_Autor"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="IdObra" */
    IF EXISTS (
      SELECT * FROM deleted,Obra_Autor
      WHERE
        /*  %JoinFKPK(Obra_Autor,deleted," = "," AND") */
        Obra_Autor.IdObra = deleted.IdObra
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Obra because Obra_Autor exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Obra  Obra_Assunto on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Obra_Assunto"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="IdObra" */
    IF EXISTS (
      SELECT * FROM deleted,Obra_Assunto
      WHERE
        /*  %JoinFKPK(Obra_Assunto,deleted," = "," AND") */
        Obra_Assunto.IdObra = deleted.IdObra
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Obra because Obra_Assunto exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Obra  Reserva on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Reserva"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="IdObra" */
    IF EXISTS (
      SELECT * FROM deleted,Reserva
      WHERE
        /*  %JoinFKPK(Reserva,deleted," = "," AND") */
        Reserva.IdObra = deleted.IdObra
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Obra because Reserva exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Obra  Exemplar on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Exemplar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="IdObra" */
    IF EXISTS (
      SELECT * FROM deleted,Exemplar
      WHERE
        /*  %JoinFKPK(Exemplar,deleted," = "," AND") */
        Exemplar.IdObra = deleted.IdObra
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Obra because Exemplar exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Editora  Obra on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Editora"
    CHILD_OWNER="", CHILD_TABLE="Obra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="IdEditora" */
    IF EXISTS (SELECT * FROM deleted,Editora
      WHERE
        /* %JoinFKPK(deleted,Editora," = "," AND") */
        deleted.IdEditora = Editora.IdEditora AND
        NOT EXISTS (
          SELECT * FROM Obra
          WHERE
            /* %JoinFKPK(Obra,Editora," = "," AND") */
            Obra.IdEditora = Editora.IdEditora
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Obra because Editora exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Obra ON Obra FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Obra */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdObra int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Obra  Obra_Autor on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005231d", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Obra_Autor"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="IdObra" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdObra)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Obra_Autor
      WHERE
        /*  %JoinFKPK(Obra_Autor,deleted," = "," AND") */
        Obra_Autor.IdObra = deleted.IdObra
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Obra because Obra_Autor exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Obra  Obra_Assunto on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Obra_Assunto"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="IdObra" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdObra)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Obra_Assunto
      WHERE
        /*  %JoinFKPK(Obra_Assunto,deleted," = "," AND") */
        Obra_Assunto.IdObra = deleted.IdObra
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Obra because Obra_Assunto exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Obra  Reserva on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Reserva"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="IdObra" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdObra)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Reserva
      WHERE
        /*  %JoinFKPK(Reserva,deleted," = "," AND") */
        Reserva.IdObra = deleted.IdObra
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Obra because Reserva exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Obra  Exemplar on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Exemplar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="IdObra" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdObra)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Exemplar
      WHERE
        /*  %JoinFKPK(Exemplar,deleted," = "," AND") */
        Exemplar.IdObra = deleted.IdObra
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Obra because Exemplar exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Editora  Obra on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Editora"
    CHILD_OWNER="", CHILD_TABLE="Obra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="IdEditora" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdEditora)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Editora
        WHERE
          /* %JoinFKPK(inserted,Editora) */
          inserted.IdEditora = Editora.IdEditora
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Obra because Editora does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Obra_Assunto ON Obra_Assunto FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Obra_Assunto */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Assunto  Obra_Assunto on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000247fd", PARENT_OWNER="", PARENT_TABLE="Assunto"
    CHILD_OWNER="", CHILD_TABLE="Obra_Assunto"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="IdAssunto" */
    IF EXISTS (SELECT * FROM deleted,Assunto
      WHERE
        /* %JoinFKPK(deleted,Assunto," = "," AND") */
        deleted.IdAssunto = Assunto.IdAssunto AND
        NOT EXISTS (
          SELECT * FROM Obra_Assunto
          WHERE
            /* %JoinFKPK(Obra_Assunto,Assunto," = "," AND") */
            Obra_Assunto.IdAssunto = Assunto.IdAssunto
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Obra_Assunto because Assunto exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Obra  Obra_Assunto on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Obra_Assunto"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="IdObra" */
    IF EXISTS (SELECT * FROM deleted,Obra
      WHERE
        /* %JoinFKPK(deleted,Obra," = "," AND") */
        deleted.IdObra = Obra.IdObra AND
        NOT EXISTS (
          SELECT * FROM Obra_Assunto
          WHERE
            /* %JoinFKPK(Obra_Assunto,Obra," = "," AND") */
            Obra_Assunto.IdObra = Obra.IdObra
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Obra_Assunto because Obra exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Obra_Assunto ON Obra_Assunto FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Obra_Assunto */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdAssunto int, 
           @insIdObra int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Assunto  Obra_Assunto on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00028874", PARENT_OWNER="", PARENT_TABLE="Assunto"
    CHILD_OWNER="", CHILD_TABLE="Obra_Assunto"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="IdAssunto" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdAssunto)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Assunto
        WHERE
          /* %JoinFKPK(inserted,Assunto) */
          inserted.IdAssunto = Assunto.IdAssunto
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Obra_Assunto because Assunto does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Obra  Obra_Assunto on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Obra_Assunto"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="IdObra" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdObra)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Obra
        WHERE
          /* %JoinFKPK(inserted,Obra) */
          inserted.IdObra = Obra.IdObra
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Obra_Assunto because Obra does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Obra_Autor ON Obra_Autor FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Obra_Autor */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Obra  Obra_Autor on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00022ea9", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Obra_Autor"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="IdObra" */
    IF EXISTS (SELECT * FROM deleted,Obra
      WHERE
        /* %JoinFKPK(deleted,Obra," = "," AND") */
        deleted.IdObra = Obra.IdObra AND
        NOT EXISTS (
          SELECT * FROM Obra_Autor
          WHERE
            /* %JoinFKPK(Obra_Autor,Obra," = "," AND") */
            Obra_Autor.IdObra = Obra.IdObra
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Obra_Autor because Obra exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Autor  Obra_Autor on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Autor"
    CHILD_OWNER="", CHILD_TABLE="Obra_Autor"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="IdAutor" */
    IF EXISTS (SELECT * FROM deleted,Autor
      WHERE
        /* %JoinFKPK(deleted,Autor," = "," AND") */
        deleted.IdAutor = Autor.IdAutor AND
        NOT EXISTS (
          SELECT * FROM Obra_Autor
          WHERE
            /* %JoinFKPK(Obra_Autor,Autor," = "," AND") */
            Obra_Autor.IdAutor = Autor.IdAutor
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Obra_Autor because Autor exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Obra_Autor ON Obra_Autor FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Obra_Autor */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdObra int, 
           @insIdAutor int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Obra  Obra_Autor on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00027dbe", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Obra_Autor"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="IdObra" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdObra)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Obra
        WHERE
          /* %JoinFKPK(inserted,Obra) */
          inserted.IdObra = Obra.IdObra
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Obra_Autor because Obra does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Autor  Obra_Autor on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Autor"
    CHILD_OWNER="", CHILD_TABLE="Obra_Autor"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="IdAutor" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdAutor)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Autor
        WHERE
          /* %JoinFKPK(inserted,Autor) */
          inserted.IdAutor = Autor.IdAutor
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Obra_Autor because Autor does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Reserva ON Reserva FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Reserva */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Usuarios  Reserva on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000225ff", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Reserva"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="IdUsuario" */
    IF EXISTS (SELECT * FROM deleted,Usuarios
      WHERE
        /* %JoinFKPK(deleted,Usuarios," = "," AND") */
        deleted.IdUsuario = Usuarios.IdUsuario AND
        NOT EXISTS (
          SELECT * FROM Reserva
          WHERE
            /* %JoinFKPK(Reserva,Usuarios," = "," AND") */
            Reserva.IdUsuario = Usuarios.IdUsuario
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Reserva because Usuarios exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Obra  Reserva on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Reserva"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="IdObra" */
    IF EXISTS (SELECT * FROM deleted,Obra
      WHERE
        /* %JoinFKPK(deleted,Obra," = "," AND") */
        deleted.IdObra = Obra.IdObra AND
        NOT EXISTS (
          SELECT * FROM Reserva
          WHERE
            /* %JoinFKPK(Reserva,Obra," = "," AND") */
            Reserva.IdObra = Obra.IdObra
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Reserva because Obra exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Reserva ON Reserva FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Reserva */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdReserva int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Usuarios  Reserva on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00027469", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Reserva"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="IdUsuario" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdUsuario)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Usuarios
        WHERE
          /* %JoinFKPK(inserted,Usuarios) */
          inserted.IdUsuario = Usuarios.IdUsuario
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Reserva because Usuarios does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Obra  Reserva on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obra"
    CHILD_OWNER="", CHILD_TABLE="Reserva"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="IdObra" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdObra)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Obra
        WHERE
          /* %JoinFKPK(inserted,Obra) */
          inserted.IdObra = Obra.IdObra
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Reserva because Obra does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Usuarios ON Usuarios FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Usuarios */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Usuarios  Reserva on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004fb43", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Reserva"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="IdUsuario" */
    IF EXISTS (
      SELECT * FROM deleted,Reserva
      WHERE
        /*  %JoinFKPK(Reserva,deleted," = "," AND") */
        Reserva.IdUsuario = deleted.IdUsuario
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Usuarios because Reserva exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Usuarios  Usuarios on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="IdUsuario" */
    IF EXISTS (
      SELECT * FROM deleted,Usuarios
      WHERE
        /*  %JoinFKPK(Usuarios,deleted," = "," AND") */
        Usuarios.IdUsuario = deleted.IdUsuario
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Usuarios because Usuarios exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Usuarios  Emprestimo on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Emprestimo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="IdUsuario" */
    IF EXISTS (
      SELECT * FROM deleted,Emprestimo
      WHERE
        /*  %JoinFKPK(Emprestimo,deleted," = "," AND") */
        Emprestimo.IdUsuario = deleted.IdUsuario
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Usuarios because Emprestimo exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Empresa  Usuarios on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Empresa"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="IdEmpresa" */
    IF EXISTS (SELECT * FROM deleted,Empresa
      WHERE
        /* %JoinFKPK(deleted,Empresa," = "," AND") */
        deleted.IdEmpresa = Empresa.IdEmpresa AND
        NOT EXISTS (
          SELECT * FROM Usuarios
          WHERE
            /* %JoinFKPK(Usuarios,Empresa," = "," AND") */
            Usuarios.IdEmpresa = Empresa.IdEmpresa
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Usuarios because Empresa exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Usuarios  Usuarios on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="IdUsuario" */
    IF EXISTS (SELECT * FROM deleted,Usuarios
      WHERE
        /* %JoinFKPK(deleted,Usuarios," = "," AND") */
        deleted.IdUsuario = Usuarios.IdUsuario AND
        NOT EXISTS (
          SELECT * FROM Usuarios
          WHERE
            /* %JoinFKPK(Usuarios,Usuarios," = "," AND") */
            Usuarios.IdUsuario = Usuarios.IdUsuario
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Usuarios because Usuarios exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Usuarios ON Usuarios FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Usuarios */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdUsuario int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Usuarios  Reserva on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005b788", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Reserva"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="IdUsuario" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdUsuario)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Reserva
      WHERE
        /*  %JoinFKPK(Reserva,deleted," = "," AND") */
        Reserva.IdUsuario = deleted.IdUsuario
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Usuarios because Reserva exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Usuarios  Usuarios on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="IdUsuario" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdUsuario)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Usuarios
      WHERE
        /*  %JoinFKPK(Usuarios,deleted," = "," AND") */
        Usuarios.IdUsuario = deleted.IdUsuario
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Usuarios because Usuarios exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Usuarios  Emprestimo on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Emprestimo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="IdUsuario" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdUsuario)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Emprestimo
      WHERE
        /*  %JoinFKPK(Emprestimo,deleted," = "," AND") */
        Emprestimo.IdUsuario = deleted.IdUsuario
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Usuarios because Emprestimo exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Empresa  Usuarios on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Empresa"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="IdEmpresa" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdEmpresa)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Empresa
        WHERE
          /* %JoinFKPK(inserted,Empresa) */
          inserted.IdEmpresa = Empresa.IdEmpresa
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Usuarios because Empresa does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Usuarios  Usuarios on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Usuarios"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="IdUsuario" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(IdUsuario)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Usuarios
        WHERE
          /* %JoinFKPK(inserted,Usuarios) */
          inserted.IdUsuario = Usuarios.IdUsuario
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.IdUsuario IS NULL
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Usuarios because Usuarios does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go

CREATE INDEX IDXEmpresa
on Empresa (Nome_Empresa)
go

CREATE INDEX IDXAssunto
on Assunto (Descricao_Assunto)
go

CREATE INDEX IDXAuto
on Auto (Nome_Autor)
go

CREATE INDEX IDXDepartamento
on Departamento (Nome_Departamento)
go

CREATE INDEX IDXDevolucao
on Devolucao (Data_Devolucao)
go

CREATE INDEX IDXEditora
on Editora (Nome_Editora)
go

CREATE INDEX IDXEmprestimo
on Emprestimo (Data_Emprestimo)
go

CREATE INDEX IDXExemplar
on Exemplar (Situacao_Exemplar)
go

CREATE INDEX IDXFuncionario
on Funcionario (Nome_Funcionario)
go

CREATE INDEX IDXManutencao
on Manutencao (Data_Manutencao)
go

CREATE INDEX IDXMotivoManutencao
on Motivo_Manutencao (Descricao_Manutencao)
go

CREATE INDEX IDXObras
on Obra (Titulos_Obra)
go

CREATE INDEX IDXObraAutor
on Obra_Autor (Ordem)
go

CREATE INDEX IDXReserva
on Reserva (Data_Reserva)
go

CREATE INDEX IDXUsuarios
on Usuarios (Nome_Usuario)
go

