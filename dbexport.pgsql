--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO kremerdesign;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO kremerdesign;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO kremerdesign;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO kremerdesign;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO kremerdesign;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO kremerdesign;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO kremerdesign;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO kremerdesign;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO kremerdesign;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO kremerdesign;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO kremerdesign;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO kremerdesign;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_author; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE blog_author (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    email character varying(75)
);


ALTER TABLE public.blog_author OWNER TO kremerdesign;

--
-- Name: blog_author_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE blog_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_author_id_seq OWNER TO kremerdesign;

--
-- Name: blog_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE blog_author_id_seq OWNED BY blog_author.id;


--
-- Name: blog_blogpost; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE blog_blogpost (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    body text NOT NULL,
    author_id integer NOT NULL,
    pub_date timestamp with time zone NOT NULL
);


ALTER TABLE public.blog_blogpost OWNER TO kremerdesign;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE blog_blogpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogpost_id_seq OWNER TO kremerdesign;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE blog_blogpost_id_seq OWNED BY blog_blogpost.id;


--
-- Name: blog_comment; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE blog_comment (
    id integer NOT NULL,
    post_id integer NOT NULL,
    author_id integer NOT NULL,
    comment_body text NOT NULL,
    importance integer NOT NULL
);


ALTER TABLE public.blog_comment OWNER TO kremerdesign;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE blog_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_comment_id_seq OWNER TO kremerdesign;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE blog_comment_id_seq OWNED BY blog_comment.id;


