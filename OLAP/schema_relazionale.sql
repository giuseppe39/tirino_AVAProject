--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.11
-- Dumped by pg_dump version 9.3.11
-- Started on 2016-04-09 09:34:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 2200)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

--
-- TOC entry 2020 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA "AVA"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "AVA" IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2022 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 17027)
-- Name: AnnoAccademico; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "AnnoAccademico" (
    codice_anno integer NOT NULL,
    "nome_annoXmeno1" integer,
    "nome_anno_X" integer,
    "nome_annoXmeno1_annoX" text
);


ALTER TABLE "AVA"."AnnoAccademico" OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 17302)
-- Name: AnnoAccademico_codice_anno_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "AnnoAccademico_codice_anno_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AVA"."AnnoAccademico_codice_anno_seq" OWNER TO postgres;

--
-- TOC entry 2023 (class 0 OID 0)
-- Dependencies: 177
-- Name: AnnoAccademico_codice_anno_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "AnnoAccademico_codice_anno_seq" OWNED BY "AnnoAccademico".codice_anno;


--
-- TOC entry 174 (class 1259 OID 17042)
-- Name: Corso; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "Corso" (
    nome text,
    ssd text,
    codice_corso text NOT NULL,
    numero_cfu integer,
    tipo_attivita text
);


ALTER TABLE "AVA"."Corso" OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 25461)
-- Name: CorsoDiStudi; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "CorsoDiStudi" (
    data_inizio_validita text,
    data_fine_validita text,
    nome_cds text,
    tipo_cds text,
    nome_dipartimento text,
    durata_legale integer,
    codice_dipartimento text,
    codice_ateneo text,
    codice_corso_studi text NOT NULL
);


ALTER TABLE "AVA"."CorsoDiStudi" OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 25566)
-- Name: Esami; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "Esami" (
    voto_esame numeric,
    cfu numeric,
    tipo_attivita text NOT NULL,
    cod_studente text NOT NULL,
    cod_corso_studi text NOT NULL,
    cod_anno_accademico integer NOT NULL,
    cod_tempo integer NOT NULL,
    cod_corso text NOT NULL
);


ALTER TABLE "AVA"."Esami" OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 17139)
-- Name: Ingressi; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "Ingressi" (
    punteggio_test numeric,
    immatricolato numeric,
    cod_anno_accademico integer,
    cod_tempo integer,
    cod_corso_studi text,
    cod_tipo_immatricolazione text,
    cod_studente text
);


ALTER TABLE "AVA"."Ingressi" OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 17157)
-- Name: Lauree; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "Lauree" (
    cod_anno_accademico integer,
    cod_corso_studi text,
    cod_studente text,
    cod_tempo integer,
    voto_laurea text
);


ALTER TABLE "AVA"."Lauree" OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 17024)
-- Name: Studente; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "Studente" (
    coorte integer,
    titolo_studio text,
    sesso text,
    regione_residenza text,
    provincia_residenza text,
    comune_residenza text,
    stato_residenza text,
    cittadinanza text,
    nazione_diploma text,
    tipo_diploma text,
    istituto_diploma text,
    cf text NOT NULL,
    votazione_diploma text,
    anno_diploma integer,
    data_nascita date
);


ALTER TABLE "AVA"."Studente" OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 25541)
-- Name: Tempo; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "Tempo" (
    giorno integer,
    mese integer,
    anno integer,
    codice_tempo integer NOT NULL
);


ALTER TABLE "AVA"."Tempo" OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 17033)
-- Name: TipoImmatricolazione; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "TipoImmatricolazione" (
    tipo_immatricolazione text NOT NULL,
    descrizione text
);


ALTER TABLE "AVA"."TipoImmatricolazione" OWNER TO postgres;

--
-- TOC entry 1863 (class 2604 OID 17304)
-- Name: codice_anno; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "AnnoAccademico" ALTER COLUMN codice_anno SET DEFAULT nextval('"AnnoAccademico_codice_anno_seq"'::regclass);


