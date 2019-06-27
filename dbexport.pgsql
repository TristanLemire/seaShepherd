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
-- Name: admins; Type: TABLE; Schema: public; Owner: lemire-HETIC
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    name text,
    password text
);


ALTER TABLE public.admins OWNER TO "lemire-HETIC";

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: lemire-HETIC
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO "lemire-HETIC";

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lemire-HETIC
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: answers; Type: TABLE; Schema: public; Owner: lemire-HETIC
--

CREATE TABLE public.answers (
    id integer NOT NULL,
    answer text,
    id_step integer
);


ALTER TABLE public.answers OWNER TO "lemire-HETIC";

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: lemire-HETIC
--

CREATE SEQUENCE public.answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO "lemire-HETIC";

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lemire-HETIC
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: content; Type: TABLE; Schema: public; Owner: lemire-HETIC
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


ALTER TABLE public.content OWNER TO "lemire-HETIC";

--
-- Name: content_id_seq; Type: SEQUENCE; Schema: public; Owner: lemire-HETIC
--

CREATE SEQUENCE public.content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_id_seq OWNER TO "lemire-HETIC";

--
-- Name: content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lemire-HETIC
--

ALTER SEQUENCE public.content_id_seq OWNED BY public.content.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: lemire-HETIC
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO "lemire-HETIC";

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: lemire-HETIC
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO "lemire-HETIC";

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lemire-HETIC
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: lemire-HETIC
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO "lemire-HETIC";

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: lemire-HETIC
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO "lemire-HETIC";

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lemire-HETIC
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: lemire-HETIC
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    title text,
    id_step integer
);


ALTER TABLE public.questions OWNER TO "lemire-HETIC";

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: lemire-HETIC
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO "lemire-HETIC";

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lemire-HETIC
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: reply; Type: TABLE; Schema: public; Owner: lemire-HETIC
--

CREATE TABLE public.reply (
    id integer NOT NULL,
    id_step integer,
    id_user integer,
    id_answer integer
);


ALTER TABLE public.reply OWNER TO "lemire-HETIC";

--
-- Name: reply_id_seq; Type: SEQUENCE; Schema: public; Owner: lemire-HETIC
--

CREATE SEQUENCE public.reply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reply_id_seq OWNER TO "lemire-HETIC";

--
-- Name: reply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lemire-HETIC
--

ALTER SEQUENCE public.reply_id_seq OWNED BY public.reply.id;


--
-- Name: steps; Type: TABLE; Schema: public; Owner: lemire-HETIC
--

CREATE TABLE public.steps (
    id integer NOT NULL,
    longitude text,
    latitude text,
    title text,
    description text,
    next integer
);


ALTER TABLE public.steps OWNER TO "lemire-HETIC";

--
-- Name: steps_id_seq; Type: SEQUENCE; Schema: public; Owner: lemire-HETIC
--

CREATE SEQUENCE public.steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.steps_id_seq OWNER TO "lemire-HETIC";

--
-- Name: steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lemire-HETIC
--

ALTER SEQUENCE public.steps_id_seq OWNED BY public.steps.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: lemire-HETIC
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    date text
);


