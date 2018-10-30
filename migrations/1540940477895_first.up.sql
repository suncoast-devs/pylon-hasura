--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-1.pgdg14.04+1)
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.address (
    id integer NOT NULL,
    label text NOT NULL,
    "streetAddress" text NOT NULL,
    "extendedAddress" text NOT NULL,
    locality text NOT NULL,
    "postalCode" text NOT NULL,
    "countryName" text NOT NULL,
    "postOfficeBox" text NOT NULL,
    "personId" integer NOT NULL
);


--
-- Name: assignmentNote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."assignmentNote" (
    "assignmentId" integer NOT NULL,
    "noteId" integer NOT NULL
);


--
-- Name: email; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email (
    id integer NOT NULL,
    "personId" integer NOT NULL,
    address text NOT NULL,
    "isPrimary" boolean NOT NULL
);


--
-- Name: link; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.link (
    id integer NOT NULL,
    label text NOT NULL,
    identifier text NOT NULL,
    "personId" integer
);


--
-- Name: note; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.note (
    id integer NOT NULL,
    label text NOT NULL,
    message text NOT NULL,
    "authorId" integer NOT NULL
);


--
-- Name: phoneNumber; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."phoneNumber" (
    id integer NOT NULL,
    "personId" integer NOT NULL,
    label text NOT NULL,
    tel text NOT NULL,
    "isSMSCapable" boolean NOT NULL
);


--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- Name: assignment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assignment (
    id integer NOT NULL,
    "homeworkId" integer NOT NULL,
    "studentProfileId" integer NOT NULL,
    score integer NOT NULL,
    memo text NOT NULL,
    "submissionUrl" text NOT NULL,
    status text NOT NULL
);


--
-- Name: assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assignment_id_seq OWNED BY public.assignment.id;


--
-- Name: attendanceRecord; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."attendanceRecord" (
    id integer NOT NULL,
    "studentProfileId" integer NOT NULL,
    date date NOT NULL,
    record text NOT NULL,
    memo text NOT NULL,
    "recorderId" integer NOT NULL
);


--
-- Name: cohort; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cohort (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date NOT NULL,
    "programId" integer NOT NULL
);


--
-- Name: cohort_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cohort_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cohort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cohort_id_seq OWNED BY public.cohort.id;


--
-- Name: email_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_id_seq OWNED BY public.email.id;


--
-- Name: homework; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.homework (
    id integer NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    summary text NOT NULL,
    "cohortId" integer NOT NULL
);


--
-- Name: homework_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.homework_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: homework_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.homework_id_seq OWNED BY public.homework.id;


--
-- Name: link_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.link_id_seq OWNED BY public.link.id;


--
-- Name: note_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.note_id_seq OWNED BY public.note.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.person (
    id integer NOT NULL,
    "givenName" text NOT NULL,
    "familyName" text NOT NULL,
    "additionalName" text NOT NULL,
    "honorificPrefix" text NOT NULL,
    "honorificSuffix" text NOT NULL,
    nickname text NOT NULL,
    "fullName" text NOT NULL,
    "shirtSize" text NOT NULL,
    "dietaryNote" text NOT NULL,
    "userId" text
);


--
-- Name: personNote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."personNote" (
    "personId" integer NOT NULL,
    "noteId" integer NOT NULL
);


--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: phonenumber_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.phonenumber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phonenumber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.phonenumber_id_seq OWNED BY public."phoneNumber".id;


--
-- Name: program; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.program (
    id integer NOT NULL,
    title text NOT NULL,
    identifier text NOT NULL,
    description text NOT NULL
);


--
-- Name: program_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.program_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: program_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.program_id_seq OWNED BY public.program.id;


--
-- Name: studentProfile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."studentProfile" (
    id integer NOT NULL,
    "personId" integer NOT NULL,
    "cohortId" integer NOT NULL,
    status text NOT NULL,
    "isAvailableForHire" boolean NOT NULL,
    "isAvailableForContract" boolean NOT NULL,
    specialty text NOT NULL
);


--
-- Name: studentprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.studentprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: studentprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.studentprofile_id_seq OWNED BY public."studentProfile".id;


--
-- Name: address id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: assignment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignment ALTER COLUMN id SET DEFAULT nextval('public.assignment_id_seq'::regclass);


--
-- Name: cohort id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort ALTER COLUMN id SET DEFAULT nextval('public.cohort_id_seq'::regclass);


--
-- Name: email id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email ALTER COLUMN id SET DEFAULT nextval('public.email_id_seq'::regclass);


--
-- Name: homework id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homework ALTER COLUMN id SET DEFAULT nextval('public.homework_id_seq'::regclass);


--
-- Name: link id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.link ALTER COLUMN id SET DEFAULT nextval('public.link_id_seq'::regclass);


