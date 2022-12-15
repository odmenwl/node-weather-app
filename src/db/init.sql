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
-- Name: weather_app_db; Type: DATABASE; Schema: -; Owner: postgres
--
\connect weather_app_db

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
    description text,
    sunrise integer NOT NULL,
    sunset integer NOT NULL,
    "weatherDataSource" public."WeatherDataSourceEnum" DEFAULT 'OPEN_WEATHER_MAP'::public."WeatherDataSourceEnum" NOT NULL,
    date timestamp without time zone NOT NULL
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
3	Rome	41.894741	12.4839	5	3
4	Bern	46.94809	7.44744	3	4
5	Madrid	40.4165	-3.70256	4	5
\.


--
-- Data for Name: CityStats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CityStats" (id, "numberOfView") FROM stdin;
2	0
3	0
4	0
5	0
1	8
\.


--
-- Data for Name: Countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Countries" (id, name, code) FROM stdin;
1	France	FR
2	German	DE
3	Switzerland	CH
4	Espana	ES
5	Italia	IT
\.


--
-- Data for Name: WeatherDescriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeatherDescriptions" (id, text, type) FROM stdin;
1	scattered clouds	Clouds
2	broken clouds	Clouds
3	broken clouds	Clouds
4	overcast clouds	Clouds
5	overcast clouds	Clouds
6	broken clouds	Clouds
7	broken clouds	Clouds
8	overcast clouds	Clouds
9	overcast clouds	Clouds
10	overcast clouds	Clouds
11	broken clouds	Clouds
12	few clouds	Clouds
13	clear sky	Clear
14	few clouds	Clouds
15	few clouds	Clouds
16	few clouds	Clouds
17	few clouds	Clouds
18	clear sky	Clear
19	clear sky	Clear
20	scattered clouds	Clouds
21	broken clouds	Clouds
22	broken clouds	Clouds
23	broken clouds	Clouds
24	few clouds	Clouds
25	scattered clouds	Clouds
26	overcast clouds	Clouds
27	overcast clouds	Clouds
28	overcast clouds	Clouds
29	light rain	Rain
30	moderate rain	Rain
31	moderate rain	Rain
32	light rain	Rain
33	light rain	Rain
34	light rain	Rain
35	light rain	Rain
36	light rain	Rain
37	overcast clouds	Clouds
38	light rain	Rain
39	overcast clouds	Clouds
40	overcast clouds	Clouds
41	broken clouds	Clouds
42	broken clouds	Clouds
43	broken clouds	Clouds
44	overcast clouds	Clouds
45	overcast clouds	Clouds
46	overcast clouds	Clouds
47	light rain	Rain
48	light rain	Rain
49	heavy intensity rain	Rain
50	light rain	Rain
51	broken clouds	Clouds
52	light rain	Rain
53	light rain	Rain
54	light rain	Rain
55	light rain	Rain
56	light rain	Rain
57	light rain	Rain
58	light rain	Rain
59	light rain	Rain
60	light rain	Rain
61	broken clouds	Clouds
62	light rain	Rain
63	scattered clouds	Clouds
64	scattered clouds	Clouds
65	scattered clouds	Clouds
66	few clouds	Clouds
67	clear sky	Clear
68	clear sky	Clear
69	clear sky	Clear
70	clear sky	Clear
71	clear sky	Clear
72	scattered clouds	Clouds
73	scattered clouds	Clouds
74	clear sky	Clear
75	few clouds	Clouds
76	few clouds	Clouds
77	clear sky	Clear
78	clear sky	Clear
79	few clouds	Clouds
80	clear sky	Clear
81	light rain	Rain
82	light rain	Rain
83	overcast clouds	Clouds
84	overcast clouds	Clouds
85	overcast clouds	Clouds
86	overcast clouds	Clouds
87	light rain	Rain
88	light snow	Snow
89	snow	Snow
90	snow	Snow
91	snow	Snow
92	snow	Snow
93	light snow	Snow
94	light snow	Snow
95	light snow	Snow
96	broken clouds	Clouds
97	broken clouds	Clouds
98	broken clouds	Clouds
99	broken clouds	Clouds
100	scattered clouds	Clouds
101	scattered clouds	Clouds
102	broken clouds	Clouds
103	overcast clouds	Clouds
104	overcast clouds	Clouds
105	broken clouds	Clouds
106	broken clouds	Clouds
107	broken clouds	Clouds
108	overcast clouds	Clouds
109	overcast clouds	Clouds
110	overcast clouds	Clouds
111	overcast clouds	Clouds
112	overcast clouds	Clouds
113	overcast clouds	Clouds
114	overcast clouds	Clouds
115	overcast clouds	Clouds
116	overcast clouds	Clouds
117	overcast clouds	Clouds
118	overcast clouds	Clouds
119	overcast clouds	Clouds
120	broken clouds	Clouds
121	light rain	Rain
122	overcast clouds	Clouds
123	broken clouds	Clouds
124	overcast clouds	Clouds
125	light rain	Rain
126	light rain	Rain
127	overcast clouds	Clouds
128	broken clouds	Clouds
129	scattered clouds	Clouds
130	few clouds	Clouds
131	scattered clouds	Clouds
132	scattered clouds	Clouds
133	broken clouds	Clouds
134	broken clouds	Clouds
135	overcast clouds	Clouds
136	overcast clouds	Clouds
137	overcast clouds	Clouds
138	overcast clouds	Clouds
139	overcast clouds	Clouds
140	overcast clouds	Clouds
141	overcast clouds	Clouds
142	overcast clouds	Clouds
143	broken clouds	Clouds
144	broken clouds	Clouds
145	broken clouds	Clouds
146	broken clouds	Clouds
147	broken clouds	Clouds
148	overcast clouds	Clouds
149	overcast clouds	Clouds
150	overcast clouds	Clouds
151	overcast clouds	Clouds
152	overcast clouds	Clouds
153	overcast clouds	Clouds
154	overcast clouds	Clouds
155	overcast clouds	Clouds
156	overcast clouds	Clouds
157	overcast clouds	Clouds
158	overcast clouds	Clouds
159	overcast clouds	Clouds
160	overcast clouds	Clouds
161	scattered clouds	Clouds
162	scattered clouds	Clouds
163	scattered clouds	Clouds
164	few clouds	Clouds
165	clear sky	Clear
166	clear sky	Clear
167	clear sky	Clear
168	clear sky	Clear
169	few clouds	Clouds
170	few clouds	Clouds
171	few clouds	Clouds
172	scattered clouds	Clouds
173	broken clouds	Clouds
174	broken clouds	Clouds
175	broken clouds	Clouds
176	scattered clouds	Clouds
177	scattered clouds	Clouds
178	scattered clouds	Clouds
179	scattered clouds	Clouds
180	broken clouds	Clouds
181	broken clouds	Clouds
182	few clouds	Clouds
183	few clouds	Clouds
184	scattered clouds	Clouds
185	scattered clouds	Clouds
186	scattered clouds	Clouds
187	scattered clouds	Clouds
188	few clouds	Clouds
189	few clouds	Clouds
190	broken clouds	Clouds
191	overcast clouds	Clouds
192	overcast clouds	Clouds
193	overcast clouds	Clouds
194	overcast clouds	Clouds
195	overcast clouds	Clouds
196	overcast clouds	Clouds
197	light rain	Rain
198	light rain	Rain
199	light rain	Rain
200	light rain	Rain
\.


