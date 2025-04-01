--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2025-04-01 23:31:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 25392)
-- Name: biglietti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biglietti (
    id integer NOT NULL,
    data_emissione date NOT NULL,
    fk_stato integer NOT NULL,
    fk_prenotazione integer NOT NULL,
    fk_corsa integer NOT NULL,
    fk_biglietto_sostituito integer
);


ALTER TABLE public.biglietti OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25391)
-- Name: biglietti_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.biglietti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.biglietti_id_seq OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 232
-- Name: biglietti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.biglietti_id_seq OWNED BY public.biglietti.id;


--
-- TOC entry 234 (class 1259 OID 25418)
-- Name: composizioni; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.composizioni (
    fk_tratta integer NOT NULL,
    fk_fermata integer NOT NULL,
    ordine integer NOT NULL,
    ora_arrivo time without time zone,
    ora_partenza time without time zone
);


ALTER TABLE public.composizioni OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25380)
-- Name: corse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.corse (
    id integer NOT NULL,
    fk_tratta integer NOT NULL,
    data date NOT NULL
);


ALTER TABLE public.corse OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25379)
-- Name: corse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.corse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.corse_id_seq OWNER TO postgres;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 230
-- Name: corse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.corse_id_seq OWNED BY public.corse.id;


--
-- TOC entry 227 (class 1259 OID 25361)
-- Name: fermate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fermate (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.fermate OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25360)
-- Name: fermate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fermate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fermate_id_seq OWNER TO postgres;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 226
-- Name: fermate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fermate_id_seq OWNED BY public.fermate.id;


--
-- TOC entry 219 (class 1259 OID 25315)
-- Name: metodi_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metodi_pagamento (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    descrizione text
);


ALTER TABLE public.metodi_pagamento OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25314)
-- Name: metodi_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metodi_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metodi_pagamento_id_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 218
-- Name: metodi_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodi_pagamento_id_seq OWNED BY public.metodi_pagamento.id;


--
-- TOC entry 225 (class 1259 OID 25352)
-- Name: mezzi_trasporto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mezzi_trasporto (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    codice character varying(50),
    posti_disponibili integer NOT NULL
);


ALTER TABLE public.mezzi_trasporto OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25351)
-- Name: mezzi_trasporto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mezzi_trasporto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mezzi_trasporto_id_seq OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 224
-- Name: mezzi_trasporto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mezzi_trasporto_id_seq OWNED BY public.mezzi_trasporto.id;


--
-- TOC entry 221 (class 1259 OID 25324)
-- Name: pagamenti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagamenti (
    id integer NOT NULL,
    importo numeric(8,2) NOT NULL,
    data_ora timestamp without time zone NOT NULL,
    fk_prenotazione integer NOT NULL,
    fk_metodo integer NOT NULL
);


ALTER TABLE public.pagamenti OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25323)
-- Name: pagamenti_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagamenti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagamenti_id_seq OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 220
-- Name: pagamenti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagamenti_id_seq OWNED BY public.pagamenti.id;


--
-- TOC entry 215 (class 1259 OID 25294)
-- Name: passeggeri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passeggeri (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cognome character varying(100) NOT NULL,
    data_nascita date NOT NULL,
    telefono character varying(20),
    email character varying(100) NOT NULL
);


ALTER TABLE public.passeggeri OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25293)
-- Name: passeggeri_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passeggeri_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passeggeri_id_seq OWNER TO postgres;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 214
-- Name: passeggeri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passeggeri_id_seq OWNED BY public.passeggeri.id;


--
-- TOC entry 217 (class 1259 OID 25303)
-- Name: prenotazioni; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prenotazioni (
    id integer NOT NULL,
    data_ora timestamp without time zone NOT NULL,
    fk_passeggero integer NOT NULL
);


ALTER TABLE public.prenotazioni OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25302)
-- Name: prenotazioni_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prenotazioni_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prenotazioni_id_seq OWNER TO postgres;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 216
-- Name: prenotazioni_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prenotazioni_id_seq OWNED BY public.prenotazioni.id;


