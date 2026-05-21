--
-- PostgreSQL database dump
--

\restrict 59NVoVyuq5wcoqdAmGhTML43FhZgnkXyYxN49YsfxlEBw3LWyndfQufptRbY9TX

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-05-21 10:43:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 222 (class 1259 OID 73921)
-- Name: ports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ports (
    port_id integer NOT NULL,
    port_name character varying(100) NOT NULL,
    country character varying(100),
    city character varying(100)
);


ALTER TABLE public.ports OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 73920)
-- Name: ports_port_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ports_port_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ports_port_id_seq OWNER TO postgres;

--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 221
-- Name: ports_port_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ports_port_id_seq OWNED BY public.ports.port_id;


--
-- TOC entry 220 (class 1259 OID 73910)
-- Name: ships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ships (
    ship_id integer NOT NULL,
    ship_name character varying(100) NOT NULL,
    ship_type character varying(50) NOT NULL,
    capacity integer NOT NULL,
    owner_company character varying(100),
    status character varying(30)
);


ALTER TABLE public.ships OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 73909)
-- Name: ships_ship_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ships_ship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ships_ship_id_seq OWNER TO postgres;

--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 219
-- Name: ships_ship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ships_ship_id_seq OWNED BY public.ships.ship_id;


--
-- TOC entry 224 (class 1259 OID 73930)
-- Name: voyages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voyages (
    voyage_id integer NOT NULL,
    ship_id integer,
    source_port_id integer,
    destination_port_id integer,
    departure_time timestamp without time zone,
    arrival_time timestamp without time zone,
    cargo_weight double precision,
    status character varying(30)
);


ALTER TABLE public.voyages OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 73929)
-- Name: voyages_voyage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voyages_voyage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.voyages_voyage_id_seq OWNER TO postgres;

--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 223
-- Name: voyages_voyage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voyages_voyage_id_seq OWNED BY public.voyages.voyage_id;


--
-- TOC entry 4867 (class 2604 OID 73924)
-- Name: ports port_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ports ALTER COLUMN port_id SET DEFAULT nextval('public.ports_port_id_seq'::regclass);


--
-- TOC entry 4866 (class 2604 OID 73913)
-- Name: ships ship_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ships ALTER COLUMN ship_id SET DEFAULT nextval('public.ships_ship_id_seq'::regclass);


--
-- TOC entry 4868 (class 2604 OID 73933)
-- Name: voyages voyage_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voyages ALTER COLUMN voyage_id SET DEFAULT nextval('public.voyages_voyage_id_seq'::regclass);


--
-- TOC entry 5028 (class 0 OID 73921)
-- Dependencies: 222
-- Data for Name: ports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ports (port_id, port_name, country, city) FROM stdin;
1	Mumbai Port	India	Mumbai
2	Dubai Port	UAE	Dubai
3	Singapore Port	Singapore	Singapore
4	Mumbai Port	India	Mumbai
5	Mumbai Port	India	Mumbai
\.


--
-- TOC entry 5026 (class 0 OID 73910)
-- Dependencies: 220
-- Data for Name: ships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ships (ship_id, ship_name, ship_type, capacity, owner_company, status) FROM stdin;
1	Ocean King	Cargo	50000	BlueWave Logistics	ACTIVE
2	Sea Titan	Oil Tanker	90000	MarineX	ACTIVE
3	Ocean King	Cargo	50000	BlueWave Logistics	ACTIVE
4	Ocean King	Cargo	50000	BlueWave Logistics	ACTIVE
5	Ocean King	Cargo	50000	BlueWave Logistics	ACTIVE
6	Ocean King	Cargo	50000	BlueWave Logistics	ACTIVE
\.


--
-- TOC entry 5030 (class 0 OID 73930)
-- Dependencies: 224
-- Data for Name: voyages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voyages (voyage_id, ship_id, source_port_id, destination_port_id, departure_time, arrival_time, cargo_weight, status) FROM stdin;
1	1	1	2	2026-05-17 19:23:47.304409	2026-05-22 19:23:47.304409	25000	IN_TRANSIT
2	1	1	2	2026-05-21 10:12:04.646	2026-05-26 10:12:04.646	25000	IN_TRANSIT
3	1	1	2	2026-05-21 10:12:24.158	2026-05-26 10:12:24.158	25000	IN_TRANSIT
\.


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 221
-- Name: ports_port_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ports_port_id_seq', 5, true);


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 219
-- Name: ships_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ships_ship_id_seq', 6, true);


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 223
-- Name: voyages_voyage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voyages_voyage_id_seq', 3, true);


--
-- TOC entry 4872 (class 2606 OID 73928)
-- Name: ports ports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ports
    ADD CONSTRAINT ports_pkey PRIMARY KEY (port_id);


--
-- TOC entry 4870 (class 2606 OID 73919)
-- Name: ships ships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ships
    ADD CONSTRAINT ships_pkey PRIMARY KEY (ship_id);


--
-- TOC entry 4874 (class 2606 OID 73936)
-- Name: voyages voyages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voyages
    ADD CONSTRAINT voyages_pkey PRIMARY KEY (voyage_id);


--
-- TOC entry 4875 (class 2606 OID 73947)
-- Name: voyages voyages_destination_port_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voyages
    ADD CONSTRAINT voyages_destination_port_id_fkey FOREIGN KEY (destination_port_id) REFERENCES public.ports(port_id);


--
-- TOC entry 4876 (class 2606 OID 73937)
-- Name: voyages voyages_ship_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voyages
    ADD CONSTRAINT voyages_ship_id_fkey FOREIGN KEY (ship_id) REFERENCES public.ships(ship_id);


--
-- TOC entry 4877 (class 2606 OID 73942)
-- Name: voyages voyages_source_port_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voyages
    ADD CONSTRAINT voyages_source_port_id_fkey FOREIGN KEY (source_port_id) REFERENCES public.ports(port_id);


-- Completed on 2026-05-21 10:43:09

--
-- PostgreSQL database dump complete
--

\unrestrict 59NVoVyuq5wcoqdAmGhTML43FhZgnkXyYxN49YsfxlEBw3LWyndfQufptRbY9TX