--
-- Data for Name: WeatherForecasts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeatherForecasts" (id, "cityId", description, sunrise, sunset, "weatherDataSource", date) FROM stdin;
1	1	\N	1671003393	1671033239	OPEN_WEATHER_MAP	2022-12-15 00:00:00
2	1	\N	1671003393	1671033239	OPEN_WEATHER_MAP	2022-12-16 00:00:00
3	1	\N	1671003393	1671033239	OPEN_WEATHER_MAP	2022-12-17 00:00:00
4	1	\N	1671003393	1671033239	OPEN_WEATHER_MAP	2022-12-18 00:00:00
5	1	\N	1671003393	1671033239	OPEN_WEATHER_MAP	2022-12-19 00:00:00
6	2	\N	1670999397	1671032369	OPEN_WEATHER_MAP	2022-12-15 00:00:00
7	2	\N	1670999397	1671032369	OPEN_WEATHER_MAP	2022-12-16 00:00:00
8	2	\N	1670999397	1671032369	OPEN_WEATHER_MAP	2022-12-17 00:00:00
9	2	\N	1670999397	1671032369	OPEN_WEATHER_MAP	2022-12-18 00:00:00
10	2	\N	1670999397	1671032369	OPEN_WEATHER_MAP	2022-12-19 00:00:00
11	3	\N	1671001693	1671032491	OPEN_WEATHER_MAP	2022-12-15 00:00:00
12	3	\N	1671001693	1671032491	OPEN_WEATHER_MAP	2022-12-16 00:00:00
13	3	\N	1671001693	1671032491	OPEN_WEATHER_MAP	2022-12-17 00:00:00
14	3	\N	1671001693	1671032491	OPEN_WEATHER_MAP	2022-12-18 00:00:00
15	3	\N	1671001693	1671032491	OPEN_WEATHER_MAP	2022-12-19 00:00:00
16	4	\N	1671003004	1671036534	OPEN_WEATHER_MAP	2022-12-15 00:00:00
17	4	\N	1671003004	1671036534	OPEN_WEATHER_MAP	2022-12-16 00:00:00
18	4	\N	1671003004	1671036534	OPEN_WEATHER_MAP	2022-12-17 00:00:00
19	4	\N	1671003004	1671036534	OPEN_WEATHER_MAP	2022-12-18 00:00:00
20	4	\N	1671003004	1671036534	OPEN_WEATHER_MAP	2022-12-19 00:00:00
21	5	\N	1671001795	1671029526	OPEN_WEATHER_MAP	2022-12-15 00:00:00
22	5	\N	1671001795	1671029526	OPEN_WEATHER_MAP	2022-12-16 00:00:00
23	5	\N	1671001795	1671029526	OPEN_WEATHER_MAP	2022-12-17 00:00:00
24	5	\N	1671001795	1671029526	OPEN_WEATHER_MAP	2022-12-18 00:00:00
25	5	\N	1671001795	1671029526	OPEN_WEATHER_MAP	2022-12-19 00:00:00
\.


