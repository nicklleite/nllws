/*
*	Base de dados
*	NLLWS (a.k.a NICHOLAS LOPES LEITE WEB SERIVICE)
* 
*	Script para criação da tabela DISCIPLINA
* 
*	@author Nicholas Leite <nicklleite@gmail.com>
*	@repo https://github.com/nicklleite/nllws
*	@date 29/08/2017
*
*/

-- SEQUENCE para a chave primária
CREATE SEQUENCE DISCIPLINA_SEQ
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
NO CYCLE;

-- Tabela DISCIPLINA
CREATE TABLE DISCIPLINA (
    ID BIGINT NOT NULL,
    CURSO_ID BIGINT NOT NULL,
    COD VARCHAR(5) NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    DM_TIPO VARCHAR(2) NOT NULL,
    DM_SITUACAO VARCHAR(2) NOT NULL,

    CONSTRAINT DISCIPLINA_PK PRIMARY KEY (ID)
);

ALTER TABLE DISCIPLINA
    ADD CONSTRAINT DISCIPLINA_CURSO_FK FOREIGN KEY (CURSO_ID) REFERENCES CURSO (ID);
CREATE INDEX DISCIPLINA_CURSO_FK_I
    ON DISCIPLINA (CURSO_ID);

ALTER TABLE DISCIPLINA
    ADD CONSTRAINT DISCIPLINA_DMSITUACAO_CK CHECK DISCIPLINA_DMSITUACAO_CK IN ('0', '1');
INSERT INTO DOMINIO
VALUES
    (NEXTVAL('DOMINIO_SEQ'), '0', 'DISCIPLINA.DM_SITUACAO', 'Ativa'),
    (NEXTVAL('DOMINIO_SEQ'), '1', 'DISCIPLINA.DM_SITUACAO', 'Não Ativa');

ALTER TABLE DISCIPLINA
    ADD CONSTRAINT DISCIPLINA_UK UNIQUE (CURSO_ID, COD);