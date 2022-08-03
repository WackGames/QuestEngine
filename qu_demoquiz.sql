--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: qe_demoquiz; Type: TABLE; Schema: public; Owner: leviapp
--

CREATE TABLE public.qe_demoquiz (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(400) NOT NULL,
    img_url character varying(400) NOT NULL,
    category character varying(40) NOT NULL,
    subcategory character varying(40) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    tags jsonb NOT NULL
);


ALTER TABLE public.qe_demoquiz OWNER TO leviapp;

--
-- Name: qe_demoquiz_id_seq; Type: SEQUENCE; Schema: public; Owner: leviapp
--

CREATE SEQUENCE public.qe_demoquiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qe_demoquiz_id_seq OWNER TO leviapp;

--
-- Name: qe_demoquiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leviapp
--

ALTER SEQUENCE public.qe_demoquiz_id_seq OWNED BY public.qe_demoquiz.id;


--
-- Name: qe_demoquiz id; Type: DEFAULT; Schema: public; Owner: leviapp
--

ALTER TABLE ONLY public.qe_demoquiz ALTER COLUMN id SET DEFAULT nextval('public.qe_demoquiz_id_seq'::regclass);


--
-- Data for Name: qe_demoquiz; Type: TABLE DATA; Schema: public; Owner: leviapp
--

COPY public.qe_demoquiz (id, name, description, img_url, category, subcategory, created_at, updated_at, tags) FROM stdin;
1	Animal Match	This is a quiz to test your animal knowledge.	https://res.cloudinary.com/dk-find-out/image/upload/q_80,w_1920,f_auto/Animal_kingdom_nzwbda.jpg	Ecology		2022-07-08 21:31:01.461227-06	2022-07-08 21:31:01.461253-06	{}
2	Spelling Bee	This is a quiz to test your spelling.	https://www.sccpss.com/schools/abw/PublishingImages/Spelling%20Bee%202021.JPG	English		2022-07-08 21:37:06.851704-06	2022-07-08 21:37:06.85173-06	{}
3	Math-a-Maze	This is a quiz to test your math skills.	https://img.freepik.com/free-vector/hand-drawn-mathematical-symbols_23-2148764926.jpg?w=2000	Math		2022-07-08 21:55:40.349952-06	2022-07-08 21:55:40.349977-06	{}
4	Artisan	This is a quiz to discover your artistic side.	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa0jX57AEbdiuSHs75N85rYSXH0TTCUThMXA&usqp=CAU	Art		2022-07-08 22:04:15.587237-06	2022-07-08 22:04:15.587262-06	{}
\.


--
-- Name: qe_demoquiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leviapp
--

SELECT pg_catalog.setval('public.qe_demoquiz_id_seq', 4, true);


--
-- Name: qe_demoquiz qe_demoquiz_pkey; Type: CONSTRAINT; Schema: public; Owner: leviapp
--

ALTER TABLE ONLY public.qe_demoquiz
    ADD CONSTRAINT qe_demoquiz_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