--
-- Name: blog_tag; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE blog_tag (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.blog_tag OWNER TO kremerdesign;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE blog_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_tag_id_seq OWNER TO kremerdesign;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE blog_tag_id_seq OWNED BY blog_tag.id;


--
-- Name: blog_tag_posts; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE blog_tag_posts (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    blogpost_id integer NOT NULL
);


ALTER TABLE public.blog_tag_posts OWNER TO kremerdesign;

--
-- Name: blog_tag_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE blog_tag_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_tag_posts_id_seq OWNER TO kremerdesign;

--
-- Name: blog_tag_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE blog_tag_posts_id_seq OWNED BY blog_tag_posts.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO kremerdesign;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO kremerdesign;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO kremerdesign;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO kremerdesign;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO kremerdesign;

--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO kremerdesign;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: kremerdesign
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO kremerdesign;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kremerdesign
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY blog_author ALTER COLUMN id SET DEFAULT nextval('blog_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY blog_blogpost ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY blog_comment ALTER COLUMN id SET DEFAULT nextval('blog_comment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY blog_tag ALTER COLUMN id SET DEFAULT nextval('blog_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY blog_tag_posts ALTER COLUMN id SET DEFAULT nextval('blog_tag_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add migration history	7	add_migrationhistory
20	Can change migration history	7	change_migrationhistory
21	Can delete migration history	7	delete_migrationhistory
22	Can add author	8	add_author
23	Can change author	8	change_author
24	Can delete author	8	delete_author
25	Can add blog post	9	add_blogpost
26	Can change blog post	9	change_blogpost
27	Can delete blog post	9	delete_blogpost
28	Can add tag	10	add_tag
29	Can change tag	10	change_tag
30	Can delete tag	10	delete_tag
31	Can add user	11	add_user
32	Can change user	11	change_user
33	Can delete user	11	delete_user
34	Can add comment	12	add_comment
35	Can change comment	12	change_comment
36	Can delete comment	12	delete_comment
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('auth_permission_id_seq', 36, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$dNUIPuHX97yH$1kkXmvvOPHKCXIJNrCY77NTwAizxJGo0YSZnwzzSVKg=	2014-07-02 11:11:15.217065-07	t	kremerdesign			kremerdesign@gmail.com	t	t	2014-07-02 11:11:15.217065-07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_author; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY blog_author (id, name, email) FROM stdin;
1	Ben Kremer	\N
2	John Colborne	\N
3	Hello world!	\N
4	Ben	hello@hello.com
5	Thomas Storrow Brown	
6	Ferdinand-Alphonse Oklowski	francis@gmail.com
7	Ben TESTS	kremerdesign@gmail.com
\.


--
-- Name: blog_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('blog_author_id_seq', 7, true);


--
-- Data for Name: blog_blogpost; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY blog_blogpost (id, title, body, author_id, pub_date) FROM stdin;
2	Hello	Hello world	1	2014-07-01 17:00:00-07
\.


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('blog_blogpost_id_seq', 2, true);


--
-- Data for Name: blog_comment; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY blog_comment (id, post_id, author_id, comment_body, importance) FROM stdin;
1	2	1	Hello	5
2	2	1	borange	5
3	2	1	borange	10
4	2	1	fizz buzz	1
5	2	1	fizz buzz	1
6	2	1	fizz	1
7	2	2	az	1
\.


--
-- Name: blog_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('blog_comment_id_seq', 7, true);


--
-- Data for Name: blog_tag; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY blog_tag (id, name) FROM stdin;
\.


--
-- Name: blog_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('blog_tag_id_seq', 1, false);


--
-- Data for Name: blog_tag_posts; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY blog_tag_posts (id, tag_id, blogpost_id) FROM stdin;
\.


--
-- Name: blog_tag_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('blog_tag_posts_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	migration history	south	migrationhistory
8	author	blog	author
9	blog post	blog	blogpost
10	tag	blog	tag
11	user	blog	user
12	comment	blog	comment
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('django_content_type_id_seq', 12, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: kremerdesign
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	blog	0001_initial	2014-07-02 11:11:48.949385-07
2	blog	0002_auto__add_author__add_tag__add_user__add_blogpost__add_comment	2014-07-02 11:20:01.614898-07
3	blog	0003_auto__del_user__del_field_comment_user__add_field_comment_author	2014-07-02 11:35:02.273228-07
4	blog	0004_auto__del_field_comment_body__add_field_comment_comment_body	2014-07-02 11:37:04.665704-07
5	blog	0005_auto__add_field_author_email	2014-07-02 15:42:40.273591-07
6	blog	0006_auto__add_field_comment_importance	2014-07-02 16:06:24.950346-07
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kremerdesign
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 6, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_author_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY blog_author
    ADD CONSTRAINT blog_author_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_pkey PRIMARY KEY (id);


--
-- Name: blog_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY blog_comment
    ADD CONSTRAINT blog_comment_pkey PRIMARY KEY (id);


--
-- Name: blog_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY blog_tag
    ADD CONSTRAINT blog_tag_pkey PRIMARY KEY (id);


--
-- Name: blog_tag_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY blog_tag_posts
    ADD CONSTRAINT blog_tag_posts_pkey PRIMARY KEY (id);


--
-- Name: blog_tag_posts_tag_id_4ab0a176d254840_uniq; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY blog_tag_posts
    ADD CONSTRAINT blog_tag_posts_tag_id_4ab0a176d254840_uniq UNIQUE (tag_id, blogpost_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: kremerdesign; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blogpost_author_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX blog_blogpost_author_id ON blog_blogpost USING btree (author_id);


--
-- Name: blog_comment_author_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX blog_comment_author_id ON blog_comment USING btree (author_id);


--
-- Name: blog_comment_post_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX blog_comment_post_id ON blog_comment USING btree (post_id);


--
-- Name: blog_tag_posts_blogpost_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX blog_tag_posts_blogpost_id ON blog_tag_posts USING btree (blogpost_id);


--
-- Name: blog_tag_posts_tag_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX blog_tag_posts_tag_id ON blog_tag_posts USING btree (tag_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: kremerdesign; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_4484cbda; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY blog_comment
    ADD CONSTRAINT author_id_refs_id_4484cbda FOREIGN KEY (author_id) REFERENCES blog_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_c85f3c6d; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT author_id_refs_id_c85f3c6d FOREIGN KEY (author_id) REFERENCES blog_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blogpost_id_refs_id_a50867e6; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY blog_tag_posts
    ADD CONSTRAINT blogpost_id_refs_id_a50867e6 FOREIGN KEY (blogpost_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_id_refs_id_9228f2c3; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY blog_comment
    ADD CONSTRAINT post_id_refs_id_9228f2c3 FOREIGN KEY (post_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_id_refs_id_20c60120; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY blog_tag_posts
    ADD CONSTRAINT tag_id_refs_id_20c60120 FOREIGN KEY (tag_id) REFERENCES blog_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: kremerdesign
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: kremerdesign
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM kremerdesign;
GRANT ALL ON SCHEMA public TO kremerdesign;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

