--
-- PostgreSQL database dump
--

\restrict vSxT4eNYqSTPcCWzD1CioVSgCE4q5ZZACv4FZ6heuqtCz6qmUzuRowiO2QO0mYe

-- Dumped from database version 17.9 (Ubuntu 17.9-0ubuntu0.25.10.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

-- Started on 2026-06-04 16:15:48 -04

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

--
-- TOC entry 6 (class 2615 OID 17718)
-- Name: recipe; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA recipe;


ALTER SCHEMA recipe OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 17719)
-- Name: security; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA security;


ALTER SCHEMA security OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 17720)
-- Name: follow; Type: TABLE; Schema: recipe; Owner: postgres
--

CREATE TABLE recipe.follow (
    fk_user_follower character varying NOT NULL,
    fk_user_followed character varying NOT NULL
);


ALTER TABLE recipe.follow OWNER TO postgres;

--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN follow.fk_user_follower; Type: COMMENT; Schema: recipe; Owner: postgres
--

COMMENT ON COLUMN recipe.follow.fk_user_follower IS 'id of user who follows';


--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN follow.fk_user_followed; Type: COMMENT; Schema: recipe; Owner: postgres
--

COMMENT ON COLUMN recipe.follow.fk_user_followed IS 'id of user who is followes';


--
-- TOC entry 220 (class 1259 OID 17725)
-- Name: recipe; Type: TABLE; Schema: recipe; Owner: postgres
--

CREATE TABLE recipe.recipe (
    recipe_id bigint NOT NULL,
    recipe_ingredients character varying[] NOT NULL,
    recipe_steps text[] NOT NULL,
    fk_users_name character varying NOT NULL,
    recipe_name character varying NOT NULL,
    recipe_description text,
    recipe_image text
);


ALTER TABLE recipe.recipe OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17730)
-- Name: recipe_group; Type: TABLE; Schema: recipe; Owner: postgres
--

CREATE TABLE recipe.recipe_group (
    recipe_group_id integer NOT NULL,
    recipe_group_name character varying NOT NULL,
    fk_users_name character varying NOT NULL
);


ALTER TABLE recipe.recipe_group OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17735)
-- Name: recipe_group_recipe_group_id_seq; Type: SEQUENCE; Schema: recipe; Owner: postgres
--

CREATE SEQUENCE recipe.recipe_group_recipe_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recipe.recipe_group_recipe_group_id_seq OWNER TO postgres;

--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 222
-- Name: recipe_group_recipe_group_id_seq; Type: SEQUENCE OWNED BY; Schema: recipe; Owner: postgres
--

ALTER SEQUENCE recipe.recipe_group_recipe_group_id_seq OWNED BY recipe.recipe_group.recipe_group_id;


--
-- TOC entry 223 (class 1259 OID 17736)
-- Name: recipe_recipe_group; Type: TABLE; Schema: recipe; Owner: postgres
--

CREATE TABLE recipe.recipe_recipe_group (
    fk_recipe_id integer NOT NULL,
    fk_recipe_group_id integer NOT NULL
);


ALTER TABLE recipe.recipe_recipe_group OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17739)
-- Name: recipe_recipe_id_seq; Type: SEQUENCE; Schema: recipe; Owner: postgres
--

CREATE SEQUENCE recipe.recipe_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recipe.recipe_recipe_id_seq OWNER TO postgres;

--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 224
-- Name: recipe_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: recipe; Owner: postgres
--

ALTER SEQUENCE recipe.recipe_recipe_id_seq OWNED BY recipe.recipe.recipe_id;


--
-- TOC entry 225 (class 1259 OID 17740)
-- Name: component; Type: TABLE; Schema: security; Owner: postgres
--

CREATE TABLE security.component (
    component_id integer NOT NULL,
    component_name character varying NOT NULL
);


ALTER TABLE security.component OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17745)
-- Name: component_component_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE security.component_component_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE security.component_component_id_seq OWNER TO postgres;

--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 226
-- Name: component_component_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE security.component_component_id_seq OWNED BY security.component.component_id;


--
-- TOC entry 227 (class 1259 OID 17746)
-- Name: method; Type: TABLE; Schema: security; Owner: postgres
--

CREATE TABLE security.method (
    method_id integer NOT NULL,
    method_name character varying NOT NULL,
    fk_object_id integer NOT NULL
);


ALTER TABLE security.method OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17751)
-- Name: method_method_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE security.method_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE security.method_method_id_seq OWNER TO postgres;

--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 228
-- Name: method_method_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE security.method_method_id_seq OWNED BY security.method.method_id;