--
-- Name: note id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.note ALTER COLUMN id SET DEFAULT nextval('public.note_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: phoneNumber id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."phoneNumber" ALTER COLUMN id SET DEFAULT nextval('public.phonenumber_id_seq'::regclass);


--
-- Name: program id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program ALTER COLUMN id SET DEFAULT nextval('public.program_id_seq'::regclass);


--
-- Name: studentProfile id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."studentProfile" ALTER COLUMN id SET DEFAULT nextval('public.studentprofile_id_seq'::regclass);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: assignmentNote assignmentNote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."assignmentNote"
    ADD CONSTRAINT "assignmentNote_pkey" PRIMARY KEY ("assignmentId", "noteId");


--
-- Name: assignment assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignment
    ADD CONSTRAINT assignment_pkey PRIMARY KEY (id);


--
-- Name: attendanceRecord attendanceRecord_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."attendanceRecord"
    ADD CONSTRAINT "attendanceRecord_pkey" PRIMARY KEY (id);


--
-- Name: cohort cohort_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort
    ADD CONSTRAINT cohort_name_key UNIQUE (name);


--
-- Name: cohort cohort_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort
    ADD CONSTRAINT cohort_pkey PRIMARY KEY (id);


--
-- Name: email email_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_pkey PRIMARY KEY (id);


--
-- Name: homework homework_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homework
    ADD CONSTRAINT homework_pkey PRIMARY KEY (id);


--
-- Name: link link_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_pkey PRIMARY KEY (id);


--
-- Name: note note_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: personNote personNote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."personNote"
    ADD CONSTRAINT "personNote_pkey" PRIMARY KEY ("personId", "noteId");


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: person person_userId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT "person_userId_key" UNIQUE ("userId");


--
-- Name: phoneNumber phoneNumber_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."phoneNumber"
    ADD CONSTRAINT "phoneNumber_pkey" PRIMARY KEY (id);


--
-- Name: program program_identifier_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_identifier_key UNIQUE (identifier);


--
-- Name: program program_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (id);


--
-- Name: program program_title_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_title_key UNIQUE (title);


--
-- Name: studentProfile studentProfile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."studentProfile"
    ADD CONSTRAINT "studentProfile_pkey" PRIMARY KEY (id);


--
-- Name: address address_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_personid_fkey FOREIGN KEY ("personId") REFERENCES public.person(id);


--
-- Name: assignment assignment_homeworkid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignment
    ADD CONSTRAINT assignment_homeworkid_fkey FOREIGN KEY ("homeworkId") REFERENCES public.homework(id);


--
-- Name: assignment assignment_studentprofileid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignment
    ADD CONSTRAINT assignment_studentprofileid_fkey FOREIGN KEY ("studentProfileId") REFERENCES public."studentProfile"(id);


--
-- Name: assignmentNote assignmentnote_assignmentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."assignmentNote"
    ADD CONSTRAINT assignmentnote_assignmentid_fkey FOREIGN KEY ("assignmentId") REFERENCES public.assignment(id);


--
-- Name: assignmentNote assignmentnote_noteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."assignmentNote"
    ADD CONSTRAINT assignmentnote_noteid_fkey FOREIGN KEY ("noteId") REFERENCES public.note(id);


--
-- Name: attendanceRecord attendancerecord_recorderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."attendanceRecord"
    ADD CONSTRAINT attendancerecord_recorderid_fkey FOREIGN KEY ("recorderId") REFERENCES public.person(id);


--
-- Name: attendanceRecord attendancerecord_studentprofileid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."attendanceRecord"
    ADD CONSTRAINT attendancerecord_studentprofileid_fkey FOREIGN KEY ("studentProfileId") REFERENCES public."studentProfile"(id);


--
-- Name: cohort cohort_programid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort
    ADD CONSTRAINT cohort_programid_fkey FOREIGN KEY ("programId") REFERENCES public.program(id);


--
-- Name: email email_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_personid_fkey FOREIGN KEY ("personId") REFERENCES public.person(id);


--
-- Name: homework homework_cohortid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homework
    ADD CONSTRAINT homework_cohortid_fkey FOREIGN KEY ("cohortId") REFERENCES public.cohort(id);


--
-- Name: link link_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_personid_fkey FOREIGN KEY ("personId") REFERENCES public.person(id);


--
-- Name: note note_authorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_authorid_fkey FOREIGN KEY ("authorId") REFERENCES public.person(id);


--
-- Name: personNote personnote_noteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."personNote"
    ADD CONSTRAINT personnote_noteid_fkey FOREIGN KEY ("noteId") REFERENCES public.note(id);


--
-- Name: personNote personnote_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."personNote"
    ADD CONSTRAINT personnote_personid_fkey FOREIGN KEY ("personId") REFERENCES public.person(id);


--
-- Name: phoneNumber phonenumber_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."phoneNumber"
    ADD CONSTRAINT phonenumber_personid_fkey FOREIGN KEY ("personId") REFERENCES public.person(id);


--
-- Name: studentProfile studentprofile_cohortid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."studentProfile"
    ADD CONSTRAINT studentprofile_cohortid_fkey FOREIGN KEY ("cohortId") REFERENCES public.cohort(id);


--
-- Name: studentProfile studentprofile_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."studentProfile"
    ADD CONSTRAINT studentprofile_personid_fkey FOREIGN KEY ("personId") REFERENCES public.person(id);


--
-- PostgreSQL database dump complete
--
