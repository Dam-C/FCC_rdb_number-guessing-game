--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO postgres;

\connect number_guess

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
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO postgres;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: scores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scores (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.scores OWNER TO postgres;

--
-- Name: scores_game_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scores_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scores_game_id_seq OWNER TO postgres;

--
-- Name: scores_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scores_game_id_seq OWNED BY public.scores.game_id;


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Name: scores game_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores ALTER COLUMN game_id SET DEFAULT nextval('public.scores_game_id_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.players VALUES (1, 'Jesus');
INSERT INTO public.players VALUES (2, 'user_1713805417954');
INSERT INTO public.players VALUES (3, 'user_1713805417953');
INSERT INTO public.players VALUES (4, 'user_1713805474187');
INSERT INTO public.players VALUES (5, 'user_1713805474186');
INSERT INTO public.players VALUES (6, 'user_1713805499954');
INSERT INTO public.players VALUES (7, 'user_1713805499953');
INSERT INTO public.players VALUES (8, 'user_1713805526028');
INSERT INTO public.players VALUES (9, 'user_1713805526027');
INSERT INTO public.players VALUES (10, 'user_1713805655812');
INSERT INTO public.players VALUES (11, 'user_1713805655811');
INSERT INTO public.players VALUES (12, 'user_1713805887358');
INSERT INTO public.players VALUES (13, 'user_1713805887357');
INSERT INTO public.players VALUES (14, 'user_1713805944374');
INSERT INTO public.players VALUES (15, 'user_1713805944373');
INSERT INTO public.players VALUES (16, 'user_1713806022656');
INSERT INTO public.players VALUES (17, 'user_1713806022655');
INSERT INTO public.players VALUES (18, 'user_1713806408508');
INSERT INTO public.players VALUES (19, 'user_1713806408507');


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.scores VALUES (1, 1, 4);
INSERT INTO public.scores VALUES (2, 1, 8);
INSERT INTO public.scores VALUES (3, 12, 697);
INSERT INTO public.scores VALUES (4, 12, 55);
INSERT INTO public.scores VALUES (5, 13, 176);
INSERT INTO public.scores VALUES (6, 13, 382);
INSERT INTO public.scores VALUES (7, 12, 778);
INSERT INTO public.scores VALUES (8, 12, 379);
INSERT INTO public.scores VALUES (9, 12, 791);
INSERT INTO public.scores VALUES (10, 14, 260);
INSERT INTO public.scores VALUES (11, 14, 25);
INSERT INTO public.scores VALUES (12, 15, 492);
INSERT INTO public.scores VALUES (13, 15, 194);
INSERT INTO public.scores VALUES (14, 14, 617);
INSERT INTO public.scores VALUES (15, 14, 3);
INSERT INTO public.scores VALUES (16, 14, 625);
INSERT INTO public.scores VALUES (17, 16, 364);
INSERT INTO public.scores VALUES (18, 16, 262);
INSERT INTO public.scores VALUES (19, 17, 430);
INSERT INTO public.scores VALUES (20, 17, 648);
INSERT INTO public.scores VALUES (21, 16, 718);
INSERT INTO public.scores VALUES (22, 16, 351);
INSERT INTO public.scores VALUES (23, 16, 35);
INSERT INTO public.scores VALUES (24, 1, 7);
INSERT INTO public.scores VALUES (25, 18, 750);
INSERT INTO public.scores VALUES (26, 18, 164);
INSERT INTO public.scores VALUES (27, 19, 995);
INSERT INTO public.scores VALUES (28, 19, 411);
INSERT INTO public.scores VALUES (29, 18, 508);
INSERT INTO public.scores VALUES (30, 18, 254);
INSERT INTO public.scores VALUES (31, 18, 832);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_player_id_seq', 19, true);


--
-- Name: scores_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scores_game_id_seq', 31, true);


--
-- Name: players players_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_name_key UNIQUE (name);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (game_id);


--
-- Name: scores scores_player_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_player_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- Name: DATABASE number_guess; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE number_guess TO freecodecamp;


--
-- PostgreSQL database dump complete
--