--
-- TOC entry 229 (class 1259 OID 17752)
-- Name: method_permission; Type: TABLE; Schema: security; Owner: postgres
--

CREATE TABLE security.method_permission (
    fk_profile_id integer NOT NULL,
    fk_transaction_id integer NOT NULL
);


ALTER TABLE security.method_permission OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17755)
-- Name: object; Type: TABLE; Schema: security; Owner: postgres
--

CREATE TABLE security.object (
    object_id integer NOT NULL,
    object_name character varying NOT NULL
);


ALTER TABLE security.object OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17760)
-- Name: object_object_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE security.object_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE security.object_object_id_seq OWNER TO postgres;

--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 231
-- Name: object_object_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE security.object_object_id_seq OWNED BY security.object.object_id;


--
-- TOC entry 232 (class 1259 OID 17761)
-- Name: option; Type: TABLE; Schema: security; Owner: postgres
--

CREATE TABLE security.option (
    option_id integer NOT NULL,
    option_name character varying NOT NULL,
    fk_component_id integer NOT NULL,
    option_function character varying NOT NULL,
    option_params character varying[] NOT NULL,
    option_async boolean NOT NULL,
    option_generic boolean NOT NULL
);


ALTER TABLE security.option OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17766)
-- Name: option_option_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE security.option_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE security.option_option_id_seq OWNER TO postgres;

--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 233
-- Name: option_option_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE security.option_option_id_seq OWNED BY security.option.option_id;


--
-- TOC entry 234 (class 1259 OID 17767)
-- Name: option_permission; Type: TABLE; Schema: security; Owner: postgres
--

CREATE TABLE security.option_permission (
    fk_profile_id integer NOT NULL,
    fk_option_id integer NOT NULL
);


ALTER TABLE security.option_permission OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17770)
-- Name: profile; Type: TABLE; Schema: security; Owner: postgres
--

CREATE TABLE security.profile (
    profile_name character varying(40) NOT NULL,
    profile_id integer NOT NULL
);


ALTER TABLE security.profile OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17773)
-- Name: profiles_0_profile_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE security.profiles_0_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE security.profiles_0_profile_id_seq OWNER TO postgres;

--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 236
-- Name: profiles_0_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE security.profiles_0_profile_id_seq OWNED BY security.profile.profile_id;


--
-- TOC entry 237 (class 1259 OID 17774)
-- Name: transaction; Type: TABLE; Schema: security; Owner: postgres
--

CREATE TABLE security.transaction (
    fk_method_id integer NOT NULL,
    transaction_id integer NOT NULL
);


ALTER TABLE security.transaction OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17777)
-- Name: users; Type: TABLE; Schema: security; Owner: postgres
--

CREATE TABLE security.users (
    users_name character varying(50) NOT NULL,
    users_password character varying(30) NOT NULL,
    fk_profile_id integer DEFAULT 1 NOT NULL,
    users_email character varying NOT NULL,
    users_first_name character varying NOT NULL,
    users_last_name character varying NOT NULL,
    users_image text,
    users_description text
);


ALTER TABLE security.users OWNER TO postgres;

--
-- TOC entry 3366 (class 2604 OID 17782)
-- Name: recipe recipe_id; Type: DEFAULT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.recipe ALTER COLUMN recipe_id SET DEFAULT nextval('recipe.recipe_recipe_id_seq'::regclass);


--
-- TOC entry 3367 (class 2604 OID 17783)
-- Name: recipe_group recipe_group_id; Type: DEFAULT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.recipe_group ALTER COLUMN recipe_group_id SET DEFAULT nextval('recipe.recipe_group_recipe_group_id_seq'::regclass);


--
-- TOC entry 3368 (class 2604 OID 17784)
-- Name: component component_id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.component ALTER COLUMN component_id SET DEFAULT nextval('security.component_component_id_seq'::regclass);


--
-- TOC entry 3369 (class 2604 OID 17785)
-- Name: method method_id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.method ALTER COLUMN method_id SET DEFAULT nextval('security.method_method_id_seq'::regclass);


--
-- TOC entry 3370 (class 2604 OID 17786)
-- Name: object object_id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.object ALTER COLUMN object_id SET DEFAULT nextval('security.object_object_id_seq'::regclass);


--
-- TOC entry 3371 (class 2604 OID 17787)
-- Name: option option_id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.option ALTER COLUMN option_id SET DEFAULT nextval('security.option_option_id_seq'::regclass);


