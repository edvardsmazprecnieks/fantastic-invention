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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text,
    constellation character varying(30) NOT NULL
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
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    description name
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
    star_id integer NOT NULL,
    description text,
    has_life boolean,
    planet_type_id integer NOT NULL,
    year_discovered integer NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description name
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    distance_in_lightyears numeric(6,2) NOT NULL
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13610, 'This is the galaxy containing the Sun and its Solar System, and therefore Earth.', 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 1101, 'It is also the brightest patch of nebulosity in the sky.', 'Dorado');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 6500, NULL, 'Tucana');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 10010, NULL, 'Andromeda');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 13270, NULL, 'Centaurus');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 400, 'First spiral galaxy observed.', 'Canes Venatici');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Metis', 1, true, NULL);
INSERT INTO public.moon VALUES (2, 'Titan', 2, true, NULL);
INSERT INTO public.moon VALUES (3, 'Titania', 3, true, 'The largest of the moons of Uranus');
INSERT INTO public.moon VALUES (4, 'Galatea', 4, false, 'The fourth-closest inner moon to Neptune');
INSERT INTO public.moon VALUES (5, 'Dysnomia', 5, false, NULL);
INSERT INTO public.moon VALUES (6, 'The Moon', 6, true, 'The only moon of Earth');
INSERT INTO public.moon VALUES (7, 'Deimos', 15, false, NULL);
INSERT INTO public.moon VALUES (8, 'Phobos', 15, true, NULL);
INSERT INTO public.moon VALUES (9, 'Charon', 16, true, NULL);
INSERT INTO public.moon VALUES (10, 'Nix', 16, false, NULL);
INSERT INTO public.moon VALUES (11, 'Hydra', 16, false, NULL);
INSERT INTO public.moon VALUES (12, 'Europa', 1, true, NULL);
INSERT INTO public.moon VALUES (13, 'lo', 1, true, NULL);
INSERT INTO public.moon VALUES (14, 'Callisto', 1, true, NULL);
INSERT INTO public.moon VALUES (15, 'Thebe', 1, false, NULL);
INSERT INTO public.moon VALUES (16, 'Amalthea', 1, false, NULL);
INSERT INTO public.moon VALUES (17, 'Enceladus', 2, true, NULL);
INSERT INTO public.moon VALUES (18, 'Dione', 2, true, NULL);
INSERT INTO public.moon VALUES (20, 'Triton', 4, true, NULL);
INSERT INTO public.moon VALUES (19, 'Miranda', 3, true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 1, 'Jupiter is the fifth planet from the Sun.', false, 1, 1610);
INSERT INTO public.planet VALUES (2, 'Saturn', 1, NULL, false, 1, 1610);
INSERT INTO public.planet VALUES (3, 'Uranus', 1, 'Seventh planet from the Sun.', false, 2, 1781);
INSERT INTO public.planet VALUES (4, 'Neptune', 1, 'Eighth planet from the Sun and the farthest known solar planet.', false, 2, 1846);
INSERT INTO public.planet VALUES (5, 'Eris', 1, 'The most massive and second largest known dwarf planet in the Solar System.', false, 3, 2005);
INSERT INTO public.planet VALUES (6, 'Earth', 1, NULL, true, 8, -20000000);
INSERT INTO public.planet VALUES (7, 'Makemake', 1, NULL, false, 3, 2005);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, NULL, false, 3, 1400);
INSERT INTO public.planet VALUES (9, 'Venus', 1, NULL, false, 3, 1610);
INSERT INTO public.planet VALUES (10, 'Upsilon Andromedae b', 2, NULL, false, 3, 1996);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 3, NULL, false, 3, 2016);
INSERT INTO public.planet VALUES (12, 'WASP-62 b', 5, NULL, false, 3, 2012);
INSERT INTO public.planet VALUES (13, 'HD 221287 b', 6, NULL, false, 3, 2007);
INSERT INTO public.planet VALUES (14, 'Ceres', 1, NULL, false, 3, 1801);
INSERT INTO public.planet VALUES (15, 'Mars', 1, NULL, false, 3, 1610);
INSERT INTO public.planet VALUES (16, 'Pluto', 1, NULL, false, 3, 1935);
INSERT INTO public.planet VALUES (17, 'Upsilon Andromedae c', 2, NULL, false, 3, 1996);
INSERT INTO public.planet VALUES (18, 'Upsilon Andromedae d', 2, NULL, false, 3, 1996);
INSERT INTO public.planet VALUES (19, 'Upsilon Andromedae e', 2, NULL, false, 3, 1996);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Giant planet', 'A massive planet.');
INSERT INTO public.planet_type VALUES (2, 'Ice giant', 'Smaller than the gas giants, but still much larger than Earth.');
INSERT INTO public.planet_type VALUES (3, 'Mesoplanet', 'Assuming "size" is defined by linear dimension (or by volume), ');
INSERT INTO public.planet_type VALUES (4, 'Mini-Neptune', 'Also known as a gas dwarf or transitional planet.');
INSERT INTO public.planet_type VALUES (5, 'Planetar', 'Either a brown dwarf or a sub-brown dwarf, an object smaller th');
INSERT INTO public.planet_type VALUES (6, 'Super-Earth', NULL);
INSERT INTO public.planet_type VALUES (7, 'Super-Jupiter', 'An astronomical object that is more massive than the planet Jup');
INSERT INTO public.planet_type VALUES (8, 'Sub-Earth', 'A classification of planets "substantially less massive" than E');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, 0.00);
INSERT INTO public.star VALUES (2, 'Titawin', 4, 'Named after the settlement in northern Morocco and UNESCO World Heritage Site now known as the medina (old town) of Tetouan.', 44.30);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 5, 'The nearest star to the Sun.', 4.25);
INSERT INTO public.star VALUES (4, 'La Superba', 6, 'A modern (19th century) name, due to Angelo Secchi.', 1045.40);
INSERT INTO public.star VALUES (5, 'Naledi', 2, NULL, 575.76);
INSERT INTO public.star VALUES (6, 'Poerava', 3, NULL, 183.00);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 8, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

