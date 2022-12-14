--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: weather; Type: DATABASE; Schema: -; Owner: postgres
--
\connect weather

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
-- Name: WeatherDataSourceEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."WeatherDataSourceEnum" AS ENUM (
    'OPEN_WEATHER_MAP'
);


ALTER TYPE public."WeatherDataSourceEnum" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cities" (
    id integer NOT NULL,
    name character varying NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    "countryId" integer NOT NULL,
    "cityStatId" integer NOT NULL
);


ALTER TABLE public."Cities" OWNER TO postgres;

--
-- Name: Cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Cities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Cities_id_seq" OWNER TO postgres;

--
-- Name: Cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Cities_id_seq" OWNED BY public."Cities".id;


--
-- Name: CityStats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CityStats" (
    id integer NOT NULL,
    "numberOfView" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."CityStats" OWNER TO postgres;

--
-- Name: CityStats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CityStats_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CityStats_id_seq" OWNER TO postgres;

--
-- Name: CityStats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CityStats_id_seq" OWNED BY public."CityStats".id;


--
-- Name: Countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Countries" (
    id integer NOT NULL,
    name character varying NOT NULL,
    code character varying(10) NOT NULL
);


ALTER TABLE public."Countries" OWNER TO postgres;

--
-- Name: Countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Countries_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Countries_id_seq" OWNER TO postgres;

--
-- Name: Countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Countries_id_seq" OWNED BY public."Countries".id;


--
-- Name: WeatherDescriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeatherDescriptions" (
    id integer NOT NULL,
    text text,
    type character varying NOT NULL
);


ALTER TABLE public."WeatherDescriptions" OWNER TO postgres;

--
-- Name: WeatherDescriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeatherDescriptions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeatherDescriptions_id_seq" OWNER TO postgres;

--
-- Name: WeatherDescriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeatherDescriptions_id_seq" OWNED BY public."WeatherDescriptions".id;


--
-- Name: WeatherForecasts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeatherForecasts" (
    id integer NOT NULL,
    "cityId" integer NOT NULL,
    "dayTimestamp" integer NOT NULL,
    description text,
    sunrise integer NOT NULL,
    sunset integer NOT NULL,
    "weatherDataSource" public."WeatherDataSourceEnum" DEFAULT 'OPEN_WEATHER_MAP'::public."WeatherDataSourceEnum" NOT NULL
);


ALTER TABLE public."WeatherForecasts" OWNER TO postgres;

--
-- Name: WeatherForecasts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeatherForecasts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeatherForecasts_id_seq" OWNER TO postgres;

--
-- Name: WeatherForecasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeatherForecasts_id_seq" OWNED BY public."WeatherForecasts".id;


--
-- Name: WeatherSummaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeatherSummaries" (
    id integer NOT NULL,
    humidity double precision NOT NULL,
    pressure double precision NOT NULL,
    temperature double precision NOT NULL,
    "temperatureFeelsLike" double precision NOT NULL,
    "temperatureMax" double precision NOT NULL,
    "temperatureMin" double precision NOT NULL
);


ALTER TABLE public."WeatherSummaries" OWNER TO postgres;

--
-- Name: WeatherSummaries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeatherSummaries_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeatherSummaries_id_seq" OWNER TO postgres;

--
-- Name: WeatherSummaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeatherSummaries_id_seq" OWNED BY public."WeatherSummaries".id;


--
-- Name: WeatherTimestamps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeatherTimestamps" (
    id integer NOT NULL,
    cloudiness double precision NOT NULL,
    "timestamp" integer NOT NULL,
    "weatherDescriptionId" integer NOT NULL,
    "weatherSummaryId" integer NOT NULL,
    "weatherWindId" integer NOT NULL,
    "weatherForecastId" integer NOT NULL
);


ALTER TABLE public."WeatherTimestamps" OWNER TO postgres;

--
-- Name: WeatherTimestamps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeatherTimestamps_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeatherTimestamps_id_seq" OWNER TO postgres;

--
-- Name: WeatherTimestamps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeatherTimestamps_id_seq" OWNED BY public."WeatherTimestamps".id;


--
-- Name: WeatherWinds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeatherWinds" (
    id integer NOT NULL,
    degrees double precision NOT NULL,
    gust double precision NOT NULL,
    speed double precision NOT NULL
);


ALTER TABLE public."WeatherWinds" OWNER TO postgres;

--
-- Name: WeatherWinds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeatherWinds_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeatherWinds_id_seq" OWNER TO postgres;

--
-- Name: WeatherWinds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeatherWinds_id_seq" OWNED BY public."WeatherWinds".id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: Cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cities" ALTER COLUMN id SET DEFAULT nextval('public."Cities_id_seq"'::regclass);


--
-- Name: CityStats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CityStats" ALTER COLUMN id SET DEFAULT nextval('public."CityStats_id_seq"'::regclass);


--
-- Name: Countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Countries" ALTER COLUMN id SET DEFAULT nextval('public."Countries_id_seq"'::regclass);


--
-- Name: WeatherDescriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherDescriptions" ALTER COLUMN id SET DEFAULT nextval('public."WeatherDescriptions_id_seq"'::regclass);


--
-- Name: WeatherForecasts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherForecasts" ALTER COLUMN id SET DEFAULT nextval('public."WeatherForecasts_id_seq"'::regclass);


--
-- Name: WeatherSummaries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherSummaries" ALTER COLUMN id SET DEFAULT nextval('public."WeatherSummaries_id_seq"'::regclass);