--
-- Data for Name: WeatherSummaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeatherSummaries" (id, humidity, pressure, temperature, "temperatureFeelsLike", "temperatureMax", "temperatureMin") FROM stdin;
1	77	1005	0.1	-2.12	0.1	-1.41
2	77	1006	-1.18	-4.28	-1.18	-2.2
3	73	1007	-2.38	-6.04	-2.38	-2.38
4	67	1008	-1.44	-5.06	-1.44	-1.44
5	62	1008	0.8	-3.23	0.8	0.8
6	70	1007	1.2	-3.03	1.2	1.2
7	76	1009	-0.09	-4.5	-0.09	-0.09
8	83	1011	-0.75	-4.8	-0.75	-0.75
9	86	1012	-1.09	-4.8	-1.09	-1.09
10	90	1013	-1.28	-4.52	-1.28	-1.28
11	89	1014	-1.04	-4.41	-1.04	-1.04
12	88	1017	-0.29	-4.12	-0.29	-0.29
13	77	1018	1.18	-2.45	1.18	1.18
14	83	1019	0.02	-2.42	0.02	0.02
15	82	1021	-1.58	-4.09	-1.58	-1.58
16	78	1022	-2.02	-4.33	-2.02	-2.02
17	78	1023	-2.35	-4.6	-2.35	-2.35
18	78	1024	-2.73	-4.89	-2.73	-2.73
19	79	1024	-3.29	-3.29	-3.29	-3.29
20	80	1026	-2.71	-5.43	-2.71	-2.71
21	75	1025	-0.26	-3.31	-0.26	-0.26
22	79	1024	-0.49	-3.57	-0.49	-0.49
23	82	1024	-1.93	-6.11	-1.93	-1.93
24	76	1024	-2.59	-6.32	-2.59	-2.59
25	73	1023	-3.11	-7.03	-3.11	-3.11
26	72	1021	-2.99	-7.36	-2.99	-2.99
27	70	1019	-1.42	-5.68	-1.42	-1.42
28	65	1018	0.5	-3.29	0.5	0.5
29	82	1017	1.93	-2.02	1.93	1.93
30	93	1016	3.05	-1.46	3.05	3.05
31	95	1015	3.45	-0.74	3.45	3.45
32	95	1015	5.53	1.87	5.53	5.53
33	93	1015	7.57	4.26	7.57	7.57
34	94	1014	8.19	5.03	8.19	8.19
35	94	1013	8.52	5.6	8.52	8.52
36	89	1013	9.41	6.62	9.41	9.41
37	82	1012	11.18	10.49	11.18	11.18
38	80	1011	11.72	11.04	11.72	11.72
39	74	1011	12.61	11.86	12.61	12.61
40	77	1011	12.34	11.64	12.34	12.34
41	80	1004	9.38	8.58	9.75	9.38
42	84	1006	9.24	8.83	9.26	9.24
43	86	1008	9.96	9.63	9.96	9.96
44	81	1009	13.13	12.61	13.13	13.13
45	76	1007	15.25	14.81	15.25	15.25
46	79	1006	15.07	14.7	15.07	15.07
47	82	1004	15.32	15.05	15.32	15.32
48	88	1005	15.52	15.43	15.52	15.52
49	94	1006	14.56	14.53	14.56	14.56
50	90	1006	12.53	12.19	12.53	12.53
51	87	1007	12.36	11.92	12.36	12.36
52	83	1008	14.49	14.16	14.49	14.49
53	74	1008	16.9	16.58	16.9	16.9
54	80	1008	15.15	14.81	15.15	15.15
55	86	1009	13.52	13.17	13.52	13.52
56	92	1011	12.99	12.75	12.99	12.99
57	93	1011	13.15	12.95	13.15	13.15
58	94	1012	11.94	11.64	11.94	11.94
59	94	1014	11.35	11	11.35	11.35
60	79	1016	13.84	13.34	13.84	13.84
61	68	1016	14.78	14.09	14.78	14.78
62	75	1017	13.68	13.06	13.68	13.68
63	84	1020	11.74	11.16	11.74	11.74
64	83	1021	11.79	11.19	11.79	11.79
65	83	1023	11.1	10.43	11.1	11.1
66	84	1024	9.92	9.31	9.92	9.92
67	86	1026	9.22	8.28	9.22	9.22
68	75	1028	12.06	11.28	12.06	12.06
69	61	1027	15.18	14.35	15.18	15.18
70	69	1028	14.02	13.28	14.02	14.02
71	81	1029	11.39	10.7	11.39	11.39
72	85	1030	10.18	9.47	10.18	10.18
73	86	1030	9.28	8.32	9.28	9.28
74	86	1030	8.64	7.57	8.64	8.64
75	85	1030	8.14	7.36	8.14	8.14
76	72	1031	11.2	10.26	11.2	11.2
77	61	1030	14.23	13.3	14.23	14.23
78	68	1029	13.27	12.43	13.27	13.27
79	79	1029	10.86	10.06	10.86	10.86
80	84	1029	9.77	9.32	9.77	9.77
81	97	1002	3.41	1.63	3.44	3.41
82	97	1003	3.54	2.47	3.62	3.54
83	98	1004	2.71	2.71	2.71	2.71
84	97	1005	3.46	2.35	3.46	3.46
85	98	1004	4.91	3.14	4.91	4.91
86	99	1002	3.56	1.19	3.56	3.56
87	98	1002	2.48	0.38	2.48	2.48
88	99	1004	1.78	-0.18	1.78	1.78
89	99	1004	1.18	-1.08	1.18	1.18
90	99	1006	0.7	-1.02	0.7	0.7
91	99	1008	0.04	-2.16	0.04	0.04
92	98	1011	-0.14	-2.97	-0.14	-0.14
93	95	1012	0.43	-2.79	0.43	0.43
94	97	1014	-0.09	-3.03	-0.09	-0.09
95	98	1018	-3.36	-6.41	-3.36	-3.36
96	99	1021	-6.57	-6.57	-6.57	-6.57
97	99	1023	-8.18	-8.18	-8.18	-8.18
98	97	1025	-9.34	-9.34	-9.34	-9.34
99	97	1026	-9.7	-9.7	-9.7	-9.7
100	93	1026	-5.79	-5.79	-5.79	-5.79
101	91	1025	-1.67	-4.67	-1.67	-1.67
102	95	1025	-2.68	-5.29	-2.68	-2.68
103	97	1028	-5.42	-5.42	-5.42	-5.42
104	97	1029	-7.74	-7.74	-7.74	-7.74
105	95	1030	-9.09	-11.91	-9.09	-9.09
106	95	1031	-9.46	-12.48	-9.46	-9.46
107	95	1030	-9.59	-9.59	-9.59	-9.59
108	88	1029	-4.13	-4.13	-4.13	-4.13
109	87	1026	0.36	0.36	0.36	0.36
110	95	1026	0.02	0.02	0.02	0.02
111	94	1027	-2.31	-4.19	-2.31	-2.31
112	93	1027	-2.4	-4.54	-2.4	-2.4
113	93	1027	-0.86	-2.46	-0.86	-0.86
114	92	1025	2.2	2.2	2.2	2.2
115	96	1024	2.64	2.64	2.64	2.64
116	97	1024	3.52	3.52	3.52	3.52
117	99	1023	5.82	5.82	5.82	5.82
118	100	1021	4.43	3.34	4.43	4.43
119	98	1023	3.03	1.46	3.03	3.03
120	98	1023	2.72	2.72	2.72	2.72
121	93	999	9.89	7.36	9.89	9.05
122	90	999	9.38	6.6	9.38	8.91
123	88	1000	7.71	4.73	7.71	7.71
124	86	1001	8.52	6.03	8.52	8.52
125	84	1001	8.9	6.46	8.9	8.9
126	76	1001	9.7	7.3	9.7	9.7
127	85	1002	8.27	6.13	8.27	8.27
128	88	1005	7.45	5.35	7.45	7.45
129	86	1006	6.89	4.91	6.89	6.89
130	88	1007	6.25	4.47	6.25	6.25
131	93	1008	5.47	4.29	5.47	5.47
132	91	1010	5.9	5.9	5.9	5.9
133	79	1011	8.18	8.18	8.18	8.18
134	73	1010	9.18	9.18	9.18	9.18
135	78	1012	8.49	7.3	8.49	8.49
136	77	1014	8.25	7.05	8.25	8.25
137	78	1014	7.89	6.86	7.89	7.89
138	77	1015	8.07	7.33	8.07	8.07
139	78	1016	8.08	7.44	8.08	8.08
140	78	1017	8.4	7.94	8.4	8.4
141	73	1018	9.82	9.82	9.82	9.82
142	72	1018	10.55	9.54	10.55	10.55
143	83	1020	8.83	7.8	8.83	8.83
144	90	1022	7.7	6.64	7.7	7.7
145	93	1023	7.03	7.03	7.03	7.03
146	94	1024	6.53	6.53	6.53	6.53
147	96	1024	6.08	6.08	6.08	6.08
148	90	1026	7.4	7.4	7.4	7.4
149	74	1025	9.81	9.45	9.81	9.81
150	65	1024	11.11	9.97	11.11	11.11
151	73	1024	9.16	9.16	9.16	9.16
152	75	1025	8.41	8.41	8.41	8.41
153	77	1024	7.65	7.65	7.65	7.65
154	76	1024	7.13	7.13	7.13	7.13
155	78	1024	6.46	6.46	6.46	6.46
156	73	1024	7.37	6.8	7.37	7.37
157	58	1023	10.38	8.99	10.38	10.38
158	55	1021	11.6	10.25	11.6	11.6
159	61	1021	9.74	9.74	9.74	9.74
160	64	1021	9.26	9.26	9.26	9.26
161	88	997	-6.99	-6.99	-6.99	-7.12
162	92	1002	-7.28	-10.1	-7.28	-7.46
163	93	1007	-7.59	-10.93	-7.59	-7.59
164	76	1009	-5.87	-9.72	-5.87	-5.87
165	67	1009	-2.5	-5.79	-2.5	-2.5
166	84	1009	-4.57	-7.76	-4.57	-4.57
167	86	1010	-5.27	-9.14	-5.27	-5.27
168	89	1011	-6.04	-6.04	-6.04	-6.04
169	90	1012	-6.54	-6.54	-6.54	-6.54
170	90	1012	-6.76	-6.76	-6.76	-6.76
171	92	1013	-7.1	-7.1	-7.1	-7.1
172	82	1015	-4.96	-4.96	-4.96	-4.96
173	85	1015	-2.56	-4.94	-2.56	-2.56
174	98	1017	-4.52	-7.02	-4.52	-4.52
175	98	1019	-5.25	-8.03	-5.25	-5.25
176	96	1021	-5.86	-8.78	-5.86	-5.86
177	96	1022	-6.23	-9.14	-6.23	-6.23
178	96	1024	-6.61	-9.63	-6.61	-6.61
179	96	1026	-6.87	-9.55	-6.87	-6.87
180	90	1028	-4.94	-7.16	-4.94	-4.94
181	82	1029	-2.38	-4.29	-2.38	-2.38
182	95	1031	-4.93	-4.93	-4.93	-4.93
183	97	1032	-5.99	-5.99	-5.99	-5.99
184	97	1033	-6.43	-6.43	-6.43	-6.43
185	96	1034	-6.7	-9.71	-6.7	-6.7
186	95	1034	-6.46	-10.85	-6.46	-6.46
187	94	1033	-5.88	-11.05	-5.88	-5.88
188	90	1033	-4.26	-9.94	-4.26	-4.26
189	74	1030	-1.63	-7.16	-1.63	-1.63
190	71	1028	-2.26	-8.23	-2.26	-2.26
191	66	1026	-2.39	-8.63	-2.39	-2.39
192	70	1024	-2.13	-8.34	-2.13	-2.13
193	75	1023	-2.12	-7.62	-2.12	-2.12
194	72	1021	-1.76	-7.15	-1.76	-1.76
195	75	1020	0.43	-4.48	0.43	0.43
196	85	1019	1.35	-3.41	1.35	1.35
197	90	1018	2.57	-1.8	2.57	2.57
198	93	1016	2.98	-1.16	2.98	2.98
199	91	1015	3.83	-0.44	3.83	3.83
200	80	1014	4.54	0.54	4.54	4.54
\.