--
-- TOC entry 3372 (class 2604 OID 17788)
-- Name: profile profile_id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.profile ALTER COLUMN profile_id SET DEFAULT nextval('security.profiles_0_profile_id_seq'::regclass);


--
-- TOC entry 3559 (class 0 OID 17720)
-- Dependencies: 219
-- Data for Name: follow; Type: TABLE DATA; Schema: recipe; Owner: postgres
--

COPY recipe.follow (fk_user_follower, fk_user_followed) FROM stdin;
\.


--
-- TOC entry 3560 (class 0 OID 17725)
-- Dependencies: 220
-- Data for Name: recipe; Type: TABLE DATA; Schema: recipe; Owner: postgres
--

COPY recipe.recipe (recipe_id, recipe_ingredients, recipe_steps, fk_users_name, recipe_name, recipe_description, recipe_image) FROM stdin;
1	{Im,everywhere,im,so,Julia,ah-ahh,aah-aah-aah}	{"Bumping That","bumping that","Bumping that"}	ser1	360	when you are in the mirror, do you like what you see?	\N
2	{Im,everywhere,im,so,Julia,ah-ahh,aah-aah-aah}	{"Bumping That","bumping that","Bumping that"}	ser1	365	when you are in the mirror, do you like what you see?	\N
5	{Filling,up,my,coffee,cup}	{"One way","to shake","me up"}	ser1	Rule 21 Momento Mori	Ashes to ashes, dust to dust	\N
\.


--
-- TOC entry 3561 (class 0 OID 17730)
-- Dependencies: 221
-- Data for Name: recipe_group; Type: TABLE DATA; Schema: recipe; Owner: postgres
--

COPY recipe.recipe_group (recipe_group_id, recipe_group_name, fk_users_name) FROM stdin;
2	yo	ser1
1	beckarby	ser1
\.


--
-- TOC entry 3563 (class 0 OID 17736)
-- Dependencies: 223
-- Data for Name: recipe_recipe_group; Type: TABLE DATA; Schema: recipe; Owner: postgres
--

COPY recipe.recipe_recipe_group (fk_recipe_id, fk_recipe_group_id) FROM stdin;
\.


--
-- TOC entry 3565 (class 0 OID 17740)
-- Dependencies: 225
-- Data for Name: component; Type: TABLE DATA; Schema: security; Owner: postgres
--

COPY security.component (component_id, component_name) FROM stdin;
\.


--
-- TOC entry 3567 (class 0 OID 17746)
-- Dependencies: 227
-- Data for Name: method; Type: TABLE DATA; Schema: security; Owner: postgres
--

COPY security.method (method_id, method_name, fk_object_id) FROM stdin;
1	createRecipe	1
2	updateRecipe	1
3	deleteRecipe	1
4	getAllRecipes	1
5	searchRecipes	1
6	getRecipe	1
7	getAllGroups	2
8	createGroup	2
9	deleteGroup	2
10	updateGroup	2
11	addRecipe	2
12	removeRecipe	2
13	getRecipesForGroup	2
14	getImageFirstRecipe	2
15	addFollow	3
16	removeFollow	3
17	getFollowers	3
18	getFollowing	3
\.


--
-- TOC entry 3569 (class 0 OID 17752)
-- Dependencies: 229
-- Data for Name: method_permission; Type: TABLE DATA; Schema: security; Owner: postgres
--

COPY security.method_permission (fk_profile_id, fk_transaction_id) FROM stdin;
1	11
1	12
1	13
1	14
1	15
1	16
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
1	31
1	32
1	33
1	34
\.


--
-- TOC entry 3570 (class 0 OID 17755)
-- Dependencies: 230
-- Data for Name: object; Type: TABLE DATA; Schema: security; Owner: postgres
--

COPY security.object (object_id, object_name) FROM stdin;
1	RecipeManagement
2	GroupManagement
3	Follow
\.


--
-- TOC entry 3572 (class 0 OID 17761)
-- Dependencies: 232
-- Data for Name: option; Type: TABLE DATA; Schema: security; Owner: postgres
--

COPY security.option (option_id, option_name, fk_component_id, option_function, option_params, option_async, option_generic) FROM stdin;
\.


--
-- TOC entry 3574 (class 0 OID 17767)
-- Dependencies: 234
-- Data for Name: option_permission; Type: TABLE DATA; Schema: security; Owner: postgres
--

COPY security.option_permission (fk_profile_id, fk_option_id) FROM stdin;
\.


--
-- TOC entry 3575 (class 0 OID 17770)
-- Dependencies: 235
-- Data for Name: profile; Type: TABLE DATA; Schema: security; Owner: postgres
--