--
-- Name: WeatherTimestamps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherTimestamps" ALTER COLUMN id SET DEFAULT nextval('public."WeatherTimestamps_id_seq"'::regclass);


--
-- Name: WeatherWinds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherWinds" ALTER COLUMN id SET DEFAULT nextval('public."WeatherWinds_id_seq"'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Data for Name: Cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cities" (id, name, latitude, longitude, "countryId", "cityStatId") FROM stdin;
1	Paris	48.85339	2.34864	1	1
2	Berlin	52.524368	13.41053	2	2
3	Madrid	40.4165	-3.70256	3	3
4	Rome	41.894741	12.4839	4	4
5	Bern	46.94809	7.44744	5	5
\.


--
-- Data for Name: CityStats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CityStats" (id, "numberOfView") FROM stdin;
1	0
2	0
3	0
4	0
5	0
\.


--
-- Data for Name: Countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Countries" (id, name, code) FROM stdin;
1	France	FR
2	German	DE
3	Espana	ES
4	Italia	IT
5	Switzerland	CH
\.


--
-- Data for Name: WeatherDescriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeatherDescriptions" (id, text, type) FROM stdin;
6	broken clouds	Clouds
7	light snow	Snow
8	light snow	Snow
9	overcast clouds	Clouds
10	broken clouds	Clouds
11	broken clouds	Clouds
12	overcast clouds	Clouds
13	overcast clouds	Clouds
14	scattered clouds	Clouds
15	broken clouds	Clouds
16	broken clouds	Clouds
17	scattered clouds	Clouds
18	scattered clouds	Clouds
19	scattered clouds	Clouds
20	clear sky	Clear
21	clear sky	Clear
22	clear sky	Clear
23	clear sky	Clear
24	clear sky	Clear
25	clear sky	Clear
26	clear sky	Clear
27	scattered clouds	Clouds
28	scattered clouds	Clouds
29	scattered clouds	Clouds
30	overcast clouds	Clouds
31	overcast clouds	Clouds
32	broken clouds	Clouds
33	scattered clouds	Clouds
34	scattered clouds	Clouds
35	broken clouds	Clouds
36	overcast clouds	Clouds
37	overcast clouds	Clouds
38	light rain	Rain
39	overcast clouds	Clouds
40	light rain	Rain
41	light rain	Rain
42	light rain	Rain
43	moderate rain	Rain
44	moderate rain	Rain
45	light rain	Rain
46	clear sky	Clear
47	clear sky	Clear
48	clear sky	Clear
49	few clouds	Clouds
50	scattered clouds	Clouds
51	scattered clouds	Clouds
52	few clouds	Clouds
53	clear sky	Clear
54	clear sky	Clear
55	clear sky	Clear
56	clear sky	Clear
57	clear sky	Clear
58	few clouds	Clouds
59	broken clouds	Clouds
60	overcast clouds	Clouds
61	broken clouds	Clouds
62	scattered clouds	Clouds
63	scattered clouds	Clouds
64	few clouds	Clouds
65	few clouds	Clouds
66	scattered clouds	Clouds
67	scattered clouds	Clouds
68	scattered clouds	Clouds
69	few clouds	Clouds
70	clear sky	Clear
71	clear sky	Clear
72	scattered clouds	Clouds
73	scattered clouds	Clouds
74	scattered clouds	Clouds
75	scattered clouds	Clouds
76	clear sky	Clear
77	few clouds	Clouds
78	few clouds	Clouds
79	broken clouds	Clouds
80	overcast clouds	Clouds
81	overcast clouds	Clouds
82	overcast clouds	Clouds
83	overcast clouds	Clouds
84	light rain	Rain
85	light rain	Rain
86	light rain	Rain
87	moderate rain	Rain
88	light rain	Rain
89	light rain	Rain
90	light rain	Rain
91	broken clouds	Clouds
92	light rain	Rain
93	light rain	Rain
94	overcast clouds	Clouds
95	overcast clouds	Clouds
96	broken clouds	Clouds
97	broken clouds	Clouds
98	broken clouds	Clouds
99	broken clouds	Clouds
100	few clouds	Clouds
101	few clouds	Clouds
102	clear sky	Clear
103	clear sky	Clear
104	clear sky	Clear
105	clear sky	Clear
106	broken clouds	Clouds
107	broken clouds	Clouds
108	broken clouds	Clouds
109	broken clouds	Clouds
110	overcast clouds	Clouds
111	broken clouds	Clouds
112	scattered clouds	Clouds
113	broken clouds	Clouds
114	overcast clouds	Clouds
115	overcast clouds	Clouds
116	broken clouds	Clouds
117	broken clouds	Clouds
118	overcast clouds	Clouds
119	overcast clouds	Clouds
120	broken clouds	Clouds
121	overcast clouds	Clouds
122	few clouds	Clouds
123	few clouds	Clouds
124	scattered clouds	Clouds
125	broken clouds	Clouds
126	light rain	Rain
127	light rain	Rain
128	overcast clouds	Clouds
129	overcast clouds	Clouds
130	overcast clouds	Clouds
131	broken clouds	Clouds
132	overcast clouds	Clouds
133	overcast clouds	Clouds
134	light rain	Rain
135	light rain	Rain
136	light rain	Rain
137	moderate rain	Rain
138	light rain	Rain
139	broken clouds	Clouds
140	light rain	Rain
141	light rain	Rain
142	light rain	Rain
143	light rain	Rain
144	moderate rain	Rain
145	light rain	Rain
146	light rain	Rain
147	light rain	Rain
148	overcast clouds	Clouds
149	overcast clouds	Clouds
150	overcast clouds	Clouds
151	broken clouds	Clouds
152	clear sky	Clear
153	clear sky	Clear
154	clear sky	Clear
155	clear sky	Clear
156	clear sky	Clear
157	clear sky	Clear
158	clear sky	Clear
159	clear sky	Clear
160	few clouds	Clouds
161	scattered clouds	Clouds
162	broken clouds	Clouds
163	scattered clouds	Clouds
164	few clouds	Clouds
165	clear sky	Clear
166	light rain	Rain
167	light rain	Rain
168	light rain	Rain
169	light rain	Rain
170	light rain	Rain
171	overcast clouds	Clouds
172	overcast clouds	Clouds
173	overcast clouds	Clouds
174	overcast clouds	Clouds
175	light rain	Rain
176	snow	Snow
177	snow	Snow
178	snow	Snow
179	snow	Snow
180	light snow	Snow
181	light snow	Snow
182	light snow	Snow
183	light snow	Snow
184	broken clouds	Clouds
185	broken clouds	Clouds
186	overcast clouds	Clouds
187	overcast clouds	Clouds
188	overcast clouds	Clouds
189	broken clouds	Clouds
190	overcast clouds	Clouds
191	overcast clouds	Clouds
192	overcast clouds	Clouds
193	overcast clouds	Clouds
194	broken clouds	Clouds
195	broken clouds	Clouds
196	broken clouds	Clouds
197	broken clouds	Clouds
198	overcast clouds	Clouds
199	overcast clouds	Clouds
200	overcast clouds	Clouds
201	overcast clouds	Clouds
202	overcast clouds	Clouds
203	light rain	Rain
204	overcast clouds	Clouds
205	overcast clouds	Clouds
\.


