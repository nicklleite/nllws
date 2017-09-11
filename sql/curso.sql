﻿/*
*	Base de dados
*	NLLWS (a.k.a NICHOLAS LOPES LEITE WEB SERIVICE)
* 
*	Script para criação da tabela CURSO
* 
*	@author Nicholas Leite <nicklleite@gmail.com>
*	@repo https://github.com/nicklleite/nllws
*	@date 29/08/2017
*
*/

-- SEQUENCE para a chave primária
CREATE SEQUENCE CURSO_SEQ
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
NO CYCLE;

-- Tabela CURSO
DROP TABLE IF EXISTS CURSO;
CREATE TABLE CURSO (
    ID BIGINT NOT NULL DEFAULT NEXTVAL('CURSO_SEQ'),
    EMPRESA_ID BIGINT NOT NULL,

    COD VARCHAR(5) NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    DM_TIPO VARCHAR(2) NOT NULL,
    DM_SITUACAO VARCHAR(2) NOT NULL,

    CONSTRAINT CURSO_PK PRIMARY KEY (ID)
);

ALTER SEQUENCE CURSO_SEQ OWNED BY CURSO.ID;

ALTER TABLE CURSO
    ADD CONSTRAINT CURSO_EMPRESA_FK FOREIGN KEY (EMPRESA_ID) REFERENCES EMPRESA (ID);
CREATE INDEX CURSO_EMPRESA_FK_I
    ON CURSO (EMPRESA_ID);

ALTER TABLE CURSO
    ADD CONSTRAINT CURSO_DMSITUACAO_CK CHECK (DM_SITUACAO IN ('0', '1'));
INSERT INTO DOMINIO
VALUES
    (NEXTVAL('DOMINIO_SEQ'), '1', 'CURSO.DM_SITUACAO', 'Ativo'),
    (NEXTVAL('DOMINIO_SEQ'), '2', 'CURSO.DM_SITUACAO', 'Não Ativo');

ALTER TABLE CURSO
    ADD CONSTRAINT CURSO_UK UNIQUE (EMPRESA_ID, COD);