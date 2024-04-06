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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type character varying(20),
    size_in_milions_of_light_years numeric(2,2),
    no_of_stars_in_billions integer,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diameter_in_km numeric(4,2),
    age_in_billions integer,
    has_asteroids boolean,
    color text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diameter_in_thousands_km numeric(4,2),
    age_in_billions integer,
    has_life boolean,
    has_moons boolean,
    no_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy_relation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_galaxy_relation (
    planet_id integer,
    galaxy_id integer,
    planet_galaxy_id integer NOT NULL
);


ALTER TABLE public.planet_galaxy_relation OWNER TO freecodecamp;

--
-- Name: planet_galaxy_relation_planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_relation_planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_relation_planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_relation_planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_relation_planet_galaxy_id_seq OWNED BY public.planet_galaxy_relation.planet_galaxy_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diameter_in_millions_km numeric(4,2),
    age_in_billions integer,
    star_type character varying(20),
    has_planets boolean,
    no_of_planets integer,
    is_dying boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_galaxy_relation planet_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy_relation ALTER COLUMN planet_galaxy_id SET DEFAULT nextval('public.planet_galaxy_relation_planet_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.12, 400, true);
INSERT INTO public.galaxy VALUES (2, 'Imaginary', 'elliptical', 0.34, 600, true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'elliptical', 0.24, 900, true);
INSERT INTO public.galaxy VALUES (4, 'Star Wars', 'irregular', 0.46, 200, true);
INSERT INTO public.galaxy VALUES (5, 'Alpha Quadrant', 'Spiral', 0.54, 400, true);
INSERT INTO public.galaxy VALUES (6, 'Marvel', 'iregular', 0.36, 400, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'The Moon', 74.80, 3, true, 'red', 3);
INSERT INTO public.moon VALUES (3, 'Phobos', 34.80, 2, true, 'orange', 4);
INSERT INTO public.moon VALUES (4, 'Deimos', 44.80, 1, true, 'white', 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 74.80, 1, false, 'yellow', 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 74.80, 1, true, 'red', 5);
INSERT INTO public.moon VALUES (7, 'Europa', 94.80, 2, true, 'orange', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 39.80, 3, false, 'white', 6);
INSERT INTO public.moon VALUES (9, 'Mimas', 64.60, 3, true, 'yellow', 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 74.80, 1, true, 'red', 6);
INSERT INTO public.moon VALUES (11, 'Miranda', 36.30, 2, true, 'orange', 7);
INSERT INTO public.moon VALUES (12, 'Ariel', 54.80, 3, true, 'white', 7);
INSERT INTO public.moon VALUES (13, 'Triton', 74.80, 3, false, 'yellow', 8);
INSERT INTO public.moon VALUES (14, 'Thalassa', 44.80, 2, true, 'red', 8);
INSERT INTO public.moon VALUES (15, 'Moony', 47.80, 1, true, 'orange', 11);
INSERT INTO public.moon VALUES (16, 'Luna', 84.80, 2, true, 'yellow', 11);
INSERT INTO public.moon VALUES (17, 'Strawberry', 14.80, 1, false, 'red', 12);
INSERT INTO public.moon VALUES (18, 'Vanilla', 74.80, 2, false, 'red', 12);
INSERT INTO public.moon VALUES (19, 'Super Moon', 47.80, 3, false, 'orange', 13);
INSERT INTO public.moon VALUES (20, 'Bat Moon', 24.80, 2, true, 'white', 13);
INSERT INTO public.moon VALUES (21, 'Avatar Moon', 34.80, 2, true, 'yellow', 14);
INSERT INTO public.moon VALUES (22, 'Tatooine Moon', 54.80, 1, true, 'red', 16);
INSERT INTO public.moon VALUES (23, 'Forest Moon', 64.80, 3, false, 'orange', 17);
INSERT INTO public.moon VALUES (24, 'Ohma-Dun', 74.80, 1, true, 'white', 18);
INSERT INTO public.moon VALUES (25, 'Rori', 54.80, 1, true, 'yellow', 18);
INSERT INTO public.moon VALUES (26, 'Oquonieks', 44.80, 3, false, 'red', 19);
INSERT INTO public.moon VALUES (27, 'T.khut', 44.80, 2, true, 'orange', 20);
INSERT INTO public.moon VALUES (28, 'Veytahn', 74.80, 2, false, 'white', 21);
INSERT INTO public.moon VALUES (29, 'Arken', 64.80, 3, true, 'red', 22);
INSERT INTO public.moon VALUES (30, 'Janda', 74.80, 1, false, 'orange', 23);
INSERT INTO public.moon VALUES (31, 'Feuj', 34.80, 3, true, 'white', 23);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4.87, 4, false, false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12.10, 4, false, false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12.70, 4, true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6.70, 4, false, true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 39.80, 4, true, false, 95, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 16.40, 4, true, false, 146, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50.70, 4, true, false, 28, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49.20, 4, true, false, 16, 1);
INSERT INTO public.planet VALUES (9, 'Sirius', 4.47, 4, false, true, 3, 2);
INSERT INTO public.planet VALUES (10, 'Nudra', 5.87, 4, false, true, 4, 2);
INSERT INTO public.planet VALUES (11, 'My_planet', 1.27, 4, false, true, 5, 3);
INSERT INTO public.planet VALUES (12, 'Planet Yoghurt', 7.17, 4, false, true, 2, 3);
INSERT INTO public.planet VALUES (13, 'Krypton', 2.87, 4, true, true, 6, 4);
INSERT INTO public.planet VALUES (14, 'Pandora', 9.97, 4, true, true, 7, 4);
INSERT INTO public.planet VALUES (15, 'Const 248', 1.84, 4, true, false, 0, 6);
INSERT INTO public.planet VALUES (16, 'Tatooine', 6.87, 4, true, true, 7, 8);
INSERT INTO public.planet VALUES (17, 'Endor', 4.87, 4, true, true, 8, 9);
INSERT INTO public.planet VALUES (18, 'Naboo', 6.87, 4, true, true, 9, 10);
INSERT INTO public.planet VALUES (19, 'Kashyyk', 5.87, 4, true, true, 8, 11);
INSERT INTO public.planet VALUES (20, 'Vulcan', 3.87, 4, true, true, 7, 12);
INSERT INTO public.planet VALUES (21, 'Andoria', 5.87, 4, true, true, 6, 12);
INSERT INTO public.planet VALUES (22, 'Tellar', 6.87, 4, true, true, 5, 12);
INSERT INTO public.planet VALUES (23, 'Xandar', 4.87, 4, true, true, 4, 13);
INSERT INTO public.planet VALUES (24, 'Knowhere', 9.87, 4, true, false, 0, 13);


