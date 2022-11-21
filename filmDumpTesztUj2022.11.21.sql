--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: genre_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_sequence OWNER TO postgres;

--
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie (
    id bigint NOT NULL,
    release_year smallint NOT NULL,
    title character varying(255),
    director_id bigint,
    writer_id bigint
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- Name: movie_actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_actors (
    movie_id bigint NOT NULL,
    actors_id bigint NOT NULL
);


ALTER TABLE public.movie_actors OWNER TO postgres;

--
-- Name: movie_app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_app_user (
    id bigint NOT NULL,
    email character varying(255),
    forename character varying(255),
    hashed_pass character varying(255),
    surname character varying(255),
    user_name character varying(255),
    username character varying(255)
);


ALTER TABLE public.movie_app_user OWNER TO postgres;

--
-- Name: movie_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_genre (
    movie_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


ALTER TABLE public.movie_genre OWNER TO postgres;

--
-- Name: movie_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_id_sequence OWNER TO postgres;

--
-- Name: quote; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quote (
    id integer NOT NULL,
    movie_id bigint,
    text character varying(255)
);


ALTER TABLE public.quote OWNER TO postgres;

--
-- Name: quote_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quote_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quote_id_sequence OWNER TO postgres;

--
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating (
    id bigint NOT NULL,
    movie_id bigint,
    rating_data smallint NOT NULL,
    user_id bigint
);


ALTER TABLE public.rating OWNER TO postgres;

--
-- Name: rating_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rating_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_id_sequence OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id bigint NOT NULL,
    name character varying(255),
    role_id bigint
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_sequence OWNER TO postgres;

--
-- Name: staff_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_role (
    id bigint NOT NULL,
    role character varying(255)
);


ALTER TABLE public.staff_role OWNER TO postgres;

--
-- Name: staff_role_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_role_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_role_sequence OWNER TO postgres;

--
-- Name: user_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_sequence OWNER TO postgres;

--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id, name) FROM stdin;
1	action
2	romance
3	sci-fi
4	fantasy
5	animation
6	drama
7	Comedy
8	Documentary
10	Thriller
9	Horror
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie (id, release_year, title, director_id, writer_id) FROM stdin;
1	1999	The Matrix	1	2
2	2003	The Matrix Reloaded	1	2
3	2003	The Matrix Revolutions	1	2
4	1980	Apocalypse Now	4	5
5	2014	Interstellar	8	9
6	1977	Star Wars: Episode IV - A New Hope	11	12
7	1972	THe Godfather	4	14
19	1999	Fight Club	16	17
8	1981	Raiders of the Lost Ark	19	20
9	1954	Seven Samurai	22	23
10	2000	In the Mood for Love	25	26
11	2007	There Will Be Blood	28	29
12	1982	Blade Runner	31	32
13	2015	Inside Out	33	34
14	1982	The Thing	36	37
15	1988	Die Hard	39	40
16	1995	Toy Story	42	43
17	2014	Whiplash	45	46
18	1991	The Silence of the Lambs	48	49
20	2042	Teszt film	\N	\N
21	1987	Predator	39	58
22	1987	Predator	39	58
\.


--
-- Data for Name: movie_actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_actors (movie_id, actors_id) FROM stdin;
4	6
2	7
3	7
5	10
6	13
7	15
19	18
8	21
9	24
10	27
11	30
12	21
13	35
14	38
15	41
16	44
17	47
18	50
1	7
1	54
1	55
1	56
1	57
21	59
\.


--
-- Data for Name: movie_app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_app_user (id, email, forename, hashed_pass, surname, user_name, username) FROM stdin;
1	admin@filmapp.com	Cringe	n298fh3128qhfa	Elek	admin0	\N
\.


--
-- Data for Name: movie_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_genre (movie_id, genre_id) FROM stdin;
1	1
2	1
3	1
5	3
6	3
7	1
4	1
19	1
8	1
9	1
10	2
11	1
12	3
13	5
14	3
15	1
16	5
17	6
18	6
20	4
22	1
21	1
\.


--
-- Data for Name: quote; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quote (id, movie_id, text) FROM stdin;
1	1	Let me tell you why you’re here. You are here because you know something. What you know, you can’t explain. But you feel it.
2	1	You take the red pill - you stay in wonderland, and I show you how deep the rabbit hole goes.
3	5	We used to look up at the sky and wonder at our place in the stars. Now we just look down, and worry about our place in the dirt.
4	5	Mankind was born on Earth. It was never meant to die here.
5	7	“I’m gonna make him an offer he can’t refuse.” —Don Vito Corleone
6	7	“I’m gonna make him an offer he can’t refuse.” —Don Vito Corleone
7	19	"The things you own end up owning you." —Fight Club
8	19	The first rule of Fight Club is: You do not talk about Fight Club. The second rule of Fight Club is: YOU DO NOT. TALK. ABOUT FIGHT CLUB!
9	6	"You can’t win, but there are alternatives to fighting." - Obi-Wan Kenobi
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rating (id, movie_id, rating_data, user_id) FROM stdin;
1	1	5	1
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, name, role_id) FROM stdin;
1	The Wachowskis	2
2	The Wachowskis	1
3	Francis Ford Coppola	3
4	Francis Ford Coppola	2
5	Michael Herr	1
6	Martin Sheen	3
7	Keanu Reeves	3
8	Christopher Nolan	2
9	Jonathan Nolan	1
10	Matthew McConaughey	3
11	George Lucas	2
12	George Lucas	1
13	Mark Hamill	3
14	Robert Towne	1
15	Al Pacino	3
16	David Fincher	2
17	Chuck Palahniuk	1
18	Brad Pitt	3
19	Steven Spielberg	2
20	Lawrence Kasdan	1
21	Harrison Ford	3
22	Kuroszava Akira	2
23	Hasimoto Sinobu	1
24	Mifune Tosiró	3
25	Wong Kar-Wai	2
26	Wong Kar-Wai	1
27	Maggie Cheung	3
28	Paul Thomas Anderson	2
29	Paul Thomas Anderson	1
30	Daniel Day-Lewis	3
31	Ridley Scott	2
32	David Peoples	1
33	Pete Docter	2
34	Pete Docter	1
35	Phyllis Smith	3
36	John Carpenter	2
37	Bill Lancaster	1
38	Kurt Russell	3
39	John McTiernan	2
40	Jeb Stuart	1
41	Bruce Willis	3
42	John Lasseter	2
43	Andrew Stanton	1
44	Tom Hanks	3
45	Damien Chazelle	2
46	Damien Chazelle	1
47	Miles Teller	3
48	Jonathan Demme	2
49	Ted Tally	1
50	Anthony Hopkins	3
51	Keanu Reeves,avsagftsa	3
52	Asd man	3
53	Asd man2	3
54	Laurence Fishburne	3
55	Carrie-Anne Moss	3
56	Joe Pantoliano	3
57	Hugo Weaving	3
59	Arnold Schwarzenegger	3
58	John McTiernan	1
\.