--
-- Data for Name: WeatherForecasts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeatherForecasts" (id, "cityId", "dayTimestamp", description, sunrise, sunset, "weatherDataSource") FROM stdin;
6	1	0	\N	1671003393	1671033239	OPEN_WEATHER_MAP
7	2	0	\N	1671001795	1671029526	OPEN_WEATHER_MAP
8	3	0	\N	1671003004	1671036534	OPEN_WEATHER_MAP
9	4	0	\N	1670999397	1671032369	OPEN_WEATHER_MAP
10	5	0	\N	1671001693	1671032491	OPEN_WEATHER_MAP
\.


--
-- Data for Name: WeatherSummaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeatherSummaries" (id, humidity, pressure, temperature, "temperatureFeelsLike", "temperatureMax", "temperatureMin") FROM stdin;
6	81	1002	274.59	272.36	274.59	273.74
7	87	1003	273.76	270.97	273.76	273.13
8	84	1006	272.44	269.93	272.44	272.44
9	79	1007	271.54	268.65	271.54	271.54
10	76	1007	271.15	267.95	271.15	271.15
11	74	1007	270.95	267.97	270.95	270.95
12	69	1009	271.8	268.47	271.8	271.8
13	62	1008	274.09	270.26	274.09	274.09
14	73	1008	274.2	270.2	274.2	274.2
15	79	1010	273.06	268.77	273.06	273.06
16	87	1011	272.49	268.47	272.49	272.49
17	86	1012	271.68	268.08	271.68	271.68
18	89	1013	271.67	268.43	271.67	271.67
19	90	1015	272.02	267.97	272.02	272.02
20	79	1017	272.03	268.13	272.03	272.03
21	65	1018	274.06	270.97	274.06	274.06
22	72	1019	273.26	270.58	273.26	273.26
23	78	1021	271.85	268.53	271.85	271.85
24	82	1023	270.94	268.39	270.94	270.94
25	81	1023	270.34	268.19	270.34	270.34
26	80	1024	269.8	267.52	269.8	269.8
27	84	1024	269.44	267.26	269.44	269.44
28	84	1025	269.99	267.18	269.99	269.99
29	75	1025	272.56	269.5	272.56	272.56
30	81	1024	272.09	270.14	272.09	272.09
31	83	1024	270.86	267.08	270.86	270.86
32	79	1024	270.12	266.25	270.12	270.12
33	78	1023	269.51	266.15	269.51	269.51
34	79	1022	269.45	265.6	269.45	269.45
35	74	1020	270.32	266.25	270.32	270.32
36	72	1019	272.07	268.1	272.07	272.07
37	69	1018	274.77	270.99	274.77	274.77
38	90	1017	276.44	272.34	276.44	276.44
39	93	1016	277.23	273.17	277.23	277.23
40	96	1016	278.07	274.33	278.07	278.07
41	96	1015	279.47	276.14	279.47	279.47
42	95	1014	280.35	277.21	280.35	280.35
43	96	1013	281.72	278.72	281.72	281.72
44	93	1013	283.07	280.05	283.07	283.07
45	90	1013	284.56	284.11	284.56	284.56
46	84	997	269.89	266.4	269.89	268.83
47	87	1000	268.59	265.19	268.59	267.68
48	92	1004	266.95	264.5	266.95	266.95
49	95	1005	266.3	266.3	266.3	266.3
50	96	1005	265.86	263.24	265.86	265.86
51	92	1007	265.75	262.44	265.75	265.75
52	73	1009	267.54	263.99	267.54	267.54
53	67	1009	270.82	267.75	270.82	270.82
54	86	1009	268.6	265.7	268.6	268.6
55	86	1010	267.87	264.33	267.87	267.87
56	90	1011	267.13	267.13	267.13	267.13
57	91	1011	266.57	266.57	266.57	266.57
58	92	1012	266.38	266.38	266.38	266.38
59	90	1013	266.69	263.99	266.69	266.69
60	86	1015	268.23	268.23	268.23	268.23
61	83	1016	271.17	268.94	271.17	271.17
62	97	1018	268.85	268.85	268.85	268.85
63	96	1020	267.98	265.18	267.98	267.98
64	95	1021	267.34	264.39	267.34	267.34
65	95	1023	266.93	264.52	266.93	266.93
66	95	1024	266.54	266.54	266.54	266.54
67	95	1026	266.25	266.25	266.25	266.25
68	89	1028	268.28	268.28	268.28	268.28
69	82	1029	270.95	270.95	270.95	270.95
70	95	1030	268.38	268.38	268.38	268.38
71	97	1032	267.26	267.26	267.26	267.26
72	96	1033	266.66	264.03	266.66	266.66
73	97	1033	266.35	262.96	266.35	266.35
74	97	1034	266.57	262.18	266.57	266.57
75	94	1033	266.78	261.25	266.78	266.78
76	85	1033	268.35	262.9	268.35	268.35
77	73	1032	271.36	266.2	271.36	271.36
78	79	1030	270.43	264.72	270.43	270.43
79	78	1028	269.83	263.63	269.83	269.83
80	80	1026	269.84	263.45	269.84	269.84
81	77	1024	270.56	264.52	270.56	270.56
82	76	1022	271.19	265.66	271.19	271.19
83	73	1021	272.44	267.21	272.44	272.44
84	94	1020	273.55	268.56	273.55	273.55
85	92	1018	275.26	270.64	275.26	275.26
86	86	1003	285.66	285.21	285.66	285.51
87	86	1003	284.06	283.45	284.06	283.22
88	93	1001	282.51	280.06	282.51	282.51
89	91	1001	282.39	280.72	282.39	282.39
90	90	1000	282.01	279.48	282.01	282.01
91	92	1000	280.78	278.01	280.78	280.78
92	87	1001	281.51	279.14	281.51	281.51
93	71	1001	283.05	280.02	283.05	283.05
94	72	1001	283.14	280.71	283.14	283.14
95	81	1002	281.8	279.55	281.8	281.8
96	84	1005	280.69	278.6	280.69	280.69
97	83	1006	280.07	278.2	280.07	280.07
98	84	1007	279.49	278.07	279.49	279.49
99	85	1008	278.8	278.8	278.8	278.8
100	81	1010	279.63	279.63	279.63	279.63
101	65	1010	282.61	282.61	282.61	282.61
102	59	1010	283.79	282.45	283.79	283.79
103	70	1013	281.82	281.82	281.82	281.82
104	77	1015	280.8	280.8	280.8	280.8
105	81	1016	279.9	279.9	279.9	279.9
106	84	1017	279.32	279.32	279.32	279.32
107	85	1017	278.94	278.01	278.94	278.94
108	81	1019	280.07	280.07	280.07	280.07
109	72	1019	281.86	281.86	281.86	281.86
110	71	1019	282.28	282.28	282.28	282.28
111	80	1021	280.45	280.45	280.45	280.45
112	83	1023	279.86	279.86	279.86	279.86
113	85	1024	279.38	279.38	279.38	279.38
114	86	1024	279.65	279.65	279.65	279.65
115	86	1024	279.84	279.84	279.84	279.84
116	84	1026	280.58	280.58	280.58	280.58
117	74	1025	283.18	282.17	283.18	283.18
118	70	1024	284.75	283.79	284.75	284.75
119	81	1024	282.78	282.78	282.78	282.78
120	84	1025	282.11	282.11	282.11	282.11
121	88	1025	281.24	281.24	281.24	281.24
122	91	1026	280.54	280.54	280.54	280.54
123	93	1025	279.96	279.96	279.96	279.96
124	87	1026	281.21	281.21	281.21	281.21
125	68	1024	284.44	283.4	284.44	284.44
126	82	997	286.1	285.59	287.78	286.1
127	87	999	285.04	284.56	285.04	284.93
128	89	1004	282.93	281.32	282.93	282.93
129	86	1006	282.45	281.95	282.45	282.45
130	86	1007	281.95	281.28	281.95	281.95
131	86	1008	281.95	281.95	281.95	281.95
132	80	1009	285.03	284.36	285.03	285.03
133	78	1008	287.58	287.12	287.58	287.58
134	83	1006	287.45	287.1	287.45	287.45
135	85	1005	287.73	287.46	287.73	287.73
136	88	1005	288.6	288.5	288.6	288.6
137	96	1006	287.59	287.6	287.59	287.59
138	93	1006	286.03	285.8	286.03	286.03
139	89	1007	285.71	285.35	285.71	285.71
140	83	1009	288.2	287.93	288.2	288.2
141	72	1008	290.67	290.36	290.67	290.67
142	82	1009	288.57	288.31	288.57	288.57
143	86	1010	287.2	286.91	287.2	287.2
144	93	1010	286.3	286.1	286.3	286.3
145	93	1012	285.36	285.06	285.36	285.36
146	91	1013	284.92	284.53	284.92	284.92
147	80	1014	285.64	285.03	285.64	285.64
148	77	1016	286.47	285.87	286.47	286.47
149	76	1016	286.7	286.09	286.7	286.7
150	74	1017	286.35	285.66	286.35	286.35
151	82	1020	284.03	283.31	284.03	284.03
152	85	1022	283.14	282.41	283.14	283.14
153	87	1023	282.46	281.69	282.46	282.46
154	87	1024	281.76	280.75	281.76	281.76
155	86	1026	281.14	279.9	281.14	281.14
156	73	1028	283.91	282.95	283.91	283.91
157	61	1027	287.06	286.1	287.06	287.06
158	68	1027	285.94	285.05	285.94	285.94
159	77	1028	283.11	282.31	283.11	283.11
160	81	1030	281.83	280.49	281.83	281.83
161	83	1029	281.02	279.61	281.02	281.02
162	82	1029	280.46	279.09	280.46	280.46
163	81	1030	279.96	278.65	279.96	279.96
164	66	1030	283.02	282.51	283.02	283.02
165	52	1029	286.31	285.04	286.31	286.31
166	81	1000	277.68	275.49	278.9	277.68
167	90	1001	277.33	275.99	277.46	277.33
168	98	1003	276.89	275.04	276.89	276.89
169	98	1004	276.88	274.97	276.88	276.88
170	97	1004	276.94	275.56	276.94	276.94
171	97	1005	275.53	275.53	275.53	275.53
172	97	1005	277.01	277.01	277.01	277.01
173	99	1003	278.41	277.24	278.41	278.41
174	99	1001	277.03	274.67	277.03	277.03
175	99	1002	275.89	273.35	275.89	275.89
176	100	1004	274.78	273.46	274.78	274.78
177	100	1004	274.27	272.64	274.27	274.27
178	99	1006	273.71	271.29	273.71	273.71
179	98	1008	272.84	269.99	272.84	272.84
180	97	1011	272.74	269.46	272.74	272.74
181	95	1012	273.65	270.16	273.65	273.65
182	98	1014	273	270.02	273	273
183	98	1017	270.49	267.6	270.49	270.49
184	99	1020	266.32	266.32	266.32	266.32
185	99	1022	264.94	264.94	264.94	264.94
186	99	1024	264.87	264.87	264.87	264.87
187	98	1025	265.4	265.4	265.4	265.4
188	94	1025	268.56	268.56	268.56	268.56
189	92	1024	271.78	269.34	271.78	271.78
190	94	1024	271.51	269.27	271.51	271.51
191	97	1027	268.48	268.48	268.48	268.48
192	97	1029	266.85	266.85	266.85	266.85
193	95	1029	265.29	262.58	265.29	265.29
194	96	1030	264.44	261.65	264.44	264.44
195	94	1030	264.16	261.23	264.16	264.16
196	88	1029	268.69	268.69	268.69	268.69
197	86	1026	273.69	273.69	273.69	273.69
198	95	1026	272.7	272.7	272.7	272.7
199	94	1027	273.19	273.19	273.19	273.19
200	94	1026	273.49	273.49	273.49	273.49
201	95	1025	274.22	274.22	274.22	274.22
202	96	1025	275.3	275.3	275.3	275.3
203	98	1025	275.35	275.35	275.35	275.35
204	99	1025	276.61	276.61	276.61	276.61
205	100	1024	277.28	276.29	277.28	277.28
\.