--
-- Data for Name: planet_galaxy_relation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_galaxy_relation VALUES (1, 1, 1);
INSERT INTO public.planet_galaxy_relation VALUES (2, 1, 2);
INSERT INTO public.planet_galaxy_relation VALUES (3, 1, 3);
INSERT INTO public.planet_galaxy_relation VALUES (4, 1, 4);
INSERT INTO public.planet_galaxy_relation VALUES (5, 1, 5);
INSERT INTO public.planet_galaxy_relation VALUES (6, 1, 6);
INSERT INTO public.planet_galaxy_relation VALUES (7, 1, 7);
INSERT INTO public.planet_galaxy_relation VALUES (8, 1, 8);
INSERT INTO public.planet_galaxy_relation VALUES (9, 1, 9);
INSERT INTO public.planet_galaxy_relation VALUES (10, 1, 10);
INSERT INTO public.planet_galaxy_relation VALUES (11, 2, 11);
INSERT INTO public.planet_galaxy_relation VALUES (12, 2, 12);
INSERT INTO public.planet_galaxy_relation VALUES (13, 2, 13);
INSERT INTO public.planet_galaxy_relation VALUES (14, 2, 14);
INSERT INTO public.planet_galaxy_relation VALUES (15, 3, 15);
INSERT INTO public.planet_galaxy_relation VALUES (16, 4, 16);
INSERT INTO public.planet_galaxy_relation VALUES (17, 4, 17);
INSERT INTO public.planet_galaxy_relation VALUES (18, 4, 18);
INSERT INTO public.planet_galaxy_relation VALUES (19, 4, 19);
INSERT INTO public.planet_galaxy_relation VALUES (20, 5, 20);
INSERT INTO public.planet_galaxy_relation VALUES (21, 5, 21);
INSERT INTO public.planet_galaxy_relation VALUES (22, 5, 22);
INSERT INTO public.planet_galaxy_relation VALUES (23, 6, 23);
INSERT INTO public.planet_galaxy_relation VALUES (24, 6, 24);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.39, 4, 'Yellow Dwarf', true, 8, false, 1);
INSERT INTO public.star VALUES (2, 'Canis Major', 1.30, 4, 'Red dwarf', true, 5, false, 1);
INSERT INTO public.star VALUES (3, 'My star', 1.59, 10, 'Red dwarf', true, 9, false, 2);
INSERT INTO public.star VALUES (4, 'Fiction', 1.38, 5, 'White dwarf', true, 6, true, 2);
INSERT INTO public.star VALUES (5, 'Lifeless', 1.39, 9, 'White dwarf', false, NULL, true, 2);
INSERT INTO public.star VALUES (6, 'Alpheratz', 1.49, 6, 'Red Giant', true, 7, false, 3);
INSERT INTO public.star VALUES (7, 'Ross 248', 1.79, 8, 'Red Giant', false, NULL, false, 3);
INSERT INTO public.star VALUES (8, 'Tatoo', 1.29, 7, 'Red dwarf', true, 8, false, 4);
INSERT INTO public.star VALUES (9, 'Endor', 1.90, 7, 'Blue Giant', true, 6, false, 4);
INSERT INTO public.star VALUES (10, 'Naboo', 1.59, 8, 'White dwarf', true, 9, true, 4);
INSERT INTO public.star VALUES (11, 'Kashyyyk', 1.59, 6, 'Red dwarf', true, 5, false, 4);
INSERT INTO public.star VALUES (12, 'Sol', 1.19, 9, 'Red Giant', true, 10, false, 5);
INSERT INTO public.star VALUES (13, 'Xandar', 1.69, 5, 'White dwarf', true, 4, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_galaxy_relation_planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_relation_planet_galaxy_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_galaxy_relation planet_galaxy_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy_relation
    ADD CONSTRAINT planet_galaxy_relation_pkey PRIMARY KEY (planet_galaxy_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_galaxy_relation planet_galaxy_relation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy_relation
    ADD CONSTRAINT planet_galaxy_relation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet_galaxy_relation planet_galaxy_relation_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy_relation
    ADD CONSTRAINT planet_galaxy_relation_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

