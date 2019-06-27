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
    id_step integer
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
    id_step integer,
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

COPY public.answers (id, answer, id_step) FROM stdin;
3	Living in a community is not an issue for me	2
16	I am not sociable	2
20	Yes I do	5
1	Yes I am sociable	1
2	No way	1
15	I am aware of that	10
21	No I do not	5
14	I do not take this seriously	10
4	Yes, I am cold-blooded	3
18	Yes I am determined	4
17	No I am not	3
19	No I am not ready	4
\.


--
-- Data for Name: content; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.content (id, source, type, subtitle, "order", content, id_step) FROM stdin;
20	\N	text	This is the end	0	Thanks to you, thousands of whales are still alive, and recently, Japanese whalers have banned fishing in the whale sanctuary	6
22	uploads/myImage-1561542040062.mp4	video		1		6
33	\N	text	The end	0	Thanks to the mission, thousands of whales have been saved. Recently actions have been taken to prevent whale fishing in concerned areas. We need more people like you!	10
9	\N	text	Your tasks	0	Hunting whaling ships will not be your only objective on the ship. Your primary tasks will consist of maintaining the ship and the moral of the crew. Every crew member will rely on other members. Your soft skills will be highly important.	2
25	uploads/myImage-1561630313617.mp4	video		3		1
26	uploads/myImage-1561630361173.mp4	video		1		2
27	uploads/myImage-1561630411285.mp4	video		1		3
28	uploads/myImage-1561630458082.mp4	video		1		4
29	uploads/myImage-1561630491568.mp4	video		2		4
30	uploads/myImage-1561630526475.mp4	video		3		4
31	uploads/myImage-1561630607581.mp4	video		1		5
32	uploads/myImage-1561630639244.mp4	video		2		5
34	uploads/myImage-1561630806480.mp4	video		1		10
5	\N	text	Welcome !	0	Embarked on one of the ships in Sea-Shepherd's fleet. Attends the traditional departure of a boat and the final preparations. Prepare yourself to be thrown into a Sea Shepherd mission, you will see the reality through the everyday life of seamen \n	1
24	uploads/myImage-1561630230090.mp4	video		1		1
7	\N	text	The brief	2	Now that you on board, you will attend to the captain's brief to learn more about your futur mission. He will explain you how you are going to live on the ship and what kind of dangers you will possibly encounter. You will also meet the rest of the crew with whom you will live during several months.	1
35	\N	text	A short-lived dream	2	You are about to live an amazing adventure, where ocean will amaze you. But like any other adventure, there will be also unexpected events that will cause some stressful situations.	3
13	\N	text	Common issues	0	During your journey, you will encounter unforeseen events such as seasickness, shipwrecks and so on.	4
11	\N	text	A blue dream	0	If you commit yourself, it is for the love of the oceans and the desire to make the difference. You will evolve surrounded by nature and far from any civilization.	3
16	\N	text	Prepare for the battle	0	Action is part of our everyday life. Attacking whaling ships is our first priority of the mission, but it is also very dangerous. You will have to be mentally and physically prepared and moreover respecting orders and hierarchy, democracy does not have its place on our ships.	5
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20190620093559_users.js	1	2019-06-26 22:14:30.878+02
2	20190620094712_reply.js	1	2019-06-26 22:14:30.884+02
3	20190620094718_questions.js	1	2019-06-26 22:14:30.889+02
4	20190620094726_answers.js	1	2019-06-26 22:14:30.894+02
5	20190620094731_content.js	1	2019-06-26 22:14:30.898+02
6	20190620094736_steps.js	1	2019-06-26 22:14:30.91+02
7	20190620163512_admins.js	1	2019-06-26 22:14:30.922+02
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
7	Are you aware of the journey that we are offering you?	10
3	Are you ready to live with total strangers for several months?	1
2	Is living in a community an issue for you?	2
8	Are you ready to face all dangers?	4
1	Can you manage your stress?	3
9	Do you have any medical issues?	5
\.


--
-- Data for Name: reply; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.reply (id, id_step, id_user, id_answer) FROM stdin;
1	1	7	1
2	1	7	2
3	1	7	1
4	1	7	2
5	1	8	1
6	1	8	2
7	1	8	1
8	1	9	1
9	1	11	1
10	1	11	1
19	1	31	1
20	1	31	1
21	1	31	2
22	2	31	3
23	3	31	4
24	4	31	18
25	4	31	18
26	5	31	20
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: pro-edwin
--

COPY public.steps (id, longitude, latitude, title, description, next) FROM stdin;
3	45.351	48.8567	Step 3	THE MAGIC	4
1	2.351	48.8567	Step 1	Boarding and departure	2
4	12.351	48.8567	Step 4	The unforeseen events	5
5	25.351	48.8567	Step 5	At the boarding	10
10	30	53	Step 6	Mission achieved	10
2	10.351	48.8567	Step 2	THE DRUDGERY	3
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
7	Hey	26/06/2019
8	Hello	26/06/2019
9	Vui	26/06/2019
10	Hallo	27/06/2019
11	Hallo	27/06/2019
12	Good	27/06/2019
30	Laos	27/06/2019
31	Virgil	27/06/2019
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.answers_id_seq', 21, true);


--
-- Name: content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.content_id_seq', 35, true);


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

SELECT pg_catalog.setval('public.questions_id_seq', 9, true);


--
-- Name: reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.reply_id_seq', 26, true);


--
-- Name: steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.steps_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pro-edwin
--

SELECT pg_catalog.setval('public.users_id_seq', 31, true);


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