--
-- Data for Name: staff_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_role (id, role) FROM stdin;
1	Writer
2	Director
3	Actor
\.


--
-- Name: genre_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_id_sequence', 1, false);


--
-- Name: movie_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_id_sequence', 32, true);


--
-- Name: quote_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quote_id_sequence', 9, true);


--
-- Name: rating_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rating_id_sequence', 1, true);


--
-- Name: staff_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_sequence', 59, true);


--
-- Name: staff_role_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_role_sequence', 1, false);


--
-- Name: user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_sequence', 1, true);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: movie_app_user movie_app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_app_user
    ADD CONSTRAINT movie_app_user_pkey PRIMARY KEY (id);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- Name: quote quote_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote
    ADD CONSTRAINT quote_pkey PRIMARY KEY (id);


--
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- Name: staff_role staff_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_role
    ADD CONSTRAINT staff_role_pkey PRIMARY KEY (id);


--
-- Name: staff fk7e0so0xme9uu0udtu5r8gdieq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT fk7e0so0xme9uu0udtu5r8gdieq FOREIGN KEY (role_id) REFERENCES public.staff_role(id);


--
-- Name: movie_genre fk86p3roa187k12avqfl28klp1q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT fk86p3roa187k12avqfl28klp1q FOREIGN KEY (genre_id) REFERENCES public.genre(id);


--
-- Name: movie_actors fkbl9u9vbte4jm32iecxyx9sk4v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actors
    ADD CONSTRAINT fkbl9u9vbte4jm32iecxyx9sk4v FOREIGN KEY (actors_id) REFERENCES public.staff(id);


--
-- Name: movie_actors fkbsto8yef4btokhveihmkg8876; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actors
    ADD CONSTRAINT fkbsto8yef4btokhveihmkg8876 FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- Name: movie fkdkn92hsu3upaq2bxf8bvyrv0l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT fkdkn92hsu3upaq2bxf8bvyrv0l FOREIGN KEY (director_id) REFERENCES public.staff(id);


--
-- Name: movie fkgs1nl3m7ys4uxxmkm2r3nbuhc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT fkgs1nl3m7ys4uxxmkm2r3nbuhc FOREIGN KEY (writer_id) REFERENCES public.staff(id);


--
-- Name: movie_genre fkp6vjabv2e2435at1hnuxg64yv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT fkp6vjabv2e2435at1hnuxg64yv FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- PostgreSQL database dump complete
--