--
-- Data for Name: WeatherTimestamps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeatherTimestamps" (id, cloudiness, "timestamp", "weatherDescriptionId", "weatherSummaryId", "weatherWindId", "weatherForecastId") FROM stdin;
1	33	1671062400	1	1	1	1
2	59	1671073200	2	2	2	1
3	73	1671084000	3	3	3	1
4	97	1671094800	4	4	4	1
5	98	1671105600	5	5	5	1
6	57	1671116400	6	6	6	1
7	65	1671127200	7	7	7	1
8	99	1671138000	8	8	8	1
9	100	1671148800	9	9	9	2
10	95	1671159600	10	10	10	2
11	82	1671170400	11	11	11	2
12	12	1671181200	12	12	12	2
13	9	1671192000	13	13	13	2
14	11	1671202800	14	14	14	2
15	11	1671213600	15	15	15	2
16	22	1671224400	16	16	16	2
17	17	1671235200	17	17	17	3
18	4	1671246000	18	18	18	3
19	9	1671256800	19	19	19	3
20	27	1671267600	20	20	20	3
21	55	1671278400	21	21	21	3
22	82	1671289200	22	22	22	3
23	84	1671300000	23	23	23	3
24	13	1671310800	24	24	24	3
25	25	1671321600	25	25	25	4
26	100	1671332400	26	26	26	4
27	100	1671343200	27	27	27	4
28	100	1671354000	28	28	28	4
29	100	1671364800	29	29	29	4
30	100	1671375600	30	30	30	4
31	100	1671386400	31	31	31	4
32	100	1671397200	32	32	32	4
33	100	1671408000	33	33	33	5
34	100	1671418800	34	34	34	5
35	100	1671429600	35	35	35	5
36	100	1671440400	36	36	36	5
37	100	1671451200	37	37	37	5
38	100	1671462000	38	38	38	5
39	100	1671472800	39	39	39	5
40	100	1671483600	40	40	40	5
41	58	1671062400	41	41	41	6
42	80	1671073200	42	42	42	6
43	82	1671084000	43	43	43	6
44	99	1671094800	44	44	44	6
45	100	1671105600	45	45	45	6
46	100	1671116400	46	46	46	6
47	100	1671127200	47	47	47	6
48	100	1671138000	48	48	48	6
49	100	1671148800	49	49	49	7
50	73	1671159600	50	50	50	7
51	70	1671170400	51	51	51	7
52	93	1671181200	52	52	52	7
53	64	1671192000	53	53	53	7
54	62	1671202800	54	54	54	7
55	71	1671213600	55	55	55	7
56	87	1671224400	56	56	56	7
57	93	1671235200	57	57	57	8
58	71	1671246000	58	58	58	8
59	48	1671256800	59	59	59	8
60	53	1671267600	60	60	60	8
61	71	1671278400	61	61	61	8
62	77	1671289200	62	62	62	8
63	42	1671300000	63	63	63	8
64	41	1671310800	64	64	64	8
65	45	1671321600	65	65	65	9
66	17	1671332400	66	66	66	9
67	8	1671343200	67	67	67	9
68	1	1671354000	68	68	68	9
69	0	1671364800	69	69	69	9
70	0	1671375600	70	70	70	9
71	1	1671386400	71	71	71	9
72	30	1671397200	72	72	72	9
73	33	1671408000	73	73	73	10
74	2	1671418800	74	74	74	10
75	12	1671429600	75	75	75	10
76	12	1671440400	76	76	76	10
77	9	1671451200	77	77	77	10
78	7	1671462000	78	78	78	10
79	24	1671472800	79	79	79	10
80	9	1671483600	80	80	80	10
81	81	1671062400	81	81	81	11
82	89	1671073200	82	82	82	11
83	95	1671084000	83	83	83	11
84	99	1671094800	84	84	84	11
85	100	1671105600	85	85	85	11
86	100	1671116400	86	86	86	11
87	100	1671127200	87	87	87	11
88	100	1671138000	88	88	88	11
89	100	1671148800	89	89	89	12
90	100	1671159600	90	90	90	12
91	100	1671170400	91	91	91	12
92	100	1671181200	92	92	92	12
93	100	1671192000	93	93	93	12
94	100	1671202800	94	94	94	12
95	96	1671213600	95	95	95	12
96	72	1671224400	96	96	96	12
97	75	1671235200	97	97	97	13
98	84	1671246000	98	98	98	13
99	70	1671256800	99	99	99	13
100	50	1671267600	100	100	100	13
101	47	1671278400	101	101	101	13
102	82	1671289200	102	102	102	13
103	90	1671300000	103	103	103	13
104	96	1671310800	104	104	104	13
105	83	1671321600	105	105	105	14
106	63	1671332400	106	106	106	14
107	66	1671343200	107	107	107	14
108	97	1671354000	108	108	108	14
109	98	1671364800	109	109	109	14
110	100	1671375600	110	110	110	14
111	97	1671386400	111	111	111	14
112	97	1671397200	112	112	112	14
113	97	1671408000	113	113	113	15
114	92	1671418800	114	114	114	15
115	95	1671429600	115	115	115	15
116	98	1671440400	116	116	116	15
117	96	1671451200	117	117	117	15
118	99	1671462000	118	118	118	15
119	94	1671472800	119	119	119	15
120	78	1671483600	120	120	120	15
121	82	1671062400	121	121	121	16
122	92	1671073200	122	122	122	16
123	77	1671084000	123	123	123	16
124	100	1671094800	124	124	124	16
125	100	1671105600	125	125	125	16
126	100	1671116400	126	126	126	16
127	99	1671127200	127	127	127	16
128	70	1671138000	128	128	128	16
129	48	1671148800	129	129	129	17
130	18	1671159600	130	130	130	17
131	25	1671170400	131	131	131	17
132	45	1671181200	132	132	132	17
133	51	1671192000	133	133	133	17
134	82	1671202800	134	134	134	17
135	91	1671213600	135	135	135	17
136	99	1671224400	136	136	136	17
137	92	1671235200	137	137	137	18
138	96	1671246000	138	138	138	18
139	98	1671256800	139	139	139	18
140	100	1671267600	140	140	140	18
141	98	1671278400	141	141	141	18
142	89	1671289200	142	142	142	18
143	69	1671300000	143	143	143	18
144	60	1671310800	144	144	144	18
145	77	1671321600	145	145	145	19
146	79	1671332400	146	146	146	19
147	79	1671343200	147	147	147	19
148	92	1671354000	148	148	148	19
149	95	1671364800	149	149	149	19
150	100	1671375600	150	150	150	19
151	100	1671386400	151	151	151	19
152	99	1671397200	152	152	152	19
153	100	1671408000	153	153	153	20
154	100	1671418800	154	154	154	20
155	100	1671429600	155	155	155	20
156	100	1671440400	156	156	156	20
157	100	1671451200	157	157	157	20
158	100	1671462000	158	158	158	20
159	100	1671472800	159	159	159	20
160	100	1671483600	160	160	160	20
161	30	1671062400	161	161	161	21
162	31	1671073200	162	162	162	21
163	36	1671084000	163	163	163	21
164	17	1671094800	164	164	164	21
165	10	1671105600	165	165	165	21
166	4	1671116400	166	166	166	21
167	5	1671127200	167	167	167	21
168	8	1671138000	168	168	168	21
169	14	1671148800	169	169	169	22
170	23	1671159600	170	170	170	22
171	22	1671170400	171	171	171	22
172	46	1671181200	172	172	172	22
173	55	1671192000	173	173	173	22
174	73	1671202800	174	174	174	22
175	59	1671213600	175	175	175	22
176	30	1671224400	176	176	176	22
177	39	1671235200	177	177	177	23
178	34	1671246000	178	178	178	23
179	40	1671256800	179	179	179	23
180	70	1671267600	180	180	180	23
181	58	1671278400	181	181	181	23
182	21	1671289200	182	182	182	23
183	15	1671300000	183	183	183	23
184	32	1671310800	184	184	184	23
185	35	1671321600	185	185	185	24
186	33	1671332400	186	186	186	24
187	28	1671343200	187	187	187	24
188	13	1671354000	188	188	188	24
189	13	1671364800	189	189	189	24
190	82	1671375600	190	190	190	24
191	91	1671386400	191	191	191	24
192	100	1671397200	192	192	192	24
193	100	1671408000	193	193	193	25
194	100	1671418800	194	194	194	25
195	100	1671429600	195	195	195	25
196	100	1671440400	196	196	196	25
197	100	1671451200	197	197	197	25
198	100	1671462000	198	198	198	25
199	100	1671472800	199	199	199	25
200	100	1671483600	200	200	200	25
\.


