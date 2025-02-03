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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    discovered_year integer NOT NULL,
    tail_length integer NOT NULL,
    is_periodic boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    distance numeric(10,2) NOT NULL,
    discovered boolean NOT NULL,
    num_stars integer NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    has_water boolean NOT NULL,
    crater_count integer NOT NULL,
    is_geologically_active boolean NOT NULL,
    description text,
    orbital_eccentricity numeric(4,3) NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    type character varying(50) NOT NULL,
    has_atmosphere boolean NOT NULL,
    orbital_period numeric(10,2) NOT NULL,
    number_of_moons integer NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(50) NOT NULL,
    magnitude integer NOT NULL,
    has_planets boolean NOT NULL,
    age integer NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1758, 10, true, 'Famous periodic comet');
INSERT INTO public.comet VALUES (2, 'Encke', 1786, 5, true, 'Short period comet');
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 1995, 50, false, 'Exceptionally bright comet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0.00, true, 100, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.54, true, 150, 'Nearest spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3.00, true, 50, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23.00, true, 80, 'Interacting galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 29.30, true, 60, 'Notable for its bright nucleus');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21.50, false, 70, 'Large face-on spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 100, false, 'Earth''s natural satellite', 0.054);
INSERT INTO public.moon VALUES (2, 'Selene', 3, false, 80, false, 'Fictional secondary moon of Earth', 0.050);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, false, 50, false, 'Mars moon', 0.015);
INSERT INTO public.moon VALUES (4, 'Deimos', 4, false, 30, false, 'Mars moon', 0.012);
INSERT INTO public.moon VALUES (5, 'Mimosa', 4, false, 40, false, 'Fictional Mars moon', 0.020);
INSERT INTO public.moon VALUES (6, 'Sirius I - Moon 1', 7, false, 10, false, 'Moon orbiting Sirius I', 0.100);
INSERT INTO public.moon VALUES (7, 'Sirius I - Moon 2', 7, false, 12, false, 'Moon orbiting Sirius I', 0.110);
INSERT INTO public.moon VALUES (8, 'Sirius I - Moon 3', 7, false, 14, false, 'Moon orbiting Sirius I', 0.120);
INSERT INTO public.moon VALUES (9, 'Sirius I - Moon 4', 7, false, 16, false, 'Moon orbiting Sirius I', 0.130);
INSERT INTO public.moon VALUES (10, 'Sirius II - Moon 1', 8, false, 20, false, 'Moon orbiting Sirius II', 0.200);
INSERT INTO public.moon VALUES (11, 'Sirius II - Moon 2', 8, false, 22, false, 'Moon orbiting Sirius II', 0.210);
INSERT INTO public.moon VALUES (12, 'Sirius II - Moon 3', 8, false, 24, false, 'Moon orbiting Sirius II', 0.220);
INSERT INTO public.moon VALUES (13, 'Sirius II - Moon 4', 8, false, 26, false, 'Moon orbiting Sirius II', 0.230);
INSERT INTO public.moon VALUES (14, 'Sirius III - Moon 1', 9, false, 30, false, 'Moon orbiting Sirius III', 0.300);
INSERT INTO public.moon VALUES (15, 'Sirius III - Moon 2', 9, false, 32, false, 'Moon orbiting Sirius III', 0.310);
INSERT INTO public.moon VALUES (16, 'Sirius III - Moon 3', 9, false, 34, false, 'Moon orbiting Sirius III', 0.320);
INSERT INTO public.moon VALUES (17, 'Sirius III - Moon 4', 9, false, 36, false, 'Moon orbiting Sirius III', 0.330);
INSERT INTO public.moon VALUES (18, 'Sirius III - Moon 5', 9, false, 38, false, 'Moon orbiting Sirius III', 0.340);
INSERT INTO public.moon VALUES (19, 'Betelgeuse I - Moon 1', 12, false, 40, false, 'Moon orbiting Betelgeuse I', 0.400);
INSERT INTO public.moon VALUES (20, 'Betelgeuse I - Moon 2', 12, false, 42, false, 'Moon orbiting Betelgeuse I', 0.410);
INSERT INTO public.moon VALUES (21, 'Betelgeuse I - Moon 3', 12, false, 44, false, 'Moon orbiting Betelgeuse I', 0.420);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, 87.97, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', true, 224.70, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, 365.25, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', true, 687.00, 2);
INSERT INTO public.planet VALUES (5, 'Alpha Centauri Bb', 2, 'Terrestrial', false, 3.20, 0);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bc', 2, 'Terrestrial', false, 5.00, 0);
INSERT INTO public.planet VALUES (7, 'Sirius I', 3, 'Gas Giant', true, 1000.00, 10);
INSERT INTO public.planet VALUES (8, 'Sirius II', 3, 'Gas Giant', true, 1500.00, 15);
INSERT INTO public.planet VALUES (9, 'Sirius III', 3, 'Ice Giant', true, 2000.00, 20);
INSERT INTO public.planet VALUES (10, 'Proxima b', 4, 'Terrestrial', true, 11.20, 0);
INSERT INTO public.planet VALUES (11, 'Proxima c', 4, 'Terrestrial', false, 22.50, 0);
INSERT INTO public.planet VALUES (12, 'Betelgeuse I', 5, 'Gas Giant', true, 5000.00, 30);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 4, true, 4600);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'G-type', 1, true, 5000);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-type', 2, false, 242);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M-type', 1, true, 4500);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 'Red Supergiant', 0, false, 10000);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'Blue Supergiant', 0, false, 10000);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

