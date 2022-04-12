--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: Accounts; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public."Accounts" (
    id bigint NOT NULL,
    login character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    third_name character varying(100),
    telephone integer,
    main_email character varying(254) NOT NULL,
    second_email character varying(254),
    departament character varying(100)
);


ALTER TABLE public."Accounts" OWNER TO webadmin;

--
-- Name: Accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public."Accounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Accounts_id_seq" OWNER TO webadmin;

--
-- Name: Accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public."Accounts_id_seq" OWNED BY public."Accounts".id;


--
-- Name: Installed; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public."Installed" (
    id bigint NOT NULL,
    license character varying(100) NOT NULL,
    cert boolean NOT NULL,
    cert_info text NOT NULL,
    software_id bigint NOT NULL,
    workstation_id bigint NOT NULL
);


ALTER TABLE public."Installed" OWNER TO webadmin;

--
-- Name: Installed_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public."Installed_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Installed_id_seq" OWNER TO webadmin;

--
-- Name: Installed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public."Installed_id_seq" OWNED BY public."Installed".id;


--
-- Name: Software; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public."Software" (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    version character varying(100) NOT NULL,
    free boolean NOT NULL,
    soft_info text NOT NULL
);


ALTER TABLE public."Software" OWNER TO webadmin;

--
-- Name: Software_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public."Software_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Software_id_seq" OWNER TO webadmin;

--
-- Name: Software_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public."Software_id_seq" OWNED BY public."Software".id;


