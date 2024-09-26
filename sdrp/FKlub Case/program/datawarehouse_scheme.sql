--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Postgres.app)
-- Dumped by pg_dump version 16.4 (Postgres.app)

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
-- Name: member_dim; Type: TABLE; Schema: public; Owner: seb
--

CREATE TABLE public.member_dim (
    member_id integer NOT NULL,
    gender character varying(10) NOT NULL,
    year integer NOT NULL,
    balance numeric(10,2) NOT NULL,
    status character varying NOT NULL
);


ALTER TABLE public.member_dim OWNER TO seb;

--
-- Name: product_dim; Type: TABLE; Schema: public; Owner: seb
--

CREATE TABLE public.product_dim (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    status character varying,
    deactivate_date date,
    alcohol_content_ml integer,
    start_date date
);


ALTER TABLE public.product_dim OWNER TO seb;

--
-- Name: room_dim; Type: TABLE; Schema: public; Owner: seb
--

CREATE TABLE public.room_dim (
    room_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.room_dim OWNER TO seb;

--
-- Name: room_dim_room_id_seq; Type: SEQUENCE; Schema: public; Owner: seb
--

CREATE SEQUENCE public.room_dim_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.room_dim_room_id_seq OWNER TO seb;

--
-- Name: room_dim_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seb
--

ALTER SEQUENCE public.room_dim_room_id_seq OWNED BY public.room_dim.room_id;


--
-- Name: sales_fact; Type: TABLE; Schema: public; Owner: seb
--

CREATE TABLE public.sales_fact (
    sales_id integer NOT NULL,
    member_id integer NOT NULL,
    product_id integer NOT NULL,
    timeid integer NOT NULL,
    price numeric(10,2) NOT NULL,
    room_id integer
);


ALTER TABLE public.sales_fact OWNER TO seb;

--
-- Name: sales_fact_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: seb
--

CREATE SEQUENCE public.sales_fact_sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_fact_sales_id_seq OWNER TO seb;

--
-- Name: sales_fact_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seb
--

ALTER SEQUENCE public.sales_fact_sales_id_seq OWNED BY public.sales_fact.sales_id;


--
-- Name: time_dim; Type: TABLE; Schema: public; Owner: seb
--

CREATE TABLE public.time_dim (
    timeid integer NOT NULL,
    day integer NOT NULL,
    month integer NOT NULL,
    year integer NOT NULL,
    weekday_name character varying(10) NOT NULL,
    week_number integer NOT NULL
);


ALTER TABLE public.time_dim OWNER TO seb;

--
-- Name: room_dim room_id; Type: DEFAULT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.room_dim ALTER COLUMN room_id SET DEFAULT nextval('public.room_dim_room_id_seq'::regclass);


--
-- Name: sales_fact sales_id; Type: DEFAULT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.sales_fact ALTER COLUMN sales_id SET DEFAULT nextval('public.sales_fact_sales_id_seq'::regclass);


--
-- Name: member_dim member_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.member_dim
    ADD CONSTRAINT member_dim_pkey PRIMARY KEY (member_id);


--
-- Name: product_dim product_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.product_dim
    ADD CONSTRAINT product_dim_pkey PRIMARY KEY (product_id);


--
-- Name: room_dim room_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.room_dim
    ADD CONSTRAINT room_dim_pkey PRIMARY KEY (room_id);


--
-- Name: sales_fact sales_fact_pkey; Type: CONSTRAINT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT sales_fact_pkey PRIMARY KEY (sales_id);


--
-- Name: time_dim time_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.time_dim
    ADD CONSTRAINT time_dim_pkey PRIMARY KEY (timeid);


--
-- Name: sales_fact fk_room; Type: FK CONSTRAINT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT fk_room FOREIGN KEY (room_id) REFERENCES public.room_dim(room_id);


--
-- Name: sales_fact sales_fact_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT sales_fact_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.member_dim(member_id);


--
-- Name: sales_fact sales_fact_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT sales_fact_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product_dim(product_id);


--
-- Name: sales_fact sales_fact_timeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: seb
--

ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT sales_fact_timeid_fkey FOREIGN KEY (timeid) REFERENCES public.time_dim(timeid);


--
-- PostgreSQL database dump complete
--