--
-- TOC entry 223 (class 1259 OID 25343)
-- Name: stati_biglietto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stati_biglietto (
    id integer NOT NULL,
    nome character varying(30) NOT NULL,
    descrizione text
);


ALTER TABLE public.stati_biglietto OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25342)
-- Name: stati_biglietto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stati_biglietto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stati_biglietto_id_seq OWNER TO postgres;

--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 222
-- Name: stati_biglietto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stati_biglietto_id_seq OWNED BY public.stati_biglietto.id;


--
-- TOC entry 229 (class 1259 OID 25368)
-- Name: tratte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tratte (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    durata interval,
    fk_mezzo integer NOT NULL
);


ALTER TABLE public.tratte OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25367)
-- Name: tratte_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tratte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tratte_id_seq OWNER TO postgres;

--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 228
-- Name: tratte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tratte_id_seq OWNED BY public.tratte.id;


--
-- TOC entry 3231 (class 2604 OID 25395)
-- Name: biglietti id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietti ALTER COLUMN id SET DEFAULT nextval('public.biglietti_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 25383)
-- Name: corse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corse ALTER COLUMN id SET DEFAULT nextval('public.corse_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 25364)
-- Name: fermate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fermate ALTER COLUMN id SET DEFAULT nextval('public.fermate_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 25318)
-- Name: metodi_pagamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodi_pagamento ALTER COLUMN id SET DEFAULT nextval('public.metodi_pagamento_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 25355)
-- Name: mezzi_trasporto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mezzi_trasporto ALTER COLUMN id SET DEFAULT nextval('public.mezzi_trasporto_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 25327)
-- Name: pagamenti id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamenti ALTER COLUMN id SET DEFAULT nextval('public.pagamenti_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 25297)
-- Name: passeggeri id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggeri ALTER COLUMN id SET DEFAULT nextval('public.passeggeri_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 25306)
-- Name: prenotazioni id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazioni ALTER COLUMN id SET DEFAULT nextval('public.prenotazioni_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 25346)
-- Name: stati_biglietto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stati_biglietto ALTER COLUMN id SET DEFAULT nextval('public.stati_biglietto_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 25371)
-- Name: tratte id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratte ALTER COLUMN id SET DEFAULT nextval('public.tratte_id_seq'::regclass);


--
-- TOC entry 3444 (class 0 OID 25392)
-- Dependencies: 233
-- Data for Name: biglietti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biglietti (id, data_emissione, fk_stato, fk_prenotazione, fk_corsa, fk_biglietto_sostituito) FROM stdin;
1	2025-04-01	1	1	1	\N
2	2025-04-02	1	2	2	\N
3	2025-04-03	1	3	3	\N
4	2025-04-04	1	4	4	\N
5	2025-04-05	1	5	1	\N
6	2025-04-06	1	6	2	\N
7	2025-04-07	1	7	5	\N
11	2025-04-10	1	3	6	\N
13	2025-04-13	2	4	9	\N
14	2025-04-14	1	4	10	\N
8	2025-04-08	3	3	4	3
\.


--
-- TOC entry 3445 (class 0 OID 25418)
-- Dependencies: 234
-- Data for Name: composizioni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.composizioni (fk_tratta, fk_fermata, ordine, ora_arrivo, ora_partenza) FROM stdin;
1	1	1	\N	08:00:00
1	2	2	09:30:00	09:35:00
1	3	3	10:50:00	10:55:00
1	4	4	12:30:00	\N
2	1	1	\N	07:00:00
2	2	2	08:45:00	\N
3	5	1	\N	06:00:00
3	6	2	07:45:00	07:50:00
3	2	3	09:00:00	09:05:00
3	4	4	11:10:00	11:15:00
3	7	5	13:30:00	\N
4	8	1	\N	08:15:00
4	2	2	10:00:00	10:05:00
4	3	3	11:30:00	\N
\.


--
-- TOC entry 3442 (class 0 OID 25380)
-- Dependencies: 231
-- Data for Name: corse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.corse (id, fk_tratta, data) FROM stdin;
1	1	2025-04-10
2	2	2025-04-11
3	1	2025-04-12
4	1	2025-04-13
5	2	2025-04-14
6	2	2025-04-15
7	1	2025-04-16
8	3	2025-04-17
9	3	2025-04-18
10	4	2025-04-17
11	4	2025-04-19
\.


--
-- TOC entry 3438 (class 0 OID 25361)
-- Dependencies: 227
-- Data for Name: fermate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fermate (id, nome) FROM stdin;
1	Milano
2	Bologna
3	Firenze
4	Roma
5	Parma
6	Reggio Emilia
7	Napoli
8	Torino
9	Venezia
\.


--
-- TOC entry 3430 (class 0 OID 25315)
-- Dependencies: 219
-- Data for Name: metodi_pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metodi_pagamento (id, nome, descrizione) FROM stdin;
1	Carta di credito	Pagamento tramite carta bancaria
2	PayPal	Pagamento tramite account PayPal
\.


--
-- TOC entry 3436 (class 0 OID 25352)
-- Dependencies: 225
-- Data for Name: mezzi_trasporto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mezzi_trasporto (id, nome, codice, posti_disponibili) FROM stdin;
1	Bus Interregionale	BUS001	50
2	Treno Regionale	TR001	200
\.


--
-- TOC entry 3432 (class 0 OID 25324)
-- Dependencies: 221
-- Data for Name: pagamenti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagamenti (id, importo, data_ora, fk_prenotazione, fk_metodo) FROM stdin;
1	35.50	2025-04-01 10:25:00	1	1
2	62.00	2025-04-02 14:47:00	2	2
3	45.00	2025-04-03 09:05:00	3	1
4	80.00	2025-04-04 15:50:00	4	2
5	22.50	2025-04-05 11:25:00	5	1
6	58.90	2025-04-06 13:12:00	6	2
7	37.00	2025-04-07 18:03:00	7	1
\.


--
-- TOC entry 3426 (class 0 OID 25294)
-- Dependencies: 215
-- Data for Name: passeggeri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passeggeri (id, nome, cognome, data_nascita, telefono, email) FROM stdin;
1	Luca	Rossi	1990-04-12	3201234567	l.rossi@email.com
2	Anna	Bianchi	1985-11-25	3456789123	a.bianchi@email.com
3	Marco	Verdi	1993-07-21	3391122334	m.verdi@mail.com
4	Giulia	Neri	1998-05-15	3487788990	giulia.neri@mail.com
5	Elena	Russo	1982-03-02	3312244667	elena.russo@mail.com
6	Alessandro	Costa	1995-12-30	3425566778	a.costa@mail.com
7	Federica	De Luca	1990-01-11	3273344556	f.deluca@mail.com
\.


--
-- TOC entry 3428 (class 0 OID 25303)
-- Dependencies: 217
-- Data for Name: prenotazioni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prenotazioni (id, data_ora, fk_passeggero) FROM stdin;
1	2025-04-01 10:23:00	1
2	2025-04-02 14:45:00	2
3	2025-04-03 09:00:00	3
4	2025-04-04 15:45:00	4
5	2025-04-05 11:20:00	5
6	2025-04-06 13:10:00	1
7	2025-04-07 18:00:00	2
\.


--
-- TOC entry 3434 (class 0 OID 25343)
-- Dependencies: 223
-- Data for Name: stati_biglietto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stati_biglietto (id, nome, descrizione) FROM stdin;
1	valido	Biglietto utilizzabile per viaggiare
2	annullato	Biglietto non più valido
3	sostituito	Biglietto sostituito da un altro
\.


--
-- TOC entry 3440 (class 0 OID 25368)
-- Dependencies: 229
-- Data for Name: tratte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tratte (id, nome, durata, fk_mezzo) FROM stdin;
1	Milano - Roma via Bologna e Firenze	04:30:00	2
2	Milano - Bologna Diretto	02:00:00	1
3	Torino - Napoli via Parma, Bologna, Roma	07:30:00	2
4	Venezia - Firenze via Bologna	03:15:00	2
\.


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 232
-- Name: biglietti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.biglietti_id_seq', 14, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 230
-- Name: corse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.corse_id_seq', 11, true);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 226
-- Name: fermate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fermate_id_seq', 9, true);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 218
-- Name: metodi_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodi_pagamento_id_seq', 2, true);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 224
-- Name: mezzi_trasporto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mezzi_trasporto_id_seq', 2, true);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 220
-- Name: pagamenti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagamenti_id_seq', 7, true);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 214
-- Name: passeggeri_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passeggeri_id_seq', 7, true);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 216
-- Name: prenotazioni_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prenotazioni_id_seq', 7, true);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 222
-- Name: stati_biglietto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stati_biglietto_id_seq', 3, true);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 228
-- Name: tratte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tratte_id_seq', 4, true);


--
-- TOC entry 3262 (class 2606 OID 25397)
-- Name: biglietti biglietti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietti
    ADD CONSTRAINT biglietti_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 25422)
-- Name: composizioni composizioni_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composizioni
    ADD CONSTRAINT composizioni_pkey PRIMARY KEY (fk_tratta, fk_fermata);


--
-- TOC entry 3259 (class 2606 OID 25385)
-- Name: corse corse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corse
    ADD CONSTRAINT corse_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 25366)
-- Name: fermate fermate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fermate
    ADD CONSTRAINT fermate_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 2606 OID 25322)
-- Name: metodi_pagamento metodi_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodi_pagamento
    ADD CONSTRAINT metodi_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3250 (class 2606 OID 25359)
-- Name: mezzi_trasporto mezzi_trasporto_codice_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mezzi_trasporto
    ADD CONSTRAINT mezzi_trasporto_codice_key UNIQUE (codice);


--
-- TOC entry 3252 (class 2606 OID 25357)
-- Name: mezzi_trasporto mezzi_trasporto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mezzi_trasporto
    ADD CONSTRAINT mezzi_trasporto_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 25331)
-- Name: pagamenti pagamenti_fk_prenotazione_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamenti
    ADD CONSTRAINT pagamenti_fk_prenotazione_key UNIQUE (fk_prenotazione);


--
-- TOC entry 3246 (class 2606 OID 25329)
-- Name: pagamenti pagamenti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamenti
    ADD CONSTRAINT pagamenti_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 25301)
-- Name: passeggeri passeggeri_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggeri
    ADD CONSTRAINT passeggeri_email_key UNIQUE (email);


--
-- TOC entry 3235 (class 2606 OID 25299)
-- Name: passeggeri passeggeri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggeri
    ADD CONSTRAINT passeggeri_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 25308)
-- Name: prenotazioni prenotazioni_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazioni
    ADD CONSTRAINT prenotazioni_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 25350)
-- Name: stati_biglietto stati_biglietto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stati_biglietto
    ADD CONSTRAINT stati_biglietto_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 25373)
-- Name: tratte tratte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratte
    ADD CONSTRAINT tratte_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 1259 OID 25442)
