--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

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

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: pro-edwin
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    name text,
    password text
);


ALTER TABLE public.admins OWNER TO "pro-edwin";

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: pro-edwin
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO "pro-edwin";

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pro-edwin
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: answers; Type: TABLE; Schema: public; Owner: pro-edwin
--

CREATE TABLE public.answers (
    id integer NOT NULL,
    answer text,
    id_question integer
);


ALTER TABLE public.answers OWNER TO "pro-edwin";

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: pro-edwin
--

CREATE SEQUENCE public.answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO "pro-edwin";

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pro-edwin
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: content; Type: TABLE; Schema: public; Owner: pro-edwin
--

CREATE TABLE public.content (
    id integer NOT NULL,
    source text,
    type text,
    subtitle text,
    "order" integer,
    content text,
    id_step integer
);


ALTER TABLE public.content OWNER TO "pro-edwin";

--
-- Name: content_id_seq; Type: SEQUENCE; Schema: public; Owner: pro-edwin
--

CREATE SEQUENCE public.content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_id_seq OWNER TO "pro-edwin";

--
-- Name: content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pro-edwin
--

ALTER SEQUENCE public.content_id_seq OWNED BY public.content.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: pro-edwin
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO "pro-edwin";

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: pro-edwin
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO "pro-edwin";

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pro-edwin
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: pro-edwin
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO "pro-edwin";

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: pro-edwin
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO "pro-edwin";

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pro-edwin
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: pro-edwin
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    title text,
    id_step integer
);


ALTER TABLE public.questions OWNER TO "pro-edwin";

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: pro-edwin
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO "pro-edwin";

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pro-edwin
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: reply; Type: TABLE; Schema: public; Owner: pro-edwin
--

CREATE TABLE public.reply (
    id integer NOT NULL,
    id_question integer,
    id_user integer,
    id_answer integer
);


ALTER TABLE public.reply OWNER TO "pro-edwin";

--
-- Name: reply_id_seq; Type: SEQUENCE; Schema: public; Owner: pro-edwin
--

CREATE SEQUENCE public.reply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reply_id_seq OWNER TO "pro-edwin";

--
-- Name: reply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pro-edwin
--

ALTER SEQUENCE public.reply_id_seq OWNED BY public.reply.id;


--
-- Name: steps; Type: TABLE; Schema: public; Owner: pro-edwin
--

CREATE TABLE public.steps (
    id integer NOT NULL,
    longitude text,
    latitude text,
    title text,
    description text,
    next integer
);


ALTER TABLE public.steps OWNER TO "pro-edwin";

--
-- Name: steps_id_seq; Type: SEQUENCE; Schema: public; Owner: pro-edwin
--

CREATE SEQUENCE public.steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.steps_id_seq OWNER TO "pro-edwin";

--
-- Name: steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pro-edwin
--

ALTER SEQUENCE public.steps_id_seq OWNED BY public.steps.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: pro-edwin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    date text
);


ALTER TABLE public.users OWNER TO "pro-edwin";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pro-edwin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "pro-edwin";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pro-edwin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: content id; Type: DEFAULT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.content ALTER COLUMN id SET DEFAULT nextval('public.content_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: reply id; Type: DEFAULT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.reply ALTER COLUMN id SET DEFAULT nextval('public.reply_id_seq'::regclass);


--
-- Name: steps id; Type: DEFAULT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.steps ALTER COLUMN id SET DEFAULT nextval('public.steps_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.admins (id, name, password) FROM stdin;
1	admin	admin
\.


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.answers (id, answer, id_question) FROM stdin;
1	Yes i'm a man	1
2	No, I'm men	2
3	Yes, but you can say GOD	3
\.


--
-- Data for Name: content; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.content (id, source, type, subtitle, "order", content, id_step) FROM stdin;
1	uploads/myImage-1561372325167.png	image	\N	1	\N	6
2	\N	text	le texte de la section 1	0	bonjour et bienvenue pour le départ du bateau 	1
3	uploads/myImage-1561373871962.png	image	Le chateau	2	la description de l'image du chateau	1
4	uploads/myImage-1561374695756.mp4	video	\N	3	\N	1
5	\N	text	vous avez vu la vidéo ?	3	elle est belle hein ?	1
6	uploads/myImage-1561387777368.png	image	blob	1	prout	2
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20190620093559_users.js	1	2019-06-24 12:30:58.778+02
2	20190620094712_reply.js	1	2019-06-24 12:30:58.781+02
3	20190620094718_questions.js	1	2019-06-24 12:30:58.784+02
4	20190620094726_answers.js	1	2019-06-24 12:30:58.787+02
5	20190620094731_content.js	1	2019-06-24 12:30:58.791+02
6	20190620094736_steps.js	1	2019-06-24 12:30:58.794+02
7	20190620163512_admins.js	1	2019-06-24 12:30:58.797+02
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.questions (id, title, id_step) FROM stdin;
1	Are you a man	8
2	Are you a woman	5
3	Are you Edwin	1
\.


--
-- Data for Name: reply; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.reply (id, id_question, id_user, id_answer) FROM stdin;
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.steps (id, longitude, latitude, title, description, next) FROM stdin;
1	2.351	48.8567	Step 1	boarding and departure	2
2	10.351	48.8567	Step 2	description for step 2 !!!	3
3	45.351	48.8567	Step 3	description for step 3 !!!	4
4	12.351	48.8567	Step 4	description for step 4 !!!	5
5	25.351	48.8567	Step 5	description for step 5 !!!	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.users (id, name, date) FROM stdin;
1	Edwin	20/06/2019
2	Jason	01/06/2019
3	Kento	12/06/2019
4	Cassandra	02/06/2019
5	Tristan	14/06/2019
6	Virgil	13/06/2019
7	bob	24/06/2019
8	brendon	24/06/2019
9	k	24/06/2019
10	toile des neiges	24/06/2019
11	Edwin	24/06/2019
12	Edwin	24/06/2019
13	Prout	24/06/2019
14	Zedouin	24/06/2019
15	Zedouin	24/06/2019
16	âul	24/06/2019
17	prout	24/06/2019
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.answers_id_seq', 3, true);


--
-- Name: content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.content_id_seq', 6, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 7, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.questions_id_seq', 3, true);


--
-- Name: reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.reply_id_seq', 1, false);


--
-- Name: steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.steps_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: content content_pkey; Type: CONSTRAINT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: reply reply_pkey; Type: CONSTRAINT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.reply
    ADD CONSTRAINT reply_pkey PRIMARY KEY (id);


--
-- Name: steps steps_pkey; Type: CONSTRAINT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: pro-edwin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

