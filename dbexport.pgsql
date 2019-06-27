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
-- Name: admins; Type: TABLE; Schema: public; Owner: CassandraHETIC
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    name text,
    password text
);


ALTER TABLE public.admins OWNER TO "CassandraHETIC";

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: CassandraHETIC
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO "CassandraHETIC";

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CassandraHETIC
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: answers; Type: TABLE; Schema: public; Owner: CassandraHETIC
--

CREATE TABLE public.answers (
    id integer NOT NULL,
    answer text,
    id_question integer
);


ALTER TABLE public.answers OWNER TO "CassandraHETIC";

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: CassandraHETIC
--

CREATE SEQUENCE public.answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO "CassandraHETIC";

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CassandraHETIC
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: content; Type: TABLE; Schema: public; Owner: CassandraHETIC
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


ALTER TABLE public.content OWNER TO "CassandraHETIC";

--
-- Name: content_id_seq; Type: SEQUENCE; Schema: public; Owner: CassandraHETIC
--

CREATE SEQUENCE public.content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_id_seq OWNER TO "CassandraHETIC";

--
-- Name: content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CassandraHETIC
--

ALTER SEQUENCE public.content_id_seq OWNED BY public.content.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: CassandraHETIC
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO "CassandraHETIC";

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: CassandraHETIC
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO "CassandraHETIC";

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CassandraHETIC
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: CassandraHETIC
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO "CassandraHETIC";

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: CassandraHETIC
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO "CassandraHETIC";

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CassandraHETIC
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: CassandraHETIC
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    title text,
    id_step integer
);


ALTER TABLE public.questions OWNER TO "CassandraHETIC";

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: CassandraHETIC
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO "CassandraHETIC";

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CassandraHETIC
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: reply; Type: TABLE; Schema: public; Owner: CassandraHETIC
--

CREATE TABLE public.reply (
    id integer NOT NULL,
    id_question integer,
    id_user integer,
    id_answer integer
);


ALTER TABLE public.reply OWNER TO "CassandraHETIC";

--
-- Name: reply_id_seq; Type: SEQUENCE; Schema: public; Owner: CassandraHETIC
--

CREATE SEQUENCE public.reply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reply_id_seq OWNER TO "CassandraHETIC";

--
-- Name: reply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CassandraHETIC
--

ALTER SEQUENCE public.reply_id_seq OWNED BY public.reply.id;


--
-- Name: steps; Type: TABLE; Schema: public; Owner: CassandraHETIC
--

CREATE TABLE public.steps (
    id integer NOT NULL,
    longitude text,
    latitude text,
    title text,
    description text,
    next integer
);


ALTER TABLE public.steps OWNER TO "CassandraHETIC";

--
-- Name: steps_id_seq; Type: SEQUENCE; Schema: public; Owner: CassandraHETIC
--

CREATE SEQUENCE public.steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.steps_id_seq OWNER TO "CassandraHETIC";

--
-- Name: steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CassandraHETIC
--

ALTER SEQUENCE public.steps_id_seq OWNED BY public.steps.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: CassandraHETIC
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    date text
);