COPY security.profile (profile_name, profile_id) FROM stdin;
slave	1
slave	2
\.


--
-- TOC entry 3577 (class 0 OID 17774)
-- Dependencies: 237
-- Data for Name: transaction; Type: TABLE DATA; Schema: security; Owner: postgres
--

COPY security.transaction (fk_method_id, transaction_id) FROM stdin;
1	11
2	12
3	13
4	14
5	15
6	16
7	21
8	22
9	23
10	24
11	25
12	26
13	27
14	28
15	31
16	32
17	33
18	34
\.


--
-- TOC entry 3578 (class 0 OID 17777)
-- Dependencies: 238
-- Data for Name: users; Type: TABLE DATA; Schema: security; Owner: postgres
--

COPY security.users (users_name, users_password, fk_profile_id, users_email, users_first_name, users_last_name, users_image, users_description) FROM stdin;
ser1	Vargas	1	sergio@vargas.com	Sergio	Vargas	\N	El mejor merenguero
\.


--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 222
-- Name: recipe_group_recipe_group_id_seq; Type: SEQUENCE SET; Schema: recipe; Owner: postgres
--

SELECT pg_catalog.setval('recipe.recipe_group_recipe_group_id_seq', 4, true);


--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 224
-- Name: recipe_recipe_id_seq; Type: SEQUENCE SET; Schema: recipe; Owner: postgres
--

SELECT pg_catalog.setval('recipe.recipe_recipe_id_seq', 8, true);


--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 226
-- Name: component_component_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('security.component_component_id_seq', 1, false);


--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 228
-- Name: method_method_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('security.method_method_id_seq', 18, true);


--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 231
-- Name: object_object_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('security.object_object_id_seq', 3, true);


--
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 233
-- Name: option_option_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('security.option_option_id_seq', 1, false);


--
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 236
-- Name: profiles_0_profile_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('security.profiles_0_profile_id_seq', 2, true);


--
-- TOC entry 3375 (class 2606 OID 17790)
-- Name: follow pk_follow; Type: CONSTRAINT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.follow
    ADD CONSTRAINT pk_follow PRIMARY KEY (fk_user_follower, fk_user_followed);


--
-- TOC entry 3377 (class 2606 OID 17792)
-- Name: recipe pk_recipe; Type: CONSTRAINT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.recipe
    ADD CONSTRAINT pk_recipe PRIMARY KEY (recipe_id);


--
-- TOC entry 3379 (class 2606 OID 17794)
-- Name: recipe_group pk_recipe_group; Type: CONSTRAINT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.recipe_group
    ADD CONSTRAINT pk_recipe_group PRIMARY KEY (recipe_group_id);


--
-- TOC entry 3381 (class 2606 OID 17796)
-- Name: recipe_recipe_group pk_recipe_recipe_group; Type: CONSTRAINT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.recipe_recipe_group
    ADD CONSTRAINT pk_recipe_recipe_group PRIMARY KEY (fk_recipe_group_id, fk_recipe_id);


--
-- TOC entry 3383 (class 2606 OID 17798)
-- Name: component component_pkey; Type: CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.component
    ADD CONSTRAINT component_pkey PRIMARY KEY (component_id);


--
-- TOC entry 3387 (class 2606 OID 17800)
-- Name: method_permission method_permission_pkey; Type: CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.method_permission
    ADD CONSTRAINT method_permission_pkey PRIMARY KEY (fk_profile_id, fk_transaction_id);


--
-- TOC entry 3385 (class 2606 OID 17802)
-- Name: method method_pkey; Type: CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.method
    ADD CONSTRAINT method_pkey PRIMARY KEY (method_id);


--
-- TOC entry 3389 (class 2606 OID 17804)
-- Name: object object_pkey; Type: CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.object
    ADD CONSTRAINT object_pkey PRIMARY KEY (object_id);


--
-- TOC entry 3393 (class 2606 OID 17806)
-- Name: option_permission option_permission_pkey; Type: CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.option_permission
    ADD CONSTRAINT option_permission_pkey PRIMARY KEY (fk_profile_id, fk_option_id);


--
-- TOC entry 3391 (class 2606 OID 17808)
-- Name: option option_pkey; Type: CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.option
    ADD CONSTRAINT option_pkey PRIMARY KEY (option_id);


--
-- TOC entry 3395 (class 2606 OID 17810)
-- Name: profile pk_profiles_0; Type: CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.profile
    ADD CONSTRAINT pk_profiles_0 PRIMARY KEY (profile_id);