-- Name: idx_biglietti_corsa_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_biglietti_corsa_id ON public.biglietti USING btree (fk_corsa);


--
-- TOC entry 3264 (class 1259 OID 25435)
-- Name: idx_biglietti_prenotazione_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_biglietti_prenotazione_id ON public.biglietti USING btree (fk_prenotazione);


--
-- TOC entry 3265 (class 1259 OID 25440)
-- Name: idx_biglietti_sostituito_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_biglietti_sostituito_id ON public.biglietti USING btree (fk_biglietto_sostituito);


--
-- TOC entry 3266 (class 1259 OID 25439)
-- Name: idx_biglietti_stato_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_biglietti_stato_id ON public.biglietti USING btree (fk_stato);


--
-- TOC entry 3269 (class 1259 OID 25437)
-- Name: idx_composizioni_fermata_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composizioni_fermata_id ON public.composizioni USING btree (fk_fermata);


--
-- TOC entry 3270 (class 1259 OID 25438)
-- Name: idx_composizioni_ordine; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composizioni_ordine ON public.composizioni USING btree (fk_tratta, ordine);


--
-- TOC entry 3271 (class 1259 OID 25436)
-- Name: idx_composizioni_tratta_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composizioni_tratta_id ON public.composizioni USING btree (fk_tratta);