--
-- TOC entry 1867 (class 2606 OID 17312)
-- Name: anno_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "AnnoAccademico"
    ADD CONSTRAINT anno_pkey PRIMARY KEY (codice_anno);


--
-- TOC entry 1882 (class 2606 OID 25468)
-- Name: cds_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CorsoDiStudi"
    ADD CONSTRAINT cds_pkey PRIMARY KEY (codice_corso_studi);


--
-- TOC entry 1871 (class 2606 OID 25488)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Corso"
    ADD CONSTRAINT corso_pkey PRIMARY KEY (codice_corso);


--
-- TOC entry 1886 (class 2606 OID 25627)
-- Name: esami_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT esami_pkey PRIMARY KEY (tipo_attivita, cod_studente, cod_corso_studi, cod_anno_accademico, cod_tempo, cod_corso);


--
-- TOC entry 1865 (class 2606 OID 25423)
-- Name: studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Studente"
    ADD CONSTRAINT studente_pkey PRIMARY KEY (cf);


--
-- TOC entry 1884 (class 2606 OID 25545)
-- Name: tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Tempo"
    ADD CONSTRAINT tempo_pkey PRIMARY KEY (codice_tempo);


--
-- TOC entry 1869 (class 2606 OID 25443)
-- Name: tipoImmatricolazioni_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "TipoImmatricolazione"
    ADD CONSTRAINT "tipoImmatricolazioni_pkey" PRIMARY KEY (tipo_immatricolazione);


--
-- TOC entry 1887 (class 1259 OID 25645)
-- Name: fki_esami_aa_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_aa_fkey ON "Esami" USING btree (cod_anno_accademico);


--
-- TOC entry 1888 (class 1259 OID 25639)
-- Name: fki_esami_cds_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_cds_fkey ON "Esami" USING btree (cod_corso_studi);


--
-- TOC entry 1889 (class 1259 OID 25657)
-- Name: fki_esami_corso_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_corso_fkey ON "Esami" USING btree (cod_corso);


--
-- TOC entry 1890 (class 1259 OID 25674)
-- Name: fki_esami_corsostudi_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_corsostudi_fkey ON "Esami" USING btree (cod_corso_studi);


--
-- TOC entry 1891 (class 1259 OID 25668)
-- Name: fki_esami_stud_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_stud_fkey ON "Esami" USING btree (cod_studente);


--
-- TOC entry 1892 (class 1259 OID 25633)
-- Name: fki_esami_studente_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_studente_fkey ON "Esami" USING btree (cod_studente);


--
-- TOC entry 1893 (class 1259 OID 25651)
-- Name: fki_esami_tempo_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_tempo_fkey ON "Esami" USING btree (cod_tempo);


--
-- TOC entry 1872 (class 1259 OID 25704)
-- Name: fki_ingressi_aa_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ingressi_aa_fkey ON "Ingressi" USING btree (cod_anno_accademico);


--
-- TOC entry 1873 (class 1259 OID 25716)
-- Name: fki_ingressi_cds_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ingressi_cds_fkey ON "Ingressi" USING btree (cod_corso_studi);


--
-- TOC entry 1874 (class 1259 OID 25728)
-- Name: fki_ingressi_studente_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ingressi_studente_fkey ON "Ingressi" USING btree (cod_studente);


--
-- TOC entry 1875 (class 1259 OID 25710)
-- Name: fki_ingressi_tempo_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ingressi_tempo_fkey ON "Ingressi" USING btree (cod_tempo);


--
-- TOC entry 1876 (class 1259 OID 25722)
-- Name: fki_ingressi_tipo_immatricolazione; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ingressi_tipo_immatricolazione ON "Ingressi" USING btree (cod_tipo_immatricolazione);


--
-- TOC entry 1877 (class 1259 OID 25680)
-- Name: fki_lauree_aa_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_lauree_aa_fkey ON "Lauree" USING btree (cod_anno_accademico);


--
-- TOC entry 1878 (class 1259 OID 25686)
-- Name: fki_lauree_cds_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_lauree_cds_fkey ON "Lauree" USING btree (cod_corso_studi);