--
-- TOC entry 3397 (class 2606 OID 17812)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 3399 (class 2606 OID 17814)
-- Name: users username_pkey; Type: CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.users
    ADD CONSTRAINT username_pkey PRIMARY KEY (users_name);


--
-- TOC entry 3400 (class 2606 OID 17995)
-- Name: follow fk_followed; Type: FK CONSTRAINT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.follow
    ADD CONSTRAINT fk_followed FOREIGN KEY (fk_user_followed) REFERENCES security.users(users_name) ON DELETE CASCADE;


--
-- TOC entry 3401 (class 2606 OID 18000)
-- Name: follow fk_follower; Type: FK CONSTRAINT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.follow
    ADD CONSTRAINT fk_follower FOREIGN KEY (fk_user_follower) REFERENCES security.users(users_name) ON DELETE CASCADE;


--
-- TOC entry 3404 (class 2606 OID 17985)
-- Name: recipe_recipe_group fk_recipe; Type: FK CONSTRAINT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.recipe_recipe_group
    ADD CONSTRAINT fk_recipe FOREIGN KEY (fk_recipe_id) REFERENCES recipe.recipe(recipe_id) ON DELETE CASCADE;


--
-- TOC entry 3405 (class 2606 OID 17990)
-- Name: recipe_recipe_group fk_recipe_group; Type: FK CONSTRAINT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.recipe_recipe_group
    ADD CONSTRAINT fk_recipe_group FOREIGN KEY (fk_recipe_group_id) REFERENCES recipe.recipe_group(recipe_group_id) ON DELETE CASCADE;


--
-- TOC entry 3402 (class 2606 OID 18010)
-- Name: recipe fk_users; Type: FK CONSTRAINT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.recipe
    ADD CONSTRAINT fk_users FOREIGN KEY (fk_users_name) REFERENCES security.users(users_name) ON DELETE CASCADE;


--
-- TOC entry 3403 (class 2606 OID 18005)
-- Name: recipe_group fk_users; Type: FK CONSTRAINT; Schema: recipe; Owner: postgres
--

ALTER TABLE ONLY recipe.recipe_group
    ADD CONSTRAINT fk_users FOREIGN KEY (fk_users_name) REFERENCES security.users(users_name) ON DELETE CASCADE;


--
-- TOC entry 3409 (class 2606 OID 17840)
-- Name: option fk_component; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.option
    ADD CONSTRAINT fk_component FOREIGN KEY (fk_component_id) REFERENCES security.component(component_id);


--
-- TOC entry 3406 (class 2606 OID 17845)
-- Name: method fk_method; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.method
    ADD CONSTRAINT fk_method FOREIGN KEY (fk_object_id) REFERENCES security.object(object_id);


--
-- TOC entry 3412 (class 2606 OID 17850)
-- Name: transaction fk_method; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.transaction
    ADD CONSTRAINT fk_method FOREIGN KEY (fk_method_id) REFERENCES security.method(method_id);


--
-- TOC entry 3410 (class 2606 OID 17855)
-- Name: option_permission fk_option; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.option_permission
    ADD CONSTRAINT fk_option FOREIGN KEY (fk_option_id) REFERENCES security.option(option_id);


--
-- TOC entry 3407 (class 2606 OID 17860)
-- Name: method_permission fk_profile; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.method_permission
    ADD CONSTRAINT fk_profile FOREIGN KEY (fk_profile_id) REFERENCES security.profile(profile_id);


--
-- TOC entry 3411 (class 2606 OID 17865)
-- Name: option_permission fk_profile; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.option_permission
    ADD CONSTRAINT fk_profile FOREIGN KEY (fk_profile_id) REFERENCES security.profile(profile_id);


--
-- TOC entry 3413 (class 2606 OID 17870)
-- Name: users fk_profile; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.users
    ADD CONSTRAINT fk_profile FOREIGN KEY (fk_profile_id) REFERENCES security.profile(profile_id);


--
-- TOC entry 3408 (class 2606 OID 17875)
-- Name: method_permission fk_transaction; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY security.method_permission
    ADD CONSTRAINT fk_transaction FOREIGN KEY (fk_transaction_id) REFERENCES security.transaction(transaction_id);


-- Completed on 2026-06-04 16:15:48 -04

--
-- PostgreSQL database dump complete
--

\unrestrict vSxT4eNYqSTPcCWzD1CioVSgCE4q5ZZACv4FZ6heuqtCz6qmUzuRowiO2QO0mYe