--
-- Data for Name: WeatherWinds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeatherWinds" (id, degrees, gust, speed) FROM stdin;
1	29	5.38	1.83
2	34	6.41	2.37
3	39	8.19	2.68
4	39	9.17	2.82
5	31	10.93	3.9
6	33	13.23	4.35
7	32	13.7	4.16
8	19	11.66	3.47
9	4	10.05	2.99
10	358	8.17	2.48
11	6	10.44	2.65
12	19	11.19	3.31
13	28	9.34	3.46
14	32	5.84	1.99
15	8	5.84	1.85
16	32	5	1.67
17	46	4.24	1.6
18	61	3.67	1.51
19	79	2.81	1.29
20	86	4.1	1.87
21	95	5.47	2.48
22	85	7.71	2.47
23	98	10.39	3.32
24	107	8.85	2.71
25	115	9.84	2.8
26	126	9.89	3.28
27	154	11.02	3.55
28	166	12.73	3.48
29	178	16.95	4.17
30	178	17.16	5.73
31	178	16.43	5.27
32	185	16.74	5.28
33	196	16.26	5.73
34	190	16.47	5.77
35	188	16.46	5.34
36	186	17.1	5.64
37	199	18.27	6.81
38	195	16.46	6.63
39	197	17.32	6.56
40	193	16.49	5.66
41	14	2.7	1.87
42	19	1.54	1.46
43	72	1.47	1.47
44	125	2.59	1.31
45	139	10.68	4.5
46	145	13.72	6.99
47	141	15.81	7.83
48	161	14.44	7.83
49	239	10.26	5.34
50	132	2.66	1.84
51	139	5.04	2.81
52	148	9.9	4.14
53	178	7.98	5.43
54	161	7.63	3.73
55	151	6.91	3.02
56	165	5.39	2.57
57	148	6.65	2.63
58	152	2.94	1.61
59	172	2.08	1.58
60	208	4.16	2.14
61	196	4.59	3.4
62	164	4.58	2.48
63	119	3.1	1.78
64	81	3.04	1.4
65	50	2.35	1.63
66	30	1.95	1.76
67	22	2.4	2.01
68	31	2.32	1.83
69	5	1.16	1.36
70	1	1.84	1.25
71	7	1.8	1.8
72	27	2.37	1.88
73	25	2.6	2.04
74	19	2.62	2.04
75	29	1.76	1.65
76	32	1.69	1.36
77	338	1.09	0.85
78	310	0.96	0.51
79	353	1.24	1.25
80	19	1.54	1.56
81	187	2.65	1.9
82	128	1.6	1.37
83	104	2.02	0.88
84	74	2.76	1.39
85	38	3.75	2.12
86	41	6.14	2.5
87	33	6.22	2.05
88	45	5.2	1.83
89	34	5.42	2
90	51	4.78	1.54
91	27	5.71	1.81
92	34	6.09	2.3
93	36	4.93	2.79
94	36	5.81	2.41
95	36	5.38	2.03
96	59	2.73	1.26
97	85	1.88	1.07
98	95	1.8	1.09
99	96	1.88	1.03
100	52	2.94	1.32
101	32	3.09	2.21
102	39	3.34	1.8
103	52	2.32	0.96
104	123	1.45	0.69
105	148	1.38	1.4
106	158	1.28	1.47
107	154	1.14	1.06
108	216	1.05	0.85
109	258	1.83	1.05
110	248	0.77	0.58
111	159	1.34	1.39
112	162	1.45	1.53
113	156	1.33	1.34
114	161	1.17	1.06
115	162	1.25	1.12
116	150	1.28	1.16
117	200	1.05	0.8
118	231	1.63	1.47
119	168	2.23	1.68
120	165	1.12	1.16
121	225	11.57	5.25
122	228	11.07	5.59
123	222	8.99	4.98
124	230	8.17	4.33
125	240	7.36	4.42
126	256	6.56	4.78
127	243	6.36	3.52
128	249	5.88	3.16
129	245	5.25	2.81
130	240	3.77	2.39
131	235	2.37	1.66
132	224	1.45	0.88
133	180	0.91	0.76
134	99	0.97	1.04
135	67	2.56	2.16
136	43	2.76	2.12
137	49	2.36	1.86
138	58	2.18	1.61
139	66	1.91	1.52
140	37	1.68	1.4
141	52	0.76	1.09
142	245	2.63	1.72
143	224	3.04	2.03
144	248	2.93	1.86
145	221	1.4	1.31
146	236	1.3	1.19
147	186	0.85	0.7
148	122	1.26	0.77
149	152	2.31	1.48
150	186	2.32	1.29
151	41	0.89	0.42
152	60	1.19	0.97
153	70	1.11	0.96
154	79	1.27	1.13
155	69	1.36	1.3
156	72	1.79	1.38
157	143	2.25	1.49
158	226	1.33	0.58
159	34	1.39	0.36
160	163	1.24	1.01
161	193	0.94	0.95
162	233	2.38	1.52
163	225	4.27	1.78
164	215	4.79	2.3
165	222	4.73	2.33
166	185	4.17	1.99
167	182	4.9	2.4
168	176	1.07	1.03
169	163	0.63	0.65
170	167	0.55	0.43
171	349	0.83	0.84
172	322	1.15	0.86
173	301	2.54	1.66
174	299	2.26	1.56
175	314	2.78	1.66
176	313	3	1.69
177	301	3.33	1.65
178	295	2.65	1.68
179	299	2.27	1.48
180	283	1.97	1.38
181	255	1.81	1.4
182	249	1.03	1.05
183	185	0.95	0.99
184	168	1.26	1.28
185	145	2.36	1.67
186	130	7.42	2.64
187	125	10.91	3.49
188	133	12.64	4.56
189	135	14.15	5.35
190	134	15.8	5.84
191	143	15.32	6.28
192	149	14.36	6.36
193	156	12.32	5.09
194	158	12.72	5.06
195	172	14.42	5.18
196	172	13.63	5.34
197	183	13.49	5.19
198	177	12.52	4.94
199	179	15.42	5.66
200	193	15.1	5.47
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1670957079509	cities1670957079509
2	1671020846343	weather1671020846343
3	1671021113545	weatherEnumm1671021113545
4	1671021258552	weatherEnumm1671021258552
5	1671050011103	updateForecastTable1671050011103
6	1671053189066	updateForecastTable1671053189066
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

SELECT pg_catalog.setval('public."WeatherDescriptions_id_seq"', 200, true);


--
-- Name: WeatherForecasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeatherForecasts_id_seq"', 25, true);


--
-- Name: WeatherSummaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeatherSummaries_id_seq"', 200, true);


--
-- Name: WeatherTimestamps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeatherTimestamps_id_seq"', 200, true);


--
-- Name: WeatherWinds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeatherWinds_id_seq"', 200, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 6, true);


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
-- Name: Countries UQ_4071037968b1866139daaafb530; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "UQ_4071037968b1866139daaafb530" UNIQUE (code);


--
-- Name: WeatherForecasts WeatherForecasts_cityId_date_weatherDataSource_unique_constrain; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherForecasts"
    ADD CONSTRAINT "WeatherForecasts_cityId_date_weatherDataSource_unique_constrain" UNIQUE ("cityId", date, "weatherDataSource");


--
-- Name: WeatherTimestamps WeatherTimestamps_timestamp_weatherForecastId_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeatherTimestamps"
    ADD CONSTRAINT "WeatherTimestamps_timestamp_weatherForecastId_constraint" UNIQUE ("timestamp", "weatherForecastId");


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

