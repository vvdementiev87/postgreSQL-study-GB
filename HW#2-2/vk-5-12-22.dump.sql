--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: communities; Type: TABLE; Schema: public; Owner: devavi
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name text,
    creator_id integer,
    created_at character varying(255)
);


ALTER TABLE public.communities OWNER TO devavi;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: devavi
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO devavi;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devavi
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: devavi
--

CREATE TABLE public.communities_users (
    community_id integer,
    user_id integer,
    created_at character varying(255)
);


ALTER TABLE public.communities_users OWNER TO devavi;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: devavi
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer,
    confirmed_by_user_id integer,
    status_id integer,
    requested_at character varying(255),
    confirmed_at character varying(255)
);


ALTER TABLE public.friendship OWNER TO devavi;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: devavi
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO devavi;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devavi
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: devavi
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.friendship_statuses OWNER TO devavi;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: devavi
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO devavi;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devavi
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: devavi
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer,
    to_user_id integer,
    body text,
    is_important character varying(255) DEFAULT NULL::character varying,
    is_delivered character varying(255) DEFAULT NULL::character varying,
    created_at character varying(255)
);


ALTER TABLE public.messages OWNER TO devavi;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: devavi
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO devavi;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devavi
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: devavi
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(255),
    owner_id integer,
    created_at character varying(255),
    description text,
    uploaded_at character varying(255),
    size text
);


ALTER TABLE public.photo OWNER TO devavi;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: devavi
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO devavi;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devavi
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: devavi
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    type_id integer,
    signed_on_id integer,
    created_at character varying(255),
    is_active character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.subscriptions OWNER TO devavi;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: devavi
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO devavi;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devavi
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: subscrition_type; Type: TABLE; Schema: public; Owner: devavi
--

CREATE TABLE public.subscrition_type (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.subscrition_type OWNER TO devavi;

--
-- Name: subscrition_type_id_seq; Type: SEQUENCE; Schema: public; Owner: devavi
--

CREATE SEQUENCE public.subscrition_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscrition_type_id_seq OWNER TO devavi;

--
-- Name: subscrition_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devavi
--

ALTER SEQUENCE public.subscrition_type_id_seq OWNED BY public.subscrition_type.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: devavi
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(255) DEFAULT NULL::character varying,
    last_name character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    phone character varying(100) DEFAULT NULL::character varying,
    main_photo_id integer,
    created_at character varying(255)
);


ALTER TABLE public.users OWNER TO devavi;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: devavi
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO devavi;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devavi
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: devavi
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(255),
    owner_id integer,
    created_at character varying(255),
    description text,
    uploaded_at character varying(255),
    size text
);


