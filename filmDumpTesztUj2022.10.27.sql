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
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    id bigint NOT NULL,
    email character varying(255),
    forename character varying(255),
    hashed_pass character varying(255),
    surname character varying(255),
    user_name character varying(255)
);


ALTER TABLE public.app_user OWNER TO postgres;

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
    release_day smallint NOT NULL,
    release_month smallint NOT NULL,
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
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating (
    movie_id bigint NOT NULL,
    user_id bigint NOT NULL,
    rating smallint NOT NULL
);


ALTER TABLE public.rating OWNER TO postgres;

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
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (id, email, forename, hashed_pass, surname, user_name) FROM stdin;
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id, name) FROM stdin;
1	Akci??
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie (id, release_day, release_month, release_year, title, director_id, writer_id) FROM stdin;
1	23	10	2022	Az Irinyi Kabinet sz??ps??gei	3	1
2	10	12	2009	Avatar	3	4
\.


--
-- Data for Name: movie_actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_actors (movie_id, actors_id) FROM stdin;
1	2
\.


--
-- Data for Name: movie_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_genre (movie_id, genre_id) FROM stdin;
1	1
2	1
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rating (movie_id, user_id, rating) FROM stdin;
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, name, role_id) FROM stdin;
1	Quentin Tarantino	1
2	Keanu Reeves	3
3	James Cameron	2
4	James Cameron	1
\.


--
-- Data for Name: staff_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_role (id, role) FROM stdin;
1	Writer
2	Director
3	Actor/Actress
\.


--
-- Name: genre_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_id_sequence', 1, false);


--
-- Name: movie_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_id_sequence', 2, true);


--
-- Name: staff_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_sequence', 4, true);


--
-- Name: staff_role_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_role_sequence', 1, false);


--
-- Name: user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_sequence', 1, false);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (movie_id, user_id);


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

