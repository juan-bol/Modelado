-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-04-13 04:16:31 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE estudiante CASCADE CONSTRAINTS;

DROP TABLE estudiante_materia CASCADE CONSTRAINTS;

DROP TABLE materia CASCADE CONSTRAINTS;

DROP TABLE profesor CASCADE CONSTRAINTS;

CREATE TABLE estudiante (
    id_estudiante      NUMBER(4) NOT NULL,
    cedula_estudiante  VARCHAR2(10 CHAR) NOT NULL,
    nombre_estudiante  VARCHAR2(20 CHAR) NOT NULL,
    edad_estudiante    NUMBER(3)
);

COMMENT ON COLUMN estudiante.id_estudiante IS
    'Identificador del estudiante en el sistema';

ALTER TABLE estudiante ADD CONSTRAINT estudiante_pk PRIMARY KEY ( id_estudiante );

ALTER TABLE estudiante ADD CONSTRAINT cedula_uk UNIQUE ( cedula_estudiante );

CREATE TABLE estudiante_materia (
    estudiante_estudiante_id  NUMBER(4) NOT NULL,
    materia_materia_id        NUMBER(3) NOT NULL
);

ALTER TABLE estudiante_materia ADD CONSTRAINT relation_1_pk PRIMARY KEY ( estudiante_estudiante_id,
                                                                          materia_materia_id );

CREATE TABLE materia (
    id_materia       NUMBER(3) NOT NULL,
    nombre_materia   VARCHAR2(20 CHAR) NOT NULL,
    numero_creditos  NUMBER(2) NOT NULL,
    id_profesor      NUMBER(3) NOT NULL
);

ALTER TABLE materia ADD CONSTRAINT materia_pk PRIMARY KEY ( id_materia );

CREATE TABLE profesor (
    id_profesor      NUMBER(3) NOT NULL,
    nombre_profesor  VARCHAR2(20 CHAR) NOT NULL,
    fecha_ingreso    DATE NOT NULL
);

ALTER TABLE profesor ADD CONSTRAINT profesor_pk PRIMARY KEY ( id_profesor );

ALTER TABLE materia
    ADD CONSTRAINT profesor_materia FOREIGN KEY ( id_profesor )
        REFERENCES profesor ( id_profesor );

ALTER TABLE estudiante_materia
    ADD CONSTRAINT relation_1_estudiante_fk FOREIGN KEY ( estudiante_estudiante_id )
        REFERENCES estudiante ( id_estudiante );

ALTER TABLE estudiante_materia
    ADD CONSTRAINT relation_1_materia_fk FOREIGN KEY ( materia_materia_id )
        REFERENCES materia ( id_materia );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