--
-- Name: Workstations; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public."Workstations" (
    id bigint NOT NULL,
    hostname character varying(100) NOT NULL,
    cpu character varying(100) NOT NULL,
    ram character varying(100) NOT NULL,
    motherboard character varying(100) NOT NULL,
    storage character varying(100) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public."Workstations" OWNER TO webadmin;

--
-- Name: Workstations_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public."Workstations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Workstations_id_seq" OWNER TO webadmin;

--
-- Name: Workstations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public."Workstations_id_seq" OWNED BY public."Workstations".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO webadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO webadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO webadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO webadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO webadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO webadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO webadmin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO webadmin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO webadmin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO webadmin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO webadmin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO webadmin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: webadmin
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


ALTER TABLE public.django_admin_log OWNER TO webadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO webadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO webadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO webadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO webadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO webadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: webadmin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO webadmin;

--
-- Name: Accounts id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Accounts" ALTER COLUMN id SET DEFAULT nextval('public."Accounts_id_seq"'::regclass);


--
-- Name: Installed id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Installed" ALTER COLUMN id SET DEFAULT nextval('public."Installed_id_seq"'::regclass);


--
-- Name: Software id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Software" ALTER COLUMN id SET DEFAULT nextval('public."Software_id_seq"'::regclass);


--
-- Name: Workstations id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Workstations" ALTER COLUMN id SET DEFAULT nextval('public."Workstations_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: Accounts; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public."Accounts" (id, login, first_name, last_name, third_name, telephone, main_email, second_email, departament) FROM stdin;
1	eugene.lavrenko	Евгений	Лавренко	\N	\N	eugene.lavrenko@roninvest.ru	\N	\N
2	anastasia.koftun	Анастасия	Кофтун	\N	\N	anastasia.koftun@roninvest.ru	\N	\N
3	veronika.pinkina	Вероника	Пинкина	\N	\N	veronika.pinkina@roninvest.ru	\N	\N
\.


--
-- Data for Name: Installed; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public."Installed" (id, license, cert, cert_info, software_id, workstation_id) FROM stdin;
6	ключ ЭП	t	Срок действия 10.20.2023, токен подключен  в USB	2	10
7	123	f	123	1	10
9	321	f	1331312313	1	11
10	erwere	f	werwer	6	11
11	rgrgr	f	fgfgfg	2	11
12	3243142	f	342343124	2	12
\.


--
-- Data for Name: Software; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public."Software" (id, name, version, free, soft_info) FROM stdin;
2	7-Zip	2021-12-26	t	7-Zip — свободный файловый архиватор с высокой степенью сжатия данных. Поддерживает несколько алгоритмов сжатия и множество форматов данных, включая собственный формат 7z c высокоэффективным алгоритмом сжатия LZMA.
6	Налогоплательщик ЮЛ	4.75	t	Оказание помощи при подготовке налоговой, бухгалтерской отчетности и тд и тп
1	Google Chrome	100.0.4896.100500	t	Google Chrome — браузер, разрабатываемый компанией Google на основе свободного браузера Chromium и движка Blink.
\.


--
-- Data for Name: Workstations; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public."Workstations" (id, hostname, cpu, ram, motherboard, storage, user_id) FROM stdin;
12	luch2	i3	8	Asus	250	2
10	IP	i3	8	Asrock	200	1
11	elavrenko	i5	8	Asus	100	1
13	vpinkina3	i5	8	Asus	250	3
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: webadmin
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
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add workstation	7	add_workstation
26	Can change workstation	7	change_workstation
27	Can delete workstation	7	delete_workstation
28	Can view workstation	7	view_workstation
29	Can add account	8	add_account
30	Can change account	8	change_account
31	Can delete account	8	delete_account
32	Can view account	8	view_account
33	Can add installed	9	add_installed
34	Can change installed	9	change_installed
35	Can delete installed	9	delete_installed
36	Can view installed	9	view_installed
37	Can add software	10	add_software
38	Can change software	10	change_software
39	Can delete software	10	delete_software
40	Can view software	10	view_software
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$oa83czDoVmcI8EJL0H0mQz$06x0gXTs4ic8QHAURxmEEWleolU6BYWBbpj8Ab1SeTM=	2022-04-11 12:03:35.640382+03	t	adm_ron			eugene.lavrenko@roninvest.ru	t	t	2022-04-08 13:21:11.487631+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-04-08 13:27:44.948717+03	1	eugene.lavrenko	1	[{"added": {}}]	8	1
2	2022-04-08 13:46:05.795105+03	2	anastasia.koftun	1	[{"added": {}}]	8	1
3	2022-04-08 13:53:34.507761+03	1	Google Chrom	1	[{"added": {}}]	10	1
4	2022-04-08 13:53:47.91325+03	1	Google Chrome	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	10	1
5	2022-04-08 13:55:24.504807+03	2	7-Zip	1	[{"added": {}}]	10	1
6	2022-04-08 14:49:00.242869+03	3	2	1	[{"added": {}}]	10	1
7	2022-04-08 15:48:30.062981+03	9	3	1	[{"added": {}}]	7	1
8	2022-04-11 09:40:58.485948+03	9	3	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u043d\\u043e\\u0435 \\u043e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435"]}}]	7	1
9	2022-04-11 10:26:32.340839+03	4	3	1	[{"added": {}}]	10	1
10	2022-04-11 10:26:36.159157+03	5	4	1	[{"added": {}}]	10	1
11	2022-04-11 10:27:09.181461+03	10	IP	1	[{"added": {}}]	7	1
12	2022-04-11 10:34:55.939962+03	5	2 IP	1	[{"added": {}}]	9	1
13	2022-04-11 10:36:29.948034+03	6	7-Zip IP	1	[{"added": {}}]	9	1
14	2022-04-11 10:40:23.191145+03	5	2 2 IP	3		9	1
15	2022-04-11 10:40:41.64441+03	5	4 4	3		10	1
16	2022-04-11 10:40:41.652589+03	4	3 3	3		10	1
17	2022-04-11 10:40:41.665593+03	3	2 2	3		10	1
18	2022-04-11 10:42:49.892468+03	6	Налогоплательщик ЮЛ 4.75	1	[{"added": {}}]	10	1
19	2022-04-11 10:42:59.618256+03	10	IP	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u043d\\u043e\\u0435 \\u043e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435"]}}]	7	1
20	2022-04-11 10:44:58.644793+03	7	Google Chrome 100.0.4896.60 IP	1	[{"added": {}}]	9	1
21	2022-04-11 10:45:04.79395+03	8	Google Chrome 100.0.4896.60 3	1	[{"added": {}}]	9	1
22	2022-04-11 10:45:38.138546+03	1	Google Chrome 100.0.4896.100500	2	[{"changed": {"fields": ["\\u0412\\u0435\\u0440\\u0441\\u0438\\u044f"]}}]	10	1
23	2022-04-11 11:11:43.31773+03	8	Google Chrome 100.0.4896.100500 3	3		9	1
24	2022-04-11 11:11:55.141929+03	9	3	3		7	1
25	2022-04-11 11:12:47.41852+03	11	elavrenko	1	[{"added": {}}]	7	1
26	2022-04-11 11:13:44.246306+03	12	luch2	1	[{"added": {}}]	7	1
27	2022-04-11 11:13:52.849772+03	10	IP	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044c"]}}]	7	1
28	2022-04-11 11:14:30.638285+03	9	Google Chrome 100.0.4896.100500 elavrenko	1	[{"added": {}}]	9	1
29	2022-04-11 11:27:33.542443+03	10	Налогоплательщик ЮЛ 4.75 elavrenko	1	[{"added": {}}]	9	1
30	2022-04-11 11:27:45.077378+03	11	7-Zip 2021-12-26 elavrenko	1	[{"added": {}}]	9	1
31	2022-04-11 11:40:05.814899+03	11	elavrenko	2	[{"changed": {"fields": ["Software"]}}]	7	1
32	2022-04-11 11:42:56.146903+03	12	7-Zip 2021-12-26 luch2	1	[{"added": {}}]	9	1
33	2022-04-11 11:50:09.495876+03	3	veronika.pinkina	1	[{"added": {}}]	8	1
34	2022-04-11 11:50:14.337532+03	13	vpinkina3	1	[{"added": {}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	inventory	workstation
8	inventory	account
9	inventory	installed
10	inventory	software
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-04-08 10:33:32.465328+03
2	auth	0001_initial	2022-04-08 10:33:33.090527+03
3	admin	0001_initial	2022-04-08 10:33:33.181883+03
4	admin	0002_logentry_remove_auto_add	2022-04-08 10:33:33.196802+03
5	admin	0003_logentry_add_action_flag_choices	2022-04-08 10:33:33.212846+03
6	contenttypes	0002_remove_content_type_name	2022-04-08 10:33:33.236615+03
7	auth	0002_alter_permission_name_max_length	2022-04-08 10:33:33.245957+03
8	auth	0003_alter_user_email_max_length	2022-04-08 10:33:33.266731+03
9	auth	0004_alter_user_username_opts	2022-04-08 10:33:33.280521+03
10	auth	0005_alter_user_last_login_null	2022-04-08 10:33:33.296339+03
11	auth	0006_require_contenttypes_0002	2022-04-08 10:33:33.307046+03
12	auth	0007_alter_validators_add_error_messages	2022-04-08 10:33:33.322694+03
13	auth	0008_alter_user_username_max_length	2022-04-08 10:33:33.364486+03
14	auth	0009_alter_user_last_name_max_length	2022-04-08 10:33:33.382091+03
15	auth	0010_alter_group_name_max_length	2022-04-08 10:33:33.39995+03
16	auth	0011_update_proxy_permissions	2022-04-08 10:33:33.421385+03
17	auth	0012_alter_user_first_name_max_length	2022-04-08 10:33:33.444042+03
18	sessions	0001_initial	2022-04-08 10:33:33.64045+03
19	inventory	0001_initial	2022-04-08 12:52:13.827382+03
20	inventory	0002_software_installed	2022-04-08 13:16:55.663104+03
21	inventory	0003_alter_account_options_alter_installed_options_and_more	2022-04-08 15:47:45.853731+03
22	inventory	0004_installed_workstation	2022-04-11 10:25:48.997916+03
23	inventory	0005_remove_workstation_software_workstation_software	2022-04-11 11:38:24.44063+03
24	inventory	0006_remove_workstation_software	2022-04-11 11:43:40.211206+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ve16cyd0u3vcxaiuo7gzo0t8iridcfdd	.eJxVjDkOwjAUBe_iGll2Em-U9Jwh-ptJANlSnFSIu0OkFNC-mXkvNcK2TuPWZBlnVmdl1el3Q6CHlB3wHcqtaqplXWbUu6IP2vS1sjwvh_t3MEGbvnWXh2x7ZHHigiSwGZk89BGjAXaOyaahR5MTmeQ8mI4C2pQoRhAJXr0_CGs4mw:1nclkR:WbYAqsVA40PcQkeER-BvwCgb8akcrLBN2jibC_T2ajQ	2022-04-22 13:21:47.264988+03
q6l3depdni3wnfuai8r5d3ulgkqns5l6	.eJxVjDkOwjAUBe_iGll2Em-U9Jwh-ptJANlSnFSIu0OkFNC-mXkvNcK2TuPWZBlnVmdl1el3Q6CHlB3wHcqtaqplXWbUu6IP2vS1sjwvh_t3MEGbvnWXh2x7ZHHigiSwGZk89BGjAXaOyaahR5MTmeQ8mI4C2pQoRhAJXr0_CGs4mw:1ndnha:baW_XVAcAJXvB9UZP1NboFNM4GmQ0ffGfiWiAZW3oxo	2022-04-25 09:39:06.835396+03
8alzdi1unrarj3upjfe72iqrln8xn7ip	.eJxVjDkOwjAUBe_iGll2Em-U9Jwh-ptJANlSnFSIu0OkFNC-mXkvNcK2TuPWZBlnVmdl1el3Q6CHlB3wHcqtaqplXWbUu6IP2vS1sjwvh_t3MEGbvnWXh2x7ZHHigiSwGZk89BGjAXaOyaahR5MTmeQ8mI4C2pQoRhAJXr0_CGs4mw:1ndoR2:puI15JKdqA7ZhO3Jlin72D3tRAfeCEfdIynWInMdkOw	2022-04-25 10:26:04.232412+03
6e95onstuyo3yrdyg9c4p16l2pgzwvls	.eJxVjDkOwjAUBe_iGll2Em-U9Jwh-ptJANlSnFSIu0OkFNC-mXkvNcK2TuPWZBlnVmdl1el3Q6CHlB3wHcqtaqplXWbUu6IP2vS1sjwvh_t3MEGbvnWXh2x7ZHHigiSwGZk89BGjAXaOyaahR5MTmeQ8mI4C2pQoRhAJXr0_CGs4mw:1ndpoX:8cdEIlN3qxgEKHsB_Wt2tOk0zgjyDL5B54-wLs_kkTY	2022-04-25 11:54:25.209641+03
asf7m2ytotdiiovl14zqgitnjx2gsl54	.eJxVjDkOwjAUBe_iGll2Em-U9Jwh-ptJANlSnFSIu0OkFNC-mXkvNcK2TuPWZBlnVmdl1el3Q6CHlB3wHcqtaqplXWbUu6IP2vS1sjwvh_t3MEGbvnWXh2x7ZHHigiSwGZk89BGjAXaOyaahR5MTmeQ8mI4C2pQoRhAJXr0_CGs4mw:1ndpxP:BqQWwfuTKI2_-DV-ftqbPKdlS8cBjoaLxu1mieohx90	2022-04-25 12:03:35.648982+03
\.


--
-- Name: Accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public."Accounts_id_seq"', 3, true);


--
-- Name: Installed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public."Installed_id_seq"', 12, true);


--
-- Name: Software_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public."Software_id_seq"', 6, true);


--
-- Name: Workstations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public."Workstations_id_seq"', 13, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 34, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: Accounts Accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (id);


--
-- Name: Installed Installed_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Installed"
    ADD CONSTRAINT "Installed_pkey" PRIMARY KEY (id);


--
-- Name: Software Software_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Software"
    ADD CONSTRAINT "Software_pkey" PRIMARY KEY (id);


--
-- Name: Workstations Workstations_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Workstations"
    ADD CONSTRAINT "Workstations_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: Installed_software_id_b538fc65; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX "Installed_software_id_b538fc65" ON public."Installed" USING btree (software_id);


--
-- Name: Installed_workstation_id_f40207ac; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX "Installed_workstation_id_f40207ac" ON public."Installed" USING btree (workstation_id);


--
-- Name: Workstations_user_id_6961af92; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX "Workstations_user_id_6961af92" ON public."Workstations" USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: webadmin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: Installed Installed_software_id_b538fc65_fk_Software_id; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Installed"
    ADD CONSTRAINT "Installed_software_id_b538fc65_fk_Software_id" FOREIGN KEY (software_id) REFERENCES public."Software"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Installed Installed_workstation_id_f40207ac_fk_Workstations_id; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Installed"
    ADD CONSTRAINT "Installed_workstation_id_f40207ac_fk_Workstations_id" FOREIGN KEY (workstation_id) REFERENCES public."Workstations"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Workstations Workstations_user_id_6961af92_fk_Accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public."Workstations"
    ADD CONSTRAINT "Workstations_user_id_6961af92_fk_Accounts_id" FOREIGN KEY (user_id) REFERENCES public."Accounts"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