--
-- Data for Name: WeatherTimestamps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeatherTimestamps" (id, cloudiness, "timestamp", "weatherDescriptionId", "weatherSummaryId", "weatherWindId", "weatherForecastId") FROM stdin;
1	83	1671030000	6	6	6	6
2	92	1671040800	7	7	7	6
3	100	1671051600	8	8	8	6
4	98	1671062400	9	9	9	6
5	83	1671073200	10	10	10	6
6	81	1671084000	11	11	11	6
7	100	1671094800	12	12	12	6
8	97	1671105600	13	13	13	6
9	31	1671116400	14	14	14	6
10	57	1671127200	15	15	15	6
11	76	1671138000	16	16	16	6
12	44	1671148800	17	17	17	6
13	46	1671159600	18	18	18	6
14	42	1671170400	19	19	19	6
15	8	1671181200	20	20	20	6
16	5	1671192000	21	21	21	6
17	0	1671202800	22	22	22	6
18	2	1671213600	23	23	23	6
19	5	1671224400	24	24	24	6
20	5	1671235200	25	25	25	6
21	4	1671246000	26	26	26	6
22	30	1671256800	27	27	27	6
23	47	1671267600	28	28	28	6
24	38	1671278400	29	29	29	6
25	86	1671289200	30	30	30	6
26	91	1671300000	31	31	31	6
27	63	1671310800	32	32	32	6
28	40	1671321600	33	33	33	6
29	47	1671332400	34	34	34	6
30	73	1671343200	35	35	35	6
31	100	1671354000	36	36	36	6
32	100	1671364800	37	37	37	6
33	100	1671375600	38	38	38	6
34	100	1671386400	39	39	39	6
35	100	1671397200	40	40	40	6
36	100	1671408000	41	41	41	6
37	100	1671418800	42	42	42	6
38	100	1671429600	43	43	43	6
39	100	1671440400	44	44	44	6
40	100	1671451200	45	45	45	6
41	3	1671030000	46	46	46	7
42	5	1671040800	47	47	47	7
43	9	1671051600	48	48	48	7
44	19	1671062400	49	49	49	7
45	41	1671073200	50	50	50	7
46	41	1671084000	51	51	51	7
47	15	1671094800	52	52	52	7
48	10	1671105600	53	53	53	7
49	7	1671116400	54	54	54	7
50	6	1671127200	55	55	55	7
51	5	1671138000	56	56	56	7
52	7	1671148800	57	57	57	7
53	22	1671159600	58	58	58	7
54	58	1671170400	59	59	59	7
55	86	1671181200	60	60	60	7
56	65	1671192000	61	61	61	7
57	28	1671202800	62	62	62	7
58	31	1671213600	63	63	63	7
59	23	1671224400	64	64	64	7
60	22	1671235200	65	65	65	7
61	35	1671246000	66	66	66	7
62	39	1671256800	67	67	67	7
63	29	1671267600	68	68	68	7
64	18	1671278400	69	69	69	7
65	7	1671289200	70	70	70	7
66	9	1671300000	71	71	71	7
67	33	1671310800	72	72	72	7
68	37	1671321600	73	73	73	7
69	42	1671332400	74	74	74	7
70	36	1671343200	75	75	75	7
71	9	1671354000	76	76	76	7
72	13	1671364800	77	77	77	7
73	16	1671375600	78	78	78	7
74	58	1671386400	79	79	79	7
75	100	1671397200	80	80	80	7
76	100	1671408000	81	81	81	7
77	100	1671418800	82	82	82	7
78	100	1671429600	83	83	83	7
79	100	1671440400	84	84	84	7
80	100	1671451200	85	85	85	7
81	83	1671030000	86	86	86	8
82	92	1671040800	87	87	87	8
83	100	1671051600	88	88	88	8
84	100	1671062400	89	89	89	8
85	100	1671073200	90	90	90	8
86	76	1671084000	91	91	91	8
87	100	1671094800	92	92	92	8
88	100	1671105600	93	93	93	8
89	100	1671116400	94	94	94	8
90	100	1671127200	95	95	95	8
91	60	1671138000	96	96	96	8
92	74	1671148800	97	97	97	8
93	76	1671159600	98	98	98	8
94	63	1671170400	99	99	99	8
95	21	1671181200	100	100	100	8
96	16	1671192000	101	101	101	8
97	5	1671202800	102	102	102	8
98	6	1671213600	103	103	103	8
99	4	1671224400	104	104	104	8
100	4	1671235200	105	105	105	8
101	81	1671246000	106	106	106	8
102	60	1671256800	107	107	107	8
103	63	1671267600	108	108	108	8
104	62	1671278400	109	109	109	8
105	98	1671289200	110	110	110	8
106	59	1671300000	111	111	111	8
107	34	1671310800	112	112	112	8
108	60	1671321600	113	113	113	8
109	100	1671332400	114	114	114	8
110	99	1671343200	115	115	115	8
111	73	1671354000	116	116	116	8
112	84	1671364800	117	117	117	8
113	95	1671375600	118	118	118	8
114	91	1671386400	119	119	119	8
115	79	1671397200	120	120	120	8
116	90	1671408000	121	121	121	8
117	12	1671418800	122	122	122	8
118	23	1671429600	123	123	123	8
119	46	1671440400	124	124	124	8
120	53	1671451200	125	125	125	8
121	99	1671030000	126	126	126	9
122	97	1671040800	127	127	127	9
123	97	1671051600	128	128	128	9
124	99	1671062400	129	129	129	9
125	87	1671073200	130	130	130	9
126	74	1671084000	131	131	131	9
127	100	1671094800	132	132	132	9
128	100	1671105600	133	133	133	9
129	100	1671116400	134	134	134	9
130	100	1671127200	135	135	135	9
131	100	1671138000	136	136	136	9
132	100	1671148800	137	137	137	9
133	77	1671159600	138	138	138	9
134	63	1671170400	139	139	139	9
135	100	1671181200	140	140	140	9
136	59	1671192000	141	141	141	9
137	63	1671202800	142	142	142	9
138	75	1671213600	143	143	143	9
139	100	1671224400	144	144	144	9
140	89	1671235200	145	145	145	9
141	21	1671246000	146	146	146	9
142	51	1671256800	147	147	147	9
143	98	1671267600	148	148	148	9
144	99	1671278400	149	149	149	9
145	99	1671289200	150	150	150	9
146	57	1671300000	151	151	151	9
147	0	1671310800	152	152	152	9
148	0	1671321600	153	153	153	9
149	0	1671332400	154	154	154	9
150	0	1671343200	155	155	155	9
151	0	1671354000	156	156	156	9
152	0	1671364800	157	157	157	9
153	0	1671375600	158	158	158	9
154	0	1671386400	159	159	159	9
155	11	1671397200	160	160	160	9
156	26	1671408000	161	161	161	9
157	56	1671418800	162	162	162	9
158	39	1671429600	163	163	163	9
159	11	1671440400	164	164	164	9
160	10	1671451200	165	165	165	9
161	100	1671030000	166	166	166	10
162	99	1671040800	167	167	167	10
163	100	1671051600	168	168	168	10
164	99	1671062400	169	169	169	10
165	92	1671073200	170	170	170	10
166	90	1671084000	171	171	171	10
167	100	1671094800	172	172	172	10
168	100	1671105600	173	173	173	10
169	100	1671116400	174	174	174	10
170	100	1671127200	175	175	175	10
171	100	1671138000	176	176	176	10
172	100	1671148800	177	177	177	10
173	100	1671159600	178	178	178	10
174	100	1671170400	179	179	179	10
175	100	1671181200	180	180	180	10
176	100	1671192000	181	181	181	10
177	100	1671202800	182	182	182	10
178	99	1671213600	183	183	183	10
179	82	1671224400	184	184	184	10
180	82	1671235200	185	185	185	10
181	91	1671246000	186	186	186	10
182	92	1671256800	187	187	187	10
183	90	1671267600	188	188	188	10
184	83	1671278400	189	189	189	10
185	87	1671289200	190	190	190	10
186	93	1671300000	191	191	191	10
187	100	1671310800	192	192	192	10
188	98	1671321600	193	193	193	10
189	63	1671332400	194	194	194	10
190	63	1671343200	195	195	195	10
191	73	1671354000	196	196	196	10
192	78	1671364800	197	197	197	10
193	100	1671375600	198	198	198	10
194	100	1671386400	199	199	199	10
195	100	1671397200	200	200	200	10
196	100	1671408000	201	201	201	10
197	100	1671418800	202	202	202	10
198	100	1671429600	203	203	203	10
199	100	1671440400	204	204	204	10
200	100	1671451200	205	205	205	10
\.