--
-- TOC entry 3260 (class 1259 OID 25443)
-- Name: idx_corse_tratta_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_corse_tratta_id ON public.corse USING btree (fk_tratta);


--
-- TOC entry 3241 (class 1259 OID 25445)
-- Name: idx_pagamenti_metodo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pagamenti_metodo_id ON public.pagamenti USING btree (fk_metodo);


--
-- TOC entry 3242 (class 1259 OID 25434)
-- Name: idx_pagamenti_prenotazione_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pagamenti_prenotazione_id ON public.pagamenti USING btree (fk_prenotazione);


--
-- TOC entry 3236 (class 1259 OID 25433)
-- Name: idx_prenotazioni_passeggero_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_prenotazioni_passeggero_id ON public.prenotazioni USING btree (fk_passeggero);


--
-- TOC entry 3255 (class 1259 OID 25444)
-- Name: idx_tratte_mezzo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tratte_mezzo_id ON public.tratte USING btree (fk_mezzo);


--
-- TOC entry 3277 (class 2606 OID 25413)
-- Name: biglietti biglietti_fk_biglietto_sostituito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietti
    ADD CONSTRAINT biglietti_fk_biglietto_sostituito_fkey FOREIGN KEY (fk_biglietto_sostituito) REFERENCES public.biglietti(id);


