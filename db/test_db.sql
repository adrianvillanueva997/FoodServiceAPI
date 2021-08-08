--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-08-08 15:50:56 UTC

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
-- TOC entry 3030 (class 1262 OID 17228)
-- Name: FoodServicesTEST; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE "FoodServicesTEST" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE "FoodServicesTEST" OWNER TO admin;

\connect "FoodServicesTEST"

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
-- TOC entry 200 (class 1259 OID 17229)
-- Name: ta_outlet; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ta_outlet (
    outletid character varying NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    country character varying NOT NULL,
    phone character varying NOT NULL,
    reviews bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.ta_outlet OWNER TO admin;

--
-- TOC entry 202 (class 1259 OID 17264)
-- Name: ta_reviews; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ta_reviews (
    "user" character varying NOT NULL,
    outletid character varying NOT NULL,
    review character varying NOT NULL,
    rate bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.ta_reviews OWNER TO admin;

--
-- TOC entry 201 (class 1259 OID 17254)
-- Name: ta_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ta_user (
    "user" character varying NOT NULL,
    likes bigint DEFAULT 0,
    reviews bigint DEFAULT 0,
    address character varying NOT NULL
);


ALTER TABLE public.ta_user OWNER TO admin;

--
-- TOC entry 204 (class 1259 OID 17311)
-- Name: ub_menu; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ub_menu (
    outletid character varying NOT NULL,
    name character varying NOT NULL,
    brand character varying NOT NULL,
    price double precision NOT NULL,
    volume character varying NOT NULL
);


ALTER TABLE public.ub_menu OWNER TO admin;

--
-- TOC entry 203 (class 1259 OID 17308)
-- Name: ub_outlet; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ub_outlet (
    outletid character varying NOT NULL,
    country character varying NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    reviews bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.ub_outlet OWNER TO admin;

--
-- TOC entry 205 (class 1259 OID 17368)
-- Name: vw_outlets; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW public.vw_outlets AS
 SELECT ta.outletid,
    ta.name,
    ta.address,
    ta.country,
    ta.phone,
    ta.reviews,
    'tripadvisor'::text AS source
   FROM public.ta_outlet ta
UNION ALL
 SELECT ub.outletid,
    ub.name,
    ub.address,
    ub.country,
    ''::character varying AS phone,
    ub.reviews,
    'ubereats'::text AS source
   FROM public.ub_outlet ub;


ALTER TABLE public.vw_outlets OWNER TO admin;

--
-- TOC entry 3020 (class 0 OID 17229)
-- Dependencies: 200
-- Data for Name: ta_outlet; Type: TABLE DATA; Schema: public; Owner: admin
--


--
-- TOC entry 3022 (class 0 OID 17264)
-- Dependencies: 202
-- Data for Name: ta_reviews; Type: TABLE DATA; Schema: public; Owner: admin
--


--
-- TOC entry 3021 (class 0 OID 17254)
-- Dependencies: 201
-- Data for Name: ta_user; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3024 (class 0 OID 17311)
-- Dependencies: 204
-- Data for Name: ub_menu; Type: TABLE DATA; Schema: public; Owner: admin
--




--
-- TOC entry 3023 (class 0 OID 17308)
-- Dependencies: 203
-- Data for Name: ub_outlet; Type: TABLE DATA; Schema: public; Owner: admin
--

--
-- TOC entry 2879 (class 2606 OID 17276)
-- Name: ta_outlet ta_outlet_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ta_outlet
    ADD CONSTRAINT ta_outlet_pk PRIMARY KEY (outletid);


--
-- TOC entry 2881 (class 2606 OID 17261)
-- Name: ta_user ta_user_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ta_user
    ADD CONSTRAINT ta_user_pk PRIMARY KEY ("user");


--
-- TOC entry 2885 (class 2606 OID 17388)
-- Name: ub_menu ub_menu_un; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ub_menu
    ADD CONSTRAINT ub_menu_un UNIQUE (outletid, name, brand, price, volume);


--
-- TOC entry 2883 (class 2606 OID 17318)
-- Name: ub_outlet ub_outlet_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ub_outlet
    ADD CONSTRAINT ub_outlet_pk PRIMARY KEY (outletid);


--
-- TOC entry 2886 (class 2606 OID 17282)
-- Name: ta_reviews ta_outlet_outlet; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ta_reviews
    ADD CONSTRAINT ta_outlet_outlet FOREIGN KEY (outletid) REFERENCES public.ta_outlet(outletid);


--
-- TOC entry 2887 (class 2606 OID 17287)
-- Name: ta_reviews ta_reviews_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ta_reviews
    ADD CONSTRAINT ta_reviews_fk FOREIGN KEY ("user") REFERENCES public.ta_user("user");


--
-- TOC entry 2888 (class 2606 OID 17331)
-- Name: ub_menu ub_menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ub_menu
    ADD CONSTRAINT ub_menu_fk FOREIGN KEY (outletid) REFERENCES public.ub_outlet(outletid);


-- Completed on 2021-08-08 15:50:56 UTC

--
-- PostgreSQL database dump complete
--