--
-- Data for Name: WeatherWinds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeatherWinds" (id, degrees, gust, speed) FROM stdin;
6	29	5.35	2.01
7	25	6.46	2.38
8	17	5.27	1.95
9	23	5.95	2.13
10	36	6.91	2.33
11	37	7.24	2.12
12	40	8.38	2.55
13	40	11.36	3.66
14	30	12.39	3.94
15	22	12.69	3.98
16	15	11.53	3.45
17	5	9.39	2.8
18	12	9.85	2.45
19	20	11.37	3.37
20	24	11.82	3.19
21	32	9.43	2.75
22	1	6.78	2.2
23	14	8.72	2.55
24	23	6.04	1.81
25	38	4.07	1.5
26	46	3.37	1.53
27	72	2.95	1.45
28	86	3.76	1.88
29	106	4.8	2.43
30	82	4.43	1.53
31	85	8.42	2.82
32	119	8.6	2.76
33	109	7.68	2.23
34	121	7.11	2.63
35	138	9.53	3
36	152	10.92	3.28
37	167	14.49	3.8
38	179	15.75	5.01
39	180	15.24	5.35
40	184	15.78	5.12
41	191	15.36	4.99
42	184	14.98	5.07
43	197	16.56	5.6
44	202	17.38	6.78
45	203	17.18	6.86
46	108	6.15	2.39
47	116	5.26	2.14
48	138	2.67	1.41
49	193	1.25	1.09
50	242	2.16	1.42
51	241	4.2	1.78
52	219	4.11	2.12
53	236	4.58	2.18
54	190	2.65	1.8
55	191	4.02	2.15
56	208	0.87	0.86
57	156	0.89	0.9
58	329	0.73	0.72
59	350	2.71	1.52
60	357	1.79	1.14
61	329	2.53	1.62
62	306	1.21	1.26
63	322	2.46	1.68
64	326	2.98	1.71
65	334	2.17	1.39
66	312	1.24	1.25
67	327	1.12	1.16
68	7	0.54	0.5
69	182	0.25	0.11
70	179	0.91	0.92
71	154	1.08	1.14
72	147	1.91	1.48
73	138	3.65	1.88
74	126	7.49	2.62
75	130	11.37	3.76
76	133	11.93	4.09
77	135	12.93	4.68
78	129	14.89	5.18
79	134	16.29	5.74
80	141	14.37	6.09
81	150	12.79	5.81
82	152	12.06	5.21
83	161	13.4	5.23
84	170	13.74	5.32
85	174	14.07	5.46
86	226	7.67	4.3
87	242	11.3	4.98
88	232	9.2	4.69
89	219	7.51	3.05
90	222	9.67	4.59
91	211	9.14	4.47
92	242	7.65	3.99
93	237	8.37	6.8
94	252	6.79	5.05
95	235	6.77	3.89
96	254	5.84	3.17
97	253	4.33	2.66
98	255	2.9	2.01
99	247	1.5	1.2
100	239	1.69	0.83
101	102	1.15	0.2
102	164	0.81	0.69
103	142	1	0.91
104	158	0.37	0.18
105	97	0.37	0.26
106	86	0.53	0.53
107	80	1.45	1.49
108	80	1.47	1.21
109	166	1.72	1.19
110	177	1.72	1.29
111	183	1.44	1.21
112	225	0.82	0.76
113	212	1.05	1.01
114	178	0.87	0.8
115	104	0.33	0.14
116	128	1.17	0.93
117	153	1.79	1.18
118	206	3.05	1.88
119	174	0.67	0.48
120	193	0.51	0.23
121	171	0.46	0.31
122	141	0.66	0.53
123	65	0.72	0.69
124	65	1.09	0.99
125	99	1.45	1.3
126	186	7.97	2.25
127	14	5.71	3.02
128	350	5.94	3.14
129	359	2.31	1.55
130	19	1.76	1.64
131	33	1.23	1.24
132	112	3.98	1.75
133	148	9.11	3.76
134	143	13.36	6.22
135	145	16.55	9.13
136	158	13.87	7.73
137	185	6.57	2.91
138	122	2.58	1.9
139	128	2.89	2.29
140	140	6.68	2.66
141	173	8.29	5.33
142	167	5.92	2.93
143	159	7.64	2.91
144	219	8.81	3.8
145	180	4.41	2.02
146	203	6.77	2.44
147	199	5.94	2.55
148	175	4.22	1.97
149	159	3.9	2.14
150	138	4.5	2.26
151	66	2.49	1.63
152	38	2.14	1.9
153	29	2.06	1.83
154	28	2.11	1.97
155	25	2.66	2.11
156	26	3.27	2.33
157	18	2.12	1.9
158	358	2.99	1.93
159	13	2.62	1.98
160	15	3.68	2.39
161	24	3.41	2.3
162	25	2.94	2.13
163	21	2.31	1.98
164	24	2.09	1.64
165	12	0.92	0.89
166	219	7.96	2.51
167	173	2.24	1.63
168	190	2.98	2.01
169	181	3.2	2.06
170	151	1.68	1.62
171	134	1.26	1
172	71	1.91	0.88
173	39	3.2	1.62
174	45	7.09	2.56
175	43	7.31	2.53
176	23	5.15	1.37
177	9	5.12	1.52
178	38	5.8	2.05
179	34	6.9	2.29
180	39	6.86	2.68
181	37	5.48	3.1
182	34	5.76	2.43
183	36	5.06	2
184	65	1.19	0.94
185	99	1.35	1.09
186	90	1.81	0.89
187	76	1.62	0.79
188	54	2.38	1.25
189	40	2.36	1.82
190	42	2.73	1.66
191	31	2.26	1.1
192	111	1.46	0.8
193	148	1.45	1.43
194	164	1.19	1.41
195	159	1.25	1.46
196	171	0.74	0.56
197	260	1.24	0.77
198	183	0.48	0.47
199	191	0.91	0.93
200	165	1.07	1.02
201	182	0.84	0.66
202	152	1.05	0.9
203	146	1.06	0.95
204	185	1.09	0.96
205	170	1.72	1.37
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1670957079509	cities1670957079509
3	1671020846343	weather1671020846343
4	1671021113545	weatherEnumm1671021113545
5	1671021258552	weatherEnumm1671021258552
\.