--
-- TOC entry 3278 (class 2606 OID 25408)
-- Name: biglietti biglietti_fk_corsa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietti
    ADD CONSTRAINT biglietti_fk_corsa_fkey FOREIGN KEY (fk_corsa) REFERENCES public.corse(id);


--
-- TOC entry 3279 (class 2606 OID 25403)
-- Name: biglietti biglietti_fk_prenotazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietti
    ADD CONSTRAINT biglietti_fk_prenotazione_fkey FOREIGN KEY (fk_prenotazione) REFERENCES public.prenotazioni(id);


--
-- TOC entry 3280 (class 2606 OID 25398)
-- Name: biglietti biglietti_fk_stato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietti
    ADD CONSTRAINT biglietti_fk_stato_fkey FOREIGN KEY (fk_stato) REFERENCES public.stati_biglietto(id);


--
-- TOC entry 3281 (class 2606 OID 25428)
-- Name: composizioni composizioni_fk_fermata_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composizioni
    ADD CONSTRAINT composizioni_fk_fermata_fkey FOREIGN KEY (fk_fermata) REFERENCES public.fermate(id);


--
-- TOC entry 3282 (class 2606 OID 25423)
-- Name: composizioni composizioni_fk_tratta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composizioni
    ADD CONSTRAINT composizioni_fk_tratta_fkey FOREIGN KEY (fk_tratta) REFERENCES public.tratte(id);


--
-- TOC entry 3276 (class 2606 OID 25386)
-- Name: corse corse_fk_tratta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corse
    ADD CONSTRAINT corse_fk_tratta_fkey FOREIGN KEY (fk_tratta) REFERENCES public.tratte(id);


--
-- TOC entry 3273 (class 2606 OID 25337)
-- Name: pagamenti pagamenti_fk_metodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamenti
    ADD CONSTRAINT pagamenti_fk_metodo_fkey FOREIGN KEY (fk_metodo) REFERENCES public.metodi_pagamento(id);


--
-- TOC entry 3274 (class 2606 OID 25332)
-- Name: pagamenti pagamenti_fk_prenotazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamenti
    ADD CONSTRAINT pagamenti_fk_prenotazione_fkey FOREIGN KEY (fk_prenotazione) REFERENCES public.prenotazioni(id);


--
-- TOC entry 3272 (class 2606 OID 25309)
-- Name: prenotazioni prenotazioni_fk_passeggero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazioni
    ADD CONSTRAINT prenotazioni_fk_passeggero_fkey FOREIGN KEY (fk_passeggero) REFERENCES public.passeggeri(id);


--
-- TOC entry 3275 (class 2606 OID 25374)
-- Name: tratte tratte_fk_mezzo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratte
    ADD CONSTRAINT tratte_fk_mezzo_fkey FOREIGN KEY (fk_mezzo) REFERENCES public.mezzi_trasporto(id);


-- Completed on 2025-04-01 23:31:16

--
-- PostgreSQL database dump complete
--

