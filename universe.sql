--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30),
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    approx_weight_in_ton integer,
    distance_from_earth numeric(5,1),
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    approx_weight_in_ton integer,
    description text,
    constellation_id integer
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
    name character varying(30),
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    approx_weight_in_ton integer,
    distance_from_earth numeric(5,1),
    description text,
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
    name character varying(30),
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    approx_weight_in_ton integer,
    distance_from_earth numeric(5,1),
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(30),
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    approx_weight_in_ton integer,
    distance_from_earth numeric(5,1),
    description text,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', false, false, NULL, NULL, 2.5, 'Nearest constelation from Via Lactea');
INSERT INTO public.constellation VALUES (2, 'Sagittarius', true, false, NULL, NULL, NULL, 'Constellation where Via Lactea is located');
INSERT INTO public.constellation VALUES (3, 'Triangulum', false, false, NULL, NULL, 2.9, NULL);
INSERT INTO public.constellation VALUES (4, 'Centaurus', false, false, NULL, NULL, 14.0, NULL);
INSERT INTO public.constellation VALUES (5, 'Sculptor', false, false, NULL, NULL, 11.0, NULL);
INSERT INTO public.constellation VALUES (6, 'Serpens', false, false, NULL, NULL, 600.0, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', true, false, 13000000, NULL, NULL, 2);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, false, NULL, NULL, 'Nearest galaxy from Via Lactea', 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, false, NULL, NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (4, 'Centaurus', false, false, NULL, NULL, NULL, 4);
INSERT INTO public.galaxy VALUES (5, 'Sculptor', false, false, NULL, NULL, NULL, 5);
INSERT INTO public.galaxy VALUES (6, 'Hoag', false, true, NULL, NULL, NULL, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Metis', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (5, 'Adralteia', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (6, 'Amisteia', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (7, 'Tebe', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (8, 'Io', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (9, 'Europa', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (10, 'Calisto', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (11, 'Ganimedes', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (12, 'Temisto', false, false, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (13, 'Leda', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (14, 'Himalia', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (15, 'Lisiteia', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (16, 'Dia', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (17, 'Carpo', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (18, 'Febe', false, true, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (19, 'Mimas', false, true, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (20, 'Tita', false, true, NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (2, 'Venus', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (3, 'Earth', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Marte', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (6, 'Saturno', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (7, 'Urano', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (8, 'Netuno', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (9, 'Plutao', false, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (10, 'Herculis', false, true, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Ceres', false, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (12, 'Eris', false, true, NULL, NULL, NULL, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Alpha Centauri', false, false, 7, 1, 4.3, 'discovered at 1592. Constellation Centaurus', NULL);
INSERT INTO public.star VALUES (3, 'Hadar', false, false, 14, 10, 361.0, 'Constellation Centaurus', NULL);
INSERT INTO public.star VALUES (4, 'Kaus Australis', false, false, NULL, NULL, 170.0, 'Constellation Sagittarius', NULL);
INSERT INTO public.star VALUES (5, 'Atria', false, false, 48, 7, 391.0, 'Constellation Triangulum', NULL);
INSERT INTO public.star VALUES (6, 'Nunki', false, false, NULL, NULL, 224.0, 'Constellation Sagittarius', NULL);
INSERT INTO public.star VALUES (7, 'Menkent', false, false, NULL, 1, 58.0, 'Contellation Centaurus', NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