--
-- Name: Cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cities_id_seq"', 5, true);


--
-- Name: CityStats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CityStats_id_seq"', 5, true);


--
-- Name: Countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Countries_id_seq"', 5, true);


--
-- Name: WeatherDescriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeatherDescriptions_id_seq"', 205, true);


--
-- Name: WeatherForecasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeatherForecasts_id_seq"', 10, true);


--
-- Name: WeatherSummaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeatherSummaries_id_seq"', 205, true);


--
-- Name: WeatherTimestamps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeatherTimestamps_id_seq"', 200, true);


--
-- Name: WeatherWinds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeatherWinds_id_seq"', 205, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 5, true);


--
-- Name: Cities PK_21ae4232868104702703893428e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cities"
    ADD CONSTRAINT "PK_21ae4232868104702703893428e" PRIMARY KEY (id);


--
-- Name: Countries PK_5f9a9dcfcf9de1ea528e3ff0bb4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "PK_5f9a9dcfcf9de1ea528e3ff0bb4" PRIMARY KEY (id);


--
-- Name: WeatherWinds PK_83f3646b50bcb5f904dc608f290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherWinds"
    ADD CONSTRAINT "PK_83f3646b50bcb5f904dc608f290" PRIMARY KEY (id);


--
-- Name: WeatherDescriptions PK_8b1dd39acaac2dbde91fed9d51a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherDescriptions"
    ADD CONSTRAINT "PK_8b1dd39acaac2dbde91fed9d51a" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: WeatherTimestamps PK_a83647a7b26b0c9c67871b707f3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherTimestamps"
    ADD CONSTRAINT "PK_a83647a7b26b0c9c67871b707f3" PRIMARY KEY (id);