ALTER TABLE public.users OWNER TO "lemire-HETIC";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: lemire-HETIC
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "lemire-HETIC";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lemire-HETIC
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: content id; Type: DEFAULT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.content ALTER COLUMN id SET DEFAULT nextval('public.content_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: reply id; Type: DEFAULT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.reply ALTER COLUMN id SET DEFAULT nextval('public.reply_id_seq'::regclass);


--
-- Name: steps id; Type: DEFAULT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.steps ALTER COLUMN id SET DEFAULT nextval('public.steps_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: lemire-HETIC
--

COPY public.admins (id, name, password) FROM stdin;
1	admin	admin
\.


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: lemire-HETIC
--

COPY public.answers (id, answer, id_step) FROM stdin;
4	Yes, I'm not affraid	3
1	 Yes, like a fish in the water!	1
5	No. I am scared	3
6	Y	2
2	 No, like a stone...	1
3	Not a problem at all	2
7	Yes I need meat	2
10	No I don't have any problem	5
12	Yes, I am ready to commit myself	6
11	Yes let me on the floor	5
8	I don't care about dying	4
13	No, I don't like to do so	6
9	I do not want to die!	4
\.


--
-- Data for Name: content; Type: TABLE DATA; Schema: public; Owner: lemire-HETIC
--

COPY public.content (id, source, type, subtitle, "order", content, id_step) FROM stdin;
5	\N	text	Welcome !	0	Embarked on one of the ships in Sea-Shepherd's fleet. Attends the traditional departure of a boat and the final preparations.	1
6	uploads/myImage-1561540655464.mp4	video		1		1
7	\N	text		2	Now attend the captain's briefing.	1
9	\N	text		0	With many volunteers embarking on Sea-Shepherd, being a mission in Arctic waters is not easy.\nIndeed, you are people living on the ship which means that you have to do the daily tasks, the cleaning chores...\nSleeping in and lazy people can refrain from getting involved.\nBut we must keep in mind that all these things are done in coordination and in a very strong team spirit.	2
11	\N	text		0	If you commit yourself, it is for the love of the oceans and the desire to make a difference.\nIn the middle of the mission you will be amazed, see the ocean as you have never seen it before.	3
12	uploads/myImage-1561541204237.mp4	video		1		3
13	\N	text		0	During your journey, you will encounter unforeseen events such as seasickness, a boat turning over in the open sea and a drone spitting out.	4
14	uploads/myImage-1561541316277.mp4	video		1		4
15	uploads/myImage-1561541332884.mp4	video		2		4
16	\N	text		0	It's time for the fight !	5
17	uploads/myImage-1561541491172.mp4	video		1		5
18	uploads/myImage-1561541520205.mp4	video		2		5
19	uploads/myImage-1561541711957.mp4	video		3		4
20	\N	text	This is the end	0	Thanks to you, thousands of whales are still alive, and recently, Japanese whalers have banned fishing in the whale sanctuary	6
22	uploads/myImage-1561542040062.mp4	video		1		6
10	uploads/myImage-1561541012817.mp4	video		1		2
8	uploads/myImage-1561540714211.mp4	video		3		1
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: lemire-HETIC
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20190620093559_users.js	1	2019-06-26 10:15:23.613+02
2	20190620094712_reply.js	1	2019-06-26 10:15:23.62+02
3	20190620094718_questions.js	1	2019-06-26 10:15:23.625+02
4	20190620094726_answers.js	1	2019-06-26 10:15:23.629+02
5	20190620094731_content.js	1	2019-06-26 10:15:23.633+02
6	20190620094736_steps.js	1	2019-06-26 10:15:23.637+02
7	20190620163512_admins.js	1	2019-06-26 10:15:23.64+02
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: lemire-HETIC
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: lemire-HETIC
--

COPY public.questions (id, title, id_step) FROM stdin;
3	Can you swim?	1
2	 Eating vegan is a problem for you?	2
1	Have you thought about the possibility of dying on this mission?	3
4	Have you thought about the possibility of dying on this mission? 	4
5	Are you seasick?	5
6	Are you ready to participate in the daily tasks/chores on the boat?	6
\.


--
-- Data for Name: reply; Type: TABLE DATA; Schema: public; Owner: lemire-HETIC
--

COPY public.reply (id, id_step, id_user, id_answer) FROM stdin;
1	1	18	1
2	1	10	2
3	1	10	1
4	1	12	1
5	2	12	3
6	3	12	4
7	4	12	8
8	5	12	10
9	6	12	12
10	6	12	12
11	6	12	13
12	6	12	13
13	1	25	1
14	2	26	3
15	3	26	5
16	1	29	1
17	2	29	7
18	3	29	4
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: lemire-HETIC
--

COPY public.steps (id, longitude, latitude, title, description, next) FROM stdin;
6	-53.899640	59.998149	Mission achieved	Mission achieved	6
9	\N	\N	testz	testz	\N
2	-26.943062	54.214195	The drudgery	The drudgery	3
1	-5.055113	48.316947	Boarding and departure	Boarding and departure	2
3	-26.655598	66.938345	The magic	The magic	4
4	5.313321	77.158406	The unforeseen events	The unforeseen events	5
5	-65.933134	72.628393	At the boarding	At the boarding	6
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lemire-HETIC
--

COPY public.users (id, name, date) FROM stdin;
1	Edwin	20/06/2019
2	Jason	01/06/2019
3	Kento	12/06/2019
4	Cassandra	02/06/2019
5	Tristan	14/06/2019
6	Virgil	13/06/2019
7	Tristan	26/06/2019
8	Tristan	26/06/2019
9	Tristan	26/06/2019
10	Jayjay	26/06/2019
11	Tristan	26/06/2019
12	Bastien	26/06/2019
13	Tristan	26/06/2019
14	Tristan	26/06/2019
15	Tristan	26/06/2019
16	Tristan	26/06/2019
17	Tristan	26/06/2019
18	Tristan	26/06/2019
19	Tristan	26/06/2019
20	Salope	26/06/2019
21	Tristan	26/06/2019
22	Tristan	26/06/2019
23	Tristan	26/06/2019
24	Tristan	26/06/2019
25	tristan	27/06/2019
26	tristan	27/06/2019
27	tristan	27/06/2019
28	Tristan	27/06/2019
29	Namiko	27/06/2019
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lemire-HETIC
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lemire-HETIC
--

SELECT pg_catalog.setval('public.answers_id_seq', 13, true);


--
-- Name: content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lemire-HETIC
--

SELECT pg_catalog.setval('public.content_id_seq', 22, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lemire-HETIC
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 7, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: lemire-HETIC
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lemire-HETIC
--

SELECT pg_catalog.setval('public.questions_id_seq', 6, true);


--
-- Name: reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lemire-HETIC
--

SELECT pg_catalog.setval('public.reply_id_seq', 18, true);


--
-- Name: steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lemire-HETIC
--

SELECT pg_catalog.setval('public.steps_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lemire-HETIC
--

SELECT pg_catalog.setval('public.users_id_seq', 29, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: content content_pkey; Type: CONSTRAINT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: reply reply_pkey; Type: CONSTRAINT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.reply
    ADD CONSTRAINT reply_pkey PRIMARY KEY (id);


--
-- Name: steps steps_pkey; Type: CONSTRAINT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: lemire-HETIC
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

