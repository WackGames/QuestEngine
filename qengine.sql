--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)
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

--
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: u3hh3pd4rk21gv
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO u3hh3pd4rk21gv;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO inmntgxeunxghp;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO inmntgxeunxghp;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO inmntgxeunxghp;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authen_user; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.authen_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(255) NOT NULL,
    is_staff boolean NOT NULL,
    role character varying(40) NOT NULL
);


ALTER TABLE public.authen_user OWNER TO inmntgxeunxghp;

--
-- Name: authen_user_groups; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.authen_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.authen_user_groups OWNER TO inmntgxeunxghp;

--
-- Name: authen_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.authen_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authen_user_groups_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: authen_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.authen_user_groups_id_seq OWNED BY public.authen_user_groups.id;


--
-- Name: authen_user_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.authen_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authen_user_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: authen_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.authen_user_id_seq OWNED BY public.authen_user.id;


--
-- Name: authen_user_user_permissions; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.authen_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.authen_user_user_permissions OWNER TO inmntgxeunxghp;

--
-- Name: authen_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.authen_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authen_user_user_permissions_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: authen_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.authen_user_user_permissions_id_seq OWNED BY public.authen_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO inmntgxeunxghp;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO inmntgxeunxghp;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO inmntgxeunxghp;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO inmntgxeunxghp;

--
-- Name: qe_demoquestion; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.qe_demoquestion (
    id integer NOT NULL,
    img_url character varying(400) NOT NULL,
    question text NOT NULL,
    answer jsonb[] NOT NULL,
    solution jsonb[] NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    tags jsonb NOT NULL,
    quiz_id_id integer NOT NULL
);


ALTER TABLE public.qe_demoquestion OWNER TO inmntgxeunxghp;

--
-- Name: qe_demoquestion_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.qe_demoquestion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qe_demoquestion_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: qe_demoquestion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.qe_demoquestion_id_seq OWNED BY public.qe_demoquestion.id;


--
-- Name: qe_demoquiz; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
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


ALTER TABLE public.qe_demoquiz OWNER TO inmntgxeunxghp;

--
-- Name: qe_demoquiz_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.qe_demoquiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qe_demoquiz_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: qe_demoquiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.qe_demoquiz_id_seq OWNED BY public.qe_demoquiz.id;


--
-- Name: qe_game; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.qe_game (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(400) NOT NULL,
    img_url character varying(400) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    tags jsonb NOT NULL
);


ALTER TABLE public.qe_game OWNER TO inmntgxeunxghp;

--
-- Name: qe_game_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.qe_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qe_game_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: qe_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.qe_game_id_seq OWNED BY public.qe_game.id;