--
-- Name: CityStats PK_be91b077d692ee31bcd9c4a018f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CityStats"
    ADD CONSTRAINT "PK_be91b077d692ee31bcd9c4a018f" PRIMARY KEY (id);


--
-- Name: WeatherForecasts PK_d2f50db1d74dea72e62bb631716; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherForecasts"
    ADD CONSTRAINT "PK_d2f50db1d74dea72e62bb631716" PRIMARY KEY (id);


--
-- Name: WeatherSummaries PK_de14db847e89e30cce84c5a4172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherSummaries"
    ADD CONSTRAINT "PK_de14db847e89e30cce84c5a4172" PRIMARY KEY (id);


--
-- Name: Cities REL_32aa93f32441440388dc885dec; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cities"
    ADD CONSTRAINT "REL_32aa93f32441440388dc885dec" UNIQUE ("cityStatId");


--
-- Name: Cities FK_32aa93f32441440388dc885dec6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cities"
    ADD CONSTRAINT "FK_32aa93f32441440388dc885dec6" FOREIGN KEY ("cityStatId") REFERENCES public."CityStats"(id);


--
-- Name: WeatherTimestamps FK_6d5c64029d3bdfbca0e15d943d4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherTimestamps"
    ADD CONSTRAINT "FK_6d5c64029d3bdfbca0e15d943d4" FOREIGN KEY ("weatherForecastId") REFERENCES public."WeatherForecasts"(id);


--
-- Name: Cities FK_aaf3cedcb598c83309f22ffdb6b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cities"
    ADD CONSTRAINT "FK_aaf3cedcb598c83309f22ffdb6b" FOREIGN KEY ("countryId") REFERENCES public."Countries"(id);


--
-- Name: WeatherForecasts FK_f36336031910a56be7cf662421e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherForecasts"
    ADD CONSTRAINT "FK_f36336031910a56be7cf662421e" FOREIGN KEY ("cityId") REFERENCES public."Cities"(id);


--
-- PostgreSQL database dump complete
--