ALTER TABLE public.users OWNER TO "CassandraHETIC";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: CassandraHETIC
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "CassandraHETIC";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CassandraHETIC
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: content id; Type: DEFAULT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.content ALTER COLUMN id SET DEFAULT nextval('public.content_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: reply id; Type: DEFAULT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.reply ALTER COLUMN id SET DEFAULT nextval('public.reply_id_seq'::regclass);


--
-- Name: steps id; Type: DEFAULT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.steps ALTER COLUMN id SET DEFAULT nextval('public.steps_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: CassandraHETIC
--

COPY public.admins (id, name, password) FROM stdin;
1	admin	admin
\.


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: CassandraHETIC
--

COPY public.answers (id, answer, id_question) FROM stdin;
1	Yes i'm a man	1
2	No, I'm men	2
3	Yes, but you can say GOD	3
\.


--
-- Data for Name: content; Type: TABLE DATA; Schema: public; Owner: CassandraHETIC
--

COPY public.content (id, source, type, subtitle, "order", content, id_step) FROM stdin;
3	\N	text	Welcome !	1	Embarked on one of the ships in Sea-Shepherd's fleet. Attends the traditional departure of a boat and the final preparations.	1
4	uploads/myImage-1561407171891.mp4	video		2		1
7	uploads/myImage-1561407745301.mp4	video		4		1
6	\N	text		3	Now attend the captain's briefing.	1
8	\N	text		0	With many volunteers embarking on Sea-Shepherd, being a mission in Arctic waters is not easy.\nIndeed, you are people living on the ship which means that you have to do the daily tasks, the cleaning chores...\nSleeping in and lazy people can refrain from getting involved.\nBut we must keep in mind that all these things are done in coordination and in a very strong team spirit.	2
9	uploads/myImage-1561408269554.mp4	video		2		2
11	uploads/myImage-1561408543620.mp4	video		2		3
10	\N	text	The magic	1	If you commit yourself, it is for the love of the oceans and the desire to make a difference.\nIn the middle of the mission you will be amazed, see the ocean as you have never seen it before.	3
15	uploads/myImage-1561408917896.mp4	video		4		4
14	uploads/myImage-1561408887120.mp4	video		3		4
13	uploads/myImage-1561408871284.mp4	video		2		4
12	\N	text		1	During your journey, you will encounter unforeseen events such as seasickness, a boat turning over in the open sea and a drone spitting out.	4
16	\N	text	It's time for the fight !	1		5
17	uploads/myImage-1561409147163.mp4	video		2		5
18	\N	text	This is the end	1	Thanks to you, thousands of whales are still alive, and recently, Japanese whalers have banned fishing in the whale sanctuary	6
19	uploads/myImage-1561409380301.mp4	video		2		6
20	uploads/myImage-1561538397302.mp4	video		3		5
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: CassandraHETIC
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20190620093559_users.js	1	2019-06-24 17:49:42.792+02
2	20190620094712_reply.js	1	2019-06-24 17:49:42.796+02
3	20190620094718_questions.js	1	2019-06-24 17:49:42.8+02
4	20190620094726_answers.js	1	2019-06-24 17:49:42.804+02
5	20190620094731_content.js	1	2019-06-24 17:49:42.808+02
6	20190620094736_steps.js	1	2019-06-24 17:49:42.812+02
7	20190620163512_admins.js	1	2019-06-24 17:49:42.816+02
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: CassandraHETIC
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: CassandraHETIC
--

COPY public.questions (id, title, id_step) FROM stdin;
1	Are you a man	8
2	Are you a woman	5
3	Are you Edwin	1
\.


--
-- Data for Name: reply; Type: TABLE DATA; Schema: public; Owner: CassandraHETIC
--

COPY public.reply (id, id_question, id_user, id_answer) FROM stdin;
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: CassandraHETIC
--

COPY public.steps (id, longitude, latitude, title, description, next) FROM stdin;
3	-26.655598	66.938345	Step 03	The magic	\N
4	5.313321	77.158406	Step 04	The unforeseen events	\N
5	-65.933134	72.628393	Step 05	At the boarding	\N
6	-53.899640	59.998149	Step 06	Mission achieved	3
1	-5.055113	48.316947	Step 01 	Boarding and departure	\N
2	-26.943062	54.214195	Step 02	The drudgery	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: CassandraHETIC
--

COPY public.users (id, name, date) FROM stdin;
1	Edwin	20/06/2019
2	Jason	01/06/2019
3	Kento	12/06/2019
4	Cassandra	02/06/2019
5	Tristan	14/06/2019
6	Virgil	13/06/2019
7	Cassandra	24/06/2019
8	Cassou	24/06/2019
9		24/06/2019
10		24/06/2019
11		25/06/2019
12		25/06/2019
13		25/06/2019
14	Cassandra	26/06/2019
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CassandraHETIC
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CassandraHETIC
--

SELECT pg_catalog.setval('public.answers_id_seq', 3, true);


--
-- Name: content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CassandraHETIC
--

SELECT pg_catalog.setval('public.content_id_seq', 20, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CassandraHETIC
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 7, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: CassandraHETIC
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CassandraHETIC
--

SELECT pg_catalog.setval('public.questions_id_seq', 3, true);


--
-- Name: reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CassandraHETIC
--

SELECT pg_catalog.setval('public.reply_id_seq', 1, false);


--
-- Name: steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CassandraHETIC
--

SELECT pg_catalog.setval('public.steps_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CassandraHETIC
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: content content_pkey; Type: CONSTRAINT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: reply reply_pkey; Type: CONSTRAINT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.reply
    ADD CONSTRAINT reply_pkey PRIMARY KEY (id);


--
-- Name: steps steps_pkey; Type: CONSTRAINT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: CassandraHETIC
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