--
-- Name: qe_question; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.qe_question (
    id integer NOT NULL,
    img_url character varying(400) NOT NULL,
    question text NOT NULL,
    answer jsonb[] NOT NULL,
    solution jsonb[] NOT NULL,
    best_time numeric(8,2) NOT NULL,
    time_limit numeric(8,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    tags jsonb NOT NULL,
    quiz_id_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.qe_question OWNER TO inmntgxeunxghp;

--
-- Name: qe_question_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.qe_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qe_question_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: qe_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.qe_question_id_seq OWNED BY public.qe_question.id;


--
-- Name: qe_quiz; Type: TABLE; Schema: public; Owner: inmntgxeunxghp
--

CREATE TABLE public.qe_quiz (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(400) NOT NULL,
    img_url character varying(400) NOT NULL,
    category character varying(40) NOT NULL,
    subcategory character varying(40) NOT NULL,
    best_score numeric(8,2) NOT NULL,
    best_time numeric(8,2) NOT NULL,
    time_limit numeric(8,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    curr_score numeric(8,2) NOT NULL,
    curr_time numeric(8,2) NOT NULL,
    tags jsonb NOT NULL
);


ALTER TABLE public.qe_quiz OWNER TO inmntgxeunxghp;

--
-- Name: qe_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: inmntgxeunxghp
--

CREATE SEQUENCE public.qe_quiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qe_quiz_id_seq OWNER TO inmntgxeunxghp;

--
-- Name: qe_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inmntgxeunxghp
--

ALTER SEQUENCE public.qe_quiz_id_seq OWNED BY public.qe_quiz.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: authen_user id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user ALTER COLUMN id SET DEFAULT nextval('public.authen_user_id_seq'::regclass);


--
-- Name: authen_user_groups id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user_groups ALTER COLUMN id SET DEFAULT nextval('public.authen_user_groups_id_seq'::regclass);


--
-- Name: authen_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.authen_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: qe_demoquestion id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_demoquestion ALTER COLUMN id SET DEFAULT nextval('public.qe_demoquestion_id_seq'::regclass);


--
-- Name: qe_demoquiz id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_demoquiz ALTER COLUMN id SET DEFAULT nextval('public.qe_demoquiz_id_seq'::regclass);


--
-- Name: qe_game id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_game ALTER COLUMN id SET DEFAULT nextval('public.qe_game_id_seq'::regclass);


--
-- Name: qe_question id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_question ALTER COLUMN id SET DEFAULT nextval('public.qe_question_id_seq'::regclass);


--
-- Name: qe_quiz id; Type: DEFAULT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_quiz ALTER COLUMN id SET DEFAULT nextval('public.qe_quiz_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add game	6	add_game
22	Can change game	6	change_game
23	Can delete game	6	delete_game
24	Can view game	6	view_game
25	Can add quiz	7	add_quiz
26	Can change quiz	7	change_quiz
27	Can delete quiz	7	delete_quiz
28	Can view quiz	7	view_quiz
29	Can add question	8	add_question
30	Can change question	8	change_question
31	Can delete question	8	delete_question
32	Can view question	8	view_question
33	Can add demo quiz	9	add_demoquiz
34	Can change demo quiz	9	change_demoquiz
35	Can delete demo quiz	9	delete_demoquiz
36	Can view demo quiz	9	view_demoquiz
37	Can add demo question	10	add_demoquestion
38	Can change demo question	10	change_demoquestion
39	Can delete demo question	10	delete_demoquestion
40	Can view demo question	10	view_demoquestion
41	Can add user	11	add_user
42	Can change user	11	change_user
43	Can delete user	11	delete_user
44	Can view user	11	view_user
\.


--
-- Data for Name: authen_user; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.authen_user (id, password, last_login, is_superuser, username, first_name, last_name, is_active, date_joined, email, is_staff, role) FROM stdin;
2	pbkdf2_sha256$150000$HGU3JUjcKAW5$j/7AcANtUXPgc3RxoXPxp37WHF80kwGZ+DqNEHnm8X8=	\N	f	AshleyJ	Ashley	Jungers	t	2022-08-15 20:38:36.863348+00	ash.jungers01@gmail.com	f	admin
1	pbkdf2_sha256$150000$qaLMXUELBhtz$PUfVLwGZlCiCdz7W/Hqowu5UJ6toy5xJUlC59LzjQzk=	2022-08-27 22:38:41.329425+00	t	LeviApp	Levi	Appenfelder	t	2022-08-03 05:15:12.200646+00	levij.app@gmail.com	t	admin
\.


--
-- Data for Name: authen_user_groups; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.authen_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: authen_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.authen_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	qe	game
7	qe	quiz
8	qe	question
9	qe	demoquiz
10	qe	demoquestion
11	authen	user
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-08-02 23:06:10.898035+00
2	contenttypes	0002_remove_content_type_name	2022-08-02 23:06:10.923281+00
3	auth	0001_initial	2022-08-02 23:06:10.945939+00
4	auth	0002_alter_permission_name_max_length	2022-08-02 23:06:10.978422+00
5	auth	0003_alter_user_email_max_length	2022-08-02 23:06:10.985087+00
6	auth	0004_alter_user_username_opts	2022-08-02 23:06:10.991786+00
7	auth	0005_alter_user_last_login_null	2022-08-02 23:06:10.998262+00
8	auth	0006_require_contenttypes_0002	2022-08-02 23:06:11.001515+00
9	auth	0007_alter_validators_add_error_messages	2022-08-02 23:06:11.009689+00
10	auth	0008_alter_user_username_max_length	2022-08-02 23:06:11.016636+00
11	auth	0009_alter_user_last_name_max_length	2022-08-02 23:06:11.023103+00
12	auth	0010_alter_group_name_max_length	2022-08-02 23:06:11.031876+00
13	auth	0011_update_proxy_permissions	2022-08-02 23:06:11.038862+00
14	authen	0001_initial	2022-08-02 23:06:11.067353+00
15	admin	0001_initial	2022-08-02 23:06:11.103564+00
16	admin	0002_logentry_remove_auto_add	2022-08-02 23:06:11.120422+00
17	admin	0003_logentry_add_action_flag_choices	2022-08-02 23:06:11.128933+00
18	authen	0002_auto_20220708_2030	2022-08-02 23:06:11.146164+00
19	authen	0003_user_is_staff	2022-08-02 23:06:11.156475+00
20	authen	0004_user_role	2022-08-02 23:06:11.168668+00
21	qe	0001_initial	2022-08-02 23:06:11.200299+00
22	qe	0002_demoquestion_demoquiz	2022-08-02 23:06:11.22671+00
23	qe	0003_auto_20220709_1624	2022-08-02 23:06:11.257342+00
24	qe	0004_auto_20220709_1625	2022-08-02 23:06:11.295135+00
25	sessions	0001_initial	2022-08-02 23:06:11.310077+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: qe_demoquestion; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.qe_demoquestion (id, img_url, question, answer, solution, created_at, updated_at, tags, quiz_id_id) FROM stdin;
7		6 + 4 x 2 =	{"{\\"a\\": \\"12\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"14\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"16\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"20\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"26\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"14\\", \\"id\\": 2, \\"img_url\\": \\"\\"}"}	2022-07-09 16:49:34.220449+00	2022-07-10 05:03:04.057846+00	{}	3
11		10 - 8 + 6 / 2 × 3 =	{"{\\"a\\": \\"12\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"3\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"11\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"21\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"-2\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"11\\", \\"id\\": 3, \\"img_url\\": \\"\\"}"}	2022-07-09 21:59:30.405138+00	2022-07-10 05:11:55.967634+00	{}	3
10	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXMqD9lVySxlTrmCd2Xc4OObDmAqnOetpWng&usqp=CAU	What is the formula for the area of a triangle?	{"{\\"a\\": \\"0.5×b×h\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"b×h\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"2×b×h\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"3×b×h\\", \\"id\\": 4, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"0.5×b×h\\", \\"id\\": 1, \\"img_url\\": \\"\\"}"}	2022-07-09 20:56:25.021283+00	2022-07-09 20:56:25.021305+00	{}	3
12		How many feet are in a mile?	{"{\\"a\\": \\"3,775\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"5,280\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"4,160\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"8,215\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"6,590\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"5,280\\", \\"id\\": 2, \\"img_url\\": \\"\\"}"}	2022-07-09 22:04:53.383749+00	2022-07-10 05:13:21.868977+00	{}	3
8		Find all of the prime numbers.	{"{\\"a\\": \\"1\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"2\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"3\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"4\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"5\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"6\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"7\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"8\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"9\\", \\"id\\": 9, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"2\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"s\\": \\"3\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"s\\": \\"5\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"s\\": \\"7\\", \\"id\\": 7, \\"img_url\\": \\"\\"}"}	2022-07-09 19:35:00.478169+00	2022-07-10 05:06:30.841254+00	{}	3
9		Select all the numbers that are evenly divided by 9.	{"{\\"a\\": \\"19\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"27\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"38\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"45\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"54\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"126\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"531\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"699\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"772\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"837\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"27\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"s\\": \\"45\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"s\\": \\"54\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"s\\": \\"126\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"s\\": \\"531\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"s\\": \\"837\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	2022-07-09 20:46:42.051796+00	2022-07-10 05:09:55.328587+00	{}	3
13	https://mathcracker.com/images/legacy/root-of-64.png	What are the square roots of 64?	{"{\\"a\\": \\"-128\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"-32\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"-8\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"+8\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"+32\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"+128\\", \\"id\\": 6, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"-8\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"s\\": \\"+8\\", \\"id\\": 4, \\"img_url\\": \\"\\"}"}	2022-07-09 22:28:59.035927+00	2022-07-10 05:14:40.161207+00	{}	3
14	https://cdn.kastatic.org/googleusercontent/PL7T4LbneYVx9zZfLwEQiLYO5ZVXC4czPooPI8Byosp7auuleJgGd_70BKQ_re2xxKtN2YqLSZHv0nUhU6iXrd7P	Solve for t in this equation.	{"{\\"a\\": \\"7\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"14\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"1\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"3\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"5\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"-2\\", \\"id\\": 6, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"1\\", \\"id\\": 3, \\"img_url\\": \\"\\"}"}	2022-07-09 22:42:47.528835+00	2022-07-10 05:16:21.142296+00	{}	3
15	https://cdn.kastatic.org/googleusercontent/PL7T4LbneYVx9zZfLwEQiLYO5ZVXC4czPooPI8Byosp7auuleJgGd_70BKQ_re2xxKtN2YqLSZHv0nUhU6iXrd7P	What is the math symbol for an integral?	{"{\\"a\\": \\"\\", \\"id\\": 1, \\"img_url\\": \\"https://e7.pngegg.com/pngimages/162/63/png-clipart-black-text-screenshot-integral-symbol-mathematics-calculus-mathematician-violin-monochrome-violin.png\\"}","{\\"a\\": \\"\\", \\"id\\": 2, \\"img_url\\": \\"https://e7.pngegg.com/pngimages/726/762/png-clipart-sigma-greek-alphabet-symbol-phi-summation-symbol-miscellaneous-angle-thumbnail.png\\"}","{\\"a\\": \\"\\", \\"id\\": 3, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Infinite.svg/1200px-Infinite.svg.png\\"}","{\\"a\\": \\"\\", \\"id\\": 4, \\"img_url\\": \\"https://i0.wp.com/degreessymbolmac.com/wp-content/uploads/2020/04/pi-1327145_1920.png?fit=1200%2C1161&ssl=1\\"}"}	{"{\\"s\\": \\"\\", \\"id\\": 1, \\"img_url\\": \\"https://e7.pngegg.com/pngimages/162/63/png-clipart-black-text-screenshot-integral-symbol-mathematics-calculus-mathematician-violin-monochrome-violin.png\\"}"}	2022-07-09 22:55:27.874247+00	2022-07-09 22:55:27.87427+00	{}	3
16		Which of these angles are obtuse?	{"{\\"a\\": \\"90°\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"60°\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"45°\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"97°\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"103°\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"21°\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"134°\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"179°\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"8°\\", \\"id\\": 4, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"97°\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"s\\": \\"103°\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"s\\": \\"134°\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"s\\": \\"179°\\", \\"id\\": 8, \\"img_url\\": \\"\\"}"}	2022-07-09 23:13:16.606302+00	2022-07-09 23:13:16.606323+00	{}	3
18	https://www.mechamath.com/wp-content/uploads/2021/07/diagram-of-supplementary-angles.png?ezimgfmt=ng:webp/ngcb83	What kind of angles are these?	{"{\\"a\\": \\"Supplementary\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"Complementary\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"Corresponding\\", \\"id\\": 3, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"Supplementary\\", \\"id\\": 1, \\"img_url\\": \\"\\"}"}	2022-07-09 23:42:01.310313+00	2022-07-09 23:42:01.310335+00	{}	3
19	https://study.com/cimages/multimages/16/transversal.png	Select all of the angles equal to A	{"{\\"a\\": \\"B\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"C\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"D\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"E\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"F\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"G\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"H\\", \\"id\\": 7, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"D\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"s\\": \\"E\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"s\\": \\"H\\", \\"id\\": 7, \\"img_url\\": \\"\\"}"}	2022-07-09 23:55:42.395448+00	2022-07-09 23:55:42.395471+00	{}	3
20		What method would you use to expand this expression? | (x + 2)(4x - 3) = 10	{"{\\"a\\": \\"ZEROS\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"FOIL\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"ROUNDING\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"SINE\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"COSINE\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"TANGENT\\", \\"id\\": 6, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"FOIL\\", \\"id\\": 2, \\"img_url\\": \\"\\"}"}	2022-07-10 00:25:20.535058+00	2022-07-10 00:25:20.535082+00	{}	3
21		What is the circumference of a circle?	{"{\\"a\\": \\"2r\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"2πr\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"πr\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"πr²\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"2π\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"2πr²\\", \\"id\\": 6, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"2πr\\", \\"id\\": 2, \\"img_url\\": \\"\\"}"}	2022-07-10 02:46:42.831958+00	2022-07-10 02:46:42.831988+00	{}	3
22		Solve for X in this equation | 34 - 2X > 10	{"{\\"a\\": \\"X < 22\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"X > 22\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"X < 24\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"X > 24\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"X = -12\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"X > -12\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"X = 22\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"X < 12\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"X = 12\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"X > 12\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"X < 12\\", \\"id\\": 8, \\"img_url\\": \\"\\"}"}	2022-07-10 03:05:55.549891+00	2022-07-10 03:05:55.549912+00	{}	3
23	https://www.inchcalculator.com/wp-content/uploads/2020/07/long-division-calculation-step-1.png	What is the remainder after dividing 75 by 4?	{"{\\"a\\": \\"1\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"2\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"3\\", \\"id\\": 3, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"3\\", \\"id\\": 3, \\"img_url\\": \\"\\"}"}	2022-07-10 03:35:14.100704+00	2022-07-10 03:35:14.100727+00	{}	3
24	https://www.inchcalculator.com/wp-content/uploads/2020/07/long-division-calculation-step-1.png	What is the LCM (Lowest Common Multiple) of 4 and 6?	{"{\\"a\\": \\"2\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"4\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"6\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"10\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"12\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"16\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"24\\", \\"id\\": 7, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"12\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	2022-07-10 03:35:55.601367+00	2022-07-10 03:35:55.601389+00	{}	3
25		What is the GCF (Greatest Common Factor) of 16, 24, and 36?	{"{\\"a\\": \\"2\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"4\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"6\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"8\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"12\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"4\\", \\"id\\": 2, \\"img_url\\": \\"\\"}"}	2022-07-10 03:46:39.176217+00	2022-07-10 03:46:39.176237+00	{}	3
26		Select all of the factors of 12.	{"{\\"a\\": \\"1\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"2\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"3\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"4\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"5\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"6\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"7\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"8\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"9\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"10\\", \\"id\\": 10, \\"img_url\\": \\"\\"}","{\\"a\\": \\"11\\", \\"id\\": 11, \\"img_url\\": \\"\\"}","{\\"a\\": \\"12\\", \\"id\\": 12, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"1\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"s\\": \\"2\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"s\\": \\"3\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"s\\": \\"4\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"s\\": \\"6\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"s\\": \\"12\\", \\"id\\": 12, \\"img_url\\": \\"\\"}"}	2022-07-10 04:07:52.916823+00	2022-07-10 04:07:52.916852+00	{}	3
17	https://vt-vtwa-assets.varsitytutors.com/vt-vtwa/uploads/problem_question_image/image/3849/Axes_1.jpg	Which coordinates does the black point have?	{"{\\"a\\": \\"(3 , 7)\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"(7 , 3)\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"(-3 , 7)\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"(3 , -7)\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"(7 , -3)\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"(-7 , -3)\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"(-7 , 3)\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"(-3 , -7)\\", \\"id\\": 8, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"(-7 , 3)\\", \\"id\\": 7, \\"img_url\\": \\"\\"}"}	2022-07-09 23:30:02.394396+00	2022-07-10 05:18:43.129443+00	{}	3
28		Choose the correct spelling.	{"{\\"a\\": \\"recieving\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"receiveing\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"receiving\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"receeving\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"recieveing\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"resieving\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"reseiving\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"reseiveing\\", \\"id\\": 8, \\"img_url\\": \\"\\"}"}	{"{\\"a\\": \\"receiving\\", \\"id\\": 3, \\"img_url\\": \\"\\"}"}	2022-07-15 22:55:25.767093+00	2022-07-15 22:55:25.767115+00	{}	2
29		Choose all of the words spelled incorrectly.	{"{\\"a\\": \\"beautiful\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"wildebeest\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"creation\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"envasion\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"enough\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"sentance\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"adventur\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"colomn\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"chorus\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"hidrate\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"envasion\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"s\\": \\"sentance\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"s\\": \\"adventur\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"s\\": \\"colomn\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"s\\": \\"hidrate\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	2022-07-15 23:19:12.75595+00	2022-07-15 23:19:12.755972+00	{}	2
30		Choose all of the words spelled correctly.	{"{\\"a\\": \\"phrase\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"wether\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"alligater\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"height\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"fantom\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"cavelry\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"feat\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"terible\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"amasing\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"musician\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"phrase\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"s\\": \\"height\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"s\\": \\"feat\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"s\\": \\"musician\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	2022-07-15 23:39:58.670382+00	2022-07-15 23:39:58.67041+00	{}	2
31		Choose the incorrect spelling.	{"{\\"a\\": \\"putting\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"rotating\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"momentous\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"walruss\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"relief\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"lein\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"clarify\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"terrify\\", \\"id\\": 8, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"walruss\\", \\"id\\": 4, \\"img_url\\": \\"\\"}"}	2022-07-15 23:54:47.751164+00	2022-07-15 23:54:47.751191+00	{}	2
32		Select the correct plural version of this word. -- party --	{"{\\"a\\": \\"partys\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"parties\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"partyes\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"partees\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"partis\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"parties\\", \\"id\\": 2, \\"img_url\\": \\"\\"}"}	2022-07-16 01:55:10.701759+00	2022-07-16 01:55:10.701782+00	{}	2
33		Select the correct plural version of this word. -- toy --	{"{\\"a\\": \\"toies\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"tois\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"toyes\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"toys\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"toyys\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"toys\\", \\"id\\": 4, \\"img_url\\": \\"\\"}"}	2022-07-16 01:59:21.021783+00	2022-07-16 01:59:21.021805+00	{}	2
34		Select the correct plural version of this word. -- class --	{"{\\"a\\": \\"clases\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"classs\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"classes\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"classies\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"class\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"classes\\", \\"id\\": 3, \\"img_url\\": \\"\\"}"}	2022-07-16 02:05:44.966605+00	2022-07-16 02:05:44.966626+00	{}	2
35		Select the correct versions of this word. -- fix --	{"{\\"a\\": \\"fixed\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"fixs\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"fixied\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"fixes\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"fixing\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"fixasion\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"fixation\\", \\"id\\": 7, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"fixed\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"s\\": \\"fixes\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"s\\": \\"fixing\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"fixation\\", \\"id\\": 7, \\"img_url\\": \\"\\"}"}	2022-07-16 02:12:21.791551+00	2022-07-16 02:12:21.791575+00	{}	2
36		Select the correct versions of this word. -- lead --	{"{\\"a\\": \\"leadding\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"led\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"leader\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"leaded\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"leador\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"leds\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"leads\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"leading\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"leadds\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"leades\\", \\"id\\": 9, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"led\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"s\\": \\"leader\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"s\\": \\"leads\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"s\\": \\"leading\\", \\"id\\": 8, \\"img_url\\": \\"\\"}"}	2022-07-16 02:22:47.96519+00	2022-07-16 02:22:47.965213+00	{}	2
37		Select the correct plural versions of these words.	{"{\\"a\\": \\"childs\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"children\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"gooses\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"geese\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"lilies\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"lilyes\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"bonusses\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"bonuses\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"pastures\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"pasturres\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"a\\": \\"children\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"geese\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"lilies\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"bonuses\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"pastures\\", \\"id\\": 9, \\"img_url\\": \\"\\"}"}	2022-07-16 02:50:56.912925+00	2022-07-16 02:50:56.912946+00	{}	2
38		Select the correct plural versions of these words.	{"{\\"a\\": \\"nuclei\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"nucleuses\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"zoos\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"zooes\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"bisons\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"bison\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"trees\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"treees\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"monkeys\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"monkeies\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"nuclei\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"s\\": \\"zoos\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"s\\": \\"bison\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"s\\": \\"trees\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"s\\": \\"monkeys\\", \\"id\\": 9, \\"img_url\\": \\"\\"}"}	2022-07-16 02:55:10.64457+00	2022-07-16 02:55:10.644591+00	{}	2
39		Find the misspelled words.	{"{\\"a\\": \\"constructive\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"ornery\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"adacity\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"curageous\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"greatful\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"position\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"rhinocerus\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"straght\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"mosaic\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"bottel\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"adacity\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"s\\": \\"curageous\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"s\\": \\"greatful\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"s\\": \\"rhinocerus\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"s\\": \\"straght\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"s\\": \\"bottel\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	2022-07-16 05:49:52.497132+00	2022-07-16 05:49:52.497154+00	{}	2
40		Find the misspelled words.	{"{\\"a\\": \\"aknowledge\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"reesoning\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"realize\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"fiery\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"heirloom\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"suround\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"bushel\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"dimond\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"fourty\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"knead\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"aknowledge\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"s\\": \\"reesoning\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"s\\": \\"suround\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"s\\": \\"dimond\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"s\\": \\"fourty\\", \\"id\\": 9, \\"img_url\\": \\"\\"}"}	2022-07-16 06:17:45.447747+00	2022-07-16 06:17:45.447783+00	{}	2
41		Find the misspelled words.	{"{\\"a\\": \\"hideous\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"conscience\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"coud\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"again\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"flourish\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"porcupine\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"indication\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"octogan\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"whet\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"mishion\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"coud\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"s\\": \\"octogan\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"s\\": \\"mishion\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	2022-07-16 19:26:17.574656+00	2022-07-16 19:26:17.574749+00	{}	2
43		Which animal does not belong?	{"{\\"a\\": \\"TURTLE\\", \\"id\\": 1, \\"img_url\\": \\"https://assets.petco.com/petco/image/upload/f_auto,q_auto/aquatic-turtle-care-sheet-hero\\"}","{\\"a\\": \\"FROG\\", \\"id\\": 2, \\"img_url\\": \\"https://images.theconversation.com/files/416907/original/file-20210819-13-vseajg.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=900.0&fit=crop\\"}","{\\"a\\": \\"SALAMANDER\\", \\"id\\": 3, \\"img_url\\": \\"https://ymcagbw.org/sites/default/files/styles/node_blog/public/2020-03/spotted_salamander.jpg.webp?itok=5UiyToWf\\"}","{\\"a\\": \\"TOAD\\", \\"id\\": 4, \\"img_url\\": \\"https://mdc.mo.gov/sites/default/files/styles/card_regular/public/mo_nature/media/images/2010/05/american_toad.jpg?itok=i1O9mPT2\\"}","{\\"a\\": \\"NEWT\\", \\"id\\": 5, \\"img_url\\": \\"https://outsidetype.com/wp-content/uploads/elementor/thumbs/Title-newt-2-small-ovhj3xycj9aminys4haljn5d16kdkou304vl1uizyg.jpg\\"}","{\\"a\\": \\"CAECILIAN\\", \\"id\\": 6, \\"img_url\\": \\"https://www.australiangeographic.com.au/wp-content/uploads/2019/05/caecilian.jpg\\"}"}	{"{\\"s\\": \\"TURTLE\\", \\"id\\": 1, \\"img_url\\": \\"https://assets.petco.com/petco/image/upload/f_auto,q_auto/aquatic-turtle-care-sheet-hero\\"}"}	2022-07-16 22:20:38.896371+00	2022-07-16 22:20:38.896396+00	{}	1
44		Which animal does not belong?	{"{\\"a\\": \\"FLY\\", \\"id\\": 1, \\"img_url\\": \\"https://a-z-animals.com/media/2021/10/Animals-With-The-Shortest-Lifespan-Housefly-1024x535.jpg\\"}","{\\"a\\": \\"SPIDER\\", \\"id\\": 2, \\"img_url\\": \\"https://th-thumbnailer.cdn-si-edu.com/62FHz_ZDy1mSyya3ybeTcKBIc5U=/fit-in/1600x0/filters:focal(1162x775:1163x776)/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer_public/a7/a0/a7a0b2fa-de95-4198-a453-8c8cfd86121a/female_frontal.jpg\\"}","{\\"a\\": \\"ANT\\", \\"id\\": 3, \\"img_url\\": \\"https://cdn.britannica.com/27/5727-004-AB701C47/Carpenter-ant.jpg\\"}","{\\"a\\": \\"BEETLE\\", \\"id\\": 4, \\"img_url\\": \\"https://tpn-1.s3.eu-west-2.amazonaws.com/media/3996/Rhino-beetle.jpg\\"}","{\\"a\\": \\"WASP\\", \\"id\\": 5, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/5/59/Vespula_germanica_Richard_Bartz.jpg\\"}","{\\"a\\": \\"MOSQUITO\\", \\"id\\": 6, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/d/dc/Mosquito_2007-2.jpg\\"}","{\\"a\\": \\"GRASSHOPPER\\", \\"id\\": 7, \\"img_url\\": \\"https://animalcorner.org/wp-content/uploads/2015/02/grasshopper1-1.jpg\\"}","{\\"a\\": \\"COCKROACH\\", \\"id\\": 8, \\"img_url\\": \\"https://www.faceofmalawi.com/wp-content/uploads/2020/12/Cockroaches.jpg\\"}","{\\"a\\": \\"MOTH\\", \\"id\\": 9, \\"img_url\\": \\"https://www.treehugger.com/thmb/jQYybkMYgIZU6rpJZUE39duMpLc=/1982x1115/smart/filters:no_upscale()/GettyImages-5294970521-0df2c1c4c4a945548e1431e569788c99.jpg\\"}","{\\"a\\": \\"CATERPILLAR\\", \\"id\\": 10, \\"img_url\\": \\"https://cdn-www.terminix.com/-/media/Feature/Terminix/Articles/m3530096.jpg?rev=bb135bd077e2430eb20b6ef33acf534b\\"}"}	{"{\\"s\\": \\"SPIDER\\", \\"id\\": 2, \\"img_url\\": \\"https://th-thumbnailer.cdn-si-edu.com/62FHz_ZDy1mSyya3ybeTcKBIc5U=/fit-in/1600x0/filters:focal(1162x775:1163x776)/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer_public/a7/a0/a7a0b2fa-de95-4198-a453-8c8cfd86121a/female_frontal.jpg\\"}"}	2022-07-16 22:47:16.573406+00	2022-07-16 22:47:16.573444+00	{}	1
47		Select all of the animals whose habitat is the desert.	{"{\\"a\\": \\"EARTHWORM\\", \\"id\\": 1, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Earthworm.JPG/640px-Earthworm.JPG\\"}","{\\"a\\": \\"CAMEL\\", \\"id\\": 2, \\"img_url\\": \\"https://cdn.britannica.com/57/7057-050-33CEB562/Bactrian-camel.jpg\\"}","{\\"a\\": \\"VULTURE\\", \\"id\\": 3, \\"img_url\\": \\"https://cdn.britannica.com/02/162502-050-FEEA94DE/Vulture.jpg\\"}","{\\"a\\": \\"PELICAN\\", \\"id\\": 4, \\"img_url\\": \\"https://animalia-bio.us-east-1.linodeobjects.com/animals/photos/full/1.25x1/1200px-pelecanus-onocrotalus-2016jpg.webp\\"}","{\\"a\\": \\"TARANTULA\\", \\"id\\": 5, \\"img_url\\": \\"https://www.snaketracks.com/wp-content/uploads/2022/01/Texas-Brown-Tarantula-Aphonopelma-hentzi-in-dry-grass-near-French-Lake-at-Wichita-Mountains-Wildlife-Refuge-Comanche-County-Oklahoma-USA.jpg.webp\\"}","{\\"a\\": \\"LIZARD\\", \\"id\\": 6, \\"img_url\\": \\"https://tpwd.texas.gov/huntwild/wild/images/reptiles/horned_lizardlarge.jpg\\"}","{\\"a\\": \\"TIGER\\", \\"id\\": 7, \\"img_url\\": \\"https://assets.weforum.org/article/image/q8bpN98uMnTEXttXMZCBU8X0kmDdUSHvsmA9JO18-hs.jpg\\"}","{\\"a\\": \\"SLOTH\\", \\"id\\": 8, \\"img_url\\": \\"https://d.newsweek.com/en/full/2002965/sloth.jpg?w=1600&h=1600&q=88&f=e52390dab8fde4ef1a04b00afc73d1f4\\"}","{\\"a\\": \\"RABBIT\\", \\"id\\": 9, \\"img_url\\": \\"https://www.gannett-cdn.com/presto/2022/03/12/PCIN/5b05ff44-7aac-42a1-8186-b2282dd35132-j3.jpeg\\"}","{\\"a\\": \\"GORILLA\\", \\"id\\": 10, \\"img_url\\": \\"https://www.birdlife.org/wp-content/uploads/2021/06/Eagle-in-flight-Richard-Lee-Unsplash-1-edited-scaled.jpg\\"}"}	{"{\\"s\\": \\"CAMEL\\", \\"id\\": 2, \\"img_url\\": \\"https://cdn.britannica.com/57/7057-050-33CEB562/Bactrian-camel.jpg\\"}","{\\"s\\": \\"VULTURE\\", \\"id\\": 3, \\"img_url\\": \\"https://cdn.britannica.com/02/162502-050-FEEA94DE/Vulture.jpg\\"}","{\\"s\\": \\"TARANTULA\\", \\"id\\": 5, \\"img_url\\": \\"https://www.snaketracks.com/wp-content/uploads/2022/01/Texas-Brown-Tarantula-Aphonopelma-hentzi-in-dry-grass-near-French-Lake-at-Wichita-Mountains-Wildlife-Refuge-Comanche-County-Oklahoma-USA.jpg.webp\\"}","{\\"s\\": \\"LIZARD\\", \\"id\\": 6, \\"img_url\\": \\"https://tpwd.texas.gov/huntwild/wild/images/reptiles/horned_lizardlarge.jpg\\"}","{\\"s\\": \\"RABBIT\\", \\"id\\": 9, \\"img_url\\": \\"https://www.gannett-cdn.com/presto/2022/03/12/PCIN/5b05ff44-7aac-42a1-8186-b2282dd35132-j3.jpeg\\"}"}	2022-07-18 19:20:38.854862+00	2022-07-18 19:20:38.854906+00	{}	1
46		Select all of the herbivores.	{"{\\"a\\": \\"PANDA BEAR\\", \\"id\\": 1, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/0/0f/Grosser_Panda.JPG\\"}","{\\"a\\": \\"CAPE BUFFALO\\", \\"id\\": 2, \\"img_url\\": \\"https://www.fieldandstream.com/uploads/2022/04/08/buffalo-6345528_1920.jpg?auto=webp&width=1440&height=960\\"}","{\\"a\\": \\"FOX\\", \\"id\\": 3, \\"img_url\\": \\"https://www.woodlandtrust.org.uk/media/1396/fox-stalking-alamy-dew6rp-age-fotostock.jpg\\"}","{\\"a\\": \\"RACCOON\\", \\"id\\": 4, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Procyon_lotor_%28Common_raccoon%29.jpg/800px-Procyon_lotor_%28Common_raccoon%29.jpg\\"}","{\\"a\\": \\"BEAVER\\", \\"id\\": 5, \\"img_url\\": \\"https://cbsnews2.cbsistatic.com/hub/i/r/2019/09/07/8999a49d-f514-4a80-95d2-b88ac4f6a446/thumbnail/640x360g2/517266cb9a4750eb5c2e4a6210841e38/beaver-judith-lehmberg-teeth-4500-promo-top.jpg\\"}","{\\"a\\": \\"MILLIPEDE\\", \\"id\\": 6, \\"img_url\\": \\"https://www.worldatlas.com/r/w768/upload/f9/9a/c5/shutterstock-1027599676.jpg\\"}","{\\"a\\": \\"MOOSE\\", \\"id\\": 7, \\"img_url\\": \\"https://i0.wp.com/wilderness-society.org/wp-content/uploads/2021/03/moose-70254.jpg?fit=1536%2C1024&ssl=1\\"}","{\\"a\\": \\"RHINO\\", \\"id\\": 8, \\"img_url\\": \\"https://d1jyxxz9imt9yb.cloudfront.net/article/5353/meta_image/regular/black-rhino-Kenya-__IFAW_slash_B._Hollweg.jpg\\"}","{\\"a\\": \\"DRAGONFLY\\", \\"id\\": 9, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/0/03/Sympetrum_flaveolum_-_side_%28aka%29.jpg\\"}","{\\"a\\": \\"EAGLE\\", \\"id\\": 10, \\"img_url\\": \\"https://www.birdlife.org/wp-content/uploads/2021/06/Eagle-in-flight-Richard-Lee-Unsplash-1-edited-scaled.jpg\\"}"}	{"{\\"s\\": \\"PANDA BEAR\\", \\"id\\": 1, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/0/0f/Grosser_Panda.JPG\\"}","{\\"s\\": \\"CAPE BUFFALO\\", \\"id\\": 2, \\"img_url\\": \\"https://www.fieldandstream.com/uploads/2022/04/08/buffalo-6345528_1920.jpg?auto=webp&width=1440&height=960\\"}","{\\"s\\": \\"BEAVER\\", \\"id\\": 5, \\"img_url\\": \\"https://cbsnews2.cbsistatic.com/hub/i/r/2019/09/07/8999a49d-f514-4a80-95d2-b88ac4f6a446/thumbnail/640x360g2/517266cb9a4750eb5c2e4a6210841e38/beaver-judith-lehmberg-teeth-4500-promo-top.jpg\\"}","{\\"s\\": \\"MILLIPEDE\\", \\"id\\": 6, \\"img_url\\": \\"https://www.worldatlas.com/r/w768/upload/f9/9a/c5/shutterstock-1027599676.jpg\\"}","{\\"s\\": \\"MOOSE\\", \\"id\\": 7, \\"img_url\\": \\"https://i0.wp.com/wilderness-society.org/wp-content/uploads/2021/03/moose-70254.jpg?fit=1536%2C1024&ssl=1\\"}","{\\"s\\": \\"RHINO\\", \\"id\\": 8, \\"img_url\\": \\"https://d1jyxxz9imt9yb.cloudfront.net/article/5353/meta_image/regular/black-rhino-Kenya-__IFAW_slash_B._Hollweg.jpg\\"}"}	2022-07-17 21:53:07.268397+00	2022-07-20 18:35:45.681535+00	{}	1
60	https://www.freelogoservices.com/blog/wp-content/uploads/1200px-Mountain_Dew_logo.svg_-600x417.png	Which color scheme is included in the Mountain Dew logo?	{"{\\"a\\": \\"Monochromatic\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"Analogous\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"Complementary\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"Triadic\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"Tetradic\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"Complementary\\", \\"id\\": 3, \\"img_url\\": \\"\\"}"}	2022-07-23 17:12:14.341254+00	2022-07-23 17:12:14.341278+00	{}	4
74		How do you make orange?	{"{\\"a\\": \\"You take blue and add yellow to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take yellow and add purple to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take red and add yellow to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take blue and add red to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add purple to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take purple and add green to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add blue to it.\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take green and add blue to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take red and add green to it\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add yellow to it.\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"You take red and add yellow to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}"}	2022-07-28 19:37:35.125348+00	2022-07-28 19:48:47.369439+00	{}	4
48		Which birds cannot fly?	{"{\\"a\\": \\"OSTRICH\\", \\"id\\": 1, \\"img_url\\": \\"https://www.pbs.org/wnet/nature/files/2021/09/catherine-merlin-qeGHu5Jdy5s-unsplash-scaled-e1631640316457.jpg\\"}","{\\"a\\": \\"CHICKEN\\", \\"id\\": 2, \\"img_url\\": \\"https://t1.ea.ltmcdn.com/en/posts/9/9/4/can_chickens_fly_2499_orig.jpg\\"}","{\\"a\\": \\"PEACOCK\\", \\"id\\": 3, \\"img_url\\": \\"https://www.scienceabc.com/wp-content/uploads/2019/08/Indian-Male-Peacock-ImageKandarps.jpg\\"}","{\\"a\\": \\"PENGUIN\\", \\"id\\": 4, \\"img_url\\": \\"https://cdn.download.ams.birds.cornell.edu/api/v1/asset/113557591/1200\\"}","{\\"a\\": \\"FLAMINGO\\", \\"id\\": 5, \\"img_url\\": \\"https://cdn.download.ams.birds.cornell.edu/api/v1/asset/320036721/900\\"}","{\\"a\\": \\"TURKEY\\", \\"id\\": 6, \\"img_url\\": \\"https://cdn.birdwatchingdaily.com/2019/11/shutterstock_Wild-Turkey.jpg\\"}","{\\"a\\": \\"BUSTARD\\", \\"id\\": 7, \\"img_url\\": \\"https://www.krugerpark.co.za/images/1-kori-bustard-gcooke-590a-590x390.jpg\\"}","{\\"a\\": \\"KIWI\\", \\"id\\": 8, \\"img_url\\": \\"https://assets3.thrillist.com/v1/image/2624055/792x456/scale;webp=auto;jpeg_quality=60;progressive.jpg\\"}"}	{"{\\"s\\": \\"OSTRICH\\", \\"id\\": 1, \\"img_url\\": \\"https://www.pbs.org/wnet/nature/files/2021/09/catherine-merlin-qeGHu5Jdy5s-unsplash-scaled-e1631640316457.jpg\\"}","{\\"s\\": \\"PENGUIN\\", \\"id\\": 4, \\"img_url\\": \\"https://cdn.download.ams.birds.cornell.edu/api/v1/asset/113557591/1200\\"}","{\\"s\\": \\"KIWI\\", \\"id\\": 8, \\"img_url\\": \\"https://assets3.thrillist.com/v1/image/2624055/792x456/scale;webp=auto;jpeg_quality=60;progressive.jpg\\"}"}	2022-07-18 20:05:51.034814+00	2022-07-18 20:47:44.376019+00	{}	1
49		Which animals are mammals?	{"{\\"a\\": \\"ALLIGATOR\\", \\"id\\": 1, \\"img_url\\": \\"https://d.newsweek.com/en/full/2075044/alligator.jpg\\"}","{\\"a\\": \\"ORCA\\", \\"id\\": 2, \\"img_url\\": \\"http://www.adoptananimalkits.com/files/547756/catitems/Orca-210d1ad80fbf9dd1125c7ba38ad284f2.jpg\\"}","{\\"a\\": \\"BAT\\", \\"id\\": 3, \\"img_url\\": \\"https://images.nature.com/original/magazine-assets/d41586-022-01274-1/d41586-022-01274-1_20384320.jpg\\"}","{\\"a\\": \\"WOLVERINE\\", \\"id\\": 4, \\"img_url\\": \\"https://cdn.mos.cms.futurecdn.net/r936yQt44HKFDMB2xdkRPP-1200-80.jpg\\"}","{\\"a\\": \\"OCTOPUS\\", \\"id\\": 5, \\"img_url\\": \\"https://ychef.files.bbci.co.uk/1376x774/p075hvwf.jpg\\"}","{\\"a\\": \\"PLATYPUS\\", \\"id\\": 6, \\"img_url\\": \\"https://www.discoverburnie.net/files/sharedassets/tourism/burnie/platypus-banner.jpg?w=1080\\"}","{\\"a\\": \\"WARTHOG\\", \\"id\\": 7, \\"img_url\\": \\"https://a-z-animals.com/media/warthog-2.jpg\\"}","{\\"a\\": \\"SEAGULL\\", \\"id\\": 8, \\"img_url\\": \\"https://varmentguard.com/uploads/permanent/f8f2098da824b77447887be569c8990d\\"}"}	{"{\\"s\\": \\"ORCA\\", \\"id\\": 2, \\"img_url\\": \\"http://www.adoptananimalkits.com/files/547756/catitems/Orca-210d1ad80fbf9dd1125c7ba38ad284f2.jpg\\"}","{\\"s\\": \\"BAT\\", \\"id\\": 3, \\"img_url\\": \\"https://images.nature.com/original/magazine-assets/d41586-022-01274-1/d41586-022-01274-1_20384320.jpg\\"}","{\\"s\\": \\"WOLVERINE\\", \\"id\\": 4, \\"img_url\\": \\"https://cdn.mos.cms.futurecdn.net/r936yQt44HKFDMB2xdkRPP-1200-80.jpg\\"}","{\\"s\\": \\"PLATYPUS\\", \\"id\\": 6, \\"img_url\\": \\"https://www.discoverburnie.net/files/sharedassets/tourism/burnie/platypus-banner.jpg?w=1080\\"}","{\\"s\\": \\"WARTHOG\\", \\"id\\": 7, \\"img_url\\": \\"https://a-z-animals.com/media/warthog-2.jpg\\"}"}	2022-07-18 20:43:06.42054+00	2022-07-23 02:17:45.223001+00	{}	1
61	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/2560px-Mastercard-logo.svg.png	Which color scheme is included in the Master Card logo?	{"{\\"a\\": \\"Monochromatic\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"Analogous\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"Complementary\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"Triadic\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"Tetradic\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"Analogous\\", \\"id\\": 2, \\"img_url\\": \\"\\"}"}	2022-07-23 17:17:22.471789+00	2022-07-23 17:17:22.47181+00	{}	4
51		Which animals are considered mollusks?	{"{\\"a\\": \\"SLUG\\", \\"id\\": 1, \\"img_url\\": \\"https://static.diffen.com/uploadz/c/c1/slug2.jpg\\"}","{\\"a\\": \\"SQUID\\", \\"id\\": 2, \\"img_url\\": \\"http://cdn.shopify.com/s/files/1/0266/5817/7121/articles/2_89d20cd3-2eb5-41c4-a2ae-a0fd17c2c0f6_1200x1200.png?v=1640806305\\"}","{\\"a\\": \\"CLAM\\", \\"id\\": 3, \\"img_url\\": \\"https://penntoday.upenn.edu/sites/default/files/article_images/Clams2.jpg\\"}","{\\"a\\": \\"HERMIT CRAB\\", \\"id\\": 4, \\"img_url\\": \\"https://cdn.britannica.com/77/11077-050-F49321EA/Hermit-crab.jpg\\"}","{\\"a\\": \\"SEA URCHIN\\", \\"id\\": 5, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/9/9b/Tripneustes_ventricosus_%28West_Indian_Sea_Egg-top%29_and_Echinometra_viridis_%28Reef_Urchin_-_bottom%29.jpg\\"}","{\\"a\\": \\"LEECH\\", \\"id\\": 6, \\"img_url\\": \\"https://www.eekwi.org/sites/default/files/styles/original/public/2019-12/leech.jpg?itok=POvSxU1B\\"}","{\\"a\\": \\"EEL\\", \\"id\\": 7, \\"img_url\\": \\"https://cdn.notroublesjustbubbles.com/images/marine-life/Giant-Moray-Eel-Gymnothorax-javanicus-Peter-Guthrie.jpg\\"}","{\\"a\\": \\"STARFISH\\", \\"id\\": 8, \\"img_url\\": \\"https://i.natgeofe.com/n/778fdac7-da58-4be8-88e5-e5e400990669/4209871_16x9.jpg\\"}"}	{"{\\"s\\": \\"SLUG\\", \\"id\\": 1, \\"img_url\\": \\"https://static.diffen.com/uploadz/c/c1/slug2.jpg\\"}","{\\"s\\": \\"SQUID\\", \\"id\\": 2, \\"img_url\\": \\"http://cdn.shopify.com/s/files/1/0266/5817/7121/articles/2_89d20cd3-2eb5-41c4-a2ae-a0fd17c2c0f6_1200x1200.png?v=1640806305\\"}","{\\"s\\": \\"CLAM\\", \\"id\\": 3, \\"img_url\\": \\"https://penntoday.upenn.edu/sites/default/files/article_images/Clams2.jpg\\"}"}	2022-07-19 21:01:00.43088+00	2022-07-19 21:01:00.432058+00	{}	1
42		Which animal does not belong?	{"{\\"a\\": \\"SHARK\\", \\"id\\": 1, \\"img_url\\": \\"https://d.newsweek.com/en/full/2077922/great-white-shark.jpg?w=790&f=c39b46cbe10644c1833dd20faa669733\\"}","{\\"a\\": \\"GUPPY\\", \\"id\\": 2, \\"img_url\\": \\"https://cdn.britannica.com/02/117202-004-526214C9.jpg\\"}","{\\"a\\": \\"LIONFISH\\", \\"id\\": 3, \\"img_url\\": \\"https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/Lionfish-underwater-1296x728-slide1.jpg?w=1155\\"}","{\\"a\\": \\"DOLPHIN\\", \\"id\\": 4, \\"img_url\\": \\"https://www.cmaquarium.org/app/uploads/2021/06/2021.04-Nick-Underwater-0001-1024x683.jpg\\"}","{\\"a\\": \\"CLOWNFISH\\", \\"id\\": 5, \\"img_url\\": \\"https://cdn.mos.cms.futurecdn.net/4UdEs7tTKwLJbxZPUYR3hF.jpg\\"}","{\\"a\\": \\"BARACUDA\\", \\"id\\": 6, \\"img_url\\": \\"https://www.theultimatejourney.org/wp-content/uploads/2014/06/Baracuda.jpg\\"}","{\\"a\\": \\"CATFISH\\", \\"id\\": 7, \\"img_url\\": \\"https://ohiodnr.gov/wps/wcm/connect/gov/1da200a5-471d-4f50-a0ca-f953b0b121e2/channelcatfish1-HERO.jpg?MOD=AJPERES&CACHEID=ROOTWORKSPACE.Z18_M1HGGIK0N0JO00QO9DDDDM3000-1da200a5-471d-4f50-a0ca-f953b0b121e2-nml3X4H\\"}","{\\"a\\": \\"STINGRAY\\", \\"id\\": 8, \\"img_url\\": \\"https://brevardzoo.org/wp-content/uploads/2015/03/200109002-1-scaled.jpg\\"}"}	{"{\\"s\\": \\"DOLPHIN\\", \\"id\\": 4, \\"img_url\\": \\"https://www.cmaquarium.org/app/uploads/2021/06/2021.04-Nick-Underwater-0001-1024x683.jpg\\"}"}	2022-07-16 21:41:21.874015+00	2022-07-19 23:20:36.086828+00	{}	1
52		Which animals are not venomous?	{"{\\"a\\": \\"GILA MONSTER\\", \\"id\\": 1, \\"img_url\\": \\"https://animals.sandiegozoo.org/sites/default/files/2016-11/animals_hero_gila_monster_0.jpg\\"}","{\\"a\\": \\"JELLYFISH\\", \\"id\\": 2, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/4/44/Jelly_cc11.jpg\\"}","{\\"a\\": \\"MANTA RAY\\", \\"id\\": 3, \\"img_url\\": \\"https://cff2.earth.com/uploads/2022/05/16054630/Manta-rays-scaled.jpg\\"}","{\\"a\\": \\"PIRANHA\\", \\"id\\": 4, \\"img_url\\": \\"https://www.georgiaaquarium.org/wp-content/uploads/2018/09/red-piranha-4-750x750.jpg\\"}","{\\"a\\": \\"RATTLESNAKE\\", \\"id\\": 5, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/7/70/Crotalus_cerastes_mesquite_springs_CA-2.jpg\\"}","{\\"a\\": \\"BUMBLEBEE\\", \\"id\\": 6, \\"img_url\\": \\"https://azrxn21w5zmfu95d3r5eu479-wpengine.netdna-ssl.com/wp-content/uploads/2014/06/Identify-Bumble-Bee-1080x675.jpg\\"}","{\\"a\\": \\"POISON DART FROG\\", \\"id\\": 7, \\"img_url\\": \\"https://i.natgeofe.com/k/a27c5d1f-9f3e-49f9-ae6d-a2b349c283c7/poison-dart-frog-orange-blue_3x2.jpg\\"}","{\\"a\\": \\"PUFFERFISH\\", \\"id\\": 8, \\"img_url\\": \\"https://i.natgeofe.com/k/b6b9720a-1b63-4d14-849e-03dd415cd806/pufferfish-closeup.jpg\\"}","{\\"a\\": \\"PORCUPINE\\", \\"id\\": 9, \\"img_url\\": \\"http://northamericannature.com/wp-content/uploads/2019/08/shutterstock_771903250-1.jpg\\"}","{\\"a\\": \\"SCORPION\\", \\"id\\": 10, \\"img_url\\": \\"https://www.bannerhealth.com/healthcareblog/-/media/images/project/healthcareblog/hero-images/2020/04/scorpion-myths-debunked.ashx\\"}"}	{"{\\"s\\": \\"MANTA RAY\\", \\"id\\": 3, \\"img_url\\": \\"https://cff2.earth.com/uploads/2022/05/16054630/Manta-rays-scaled.jpg\\"}","{\\"s\\": \\"PIRANHA\\", \\"id\\": 4, \\"img_url\\": \\"https://www.georgiaaquarium.org/wp-content/uploads/2018/09/red-piranha-4-750x750.jpg\\"}","{\\"s\\": \\"POISON DART FROG\\", \\"id\\": 7, \\"img_url\\": \\"https://i.natgeofe.com/k/a27c5d1f-9f3e-49f9-ae6d-a2b349c283c7/poison-dart-frog-orange-blue_3x2.jpg\\"}","{\\"s\\": \\"PUFFERFISH\\", \\"id\\": 8, \\"img_url\\": \\"https://i.natgeofe.com/k/b6b9720a-1b63-4d14-849e-03dd415cd806/pufferfish-closeup.jpg\\"}","{\\"s\\": \\"PORCUPINE\\", \\"id\\": 9, \\"img_url\\": \\"http://northamericannature.com/wp-content/uploads/2019/08/shutterstock_771903250-1.jpg\\"}"}	2022-07-19 23:17:28.106174+00	2022-07-23 02:28:10.845274+00	{}	1
45		Which animal does not belong?	{"{\\"a\\": \\"CROCODILE\\", \\"id\\": 1, \\"img_url\\": \\"https://images.immediate.co.uk/production/volatile/sites/23/2014/11/GettyImages-123529247-2a29d6c.jpg\\"}","{\\"a\\": \\"WOLF\\", \\"id\\": 2, \\"img_url\\": \\"https://good-nature-blog-uploads.s3.amazonaws.com/uploads/2015/08/Henry-Holdsworth-Wolf-1-YNP-1280x640.jpg\\"}","{\\"a\\": \\"LION\\", \\"id\\": 3, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Lion_%28Panthera_leo%29_male_6y.jpg/1707px-Lion_%28Panthera_leo%29_male_6y.jpg\\"}","{\\"a\\": \\"ANACONDA\\", \\"id\\": 4, \\"img_url\\": \\"https://nationalzoo.si.edu/sites/default/files/animals/greenanaconda-001.jpg\\"}","{\\"a\\": \\"GRIZZLY BEAR\\", \\"id\\": 5, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/GrizzlyBearJeanBeaufort.jpg/1200px-GrizzlyBearJeanBeaufort.jpg\\"}","{\\"a\\": \\"HAWK\\", \\"id\\": 6, \\"img_url\\": \\"https://cdn.britannica.com/86/117086-050-81460DD9/Red-tailed-hawk.jpg\\"}","{\\"a\\": \\"WHALE\\", \\"id\\": 7, \\"img_url\\": \\"https://www.americanoceans.org/wp-content/uploads/2022/04/humpback-whale-megaptera-novaeangliae.jpg\\"}","{\\"a\\": \\"SEAL\\", \\"id\\": 8, \\"img_url\\": \\"https://www.antarctica.gov.au/site/assets/files/45623/rs56868_leopard-2795.514x600.jpg?f=066056\\"}","{\\"a\\": \\"WEASEL\\", \\"id\\": 9, \\"img_url\\": \\"https://media.tehrantimes.com/d/t/2020/07/06/4/3493961.jpg\\"}","{\\"a\\": \\"CENTIPEDE\\", \\"id\\": 10, \\"img_url\\": \\"https://cdn.branchcms.com/QMB0Zbj0Xj-1736/images/pest-library/giant-centipede-in-phoenix-az.png\\"}"}	{"{\\"a\\": \\"GRIZZLY BEAR\\", \\"id\\": 5, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/GrizzlyBearJeanBeaufort.jpg/1200px-GrizzlyBearJeanBeaufort.jpg\\"}"}	2022-07-16 23:21:49.036894+00	2022-07-19 23:30:18.279212+00	{}	1
53		Which animals live in the mountains?	{"{\\"a\\": \\"BIGHORN SHEEP\\", \\"id\\": 1, \\"img_url\\": \\"https://www.nps.gov/yell/learn/nature/images/20171128-dmr-5011_sm.jpg?maxwidth=1200&maxheight=1200&autorotate=false\\"}","{\\"a\\": \\"MEERKAT\\", \\"id\\": 2, \\"img_url\\": \\"https://www.10interestingfacts.com/wp-content/uploads/2017/10/image-38.jpg\\"}","{\\"a\\": \\"COUGAR\\", \\"id\\": 3, \\"img_url\\": \\"https://www.tn.gov/content/dam/tn/twra/images/mammals/cougar/Cougar-1024x768.jpg\\"}","{\\"a\\": \\"ANDEAN CONDOR\\", \\"id\\": 4, \\"img_url\\": \\"https://i.guim.co.uk/img/media/6b021b9f22ab0507dfcbc8617d39cad72287a712/0_70_5000_3000/master/5000.jpg?width=1200&quality=85&auto=format&fit=max&s=8e66c551a5cb36b2d66a13505c8a5ecd\\"}","{\\"a\\": \\"GIRAFFE\\", \\"id\\": 5, \\"img_url\\": \\"https://images.ctfassets.net/81iqaqpfd8fy/3r4flvP8Z26WmkMwAEWEco/870554ed7577541c5f3bc04942a47b95/78745131.jpg?w=1200&h=1200&fm=jpg&fit=fill\\"}","{\\"a\\": \\"WILDEBEEST\\", \\"id\\": 6, \\"img_url\\": \\"https://a-z-animals.com/media/animals/images/original/wildebeest9.jpg\\"}","{\\"a\\": \\"LLAMA\\", \\"id\\": 7, \\"img_url\\": \\"https://images.pexels.com/photos/8490680/pexels-photo-8490680.jpeg?cs=srgb&dl=pexels-kaylan-chavers-8490680.jpg&fm=jpg\\"}","{\\"a\\": \\"DEER\\", \\"id\\": 8, \\"img_url\\": \\"https://www.nps.gov/romo/learn/nature/images/MuleDeer_Cover_688x400.jpg?maxwidth=1200&maxheight=1200&autorotate=false\\"}","{\\"a\\": \\"SNOW LEOPARD\\", \\"id\\": 9, \\"img_url\\": \\"https://www.science.org/cms/10.1126/science.aas9893/asset/b3064092-042e-405f-a8c7-1098268b11dc/assets/graphic/359_1110_f1.jpeg\\"}","{\\"a\\": \\"COYOTE\\", \\"id\\": 10, \\"img_url\\": \\"https://th-thumbnailer.cdn-si-edu.com/G7lIa0rayTTDxqjXkwgbgT1km5Q=/fit-in/1600x0/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/0a/9c/0a9c2a0e-ae01-46e6-9a8b-3bb959abab4c/5711528512_3140ec84ab_o.jpg\\"}"}	{"{\\"s\\": \\"BIGHORN SHEEP\\", \\"id\\": 1, \\"img_url\\": \\"https://www.nps.gov/yell/learn/nature/images/20171128-dmr-5011_sm.jpg?maxwidth=1200&maxheight=1200&autorotate=false\\"}","{\\"s\\": \\"COUGAR\\", \\"id\\": 3, \\"img_url\\": \\"https://www.tn.gov/content/dam/tn/twra/images/mammals/cougar/Cougar-1024x768.jpg\\"}","{\\"s\\": \\"ANDEAN CONDOR\\", \\"id\\": 4, \\"img_url\\": \\"https://i.guim.co.uk/img/media/6b021b9f22ab0507dfcbc8617d39cad72287a712/0_70_5000_3000/master/5000.jpg?width=1200&quality=85&auto=format&fit=max&s=8e66c551a5cb36b2d66a13505c8a5ecd\\"}","{\\"a\\": \\"LLAMA\\", \\"id\\": 7, \\"img_url\\": \\"https://images.pexels.com/photos/8490680/pexels-photo-8490680.jpeg?cs=srgb&dl=pexels-kaylan-chavers-8490680.jpg&fm=jpg\\"}","{\\"s\\": \\"DEER\\", \\"id\\": 8, \\"img_url\\": \\"https://www.nps.gov/romo/learn/nature/images/MuleDeer_Cover_688x400.jpg?maxwidth=1200&maxheight=1200&autorotate=false\\"}","{\\"s\\": \\"SNOW LEOPARD\\", \\"id\\": 9, \\"img_url\\": \\"https://www.science.org/cms/10.1126/science.aas9893/asset/b3064092-042e-405f-a8c7-1098268b11dc/assets/graphic/359_1110_f1.jpeg\\"}","{\\"s\\": \\"COYOTE\\", \\"id\\": 10, \\"img_url\\": \\"https://th-thumbnailer.cdn-si-edu.com/G7lIa0rayTTDxqjXkwgbgT1km5Q=/fit-in/1600x0/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/0a/9c/0a9c2a0e-ae01-46e6-9a8b-3bb959abab4c/5711528512_3140ec84ab_o.jpg\\"}"}	2022-07-20 02:21:25.94008+00	2022-07-20 02:21:25.940135+00	{}	1
70		How do you make a secondary color?	{"{\\"a\\": \\"You take a color and add white to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add gray to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add black to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add its complement to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add another primary color to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a secondary color to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a tertiary color to it.\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add another secondary color to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add a tertiary color to it.\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a tertiary color and add another tertiary color to it.\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"You take a primary color and add another primary color to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}"}	2022-07-28 17:34:18.759394+00	2022-07-28 17:34:18.759417+00	{}	4
54		Which animals cannot swim?	{"{\\"a\\": \\"OTTER\\", \\"id\\": 1, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Fischotter%2C_Lutra_Lutra.JPG/640px-Fischotter%2C_Lutra_Lutra.JPG\\"}","{\\"a\\": \\"ELEPHANT\\", \\"id\\": 2, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/African_Bush_Elephant.jpg/640px-African_Bush_Elephant.jpg\\"}","{\\"a\\": \\"CROW\\", \\"id\\": 3, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/a/a9/Corvus_corone_-near_Canford_Cliffs%2C_Poole%2C_England-8.jpg\\"}","{\\"a\\": \\"CHEETAH\\", \\"id\\": 4, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/0/09/TheCheethcat.jpg\\"}","{\\"a\\": \\"HIPPO\\", \\"id\\": 5, \\"img_url\\": \\"https://ichef.bbci.co.uk/news/976/cpsprodpb/17ECC/production/_122969979_hippo_nicholasmathevon.jpg\\"}","{\\"a\\": \\"IGUANA\\", \\"id\\": 6, \\"img_url\\": \\"https://www.thecoldwire.com/wp-content/uploads/2021/07/Land-iguana.jpg\\"}","{\\"a\\": \\"FLEA\\", \\"id\\": 7, \\"img_url\\": \\"https://pestpointers.com/wp-content/uploads/2021/05/Scents-Fleas-Hate-Cover-Macro-Shot-of-Flea.jpg\\"}","{\\"a\\": \\"TORTOISE\\", \\"id\\": 8, \\"img_url\\": \\"https://d.newsweek.com/en/full/1993279/aldabra-tortoise-seen-grass.jpg\\"}","{\\"a\\": \\"PORTUGUESE MAN O' WAR\\", \\"id\\": 9, \\"img_url\\": \\"https://images2.minutemediacdn.com/image/upload/c_fill,w_1440,ar_16:9,f_auto,q_auto,g_auto/shape/cover/sport/550892-alamy-c2a9rb-972a423f3555b5c093948213b2ffd8fb.jpg\\"}","{\\"a\\": \\"ARMADILLO\\", \\"id\\": 10, \\"img_url\\": \\"https://animaltriangle.com/wp-content/uploads/2022/03/27-animals-that-can-swim-armadillo.jpg\\"}"}	{"{\\"s\\": \\"CROW\\", \\"id\\": 3, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/a/a9/Corvus_corone_-near_Canford_Cliffs%2C_Poole%2C_England-8.jpg\\"}","{\\"s\\": \\"HIPPO\\", \\"id\\": 5, \\"img_url\\": \\"https://ichef.bbci.co.uk/news/976/cpsprodpb/17ECC/production/_122969979_hippo_nicholasmathevon.jpg\\"}","{\\"s\\": \\"FLEA\\", \\"id\\": 7, \\"img_url\\": \\"https://pestpointers.com/wp-content/uploads/2021/05/Scents-Fleas-Hate-Cover-Macro-Shot-of-Flea.jpg\\"}","{\\"s\\": \\"TORTOISE\\", \\"id\\": 8, \\"img_url\\": \\"https://d.newsweek.com/en/full/1993279/aldabra-tortoise-seen-grass.jpg\\"}","{\\"s\\": \\"PORTUGUESE MAN O' WAR\\", \\"id\\": 9, \\"img_url\\": \\"https://images2.minutemediacdn.com/image/upload/c_fill,w_1440,ar_16:9,f_auto,q_auto,g_auto/shape/cover/sport/550892-alamy-c2a9rb-972a423f3555b5c093948213b2ffd8fb.jpg\\"}"}	2022-07-20 07:02:01.033809+00	2022-07-20 07:02:01.033854+00	{}	1
55		Which animals migrate?	{"{\\"a\\": \\"CANADIAN GOOSE\\", \\"id\\": 1, \\"img_url\\": \\"https://scx2.b-cdn.net/gfx/news/hires/canadagoose.jpg\\"}","{\\"a\\": \\"LOCUST\\", \\"id\\": 2, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/3/37/Garden_locust_%28Acanthacris_ruficornis%29.jpg\\"}","{\\"a\\": \\"ZEBRA\\", \\"id\\": 3, \\"img_url\\": \\"https://a-z-animals.com/media/2021/11/Zebra-in-field-e1653793342190.jpg\\"}","{\\"a\\": \\"HYENA\\", \\"id\\": 4, \\"img_url\\": \\"https://static.wikia.nocookie.net/animals-are-cool/images/4/4b/Crocuta_crocuta.jpg/revision/latest/scale-to-width-down/640?cb=20181010233246\\"}","{\\"a\\": \\"ANGELFISH\\", \\"id\\": 5, \\"img_url\\": \\"https://cdn.shopify.com/s/files/1/0311/3149/articles/featured_image_-_angelfish_in_planted_tank_1024x1024.jpg?v=1595873782\\"}","{\\"a\\": \\"CARDINAL\\", \\"id\\": 6, \\"img_url\\": \\"https://i.natgeofe.com/n/87d4327d-ece5-4eef-bad4-9e55a0cb7dc2/cardinal_thumb_square.jpg\\"}","{\\"a\\": \\"ELK\\", \\"id\\": 7, \\"img_url\\": \\"https://cdn.britannica.com/03/94603-050-D74D3709/elk-American-Yellowstone-National-Park-Wyoming.jpg\\"}","{\\"a\\": \\"SALMON\\", \\"id\\": 8, \\"img_url\\": \\"https://hakaimagazine.com/wp-content/uploads/header-lake-salmon.jpg\\"}","{\\"a\\": \\"ANTEATER\\", \\"id\\": 9, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Myresluger2.jpg/800px-Myresluger2.jpg\\"}","{\\"a\\": \\"JAGUAR\\", \\"id\\": 10, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/0/0a/Standing_jaguar.jpg\\"}"}	{"{\\"s\\": \\"CANADIAN GOOSE\\", \\"id\\": 1, \\"img_url\\": \\"https://scx2.b-cdn.net/gfx/news/hires/canadagoose.jpg\\"}","{\\"s\\": \\"LOCUST\\", \\"id\\": 2, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/3/37/Garden_locust_%28Acanthacris_ruficornis%29.jpg\\"}","{\\"s\\": \\"ZEBRA\\", \\"id\\": 3, \\"img_url\\": \\"https://a-z-animals.com/media/2021/11/Zebra-in-field-e1653793342190.jpg\\"}","{\\"s\\": \\"ELK\\", \\"id\\": 7, \\"img_url\\": \\"https://cdn.britannica.com/03/94603-050-D74D3709/elk-American-Yellowstone-National-Park-Wyoming.jpg\\"}","{\\"s\\": \\"SALMON\\", \\"id\\": 8, \\"img_url\\": \\"https://hakaimagazine.com/wp-content/uploads/header-lake-salmon.jpg\\"}"}	2022-07-20 19:58:17.596971+00	2022-07-20 19:58:17.596991+00	{}	1
56		Which animal does not hibernate?	{"{\\"a\\": \\"CHIPMUNK\\", \\"id\\": 1, \\"img_url\\": \\"https://assets-varnish.triblive.com/2019/08/1575749_web1_gtr-liv-chipmunk-082319.jpg\\"}","{\\"a\\": \\"LEMUR\\", \\"id\\": 2, \\"img_url\\": \\"https://cdn.britannica.com/20/154120-050-78DE15C0/lemur.jpg\\"}","{\\"a\\": \\"BEAR\\", \\"id\\": 3, \\"img_url\\": \\"https://images.immediate.co.uk/production/volatile/sites/23/2014/08/GettyImages-635725340-33bbe2e.jpg\\"}","{\\"a\\": \\"GECKO\\", \\"id\\": 4, \\"img_url\\": \\"https://cf.ltkcdn.net/small-pets/images/orig/304273-1600x1066-how-to-take-care-of-a-gecko.jpg\\"}","{\\"a\\": \\"LADYBUG\\", \\"id\\": 5, \\"img_url\\": \\"https://dontgivepestsachance.com/wp-content/uploads/2019/10/Ladybug.jpg\\"}","{\\"a\\": \\"HEDGEHOG\\", \\"id\\": 6, \\"img_url\\": \\"https://cdn.pixabay.com/photo/2018/09/25/21/54/hedgehog-3703244_960_720.jpg\\"}","{\\"a\\": \\"RAT\\", \\"id\\": 7, \\"img_url\\": \\"https://cdn.britannica.com/26/65326-050-53232216/Norway-rat.jpg?q=60\\"}","{\\"a\\": \\"GARTER SNAKE\\", \\"id\\": 8, \\"img_url\\": \\"https://www.northwestwildlife.com/wp-content/uploads/2018/10/common-garter-snake-700x443.png\\"}"}	{"{\\"s\\": \\"RAT\\", \\"id\\": 7, \\"img_url\\": \\"https://cdn.britannica.com/26/65326-050-53232216/Norway-rat.jpg?q=60\\"}"}	2022-07-21 04:55:58.899486+00	2022-07-21 04:55:58.899523+00	{}	1
50		Which animals lay eggs?	{"{\\"a\\": \\"SQUIRREL\\", \\"id\\": 1, \\"img_url\\": \\"https://media.npr.org/assets/img/2017/04/25/istock-115796521_wide-2f8afeb04be5bf8290f13dd1a5a9e107f63ee2fd.jpg?s=1400\\"}","{\\"a\\": \\"MOUSE\\", \\"id\\": 2, \\"img_url\\": \\"https://www.woodlandtrust.org.uk/media/50820/house-mouse-wtml-1062551-amy-lewis.jpg\\"}","{\\"a\\": \\"KANGAROO\\", \\"id\\": 3, \\"img_url\\": \\"https://media.australian.museum/media/dd/images/eastern_grey_kangaroo.8d02488.width-800.cdc7286.jpg\\"}","{\\"a\\": \\"OPOSSUM\\", \\"id\\": 4, \\"img_url\\": \\"https://cdn-www.terminix.com/-/media/Feature/Terminix/Articles/opossum.jpg?rev=a4854e53b5334c6da6c161ef97cc9127\\"}","{\\"a\\": \\"SKUNK\\", \\"id\\": 5, \\"img_url\\": \\"https://weilerwoodsforwildlife.com/wp-content/uploads/2020/06/skunk-unsplash-bryan-padron-jG8eaA5Iq3A-unsplash-768x1024.jpeg\\"}","{\\"a\\": \\"BUTTERFLY\\", \\"id\\": 6, \\"img_url\\": \\"https://agrilifetoday.tamu.edu/wp-content/uploads/2022/06/MicrosoftTeams-image-5.jpg\\"}","{\\"a\\": \\"HUMMINGBIRD\\", \\"id\\": 7, \\"img_url\\": \\"https://www.rainforest-alliance.org/wp-content/uploads/2021/06/ruby-throated-hummingbird-square-1.jpg.optimal.jpg\\"}","{\\"a\\": \\"COBRA\\", \\"id\\": 8, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/12_-_The_Mystical_King_Cobra_and_Coffee_Forests.jpg/800px-12_-_The_Mystical_King_Cobra_and_Coffee_Forests.jpg\\"}","{\\"a\\": \\"KOMODO DRAGON\\", \\"id\\": 9, \\"img_url\\": \\"https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on.jpg\\"}","{\\"a\\": \\"LOBSTER\\", \\"id\\": 10, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/0/0b/KreeftbijDenOsse.jpg\\"}"}	{"{\\"a\\": \\"BUTTERFLY\\", \\"id\\": 6, \\"img_url\\": \\"https://agrilifetoday.tamu.edu/wp-content/uploads/2022/06/MicrosoftTeams-image-5.jpg\\"}","{\\"a\\": \\"HUMMINGBIRD\\", \\"id\\": 7, \\"img_url\\": \\"https://www.rainforest-alliance.org/wp-content/uploads/2021/06/ruby-throated-hummingbird-square-1.jpg.optimal.jpg\\"}","{\\"a\\": \\"COBRA\\", \\"id\\": 8, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/12_-_The_Mystical_King_Cobra_and_Coffee_Forests.jpg/800px-12_-_The_Mystical_King_Cobra_and_Coffee_Forests.jpg\\"}","{\\"a\\": \\"KOMODO DRAGON\\", \\"id\\": 9, \\"img_url\\": \\"https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on.jpg\\"}","{\\"a\\": \\"LOBSTER\\", \\"id\\": 10, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/0/0b/KreeftbijDenOsse.jpg\\"}"}	2022-07-18 21:46:04.471417+00	2022-07-21 05:10:02.026331+00	{}	1
57		Which animal is not nocturnal?	{"{\\"a\\": \\"BADGER\\", \\"id\\": 1, \\"img_url\\": \\"https://www.treehugger.com/thmb/Nb2Gi6-iQO01IGk1Wf7TuM0avHk=/2121x1193/smart/filters:no_upscale()/GettyImages-695777008-57d53bf3f20e4015bcc10ff63e204fc1.jpg\\"}","{\\"a\\": \\"TASMANIAN DEVIL\\", \\"id\\": 2, \\"img_url\\": \\"https://cdn3.gttwl.net/attachments/Screen_Shot_2019_04_22_at_9_14_06_PM_63723201298112817.png?w=1024&h=768&fit=crop&crop=entropy&auto=format,enhance&q=60\\"}","{\\"a\\": \\"LEOPARD\\", \\"id\\": 3, \\"img_url\\": \\"https://images.immediate.co.uk/production/volatile/sites/23/2014/08/GettyImages-635725340-33bbe2e.jpg\\"}","{\\"a\\": \\"HAMSTER\\", \\"id\\": 4, \\"img_url\\": \\"https://cdn.mos.cms.futurecdn.net/2Nr5Z7BJSx3bLvaAZTfwbW.jpg\\"}","{\\"a\\": \\"OWL\\", \\"id\\": 5, \\"img_url\\": \\"https://www.treehugger.com/thmb/HHs4-767tiyW_RuYUS48a_WYAtk=/1885x1414/smart/filters:no_upscale()/GettyImages-166152657-cb61ca0fd49e453cb4f1a60b50d281e7.jpg\\"}","{\\"a\\": \\"AARDVARK\\", \\"id\\": 6, \\"img_url\\": \\"https://i.natgeofe.com/k/a05f875b-3658-4487-8c27-8aebb902c41c/aardvark-on-rocks_2x3.jpg\\"}","{\\"a\\": \\"FIREFLY\\", \\"id\\": 7, \\"img_url\\": \\"https://i.natgeofe.com/k/39dae00d-aad0-4ad0-b21e-c79f9c1dcd59/firefly-full-body.jpg\\"}","{\\"a\\": \\"ROBIN\\", \\"id\\": 8, \\"img_url\\": \\"https://www.allaboutbirds.org/guide/assets/photo/303441381-480px.jpg\\"}"}	{"{\\"s\\": \\"ROBIN\\", \\"id\\": 8, \\"img_url\\": \\"https://www.allaboutbirds.org/guide/assets/photo/303441381-480px.jpg\\"}"}	2022-07-22 18:19:04.817601+00	2022-07-22 18:19:04.817634+00	{}	1
58		Which animal does not use camouflage?	{"{\\"a\\": \\"POLAR BEAR\\", \\"id\\": 1, \\"img_url\\": \\"https://apiwwfarcticse.cdn.triggerfish.cloud/uploads/2022/05/05113906/Polar-bear-population.jpg\\"}","{\\"a\\": \\"CHAMELEON\\", \\"id\\": 2, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/3/3d/Indian_chameleon_From_Kanakpura%2C_Karnataka.jpg\\"}","{\\"a\\": \\"PRAYING MANTIS\\", \\"id\\": 3, \\"img_url\\": \\"https://inaturalist-open-data.s3.amazonaws.com/photos/180063407/large.jpg\\"}","{\\"a\\": \\"BLUE JAY\\", \\"id\\": 4, \\"img_url\\": \\"https://nas-national-prod.s3.amazonaws.com/styles/api_hero_bird_with_crop_1920_1200/public/birds/hero_image/sfw_fixed_01-29-2011-223.jpg?tok=1651732317\\"}","{\\"a\\": \\"CUTTLEFISH\\", \\"id\\": 5, \\"img_url\\": \\"https://www.tynemouthaquarium.co.uk/wp-content/uploads/2020/11/iStock-540984424.jpg\\"}","{\\"a\\": \\"FALCON\\", \\"id\\": 6, \\"img_url\\": \\"https://www.allaboutbirds.org/guide/assets/photo/71547421-720px.jpg\\"}","{\\"a\\": \\"CRAB\\", \\"id\\": 7, \\"img_url\\": \\"https://www.ecomagazine.com/images/Newsletter/0_2019/Week_5-27-19/TOP-iStock-513745132.jpg\\"}","{\\"a\\": \\"IBEX\\", \\"id\\": 8, \\"img_url\\": \\"https://cdn.mos.cms.futurecdn.net/6LqNth63RaK9zAMvZrchU5-1200-80.jpg\\"}"}	{"{\\"s\\": \\"BLUE JAY\\", \\"id\\": 4, \\"img_url\\": \\"https://nas-national-prod.s3.amazonaws.com/styles/api_hero_bird_with_crop_1920_1200/public/birds/hero_image/sfw_fixed_01-29-2011-223.jpg?tok=1651732317\\"}"}	2022-07-23 00:05:39.187331+00	2022-07-23 00:05:39.187373+00	{}	1
59		Which animal is solitary?	{"{\\"a\\": \\"COW\\", \\"id\\": 1, \\"img_url\\": \\"https://cdn.britannica.com/55/174255-050-526314B6/brown-Guernsey-cow.jpg\\"}","{\\"a\\": \\"ORANGUTAN\\", \\"id\\": 2, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/b/be/Orang_Utan%2C_Semenggok_Forest_Reserve%2C_Sarawak%2C_Borneo%2C_Malaysia.JPG\\"}","{\\"a\\": \\"TERMITE\\", \\"id\\": 3, \\"img_url\\": \\"https://cdn.branchcms.com/3xg570W1Vz-1474/images/blog/termite-crawling-on-top-of-wood.jpg\\"}","{\\"a\\": \\"BISON\\", \\"id\\": 4, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/8/8d/American_bison_k5680-1.jpg\\"}","{\\"a\\": \\"HORSE\\", \\"id\\": 5, \\"img_url\\": \\"https://www.thesprucepets.com/thmb/KYaXBSM013GnZ2jEZJnX4a9oIsU=/3865x2174/smart/filters:no_upscale()/horse-galloping-in-grass-688899769-587673275f9b584db3a44cdf.jpg\\"}","{\\"a\\": \\"CHIMPANZEE\\", \\"id\\": 6, \\"img_url\\": \\"https://animalfactguide.com/wp-content/uploads/2022/02/chimpanzee_iStock-584864478-e1644287772737.jpg\\"}","{\\"a\\": \\"PRAIRIE DOG\\", \\"id\\": 7, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/f/fd/Black-Tailed_Prairie_Dog.jpg\\"}","{\\"a\\": \\"PARROT\\", \\"id\\": 8, \\"img_url\\": \\"https://i.natgeofe.com/n/e3ae5fbf-ddc9-4b18-8c75-81d2daf962c1/3948225_3x4.jpg\\"}"}	{"{\\"s\\": \\"ORANGUTAN\\", \\"id\\": 2, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/b/be/Orang_Utan%2C_Semenggok_Forest_Reserve%2C_Sarawak%2C_Borneo%2C_Malaysia.JPG\\"}"}	2022-07-23 01:48:19.916855+00	2022-07-23 01:48:19.916895+00	{}	1
62	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/2560px-Mastercard-logo.svg.png	Select all of the primary colors of painting.	{"{\\"a\\": \\"Black\\", \\"id\\": 1, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/vine-black-painted-swatch.jpg\\"}","{\\"a\\": \\"White\\", \\"id\\": 2, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2015/07/zinc_white_painted_swatch_Lipscher_225-opt.jpg\\"}","{\\"a\\": \\"Blue\\", \\"id\\": 3, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/han-blue-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Green\\", \\"id\\": 4, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Emerald-green-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Yellow\\", \\"id\\": 5, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Indian-yellow-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Red\\", \\"id\\": 6, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/cadmium-red-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Orange\\", \\"id\\": 7, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/03/orange-ochre-painted-swatch-france-300x300.jpg.webp\\"}","{\\"a\\": \\"Pink\\", \\"id\\": 8, \\"img_url\\": \\"https://www.bhphotovideo.com/images/images500x500/Rosco_102303322124_E_Colour_332_Special_Rose_163105.jpg\\"}","{\\"a\\": \\"Purple\\", \\"id\\": 9, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Tyrian-purple-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Gray\\", \\"id\\": 10, \\"img_url\\": \\"https://www.kingplastic.com/wp-content/uploads/2014/05/Charcoal-Gray.png\\"}"}	{"{\\"s\\": \\"Blue\\", \\"id\\": 3, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/han-blue-painted-swatch-300x300.jpg.webp\\"}","{\\"s\\": \\"Yellow\\", \\"id\\": 5, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Indian-yellow-painted-swatch-300x300.jpg.webp\\"}","{\\"s\\": \\"Red\\", \\"id\\": 6, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/cadmium-red-painted-swatch-300x300.jpg.webp\\"}"}	2022-07-23 18:08:59.536256+00	2022-07-23 18:08:59.536288+00	{}	4
63	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/2560px-Mastercard-logo.svg.png	Select all of the secondary colors of painting.	{"{\\"a\\": \\"Black\\", \\"id\\": 1, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/vine-black-painted-swatch.jpg\\"}","{\\"a\\": \\"White\\", \\"id\\": 2, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2015/07/zinc_white_painted_swatch_Lipscher_225-opt.jpg\\"}","{\\"a\\": \\"Blue\\", \\"id\\": 3, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/han-blue-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Green\\", \\"id\\": 4, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Emerald-green-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Yellow\\", \\"id\\": 5, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Indian-yellow-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Red\\", \\"id\\": 6, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/cadmium-red-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Orange\\", \\"id\\": 7, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/03/orange-ochre-painted-swatch-france-300x300.jpg.webp\\"}","{\\"a\\": \\"Pink\\", \\"id\\": 8, \\"img_url\\": \\"https://www.bhphotovideo.com/images/images500x500/Rosco_102303322124_E_Colour_332_Special_Rose_163105.jpg\\"}","{\\"a\\": \\"Purple\\", \\"id\\": 9, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Tyrian-purple-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Gray\\", \\"id\\": 10, \\"img_url\\": \\"https://www.kingplastic.com/wp-content/uploads/2014/05/Charcoal-Gray.png\\"}"}	{"{\\"s\\": \\"Green\\", \\"id\\": 4, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Emerald-green-painted-swatch-300x300.jpg.webp\\"}","{\\"s\\": \\"Orange\\", \\"id\\": 7, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/03/orange-ochre-painted-swatch-france-300x300.jpg.webp\\"}","{\\"a\\": \\"Purple\\", \\"id\\": 9, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Tyrian-purple-painted-swatch-300x300.jpg.webp\\"}"}	2022-07-23 18:12:06.461622+00	2022-07-23 18:12:06.46165+00	{}	4
64	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/2560px-Mastercard-logo.svg.png	Select all of the warm colors.	{"{\\"a\\": \\"Yellow\\", \\"id\\": 1, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Indian-yellow-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Red\\", \\"id\\": 2, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/cadmium-red-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Green\\", \\"id\\": 3, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Emerald-green-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Gold\\", \\"id\\": 4, \\"img_url\\": \\"https://images.ctfassets.net/j001bqnk84dk/1gVAHuvdEvHkePmsjKNHKw/ddc8f0658f2f660e2c75ad8c189e07d4/Metallic-Finish-Gold.jpg\\"}","{\\"a\\": \\"Blue\\", \\"id\\": 5, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2015/10/cerulean-blue-painted-swatch-F.jpg\\"}","{\\"a\\": \\"Purple\\", \\"id\\": 6, \\"img_url\\": \\"https://static.wikia.nocookie.net/aesthetics/images/b/bc/Updated_Purple_Texture.png/revision/latest?cb=20210208160804\\"}","{\\"a\\": \\"Brown\\", \\"id\\": 7, \\"img_url\\": \\"https://freesvg.org/img/brown.png\\"}","{\\"a\\": \\"Teal\\", \\"id\\": 8, \\"img_url\\": \\"https://www.glidden.com/cms/getmedia/ac0058e1-1846-43db-a970-97d943914e24/room-swatch_teal-we-meet-again__ppg17-32.jpg\\"}","{\\"a\\": \\"Silver\\", \\"id\\": 9, \\"img_url\\": \\"https://www.color-name.com/color-image?c=A8A9AD&square\\"}","{\\"a\\": \\"Orange\\", \\"id\\": 10, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/03/orange-ochre-painted-swatch-france-300x300.jpg.webp\\"}"}	{"{\\"s\\": \\"Yellow\\", \\"id\\": 1, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Indian-yellow-painted-swatch-300x300.jpg.webp\\"}","{\\"s\\": \\"Red\\", \\"id\\": 2, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/cadmium-red-painted-swatch-300x300.jpg.webp\\"}","{\\"s\\": \\"Gold\\", \\"id\\": 4, \\"img_url\\": \\"https://images.ctfassets.net/j001bqnk84dk/1gVAHuvdEvHkePmsjKNHKw/ddc8f0658f2f660e2c75ad8c189e07d4/Metallic-Finish-Gold.jpg\\"}","{\\"s\\": \\"Brown\\", \\"id\\": 7, \\"img_url\\": \\"https://freesvg.org/img/brown.png\\"}","{\\"s\\": \\"Orange\\", \\"id\\": 10, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/03/orange-ochre-painted-swatch-france-300x300.jpg.webp\\"}"}	2022-07-23 19:44:10.439222+00	2022-07-23 19:44:10.439267+00	{}	4
65	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/2560px-Mastercard-logo.svg.png	Select all of the cool colors.	{"{\\"a\\": \\"Yellow\\", \\"id\\": 1, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Indian-yellow-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Red\\", \\"id\\": 2, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/cadmium-red-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Green\\", \\"id\\": 3, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Emerald-green-painted-swatch-300x300.jpg.webp\\"}","{\\"a\\": \\"Gold\\", \\"id\\": 4, \\"img_url\\": \\"https://images.ctfassets.net/j001bqnk84dk/1gVAHuvdEvHkePmsjKNHKw/ddc8f0658f2f660e2c75ad8c189e07d4/Metallic-Finish-Gold.jpg\\"}","{\\"a\\": \\"Blue\\", \\"id\\": 5, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2015/10/cerulean-blue-painted-swatch-F.jpg\\"}","{\\"a\\": \\"Purple\\", \\"id\\": 6, \\"img_url\\": \\"https://static.wikia.nocookie.net/aesthetics/images/b/bc/Updated_Purple_Texture.png/revision/latest?cb=20210208160804\\"}","{\\"a\\": \\"Brown\\", \\"id\\": 7, \\"img_url\\": \\"https://freesvg.org/img/brown.png\\"}","{\\"a\\": \\"Teal\\", \\"id\\": 8, \\"img_url\\": \\"https://www.glidden.com/cms/getmedia/ac0058e1-1846-43db-a970-97d943914e24/room-swatch_teal-we-meet-again__ppg17-32.jpg\\"}","{\\"a\\": \\"Silver\\", \\"id\\": 9, \\"img_url\\": \\"https://www.color-name.com/color-image?c=A8A9AD&square\\"}","{\\"a\\": \\"Orange\\", \\"id\\": 10, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/03/orange-ochre-painted-swatch-france-300x300.jpg.webp\\"}"}	{"{\\"s\\": \\"Green\\", \\"id\\": 3, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2021/02/Emerald-green-painted-swatch-300x300.jpg.webp\\"}","{\\"s\\": \\"Blue\\", \\"id\\": 5, \\"img_url\\": \\"https://colourlex.com/wp-content/uploads/2015/10/cerulean-blue-painted-swatch-F.jpg\\"}","{\\"s\\": \\"Purple\\", \\"id\\": 6, \\"img_url\\": \\"https://static.wikia.nocookie.net/aesthetics/images/b/bc/Updated_Purple_Texture.png/revision/latest?cb=20210208160804\\"}","{\\"a\\": \\"Teal\\", \\"id\\": 8, \\"img_url\\": \\"https://www.glidden.com/cms/getmedia/ac0058e1-1846-43db-a970-97d943914e24/room-swatch_teal-we-meet-again__ppg17-32.jpg\\"}","{\\"a\\": \\"Silver\\", \\"id\\": 9, \\"img_url\\": \\"https://www.color-name.com/color-image?c=A8A9AD&square\\"}"}	2022-07-23 19:46:22.659607+00	2022-07-23 19:46:22.65963+00	{}	4
66	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/2560px-Mastercard-logo.svg.png	Select all of the logos with a monochromatic color scheme.	{"{\\"a\\": \\"Lexus\\", \\"id\\": 1, \\"img_url\\": \\"https://cdn.logojoy.com/wp-content/uploads/2018/08/30155434/413.png\\"}","{\\"a\\": \\"Holiday Inn\\", \\"id\\": 2, \\"img_url\\": \\"https://static.wikia.nocookie.net/logo-timeline/images/c/c0/Holiday_Inn_Logo.svg.png/revision/latest?cb=20190526184918\\"}","{\\"a\\": \\"Tostitos\\", \\"id\\": 3, \\"img_url\\": \\"https://1000logos.net/wp-content/uploads/2017/10/Tostitos-logo-1024x622.jpg\\"}","{\\"a\\": \\"PayPal\\", \\"id\\": 4, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/1200px-PayPal.svg.png\\"}","{\\"a\\": \\"BP\\", \\"id\\": 5, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/en/thumb/d/d2/BP_Helios_logo.svg/1200px-BP_Helios_logo.svg.png\\"}","{\\"a\\": \\"Taco Bell\\", \\"id\\": 6, \\"img_url\\": \\"https://static.wikia.nocookie.net/logopedia/images/4/45/Taco_Bell.svg/revision/latest?cb=20200112222740\\"}","{\\"a\\": \\"FedEx\\", \\"id\\": 7, \\"img_url\\": \\"https://logos-download.com/wp-content/uploads/2016/06/FedEx_logo_orange-purple.png\\"}","{\\"a\\": \\"VASA Fitness\\", \\"id\\": 8, \\"img_url\\": \\"https://vasafitness.com/wp-content/uploads/2020/07/VASA-Vertical_Emblem_Inverted_Logo-RGB@1200x-1024x1024.png\\"}","{\\"a\\": \\"Slack\\", \\"id\\": 9, \\"img_url\\": \\"https://a.slack-edge.com/bv1-9/slack_logo-ebd02d1.svg\\"}","{\\"a\\": \\"Pepsi\\", \\"id\\": 10, \\"img_url\\": \\"https://1000logos.net/wp-content/uploads/2017/05/Pepsi-Logo.png\\"}"}	{"{\\"s\\": \\"Lexus\\", \\"id\\": 1, \\"img_url\\": \\"https://cdn.logojoy.com/wp-content/uploads/2018/08/30155434/413.png\\"}","{\\"s\\": \\"Holiday Inn\\", \\"id\\": 2, \\"img_url\\": \\"https://static.wikia.nocookie.net/logo-timeline/images/c/c0/Holiday_Inn_Logo.svg.png/revision/latest?cb=20190526184918\\"}","{\\"s\\": \\"PayPal\\", \\"id\\": 4, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/1200px-PayPal.svg.png\\"}","{\\"s\\": \\"VASA Fitness\\", \\"id\\": 8, \\"img_url\\": \\"https://vasafitness.com/wp-content/uploads/2020/07/VASA-Vertical_Emblem_Inverted_Logo-RGB@1200x-1024x1024.png\\"}"}	2022-07-23 20:34:42.145465+00	2022-07-23 20:34:42.145516+00	{}	4
68		How do you make a color tint?	{"{\\"a\\": \\"You take a color and add white to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add gray to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add black to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add its complement to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add another primary color to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a secondary color to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a tertiary color to it.\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add another secondary color to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add a tertiary color to it.\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a tertiary color and add another tertiary color to it.\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"You take a color and add white to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}"}	2022-07-28 17:31:25.547481+00	2022-07-28 17:31:25.547504+00	{}	4
69		How do you make a color shade?	{"{\\"a\\": \\"You take a color and add white to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add gray to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add black to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add its complement to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add another primary color to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a secondary color to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a tertiary color to it.\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add another secondary color to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add a tertiary color to it.\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a tertiary color and add another tertiary color to it.\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"You take a color and add black to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}"}	2022-07-28 17:32:17.62858+00	2022-07-28 17:32:17.628605+00	{}	4
71		How do you make a black or brown color?	{"{\\"a\\": \\"You take a color and add white to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add gray to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add black to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add its complement to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add another primary color to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a secondary color to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a tertiary color to it.\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add another secondary color to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add a tertiary color to it.\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a tertiary color and add another tertiary color to it.\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"You take a color and add its complement to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}"}	2022-07-28 17:42:20.85937+00	2022-07-28 17:42:20.859393+00	{}	4
77		How do you make teal?	{"{\\"a\\": \\"You take blue and add yellow to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take yellow and add purple to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take red and add yellow to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take blue and add red to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add purple to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take purple and add green to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add blue to it.\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take green and add blue to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take red and add green to it\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add yellow to it.\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"You take green and add blue to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}"}	2022-07-28 19:42:41.348102+00	2022-07-28 19:42:41.348126+00	{}	4
67		Select all of the logos with a triadic color scheme.	{"{\\"a\\": \\"Oreo\\", \\"id\\": 1, \\"img_url\\": \\"https://www.pngitem.com/pimgs/m/75-757619_oreo-bolacha-logo-png-e-vetor-logo-oreo.png\\"}","{\\"a\\": \\"Red Bull\\", \\"id\\": 2, \\"img_url\\": \\"https://1000logos.net/wp-content/uploads/2021/04/Red-Bull-logo.png\\"}","{\\"a\\": \\"Burger King\\", \\"id\\": 3, \\"img_url\\": \\"https://toppng.com//public/uploads/preview/burger-king-logo-burger-king-vector-11562931679xqh7urb6v8.png\\"}","{\\"a\\": \\"Fanta\\", \\"id\\": 4, \\"img_url\\": \\"https://logodix.com/logo/431690.png\\"}","{\\"a\\": \\"Best Western\\", \\"id\\": 5, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Best_Western_logo.svg/1200px-Best_Western_logo.svg.png\\"}","{\\"a\\": \\"Krispy Kreme\\", \\"id\\": 6, \\"img_url\\": \\"https://www.clipartmax.com/png/middle/302-3029805_davids-studios-complementary-colors-in-logos.png\\"}","{\\"a\\": \\"Firefox\\", \\"id\\": 7, \\"img_url\\": \\"https://design.firefox.com/product-identity/firefox/firefox/firefox-logo.png\\"}","{\\"a\\": \\"eBay\\", \\"id\\": 8, \\"img_url\\": \\"https://www.pngitem.com/pimgs/m/203-2039098_tetradic-color-scheme-logo-ebay-gift-card-100.png\\"}","{\\"a\\": \\"IKEA\\", \\"id\\": 9, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Ikea_logo.svg/1200px-Ikea_logo.svg.png\\"}","{\\"a\\": \\"Tide\\", \\"id\\": 10, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Tide_logo.svg/2048px-Tide_logo.svg.png\\"}"}	{"{\\"s\\": \\"Burger King\\", \\"id\\": 3, \\"img_url\\": \\"https://toppng.com//public/uploads/preview/burger-king-logo-burger-king-vector-11562931679xqh7urb6v8.png\\"}","{\\"s\\": \\"Fanta\\", \\"id\\": 4, \\"img_url\\": \\"https://logodix.com/logo/431690.png\\"}","{\\"s\\": \\"Best Western\\", \\"id\\": 5, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Best_Western_logo.svg/1200px-Best_Western_logo.svg.png\\"}","{\\"s\\": \\"Firefox\\", \\"id\\": 7, \\"img_url\\": \\"https://design.firefox.com/product-identity/firefox/firefox/firefox-logo.png\\"}","{\\"s\\": \\"Tide\\", \\"id\\": 10, \\"img_url\\": \\"https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Tide_logo.svg/2048px-Tide_logo.svg.png\\"}"}	2022-07-23 22:09:34.080131+00	2022-07-28 17:46:54.402906+00	{}	4
72		How do you make a color tone?	{"{\\"a\\": \\"You take a color and add white to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add gray to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add black to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add its complement to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add another primary color to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a secondary color to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a tertiary color to it.\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add another secondary color to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add a tertiary color to it.\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a tertiary color and add another tertiary color to it.\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"You take a color and add gray to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}"}	2022-07-28 19:08:01.927748+00	2022-07-28 19:08:01.927771+00	{}	4
73		How do you make a tertiary color?	{"{\\"a\\": \\"You take a color and add white to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add gray to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add black to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a color and add its complement to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add another primary color to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a secondary color to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a primary color and add a tertiary color to it.\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add another secondary color to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a secondary color and add a tertiary color to it.\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take a tertiary color and add another tertiary color to it.\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"You take a primary color and add a secondary color to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}"}	2022-07-28 19:18:02.582031+00	2022-07-28 19:18:02.582053+00	{}	4
75		How do you make purple?	{"{\\"a\\": \\"You take blue and add yellow to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take yellow and add purple to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take red and add yellow to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take blue and add red to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add purple to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take purple and add green to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add blue to it.\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take green and add blue to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take red and add green to it\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add yellow to it.\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"You take blue and add red to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}"}	2022-07-28 19:38:08.697388+00	2022-07-28 19:48:56.863627+00	{}	4
76		How do you make green?	{"{\\"a\\": \\"You take blue and add yellow to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take yellow and add purple to it.\\", \\"id\\": 2, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take red and add yellow to it.\\", \\"id\\": 3, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take blue and add red to it.\\", \\"id\\": 4, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add purple to it.\\", \\"id\\": 5, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take purple and add green to it.\\", \\"id\\": 6, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add blue to it.\\", \\"id\\": 7, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take green and add blue to it.\\", \\"id\\": 8, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take red and add green to it\\", \\"id\\": 9, \\"img_url\\": \\"\\"}","{\\"a\\": \\"You take orange and add yellow to it.\\", \\"id\\": 10, \\"img_url\\": \\"\\"}"}	{"{\\"s\\": \\"You take blue and add yellow to it.\\", \\"id\\": 1, \\"img_url\\": \\"\\"}"}	2022-07-28 19:40:06.550262+00	2022-07-28 19:49:02.180325+00	{}	4
78		Painting uses subtractive colors.	{"{\\"a\\": \\"True\\", \\"id\\": 1, \\"img_url\\": \\"\\"}","{\\"a\\": \\"False\\", \\"id\\": 2, \\"img_url\\": \\"\\"}"}	{"{\\"a\\": \\"True\\", \\"id\\": 1, \\"img_url\\": \\"\\"}"}	2022-07-28 21:39:44.790598+00	2022-07-28 21:39:44.790633+00	{}	4
\.


--
-- Data for Name: qe_demoquiz; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.qe_demoquiz (id, name, description, img_url, category, subcategory, created_at, updated_at, tags) FROM stdin;
1	Animal Match	This is a quiz to test your animal knowledge.	https://res.cloudinary.com/dk-find-out/image/upload/q_80,w_1920,f_auto/Animal_kingdom_nzwbda.jpg	Ecology		2022-07-09 03:31:01.461227+00	2022-07-09 03:31:01.461253+00	{}
2	Spelling Bee	This is a quiz to test your spelling.	https://www.sccpss.com/schools/abw/PublishingImages/Spelling%20Bee%202021.JPG	English		2022-07-09 03:37:06.851704+00	2022-07-09 03:37:06.85173+00	{}
3	Math-a-Maze	This is a quiz to test your math skills.	https://img.freepik.com/free-vector/hand-drawn-mathematical-symbols_23-2148764926.jpg?w=2000	Math		2022-07-09 03:55:40.349952+00	2022-07-09 03:55:40.349977+00	{}
4	Artisan	This is a quiz to discover your artistic side.	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa0jX57AEbdiuSHs75N85rYSXH0TTCUThMXA&usqp=CAU	Art		2022-07-09 04:04:15.587237+00	2022-07-09 04:04:15.587262+00	{}
\.


--
-- Data for Name: qe_game; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.qe_game (id, name, description, img_url, created_at, updated_at, tags) FROM stdin;
\.


--
-- Data for Name: qe_question; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.qe_question (id, img_url, question, answer, solution, best_time, time_limit, created_at, updated_at, tags, quiz_id_id, user_id) FROM stdin;
1		Which chess pieces are more valuable than the rook?	{"\\"pawn\\"","\\"knight\\"","\\"bishop\\"","\\"queen\\"","\\"king\\""}	{"\\"queen\\"","\\"king\\""}	0.00	0.00	2022-08-19 04:17:15.006156+00	2022-08-19 04:17:15.006175+00	{}	1	1
\.


--
-- Data for Name: qe_quiz; Type: TABLE DATA; Schema: public; Owner: inmntgxeunxghp
--

COPY public.qe_quiz (id, user_id, name, description, img_url, category, subcategory, best_score, best_time, time_limit, created_at, updated_at, curr_score, curr_time, tags) FROM stdin;
1	1	Checkmate!			problem-solving		0.00	0.00	0.00	2022-08-19 04:11:51.243844+00	2022-08-19 04:11:51.24387+00	0.00	0.00	{}
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: authen_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.authen_user_groups_id_seq', 1, false);


--
-- Name: authen_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.authen_user_id_seq', 2, true);


--
-- Name: authen_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.authen_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: qe_demoquestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.qe_demoquestion_id_seq', 1, false);


--
-- Name: qe_demoquiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.qe_demoquiz_id_seq', 4, true);


--
-- Name: qe_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.qe_game_id_seq', 1, false);


--
-- Name: qe_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.qe_question_id_seq', 1, true);


--
-- Name: qe_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inmntgxeunxghp
--

SELECT pg_catalog.setval('public.qe_quiz_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authen_user authen_user_email_key; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user
    ADD CONSTRAINT authen_user_email_key UNIQUE (email);


--
-- Name: authen_user_groups authen_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user_groups
    ADD CONSTRAINT authen_user_groups_pkey PRIMARY KEY (id);


--
-- Name: authen_user_groups authen_user_groups_user_id_group_id_162fc86d_uniq; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user_groups
    ADD CONSTRAINT authen_user_groups_user_id_group_id_162fc86d_uniq UNIQUE (user_id, group_id);


--
-- Name: authen_user authen_user_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user
    ADD CONSTRAINT authen_user_pkey PRIMARY KEY (id);


--
-- Name: authen_user_user_permissions authen_user_user_permiss_user_id_permission_id_3834585a_uniq; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user_user_permissions
    ADD CONSTRAINT authen_user_user_permiss_user_id_permission_id_3834585a_uniq UNIQUE (user_id, permission_id);


--
-- Name: authen_user_user_permissions authen_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user_user_permissions
    ADD CONSTRAINT authen_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: authen_user authen_user_username_key; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user
    ADD CONSTRAINT authen_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: qe_demoquestion qe_demoquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_demoquestion
    ADD CONSTRAINT qe_demoquestion_pkey PRIMARY KEY (id);


--
-- Name: qe_demoquiz qe_demoquiz_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_demoquiz
    ADD CONSTRAINT qe_demoquiz_pkey PRIMARY KEY (id);


--
-- Name: qe_game qe_game_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_game
    ADD CONSTRAINT qe_game_pkey PRIMARY KEY (id);


--
-- Name: qe_question qe_question_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_question
    ADD CONSTRAINT qe_question_pkey PRIMARY KEY (id);


--
-- Name: qe_quiz qe_quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_quiz
    ADD CONSTRAINT qe_quiz_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authen_user_email_aa58b2fc_like; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX authen_user_email_aa58b2fc_like ON public.authen_user USING btree (email varchar_pattern_ops);


--
-- Name: authen_user_groups_group_id_bc335d58; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX authen_user_groups_group_id_bc335d58 ON public.authen_user_groups USING btree (group_id);


--
-- Name: authen_user_groups_user_id_3b4ee906; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX authen_user_groups_user_id_3b4ee906 ON public.authen_user_groups USING btree (user_id);


--
-- Name: authen_user_user_permissions_permission_id_eb0a78b8; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX authen_user_user_permissions_permission_id_eb0a78b8 ON public.authen_user_user_permissions USING btree (permission_id);


--
-- Name: authen_user_user_permissions_user_id_766f6300; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX authen_user_user_permissions_user_id_766f6300 ON public.authen_user_user_permissions USING btree (user_id);


--
-- Name: authen_user_username_a0a623a0_like; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX authen_user_username_a0a623a0_like ON public.authen_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: qe_demoquestion_quiz_id_id_165a3ddf; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX qe_demoquestion_quiz_id_id_165a3ddf ON public.qe_demoquestion USING btree (quiz_id_id);


--
-- Name: qe_question_quiz_id_id_d1f95b5a; Type: INDEX; Schema: public; Owner: inmntgxeunxghp
--

CREATE INDEX qe_question_quiz_id_id_d1f95b5a ON public.qe_question USING btree (quiz_id_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authen_user_groups authen_user_groups_group_id_bc335d58_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user_groups
    ADD CONSTRAINT authen_user_groups_group_id_bc335d58_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authen_user_groups authen_user_groups_user_id_3b4ee906_fk_authen_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user_groups
    ADD CONSTRAINT authen_user_groups_user_id_3b4ee906_fk_authen_user_id FOREIGN KEY (user_id) REFERENCES public.authen_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authen_user_user_permissions authen_user_user_per_permission_id_eb0a78b8_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user_user_permissions
    ADD CONSTRAINT authen_user_user_per_permission_id_eb0a78b8_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authen_user_user_permissions authen_user_user_permissions_user_id_766f6300_fk_authen_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.authen_user_user_permissions
    ADD CONSTRAINT authen_user_user_permissions_user_id_766f6300_fk_authen_user_id FOREIGN KEY (user_id) REFERENCES public.authen_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_authen_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authen_user_id FOREIGN KEY (user_id) REFERENCES public.authen_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qe_demoquestion qe_demoquestion_quiz_id_id_165a3ddf_fk_qe_demoquiz_id; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_demoquestion
    ADD CONSTRAINT qe_demoquestion_quiz_id_id_165a3ddf_fk_qe_demoquiz_id FOREIGN KEY (quiz_id_id) REFERENCES public.qe_demoquiz(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qe_question qe_question_quiz_id_id_d1f95b5a_fk_qe_quiz_id; Type: FK CONSTRAINT; Schema: public; Owner: inmntgxeunxghp
--

ALTER TABLE ONLY public.qe_question
    ADD CONSTRAINT qe_question_quiz_id_id_d1f95b5a_fk_qe_quiz_id FOREIGN KEY (quiz_id_id) REFERENCES public.qe_quiz(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: u3hh3pd4rk21gv
--

GRANT USAGE ON SCHEMA heroku_ext TO inmntgxeunxghp;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: inmntgxeunxghp
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO inmntgxeunxghp;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO inmntgxeunxghp;


--
-- PostgreSQL database dump complete
--