--
-- TOC entry 1879 (class 1259 OID 25692)
-- Name: fki_lauree_studente_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_lauree_studente_fkey ON "Lauree" USING btree (cod_studente);


--
-- TOC entry 1880 (class 1259 OID 25698)
-- Name: fki_lauree_tempo_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_lauree_tempo_fkey ON "Lauree" USING btree (cod_tempo);


--
-- TOC entry 1903 (class 2606 OID 25640)
-- Name: esami_aa_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT esami_aa_fkey FOREIGN KEY (cod_anno_accademico) REFERENCES "AnnoAccademico"(codice_anno);


--
-- TOC entry 1905 (class 2606 OID 25652)
-- Name: esami_corso_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT esami_corso_fkey FOREIGN KEY (cod_corso) REFERENCES "Corso"(codice_corso);


--
-- TOC entry 1907 (class 2606 OID 25669)
-- Name: esami_corsostudi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT esami_corsostudi_fkey FOREIGN KEY (cod_corso_studi) REFERENCES "CorsoDiStudi"(codice_corso_studi);


--
-- TOC entry 1906 (class 2606 OID 25663)
-- Name: esami_stud_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT esami_stud_fkey FOREIGN KEY (cod_studente) REFERENCES "Studente"(cf);


--
-- TOC entry 1904 (class 2606 OID 25646)
-- Name: esami_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT esami_tempo_fkey FOREIGN KEY (cod_tempo) REFERENCES "Tempo"(codice_tempo);


--
-- TOC entry 1894 (class 2606 OID 25699)
-- Name: ingressi_aa_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT ingressi_aa_fkey FOREIGN KEY (cod_anno_accademico) REFERENCES "AnnoAccademico"(codice_anno);


--
-- TOC entry 1896 (class 2606 OID 25711)
-- Name: ingressi_cds_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT ingressi_cds_fkey FOREIGN KEY (cod_corso_studi) REFERENCES "CorsoDiStudi"(codice_corso_studi);


--
-- TOC entry 1898 (class 2606 OID 25723)
-- Name: ingressi_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT ingressi_studente_fkey FOREIGN KEY (cod_studente) REFERENCES "Studente"(cf);


--
-- TOC entry 1895 (class 2606 OID 25705)
-- Name: ingressi_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT ingressi_tempo_fkey FOREIGN KEY (cod_tempo) REFERENCES "Tempo"(codice_tempo);


--
-- TOC entry 1897 (class 2606 OID 25717)
-- Name: ingressi_tipo_immatricolazione; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT ingressi_tipo_immatricolazione FOREIGN KEY (cod_tipo_immatricolazione) REFERENCES "TipoImmatricolazione"(tipo_immatricolazione);


--
-- TOC entry 1899 (class 2606 OID 25675)
-- Name: lauree_aa_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT lauree_aa_fkey FOREIGN KEY (cod_anno_accademico) REFERENCES "AnnoAccademico"(codice_anno);


--
-- TOC entry 1900 (class 2606 OID 25681)
-- Name: lauree_cds_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT lauree_cds_fkey FOREIGN KEY (cod_corso_studi) REFERENCES "CorsoDiStudi"(codice_corso_studi);


--
-- TOC entry 1901 (class 2606 OID 25687)
-- Name: lauree_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT lauree_studente_fkey FOREIGN KEY (cod_studente) REFERENCES "Studente"(cf);


--
-- TOC entry 1902 (class 2606 OID 25693)
-- Name: lauree_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT lauree_tempo_fkey FOREIGN KEY (cod_tempo) REFERENCES "Tempo"(codice_tempo);


--
-- TOC entry 2021 (class 0 OID 0)
-- Dependencies: 7
-- Name: AVA; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA "AVA" FROM PUBLIC;
REVOKE ALL ON SCHEMA "AVA" FROM postgres;
GRANT ALL ON SCHEMA "AVA" TO postgres;
GRANT ALL ON SCHEMA "AVA" TO PUBLIC;


-- Completed on 2016-04-09 09:34:25

--
-- PostgreSQL database dump complete
--