ALTER TABLE public.video OWNER TO devavi;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: devavi
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO devavi;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devavi
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: subscrition_type id; Type: DEFAULT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.subscrition_type ALTER COLUMN id SET DEFAULT nextval('public.subscrition_type_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: devavi
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
1	malesuada malesuada.	10	1641478810000
2	Integer aliquam	2	1698201181000
3	Etiam gravida	35	1658237577000
4	Nunc laoreet	36	1673824694000
5	ut erat.	32	1677535155000
6	arcu. Morbi	27	1676912399000
7	Duis at	68	1663725050000
8	sagittis. Duis	3	1691235710000
9	nulla. Integer	96	1651825261000
10	imperdiet ornare.	15	1697604128000
11	erat volutpat.	70	1658310470000
12	a, magna.	79	1680515231000
13	Cras vehicula	12	1682276640000
14	justo eu	35	1685195315000
15	vel est	82	1653883251000
16	non, egestas	19	1699821943000
17	ut quam	2	1676856270000
18	Donec dignissim	73	1669557943000
19	fringilla mi	40	1654066022000
20	posuere, enim	69	1686790135000
21	feugiat placerat	20	1697276423000
22	varius. Nam	65	1653693634000
23	Etiam imperdiet	46	1663987216000
24	libero. Morbi	88	1695254541000
25	Proin dolor.	33	1662201142000
26	aliquet molestie	94	1663971902000
27	ipsum. Phasellus	54	1663555734000
28	mauris, rhoncus	87	1653585734000
29	eu lacus.	66	1693923801000
30	magna. Phasellus	21	1645340882000
31	risus. Nunc	6	1645979061000
32	orci quis	37	1663396502000
33	aliquet nec,	86	1694784760000
34	sem molestie	44	1675009553000
35	dui. Cum	96	1642863881000
36	In scelerisque	97	1650344727000
37	Proin dolor.	77	1647403275000
38	ornare lectus	81	1639886882000
39	tellus non	47	1669484178000
40	convallis convallis	50	1646974188000
41	cursus, diam	68	1688689926000
42	dictum augue	48	1651744663000
43	vestibulum nec,	17	1653441633000
44	urna. Nunc	59	1647367381000
45	euismod urna.	3	1652601834000
46	scelerisque, lorem	21	1692846708000
47	sem, vitae	19	1649666565000
48	vitae erat	91	1657440708000
49	Donec feugiat	25	1641182579000
50	Sed nec	55	1643583938000
51	Sed eget	6	1700798310000
52	ut eros	55	1649910376000
53	Nunc lectus	28	1682725804000
54	eros turpis	97	1639583632000
55	sem. Pellentesque	55	1668086825000
56	sed dui.	20	1668494006000
57	eros. Nam	87	1677054045000
58	fermentum convallis	46	1690193774000
59	malesuada ut,	92	1657783445000
60	sit amet	63	1659737556000
61	diam eu	62	1700116877000
62	laoreet posuere,	36	1689281531000
63	nulla. Donec	60	1658040794000
64	enim. Sed	48	1665862188000
65	eleifend, nunc	84	1686543687000
66	eget lacus.	65	1700353031000
67	odio. Phasellus	24	1662725978000
68	malesuada malesuada.	14	1677967053000
69	posuere cubilia	90	1682788893000
70	vestibulum lorem,	75	1662097515000
71	risus. Quisque	65	1673399637000
72	vehicula. Pellentesque	81	1639660400000
73	vitae, posuere	81	1659722166000
74	amet luctus	80	1659589175000
75	eget laoreet	34	1685007678000
76	Fusce aliquet	63	1669422849000
77	mauris a	29	1639030929000
78	nec orci.	34	1690394589000
79	facilisis lorem	37	1646647029000
80	quis diam	73	1647140620000
81	Phasellus libero	51	1690765867000
82	Integer vulputate,	77	1657657978000
83	Phasellus in	38	1655958421000
84	semper egestas,	11	1676922331000
85	parturient montes,	69	1659732600000
86	vestibulum lorem,	71	1660922941000
87	erat. Etiam	17	1647088848000
88	orci lacus	3	1671956632000
89	ut lacus.	16	1674117550000
90	interdum. Sed	89	1675367789000
91	quis arcu	53	1696041389000
92	dolor. Fusce	36	1665605574000
93	iaculis enim,	94	1658180284000
94	nunc sed	62	1697234812000
95	sollicitudin commodo	37	1652083065000
96	sodales nisi	72	1645356814000
97	dui lectus	72	1675180550000
98	sed leo.	34	1674656622000
99	inceptos hymenaeos.	97	1696871972000
100	dolor dolor,	70	1683299918000
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: devavi
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
50	74	1646682573000
66	18	1672559828000
59	84	1658008511000
63	87	1655622781000
72	26	1688976708000
10	63	1674080992000
72	82	1679705872000
18	97	1643987018000
33	76	1682655072000
2	84	1654404508000
80	84	1681203590000
40	62	1650791943000
47	81	1657764684000
83	34	1684516582000
84	68	1685289643000
69	10	1652346648000
91	4	1673697490000
46	88	1641051153000
26	86	1671691535000
85	10	1689671491000
83	9	1683857767000
24	64	1663510018000
58	6	1694039669000
59	74	1646264133000
31	87	1696927740000
17	45	1697342521000
45	95	1670385604000
20	67	1689869395000
2	96	1698189778000
39	83	1691565684000
30	75	1644659948000
31	67	1672002596000
55	82	1646098561000
95	69	1649640233000
35	9	1686438696000
55	56	1653323920000
61	50	1669261112000
8	18	1668679458000
1	41	1700768710000
16	74	1697753213000
17	48	1679791720000
7	99	1646893324000
32	2	1677337650000
16	64	1686243852000
63	74	1689687320000
89	63	1657541410000
55	54	1640801747000
85	37	1675105446000
96	97	1652967829000
45	87	1700874043000
90	18	1675622575000
86	80	1648307604000
23	88	1682238841000
61	12	1676401367000
85	34	1656669708000
37	40	1688094827000
39	40	1653021183000
51	99	1661648383000
33	9	1667240440000
30	89	1646455347000
4	69	1642079786000
6	10	1692175749000
34	12	1701625182000
96	40	1652663368000
75	1	1686120756000
63	17	1682502553000
27	31	1671044687000
87	75	1640512708000
96	86	1661218724000
20	1	1661936008000
61	83	1648015235000
16	1	1696706263000
5	26	1677990551000
5	80	1696724662000
79	27	1654157905000
59	36	1671757236000
93	45	1679378356000
54	93	1684211582000
40	32	1681734637000
88	73	1648396685000
49	24	1651516836000
27	67	1684528717000
69	96	1698135543000
87	54	1686530580000
35	75	1640215747000
15	46	1681681493000
65	11	1658921358000
62	40	1697884984000
61	57	1641389453000
52	60	1684533262000
29	100	1657063538000
14	53	1700196276000
36	83	1696898419000
96	60	1688582199000
82	30	1647551342000
59	87	1700746816000
67	27	1678310491000
53	30	1671524144000
48	22	1680265822000
75	5	1668282272000
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: devavi
--

COPY public.friendship (id, requested_by_user_id, confirmed_by_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	37	52	3	1658146519000	1684864382000
2	25	70	1	1648665497000	1663522563000
3	23	71	2	1646957879000	1654695994000
4	26	88	2	1641011633000	1680709561000
5	25	55	3	1651897647000	1700593645000
6	6	75	1	1663593056000	1672436004000
7	7	69	5	1664155258000	1665440026000
8	6	96	3	1654386552000	1672897362000
9	42	52	4	1666076644000	1675760946000
10	34	58	4	1668807256000	1664502119000
11	28	73	3	1664372940000	1685774857000
12	31	100	5	1664400378000	1654597699000
13	3	60	4	1652567577000	1694304019000
14	6	99	1	1656842569000	1663141358000
15	15	88	4	1653760132000	1643308576000
16	44	65	3	1666917950000	1700918830000
17	4	70	5	1669536389000	1696956528000
18	20	81	3	1640826736000	1666534642000
19	49	67	1	1641898256000	1697416050000
20	43	88	3	1664794389000	1698547822000
21	18	64	4	1665153530000	1688070201000
22	27	81	5	1659479099000	1642320222000
23	8	99	1	1667395628000	1645852573000
24	42	88	4	1662041389000	1674561044000
25	42	78	4	1652200610000	1657961608000
26	27	93	2	1655552975000	1642021391000
27	11	98	3	1647516258000	1700945677000
28	26	90	2	1643533419000	1684386286000
29	41	68	1	1645145503000	1695410951000
30	6	85	4	1654596007000	1670768831000
31	18	52	5	1646535109000	1647065205000
32	15	92	2	1660721177000	1654403223000
33	25	59	4	1667138547000	1672256670000
34	23	57	4	1664748888000	1669900460000
35	13	95	4	1669869178000	1655169401000
36	35	83	3	1644169360000	1657808348000
37	2	66	2	1648001092000	1674100259000
38	9	76	2	1652018646000	1659697225000
39	46	54	3	1644558222000	1678646635000
40	15	69	3	1657537443000	1691139415000
41	43	89	4	1650781153000	1645393746000
42	40	56	1	1653817573000	1699741199000
43	39	62	3	1664731112000	1643085240000
44	24	86	4	1646395977000	1676611642000
45	11	72	3	1639575258000	1651212926000
46	12	91	1	1670110882000	1666776326000
47	41	53	1	1660835630000	1694062759000
48	30	85	3	1648162178000	1694244271000
49	40	59	3	1643511754000	1683310840000
50	2	53	3	1640681967000	1701525138000
51	17	56	4	1653502539000	1684591623000
52	20	98	4	1646947184000	1690471322000
53	24	89	4	1668417741000	1679341765000
54	45	93	1	1659041004000	1698691762000
55	23	84	2	1648047065000	1650796521000
56	17	99	4	1662371363000	1659106272000
57	33	72	4	1639062402000	1687100992000
58	46	75	1	1667869520000	1697553938000
59	11	100	4	1652571113000	1697974017000
60	24	87	2	1663920100000	1654269406000
61	8	72	2	1654034108000	1656152918000
62	25	60	2	1665058053000	1650656199000
63	23	89	3	1648621855000	1656623985000
64	42	63	4	1646242636000	1654670256000
65	45	83	4	1669285733000	1658243783000
66	2	61	1	1652855068000	1666554444000
67	39	61	4	1650446264000	1646416054000
68	45	95	4	1667078228000	1678168844000
69	20	74	1	1652778552000	1700426058000
70	4	76	2	1658770867000	1663085517000
71	14	79	1	1647141721000	1641211374000
72	9	96	5	1649799247000	1640340041000
73	45	60	3	1662746323000	1677302050000
74	44	66	5	1656420897000	1681868577000
75	38	76	2	1651958991000	1669828269000
76	14	54	2	1660898665000	1662574109000
77	36	78	5	1642386278000	1693481712000
78	27	99	5	1660539760000	1661545387000
79	6	52	4	1643119726000	1667828437000
80	41	97	3	1643479359000	1675215971000
81	28	87	3	1662780909000	1639720396000
82	33	72	3	1646690685000	1674729996000
83	6	100	4	1639082899000	1652550402000
84	7	94	1	1654399508000	1666960510000
85	18	94	4	1652184825000	1681633781000
86	23	77	2	1654321326000	1667752660000
87	37	79	3	1646387542000	1646482265000
88	25	52	5	1650334791000	1659843235000
89	37	86	1	1651524053000	1678160252000
90	4	61	3	1643342222000	1670401908000
91	19	75	4	1652747430000	1667907674000
92	20	62	4	1656509249000	1694489065000
93	25	72	5	1640166119000	1681505906000
94	38	52	3	1653688528000	1666417086000
95	21	79	2	1670052417000	1682471436000
96	38	89	4	1643873537000	1661594211000
97	5	52	4	1641658049000	1654072400000
98	50	56	4	1652782984000	1659083268000
99	39	56	2	1652664564000	1648913743000
100	38	83	3	1662142718000	1647180461000
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: devavi
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	a,
2	litora
3	Phasellus
4	magna.
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: devavi
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	49	52	gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue	Yes	Yes	1664865829000
2	22	53	dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque	No	No	1668666690000
3	46	96	Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio.	No	No	1640068453000
4	45	76	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus.	Yes	Yes	1662709502000
5	12	74	penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu.	No	No	1639532916000
6	30	60	eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed,	Yes	Yes	1653986139000
7	34	86	nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non	Yes	Yes	1653304162000
8	20	80	magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum	No	No	1647640654000
9	18	77	iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus	Yes	No	1644661691000
10	21	83	tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh.	No	No	1653338613000
11	30	59	pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio,	Yes	No	1668745383000
12	17	98	ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc	Yes	No	1646437732000
13	23	95	vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est	No	No	1665758047000
14	36	87	mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris	Yes	Yes	1659452312000
15	40	95	nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id	Yes	Yes	1664632470000
16	42	85	mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in,	Yes	No	1640623854000
17	36	87	ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non	No	No	1638959892000
18	27	90	erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus	No	No	1659000706000
19	44	91	magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit,	Yes	Yes	1660804573000
20	1	94	sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim	No	Yes	1639397072000
21	10	58	egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis.	Yes	Yes	1664793025000
22	37	62	euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat,	No	No	1665692193000
23	22	65	Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis	Yes	Yes	1665566167000
24	3	62	diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel	No	Yes	1656392456000
25	17	65	Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In	No	No	1662292285000
26	42	96	ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad	No	Yes	1643069558000
27	17	78	aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc	No	Yes	1651231722000
28	13	53	sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam	No	Yes	1657102131000
29	47	93	nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut	Yes	No	1649345781000
30	6	83	Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique	No	No	1641982561000
31	32	57	libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate,	No	Yes	1658584521000
32	29	61	massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu	Yes	Yes	1640406665000
33	11	51	eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis	Yes	Yes	1655991813000
34	22	63	volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a	Yes	Yes	1655572879000
35	38	93	dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam,	No	Yes	1660930225000
36	45	74	Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,	Yes	No	1648411272000
37	24	76	ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,	Yes	Yes	1649590370000
38	36	88	leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing	No	Yes	1659502539000
39	5	72	Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget,	Yes	No	1653331686000
40	42	87	Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam	Yes	Yes	1655402185000
41	3	86	ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non	No	No	1657618158000
42	41	97	est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam	Yes	Yes	1651079664000
43	4	54	vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie	Yes	Yes	1648794328000
44	6	90	purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est,	Yes	Yes	1648166510000
45	25	77	risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet	No	No	1663349773000
46	10	67	enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus.	Yes	Yes	1656575307000
47	49	97	tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla	No	Yes	1664167476000
48	1	90	faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis	Yes	Yes	1654211053000
49	15	74	libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia	No	Yes	1640585352000
50	7	65	vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut,	Yes	Yes	1657925753000
51	23	100	ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,	No	No	1669131204000
52	10	90	laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi	No	No	1641905530000
53	25	68	amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna	Yes	No	1641544052000
54	21	54	Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada	No	Yes	1642482462000
55	24	95	In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus.	Yes	No	1658902616000
56	7	59	interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet	No	No	1668285797000
57	10	99	sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin	Yes	No	1641907804000
58	33	70	mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut	Yes	Yes	1648520712000
59	4	96	magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu	Yes	Yes	1638939327000
60	24	73	dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor	Yes	No	1664592143000
61	47	92	nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula	No	No	1645761641000
62	28	82	Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus.	No	No	1650824158000
63	42	61	Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi	Yes	No	1652331749000
64	40	97	ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,	No	Yes	1646433929000
65	31	55	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu	No	No	1649983784000
66	31	76	quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam	Yes	Yes	1669380150000
67	36	80	lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus	No	Yes	1664264039000
68	7	57	ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam	Yes	No	1660589718000
69	12	96	tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In	No	No	1648891420000
70	5	95	Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus	Yes	No	1666818039000
71	38	85	nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat.	No	Yes	1640914057000
72	5	53	fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida	No	Yes	1658009228000
73	48	95	Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis	Yes	Yes	1662969502000
74	22	64	interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris	No	No	1656170015000
75	15	88	sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec	No	No	1649508575000
76	22	88	id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus	Yes	Yes	1647509840000
77	23	75	eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et	No	Yes	1649421298000
78	3	96	egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero.	Yes	Yes	1648823973000
79	33	62	Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet,	No	Yes	1663096488000
80	17	64	dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum	Yes	No	1661747074000
81	32	54	vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta	No	No	1655288613000
82	21	89	aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis	Yes	No	1670219280000
83	19	77	nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia	No	No	1646186979000
84	13	58	at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac	Yes	Yes	1653357190000
85	27	54	Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus	No	Yes	1646465757000
86	2	64	sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi	No	No	1652679672000
87	1	93	Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class	Yes	No	1662567260000
88	31	54	tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer	Yes	No	1664631830000
89	22	73	auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean	No	No	1660781391000
90	46	68	sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam	No	Yes	1662897774000
91	32	61	molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor	No	No	1649890608000
92	30	69	venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede.	No	Yes	1638889948000
93	28	63	nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis.	No	Yes	1639383769000
94	47	95	vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc	No	Yes	1656629012000
95	27	58	Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien.	No	No	1652314710000
96	7	97	semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a,	Yes	No	1643176737000
97	35	82	natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie	Yes	Yes	1668510734000
98	4	51	mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus	No	Yes	1651050297000
99	5	89	mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non	No	Yes	1666636988000
100	30	51	elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare,	Yes	No	1662477872000
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: devavi
--

COPY public.photo (id, url, owner_id, created_at, description, uploaded_at, size) FROM stdin;
1	http://walmart.com/settings?page=1&offset=1	11	1694389516000	et arcu	1664636089000	1024
2	https://wikipedia.org/site?ad=115	16	1670674206000	Praesent interdum	1663594038000	1024
3	http://cnn.com/sub/cars?q=11	83	1639566404000	a, aliquet	1651251405000	1024
4	http://twitter.com/sub?q=test	25	1691089376000	Mauris	1658295756000	1024
5	https://instagram.com/en-ca?q=4	3	1670363388000	Nunc	1639788157000	256
6	http://reddit.com/user/110?q=test	89	1658710050000	nisl. Nulla	1640739049000	256
7	http://nytimes.com/en-ca?client=g	35	1649869073000	felis purus ac	1658196829000	256
8	https://wikipedia.org/site?p=8	18	1645277475000	magna.	1663109197000	256
9	https://walmart.com/one?str=se	14	1666186245000	Cras	1655753758000	512
10	http://instagram.com/site?search=1&q=de	92	1685603003000	risus, at	1666096894000	512
11	https://reddit.com/sub?str=se	96	1668416067000	lacinia.	1660524382000	512
12	http://google.com/one?q=test	39	1655065219000	leo elementum	1653396652000	512
13	http://zoom.us/sub?client=g	6	1677832344000	In lorem.	1654631793000	128
14	http://naver.com/fr?page=1&offset=1	68	1640820217000	sit	1645771839000	128
15	http://ebay.com/sub/cars?p=8	93	1640522265000	est mauris,	1651299565000	128
16	http://wikipedia.org/fr?q=11	27	1686506964000	luctus	1645999962000	128
17	https://naver.com/sub?gi=100	28	1671685298000	Duis volutpat	1666158813000	64
18	https://twitter.com/site?search=1&q=de	11	1650789347000	Phasellus	1665674781000	64
19	http://youtube.com/settings?ad=115	20	1649131740000	tortor.	1650276352000	64
20	http://yahoo.com/sub?q=4	88	1677578339000	Nullam	1646539740000	64
21	http://pinterest.com/site?q=11	10	1696910629000	Cum sociis natoque	1639092396000	32
22	https://guardian.co.uk/sub?p=8	3	1678062679000	sapien, cursus in,	1663957306000	32
23	http://yahoo.com/en-ca?ab=441&aad=2	33	1686301581000	sapien. Aenean	1645771390000	32
24	http://baidu.com/fr?ad=115	35	1695396596000	sed	1650009503000	32
25	http://netflix.com/fr?search=1&q=de	87	1680607735000	faucibus	1656025484000	1024
26	http://youtube.com/en-us?ab=441&aad=2	64	1642893000000	sem egestas	1661794633000	1024
27	https://naver.com/en-ca?ad=115	99	1676363639000	semper tellus	1649472076000	1024
28	https://zoom.us/en-ca?gi=100	87	1682175048000	bibendum. Donec felis	1663932039000	1024
29	http://guardian.co.uk/user/110?g=1	89	1639897833000	quis massa.	1653871869000	256
30	http://whatsapp.com/en-us?page=1&offset=1	75	1699213058000	ridiculus mus. Proin	1660359579000	256
31	https://naver.com/fr?search=1&q=de	48	1654329356000	consectetuer euismod	1666796668000	256
32	http://naver.com/en-us?q=11	28	1645042124000	egestas. Fusce	1639718243000	256
33	http://guardian.co.uk/site?gi=100	58	1691357091000	vitae erat	1655910797000	512
34	https://youtube.com/one?page=1&offset=1	12	1652409882000	mollis. Integer	1669483345000	512
35	https://walmart.com/sub?ab=441&aad=2	89	1668244366000	nec tellus. Nunc	1640734208000	512
36	https://facebook.com/sub/cars?q=test	32	1643052806000	et, eros.	1650201280000	512
37	https://instagram.com/site?q=0	58	1662156534000	sit	1651772229000	128
38	https://whatsapp.com/fr?client=g	42	1655674389000	erat volutpat.	1650962311000	128
39	http://youtube.com/sub?search=1	98	1700204884000	Nam ligula	1645621708000	128
40	http://walmart.com/sub?q=11	82	1701512167000	euismod	1643798107000	128
41	https://instagram.com/one?g=1	65	1690168487000	eget tincidunt	1656588421000	64
42	http://yahoo.com/settings?q=test	99	1675942976000	massa	1648612177000	64
43	https://google.com/site?k=0	42	1667810984000	fringilla purus mauris	1649044713000	64
44	http://youtube.com/settings?str=se	19	1660699175000	felis ullamcorper	1654912436000	64
45	http://youtube.com/settings?str=se	35	1674042311000	fames ac turpis	1638824146000	32
46	http://reddit.com/group/9?q=4	98	1648331667000	volutpat. Nulla facilisis.	1667583001000	32
47	http://yahoo.com/sub/cars?q=11	70	1650486029000	In mi pede,	1644451263000	32
48	https://yahoo.com/user/110?search=1	77	1643036525000	eros non	1658864910000	32
49	http://yahoo.com/sub/cars?str=se	68	1664314344000	Praesent	1663129594000	1024
50	https://yahoo.com/en-ca?q=11	53	1668019450000	Nam ligula elit,	1661963512000	1024
51	http://walmart.com/en-us?q=test	74	1667371632000	amet, consectetuer adipiscing	1667858618000	1024
52	https://nytimes.com/en-us?page=1&offset=1	58	1681479229000	ornare	1663104814000	1024
53	https://baidu.com/en-ca?q=11	67	1655885243000	non nisi.	1654218929000	256
54	http://naver.com/one?g=1	64	1699850606000	vehicula. Pellentesque	1642358277000	256
55	https://facebook.com/fr?g=1	18	1695138175000	enim commodo	1656097055000	256
56	http://cnn.com/sub?p=8	27	1665827234000	urna.	1668979850000	256
57	http://cnn.com/fr?search=1	87	1669436941000	est, congue a,	1649443894000	512
58	http://cnn.com/user/110?p=8	6	1665155043000	habitant morbi	1643763413000	512
59	https://bbc.co.uk/one?ab=441&aad=2	75	1669003727000	eget ipsum. Suspendisse	1651699285000	512
60	https://ebay.com/settings?gi=100	21	1664114394000	ipsum. Donec	1669611750000	512
61	https://nytimes.com/one?client=g	92	1680064046000	sit	1639548257000	128
62	https://nytimes.com/sub/cars?str=se	15	1661016245000	scelerisque	1646884326000	128
63	http://whatsapp.com/sub?q=4	16	1661292464000	at sem molestie	1646689823000	128
64	https://netflix.com/sub?q=0	44	1670308154000	Aenean eget metus.	1651126736000	128
65	http://pinterest.com/en-us?q=test	80	1668297354000	vestibulum nec,	1661503080000	64
66	http://baidu.com/one?client=g	52	1645446882000	nisi. Mauris nulla.	1652985861000	64
67	https://netflix.com/sub?q=test	94	1700502414000	tellus	1666044686000	64
68	http://reddit.com/site?str=se	83	1686244456000	vulputate ullamcorper magna.	1656205367000	64
69	https://nytimes.com/en-us?q=4	52	1694382649000	cursus. Integer	1663699715000	32
70	https://nytimes.com/site?ad=115	21	1670216145000	Nulla	1653788986000	32
71	https://cnn.com/user/110?p=8	79	1671037534000	imperdiet ullamcorper. Duis	1661919284000	32
72	https://cnn.com/one?client=g	20	1700954587000	Cras eu tellus	1642294468000	32
73	https://instagram.com/sub?client=g	38	1649201078000	ipsum leo	1662588972000	1024
74	http://baidu.com/site?search=1	88	1696721778000	eget odio. Aliquam	1660114653000	1024
75	https://youtube.com/site?ab=441&aad=2	82	1682106841000	ipsum cursus	1646450402000	1024
76	https://cnn.com/fr?q=test	35	1654111758000	vulputate, risus	1649767124000	1024
77	http://netflix.com/one?search=1	33	1649750155000	nec	1647894146000	256
78	http://twitter.com/fr?str=se	33	1687748478000	dui, semper	1655613420000	256
79	https://nytimes.com/one?q=11	68	1675510783000	Aliquam nec	1645427568000	256
80	https://yahoo.com/en-ca?q=4	89	1684897666000	mattis velit	1662554116000	256
81	https://youtube.com/group/9?search=1	21	1662288617000	pellentesque massa lobortis	1652134000000	512
82	http://google.com/one?gi=100	61	1678363777000	lorem, auctor	1643581954000	512
83	https://twitter.com/site?search=1&q=de	42	1653437761000	lectus. Cum	1644139126000	512
84	https://twitter.com/en-ca?gi=100	45	1682278101000	tempor erat	1654220109000	512
85	https://pinterest.com/en-us?client=g	31	1662461320000	nec tellus.	1658557648000	128
86	https://nytimes.com/one?ab=441&aad=2	71	1641258078000	per inceptos	1659223444000	128
87	https://walmart.com/group/9?q=4	36	1659978865000	lacus.	1667186534000	128
88	https://netflix.com/site?q=4	11	1655804761000	risus. Nunc	1650846384000	128
89	https://twitter.com/site?k=0	78	1684276469000	erat volutpat. Nulla	1655569214000	64
90	http://guardian.co.uk/site?q=0	57	1686910266000	ipsum non arcu.	1667906304000	64
91	https://google.com/settings?page=1&offset=1	65	1695456834000	Proin	1657500704000	64
92	https://google.com/group/9?q=4	95	1658622894000	vel sapien	1646436248000	64
93	http://instagram.com/group/9?client=g	25	1683884961000	dui nec urna	1655488755000	32
94	http://pinterest.com/user/110?q=test	3	1695937870000	auctor quis, tristique	1659870869000	32
95	http://cnn.com/en-us?ad=115	43	1671823683000	molestie	1651353057000	32
96	http://reddit.com/en-ca?str=se	21	1686298653000	amet ante.	1668730420000	32
97	https://cnn.com/one?page=1&offset=1	33	1674149345000	ornare. In	1644801429000	1024
98	http://twitter.com/en-us?ab=441&aad=2	7	1650395711000	lobortis risus.	1652393328000	1024
99	http://yahoo.com/fr?k=0	79	1658430909000	erat.	1650901924000	1024
100	http://walmart.com/group/9?page=1&offset=1	15	1657735133000	rutrum non,	1670009755000	1024
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: devavi
--

COPY public.subscriptions (id, type_id, signed_on_id, created_at, is_active) FROM stdin;
1	1	51	1654549655000	Yes
2	2	45	1642826573000	Yes
3	2	47	1657611868000	Yes
4	2	98	1646588396000	Yes
5	1	92	1662810273000	No
6	1	90	1645757874000	No
7	2	23	1666799001000	No
8	1	42	1667037960000	No
9	1	63	1649967285000	Yes
10	1	90	1647863216000	Yes
11	2	5	1640640891000	Yes
12	1	49	1643566708000	No
13	1	35	1660867567000	No
14	1	37	1662526455000	Yes
15	2	91	1657168158000	Yes
16	1	1	1641963785000	Yes
17	1	8	1668431064000	Yes
18	1	79	1645283857000	Yes
19	1	40	1643036294000	Yes
20	2	76	1668743704000	No
21	1	55	1667631348000	Yes
22	2	98	1660751410000	No
23	2	85	1639598460000	Yes
24	1	52	1656719288000	Yes
25	1	35	1647659100000	No
26	1	20	1647794485000	No
27	1	21	1659398062000	No
28	2	74	1643410593000	No
29	2	89	1648366353000	No
30	2	30	1639755222000	Yes
31	1	62	1649659176000	Yes
32	2	31	1664523857000	Yes
33	1	10	1658989765000	Yes
34	2	21	1667498550000	No
35	2	5	1669187965000	No
36	1	20	1659846726000	No
37	2	63	1666074171000	Yes
38	2	29	1653458259000	Yes
39	1	27	1656780145000	Yes
40	2	6	1646295718000	Yes
41	2	27	1654297969000	No
42	1	3	1650938325000	No
43	1	28	1650681279000	Yes
44	1	87	1666106342000	No
45	1	76	1642555017000	Yes
46	2	29	1644358767000	No
47	1	85	1643386557000	Yes
48	1	27	1660077582000	Yes
49	1	52	1644992444000	Yes
50	2	71	1666278027000	No
51	2	51	1653015981000	No
52	1	82	1639405604000	No
53	2	78	1642014857000	Yes
54	1	89	1650602584000	Yes
55	2	72	1655398364000	Yes
56	1	52	1656664793000	Yes
57	1	55	1652897492000	Yes
58	1	82	1641924667000	No
59	2	92	1660823531000	No
60	1	82	1645630915000	No
61	2	61	1661094246000	No
62	1	64	1666373707000	No
63	2	99	1654291083000	No
64	1	46	1655095144000	Yes
65	1	22	1642932447000	Yes
66	2	21	1663304244000	Yes
67	2	69	1653160277000	No
68	1	9	1670013915000	No
69	1	60	1647484969000	Yes
70	2	33	1655016314000	No
71	2	64	1655545263000	Yes
72	1	28	1656006450000	No
73	2	19	1651794026000	No
74	1	58	1652138495000	Yes
75	1	96	1652465072000	Yes
76	1	26	1643877649000	No
77	2	39	1642959327000	Yes
78	2	94	1657145593000	Yes
79	2	78	1642986154000	No
80	1	97	1650129256000	Yes
81	1	46	1664617313000	Yes
82	2	3	1640558186000	Yes
83	2	25	1657569492000	Yes
84	2	11	1668982693000	Yes
85	1	6	1644061420000	No
86	1	42	1651767877000	No
87	2	4	1662384802000	No
88	2	52	1660357172000	Yes
89	1	71	1640494422000	No
90	1	51	1647594634000	No
91	2	82	1669147066000	Yes
92	1	54	1657965986000	Yes
93	1	7	1663319449000	No
94	1	25	1641790278000	Yes
95	1	79	1664967535000	Yes
96	1	53	1656127246000	Yes
97	1	45	1646072138000	Yes
98	1	16	1656445590000	No
99	2	21	1668431308000	Yes
100	1	24	1648395643000	Yes
\.


--
-- Data for Name: subscrition_type; Type: TABLE DATA; Schema: public; Owner: devavi
--

COPY public.subscrition_type (id, name) FROM stdin;
1	user
2	community
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: devavi
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Xyla	Erickson	tellus.phasellus.elit@outlook.com	360-1444	45	1654623661000
2	Chester	Hopkins	blandit.enim@yahoo.edu	245-2326	22	1638869264000
3	Mari	Dominguez	a.ultricies@google.edu	285-6851	17	1669712841000
4	Deirdre	Peterson	elit.fermentum@protonmail.org	657-1046	23	1643116125000
5	Hilel	Prince	tellus.justo@aol.edu	876-4109	13	1655076829000
6	Venus	Mckenzie	aliquam.tincidunt.nunc@outlook.com	629-2667	38	1660398541000
7	Hunter	Head	ut.nulla.cras@hotmail.com	773-8183	10	1666130984000
8	Kylee	Cotton	magna.a@yahoo.ca	263-7616	17	1645936510000
9	Martena	Levy	ipsum.leo@yahoo.edu	553-6151	22	1663910734000
10	Ivy	Shannon	eu.nibh.vulputate@hotmail.couk	346-4857	41	1643276883000
11	Genevieve	Rice	dui.lectus.rutrum@google.ca	643-2132	3	1643471792000
12	Lilah	Huber	egestas@yahoo.couk	668-7468	41	1658642478000
13	Sonya	Barton	cras.interdum@protonmail.net	638-1137	3	1667153933000
14	Moana	Cantu	sit@protonmail.couk	706-5925	33	1658510897000
15	Cody	Butler	feugiat.sed@hotmail.org	333-2372	20	1657267319000
16	Hamilton	Pacheco	ipsum.phasellus.vitae@outlook.ca	736-1374	48	1658642632000
17	Gage	Glass	lorem.semper.auctor@icloud.couk	928-4242	46	1659851940000
18	Mark	Alvarez	primis.in@icloud.org	224-1849	33	1668338273000
19	Jael	Key	risus.in@outlook.couk	327-3556	43	1649259459000
20	Minerva	Giles	eleifend.non@icloud.org	906-8467	45	1669625187000
21	Drew	Gay	consequat.lectus@hotmail.couk	464-0652	24	1657992494000
22	Aquila	Shields	natoque.penatibus@aol.ca	423-2149	29	1642694135000
23	Urielle	Kent	massa.suspendisse@hotmail.edu	752-4929	33	1647239884000
24	Ali	Dean	quis@outlook.couk	345-4597	23	1657450627000
25	Noel	Peterson	cursus.luctus@yahoo.org	737-1385	29	1654219574000
26	Cyrus	Hogan	egestas.rhoncus@aol.edu	547-2985	22	1652440028000
27	Neil	Lyons	consectetuer@icloud.net	727-9773	18	1646240283000
28	Adele	Tillman	sed.neque@icloud.net	884-1934	9	1644174841000
29	Willow	Robles	felis.donec@yahoo.org	195-1716	49	1649672323000
30	Leila	Simpson	condimentum.donec@aol.ca	866-8192	43	1642946575000
31	Mohammad	Fuentes	justo@icloud.net	787-8031	36	1669766319000
32	Brian	Mason	auctor.vitae.aliquet@icloud.com	751-1560	43	1666366143000
33	Lewis	Bright	nulla.eget@icloud.edu	482-9227	11	1645514248000
34	Mira	Shepherd	magna.sed@aol.couk	982-4134	3	1645041460000
35	Charde	Williamson	lorem.sit@icloud.com	717-2720	9	1665719490000
36	Naomi	Best	penatibus.et@google.couk	454-3389	27	1668316195000
37	Cedric	Barber	arcu@outlook.ca	543-8266	38	1650881409000
38	Keiko	Morrison	hendrerit@icloud.couk	551-7411	14	1649938136000
39	Russell	Mooney	lorem@icloud.couk	563-9846	17	1648960033000
40	Shay	Cline	donec.porttitor@outlook.com	358-6624	34	1641470553000
41	Nevada	Walsh	lacus.mauris@outlook.org	822-5648	29	1657182274000
42	Benedict	Neal	augue.scelerisque@outlook.ca	137-8778	1	1640212992000
43	Erica	Wilkins	sem@aol.edu	387-5327	8	1642631464000
44	Hyacinth	Shepherd	aliquet.magna@yahoo.com	454-7348	8	1662208912000
45	Deacon	Klein	ac.fermentum.vel@icloud.net	536-8265	43	1662313541000
46	Alyssa	Marquez	elit.a.feugiat@protonmail.org	754-2332	22	1663068266000
47	Nyssa	Brown	elit.pharetra@hotmail.couk	398-5266	19	1665143829000
48	Nissim	Moon	faucibus@protonmail.com	281-1643	44	1660687632000
49	Nicholas	Lynch	fames.ac@outlook.org	148-1495	49	1648710116000
50	Raven	Justice	praesent.luctus@yahoo.couk	217-4393	27	1647356593000
51	Isabella	Hebert	eu.lacus.quisque@hotmail.com	637-5437	17	1655917188000
52	Keith	Henson	diam.sed@google.org	483-1573	38	1648869335000
53	Rhonda	Guy	ullamcorper.duis@outlook.com	201-6636	44	1661441072000
54	Hyacinth	Garner	eu.augue.porttitor@yahoo.com	453-4745	13	1669204628000
55	Uriel	Crane	vestibulum.massa.rutrum@google.net	916-8775	8	1650543199000
56	Harper	Everett	donec.egestas.aliquam@google.ca	652-2281	24	1664119099000
57	Nomlanga	Mcconnell	arcu@aol.ca	437-8716	17	1652421672000
58	Rashad	Jackson	sem@icloud.ca	215-1366	47	1651711543000
59	Ulla	Simmons	id@yahoo.edu	771-6642	39	1662403141000
60	Ramona	Vargas	elementum.purus@aol.ca	954-1565	41	1663580379000
61	Zeus	Drake	pede.cum.sociis@hotmail.com	773-7546	37	1659601865000
62	Emery	Mckee	erat@hotmail.net	483-8640	44	1659303063000
63	Beau	Kent	mauris.erat@icloud.com	540-2160	17	1654781481000
64	Tatum	Mckenzie	gravida@google.couk	313-3123	2	1650390990000
65	Myra	Russo	dictum.sapien@outlook.com	534-2728	34	1656842824000
66	Fleur	Dean	diam@icloud.net	173-7229	49	1668803503000
67	Deacon	Cochran	mauris.sapien@protonmail.edu	482-8524	21	1665088706000
68	Murphy	Schneider	vitae.purus.gravida@yahoo.com	223-4426	26	1641798015000
69	Elvis	Howell	sed.dictum@aol.net	871-4315	43	1656977055000
70	India	Robinson	cras@icloud.com	961-5945	16	1659243970000
71	Frances	Parrish	nec@outlook.couk	282-9858	7	1658385163000
72	Lewis	Hutchinson	sem.nulla@yahoo.couk	755-4893	13	1645807044000
73	Chloe	Hess	a.arcu@aol.couk	184-5058	3	1659416135000
74	Quintessa	Durham	curabitur@hotmail.com	722-6782	6	1667185701000
75	Karly	Schneider	faucibus.id@outlook.ca	217-2385	3	1656517051000
76	Willow	Cummings	donec.tempus@hotmail.net	735-8434	44	1660981146000
77	Deanna	Zimmerman	ante.ipsum@protonmail.com	661-5944	23	1646867564000
78	Mara	Holman	ante.maecenas@hotmail.couk	320-5572	33	1667417631000
79	Althea	Jefferson	risus.a@google.couk	436-9670	38	1639055128000
80	Seth	Holcomb	consequat@icloud.org	557-3857	6	1649511923000
81	Macey	Morse	arcu.imperdiet@google.couk	561-0145	14	1670224047000
82	Sade	Hodges	orci@hotmail.edu	571-8068	50	1649659435000
83	Ciara	Hernandez	felis.purus@google.couk	751-2227	27	1659185489000
84	Kaseem	Blackwell	nunc.id@aol.net	887-2876	45	1646097365000
85	Laurel	Mclean	at.auctor@google.org	819-8818	6	1651474680000
86	Aaron	Hardin	et.arcu@yahoo.net	743-6323	30	1639008684000
87	Clinton	Oliver	nonummy.fusce@protonmail.net	368-5542	35	1652275748000
88	Lysandra	Rosales	sit.amet@outlook.edu	535-2439	41	1664161570000
89	Demetrius	Pollard	magnis.dis@outlook.net	788-7557	10	1654183274000
90	Justin	Wynn	orci.phasellus@icloud.org	791-7718	42	1659055971000
91	Zahir	Murray	nulla.donec@aol.org	956-1677	22	1666642123000
92	Ciaran	Munoz	pede@icloud.couk	416-5948	22	1649395985000
93	Camden	Hayden	senectus@hotmail.org	322-2263	5	1662947623000
94	Louis	Henry	viverra.donec.tempus@protonmail.net	652-3615	2	1649570389000
95	Lane	Edwards	nulla.interdum@hotmail.org	177-6081	2	1657162651000
96	Upton	Hurley	tincidunt.vehicula@outlook.net	970-1827	14	1641894005000
97	Kyra	Miller	egestas@aol.org	255-5561	22	1640938655000
98	Malcolm	Kirkland	fusce.mi@aol.net	430-5415	13	1652278261000
99	Louis	Welch	neque.vitae.semper@google.couk	748-3052	15	1649220373000
100	Caldwell	Langley	pede@protonmail.org	748-0023	15	1641974859000
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: devavi
--

COPY public.video (id, url, owner_id, created_at, description, uploaded_at, size) FROM stdin;
1	http://guardian.co.uk/en-ca?ab=441&aad=2	78	1649413534000	Phasellus nulla. Integer	1647801437000	1024
2	https://naver.com/user/110?search=1	42	1701466328000	Proin dolor.	1639346770000	1024
3	https://netflix.com/group/9?q=0	40	1649402250000	eget varius ultrices,	1647925571000	1024
4	http://nytimes.com/sub?k=0	13	1697980228000	mauris	1661614408000	1024
5	http://bbc.co.uk/site?q=0	9	1663801461000	Ut nec	1649028530000	256
6	https://whatsapp.com/sub?q=11	77	1648292850000	erat volutpat. Nulla	1649467857000	256
7	http://wikipedia.org/sub?q=test	73	1662249061000	Mauris	1655871293000	256
8	http://walmart.com/sub?p=8	33	1652334706000	Pellentesque ut	1670064302000	256
9	http://wikipedia.org/en-us?gi=100	16	1676672639000	turpis.	1653305914000	512
10	https://wikipedia.org/one?q=test	42	1697071288000	congue a,	1644280323000	512
11	https://zoom.us/fr?ab=441&aad=2	11	1642698930000	commodo auctor	1666072778000	512
12	http://yahoo.com/sub?search=1&q=de	44	1680288701000	dolor, nonummy	1658796031000	512
13	http://facebook.com/fr?page=1&offset=1	82	1677953170000	sodales	1665091485000	128
14	https://baidu.com/site?q=4	91	1677140618000	magna. Praesent	1651559887000	128
15	https://wikipedia.org/site?ad=115	47	1663872659000	cubilia	1642300223000	128
16	https://naver.com/group/9?q=test	79	1662774239000	Phasellus	1646837086000	128
17	https://whatsapp.com/en-ca?q=0	36	1700043554000	ac mi	1654559285000	64
18	http://instagram.com/site?q=test	73	1664067445000	penatibus et magnis	1652529193000	64
19	https://cnn.com/sub?search=1&q=de	28	1665676231000	ut,	1654387576000	64
20	https://google.com/fr?page=1&offset=1	28	1688064344000	Curabitur	1668906464000	64
21	https://facebook.com/one?q=0	17	1694485492000	aliquam, enim nec	1656754365000	32
22	http://ebay.com/group/9?page=1&offset=1	25	1696711504000	Nullam nisl.	1662285266000	32
23	http://yahoo.com/sub/cars?q=11	62	1643425434000	iaculis	1656038697000	32
24	https://zoom.us/fr?q=test	13	1690585007000	turpis vitae purus	1669954679000	32
25	http://yahoo.com/group/9?k=0	80	1668000672000	dictum eleifend,	1647919535000	1024
26	https://facebook.com/one?q=11	30	1689489474000	egestas rhoncus. Proin	1639871858000	1024
27	https://zoom.us/en-ca?client=g	47	1645001162000	mattis semper, dui	1658902737000	1024
28	https://naver.com/settings?str=se	67	1698897185000	semper cursus.	1648325801000	1024
29	http://cnn.com/group/9?g=1	24	1659631971000	Etiam laoreet,	1667411104000	256
30	http://yahoo.com/fr?search=1	91	1649984088000	magnis dis	1656228986000	256
31	http://yahoo.com/group/9?gi=100	21	1671114095000	egestas. Duis ac	1655627711000	256
32	https://instagram.com/settings?page=1&offset=1	2	1668291514000	ante dictum	1654752853000	256
33	http://reddit.com/en-ca?p=8	35	1684799957000	nunc sit	1647393354000	512
34	http://google.com/fr?k=0	16	1687368033000	Sed nunc	1646206661000	512
35	https://baidu.com/sub?page=1&offset=1	29	1647481694000	dui. Cum	1651846748000	512
36	http://google.com/one?gi=100	7	1678614786000	pellentesque	1662413616000	512
37	https://twitter.com/settings?p=8	84	1686482295000	parturient montes,	1648672105000	128
38	https://whatsapp.com/en-ca?q=4	84	1667685880000	Nullam	1652875687000	128
39	http://nytimes.com/one?g=1	62	1694769897000	tempus scelerisque,	1649458033000	128
40	http://twitter.com/sub/cars?gi=100	11	1670031638000	sociosqu ad	1640577523000	128
41	https://youtube.com/site?search=1	67	1659522650000	mollis lectus	1664677481000	64
42	https://netflix.com/user/110?p=8	10	1681420777000	molestie arcu.	1641485787000	64
43	http://cnn.com/site?q=test	20	1653680397000	ac	1661099164000	64
44	https://youtube.com/settings?k=0	30	1695026103000	lacus. Mauris non	1657160913000	64
45	http://zoom.us/one?g=1	77	1661914874000	augue ut	1664578702000	32
46	https://cnn.com/site?q=test	72	1694484511000	montes,	1643507575000	32
47	https://netflix.com/site?str=se	37	1691808948000	ut	1666889768000	32
48	http://google.com/user/110?q=11	60	1693318565000	Nam	1669289983000	32
49	https://ebay.com/group/9?k=0	41	1691218558000	ipsum. Suspendisse	1642505719000	1024
50	https://nytimes.com/site?k=0	52	1654433210000	Nunc	1648492035000	1024
51	http://cnn.com/user/110?k=0	23	1696182303000	nec metus facilisis	1645503438000	1024
52	https://zoom.us/user/110?page=1&offset=1	61	1686675990000	convallis est, vitae	1647772088000	1024
53	https://wikipedia.org/sub/cars?q=test	66	1699996032000	mus. Aenean	1644018541000	256
54	http://reddit.com/settings?str=se	67	1701201266000	vulputate mauris sagittis	1638810803000	256
55	https://naver.com/en-ca?client=g	6	1677165397000	eget odio. Aliquam	1657858141000	256
56	http://baidu.com/sub?page=1&offset=1	2	1666917865000	ante ipsum primis	1664862874000	256
57	https://ebay.com/group/9?q=0	54	1670007074000	at augue id	1667216245000	512
58	https://ebay.com/one?search=1	52	1701336711000	dolor	1661106446000	512
59	https://yahoo.com/fr?search=1&q=de	65	1687233615000	lorem semper auctor.	1643656000000	512
60	https://whatsapp.com/sub/cars?q=test	48	1647590407000	dictum	1654362362000	512
61	https://whatsapp.com/site?str=se	8	1673367964000	sollicitudin a,	1644061704000	128
62	http://nytimes.com/sub?client=g	44	1683242319000	arcu.	1638956689000	128
63	https://twitter.com/en-ca?q=0	62	1678545840000	Phasellus	1663409786000	128
64	http://youtube.com/sub/cars?client=g	72	1638791874000	Proin nisl sem,	1658489568000	128
65	https://google.com/en-us?str=se	31	1697005577000	dis parturient	1650730186000	64
66	https://youtube.com/sub/cars?client=g	77	1689523198000	non sapien	1664324068000	64
67	http://cnn.com/fr?str=se	38	1691634728000	amet nulla. Donec	1651065390000	64
68	https://twitter.com/en-us?gi=100	41	1651514518000	egestas. Duis	1642269051000	64
69	http://reddit.com/group/9?q=test	35	1651760529000	dolor	1663513611000	32
70	http://whatsapp.com/sub/cars?ab=441&aad=2	69	1649142094000	tellus eu augue	1651707576000	32
71	https://nytimes.com/en-ca?q=4	40	1645799118000	vulputate, posuere vulputate,	1669963754000	32
72	https://youtube.com/sub?page=1&offset=1	10	1651945962000	vitae nibh. Donec	1655078024000	32
73	http://twitter.com/group/9?q=test	12	1688625497000	enim nisl	1639682425000	1024
74	https://instagram.com/en-ca?search=1&q=de	76	1654875543000	est ac mattis	1642640843000	1024
75	https://instagram.com/user/110?q=11	31	1671336573000	urna. Ut	1658173019000	1024
76	http://guardian.co.uk/en-us?p=8	7	1681951937000	egestas,	1648135138000	1024
77	http://guardian.co.uk/sub?search=1	67	1667315902000	senectus et netus	1653542376000	256
78	https://nytimes.com/en-ca?ad=115	46	1695138257000	Praesent eu nulla	1664411564000	256
79	http://ebay.com/one?search=1	77	1689374257000	orci,	1667831354000	256
80	http://twitter.com/settings?ab=441&aad=2	28	1683948485000	molestie tortor	1650634421000	256
81	http://baidu.com/fr?q=test	26	1684355603000	Morbi vehicula.	1652411205000	512
82	http://pinterest.com/fr?q=4	59	1655466060000	non enim	1644446489000	512
83	http://wikipedia.org/site?str=se	71	1694904285000	sem. Nulla	1659543463000	512
84	http://whatsapp.com/fr?search=1	52	1647434834000	luctus	1663375823000	512
85	http://zoom.us/fr?gi=100	65	1668110102000	Vestibulum accumsan	1639927388000	128
86	https://zoom.us/one?search=1	32	1676621906000	malesuada	1644179237000	128
87	http://wikipedia.org/settings?q=4	19	1656725517000	faucibus orci	1639839515000	128
88	http://guardian.co.uk/settings?search=1&q=de	30	1655555070000	Ut tincidunt vehicula	1651458165000	128
89	https://youtube.com/group/9?search=1	36	1650081588000	elit, pellentesque	1639084800000	64
90	https://bbc.co.uk/user/110?search=1	81	1660983797000	a purus.	1664080732000	64
91	https://baidu.com/sub/cars?g=1	32	1666586268000	luctus sit	1658849051000	64
92	http://twitter.com/en-us?g=1	36	1658942264000	velit. Pellentesque ultricies	1660531815000	64
93	http://walmart.com/one?search=1	24	1648249728000	ultricies dignissim	1644753516000	32
94	http://youtube.com/sub/cars?search=1&q=de	43	1700890619000	a	1643062524000	32
95	http://netflix.com/user/110?k=0	46	1687723858000	mi tempor	1665530642000	32
96	https://netflix.com/fr?q=4	87	1688902122000	amet, dapibus	1663378649000	32
97	http://google.com/en-ca?g=1	24	1695954810000	odio vel	1642328499000	1024
98	http://baidu.com/group/9?search=1	61	1697653347000	rhoncus.	1668880741000	1024
99	https://wikipedia.org/user/110?ad=115	19	1697232377000	ornare. In	1639594793000	1024
100	http://facebook.com/fr?q=4	60	1651185131000	velit. Cras	1652740150000	1024
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devavi
--

SELECT pg_catalog.setval('public.communities_id_seq', 100, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devavi
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devavi
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 4, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devavi
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devavi
--

SELECT pg_catalog.setval('public.photo_id_seq', 100, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devavi
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 100, true);


--
-- Name: subscrition_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devavi
--

SELECT pg_catalog.setval('public.subscrition_type_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devavi
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devavi
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: subscrition_type subscrition_type_pkey; Type: CONSTRAINT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.subscrition_type
    ADD CONSTRAINT subscrition_type_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: devavi
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

