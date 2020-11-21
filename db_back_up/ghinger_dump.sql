--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: affected_system_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE affected_system_masters (
    id integer NOT NULL,
    title character varying,
    comment character varying,
    user_id integer,
    entity_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE affected_system_masters OWNER TO clemence;

--
-- Name: affected_system_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE affected_system_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE affected_system_masters_id_seq OWNER TO clemence;

--
-- Name: affected_system_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE affected_system_masters_id_seq OWNED BY affected_system_masters.id;


--
-- Name: allergies_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE allergies_masters (
    id integer NOT NULL,
    title character varying,
    comment character varying,
    user_id integer,
    entity integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE allergies_masters OWNER TO clemence;

--
-- Name: allergies_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE allergies_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE allergies_masters_id_seq OWNER TO clemence;

--
-- Name: allergies_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE allergies_masters_id_seq OWNED BY allergies_masters.id;


--
-- Name: appointment_types; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE appointment_types (
    id integer NOT NULL,
    title character varying,
    comment character varying,
    user_id integer,
    entity_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ref_id character varying
);


ALTER TABLE appointment_types OWNER TO clemence;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE appointment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE appointment_types_id_seq OWNER TO clemence;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE appointment_types_id_seq OWNED BY appointment_types.id;


--
-- Name: city_town_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE city_town_masters (
    id integer NOT NULL,
    city_town_name character varying,
    comment character varying,
    region_id integer,
    entity_id integer,
    user_id integer,
    active_status boolean,
    change_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE city_town_masters OWNER TO clemence;

--
-- Name: city_town_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE city_town_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE city_town_masters_id_seq OWNER TO clemence;

--
-- Name: city_town_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE city_town_masters_id_seq OWNED BY city_town_masters.id;


--
-- Name: condition_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE condition_masters (
    id integer NOT NULL,
    condition_name character varying,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE condition_masters OWNER TO clemence;

--
-- Name: condition_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE condition_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE condition_masters_id_seq OWNER TO clemence;

--
-- Name: condition_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE condition_masters_id_seq OWNED BY condition_masters.id;


--
-- Name: confirmed_appointments; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE confirmed_appointments (
    id integer NOT NULL,
    pre_appointment_id integer,
    provider_id integer,
    complaint_desc character varying,
    confirmed_date timestamp without time zone,
    confirmed_time time without time zone,
    comment character varying,
    user_id integer,
    entity_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    suburb_id integer,
    doctor_id integer,
    patient_id integer,
    attended_to boolean
);


ALTER TABLE confirmed_appointments OWNER TO clemence;

--
-- Name: confirmed_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE confirmed_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE confirmed_appointments_id_seq OWNER TO clemence;

--
-- Name: confirmed_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE confirmed_appointments_id_seq OWNED BY confirmed_appointments.id;


--
-- Name: confirmed_conditions; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE confirmed_conditions (
    id integer NOT NULL,
    confirmed_appointment_id integer,
    condition_id integer,
    allergy_id boolean,
    comment character varying,
    user_id integer,
    entity integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE confirmed_conditions OWNER TO clemence;

--
-- Name: confirmed_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE confirmed_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE confirmed_conditions_id_seq OWNER TO clemence;

--
-- Name: confirmed_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE confirmed_conditions_id_seq OWNED BY confirmed_conditions.id;


--
-- Name: confirmed_personal_doctor_services; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE confirmed_personal_doctor_services (
    id integer NOT NULL,
    doctor_id integer,
    patient_id integer,
    comment character varying,
    entity_id integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pre_appointment_id integer,
    suburb_id integer,
    appointment_type_id character varying,
    confirmed_appointment_id integer
);


ALTER TABLE confirmed_personal_doctor_services OWNER TO clemence;

--
-- Name: confirmed_personal_doctor_services_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE confirmed_personal_doctor_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE confirmed_personal_doctor_services_id_seq OWNER TO clemence;

--
-- Name: confirmed_personal_doctor_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE confirmed_personal_doctor_services_id_seq OWNED BY confirmed_personal_doctor_services.id;


--
-- Name: country_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE country_masters (
    id integer NOT NULL,
    country_name character varying,
    comment character varying,
    entity_id integer,
    user_id integer,
    active_status boolean,
    change_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE country_masters OWNER TO clemence;

--
-- Name: country_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE country_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE country_masters_id_seq OWNER TO clemence;

--
-- Name: country_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE country_masters_id_seq OWNED BY country_masters.id;


--
-- Name: engaged_user_services; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE engaged_user_services (
    id integer NOT NULL,
    person_id integer,
    user_service_id integer,
    comment character varying,
    entity_id character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE engaged_user_services OWNER TO clemence;

--
-- Name: engaged_user_services_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE engaged_user_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE engaged_user_services_id_seq OWNER TO clemence;

--
-- Name: engaged_user_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE engaged_user_services_id_seq OWNED BY engaged_user_services.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE events (
    id integer NOT NULL,
    title character varying,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE events OWNER TO clemence;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_id_seq OWNER TO clemence;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: lab_detail_images; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE lab_detail_images (
    id integer NOT NULL,
    pre_appointment_id integer,
    lab_detail_id integer,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


ALTER TABLE lab_detail_images OWNER TO clemence;

--
-- Name: lab_detail_images_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE lab_detail_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lab_detail_images_id_seq OWNER TO clemence;

--
-- Name: lab_detail_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE lab_detail_images_id_seq OWNED BY lab_detail_images.id;


--
-- Name: lab_details; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE lab_details (
    id integer NOT NULL,
    pre_appointment_id integer,
    lab_service_id integer,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE lab_details OWNER TO clemence;

--
-- Name: lab_details_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE lab_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lab_details_id_seq OWNER TO clemence;

--
-- Name: lab_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE lab_details_id_seq OWNED BY lab_details.id;


--
-- Name: lab_services; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE lab_services (
    id integer NOT NULL,
    title character varying,
    price numeric,
    comment character varying,
    user_id character varying,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE lab_services OWNER TO clemence;

--
-- Name: lab_services_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE lab_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lab_services_id_seq OWNER TO clemence;

--
-- Name: lab_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE lab_services_id_seq OWNED BY lab_services.id;


--
-- Name: password_table; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE password_table (
    id integer NOT NULL,
    password text NOT NULL,
    mobile_number text NOT NULL,
    created_at time without time zone,
    status boolean,
    username text
);


ALTER TABLE password_table OWNER TO clemence;

--
-- Name: password_table_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE password_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE password_table_id_seq OWNER TO clemence;

--
-- Name: password_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE password_table_id_seq OWNED BY password_table.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE permissions (
    id integer NOT NULL,
    subject_class character varying,
    action character varying,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE permissions OWNER TO clemence;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions_id_seq OWNER TO clemence;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: permissions_roles; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE permissions_roles (
    id integer NOT NULL,
    person_type_master_id integer,
    permission_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role_id integer
);


ALTER TABLE permissions_roles OWNER TO clemence;

--
-- Name: permissions_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE permissions_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions_roles_id_seq OWNER TO clemence;

--
-- Name: permissions_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE permissions_roles_id_seq OWNED BY permissions_roles.id;


--
-- Name: person_contact_infos; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE person_contact_infos (
    id integer NOT NULL,
    person_id integer,
    contact_number character varying,
    email character varying,
    postal_address character varying,
    location_address character varying,
    comment character varying,
    user_id integer,
    entity_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    suburb_id integer
);


ALTER TABLE person_contact_infos OWNER TO clemence;

--
-- Name: person_contact_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE person_contact_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_contact_infos_id_seq OWNER TO clemence;

--
-- Name: person_contact_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE person_contact_infos_id_seq OWNED BY person_contact_infos.id;


--
-- Name: person_info_extras; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE person_info_extras (
    id integer NOT NULL,
    person_id integer,
    specialty_id integer,
    specialty_duration character varying,
    has_specialty boolean,
    forign_training boolean,
    foreign_institution_desc character varying,
    profession_group_id integer,
    licence_number character varying,
    comment character varying,
    user_id integer,
    entity_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    foreign_licence_number character varying
);


ALTER TABLE person_info_extras OWNER TO clemence;

--
-- Name: person_info_extras_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE person_info_extras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_info_extras_id_seq OWNER TO clemence;

--
-- Name: person_info_extras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE person_info_extras_id_seq OWNED BY person_info_extras.id;


--
-- Name: person_infos; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE person_infos (
    id integer NOT NULL,
    surname character varying,
    other_names character varying,
    person_type_id character varying,
    entity_id integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    full_name character varying,
    dob date,
    reg_id integer,
    pd_sub boolean
);


ALTER TABLE person_infos OWNER TO clemence;

--
-- Name: person_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE person_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_infos_id_seq OWNER TO clemence;

--
-- Name: person_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE person_infos_id_seq OWNED BY person_infos.id;


--
-- Name: person_type_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE person_type_masters (
    id integer NOT NULL,
    user_type_title character varying,
    comment character varying,
    entity integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ref_id character varying
);


ALTER TABLE person_type_masters OWNER TO clemence;

--
-- Name: person_type_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE person_type_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_type_masters_id_seq OWNER TO clemence;

--
-- Name: person_type_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE person_type_masters_id_seq OWNED BY person_type_masters.id;


--
-- Name: pre_appointments; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE pre_appointments (
    id integer NOT NULL,
    provider_id integer,
    requester_id integer,
    requester_cat character varying,
    beneficiary_name character varying,
    appointment_type_id character varying,
    proposed_date timestamp without time zone,
    proposed_time time without time zone,
    complaint_desc character varying,
    prev_medical_history character varying,
    req_urgency character varying,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    confirm_status boolean,
    src character varying,
    allergies text,
    suburb_id integer,
    has_pd boolean,
    pd_name character varying,
    medication character varying,
    duration integer
);


ALTER TABLE pre_appointments OWNER TO clemence;

--
-- Name: pre_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE pre_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pre_appointments_id_seq OWNER TO clemence;

--
-- Name: pre_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE pre_appointments_id_seq OWNED BY pre_appointments.id;


--
-- Name: profesional_groups; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE profesional_groups (
    id integer NOT NULL,
    group_name character varying,
    comment character varying,
    user_id character varying,
    entity_id character varying,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE profesional_groups OWNER TO clemence;

--
-- Name: profesional_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE profesional_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profesional_groups_id_seq OWNER TO clemence;

--
-- Name: profesional_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE profesional_groups_id_seq OWNED BY profesional_groups.id;


--
-- Name: provider_engaged_users; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE provider_engaged_users (
    id integer NOT NULL,
    provider_id integer,
    person_id integer,
    comment character varying,
    user_id integer,
    entity_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE provider_engaged_users OWNER TO clemence;

--
-- Name: provider_engaged_users_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE provider_engaged_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE provider_engaged_users_id_seq OWNER TO clemence;

--
-- Name: provider_engaged_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE provider_engaged_users_id_seq OWNED BY provider_engaged_users.id;


--
-- Name: provider_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE provider_masters (
    id integer NOT NULL,
    provider_name character varying,
    alias character varying,
    provider_type_id integer,
    comment character varying,
    entity_id integer,
    user_id integer,
    active_status boolean,
    change_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE provider_masters OWNER TO clemence;

--
-- Name: provider_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE provider_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE provider_masters_id_seq OWNER TO clemence;

--
-- Name: provider_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE provider_masters_id_seq OWNED BY provider_masters.id;


--
-- Name: provider_services; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE provider_services (
    id integer NOT NULL,
    service_provider_id integer,
    service_id integer,
    comment character varying,
    entity_id integer,
    user_id integer,
    active_status boolean,
    change_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE provider_services OWNER TO clemence;

--
-- Name: provider_services_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE provider_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE provider_services_id_seq OWNER TO clemence;

--
-- Name: provider_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE provider_services_id_seq OWNED BY provider_services.id;


--
-- Name: region_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE region_masters (
    id integer NOT NULL,
    region_state_name character varying,
    comment character varying,
    country_id integer,
    entity_id integer,
    user_id integer,
    active_status boolean,
    change_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE region_masters OWNER TO clemence;

--
-- Name: region_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE region_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE region_masters_id_seq OWNER TO clemence;

--
-- Name: region_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE region_masters_id_seq OWNED BY region_masters.id;


--
-- Name: registration; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE registration (
    id integer NOT NULL,
    surname text NOT NULL,
    other_names text NOT NULL,
    mobile_number character(50),
    password text,
    status boolean,
    telco text,
    src text,
    verified boolean,
    email text,
    username text,
    user_type text,
    created_at time without time zone,
    surburb_id integer,
    registration_number integer,
    registration_board text,
    hospital_name text,
    specialty text,
    specialty_name text,
    user_id integer,
    user_uniq_code text
);


ALTER TABLE registration OWNER TO clemence;

--
-- Name: registration_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registration_id_seq OWNER TO clemence;

--
-- Name: registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE registration_id_seq OWNED BY registration.id;


--
-- Name: request_categories; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE request_categories (
    id integer NOT NULL,
    category character varying,
    ref_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE request_categories OWNER TO clemence;

--
-- Name: request_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE request_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE request_categories_id_seq OWNER TO clemence;

--
-- Name: request_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE request_categories_id_seq OWNED BY request_categories.id;


--
-- Name: request_urgencies; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE request_urgencies (
    id integer NOT NULL,
    urgency character varying,
    ref_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE request_urgencies OWNER TO clemence;

--
-- Name: request_urgencies_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE request_urgencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE request_urgencies_id_seq OWNER TO clemence;

--
-- Name: request_urgencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE request_urgencies_id_seq OWNED BY request_urgencies.id;


--
-- Name: requester_allergies; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE requester_allergies (
    id integer NOT NULL,
    pre_appointment_id integer,
    allergy_id integer,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE requester_allergies OWNER TO clemence;

--
-- Name: requester_allergies_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE requester_allergies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE requester_allergies_id_seq OWNER TO clemence;

--
-- Name: requester_allergies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE requester_allergies_id_seq OWNED BY requester_allergies.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id character varying,
    comment character varying,
    active_status boolean,
    del_status boolean
);


ALTER TABLE roles OWNER TO clemence;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO clemence;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO clemence;

--
-- Name: service_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE service_masters (
    id integer NOT NULL,
    title character varying,
    comment character varying,
    entity_id integer,
    user_id integer,
    active_status boolean,
    change_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE service_masters OWNER TO clemence;

--
-- Name: service_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE service_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE service_masters_id_seq OWNER TO clemence;

--
-- Name: service_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE service_masters_id_seq OWNED BY service_masters.id;


--
-- Name: service_prov_extra_infos; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE service_prov_extra_infos (
    id integer NOT NULL,
    service_prov_id integer,
    suburb_id integer,
    contact_number1 character varying,
    contact_number2 character varying,
    postal_address character varying,
    location_address character varying,
    contact_person_name character varying,
    web_url character varying,
    longitude character varying,
    latitude character varying,
    comment character varying,
    entity_id integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE service_prov_extra_infos OWNER TO clemence;

--
-- Name: service_prov_extra_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE service_prov_extra_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE service_prov_extra_infos_id_seq OWNER TO clemence;

--
-- Name: service_prov_extra_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE service_prov_extra_infos_id_seq OWNED BY service_prov_extra_infos.id;


--
-- Name: service_prov_types; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE service_prov_types (
    id integer NOT NULL,
    service_prov_type_title character varying,
    comment character varying,
    entity_id integer,
    user_id integer,
    active_status boolean,
    change_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE service_prov_types OWNER TO clemence;

--
-- Name: service_prov_types_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE service_prov_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE service_prov_types_id_seq OWNER TO clemence;

--
-- Name: service_prov_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE service_prov_types_id_seq OWNED BY service_prov_types.id;


--
-- Name: specialty_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE specialty_masters (
    id integer NOT NULL,
    title character varying,
    alias character varying,
    comment character varying,
    user_id character varying,
    entity_id character varying,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE specialty_masters OWNER TO clemence;

--
-- Name: specialty_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE specialty_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE specialty_masters_id_seq OWNER TO clemence;

--
-- Name: specialty_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE specialty_masters_id_seq OWNED BY specialty_masters.id;


--
-- Name: suburb_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE suburb_masters (
    id integer NOT NULL,
    suburb_name character varying,
    comment character varying,
    city_town_id integer,
    entity_id integer,
    user_id integer,
    active_status boolean,
    change_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE suburb_masters OWNER TO clemence;

--
-- Name: suburb_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE suburb_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE suburb_masters_id_seq OWNER TO clemence;

--
-- Name: suburb_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE suburb_masters_id_seq OWNED BY suburb_masters.id;


--
-- Name: user_services; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE user_services (
    id integer NOT NULL,
    service_desc character varying,
    service_alias character varying,
    comment character varying,
    entity_id integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE user_services OWNER TO clemence;

--
-- Name: user_services_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE user_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_services_id_seq OWNER TO clemence;

--
-- Name: user_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE user_services_id_seq OWNED BY user_services.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    person_id integer,
    username character varying,
    active_status boolean,
    del_status boolean,
    profile_file_name character varying,
    profile_content_type character varying,
    profile_file_size integer,
    profile_updated_at timestamp without time zone,
    role_id integer
);


ALTER TABLE users OWNER TO clemence;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO clemence;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: affected_system_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY affected_system_masters ALTER COLUMN id SET DEFAULT nextval('affected_system_masters_id_seq'::regclass);


--
-- Name: allergies_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY allergies_masters ALTER COLUMN id SET DEFAULT nextval('allergies_masters_id_seq'::regclass);


--
-- Name: appointment_types id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY appointment_types ALTER COLUMN id SET DEFAULT nextval('appointment_types_id_seq'::regclass);


--
-- Name: city_town_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY city_town_masters ALTER COLUMN id SET DEFAULT nextval('city_town_masters_id_seq'::regclass);


--
-- Name: condition_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY condition_masters ALTER COLUMN id SET DEFAULT nextval('condition_masters_id_seq'::regclass);


--
-- Name: confirmed_appointments id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY confirmed_appointments ALTER COLUMN id SET DEFAULT nextval('confirmed_appointments_id_seq'::regclass);


--
-- Name: confirmed_conditions id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY confirmed_conditions ALTER COLUMN id SET DEFAULT nextval('confirmed_conditions_id_seq'::regclass);


--
-- Name: confirmed_personal_doctor_services id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY confirmed_personal_doctor_services ALTER COLUMN id SET DEFAULT nextval('confirmed_personal_doctor_services_id_seq'::regclass);


--
-- Name: country_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY country_masters ALTER COLUMN id SET DEFAULT nextval('country_masters_id_seq'::regclass);


--
-- Name: engaged_user_services id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY engaged_user_services ALTER COLUMN id SET DEFAULT nextval('engaged_user_services_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: lab_detail_images id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY lab_detail_images ALTER COLUMN id SET DEFAULT nextval('lab_detail_images_id_seq'::regclass);


--
-- Name: lab_details id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY lab_details ALTER COLUMN id SET DEFAULT nextval('lab_details_id_seq'::regclass);


--
-- Name: lab_services id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY lab_services ALTER COLUMN id SET DEFAULT nextval('lab_services_id_seq'::regclass);


--
-- Name: password_table id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY password_table ALTER COLUMN id SET DEFAULT nextval('password_table_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- Name: permissions_roles id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY permissions_roles ALTER COLUMN id SET DEFAULT nextval('permissions_roles_id_seq'::regclass);


--
-- Name: person_contact_infos id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY person_contact_infos ALTER COLUMN id SET DEFAULT nextval('person_contact_infos_id_seq'::regclass);


--
-- Name: person_info_extras id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY person_info_extras ALTER COLUMN id SET DEFAULT nextval('person_info_extras_id_seq'::regclass);


--
-- Name: person_infos id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY person_infos ALTER COLUMN id SET DEFAULT nextval('person_infos_id_seq'::regclass);


--
-- Name: person_type_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY person_type_masters ALTER COLUMN id SET DEFAULT nextval('person_type_masters_id_seq'::regclass);


--
-- Name: pre_appointments id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY pre_appointments ALTER COLUMN id SET DEFAULT nextval('pre_appointments_id_seq'::regclass);


--
-- Name: profesional_groups id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY profesional_groups ALTER COLUMN id SET DEFAULT nextval('profesional_groups_id_seq'::regclass);


--
-- Name: provider_engaged_users id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY provider_engaged_users ALTER COLUMN id SET DEFAULT nextval('provider_engaged_users_id_seq'::regclass);


--
-- Name: provider_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY provider_masters ALTER COLUMN id SET DEFAULT nextval('provider_masters_id_seq'::regclass);


--
-- Name: provider_services id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY provider_services ALTER COLUMN id SET DEFAULT nextval('provider_services_id_seq'::regclass);


--
-- Name: region_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY region_masters ALTER COLUMN id SET DEFAULT nextval('region_masters_id_seq'::regclass);


--
-- Name: registration id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY registration ALTER COLUMN id SET DEFAULT nextval('registration_id_seq'::regclass);


--
-- Name: request_categories id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY request_categories ALTER COLUMN id SET DEFAULT nextval('request_categories_id_seq'::regclass);


--
-- Name: request_urgencies id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY request_urgencies ALTER COLUMN id SET DEFAULT nextval('request_urgencies_id_seq'::regclass);


--
-- Name: requester_allergies id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY requester_allergies ALTER COLUMN id SET DEFAULT nextval('requester_allergies_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: service_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY service_masters ALTER COLUMN id SET DEFAULT nextval('service_masters_id_seq'::regclass);


--
-- Name: service_prov_extra_infos id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY service_prov_extra_infos ALTER COLUMN id SET DEFAULT nextval('service_prov_extra_infos_id_seq'::regclass);


--
-- Name: service_prov_types id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY service_prov_types ALTER COLUMN id SET DEFAULT nextval('service_prov_types_id_seq'::regclass);


--
-- Name: specialty_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY specialty_masters ALTER COLUMN id SET DEFAULT nextval('specialty_masters_id_seq'::regclass);


--
-- Name: suburb_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY suburb_masters ALTER COLUMN id SET DEFAULT nextval('suburb_masters_id_seq'::regclass);


--
-- Name: user_services id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY user_services ALTER COLUMN id SET DEFAULT nextval('user_services_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: affected_system_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY affected_system_masters (id, title, comment, user_id, entity_id, active_status, del_status, created_at, updated_at) FROM stdin;
\.


--
-- Name: affected_system_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('affected_system_masters_id_seq', 1, false);


--
-- Data for Name: allergies_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY allergies_masters (id, title, comment, user_id, entity, active_status, del_status, created_at, updated_at) FROM stdin;
2	Milk		\N	\N	t	f	2017-11-05 08:58:08.114192	2017-11-05 08:58:19.026531
3	Bean		\N	\N	t	f	2017-11-05 09:42:31.703436	2017-11-05 09:42:31.703436
4	Sausage		\N	\N	t	f	2017-11-05 09:42:46.639967	2017-11-05 09:42:46.639967
5	Bandages		\N	\N	t	f	2017-11-09 20:40:55.336562	2017-11-09 20:40:55.336562
6	Rubber Balls		\N	\N	t	f	2017-11-09 20:41:26.625738	2017-11-09 20:41:26.625738
7	Tree Nut		\N	\N	t	f	2017-11-09 20:42:01.978695	2017-11-09 20:42:01.978695
8	Egg		\N	\N	t	f	2017-11-10 16:14:26.769251	2017-11-11 21:38:45.194899
1	Soy		\N	\N	t	f	2017-11-03 17:32:22.79218	2017-11-15 11:39:28.573513
\.


--
-- Name: allergies_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('allergies_masters_id_seq', 8, true);


--
-- Data for Name: appointment_types; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY appointment_types (id, title, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, ref_id) FROM stdin;
3	Medical Appointment		\N	\N	t	f	2017-11-03 15:35:33.014002	2017-11-11 21:35:44.643348	MA
2	Lab Appointment		\N	\N	t	f	2017-11-03 15:34:19.104094	2017-11-11 21:35:50.556253	LA
1	Personal Doctor		\N	\N	t	f	2017-11-03 15:32:15.688844	2017-11-11 21:35:55.94589	PD
4	Phone Consult		\N	\N	t	f	2018-01-15 12:45:25.911947	2018-01-15 12:45:25.911947	PC
5	Video Consult		\N	\N	t	f	2018-01-15 13:59:42.981852	2018-01-15 13:59:42.981852	VC
6	Home Care		\N	\N	t	f	2018-01-15 14:01:17.50989	2018-01-15 14:01:17.50989	HC
7	Digital Prescription		\N	\N	t	f	2018-01-15 14:03:50.06554	2018-01-15 14:03:50.06554	DP
8	Personal Doctor Home Care		\N	\N	t	f	2018-01-22 12:54:11.055639	2018-01-22 12:54:11.055639	PDHC
9	Personal Doctor Digital Prescription		\N	\N	t	f	2018-01-22 12:56:40.65267	2018-01-22 12:56:40.65267	PDDP
10	Personal Doctor Video Consult		\N	\N	t	f	2018-01-22 12:57:44.649728	2018-01-22 12:57:44.649728	PDVC
11	Medication		\N	\N	t	f	2018-02-27 18:11:07.9552	2018-02-27 18:11:07.9552	MD
\.


--
-- Name: appointment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('appointment_types_id_seq', 11, true);


--
-- Data for Name: city_town_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY city_town_masters (id, city_town_name, comment, region_id, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
2	Chita		2	\N	\N	t	\N	2017-11-07 10:41:07.584132	2017-11-11 20:58:08.522519
3	Techiman		4	\N	36	t	\N	2017-11-21 18:02:25.02934	2018-01-25 14:34:17.585704
1	Madina		1	\N	36	t	\N	2017-11-02 13:20:31.068055	2018-01-25 14:36:47.228421
\.


--
-- Name: city_town_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('city_town_masters_id_seq', 3, true);


--
-- Data for Name: condition_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY condition_masters (id, condition_name, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Chickenpox		\N	t	f	2017-11-23 13:16:28.606664	2017-11-23 15:01:26.148789
2	Thrush		\N	t	f	2017-11-23 15:26:29.911776	2017-11-23 15:26:29.911776
3	Depression		\N	t	f	2017-11-23 15:26:49.12286	2017-11-23 15:26:49.12286
4	Sciatica		\N	t	f	2017-11-23 15:27:05.896714	2017-11-23 15:27:05.896714
5	Norovirus Infections		\N	t	f	2017-11-23 15:27:22.325837	2017-11-23 15:27:22.325837
6	Diabetes		\N	t	f	2017-11-23 15:27:42.275418	2017-11-23 15:27:42.275418
7	Menopause		\N	t	f	2017-11-23 15:28:01.285148	2017-11-23 15:28:01.285148
8	Glandular Fever		\N	t	f	2017-11-23 15:28:18.20646	2017-11-23 15:28:18.20646
9	Kidney Infection		\N	t	f	2017-11-23 15:28:39.986979	2017-11-23 15:28:39.986979
10	Measles		\N	t	f	2017-11-23 15:29:00.493336	2017-11-23 15:29:00.493336
11	Mumps		\N	t	f	2017-11-23 15:29:22.379387	2017-11-23 15:29:22.379387
12	Eczema		\N	t	f	2017-11-23 15:29:41.376973	2017-11-23 15:29:41.376973
\.


--
-- Name: condition_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('condition_masters_id_seq', 12, true);


--
-- Data for Name: confirmed_appointments; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY confirmed_appointments (id, pre_appointment_id, provider_id, complaint_desc, confirmed_date, confirmed_time, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, suburb_id, doctor_id, patient_id, attended_to) FROM stdin;
97	92	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 16:53:32.312753	2018-03-02 16:53:32.312753	2	\N	80	\N
98	92	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 16:53:46.23152	2018-03-02 16:53:46.23152	2	37	80	\N
99	92	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 16:54:47.907383	2018-03-02 16:54:47.907383	2	37	80	\N
100	97	2		2018-03-02 11:19:00	\N		83	\N	t	f	2018-03-02 17:20:23.442402	2018-03-04 11:48:39.552547	2	37	80	f
1	1	\N	\N	2018-01-18 12:08:00	\N	\N	\N	\N	t	f	2018-01-18 12:08:04.423257	2018-01-18 12:08:04.423257	\N	\N	\N	t
78	77	\N		2018-02-16 17:05:00	\N		36	\N	t	f	2018-02-16 17:05:40.747939	2018-02-28 11:16:30.705191	\N	66	71	f
77	66	\N		2018-02-16 16:44:00	\N		36	\N	t	f	2018-02-16 16:44:24.878959	2018-02-28 13:02:55.176473	\N	66	35	f
80	82	\N		2018-02-28 16:19:00	\N		36	\N	t	f	2018-02-28 16:20:01.216311	2018-02-28 16:20:01.216311	\N	\N	\N	f
81	82	\N		2018-02-28 17:06:00	\N		36	\N	t	f	2018-02-28 17:06:36.108323	2018-02-28 17:06:36.114264	\N	63	71	f
82	85	\N		2018-03-01 17:24:00	\N		36	\N	t	f	2018-02-28 17:26:48.842235	2018-02-28 17:26:48.848071	\N	63	71	f
83	86	\N		2018-03-01 17:29:00	\N		36	\N	t	f	2018-02-28 17:29:50.440274	2018-02-28 17:29:50.445181	\N	63	71	f
79	81	\N		2018-02-28 16:17:00	\N		36	\N	t	f	2018-02-28 16:17:19.385871	2018-03-01 08:40:42.591091	\N	63	71	t
84	90	\N		2018-03-01 10:37:00	\N	<p><span style="font-family: verdana, arial, helvetica, sans-serif; font-size: 13px; background-color: #f9f9f9;">Headache Cold</span></p>	36	\N	t	f	2018-03-01 10:38:03.35699	2018-03-01 10:38:03.363286	\N	63	71	f
85	72	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-01 15:23:19.976449	2018-03-01 15:23:19.976449	1	63	71	\N
86	72	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-01 16:18:32.976707	2018-03-01 16:18:32.976707	1	63	71	\N
2	2	\N	\N	2018-01-18 14:25:00	\N	\N	\N	\N	t	f	2018-01-18 14:25:33.299918	2018-01-18 14:25:33.299918	\N	\N	\N	t
73	73	\N	\N	2018-02-15 15:28:00	\N	\N	\N	\N	t	f	2018-02-15 15:28:11.566797	2018-02-15 15:28:11.566797	1	\N	\N	t
74	74	\N	\N	2018-02-16 10:01:00	\N	\N	\N	\N	t	f	2018-02-16 10:01:45.923516	2018-02-16 10:01:45.923516	1	\N	\N	t
76	76	\N		2018-02-16 12:56:00	\N		36	\N	t	f	2018-02-16 12:56:57.603485	2018-02-16 12:56:57.603485	\N	\N	\N	t
3	4	\N		2018-01-26 16:14:00	\N		\N	\N	t	f	2018-01-18 16:14:45.471948	2018-01-19 15:41:28.247025	1	\N	\N	t
4	9	\N	\N	2018-01-19 13:00:00	\N	\N	\N	\N	t	f	2018-01-19 13:00:11.252573	2018-01-19 15:41:59.400105	2	\N	\N	t
5	13	\N	\N	2018-01-22 10:19:00	\N	\N	\N	\N	t	f	2018-01-22 10:19:48.702459	2018-01-22 10:19:48.702459	1	\N	\N	t
6	8	\N		2018-01-22 11:05:00	\N		\N	\N	t	f	2018-01-22 11:11:04.448488	2018-01-22 11:11:04.448488	\N	\N	\N	t
7	8	\N		2018-01-22 11:13:00	\N		\N	\N	t	f	2018-01-22 11:13:42.504051	2018-01-22 11:13:42.504051	\N	\N	\N	t
8	8	\N		2018-01-22 11:17:00	\N		\N	\N	t	f	2018-01-22 11:18:03.342764	2018-01-22 11:18:03.342764	\N	\N	\N	t
9	8	\N		2018-01-22 11:20:00	\N		\N	\N	t	f	2018-01-22 11:21:03.220455	2018-01-22 11:21:03.220455	\N	\N	\N	t
10	8	\N		2018-01-22 11:38:00	\N		\N	\N	t	f	2018-01-22 11:38:06.579239	2018-01-22 11:38:06.579239	\N	\N	\N	t
11	8	\N		2018-01-22 11:43:00	\N		\N	\N	t	f	2018-01-22 11:43:18.885326	2018-01-22 11:43:18.885326	\N	\N	\N	t
12	15	\N	\N	2018-01-22 11:53:00	\N	\N	\N	\N	t	f	2018-01-22 11:53:28.859225	2018-01-22 11:53:28.859225	1	\N	\N	t
13	17	\N		2018-01-22 12:02:00	\N		\N	\N	t	f	2018-01-22 12:02:13.037743	2018-01-22 12:02:13.037743	\N	\N	\N	t
14	16	\N		2018-01-22 12:29:00	\N		\N	\N	t	f	2018-01-22 12:29:38.659093	2018-01-22 12:29:38.659093	\N	\N	\N	t
15	19	\N	\N	2018-01-23 09:57:00	\N	\N	\N	\N	t	f	2018-01-23 09:57:49.192579	2018-01-23 09:59:29.175167	1	\N	\N	t
16	20	\N		2018-01-23 10:04:00	\N		\N	\N	t	f	2018-01-23 10:05:57.30684	2018-01-23 10:05:57.30684	\N	\N	\N	t
17	20	\N		2018-01-23 10:04:00	\N		\N	\N	t	f	2018-01-23 10:05:57.536501	2018-01-23 10:05:57.536501	\N	\N	\N	t
18	20	\N		2018-01-23 10:04:00	\N		\N	\N	t	f	2018-01-23 10:05:58.75989	2018-01-23 10:05:58.75989	\N	\N	\N	t
19	22	\N	\N	2018-01-23 20:02:00	\N	\N	\N	\N	t	f	2018-01-23 20:02:07.793737	2018-01-23 20:02:07.793737	1	\N	\N	t
20	22	\N	\N	2018-01-23 20:06:00	\N	\N	\N	\N	t	f	2018-01-23 20:06:01.522809	2018-01-23 20:06:01.522809	1	\N	\N	t
21	22	\N	\N	2018-01-23 20:10:00	\N	\N	\N	\N	t	f	2018-01-23 20:10:18.223997	2018-01-23 20:10:18.223997	1	\N	\N	t
22	24	\N	<p>hotcakes&nbsp;</p>	2018-01-23 23:17:00	\N	<p>for sale</p>	\N	\N	t	f	2018-01-23 20:17:07.66259	2018-01-23 20:17:07.66259	1	\N	\N	t
23	25	\N	<p>diarrhoea</p>	2018-01-24 04:21:00	\N	<p>vomityying&nbsp;</p>	\N	\N	t	f	2018-01-23 20:22:11.042178	2018-01-23 20:22:11.042178	1	\N	\N	t
24	31	\N	\N	2018-01-23 20:42:00	\N	\N	\N	\N	t	f	2018-01-23 20:42:47.868279	2018-01-23 20:42:47.868279	1	\N	\N	t
25	36	\N		2018-01-24 10:22:00	\N		\N	\N	t	f	2018-01-24 10:22:56.048543	2018-01-24 10:22:56.048543	\N	\N	\N	t
26	35	\N		2018-01-30 10:43:00	\N		36	\N	t	f	2018-01-24 10:43:45.318606	2018-01-24 10:43:45.318606	\N	\N	\N	t
27	50	\N	\N	2018-01-29 18:38:00	\N	\N	\N	\N	t	f	2018-01-29 18:38:18.160362	2018-01-29 18:38:18.160362	1	\N	\N	t
28	49	\N	\N	2018-01-29 18:38:00	\N	\N	\N	\N	t	f	2018-01-29 18:38:55.1772	2018-01-29 18:38:55.1772	1	\N	\N	t
29	53	\N	<p>hey</p>	2018-01-29 22:41:00	\N	<p>html</p>	32	\N	t	f	2018-01-29 19:42:01.266569	2018-01-29 19:42:01.266569	1	\N	\N	t
30	54	6	<p>hey boy</p>	2018-01-29 22:47:00	\N	<p>ccsd</p>	32	\N	t	f	2018-01-29 19:47:34.845053	2018-01-29 19:47:34.845053	2	\N	\N	t
31	52	\N	<p>bbn</p>	2018-01-30 22:57:00	\N	<p>hffhjhj</p>	32	\N	t	f	2018-01-29 19:58:11.375803	2018-01-29 19:58:11.375803	\N	\N	\N	t
32	56	\N	<p>hghkj</p>	2018-01-29 22:59:00	\N	<p>vhj,</p>	32	\N	t	f	2018-01-29 19:59:14.669268	2018-01-29 19:59:14.669268	\N	\N	\N	t
33	55	\N	<p>ytyuyil</p>	2018-01-29 22:59:00	\N	<p>hjgjhkl,</p>	32	\N	t	f	2018-01-29 20:00:04.264861	2018-01-29 20:00:04.264861	\N	\N	\N	t
34	54	\N		2018-01-31 15:03:00	\N		36	\N	t	f	2018-01-30 15:03:11.729895	2018-01-30 15:03:11.729895	\N	\N	\N	t
35	55	\N		2018-02-02 11:40:00	\N		36	\N	t	f	2018-02-02 11:40:19.725164	2018-02-02 11:40:19.725164	\N	\N	\N	t
36	64	\N		2018-02-02 12:28:00	\N		36	\N	t	f	2018-02-02 12:28:37.297625	2018-02-02 12:28:37.297625	\N	\N	\N	t
37	62	\N		2018-02-02 12:37:00	\N		36	\N	t	f	2018-02-02 12:37:47.599828	2018-02-02 12:37:47.599828	\N	\N	\N	t
38	65	\N		2018-02-02 12:38:00	\N		36	\N	t	f	2018-02-02 12:38:05.001233	2018-02-02 12:38:05.001233	\N	\N	\N	t
39	63	\N		2018-02-02 12:46:00	\N		36	\N	t	f	2018-02-02 12:46:49.836102	2018-02-02 12:46:49.836102	\N	\N	\N	t
40	51	\N		2018-02-02 14:01:00	\N		36	\N	t	f	2018-02-02 14:01:03.635897	2018-02-02 14:01:03.635897	\N	\N	\N	t
43	63	\N		2018-02-05 14:35:00	\N		36	\N	t	f	2018-02-05 14:35:52.166066	2018-02-05 14:35:52.166066	\N	\N	\N	t
45	61	\N		2018-02-05 14:43:00	\N		36	\N	t	f	2018-02-05 14:43:18.510329	2018-02-05 14:43:18.510329	\N	\N	\N	t
46	59	\N		2018-02-05 14:44:00	\N		36	\N	t	f	2018-02-05 14:44:31.639545	2018-02-05 14:44:31.639545	\N	\N	\N	t
47	62	\N		2018-02-05 14:57:00	\N		36	\N	t	f	2018-02-05 14:57:23.968081	2018-02-05 14:57:23.968081	\N	\N	\N	t
48	63	\N		2018-02-05 15:10:00	\N		36	\N	t	f	2018-02-05 15:10:07.936747	2018-02-05 15:10:07.936747	\N	\N	\N	t
49	62	\N		2018-02-05 15:11:00	\N		36	\N	t	f	2018-02-05 15:11:37.046636	2018-02-05 15:11:37.046636	\N	\N	\N	t
50	59	\N		2018-02-05 15:16:00	\N		36	\N	t	f	2018-02-05 15:16:43.088349	2018-02-05 15:16:43.088349	\N	\N	\N	t
51	62	\N		2018-02-05 15:21:00	\N		36	\N	t	f	2018-02-05 15:21:01.068659	2018-02-05 15:21:01.068659	\N	\N	\N	t
52	62	\N		2018-02-06 15:26:00	\N		36	\N	t	f	2018-02-05 15:26:39.310198	2018-02-05 15:26:39.310198	\N	\N	\N	t
53	62	\N		2018-02-05 15:29:00	\N		36	\N	t	f	2018-02-05 15:28:59.925904	2018-02-05 15:28:59.925904	\N	\N	\N	t
54	62	\N		2018-02-05 15:31:00	\N		36	\N	t	f	2018-02-05 15:31:24.835495	2018-02-05 15:31:24.835495	\N	\N	\N	t
55	62	\N		2018-02-05 15:33:00	\N		36	\N	t	f	2018-02-05 15:33:15.115773	2018-02-05 15:33:15.115773	\N	\N	\N	t
56	62	\N		2018-02-05 15:34:00	\N		36	\N	t	f	2018-02-05 15:34:27.304394	2018-02-05 15:34:27.304394	\N	\N	\N	t
57	58	\N	\N	2018-02-05 15:34:00	\N	\N	\N	\N	t	f	2018-02-05 15:34:54.695533	2018-02-05 15:34:54.695533	1	\N	\N	t
59	65	\N		2018-02-05 16:59:00	\N		36	\N	t	f	2018-02-05 16:59:24.060929	2018-02-05 16:59:24.060929	\N	\N	\N	t
60	47	\N		2018-02-06 17:15:00	\N		36	\N	t	f	2018-02-05 17:15:34.136208	2018-02-05 17:15:34.136208	\N	\N	\N	t
61	48	\N		2018-02-07 17:16:00	\N		36	\N	t	f	2018-02-05 17:16:38.827448	2018-02-05 17:16:38.827448	\N	\N	\N	t
62	67	\N	\N	2018-02-05 22:46:00	\N	\N	\N	\N	t	f	2018-02-05 22:46:51.143488	2018-02-05 22:46:51.143488	1	\N	\N	t
63	57	\N	\N	2018-02-06 11:51:00	\N	\N	\N	\N	t	f	2018-02-06 11:51:27.035175	2018-02-06 11:51:27.035175	1	\N	\N	t
64	42	\N		2018-02-06 11:51:00	\N		36	\N	t	f	2018-02-06 11:52:02.337635	2018-02-06 11:52:02.337635	\N	\N	\N	t
65	60	\N		2018-02-06 12:05:00	\N		36	\N	t	f	2018-02-06 12:05:56.383956	2018-02-06 12:05:56.383956	\N	56	35	t
66	68	1	<p>dr koby&nbsp;</p>	2018-02-28 20:34:00	\N	<p>wants to see dr koby&nbsp;</p>	32	\N	t	f	2018-02-14 17:37:48.708438	2018-02-14 17:37:48.708438	1	\N	\N	t
67	69	1	<p>head</p>	2018-02-28 21:04:00	\N	<p>urgent ned</p>	32	\N	t	f	2018-02-14 18:10:05.470354	2018-02-14 18:10:05.470354	1	\N	\N	t
68	70	\N	\N	2018-02-14 18:14:00	\N	\N	\N	\N	t	f	2018-02-14 18:14:14.483956	2018-02-14 18:14:14.483956	1	\N	\N	t
69	70	\N	\N	2018-02-14 18:14:00	\N	\N	\N	\N	t	f	2018-02-14 18:14:26.076991	2018-02-14 18:14:26.076991	1	\N	\N	t
70	70	\N	\N	2018-02-14 18:14:00	\N	\N	\N	\N	t	f	2018-02-14 18:14:39.676657	2018-02-14 18:14:39.676657	1	\N	\N	t
71	70	\N	\N	2018-02-14 18:14:00	\N	\N	\N	\N	t	f	2018-02-14 18:14:41.662289	2018-02-14 18:14:41.662289	1	\N	\N	t
72	70	\N	\N	2018-02-14 18:14:00	\N	\N	\N	\N	t	f	2018-02-14 18:14:42.574703	2018-02-14 18:14:42.574703	1	\N	\N	t
87	71	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 10:12:00.711499	2018-03-02 10:12:00.711499	1	63	71	\N
88	71	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 10:18:26.144084	2018-03-02 10:18:26.144084	1	63	71	\N
89	71	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 10:19:41.721611	2018-03-02 10:19:41.721611	1	63	71	\N
90	71	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 10:20:36.816744	2018-03-02 10:20:36.816744	1	63	71	\N
91	71	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 10:21:14.951022	2018-03-02 10:21:14.951022	1	63	71	\N
92	71	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 10:26:54.182863	2018-03-02 10:26:54.182863	1	63	71	\N
93	71	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 10:28:12.529529	2018-03-02 10:28:12.529529	1	63	71	\N
94	71	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 10:31:28.651847	2018-03-02 10:31:28.651847	1	63	71	\N
95	71	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 10:52:21.654334	2018-03-02 10:52:21.654334	1	63	71	\N
96	71	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 10:53:24.214973	2018-03-02 10:53:24.214973	1	63	71	\N
\.


--
-- Name: confirmed_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('confirmed_appointments_id_seq', 100, true);


--
-- Data for Name: confirmed_conditions; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY confirmed_conditions (id, confirmed_appointment_id, condition_id, allergy_id, comment, user_id, entity, active_status, del_status, created_at, updated_at) FROM stdin;
1	1	1	\N		\N	\N	t	f	2017-11-23 18:59:09.812393	2017-11-23 18:59:09.812393
2	1	2	\N		\N	\N	t	f	2017-11-23 18:59:09.836944	2017-11-23 18:59:09.836944
3	1	3	\N		\N	\N	t	f	2017-11-23 18:59:09.848212	2017-11-23 18:59:09.848212
4	2	1	\N		\N	\N	t	f	2017-11-24 10:53:26.691225	2017-11-24 10:53:26.691225
5	2	2	\N		\N	\N	t	f	2017-11-24 10:53:26.700231	2017-11-24 10:53:26.700231
6	2	3	\N		\N	\N	t	f	2017-11-24 10:53:26.708483	2017-11-24 10:53:26.708483
7	2	4	\N		\N	\N	t	f	2017-11-24 10:53:26.716917	2017-11-24 10:53:26.716917
8	2	9	\N		\N	\N	t	f	2017-11-24 10:53:26.725271	2017-11-24 10:53:26.725271
9	3	8	\N		\N	\N	t	f	2017-11-26 18:19:27.959096	2017-11-26 18:19:27.959096
10	1	\N	\N		\N	\N	t	f	2017-12-07 12:20:57.83446	2017-12-07 12:20:57.83446
\.


--
-- Name: confirmed_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('confirmed_conditions_id_seq', 10, true);


--
-- Data for Name: confirmed_personal_doctor_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY confirmed_personal_doctor_services (id, doctor_id, patient_id, comment, entity_id, user_id, active_status, del_status, created_at, updated_at, pre_appointment_id, suburb_id, appointment_type_id, confirmed_appointment_id) FROM stdin;
2	32	35		\N	\N	t	f	2018-01-18 14:25:33.306025	2018-01-18 14:25:33.306025	2	1	PD	2
3	38	44		\N	\N	t	f	2018-01-19 13:00:11.2581	2018-01-19 15:42:32.007646	9	2	PD	4
1	32	35		\N	\N	f	f	2018-01-18 12:08:04.42902	2018-01-22 10:24:56.861975	1	1	PD	1
4	32	35	\N	\N	36	t	f	2018-01-22 11:13:42.518974	2018-01-22 11:13:42.518974	8	2	PC	7
5	32	35	\N	\N	36	t	f	2018-01-22 11:43:18.891619	2018-01-22 11:43:18.891619	8	2	PC	11
6	45	46		\N	\N	t	f	2018-01-22 11:53:28.864992	2018-01-22 11:53:28.864992	15	1	PD	12
7	45	46	\N	\N	36	t	f	2018-01-22 12:02:13.043651	2018-01-22 12:02:13.043651	17	6	PC	13
8	45	46	\N	\N	36	t	f	2018-01-22 12:29:38.674263	2018-01-22 12:29:38.674263	16	6	PC	14
9	45	49		\N	\N	t	f	2018-01-23 09:57:49.198024	2018-01-23 10:02:51.971679	19	1	PD	15
10	45	49	\N	\N	36	t	f	2018-01-23 10:05:57.312633	2018-01-23 10:05:57.312633	20	9	PC	16
11	45	49	\N	\N	36	t	f	2018-01-23 10:05:57.540814	2018-01-23 10:05:57.540814	20	9	PC	17
12	45	49	\N	\N	36	t	f	2018-01-23 10:05:58.764254	2018-01-23 10:05:58.764254	20	9	PC	18
13	32	54		\N	\N	t	f	2018-01-23 20:10:18.232024	2018-01-23 20:10:18.232024	22	1	PD	21
14	32	54	\N	\N	32	t	f	2018-01-23 20:17:07.669324	2018-01-23 20:17:07.669324	24	13	PC	22
15	32	54	\N	\N	32	t	f	2018-01-23 20:22:11.048111	2018-01-23 20:22:11.048111	25	13	PC	23
16	32	55		\N	\N	t	f	2018-01-23 20:42:47.873878	2018-01-23 20:42:47.873878	31	1	PD	24
17	32	35	\N	\N	36	t	f	2018-01-24 10:22:56.055226	2018-01-24 10:22:56.055226	36	2	PC	25
18	32	35	\N	\N	36	t	f	2018-01-24 10:43:45.324828	2018-01-24 10:43:45.324828	35	2	PC	26
19	51	47		\N	\N	t	f	2018-01-29 18:38:18.166281	2018-01-29 18:38:18.166281	50	1	PD	27
20	32	47		\N	\N	t	f	2018-01-29 18:38:55.183092	2018-01-29 18:38:55.183092	49	1	PD	28
21	51	47	\N	\N	32	t	f	2018-01-29 19:42:01.274403	2018-01-29 19:42:01.274403	53	19	PC	29
22	51	47	\N	\N	32	t	f	2018-01-29 19:58:11.382084	2018-01-29 19:58:11.382084	52	19	PC	31
23	51	47	\N	\N	36	t	f	2018-01-30 15:03:11.736761	2018-01-30 15:03:11.736761	54	19	PDVC	34
24	51	47	\N	\N	36	t	f	2018-02-02 11:40:19.745072	2018-02-02 11:40:19.745072	55	19	PDVC	35
25	32	35	\N	\N	36	t	f	2018-02-02 12:28:37.303862	2018-02-02 12:28:37.303862	64	2	MA	36
26	32	35	\N	\N	36	t	f	2018-02-02 12:37:47.60626	2018-02-02 12:37:47.60626	62	2	MA	37
27	32	35	\N	\N	36	t	f	2018-02-02 12:38:05.008571	2018-02-02 12:38:05.008571	65	2	VC	38
28	32	35	\N	\N	36	t	f	2018-02-02 12:46:49.842374	2018-02-02 12:46:49.842374	63	2	MA	39
29	51	47	\N	\N	36	t	f	2018-02-02 14:01:03.641968	2018-02-02 14:01:03.641968	51	19	MA	40
30	32	35	\N	\N	36	t	f	2018-02-02 16:07:08.058723	2018-02-02 16:07:08.058723	66	2	VC	41
31	32	35	\N	\N	36	t	f	2018-02-02 16:32:46.564896	2018-02-02 16:32:46.564896	66	2	VC	42
38	45	58		\N	\N	t	f	2018-02-05 15:34:54.701555	2018-02-05 15:34:54.701555	58	1	PD	57
39	45	49	\N	\N	36	t	f	2018-02-05 17:16:38.833194	2018-02-05 17:16:38.833194	48	9	PC	61
40	51	59		\N	\N	t	f	2018-02-05 22:46:51.153095	2018-02-05 22:46:51.153095	67	1	PD	62
41	45	58		\N	\N	t	f	2018-02-06 11:51:27.041198	2018-02-06 11:51:27.041198	57	1	PD	63
42	32	35	\N	\N	36	t	f	2018-02-06 11:52:02.343817	2018-02-06 11:52:02.343817	42	2	PC	64
45	45	71	\N	\N	36	t	f	2018-02-16 12:56:57.623051	2018-02-16 12:56:57.623051	76	43	PC	76
43	63	71		\N	\N	t	f	2018-02-15 15:28:11.572623	2018-02-28 16:15:17.062986	73	1	PD	73
46	63	71	\N	\N	36	t	f	2018-02-28 16:20:01.222708	2018-02-28 16:20:01.222708	82	43	PDHC	80
47	63	71	\N	\N	36	t	f	2018-02-28 17:06:36.117428	2018-02-28 17:06:36.117428	82	1	PDHC	81
48	63	71	\N	\N	36	t	f	2018-02-28 17:26:48.850865	2018-02-28 17:26:48.850865	85	1	PC	82
49	63	71	\N	\N	36	t	f	2018-02-28 17:29:50.447583	2018-02-28 17:29:50.447583	86	1	PDVC	83
50	63	71	\N	\N	36	t	f	2018-03-01 10:38:03.366246	2018-03-01 10:38:03.366246	90	1	DP	84
51	63	71		\N	\N	t	f	2018-03-01 15:23:19.982149	2018-03-01 15:23:19.982149	72	1	PD	85
52	63	71		\N	\N	t	f	2018-03-01 16:18:32.982477	2018-03-01 16:18:32.982477	72	1	PD	86
53	63	71		\N	\N	t	f	2018-03-02 10:12:00.71759	2018-03-02 10:12:00.71759	71	1	PD	87
54	63	71		\N	\N	t	f	2018-03-02 10:18:26.149642	2018-03-02 10:18:26.149642	71	1	PD	88
55	63	71		\N	\N	t	f	2018-03-02 10:19:41.730037	2018-03-02 10:19:41.730037	71	1	PD	89
56	63	71		\N	\N	t	f	2018-03-02 10:20:36.822343	2018-03-02 10:20:36.822343	71	1	PD	90
57	63	71		\N	\N	t	f	2018-03-02 10:21:14.956817	2018-03-02 10:21:14.956817	71	1	PD	91
58	63	71		\N	\N	t	f	2018-03-02 10:26:54.188624	2018-03-02 10:26:54.188624	71	1	PD	92
59	63	71		\N	\N	t	f	2018-03-02 10:28:12.53557	2018-03-02 10:28:12.53557	71	1	PD	93
60	63	71		\N	\N	t	f	2018-03-02 10:31:28.658033	2018-03-02 10:31:28.658033	71	1	PD	94
61	63	71		\N	\N	t	f	2018-03-02 10:52:21.659893	2018-03-02 10:52:21.659893	71	1	PD	95
62	63	71		\N	\N	t	f	2018-03-02 10:53:24.220746	2018-03-02 10:53:24.220746	71	1	PD	96
63	37	80		\N	\N	t	f	2018-03-02 16:53:46.237035	2018-03-02 16:53:46.237035	92	2	PD	98
64	37	80		\N	\N	t	f	2018-03-02 16:54:47.913264	2018-03-02 16:54:47.913264	92	2	PD	99
65	37	80	\N	\N	83	t	f	2018-03-02 17:20:23.450103	2018-03-02 17:20:23.450103	97	2	DP	100
\.


--
-- Name: confirmed_personal_doctor_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('confirmed_personal_doctor_services_id_seq', 65, true);


--
-- Data for Name: country_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY country_masters (id, country_name, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
4	Togo		\N	\N	t	\N	2017-11-10 18:12:45.139903	2017-11-11 20:38:21.150013
3	Nigeria		\N	\N	t	\N	2017-11-07 10:36:59.874238	2017-11-11 20:38:32.476261
5	Ivory Coast		\N	\N	t	\N	2017-11-10 18:56:31.789039	2017-11-11 20:38:40.217222
2	Ghana		\N	\N	t	\N	2017-11-02 12:58:39.971001	2017-11-11 20:39:40.278548
6	Cameroun		\N	\N	t	\N	2017-11-21 16:10:20.778855	2017-12-14 17:23:09.393728
11	South Africa		\N	36	t	\N	2018-01-16 15:43:24.047129	2018-03-02 13:31:26.305941
10	Tanzania		\N	36	t	\N	2018-01-16 15:42:29.442756	2018-03-02 13:32:08.676059
9	Brazil		\N	36	t	\N	2018-01-16 15:29:06.543847	2018-03-02 13:32:17.150339
8	Pakistan		\N	\N	t	\N	2017-12-15 14:27:30.729553	2018-03-02 13:32:25.814208
7	India		\N	\N	t	\N	2017-12-15 14:27:17.31359	2018-03-02 13:32:35.22977
\.


--
-- Name: country_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('country_masters_id_seq', 11, true);


--
-- Data for Name: engaged_user_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY engaged_user_services (id, person_id, user_service_id, comment, entity_id, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	34	1	\N	\N	9	t	f	2018-01-03 10:26:18.05969	2018-01-03 10:26:18.05969
2	34	3	\N	\N	9	t	f	2018-01-03 10:26:18.114846	2018-01-03 10:26:18.114846
3	32	2	\N	\N	29	t	f	2018-01-04 15:41:47.22091	2018-01-04 15:41:47.22091
4	32	3	\N	\N	29	t	f	2018-01-04 15:41:47.256207	2018-01-04 15:41:47.256207
\.


--
-- Name: engaged_user_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('engaged_user_services_id_seq', 4, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY events (id, title, start_date, end_date, created_at, updated_at) FROM stdin;
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('events_id_seq', 1, false);


--
-- Data for Name: lab_detail_images; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY lab_detail_images (id, pre_appointment_id, lab_detail_id, comment, user_id, active_status, del_status, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
1	44	\N	\N	\N	\N	\N	2017-11-23 10:17:57.554821	2017-11-23 10:17:57.554821	WIN_20160729_08_50_20_Pro.jpg	image/jpeg	81171	2017-11-23 10:17:56.501009
2	43	\N	\N	\N	\N	\N	2017-11-23 10:18:20.007947	2017-11-23 12:03:43.648699	WIN_20160411_15_54_21_Pro.jpg	image/jpeg	139962	2017-11-23 12:03:43.261503
3	\N	\N	\N	\N	\N	\N	2017-11-28 16:38:40.008156	2017-11-28 16:38:40.008156	1511886401113.jpg	\N	\N	\N
4	70	\N	\N	\N	\N	\N	2017-12-05 09:27:45.621189	2017-12-05 09:27:45.621189	2016-08-02_at_12-37-09.png	image/png	85178	2017-12-05 09:27:44.481486
5	71	\N	\N	\N	\N	\N	2017-12-05 09:32:49.363672	2017-12-05 09:32:49.363672	VORSA_ID.PNG	image/png	76853	2017-12-05 09:32:49.157913
6	72	\N	\N	\N	\N	\N	2017-12-05 09:35:12.452007	2017-12-05 09:35:12.452007	coding.jpg	image/jpeg	78832	2017-12-05 09:35:11.96489
7	73	\N	\N	\N	\N	\N	2017-12-05 09:38:57.752153	2017-12-05 09:38:57.752153	fo_atsu.jpg	image/jpeg	39004	2017-12-05 09:38:57.508995
8	\N	\N	\N	\N	\N	\N	2017-12-05 10:51:26.856095	2017-12-05 10:51:26.856095	ali.jpg	\N	\N	\N
9	42	\N	\N	\N	\N	\N	2017-12-05 11:00:49.475211	2017-12-05 11:00:49.475211	icon 2.png	\N	\N	\N
10	42	\N	\N	\N	\N	\N	2017-12-05 15:43:26.429417	2017-12-05 15:43:26.429417	1512487775885.jpg	\N	\N	\N
11	42	\N	\N	\N	\N	\N	2018-01-05 13:53:51.395039	2018-01-05 13:53:51.395039	1515159622101.jpg	\N	\N	\N
\.


--
-- Name: lab_detail_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('lab_detail_images_id_seq', 11, true);


--
-- Data for Name: lab_details; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY lab_details (id, pre_appointment_id, lab_service_id, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	20	1		\N	t	f	2017-11-16 11:56:06.608874	2017-11-16 11:56:06.608874
2	20	3		\N	t	f	2017-11-16 11:56:06.616558	2017-11-16 11:56:06.616558
3	20	5		\N	t	f	2017-11-16 11:56:06.624888	2017-11-16 11:56:06.624888
4	20	6		\N	t	f	2017-11-16 11:56:06.63327	2017-11-16 11:56:06.63327
5	24	1		\N	t	f	2017-11-20 11:59:34.637241	2017-11-20 11:59:34.637241
6	24	3		\N	t	f	2017-11-20 11:59:34.64514	2017-11-20 11:59:34.64514
7	24	6		\N	t	f	2017-11-20 11:59:34.653421	2017-11-20 11:59:34.653421
9	31	2		\N	t	f	2017-11-20 15:38:07.656953	2017-11-20 15:38:07.656953
10	31	3		\N	t	f	2017-11-20 15:38:07.6649	2017-11-20 15:38:07.6649
11	31	5		\N	t	f	2017-11-20 15:38:07.673173	2017-11-20 15:38:07.673173
12	31	6		\N	t	f	2017-11-20 15:38:07.698264	2017-11-20 15:38:07.698264
13	31	7		\N	t	f	2017-11-20 15:38:07.706493	2017-11-20 15:38:07.706493
8	29	7		\N	f	t	2017-11-20 13:02:32.348144	2017-11-20 16:56:50.124706
14	29	5		\N	t	f	2017-11-20 16:56:50.187881	2017-11-20 16:56:50.187881
15	29	6		\N	t	f	2017-11-20 16:56:50.199482	2017-11-20 16:56:50.199482
16	29	7		\N	t	f	2017-11-20 16:56:50.207856	2017-11-20 16:56:50.207856
17	34	1		\N	t	f	2017-11-21 10:48:41.618962	2017-11-21 10:48:41.618962
18	34	3		\N	t	f	2017-11-21 10:48:41.63149	2017-11-21 10:48:41.63149
19	41	3		\N	t	f	2017-11-22 11:14:38.375129	2017-11-22 11:14:38.375129
20	41	7		\N	t	f	2017-11-22 11:14:38.38295	2017-11-22 11:14:38.38295
21	41	5		\N	t	f	2017-11-22 11:14:38.391356	2017-11-22 11:14:38.391356
24	44	2		\N	t	f	2017-11-23 10:17:57.706318	2017-11-23 10:17:57.706318
25	44	4		\N	t	f	2017-11-23 10:17:57.747278	2017-11-23 10:17:57.747278
26	44	3		\N	t	f	2017-11-23 10:17:57.759388	2017-11-23 10:17:57.759388
22	42	1		\N	f	t	2017-11-22 16:45:33.732188	2017-11-23 11:44:05.887653
23	42	2		\N	f	t	2017-11-22 16:45:33.739564	2017-11-23 11:44:05.887653
27	42	1		\N	f	t	2017-11-23 11:42:56.229462	2017-11-23 11:44:05.887653
28	42	2		\N	f	t	2017-11-23 11:42:56.240139	2017-11-23 11:44:05.887653
29	42	1		\N	t	f	2017-11-23 11:44:05.939385	2017-11-23 11:44:05.939385
30	42	2		\N	t	f	2017-11-23 11:44:05.949567	2017-11-23 11:44:05.949567
31	86	1		\N	t	f	2017-12-08 12:11:17.936489	2017-12-08 12:11:17.936489
32	86	2		\N	t	f	2017-12-08 12:11:17.961387	2017-12-08 12:11:17.961387
33	90	1		\N	t	f	2017-12-08 12:13:03.088937	2017-12-08 12:13:03.088937
34	90	2		\N	t	f	2017-12-08 12:13:03.102195	2017-12-08 12:13:03.102195
35	90	4		\N	t	f	2017-12-08 12:13:03.113651	2017-12-08 12:13:03.113651
\.


--
-- Name: lab_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('lab_details_id_seq', 35, true);


--
-- Data for Name: lab_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY lab_services (id, title, price, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Full Blood Count	200.5			t	f	2017-11-15 10:52:13.354649	2017-11-15 11:39:49.673635
2	Full Blood Count + Film Comment	500.0			t	f	2017-11-15 11:55:55.540885	2017-11-15 11:55:55.540885
4	Esr	50.0			t	f	2017-11-15 19:10:45.780751	2017-11-15 19:10:45.780751
3	Haemoglobin	100.56			t	f	2017-11-15 19:10:29.833879	2017-11-21 10:09:29.397208
7	Blood Group + Rhes D Ag	45.46			t	f	2017-11-15 19:12:23.571102	2017-11-21 10:16:32.055557
6	Hb Electrophoresis	100.12			t	f	2017-11-15 19:12:01.81811	2017-11-21 12:02:51.945288
5	Sickling Test	50.23			t	f	2017-11-15 19:11:03.492861	2017-11-21 12:11:19.612663
8	Tissue	300.0			t	f	2017-11-21 16:55:56.32745	2017-11-21 16:55:56.32745
\.


--
-- Name: lab_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('lab_services_id_seq', 8, true);


--
-- Data for Name: password_table; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY password_table (id, password, mobile_number, created_at, status, username) FROM stdin;
23	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0276113371	14:09:07.249095	f	saha
24	19513fdc9da4fb72a4a05eb66917548d3c90ff94d5419e1f2363eea89dfee1dd	74793530	22:18:34.206142	f	koby
25	e2e58fcf185ef6e5513c504e287ddb72af7be9c54fc0023a356a7ce559240885	0248152204	11:02:55.020787	f	sedem
26	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0244786611	13:59:57.046727	f	nananana
27	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0276113372	14:10:26.98865	f	kob
28	47e4336f4b44be1af3bbc4bf4d3e04ea8bddc8c41a76f43d952182fa26af725e	8hsjsaoj	21:46:42.797027	f	samuelapp24
29	6db20803f22153320547417961a7774de70d90c6257d32b7cd26e7d994fc4a1c	7iq9w9qw9wuw	21:48:11.194853	f	samuelapp24
30	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0244567812	09:39:37.384683	f	saha1
31	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0276113375	09:43:53.787105	f	saha
32	6db20803f22153320547417961a7774de70d90c6257d32b7cd26e7d994fc4a1c	44445555	19:48:15.770815	f	samapps
33	e7108a18b71b1e942c34239afe5bb82e6f2316d46f5673240c400c0bfd8f392f	33332222	20:52:37.040826	f	nana
34	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0244675123	10:09:19.122559	f	bambi2
35	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0248152205	12:50:17.155107	f	klem
36	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0244567234	06:04:24.820083	f	doc
37	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0233456789	12:06:11.148608	f	best doc
38	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0233445678	13:09:31.689079	f	best doc
39	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0233456456	13:16:11.416512	f	best doc
40	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	02334567123	14:38:30.764282	f	best doc
41	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	02445672341	14:44:50.541788	f	best doc
42	56e80668235f47d4f44534e10d4fdd775b6446fae3e6add9d84b02542130fd0d	0276113345	16:02:34.99334	f	best doc
43	19513fdc9da4fb72a4a05eb66917548d3c90ff94d5419e1f2363eea89dfee1dd	44454445	20:47:43.866526	f	samuel 
44	98a9d96889b90ce05e2a3cdba62e05ce6d5d3a90179a0b1e44ec7b9220eefc29	444445555 	20:51:10.057144	f	gloria
45	521fdac8795a920e4e6d4ffbb9788237699a71c462bad2ae3de570328456c2e5	000044444	21:08:54.77317	f	nanayaa
46	0f8eb4b72b6e0c9e88b388eb967b49e067ef1004bf07bffc22c3acb13b43580a	0205869653	09:48:59.109696	f	freda
47	15d283140e2e1021aacec3e370bc99235b59d6a31bab3b6ee86e1f56b78e060a	0504899386 	11:24:33.098654	f	andymistic
48	aca5b8e5685f39e41758a05cfec88dd72d8d9ec8b899c233da1ffc33bbc15ba0	45444455	19:47:49.002674	f	angela
49	b0b4df86a1580b5f33f2b436c83219b0d7efd32209747fbb2883b70855d7c21b	000886654	20:36:07.944481	f	john
50	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0233456123	10:43:24.779608	f	best doc
51	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0578119303	10:09:40.512228	f	joe
52	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0244567896	10:34:12.034334	f	best doc
53	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0276113378	11:08:26.04715	f	best doc
54	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0255678123	12:03:07.092504	f	best doc
55	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	05567123132	12:07:41.748146	f	best doc
56	0b14d501a594442a01c6859541bcb3e8164d183d32937b851835442f69d5c94e	0207604492	08:11:56.683669	f	kwakut
57	e6c394bead3436aa4bb89dc8d9d3f714d63a64ce76f3b4ac5d4ae354b7cedcc6	0246220138	10:00:00.886842	f	asamoah
58	059ffaf61479a44b16cf967a25e34e5d3d205fc49237153a4ded8a455851b6ac	77774344	22:42:15.908549	f	isaac
59	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	9274488497	15:27:13.469134	f	kojo
60	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0234567890	17:22:23.286592	f	ago
61	0432c841a09c578e2388de0ed7e471d28a0c11f093ac280f72e9479dc2f5947c	+23320574686377	17:13:00.279869	f	nana adoma 
62	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0234770989	15:21:01.69233	f	han
63	d8f7fd2d0c41c787779fc29d0a92408247c5c45a7812b790fac756066fde5e2b	0248021199	11:32:23.658055	f	clara
64	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0279545773	16:40:12.519322	f	sweetness
\.


--
-- Name: password_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('password_table_id_seq', 64, true);


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY permissions (id, subject_class, action, name, description, created_at, updated_at) FROM stdin;
1	ServiceProvExtraInfo	manage	manage	\N	2017-12-13 16:38:01.509739	2017-12-13 16:38:01.509739
2	ServiceProvExtraInfo	create	create and update	\N	2017-12-13 16:38:01.671476	2017-12-13 16:38:01.671476
3	ServiceProvExtraInfo	index	list	\N	2017-12-13 16:38:01.694022	2017-12-13 16:38:01.694022
4	ServiceProvExtraInfo	update	create and update	\N	2017-12-13 16:38:01.702061	2017-12-13 16:38:01.702061
5	ServiceProvExtraInfo	show	show	\N	2017-12-13 16:38:01.711403	2017-12-13 16:38:01.711403
6	ServiceProvExtraInfo	destroy	delete	\N	2017-12-13 16:38:01.72643	2017-12-13 16:38:01.72643
7	ServiceProvExtraInfo	find_extra_info	find_extra_info	\N	2017-12-13 16:38:01.735109	2017-12-13 16:38:01.735109
8	ServiceProvExtraInfo	warning	warning	\N	2017-12-13 16:38:01.743304	2017-12-13 16:38:01.743304
9	ServiceProvExtraInfo	info	info	\N	2017-12-13 16:38:01.751849	2017-12-13 16:38:01.751849
10	ServiceProvExtraInfo	success	success	\N	2017-12-13 16:38:01.760134	2017-12-13 16:38:01.760134
11	ServiceProvExtraInfo	danger	danger	\N	2017-12-13 16:38:01.768348	2017-12-13 16:38:01.768348
12	Registration	manage	manage	\N	2017-12-13 16:38:01.78506	2017-12-13 16:38:01.78506
13	Registration	create	create and update	\N	2017-12-13 16:38:01.796868	2017-12-13 16:38:01.796868
14	Registration	index	list	\N	2017-12-13 16:38:01.810182	2017-12-13 16:38:01.810182
15	Registration	update	create and update	\N	2017-12-13 16:38:01.81861	2017-12-13 16:38:01.81861
16	Registration	show	show	\N	2017-12-13 16:38:01.828086	2017-12-13 16:38:01.828086
17	Registration	destroy	delete	\N	2017-12-13 16:38:01.843028	2017-12-13 16:38:01.843028
18	Registration	enable_pending_reg	enable_pending_reg	\N	2017-12-13 16:38:01.86697	2017-12-13 16:38:01.86697
19	Registration	disable_pending_reg	disable_pending_reg	\N	2017-12-13 16:38:01.903085	2017-12-13 16:38:01.903085
20	Registration	enable_approved_reg	enable_approved_reg	\N	2017-12-13 16:38:01.91873	2017-12-13 16:38:01.91873
21	Registration	disable_approved_reg	disable_approved_reg	\N	2017-12-13 16:38:01.926825	2017-12-13 16:38:01.926825
22	Registration	approve_registration	approve_registration	\N	2017-12-13 16:38:01.93491	2017-12-13 16:38:01.93491
23	Registration	warning	warning	\N	2017-12-13 16:38:01.943429	2017-12-13 16:38:01.943429
24	Registration	info	info	\N	2017-12-13 16:38:01.951771	2017-12-13 16:38:01.951771
25	Registration	success	success	\N	2017-12-13 16:38:01.960072	2017-12-13 16:38:01.960072
26	Registration	danger	danger	\N	2017-12-13 16:38:01.968624	2017-12-13 16:38:01.968624
27	SuburbMaster	manage	manage	\N	2017-12-13 16:38:01.984918	2017-12-13 16:38:01.984918
28	SuburbMaster	create	create and update	\N	2017-12-13 16:38:01.996899	2017-12-13 16:38:01.996899
29	SuburbMaster	index	list	\N	2017-12-13 16:38:02.010163	2017-12-13 16:38:02.010163
30	SuburbMaster	update	create and update	\N	2017-12-13 16:38:02.018734	2017-12-13 16:38:02.018734
31	SuburbMaster	show	show	\N	2017-12-13 16:38:02.027956	2017-12-13 16:38:02.027956
32	SuburbMaster	destroy	delete	\N	2017-12-13 16:38:02.043313	2017-12-13 16:38:02.043313
33	SuburbMaster	enable_suburb	enable_suburb	\N	2017-12-13 16:38:02.051926	2017-12-13 16:38:02.051926
34	SuburbMaster	disable_suburb	disable_suburb	\N	2017-12-13 16:38:02.060042	2017-12-13 16:38:02.060042
35	SuburbMaster	find_suburbs	find_suburbs	\N	2017-12-13 16:38:02.085386	2017-12-13 16:38:02.085386
36	SuburbMaster	warning	warning	\N	2017-12-13 16:38:02.093516	2017-12-13 16:38:02.093516
37	SuburbMaster	info	info	\N	2017-12-13 16:38:02.101878	2017-12-13 16:38:02.101878
38	SuburbMaster	success	success	\N	2017-12-13 16:38:02.110349	2017-12-13 16:38:02.110349
39	SuburbMaster	danger	danger	\N	2017-12-13 16:38:02.1185	2017-12-13 16:38:02.1185
40	AllergiesMaster	manage	manage	\N	2017-12-13 16:38:02.149567	2017-12-13 16:38:02.149567
41	AllergiesMaster	create	create and update	\N	2017-12-13 16:38:02.170458	2017-12-13 16:38:02.170458
42	AllergiesMaster	index	list	\N	2017-12-13 16:38:02.183762	2017-12-13 16:38:02.183762
43	AllergiesMaster	update	create and update	\N	2017-12-13 16:38:02.193552	2017-12-13 16:38:02.193552
44	AllergiesMaster	show	show	\N	2017-12-13 16:38:02.203015	2017-12-13 16:38:02.203015
45	AllergiesMaster	destroy	delete	\N	2017-12-13 16:38:02.218274	2017-12-13 16:38:02.218274
46	AllergiesMaster	enable_allergy	enable_allergy	\N	2017-12-13 16:38:02.226796	2017-12-13 16:38:02.226796
47	AllergiesMaster	disable_allergy	disable_allergy	\N	2017-12-13 16:38:02.235027	2017-12-13 16:38:02.235027
48	AllergiesMaster	warning	warning	\N	2017-12-13 16:38:02.243595	2017-12-13 16:38:02.243595
49	AllergiesMaster	info	info	\N	2017-12-13 16:38:02.251897	2017-12-13 16:38:02.251897
50	AllergiesMaster	success	success	\N	2017-12-13 16:38:02.260233	2017-12-13 16:38:02.260233
51	AllergiesMaster	danger	danger	\N	2017-12-13 16:38:02.268425	2017-12-13 16:38:02.268425
52	Event	manage	manage	\N	2017-12-13 16:38:02.278498	2017-12-13 16:38:02.278498
53	Event	create	create and update	\N	2017-12-13 16:38:02.295476	2017-12-13 16:38:02.295476
54	Event	index	list	\N	2017-12-13 16:38:02.308932	2017-12-13 16:38:02.308932
55	Event	update	create and update	\N	2017-12-13 16:38:02.318893	2017-12-13 16:38:02.318893
56	Event	show	show	\N	2017-12-13 16:38:02.327915	2017-12-13 16:38:02.327915
57	Event	destroy	delete	\N	2017-12-13 16:38:02.343097	2017-12-13 16:38:02.343097
58	Event	warning	warning	\N	2017-12-13 16:38:02.351776	2017-12-13 16:38:02.351776
59	Event	info	info	\N	2017-12-13 16:38:02.360332	2017-12-13 16:38:02.360332
60	Event	success	success	\N	2017-12-13 16:38:02.368495	2017-12-13 16:38:02.368495
61	Event	danger	danger	\N	2017-12-13 16:38:02.377007	2017-12-13 16:38:02.377007
62	PermissionRole	manage	manage	\N	2017-12-13 16:38:02.38682	2017-12-13 16:38:02.38682
63	PermissionRole	create	create and update	\N	2017-12-13 16:38:02.40365	2017-12-13 16:38:02.40365
64	PermissionRole	index	list	\N	2017-12-13 16:38:02.41702	2017-12-13 16:38:02.41702
65	PermissionRole	update	create and update	\N	2017-12-13 16:38:02.427076	2017-12-13 16:38:02.427076
66	PermissionRole	show	show	\N	2017-12-13 16:38:02.436798	2017-12-13 16:38:02.436798
67	PermissionRole	destroy	delete	\N	2017-12-13 16:38:02.451539	2017-12-13 16:38:02.451539
68	PermissionRole	warning	warning	\N	2017-12-13 16:38:02.46032	2017-12-13 16:38:02.46032
69	PermissionRole	info	info	\N	2017-12-13 16:38:02.468464	2017-12-13 16:38:02.468464
70	PermissionRole	success	success	\N	2017-12-13 16:38:02.476721	2017-12-13 16:38:02.476721
71	PermissionRole	danger	danger	\N	2017-12-13 16:38:02.485086	2017-12-13 16:38:02.485086
72	PreAppointment	manage	manage	\N	2017-12-13 16:38:02.50498	2017-12-13 16:38:02.50498
73	PreAppointment	create	create and update	\N	2017-12-13 16:38:02.522259	2017-12-13 16:38:02.522259
74	PreAppointment	index	list	\N	2017-12-13 16:38:02.535787	2017-12-13 16:38:02.535787
75	PreAppointment	update	create and update	\N	2017-12-13 16:38:02.543646	2017-12-13 16:38:02.543646
76	PreAppointment	show	show	\N	2017-12-13 16:38:02.552995	2017-12-13 16:38:02.552995
77	PreAppointment	destroy	delete	\N	2017-12-13 16:38:02.568289	2017-12-13 16:38:02.568289
78	PreAppointment	enable_pre_appointment	enable_pre_appointment	\N	2017-12-13 16:38:02.577	2017-12-13 16:38:02.577
79	PreAppointment	disable_pre_appointment	disable_pre_appointment	\N	2017-12-13 16:38:02.585047	2017-12-13 16:38:02.585047
80	PreAppointment	find_allergies	find_allergies	\N	2017-12-13 16:38:02.593707	2017-12-13 16:38:02.593707
81	PreAppointment	warning	warning	\N	2017-12-13 16:38:02.601706	2017-12-13 16:38:02.601706
82	PreAppointment	info	info	\N	2017-12-13 16:38:02.6104	2017-12-13 16:38:02.6104
83	PreAppointment	success	success	\N	2017-12-13 16:38:02.618596	2017-12-13 16:38:02.618596
84	PreAppointment	danger	danger	\N	2017-12-13 16:38:02.626909	2017-12-13 16:38:02.626909
85	ConditionMaster	manage	manage	\N	2017-12-13 16:38:02.640245	2017-12-13 16:38:02.640245
86	ConditionMaster	create	create and update	\N	2017-12-13 16:38:02.655543	2017-12-13 16:38:02.655543
87	ConditionMaster	index	list	\N	2017-12-13 16:38:02.66891	2017-12-13 16:38:02.66891
88	ConditionMaster	update	create and update	\N	2017-12-13 16:38:02.676934	2017-12-13 16:38:02.676934
89	ConditionMaster	show	show	\N	2017-12-13 16:38:02.686326	2017-12-13 16:38:02.686326
90	ConditionMaster	destroy	delete	\N	2017-12-13 16:38:02.6947	2017-12-13 16:38:02.6947
91	ConditionMaster	enable_condition	enable_condition	\N	2017-12-13 16:38:02.708718	2017-12-13 16:38:02.708718
92	ConditionMaster	disable_condition	disable_condition	\N	2017-12-13 16:38:02.718663	2017-12-13 16:38:02.718663
93	ConditionMaster	warning	warning	\N	2017-12-13 16:38:02.726766	2017-12-13 16:38:02.726766
94	ConditionMaster	info	info	\N	2017-12-13 16:38:02.735111	2017-12-13 16:38:02.735111
95	ConditionMaster	success	success	\N	2017-12-13 16:38:02.743662	2017-12-13 16:38:02.743662
96	ConditionMaster	danger	danger	\N	2017-12-13 16:38:02.751667	2017-12-13 16:38:02.751667
97	RequestCategory	manage	manage	\N	2017-12-13 16:38:02.781269	2017-12-13 16:38:02.781269
98	RequestCategory	create	create and update	\N	2017-12-13 16:38:02.797184	2017-12-13 16:38:02.797184
99	RequestCategory	index	list	\N	2017-12-13 16:38:02.81053	2017-12-13 16:38:02.81053
100	RequestCategory	update	create and update	\N	2017-12-13 16:38:02.818951	2017-12-13 16:38:02.818951
101	RequestCategory	show	show	\N	2017-12-13 16:38:02.828163	2017-12-13 16:38:02.828163
102	RequestCategory	destroy	delete	\N	2017-12-13 16:38:02.843332	2017-12-13 16:38:02.843332
103	RequestCategory	warning	warning	\N	2017-12-13 16:38:02.851815	2017-12-13 16:38:02.851815
104	RequestCategory	info	info	\N	2017-12-13 16:38:02.860065	2017-12-13 16:38:02.860065
105	RequestCategory	success	success	\N	2017-12-13 16:38:02.868503	2017-12-13 16:38:02.868503
106	RequestCategory	danger	danger	\N	2017-12-13 16:38:02.877061	2017-12-13 16:38:02.877061
107	ProviderMaster	manage	manage	\N	2017-12-13 16:38:02.897087	2017-12-13 16:38:02.897087
108	ProviderMaster	create	create and update	\N	2017-12-13 16:38:02.914171	2017-12-13 16:38:02.914171
109	ProviderMaster	index	list	\N	2017-12-13 16:38:02.927389	2017-12-13 16:38:02.927389
110	ProviderMaster	update	create and update	\N	2017-12-13 16:38:02.935647	2017-12-13 16:38:02.935647
111	ProviderMaster	show	show	\N	2017-12-13 16:38:02.944977	2017-12-13 16:38:02.944977
112	ProviderMaster	destroy	delete	\N	2017-12-13 16:38:02.961789	2017-12-13 16:38:02.961789
113	ProviderMaster	find_extra_info	find_extra_info	\N	2017-12-13 16:38:02.97539	2017-12-13 16:38:02.97539
114	ProviderMaster	provider_details	provider_details	\N	2017-12-13 16:38:03.018246	2017-12-13 16:38:03.018246
115	ProviderMaster	enable_service_provider	enable_service_provider	\N	2017-12-13 16:38:03.042089	2017-12-13 16:38:03.042089
116	ProviderMaster	disable_service_provider	disable_service_provider	\N	2017-12-13 16:38:03.052158	2017-12-13 16:38:03.052158
117	ProviderMaster	find_prov_type	find_prov_type	\N	2017-12-13 16:38:03.060184	2017-12-13 16:38:03.060184
118	ProviderMaster	warning	warning	\N	2017-12-13 16:38:03.068636	2017-12-13 16:38:03.068636
119	ProviderMaster	info	info	\N	2017-12-13 16:38:03.077175	2017-12-13 16:38:03.077175
120	ProviderMaster	success	success	\N	2017-12-13 16:38:03.08551	2017-12-13 16:38:03.08551
121	ProviderMaster	danger	danger	\N	2017-12-13 16:38:03.093782	2017-12-13 16:38:03.093782
122	PersonTypeMaster	manage	manage	\N	2017-12-13 16:38:03.106828	2017-12-13 16:38:03.106828
123	PersonTypeMaster	create	create and update	\N	2017-12-13 16:38:03.122431	2017-12-13 16:38:03.122431
124	PersonTypeMaster	index	list	\N	2017-12-13 16:38:03.135736	2017-12-13 16:38:03.135736
125	PersonTypeMaster	update	create and update	\N	2017-12-13 16:38:03.143736	2017-12-13 16:38:03.143736
126	PersonTypeMaster	show	show	\N	2017-12-13 16:38:03.15325	2017-12-13 16:38:03.15325
127	PersonTypeMaster	destroy	delete	\N	2017-12-13 16:38:03.168601	2017-12-13 16:38:03.168601
128	PersonTypeMaster	enable_user_type	enable_user_type	\N	2017-12-13 16:38:03.177251	2017-12-13 16:38:03.177251
129	PersonTypeMaster	disable_user_type	disable_user_type	\N	2017-12-13 16:38:03.185322	2017-12-13 16:38:03.185322
130	PersonTypeMaster	warning	warning	\N	2017-12-13 16:38:03.201913	2017-12-13 16:38:03.201913
131	PersonTypeMaster	info	info	\N	2017-12-13 16:38:03.225389	2017-12-13 16:38:03.225389
132	PersonTypeMaster	success	success	\N	2017-12-13 16:38:03.235176	2017-12-13 16:38:03.235176
133	PersonTypeMaster	danger	danger	\N	2017-12-13 16:38:03.243589	2017-12-13 16:38:03.243589
134	PersonContactInfo	manage	manage	\N	2017-12-13 16:38:03.255368	2017-12-13 16:38:03.255368
135	PersonContactInfo	create	create and update	\N	2017-12-13 16:38:03.272424	2017-12-13 16:38:03.272424
136	PersonContactInfo	index	list	\N	2017-12-13 16:38:03.293672	2017-12-13 16:38:03.293672
137	PersonContactInfo	update	create and update	\N	2017-12-13 16:38:03.301904	2017-12-13 16:38:03.301904
138	PersonContactInfo	show	show	\N	2017-12-13 16:38:03.311349	2017-12-13 16:38:03.311349
139	PersonContactInfo	destroy	delete	\N	2017-12-13 16:38:03.326259	2017-12-13 16:38:03.326259
140	PersonContactInfo	find_persons	find_persons	\N	2017-12-13 16:38:03.33512	2017-12-13 16:38:03.33512
141	PersonContactInfo	warning	warning	\N	2017-12-13 16:38:03.343428	2017-12-13 16:38:03.343428
142	PersonContactInfo	info	info	\N	2017-12-13 16:38:03.351855	2017-12-13 16:38:03.351855
143	PersonContactInfo	success	success	\N	2017-12-13 16:38:03.36029	2017-12-13 16:38:03.36029
144	PersonContactInfo	danger	danger	\N	2017-12-13 16:38:03.368487	2017-12-13 16:38:03.368487
145	ServiceMaster	manage	manage	\N	2017-12-13 16:38:03.397165	2017-12-13 16:38:03.397165
146	ServiceMaster	create	create and update	\N	2017-12-13 16:38:03.420105	2017-12-13 16:38:03.420105
147	ServiceMaster	index	list	\N	2017-12-13 16:38:03.475327	2017-12-13 16:38:03.475327
148	ServiceMaster	update	create and update	\N	2017-12-13 16:38:03.485259	2017-12-13 16:38:03.485259
149	ServiceMaster	show	show	\N	2017-12-13 16:38:03.494894	2017-12-13 16:38:03.494894
150	ServiceMaster	destroy	delete	\N	2017-12-13 16:38:03.509723	2017-12-13 16:38:03.509723
151	ServiceMaster	enable_service	enable_service	\N	2017-12-13 16:38:03.518504	2017-12-13 16:38:03.518504
152	ServiceMaster	disable_service	disable_service	\N	2017-12-13 16:38:03.526807	2017-12-13 16:38:03.526807
153	ServiceMaster	service_details	service_details	\N	2017-12-13 16:38:03.535163	2017-12-13 16:38:03.535163
154	ServiceMaster	warning	warning	\N	2017-12-13 16:38:03.543393	2017-12-13 16:38:03.543393
155	ServiceMaster	info	info	\N	2017-12-13 16:38:03.551719	2017-12-13 16:38:03.551719
156	ServiceMaster	success	success	\N	2017-12-13 16:38:03.560014	2017-12-13 16:38:03.560014
157	ServiceMaster	danger	danger	\N	2017-12-13 16:38:03.568407	2017-12-13 16:38:03.568407
158	Registration	cancel	cancel	\N	2017-12-13 16:38:03.586209	2017-12-13 16:38:03.586209
159	RequesterAllergy	manage	manage	\N	2017-12-13 16:38:03.622752	2017-12-13 16:38:03.622752
160	RequesterAllergy	create	create and update	\N	2017-12-13 16:38:03.645406	2017-12-13 16:38:03.645406
161	RequesterAllergy	index	list	\N	2017-12-13 16:38:03.658449	2017-12-13 16:38:03.658449
162	RequesterAllergy	update	create and update	\N	2017-12-13 16:38:03.668631	2017-12-13 16:38:03.668631
163	RequesterAllergy	show	show	\N	2017-12-13 16:38:03.67817	2017-12-13 16:38:03.67817
164	RequesterAllergy	destroy	delete	\N	2017-12-13 16:38:03.692869	2017-12-13 16:38:03.692869
165	RequesterAllergy	edit_allergy	edit_allergy	\N	2017-12-13 16:38:03.701906	2017-12-13 16:38:03.701906
166	RequesterAllergy	add_requester_allergy	add_requester_allergy	\N	2017-12-13 16:38:03.710213	2017-12-13 16:38:03.710213
167	RequesterAllergy	warning	warning	\N	2017-12-13 16:38:03.718412	2017-12-13 16:38:03.718412
168	RequesterAllergy	info	info	\N	2017-12-13 16:38:03.726852	2017-12-13 16:38:03.726852
169	RequesterAllergy	success	success	\N	2017-12-13 16:38:03.73486	2017-12-13 16:38:03.73486
170	RequesterAllergy	danger	danger	\N	2017-12-13 16:38:03.743344	2017-12-13 16:38:03.743344
171	User	manage	manage	\N	2017-12-13 16:38:03.751889	2017-12-13 16:38:03.751889
172	User	create	create and update	\N	2017-12-13 16:38:03.763725	2017-12-13 16:38:03.763725
173	User	index	list	\N	2017-12-13 16:38:03.791984	2017-12-13 16:38:03.791984
174	User	update	create and update	\N	2017-12-13 16:38:03.816197	2017-12-13 16:38:03.816197
175	User	show	show	\N	2017-12-13 16:38:03.851494	2017-12-13 16:38:03.851494
176	User	destroy	delete	\N	2017-12-13 16:38:03.87624	2017-12-13 16:38:03.87624
177	User	enable_user	enable_user	\N	2017-12-13 16:38:03.885158	2017-12-13 16:38:03.885158
178	User	disable_user	disable_user	\N	2017-12-13 16:38:03.89353	2017-12-13 16:38:03.89353
179	User	warning	warning	\N	2017-12-13 16:38:03.901876	2017-12-13 16:38:03.901876
180	User	info	info	\N	2017-12-13 16:38:03.910022	2017-12-13 16:38:03.910022
181	User	success	success	\N	2017-12-13 16:38:03.918205	2017-12-13 16:38:03.918205
182	User	danger	danger	\N	2017-12-13 16:38:03.926779	2017-12-13 16:38:03.926779
183	PersonInfo	manage	manage	\N	2017-12-13 16:38:03.945223	2017-12-13 16:38:03.945223
184	PersonInfo	create	create and update	\N	2017-12-13 16:38:03.961944	2017-12-13 16:38:03.961944
185	PersonInfo	index	list	\N	2017-12-13 16:38:03.975123	2017-12-13 16:38:03.975123
186	PersonInfo	update	create and update	\N	2017-12-13 16:38:03.985335	2017-12-13 16:38:03.985335
187	PersonInfo	filter	filter	\N	2017-12-13 16:38:03.994442	2017-12-13 16:38:03.994442
188	PersonInfo	show	show	\N	2017-12-13 16:38:04.001984	2017-12-13 16:38:04.001984
189	PersonInfo	destroy	delete	\N	2017-12-13 16:38:04.011049	2017-12-13 16:38:04.011049
190	PersonInfo	set_person_info	set_person_info	\N	2017-12-13 16:38:04.018204	2017-12-13 16:38:04.018204
191	PersonInfo	enable_player	enable_player	\N	2017-12-13 16:38:04.026593	2017-12-13 16:38:04.026593
192	PersonInfo	disable_player	disable_player	\N	2017-12-13 16:38:04.035024	2017-12-13 16:38:04.035024
193	PersonInfo	person_info_params	person_info_params	\N	2017-12-13 16:38:04.05193	2017-12-13 16:38:04.05193
194	PersonInfo	warning	warning	\N	2017-12-13 16:38:04.107826	2017-12-13 16:38:04.107826
195	PersonInfo	info	info	\N	2017-12-13 16:38:04.118533	2017-12-13 16:38:04.118533
196	PersonInfo	success	success	\N	2017-12-13 16:38:04.12691	2017-12-13 16:38:04.12691
197	PersonInfo	danger	danger	\N	2017-12-13 16:38:04.135164	2017-12-13 16:38:04.135164
198	Permission	manage	manage	\N	2017-12-13 16:38:04.14365	2017-12-13 16:38:04.14365
199	Permission	create	create and update	\N	2017-12-13 16:38:04.18037	2017-12-13 16:38:04.18037
200	Permission	index	list	\N	2017-12-13 16:38:04.193661	2017-12-13 16:38:04.193661
201	Permission	update	create and update	\N	2017-12-13 16:38:04.201999	2017-12-13 16:38:04.201999
202	Permission	show	show	\N	2017-12-13 16:38:04.211435	2017-12-13 16:38:04.211435
203	Permission	destroy	delete	\N	2017-12-13 16:38:04.2281	2017-12-13 16:38:04.2281
204	Permission	warning	warning	\N	2017-12-13 16:38:04.235234	2017-12-13 16:38:04.235234
205	Permission	info	info	\N	2017-12-13 16:38:04.2436	2017-12-13 16:38:04.2436
206	Permission	success	success	\N	2017-12-13 16:38:04.251767	2017-12-13 16:38:04.251767
207	Permission	danger	danger	\N	2017-12-13 16:38:04.260241	2017-12-13 16:38:04.260241
208	ProviderEngagedUser	manage	manage	\N	2017-12-13 16:38:04.272782	2017-12-13 16:38:04.272782
209	ProviderEngagedUser	create	create and update	\N	2017-12-13 16:38:04.312223	2017-12-13 16:38:04.312223
210	ProviderEngagedUser	index	list	\N	2017-12-13 16:38:04.325333	2017-12-13 16:38:04.325333
211	ProviderEngagedUser	update	create and update	\N	2017-12-13 16:38:04.335295	2017-12-13 16:38:04.335295
212	ProviderEngagedUser	show	show	\N	2017-12-13 16:38:04.344759	2017-12-13 16:38:04.344759
213	ProviderEngagedUser	destroy	delete	\N	2017-12-13 16:38:04.378311	2017-12-13 16:38:04.378311
214	ProviderEngagedUser	find_saff	find_saff	\N	2017-12-13 16:38:04.391905	2017-12-13 16:38:04.391905
215	ProviderEngagedUser	warning	warning	\N	2017-12-13 16:38:04.401855	2017-12-13 16:38:04.401855
216	ProviderEngagedUser	info	info	\N	2017-12-13 16:38:04.410161	2017-12-13 16:38:04.410161
217	ProviderEngagedUser	success	success	\N	2017-12-13 16:38:04.418557	2017-12-13 16:38:04.418557
218	ProviderEngagedUser	danger	danger	\N	2017-12-13 16:38:04.426866	2017-12-13 16:38:04.426866
219	SpecialtyMaster	manage	manage	\N	2017-12-13 16:38:04.43978	2017-12-13 16:38:04.43978
220	SpecialtyMaster	create	create and update	\N	2017-12-13 16:38:04.455554	2017-12-13 16:38:04.455554
221	SpecialtyMaster	index	list	\N	2017-12-13 16:38:04.468679	2017-12-13 16:38:04.468679
222	SpecialtyMaster	update	create and update	\N	2017-12-13 16:38:04.516907	2017-12-13 16:38:04.516907
223	SpecialtyMaster	show	show	\N	2017-12-13 16:38:04.528262	2017-12-13 16:38:04.528262
224	SpecialtyMaster	destroy	delete	\N	2017-12-13 16:38:04.54309	2017-12-13 16:38:04.54309
225	SpecialtyMaster	enable_specialty	enable_specialty	\N	2017-12-13 16:38:04.551884	2017-12-13 16:38:04.551884
226	SpecialtyMaster	disable_specialty	disable_specialty	\N	2017-12-13 16:38:04.585329	2017-12-13 16:38:04.585329
227	SpecialtyMaster	warning	warning	\N	2017-12-13 16:38:04.593553	2017-12-13 16:38:04.593553
228	SpecialtyMaster	info	info	\N	2017-12-13 16:38:04.601961	2017-12-13 16:38:04.601961
229	SpecialtyMaster	success	success	\N	2017-12-13 16:38:04.610098	2017-12-13 16:38:04.610098
230	SpecialtyMaster	danger	danger	\N	2017-12-13 16:38:04.618622	2017-12-13 16:38:04.618622
231	AffectedSystemMaster	manage	manage	\N	2017-12-13 16:38:04.640078	2017-12-13 16:38:04.640078
232	AffectedSystemMaster	create	create and update	\N	2017-12-13 16:38:04.662053	2017-12-13 16:38:04.662053
233	AffectedSystemMaster	index	list	\N	2017-12-13 16:38:04.675197	2017-12-13 16:38:04.675197
234	AffectedSystemMaster	update	create and update	\N	2017-12-13 16:38:04.716888	2017-12-13 16:38:04.716888
235	AffectedSystemMaster	show	show	\N	2017-12-13 16:38:04.728014	2017-12-13 16:38:04.728014
236	AffectedSystemMaster	destroy	delete	\N	2017-12-13 16:38:04.736446	2017-12-13 16:38:04.736446
237	AffectedSystemMaster	enable_part	enable_part	\N	2017-12-13 16:38:04.743589	2017-12-13 16:38:04.743589
238	AffectedSystemMaster	disable_part	disable_part	\N	2017-12-13 16:38:04.751891	2017-12-13 16:38:04.751891
239	AffectedSystemMaster	warning	warning	\N	2017-12-13 16:38:04.760183	2017-12-13 16:38:04.760183
240	AffectedSystemMaster	info	info	\N	2017-12-13 16:38:04.793703	2017-12-13 16:38:04.793703
241	AffectedSystemMaster	success	success	\N	2017-12-13 16:38:04.801951	2017-12-13 16:38:04.801951
242	AffectedSystemMaster	danger	danger	\N	2017-12-13 16:38:04.810289	2017-12-13 16:38:04.810289
243	ProfesionalGroup	manage	manage	\N	2017-12-13 16:38:04.821883	2017-12-13 16:38:04.821883
244	ProfesionalGroup	create	create and update	\N	2017-12-13 16:38:04.838579	2017-12-13 16:38:04.838579
245	ProfesionalGroup	index	list	\N	2017-12-13 16:38:04.850216	2017-12-13 16:38:04.850216
246	ProfesionalGroup	update	create and update	\N	2017-12-13 16:38:04.860309	2017-12-13 16:38:04.860309
247	ProfesionalGroup	show	show	\N	2017-12-13 16:38:04.869592	2017-12-13 16:38:04.869592
248	ProfesionalGroup	destroy	delete	\N	2017-12-13 16:38:04.877857	2017-12-13 16:38:04.877857
249	ProfesionalGroup	enable_professional_group	enable_professional_group	\N	2017-12-13 16:38:04.885052	2017-12-13 16:38:04.885052
250	ProfesionalGroup	disable_professional_group	disable_professional_group	\N	2017-12-13 16:38:04.893397	2017-12-13 16:38:04.893397
251	ProfesionalGroup	warning	warning	\N	2017-12-13 16:38:04.90203	2017-12-13 16:38:04.90203
252	ProfesionalGroup	info	info	\N	2017-12-13 16:38:04.910078	2017-12-13 16:38:04.910078
253	ProfesionalGroup	success	success	\N	2017-12-13 16:38:04.918683	2017-12-13 16:38:04.918683
254	ProfesionalGroup	danger	danger	\N	2017-12-13 16:38:04.926938	2017-12-13 16:38:04.926938
255	AppointmentType	manage	manage	\N	2017-12-13 16:38:04.939774	2017-12-13 16:38:04.939774
256	AppointmentType	create	create and update	\N	2017-12-13 16:38:04.955224	2017-12-13 16:38:04.955224
257	AppointmentType	index	list	\N	2017-12-13 16:38:04.967008	2017-12-13 16:38:04.967008
258	AppointmentType	update	create and update	\N	2017-12-13 16:38:05.010886	2017-12-13 16:38:05.010886
259	AppointmentType	show	show	\N	2017-12-13 16:38:05.019885	2017-12-13 16:38:05.019885
260	AppointmentType	destroy	delete	\N	2017-12-13 16:38:05.028608	2017-12-13 16:38:05.028608
261	AppointmentType	enable_appointment_type	enable_appointment_type	\N	2017-12-13 16:38:05.042386	2017-12-13 16:38:05.042386
262	AppointmentType	disable_appointment_type	disable_appointment_type	\N	2017-12-13 16:38:05.052457	2017-12-13 16:38:05.052457
263	AppointmentType	warning	warning	\N	2017-12-13 16:38:05.060193	2017-12-13 16:38:05.060193
264	AppointmentType	info	info	\N	2017-12-13 16:38:05.068699	2017-12-13 16:38:05.068699
265	AppointmentType	success	success	\N	2017-12-13 16:38:05.07697	2017-12-13 16:38:05.07697
266	AppointmentType	danger	danger	\N	2017-12-13 16:38:05.085705	2017-12-13 16:38:05.085705
267	LabDetail	manage	manage	\N	2017-12-13 16:38:05.111524	2017-12-13 16:38:05.111524
268	LabDetail	create	create and update	\N	2017-12-13 16:38:05.121977	2017-12-13 16:38:05.121977
269	LabDetail	index	list	\N	2017-12-13 16:38:05.135469	2017-12-13 16:38:05.135469
270	LabDetail	update	create and update	\N	2017-12-13 16:38:05.143775	2017-12-13 16:38:05.143775
271	LabDetail	show	show	\N	2017-12-13 16:38:05.153152	2017-12-13 16:38:05.153152
272	LabDetail	destroy	delete	\N	2017-12-13 16:38:05.161332	2017-12-13 16:38:05.161332
273	LabDetail	find_lab_details	find_lab_details	\N	2017-12-13 16:38:05.168637	2017-12-13 16:38:05.168637
274	LabDetail	warning	warning	\N	2017-12-13 16:38:05.176964	2017-12-13 16:38:05.176964
275	LabDetail	info	info	\N	2017-12-13 16:38:05.210151	2017-12-13 16:38:05.210151
276	LabDetail	success	success	\N	2017-12-13 16:38:05.218654	2017-12-13 16:38:05.218654
277	LabDetail	danger	danger	\N	2017-12-13 16:38:05.227008	2017-12-13 16:38:05.227008
278	CountryMaster	manage	manage	\N	2017-12-13 16:38:05.255825	2017-12-13 16:38:05.255825
279	CountryMaster	create	create and update	\N	2017-12-13 16:38:05.278829	2017-12-13 16:38:05.278829
280	CountryMaster	index	list	\N	2017-12-13 16:38:05.292048	2017-12-13 16:38:05.292048
281	CountryMaster	update	create and update	\N	2017-12-13 16:38:05.308642	2017-12-13 16:38:05.308642
282	CountryMaster	show	show	\N	2017-12-13 16:38:05.320065	2017-12-13 16:38:05.320065
283	CountryMaster	destroy	delete	\N	2017-12-13 16:38:05.334991	2017-12-13 16:38:05.334991
284	CountryMaster	enable_country	enable_country	\N	2017-12-13 16:38:05.34379	2017-12-13 16:38:05.34379
285	CountryMaster	disable_country	disable_country	\N	2017-12-13 16:38:05.352072	2017-12-13 16:38:05.352072
286	CountryMaster	find_countries	find_countries	\N	2017-12-13 16:38:05.360355	2017-12-13 16:38:05.360355
287	CountryMaster	warning	warning	\N	2017-12-13 16:38:05.368685	2017-12-13 16:38:05.368685
288	CountryMaster	info	info	\N	2017-12-13 16:38:05.376956	2017-12-13 16:38:05.376956
289	CountryMaster	success	success	\N	2017-12-13 16:38:05.385378	2017-12-13 16:38:05.385378
290	CountryMaster	danger	danger	\N	2017-12-13 16:38:05.393725	2017-12-13 16:38:05.393725
291	ConfirmedAppointment	manage	manage	\N	2017-12-13 16:38:05.40851	2017-12-13 16:38:05.40851
292	ConfirmedAppointment	create	create and update	\N	2017-12-13 16:38:05.422155	2017-12-13 16:38:05.422155
293	ConfirmedAppointment	index	list	\N	2017-12-13 16:38:05.435377	2017-12-13 16:38:05.435377
294	ConfirmedAppointment	update	create and update	\N	2017-12-13 16:38:05.44372	2017-12-13 16:38:05.44372
295	ConfirmedAppointment	show	show	\N	2017-12-13 16:38:05.453301	2017-12-13 16:38:05.453301
296	ConfirmedAppointment	destroy	delete	\N	2017-12-13 16:38:05.461725	2017-12-13 16:38:05.461725
297	ConfirmedAppointment	enable_appointment	enable_appointment	\N	2017-12-13 16:38:05.475228	2017-12-13 16:38:05.475228
298	ConfirmedAppointment	disable_appointment	disable_appointment	\N	2017-12-13 16:38:05.485326	2017-12-13 16:38:05.485326
299	ConfirmedAppointment	warning	warning	\N	2017-12-13 16:38:05.493717	2017-12-13 16:38:05.493717
300	ConfirmedAppointment	info	info	\N	2017-12-13 16:38:05.501966	2017-12-13 16:38:05.501966
301	ConfirmedAppointment	success	success	\N	2017-12-13 16:38:05.516696	2017-12-13 16:38:05.516696
302	ConfirmedAppointment	danger	danger	\N	2017-12-13 16:38:05.52725	2017-12-13 16:38:05.52725
303	LabDetailImage	manage	manage	\N	2017-12-13 16:38:05.539476	2017-12-13 16:38:05.539476
304	LabDetailImage	create	create and update	\N	2017-12-13 16:38:05.555245	2017-12-13 16:38:05.555245
305	LabDetailImage	index	list	\N	2017-12-13 16:38:05.566796	2017-12-13 16:38:05.566796
306	LabDetailImage	update	create and update	\N	2017-12-13 16:38:05.577113	2017-12-13 16:38:05.577113
307	LabDetailImage	show	show	\N	2017-12-13 16:38:05.586646	2017-12-13 16:38:05.586646
308	LabDetailImage	destroy	delete	\N	2017-12-13 16:38:05.611396	2017-12-13 16:38:05.611396
309	LabDetailImage	find_lab_detail_image	find_lab_detail_image	\N	2017-12-13 16:38:05.618717	2017-12-13 16:38:05.618717
310	LabDetailImage	warning	warning	\N	2017-12-13 16:38:05.627053	2017-12-13 16:38:05.627053
311	LabDetailImage	info	info	\N	2017-12-13 16:38:05.635303	2017-12-13 16:38:05.635303
312	LabDetailImage	success	success	\N	2017-12-13 16:38:05.643663	2017-12-13 16:38:05.643663
313	LabDetailImage	danger	danger	\N	2017-12-13 16:38:05.651945	2017-12-13 16:38:05.651945
314	CityTownMaster	manage	manage	\N	2017-12-13 16:38:05.66433	2017-12-13 16:38:05.66433
315	CityTownMaster	create	create and update	\N	2017-12-13 16:38:05.680155	2017-12-13 16:38:05.680155
316	CityTownMaster	index	list	\N	2017-12-13 16:38:05.691764	2017-12-13 16:38:05.691764
317	CityTownMaster	update	create and update	\N	2017-12-13 16:38:05.701835	2017-12-13 16:38:05.701835
318	CityTownMaster	show	show	\N	2017-12-13 16:38:05.711535	2017-12-13 16:38:05.711535
319	CityTownMaster	destroy	delete	\N	2017-12-13 16:38:05.719699	2017-12-13 16:38:05.719699
320	CityTownMaster	enable_city	enable_city	\N	2017-12-13 16:38:05.727106	2017-12-13 16:38:05.727106
321	CityTownMaster	disable_city	disable_city	\N	2017-12-13 16:38:05.735128	2017-12-13 16:38:05.735128
322	CityTownMaster	find_cities	find_cities	\N	2017-12-13 16:38:05.74345	2017-12-13 16:38:05.74345
323	CityTownMaster	warning	warning	\N	2017-12-13 16:38:05.75188	2017-12-13 16:38:05.75188
324	CityTownMaster	info	info	\N	2017-12-13 16:38:05.760138	2017-12-13 16:38:05.760138
325	CityTownMaster	success	success	\N	2017-12-13 16:38:05.768642	2017-12-13 16:38:05.768642
326	CityTownMaster	danger	danger	\N	2017-12-13 16:38:05.777097	2017-12-13 16:38:05.777097
327	ConfirmedCondition	manage	manage	\N	2017-12-13 16:38:05.804113	2017-12-13 16:38:05.804113
328	ConfirmedCondition	create	create and update	\N	2017-12-13 16:38:05.828333	2017-12-13 16:38:05.828333
329	ConfirmedCondition	index	list	\N	2017-12-13 16:38:05.835213	2017-12-13 16:38:05.835213
330	ConfirmedCondition	update	create and update	\N	2017-12-13 16:38:05.843622	2017-12-13 16:38:05.843622
331	ConfirmedCondition	show	show	\N	2017-12-13 16:38:05.853276	2017-12-13 16:38:05.853276
332	ConfirmedCondition	destroy	delete	\N	2017-12-13 16:38:05.861649	2017-12-13 16:38:05.861649
333	ConfirmedCondition	warning	warning	\N	2017-12-13 16:38:05.868735	2017-12-13 16:38:05.868735
334	ConfirmedCondition	info	info	\N	2017-12-13 16:38:05.87691	2017-12-13 16:38:05.87691
335	ConfirmedCondition	success	success	\N	2017-12-13 16:38:05.885111	2017-12-13 16:38:05.885111
336	ConfirmedCondition	danger	danger	\N	2017-12-13 16:38:05.893429	2017-12-13 16:38:05.893429
337	ProviderService	manage	manage	\N	2017-12-13 16:38:05.921653	2017-12-13 16:38:05.921653
338	ProviderService	create	create and update	\N	2017-12-13 16:38:05.936933	2017-12-13 16:38:05.936933
339	ProviderService	index	list	\N	2017-12-13 16:38:05.950083	2017-12-13 16:38:05.950083
340	ProviderService	update	create and update	\N	2017-12-13 16:38:05.960309	2017-12-13 16:38:05.960309
341	ProviderService	show	show	\N	2017-12-13 16:38:05.970028	2017-12-13 16:38:05.970028
342	ProviderService	destroy	delete	\N	2017-12-13 16:38:05.977976	2017-12-13 16:38:05.977976
343	ProviderService	enable_provider_service	enable_provider_service	\N	2017-12-13 16:38:05.985139	2017-12-13 16:38:05.985139
344	ProviderService	disable_provider_service	disable_provider_service	\N	2017-12-13 16:38:05.993459	2017-12-13 16:38:05.993459
345	ProviderService	find_services	find_services	\N	2017-12-13 16:38:06.001864	2017-12-13 16:38:06.001864
346	ProviderService	warning	warning	\N	2017-12-13 16:38:06.010147	2017-12-13 16:38:06.010147
347	ProviderService	info	info	\N	2017-12-13 16:38:06.018517	2017-12-13 16:38:06.018517
348	ProviderService	success	success	\N	2017-12-13 16:38:06.027034	2017-12-13 16:38:06.027034
349	ProviderService	danger	danger	\N	2017-12-13 16:38:06.035093	2017-12-13 16:38:06.035093
350	ServiceProvType	manage	manage	\N	2017-12-13 16:38:06.047204	2017-12-13 16:38:06.047204
351	ServiceProvType	create	create and update	\N	2017-12-13 16:38:06.072359	2017-12-13 16:38:06.072359
352	ServiceProvType	index	list	\N	2017-12-13 16:38:06.110828	2017-12-13 16:38:06.110828
353	ServiceProvType	update	create and update	\N	2017-12-13 16:38:06.125461	2017-12-13 16:38:06.125461
354	ServiceProvType	show	show	\N	2017-12-13 16:38:06.151662	2017-12-13 16:38:06.151662
355	ServiceProvType	destroy	delete	\N	2017-12-13 16:38:06.161581	2017-12-13 16:38:06.161581
356	ServiceProvType	enable_prov_type	enable_prov_type	\N	2017-12-13 16:38:06.168708	2017-12-13 16:38:06.168708
357	ServiceProvType	disable_prov_type	disable_prov_type	\N	2017-12-13 16:38:06.176854	2017-12-13 16:38:06.176854
358	ServiceProvType	warning	warning	\N	2017-12-13 16:38:06.185153	2017-12-13 16:38:06.185153
359	ServiceProvType	info	info	\N	2017-12-13 16:38:06.193542	2017-12-13 16:38:06.193542
360	ServiceProvType	success	success	\N	2017-12-13 16:38:06.201844	2017-12-13 16:38:06.201844
361	ServiceProvType	danger	danger	\N	2017-12-13 16:38:06.218705	2017-12-13 16:38:06.218705
362	RegionMaster	manage	manage	\N	2017-12-13 16:38:06.231272	2017-12-13 16:38:06.231272
363	RegionMaster	create	create and update	\N	2017-12-13 16:38:06.247079	2017-12-13 16:38:06.247079
364	RegionMaster	index	list	\N	2017-12-13 16:38:06.260676	2017-12-13 16:38:06.260676
365	RegionMaster	update	create and update	\N	2017-12-13 16:38:06.26888	2017-12-13 16:38:06.26888
366	RegionMaster	show	show	\N	2017-12-13 16:38:06.278013	2017-12-13 16:38:06.278013
367	RegionMaster	destroy	delete	\N	2017-12-13 16:38:06.286546	2017-12-13 16:38:06.286546
368	RegionMaster	filter_by_country_name	filter_by_country_name	\N	2017-12-13 16:38:06.293829	2017-12-13 16:38:06.293829
369	RegionMaster	enable_region	enable_region	\N	2017-12-13 16:38:06.301989	2017-12-13 16:38:06.301989
370	RegionMaster	disable_region	disable_region	\N	2017-12-13 16:38:06.310367	2017-12-13 16:38:06.310367
371	RegionMaster	warning	warning	\N	2017-12-13 16:38:06.318659	2017-12-13 16:38:06.318659
372	RegionMaster	info	info	\N	2017-12-13 16:38:06.327113	2017-12-13 16:38:06.327113
373	RegionMaster	success	success	\N	2017-12-13 16:38:06.335224	2017-12-13 16:38:06.335224
374	RegionMaster	danger	danger	\N	2017-12-13 16:38:06.343541	2017-12-13 16:38:06.343541
375	PersonInfoExtra	manage	manage	\N	2017-12-13 16:38:06.355999	2017-12-13 16:38:06.355999
376	PersonInfoExtra	create	create and update	\N	2017-12-13 16:38:06.372009	2017-12-13 16:38:06.372009
377	PersonInfoExtra	index	list	\N	2017-12-13 16:38:06.383762	2017-12-13 16:38:06.383762
378	PersonInfoExtra	update	create and update	\N	2017-12-13 16:38:06.393735	2017-12-13 16:38:06.393735
379	PersonInfoExtra	show	show	\N	2017-12-13 16:38:06.403461	2017-12-13 16:38:06.403461
380	PersonInfoExtra	destroy	delete	\N	2017-12-13 16:38:06.418997	2017-12-13 16:38:06.418997
381	PersonInfoExtra	edit_prof_details	edit_prof_details	\N	2017-12-13 16:38:06.427244	2017-12-13 16:38:06.427244
382	PersonInfoExtra	find_prof_info	find_prof_info	\N	2017-12-13 16:38:06.4504	2017-12-13 16:38:06.4504
383	PersonInfoExtra	warning	warning	\N	2017-12-13 16:38:06.460553	2017-12-13 16:38:06.460553
384	PersonInfoExtra	info	info	\N	2017-12-13 16:38:06.468936	2017-12-13 16:38:06.468936
385	PersonInfoExtra	success	success	\N	2017-12-13 16:38:06.477266	2017-12-13 16:38:06.477266
386	PersonInfoExtra	danger	danger	\N	2017-12-13 16:38:06.485666	2017-12-13 16:38:06.485666
387	RequestUrgency	manage	manage	\N	2017-12-13 16:38:06.51	2017-12-13 16:38:06.51
388	RequestUrgency	create	create and update	\N	2017-12-13 16:38:06.537438	2017-12-13 16:38:06.537438
389	RequestUrgency	index	list	\N	2017-12-13 16:38:06.550367	2017-12-13 16:38:06.550367
390	RequestUrgency	update	create and update	\N	2017-12-13 16:38:06.56054	2017-12-13 16:38:06.56054
391	RequestUrgency	show	show	\N	2017-12-13 16:38:06.570082	2017-12-13 16:38:06.570082
392	RequestUrgency	destroy	delete	\N	2017-12-13 16:38:06.586922	2017-12-13 16:38:06.586922
393	RequestUrgency	warning	warning	\N	2017-12-13 16:38:06.600334	2017-12-13 16:38:06.600334
394	RequestUrgency	info	info	\N	2017-12-13 16:38:06.610391	2017-12-13 16:38:06.610391
395	RequestUrgency	success	success	\N	2017-12-13 16:38:06.619097	2017-12-13 16:38:06.619097
396	RequestUrgency	danger	danger	\N	2017-12-13 16:38:06.694169	2017-12-13 16:38:06.694169
397	LabService	manage	manage	\N	2017-12-13 16:38:06.721166	2017-12-13 16:38:06.721166
398	LabService	create	create and update	\N	2017-12-13 16:38:06.737564	2017-12-13 16:38:06.737564
399	LabService	index	list	\N	2017-12-13 16:38:06.758931	2017-12-13 16:38:06.758931
400	LabService	update	create and update	\N	2017-12-13 16:38:06.76903	2017-12-13 16:38:06.76903
401	LabService	show	show	\N	2017-12-13 16:38:06.778691	2017-12-13 16:38:06.778691
402	LabService	destroy	delete	\N	2017-12-13 16:38:06.79347	2017-12-13 16:38:06.79347
403	LabService	enable_lab_service	enable_lab_service	\N	2017-12-13 16:38:06.802164	2017-12-13 16:38:06.802164
404	LabService	disable_lab_service	disable_lab_service	\N	2017-12-13 16:38:06.810412	2017-12-13 16:38:06.810412
405	LabService	warning	warning	\N	2017-12-13 16:38:06.818793	2017-12-13 16:38:06.818793
406	LabService	info	info	\N	2017-12-13 16:38:06.827277	2017-12-13 16:38:06.827277
407	LabService	success	success	\N	2017-12-13 16:38:06.835622	2017-12-13 16:38:06.835622
408	LabService	danger	danger	\N	2017-12-13 16:38:06.844064	2017-12-13 16:38:06.844064
409	Role	manage	manage	\N	2017-12-14 15:01:19.189117	2017-12-14 15:01:19.189117
410	Role	create	create and update	\N	2017-12-14 15:01:19.231537	2017-12-14 15:01:19.231537
411	Role	index	list	\N	2017-12-14 15:01:19.244405	2017-12-14 15:01:19.244405
412	Role	update	create and update	\N	2017-12-14 15:01:19.252571	2017-12-14 15:01:19.252571
413	Role	show	show	\N	2017-12-14 15:01:19.26226	2017-12-14 15:01:19.26226
414	Role	destroy	delete	\N	2017-12-14 15:01:19.276375	2017-12-14 15:01:19.276375
415	Role	enable_role	enable_role	\N	2017-12-14 15:01:19.285943	2017-12-14 15:01:19.285943
416	Role	disable_role	disable_role	\N	2017-12-14 15:01:19.294323	2017-12-14 15:01:19.294323
417	Role	warning	warning	\N	2017-12-14 15:01:19.302582	2017-12-14 15:01:19.302582
418	Role	info	info	\N	2017-12-14 15:01:19.311014	2017-12-14 15:01:19.311014
419	Role	success	success	\N	2017-12-14 15:01:19.319327	2017-12-14 15:01:19.319327
420	Role	danger	danger	\N	2017-12-14 15:01:19.327596	2017-12-14 15:01:19.327596
421	all	manage	Manage all	all the supreme permission to every file	2017-12-14 15:10:54.391139	2017-12-15 12:08:00.407243
422	EngagedUserService	manage	manage	\N	2018-02-15 11:25:32.055266	2018-02-15 11:25:32.055266
423	EngagedUserService	create	create and update	\N	2018-02-15 11:25:32.126101	2018-02-15 11:25:32.126101
424	EngagedUserService	index	list	\N	2018-02-15 11:25:32.128148	2018-02-15 11:25:32.128148
425	EngagedUserService	update	create and update	\N	2018-02-15 11:25:32.130236	2018-02-15 11:25:32.130236
426	EngagedUserService	show	show	\N	2018-02-15 11:25:32.132921	2018-02-15 11:25:32.132921
427	EngagedUserService	destroy	delete	\N	2018-02-15 11:25:32.135626	2018-02-15 11:25:32.135626
428	EngagedUserService	find_engaged_user_service	find_engaged_user_service	\N	2018-02-15 11:25:32.137619	2018-02-15 11:25:32.137619
429	EngagedUserService	warning	warning	\N	2018-02-15 11:25:32.139614	2018-02-15 11:25:32.139614
430	EngagedUserService	info	info	\N	2018-02-15 11:25:32.141568	2018-02-15 11:25:32.141568
431	EngagedUserService	success	success	\N	2018-02-15 11:25:32.143505	2018-02-15 11:25:32.143505
432	EngagedUserService	danger	danger	\N	2018-02-15 11:25:32.145492	2018-02-15 11:25:32.145492
433	ServiceMaster	all_service_excel	all_service_excel	\N	2018-02-15 11:25:32.262435	2018-02-15 11:25:32.262435
434	PreAppointment	all_pre_appointment_excel	all_pre_appointment_excel	\N	2018-02-15 11:25:32.281436	2018-02-15 11:25:32.281436
435	ConfirmedPersonalDoctorService	manage	manage	\N	2018-02-15 11:25:32.289913	2018-02-15 11:25:32.289913
436	ConfirmedPersonalDoctorService	create	create and update	\N	2018-02-15 11:25:32.293541	2018-02-15 11:25:32.293541
437	ConfirmedPersonalDoctorService	index	list	\N	2018-02-15 11:25:32.295556	2018-02-15 11:25:32.295556
438	ConfirmedPersonalDoctorService	update	create and update	\N	2018-02-15 11:25:32.297507	2018-02-15 11:25:32.297507
439	ConfirmedPersonalDoctorService	show	show	\N	2018-02-15 11:25:32.300068	2018-02-15 11:25:32.300068
440	ConfirmedPersonalDoctorService	destroy	delete	\N	2018-02-15 11:25:32.302676	2018-02-15 11:25:32.302676
441	ConfirmedPersonalDoctorService	all_confirmed_pds_excel	all_confirmed_pds_excel	\N	2018-02-15 11:25:32.304549	2018-02-15 11:25:32.304549
442	ConfirmedPersonalDoctorService	edit_pds_from_confirmed_appointment	edit_pds_from_confirmed_appointment	\N	2018-02-15 11:25:32.306496	2018-02-15 11:25:32.306496
443	ConfirmedPersonalDoctorService	enable_confirmed_pds	enable_confirmed_pds	\N	2018-02-15 11:25:32.308434	2018-02-15 11:25:32.308434
444	ConfirmedPersonalDoctorService	disable_confirmed_pds	disable_confirmed_pds	\N	2018-02-15 11:25:32.310349	2018-02-15 11:25:32.310349
445	ConfirmedPersonalDoctorService	warning	warning	\N	2018-02-15 11:25:32.312285	2018-02-15 11:25:32.312285
446	ConfirmedPersonalDoctorService	info	info	\N	2018-02-15 11:25:32.314179	2018-02-15 11:25:32.314179
447	ConfirmedPersonalDoctorService	success	success	\N	2018-02-15 11:25:32.316082	2018-02-15 11:25:32.316082
448	ConfirmedPersonalDoctorService	danger	danger	\N	2018-02-15 11:25:32.317966	2018-02-15 11:25:32.317966
449	Registration	pending_registrations	pending_registrations	\N	2018-02-15 11:25:32.325774	2018-02-15 11:25:32.325774
450	Registration	all_pending_registration_excel	all_pending_registration_excel	\N	2018-02-15 11:25:32.327688	2018-02-15 11:25:32.327688
451	Registration	approved_registrations	approved_registrations	\N	2018-02-15 11:25:32.329578	2018-02-15 11:25:32.329578
452	Registration	all_approved_registration_excel	all_approved_registration_excel	\N	2018-02-15 11:25:32.331468	2018-02-15 11:25:32.331468
453	ConfirmedAppointment	all_confirmed_appointment_excel	all_confirmed_appointment_excel	\N	2018-02-15 11:25:32.348363	2018-02-15 11:25:32.348363
454	ConfirmedAppointment	doctor_appointments	doctor_appointments	\N	2018-02-15 11:25:32.351501	2018-02-15 11:25:32.351501
455	ServiceProvType	all_service_prov_type_excel	all_service_prov_type_excel	\N	2018-02-15 11:25:32.363952	2018-02-15 11:25:32.363952
456	ConditionMaster	all_condition_excel	all_condition_excel	\N	2018-02-15 11:25:32.376361	2018-02-15 11:25:32.376361
457	Role	all_role_excel	all_role_excel	\N	2018-02-15 11:25:32.393737	2018-02-15 11:25:32.393737
458	SuburbMaster	all_suburb_excel	all_suburb_excel	\N	2018-02-15 11:25:32.413948	2018-02-15 11:25:32.413948
459	CountryMaster	all_country_excel	all_country_excel	\N	2018-02-15 11:25:32.427711	2018-02-15 11:25:32.427711
460	ProviderMaster	all_provider_excel	all_provider_excel	\N	2018-02-15 11:25:32.445744	2018-02-15 11:25:32.445744
461	LabService	all_lab_service_excel	all_lab_service_excel	\N	2018-02-15 11:25:32.459951	2018-02-15 11:25:32.459951
462	SpecialtyMaster	all_specialty_excel	all_specialty_excel	\N	2018-02-15 11:25:32.47308	2018-02-15 11:25:32.47308
463	Permission	all_permission_excel	all_permission_excel	\N	2018-02-15 11:25:32.48424	2018-02-15 11:25:32.48424
464	CityTownMaster	all_city_excel	all_city_excel	\N	2018-02-15 11:25:32.497118	2018-02-15 11:25:32.497118
465	PersonInfo	all_person_info_excel	all_person_info_excel	\N	2018-02-15 11:25:32.516704	2018-02-15 11:25:32.516704
466	PersonInfo	new_confirm_person_info	new_confirm_person_info	\N	2018-02-15 11:25:32.518687	2018-02-15 11:25:32.518687
467	PersonInfo	confirm_person_registration	confirm_person_registration	\N	2018-02-15 11:25:32.520517	2018-02-15 11:25:32.520517
468	AllergiesMaster	all_allergies_excel	all_allergies_excel	\N	2018-02-15 11:25:32.535189	2018-02-15 11:25:32.535189
469	ProfesionalGroup	all_group_excel	all_group_excel	\N	2018-02-15 11:25:32.547945	2018-02-15 11:25:32.547945
470	UserService	manage	manage	\N	2018-02-15 11:25:32.554756	2018-02-15 11:25:32.554756
471	UserService	create	create and update	\N	2018-02-15 11:25:32.558353	2018-02-15 11:25:32.558353
472	UserService	index	list	\N	2018-02-15 11:25:32.560326	2018-02-15 11:25:32.560326
473	UserService	update	create and update	\N	2018-02-15 11:25:32.562208	2018-02-15 11:25:32.562208
474	UserService	show	show	\N	2018-02-15 11:25:32.564751	2018-02-15 11:25:32.564751
475	UserService	destroy	delete	\N	2018-02-15 11:25:32.567313	2018-02-15 11:25:32.567313
476	UserService	all_user_service_excel	all_user_service_excel	\N	2018-02-15 11:25:32.569248	2018-02-15 11:25:32.569248
477	UserService	enable_user_service	enable_user_service	\N	2018-02-15 11:25:32.571125	2018-02-15 11:25:32.571125
478	UserService	disable_user_service	disable_user_service	\N	2018-02-15 11:25:32.573003	2018-02-15 11:25:32.573003
479	UserService	warning	warning	\N	2018-02-15 11:25:32.574925	2018-02-15 11:25:32.574925
480	UserService	info	info	\N	2018-02-15 11:25:32.576822	2018-02-15 11:25:32.576822
481	UserService	success	success	\N	2018-02-15 11:25:32.57871	2018-02-15 11:25:32.57871
482	UserService	danger	danger	\N	2018-02-15 11:25:32.580562	2018-02-15 11:25:32.580562
483	RegionMaster	all_region_excel	all_region_excel	\N	2018-02-15 11:25:32.59174	2018-02-15 11:25:32.59174
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('permissions_id_seq', 483, true);


--
-- Data for Name: permissions_roles; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY permissions_roles (id, person_type_master_id, permission_id, created_at, updated_at, role_id) FROM stdin;
16	\N	41	2017-12-14 16:34:23.261171	2017-12-14 16:34:23.261171	3
17	\N	42	2017-12-14 16:34:23.28559	2017-12-14 16:34:23.28559	3
18	\N	43	2017-12-14 16:34:23.336822	2017-12-14 16:34:23.336822	3
19	\N	44	2017-12-14 16:34:23.369032	2017-12-14 16:34:23.369032	3
20	\N	46	2017-12-14 16:34:23.380973	2017-12-14 16:34:23.380973	3
21	\N	47	2017-12-14 16:34:23.393823	2017-12-14 16:34:23.393823	3
22	\N	72	2017-12-14 16:34:23.406056	2017-12-14 16:34:23.406056	3
23	\N	73	2017-12-14 16:34:23.418723	2017-12-14 16:34:23.418723	3
24	\N	74	2017-12-14 16:34:23.456272	2017-12-14 16:34:23.456272	3
25	\N	75	2017-12-14 16:34:23.468885	2017-12-14 16:34:23.468885	3
26	\N	76	2017-12-14 16:34:23.481159	2017-12-14 16:34:23.481159	3
27	\N	78	2017-12-14 16:34:23.493944	2017-12-14 16:34:23.493944	3
28	\N	79	2017-12-14 16:34:23.506043	2017-12-14 16:34:23.506043	3
29	\N	80	2017-12-14 16:34:23.518895	2017-12-14 16:34:23.518895	3
30	\N	2	2017-12-14 16:43:55.788934	2017-12-14 16:43:55.788934	1
31	\N	3	2017-12-14 16:43:55.800021	2017-12-14 16:43:55.800021	1
32	\N	4	2017-12-14 16:43:55.812904	2017-12-14 16:43:55.812904	1
33	\N	5	2017-12-14 16:43:55.824875	2017-12-14 16:43:55.824875	1
34	\N	6	2017-12-14 16:43:55.85018	2017-12-14 16:43:55.85018	1
35	\N	7	2017-12-14 16:43:55.891903	2017-12-14 16:43:55.891903	1
36	\N	8	2017-12-14 16:43:55.904437	2017-12-14 16:43:55.904437	1
37	\N	9	2017-12-14 16:43:55.916603	2017-12-14 16:43:55.916603	1
38	\N	10	2017-12-14 16:43:55.92955	2017-12-14 16:43:55.92955	1
39	\N	11	2017-12-14 16:43:55.941642	2017-12-14 16:43:55.941642	1
40	\N	12	2017-12-14 16:43:55.954462	2017-12-14 16:43:55.954462	1
41	\N	13	2017-12-14 16:43:55.96668	2017-12-14 16:43:55.96668	1
42	\N	14	2017-12-14 16:43:55.979551	2017-12-14 16:43:55.979551	1
43	\N	15	2017-12-14 16:43:55.991622	2017-12-14 16:43:55.991622	1
44	\N	16	2017-12-14 16:43:56.004692	2017-12-14 16:43:56.004692	1
45	\N	17	2017-12-14 16:43:56.017486	2017-12-14 16:43:56.017486	1
46	\N	18	2017-12-14 16:43:56.091456	2017-12-14 16:43:56.091456	1
47	\N	19	2017-12-14 16:43:56.108217	2017-12-14 16:43:56.108217	1
48	\N	20	2017-12-14 16:43:56.121276	2017-12-14 16:43:56.121276	1
49	\N	21	2017-12-14 16:43:56.133172	2017-12-14 16:43:56.133172	1
50	\N	22	2017-12-14 16:43:56.146261	2017-12-14 16:43:56.146261	1
51	\N	23	2017-12-14 16:43:56.158258	2017-12-14 16:43:56.158258	1
52	\N	24	2017-12-14 16:43:56.171292	2017-12-14 16:43:56.171292	1
53	\N	25	2017-12-14 16:43:56.183199	2017-12-14 16:43:56.183199	1
54	\N	26	2017-12-14 16:43:56.196214	2017-12-14 16:43:56.196214	1
55	\N	27	2017-12-14 16:43:56.208182	2017-12-14 16:43:56.208182	1
56	\N	28	2017-12-14 16:43:56.221376	2017-12-14 16:43:56.221376	1
57	\N	29	2017-12-14 16:43:56.233224	2017-12-14 16:43:56.233224	1
58	\N	30	2017-12-14 16:43:56.246104	2017-12-14 16:43:56.246104	1
59	\N	31	2017-12-14 16:43:56.258233	2017-12-14 16:43:56.258233	1
60	\N	32	2017-12-14 16:43:56.27106	2017-12-14 16:43:56.27106	1
61	\N	33	2017-12-14 16:43:56.283163	2017-12-14 16:43:56.283163	1
62	\N	34	2017-12-14 16:43:56.29667	2017-12-14 16:43:56.29667	1
63	\N	35	2017-12-14 16:43:56.308283	2017-12-14 16:43:56.308283	1
64	\N	36	2017-12-14 16:43:56.321155	2017-12-14 16:43:56.321155	1
65	\N	37	2017-12-14 16:43:56.333296	2017-12-14 16:43:56.333296	1
66	\N	38	2017-12-14 16:43:56.346374	2017-12-14 16:43:56.346374	1
67	\N	39	2017-12-14 16:43:56.358299	2017-12-14 16:43:56.358299	1
68	\N	40	2017-12-14 16:43:56.37128	2017-12-14 16:43:56.37128	1
69	\N	41	2017-12-14 16:43:56.383196	2017-12-14 16:43:56.383196	1
70	\N	42	2017-12-14 16:43:56.396157	2017-12-14 16:43:56.396157	1
71	\N	43	2017-12-14 16:43:56.408179	2017-12-14 16:43:56.408179	1
72	\N	44	2017-12-14 16:43:56.421309	2017-12-14 16:43:56.421309	1
73	\N	45	2017-12-14 16:43:56.433171	2017-12-14 16:43:56.433171	1
74	\N	46	2017-12-14 16:43:56.446151	2017-12-14 16:43:56.446151	1
75	\N	47	2017-12-14 16:43:56.45818	2017-12-14 16:43:56.45818	1
76	\N	48	2017-12-14 16:43:56.471716	2017-12-14 16:43:56.471716	1
77	\N	49	2017-12-14 16:43:56.483248	2017-12-14 16:43:56.483248	1
78	\N	50	2017-12-14 16:43:56.49632	2017-12-14 16:43:56.49632	1
79	\N	51	2017-12-14 16:43:56.508217	2017-12-14 16:43:56.508217	1
80	\N	52	2017-12-14 16:43:56.521121	2017-12-14 16:43:56.521121	1
81	\N	53	2017-12-14 16:43:56.533158	2017-12-14 16:43:56.533158	1
82	\N	54	2017-12-14 16:43:56.546426	2017-12-14 16:43:56.546426	1
83	\N	55	2017-12-14 16:43:56.558195	2017-12-14 16:43:56.558195	1
84	\N	56	2017-12-14 16:43:56.571248	2017-12-14 16:43:56.571248	1
85	\N	57	2017-12-14 16:43:56.583305	2017-12-14 16:43:56.583305	1
86	\N	58	2017-12-14 16:43:56.596188	2017-12-14 16:43:56.596188	1
87	\N	59	2017-12-14 16:43:56.608221	2017-12-14 16:43:56.608221	1
88	\N	60	2017-12-14 16:43:56.621284	2017-12-14 16:43:56.621284	1
89	\N	61	2017-12-14 16:43:56.633181	2017-12-14 16:43:56.633181	1
90	\N	62	2017-12-14 16:43:56.646174	2017-12-14 16:43:56.646174	1
91	\N	63	2017-12-14 16:43:56.658253	2017-12-14 16:43:56.658253	1
92	\N	64	2017-12-14 16:43:56.67123	2017-12-14 16:43:56.67123	1
93	\N	65	2017-12-14 16:43:56.683399	2017-12-14 16:43:56.683399	1
94	\N	66	2017-12-14 16:43:56.696308	2017-12-14 16:43:56.696308	1
95	\N	67	2017-12-14 16:43:56.70859	2017-12-14 16:43:56.70859	1
96	\N	68	2017-12-14 16:43:56.721268	2017-12-14 16:43:56.721268	1
97	\N	69	2017-12-14 16:43:56.733466	2017-12-14 16:43:56.733466	1
98	\N	70	2017-12-14 16:43:56.746383	2017-12-14 16:43:56.746383	1
99	\N	71	2017-12-14 16:43:56.758446	2017-12-14 16:43:56.758446	1
100	\N	72	2017-12-14 16:43:56.771262	2017-12-14 16:43:56.771262	1
101	\N	73	2017-12-14 16:43:56.783413	2017-12-14 16:43:56.783413	1
102	\N	74	2017-12-14 16:43:56.79621	2017-12-14 16:43:56.79621	1
103	\N	75	2017-12-14 16:43:56.808419	2017-12-14 16:43:56.808419	1
104	\N	76	2017-12-14 16:43:56.821326	2017-12-14 16:43:56.821326	1
105	\N	77	2017-12-14 16:43:56.833349	2017-12-14 16:43:56.833349	1
106	\N	78	2017-12-14 16:43:56.846311	2017-12-14 16:43:56.846311	1
107	\N	79	2017-12-14 16:43:56.858402	2017-12-14 16:43:56.858402	1
108	\N	80	2017-12-14 16:43:56.871293	2017-12-14 16:43:56.871293	1
109	\N	81	2017-12-14 16:43:56.883398	2017-12-14 16:43:56.883398	1
110	\N	82	2017-12-14 16:43:56.896207	2017-12-14 16:43:56.896207	1
111	\N	83	2017-12-14 16:43:56.90831	2017-12-14 16:43:56.90831	1
112	\N	84	2017-12-14 16:43:56.921392	2017-12-14 16:43:56.921392	1
113	\N	85	2017-12-14 16:43:56.933463	2017-12-14 16:43:56.933463	1
114	\N	86	2017-12-14 16:43:56.946415	2017-12-14 16:43:56.946415	1
115	\N	87	2017-12-14 16:43:56.958419	2017-12-14 16:43:56.958419	1
116	\N	88	2017-12-14 16:43:56.971294	2017-12-14 16:43:56.971294	1
117	\N	89	2017-12-14 16:43:56.983376	2017-12-14 16:43:56.983376	1
118	\N	90	2017-12-14 16:43:56.996356	2017-12-14 16:43:56.996356	1
119	\N	91	2017-12-14 16:43:57.008435	2017-12-14 16:43:57.008435	1
120	\N	92	2017-12-14 16:43:57.021303	2017-12-14 16:43:57.021303	1
121	\N	93	2017-12-14 16:43:57.033352	2017-12-14 16:43:57.033352	1
122	\N	94	2017-12-14 16:43:57.046277	2017-12-14 16:43:57.046277	1
123	\N	95	2017-12-14 16:43:57.058458	2017-12-14 16:43:57.058458	1
124	\N	96	2017-12-14 16:43:57.071472	2017-12-14 16:43:57.071472	1
125	\N	97	2017-12-14 16:43:57.083169	2017-12-14 16:43:57.083169	1
126	\N	98	2017-12-14 16:43:57.096399	2017-12-14 16:43:57.096399	1
127	\N	99	2017-12-14 16:43:57.108349	2017-12-14 16:43:57.108349	1
128	\N	100	2017-12-14 16:43:57.121486	2017-12-14 16:43:57.121486	1
129	\N	101	2017-12-14 16:43:57.133361	2017-12-14 16:43:57.133361	1
130	\N	102	2017-12-14 16:43:57.146096	2017-12-14 16:43:57.146096	1
131	\N	103	2017-12-14 16:43:57.158394	2017-12-14 16:43:57.158394	1
132	\N	104	2017-12-14 16:43:57.171247	2017-12-14 16:43:57.171247	1
133	\N	105	2017-12-14 16:43:57.183241	2017-12-14 16:43:57.183241	1
134	\N	106	2017-12-14 16:43:57.196196	2017-12-14 16:43:57.196196	1
135	\N	107	2017-12-14 16:43:57.208463	2017-12-14 16:43:57.208463	1
136	\N	108	2017-12-14 16:43:57.221399	2017-12-14 16:43:57.221399	1
137	\N	109	2017-12-14 16:43:57.233386	2017-12-14 16:43:57.233386	1
138	\N	110	2017-12-14 16:43:57.258523	2017-12-14 16:43:57.258523	1
139	\N	111	2017-12-14 16:43:57.271332	2017-12-14 16:43:57.271332	1
140	\N	112	2017-12-14 16:43:57.283447	2017-12-14 16:43:57.283447	1
141	\N	113	2017-12-14 16:43:57.296523	2017-12-14 16:43:57.296523	1
142	\N	114	2017-12-14 16:43:57.308417	2017-12-14 16:43:57.308417	1
143	\N	115	2017-12-14 16:43:57.321389	2017-12-14 16:43:57.321389	1
144	\N	116	2017-12-14 16:43:57.333411	2017-12-14 16:43:57.333411	1
145	\N	117	2017-12-14 16:43:57.346364	2017-12-14 16:43:57.346364	1
146	\N	118	2017-12-14 16:43:57.358397	2017-12-14 16:43:57.358397	1
147	\N	119	2017-12-14 16:43:57.371327	2017-12-14 16:43:57.371327	1
148	\N	120	2017-12-14 16:43:57.383368	2017-12-14 16:43:57.383368	1
149	\N	121	2017-12-14 16:43:57.396419	2017-12-14 16:43:57.396419	1
150	\N	122	2017-12-14 16:43:57.408441	2017-12-14 16:43:57.408441	1
151	\N	123	2017-12-14 16:43:57.421337	2017-12-14 16:43:57.421337	1
152	\N	124	2017-12-14 16:43:57.433458	2017-12-14 16:43:57.433458	1
153	\N	125	2017-12-14 16:43:57.446439	2017-12-14 16:43:57.446439	1
154	\N	126	2017-12-14 16:43:57.458464	2017-12-14 16:43:57.458464	1
155	\N	127	2017-12-14 16:43:57.47141	2017-12-14 16:43:57.47141	1
156	\N	128	2017-12-14 16:43:57.483169	2017-12-14 16:43:57.483169	1
157	\N	129	2017-12-14 16:43:57.496399	2017-12-14 16:43:57.496399	1
158	\N	130	2017-12-14 16:43:57.508462	2017-12-14 16:43:57.508462	1
159	\N	131	2017-12-14 16:43:57.521475	2017-12-14 16:43:57.521475	1
160	\N	132	2017-12-14 16:43:57.533471	2017-12-14 16:43:57.533471	1
161	\N	133	2017-12-14 16:43:57.546423	2017-12-14 16:43:57.546423	1
162	\N	134	2017-12-14 16:43:57.558434	2017-12-14 16:43:57.558434	1
163	\N	135	2017-12-14 16:43:57.571276	2017-12-14 16:43:57.571276	1
164	\N	136	2017-12-14 16:43:57.583348	2017-12-14 16:43:57.583348	1
165	\N	137	2017-12-14 16:43:57.59635	2017-12-14 16:43:57.59635	1
166	\N	138	2017-12-14 16:43:57.60848	2017-12-14 16:43:57.60848	1
167	\N	139	2017-12-14 16:43:57.621288	2017-12-14 16:43:57.621288	1
168	\N	140	2017-12-14 16:43:57.633438	2017-12-14 16:43:57.633438	1
169	\N	141	2017-12-14 16:43:57.646428	2017-12-14 16:43:57.646428	1
170	\N	142	2017-12-14 16:43:57.658461	2017-12-14 16:43:57.658461	1
171	\N	143	2017-12-14 16:43:57.671436	2017-12-14 16:43:57.671436	1
172	\N	144	2017-12-14 16:43:57.68352	2017-12-14 16:43:57.68352	1
173	\N	145	2017-12-14 16:43:57.696466	2017-12-14 16:43:57.696466	1
174	\N	146	2017-12-14 16:43:57.708525	2017-12-14 16:43:57.708525	1
175	\N	147	2017-12-14 16:43:57.721526	2017-12-14 16:43:57.721526	1
176	\N	148	2017-12-14 16:43:57.746642	2017-12-14 16:43:57.746642	1
177	\N	149	2017-12-14 16:43:57.758631	2017-12-14 16:43:57.758631	1
178	\N	150	2017-12-14 16:43:57.771461	2017-12-14 16:43:57.771461	1
179	\N	151	2017-12-14 16:43:57.783584	2017-12-14 16:43:57.783584	1
180	\N	152	2017-12-14 16:43:57.796589	2017-12-14 16:43:57.796589	1
181	\N	153	2017-12-14 16:43:57.808471	2017-12-14 16:43:57.808471	1
182	\N	154	2017-12-14 16:43:57.821484	2017-12-14 16:43:57.821484	1
183	\N	155	2017-12-14 16:43:57.833596	2017-12-14 16:43:57.833596	1
184	\N	156	2017-12-14 16:43:57.846643	2017-12-14 16:43:57.846643	1
185	\N	157	2017-12-14 16:43:57.858673	2017-12-14 16:43:57.858673	1
186	\N	158	2017-12-14 16:43:57.871562	2017-12-14 16:43:57.871562	1
187	\N	159	2017-12-14 16:43:57.883634	2017-12-14 16:43:57.883634	1
188	\N	160	2017-12-14 16:43:57.896563	2017-12-14 16:43:57.896563	1
189	\N	161	2017-12-14 16:43:57.921657	2017-12-14 16:43:57.921657	1
190	\N	162	2017-12-14 16:43:57.955016	2017-12-14 16:43:57.955016	1
191	\N	163	2017-12-14 16:43:57.966893	2017-12-14 16:43:57.966893	1
192	\N	164	2017-12-14 16:43:57.979793	2017-12-14 16:43:57.979793	1
193	\N	165	2017-12-14 16:43:57.991949	2017-12-14 16:43:57.991949	1
194	\N	166	2017-12-14 16:43:58.004884	2017-12-14 16:43:58.004884	1
195	\N	167	2017-12-14 16:43:58.016863	2017-12-14 16:43:58.016863	1
196	\N	168	2017-12-14 16:43:58.029816	2017-12-14 16:43:58.029816	1
197	\N	169	2017-12-14 16:43:58.041911	2017-12-14 16:43:58.041911	1
198	\N	170	2017-12-14 16:43:58.05493	2017-12-14 16:43:58.05493	1
199	\N	171	2017-12-14 16:43:58.066789	2017-12-14 16:43:58.066789	1
200	\N	172	2017-12-14 16:43:58.07973	2017-12-14 16:43:58.07973	1
201	\N	173	2017-12-14 16:43:58.108505	2017-12-14 16:43:58.108505	1
202	\N	174	2017-12-14 16:43:58.121558	2017-12-14 16:43:58.121558	1
203	\N	175	2017-12-14 16:43:58.133462	2017-12-14 16:43:58.133462	1
204	\N	176	2017-12-14 16:43:58.146531	2017-12-14 16:43:58.146531	1
205	\N	177	2017-12-14 16:43:58.158562	2017-12-14 16:43:58.158562	1
206	\N	178	2017-12-14 16:43:58.171816	2017-12-14 16:43:58.171816	1
207	\N	179	2017-12-14 16:43:58.183403	2017-12-14 16:43:58.183403	1
208	\N	180	2017-12-14 16:43:58.196552	2017-12-14 16:43:58.196552	1
209	\N	181	2017-12-14 16:43:58.20854	2017-12-14 16:43:58.20854	1
210	\N	182	2017-12-14 16:43:58.221476	2017-12-14 16:43:58.221476	1
211	\N	183	2017-12-14 16:43:58.246559	2017-12-14 16:43:58.246559	1
212	\N	184	2017-12-14 16:43:58.258443	2017-12-14 16:43:58.258443	1
213	\N	185	2017-12-14 16:43:58.271447	2017-12-14 16:43:58.271447	1
214	\N	186	2017-12-14 16:43:58.283417	2017-12-14 16:43:58.283417	1
215	\N	187	2017-12-14 16:43:58.296604	2017-12-14 16:43:58.296604	1
216	\N	188	2017-12-14 16:43:58.308583	2017-12-14 16:43:58.308583	1
217	\N	189	2017-12-14 16:43:58.321546	2017-12-14 16:43:58.321546	1
218	\N	190	2017-12-14 16:43:58.33363	2017-12-14 16:43:58.33363	1
219	\N	191	2017-12-14 16:43:58.346528	2017-12-14 16:43:58.346528	1
220	\N	192	2017-12-14 16:43:58.358668	2017-12-14 16:43:58.358668	1
221	\N	193	2017-12-14 16:43:58.371505	2017-12-14 16:43:58.371505	1
222	\N	194	2017-12-14 16:43:58.383755	2017-12-14 16:43:58.383755	1
223	\N	195	2017-12-14 16:43:58.396577	2017-12-14 16:43:58.396577	1
224	\N	196	2017-12-14 16:43:58.408584	2017-12-14 16:43:58.408584	1
225	\N	197	2017-12-14 16:43:58.421506	2017-12-14 16:43:58.421506	1
226	\N	198	2017-12-14 16:43:58.441932	2017-12-14 16:43:58.441932	1
227	\N	199	2017-12-14 16:43:58.463383	2017-12-14 16:43:58.463383	1
228	\N	200	2017-12-14 16:43:58.475255	2017-12-14 16:43:58.475255	1
229	\N	201	2017-12-14 16:43:58.488235	2017-12-14 16:43:58.488235	1
230	\N	202	2017-12-14 16:43:58.500415	2017-12-14 16:43:58.500415	1
231	\N	203	2017-12-14 16:43:58.513233	2017-12-14 16:43:58.513233	1
232	\N	204	2017-12-14 16:43:58.525172	2017-12-14 16:43:58.525172	1
233	\N	205	2017-12-14 16:43:58.538214	2017-12-14 16:43:58.538214	1
234	\N	206	2017-12-14 16:43:58.550209	2017-12-14 16:43:58.550209	1
235	\N	207	2017-12-14 16:43:58.563266	2017-12-14 16:43:58.563266	1
236	\N	208	2017-12-14 16:43:58.575219	2017-12-14 16:43:58.575219	1
237	\N	209	2017-12-14 16:43:58.588352	2017-12-14 16:43:58.588352	1
238	\N	210	2017-12-14 16:43:58.600233	2017-12-14 16:43:58.600233	1
239	\N	211	2017-12-14 16:43:58.61326	2017-12-14 16:43:58.61326	1
240	\N	212	2017-12-14 16:43:58.625265	2017-12-14 16:43:58.625265	1
241	\N	213	2017-12-14 16:43:58.666266	2017-12-14 16:43:58.666266	1
242	\N	214	2017-12-14 16:43:58.696734	2017-12-14 16:43:58.696734	1
243	\N	215	2017-12-14 16:43:58.708596	2017-12-14 16:43:58.708596	1
244	\N	216	2017-12-14 16:43:58.72164	2017-12-14 16:43:58.72164	1
245	\N	217	2017-12-14 16:43:58.733623	2017-12-14 16:43:58.733623	1
246	\N	218	2017-12-14 16:43:58.746643	2017-12-14 16:43:58.746643	1
247	\N	219	2017-12-14 16:43:58.758567	2017-12-14 16:43:58.758567	1
248	\N	220	2017-12-14 16:43:58.771595	2017-12-14 16:43:58.771595	1
249	\N	221	2017-12-14 16:43:58.783598	2017-12-14 16:43:58.783598	1
250	\N	222	2017-12-14 16:43:58.796521	2017-12-14 16:43:58.796521	1
251	\N	223	2017-12-14 16:43:58.808552	2017-12-14 16:43:58.808552	1
252	\N	224	2017-12-14 16:43:58.821472	2017-12-14 16:43:58.821472	1
253	\N	225	2017-12-14 16:43:58.833564	2017-12-14 16:43:58.833564	1
254	\N	226	2017-12-14 16:43:58.85862	2017-12-14 16:43:58.85862	1
255	\N	227	2017-12-14 16:43:58.871543	2017-12-14 16:43:58.871543	1
256	\N	228	2017-12-14 16:43:58.896563	2017-12-14 16:43:58.896563	1
257	\N	229	2017-12-14 16:43:58.908683	2017-12-14 16:43:58.908683	1
258	\N	230	2017-12-14 16:43:58.921699	2017-12-14 16:43:58.921699	1
259	\N	231	2017-12-14 16:43:58.933546	2017-12-14 16:43:58.933546	1
260	\N	232	2017-12-14 16:43:58.946737	2017-12-14 16:43:58.946737	1
261	\N	233	2017-12-14 16:43:58.958639	2017-12-14 16:43:58.958639	1
262	\N	234	2017-12-14 16:43:58.971721	2017-12-14 16:43:58.971721	1
263	\N	235	2017-12-14 16:43:58.983556	2017-12-14 16:43:58.983556	1
264	\N	236	2017-12-14 16:43:58.996614	2017-12-14 16:43:58.996614	1
265	\N	237	2017-12-14 16:43:59.008786	2017-12-14 16:43:59.008786	1
266	\N	238	2017-12-14 16:43:59.021527	2017-12-14 16:43:59.021527	1
267	\N	239	2017-12-14 16:43:59.033542	2017-12-14 16:43:59.033542	1
268	\N	240	2017-12-14 16:43:59.046644	2017-12-14 16:43:59.046644	1
269	\N	241	2017-12-14 16:43:59.067058	2017-12-14 16:43:59.067058	1
270	\N	242	2017-12-14 16:43:59.079988	2017-12-14 16:43:59.079988	1
271	\N	243	2017-12-14 16:43:59.104944	2017-12-14 16:43:59.104944	1
272	\N	244	2017-12-14 16:43:59.116997	2017-12-14 16:43:59.116997	1
273	\N	245	2017-12-14 16:43:59.129973	2017-12-14 16:43:59.129973	1
274	\N	246	2017-12-14 16:43:59.141951	2017-12-14 16:43:59.141951	1
275	\N	247	2017-12-14 16:43:59.154971	2017-12-14 16:43:59.154971	1
276	\N	248	2017-12-14 16:43:59.166943	2017-12-14 16:43:59.166943	1
277	\N	249	2017-12-14 16:43:59.179859	2017-12-14 16:43:59.179859	1
278	\N	250	2017-12-14 16:43:59.191974	2017-12-14 16:43:59.191974	1
279	\N	251	2017-12-14 16:43:59.204975	2017-12-14 16:43:59.204975	1
280	\N	252	2017-12-14 16:43:59.21697	2017-12-14 16:43:59.21697	1
281	\N	253	2017-12-14 16:43:59.230022	2017-12-14 16:43:59.230022	1
282	\N	254	2017-12-14 16:43:59.241913	2017-12-14 16:43:59.241913	1
283	\N	255	2017-12-14 16:43:59.25505	2017-12-14 16:43:59.25505	1
284	\N	256	2017-12-14 16:43:59.275191	2017-12-14 16:43:59.275191	1
285	\N	257	2017-12-14 16:43:59.288353	2017-12-14 16:43:59.288353	1
286	\N	258	2017-12-14 16:43:59.305013	2017-12-14 16:43:59.305013	1
287	\N	259	2017-12-14 16:43:59.317045	2017-12-14 16:43:59.317045	1
288	\N	260	2017-12-14 16:43:59.329906	2017-12-14 16:43:59.329906	1
289	\N	261	2017-12-14 16:43:59.341824	2017-12-14 16:43:59.341824	1
290	\N	262	2017-12-14 16:43:59.354933	2017-12-14 16:43:59.354933	1
291	\N	263	2017-12-14 16:43:59.366926	2017-12-14 16:43:59.366926	1
292	\N	264	2017-12-14 16:43:59.379975	2017-12-14 16:43:59.379975	1
293	\N	265	2017-12-14 16:43:59.391913	2017-12-14 16:43:59.391913	1
294	\N	266	2017-12-14 16:43:59.406156	2017-12-14 16:43:59.406156	1
295	\N	267	2017-12-14 16:43:59.416778	2017-12-14 16:43:59.416778	1
296	\N	268	2017-12-14 16:43:59.429816	2017-12-14 16:43:59.429816	1
297	\N	269	2017-12-14 16:43:59.441931	2017-12-14 16:43:59.441931	1
298	\N	270	2017-12-14 16:43:59.455045	2017-12-14 16:43:59.455045	1
299	\N	271	2017-12-14 16:43:59.46699	2017-12-14 16:43:59.46699	1
300	\N	272	2017-12-14 16:43:59.480031	2017-12-14 16:43:59.480031	1
301	\N	273	2017-12-14 16:43:59.491902	2017-12-14 16:43:59.491902	1
302	\N	274	2017-12-14 16:43:59.504995	2017-12-14 16:43:59.504995	1
303	\N	275	2017-12-14 16:43:59.517025	2017-12-14 16:43:59.517025	1
304	\N	276	2017-12-14 16:43:59.530082	2017-12-14 16:43:59.530082	1
305	\N	277	2017-12-14 16:43:59.542003	2017-12-14 16:43:59.542003	1
306	\N	278	2017-12-14 16:43:59.554978	2017-12-14 16:43:59.554978	1
307	\N	279	2017-12-14 16:43:59.567005	2017-12-14 16:43:59.567005	1
308	\N	280	2017-12-14 16:43:59.58002	2017-12-14 16:43:59.58002	1
309	\N	281	2017-12-14 16:43:59.592013	2017-12-14 16:43:59.592013	1
310	\N	282	2017-12-14 16:43:59.604883	2017-12-14 16:43:59.604883	1
311	\N	283	2017-12-14 16:43:59.616798	2017-12-14 16:43:59.616798	1
312	\N	284	2017-12-14 16:43:59.630115	2017-12-14 16:43:59.630115	1
313	\N	285	2017-12-14 16:43:59.675442	2017-12-14 16:43:59.675442	1
314	\N	286	2017-12-14 16:43:59.696853	2017-12-14 16:43:59.696853	1
315	\N	287	2017-12-14 16:43:59.708591	2017-12-14 16:43:59.708591	1
316	\N	288	2017-12-14 16:43:59.721679	2017-12-14 16:43:59.721679	1
317	\N	289	2017-12-14 16:43:59.733696	2017-12-14 16:43:59.733696	1
318	\N	290	2017-12-14 16:43:59.746791	2017-12-14 16:43:59.746791	1
319	\N	291	2017-12-14 16:43:59.75887	2017-12-14 16:43:59.75887	1
320	\N	292	2017-12-14 16:43:59.771816	2017-12-14 16:43:59.771816	1
321	\N	293	2017-12-14 16:43:59.783718	2017-12-14 16:43:59.783718	1
322	\N	294	2017-12-14 16:43:59.796606	2017-12-14 16:43:59.796606	1
323	\N	295	2017-12-14 16:43:59.808675	2017-12-14 16:43:59.808675	1
324	\N	296	2017-12-14 16:43:59.838228	2017-12-14 16:43:59.838228	1
325	\N	297	2017-12-14 16:43:59.85042	2017-12-14 16:43:59.85042	1
326	\N	298	2017-12-14 16:43:59.863258	2017-12-14 16:43:59.863258	1
327	\N	299	2017-12-14 16:43:59.875344	2017-12-14 16:43:59.875344	1
328	\N	300	2017-12-14 16:43:59.888211	2017-12-14 16:43:59.888211	1
329	\N	301	2017-12-14 16:43:59.900309	2017-12-14 16:43:59.900309	1
330	\N	302	2017-12-14 16:43:59.913285	2017-12-14 16:43:59.913285	1
331	\N	303	2017-12-14 16:43:59.925394	2017-12-14 16:43:59.925394	1
332	\N	304	2017-12-14 16:43:59.938224	2017-12-14 16:43:59.938224	1
333	\N	305	2017-12-14 16:43:59.950454	2017-12-14 16:43:59.950454	1
334	\N	306	2017-12-14 16:43:59.963307	2017-12-14 16:43:59.963307	1
335	\N	307	2017-12-14 16:43:59.97538	2017-12-14 16:43:59.97538	1
336	\N	308	2017-12-14 16:43:59.988295	2017-12-14 16:43:59.988295	1
337	\N	309	2017-12-14 16:44:00.000229	2017-12-14 16:44:00.000229	1
338	\N	310	2017-12-14 16:44:00.013714	2017-12-14 16:44:00.013714	1
339	\N	311	2017-12-14 16:44:00.025764	2017-12-14 16:44:00.025764	1
340	\N	312	2017-12-14 16:44:00.038727	2017-12-14 16:44:00.038727	1
341	\N	313	2017-12-14 16:44:00.050476	2017-12-14 16:44:00.050476	1
342	\N	314	2017-12-14 16:44:00.06336	2017-12-14 16:44:00.06336	1
343	\N	315	2017-12-14 16:44:00.075472	2017-12-14 16:44:00.075472	1
344	\N	316	2017-12-14 16:44:00.088247	2017-12-14 16:44:00.088247	1
345	\N	317	2017-12-14 16:44:00.100217	2017-12-14 16:44:00.100217	1
346	\N	318	2017-12-14 16:44:00.113574	2017-12-14 16:44:00.113574	1
347	\N	319	2017-12-14 16:44:00.150728	2017-12-14 16:44:00.150728	1
348	\N	320	2017-12-14 16:44:00.183826	2017-12-14 16:44:00.183826	1
349	\N	321	2017-12-14 16:44:00.196826	2017-12-14 16:44:00.196826	1
350	\N	322	2017-12-14 16:44:00.208731	2017-12-14 16:44:00.208731	1
351	\N	323	2017-12-14 16:44:00.221862	2017-12-14 16:44:00.221862	1
352	\N	324	2017-12-14 16:44:00.233698	2017-12-14 16:44:00.233698	1
353	\N	325	2017-12-14 16:44:00.246744	2017-12-14 16:44:00.246744	1
354	\N	326	2017-12-14 16:44:00.258514	2017-12-14 16:44:00.258514	1
355	\N	327	2017-12-14 16:44:00.27173	2017-12-14 16:44:00.27173	1
356	\N	328	2017-12-14 16:44:00.283829	2017-12-14 16:44:00.283829	1
357	\N	329	2017-12-14 16:44:00.296817	2017-12-14 16:44:00.296817	1
358	\N	330	2017-12-14 16:44:00.308791	2017-12-14 16:44:00.308791	1
359	\N	331	2017-12-14 16:44:00.337528	2017-12-14 16:44:00.337528	1
360	\N	332	2017-12-14 16:44:00.363469	2017-12-14 16:44:00.363469	1
361	\N	333	2017-12-14 16:44:00.375458	2017-12-14 16:44:00.375458	1
362	\N	334	2017-12-14 16:44:00.388306	2017-12-14 16:44:00.388306	1
363	\N	335	2017-12-14 16:44:00.400469	2017-12-14 16:44:00.400469	1
364	\N	336	2017-12-14 16:44:00.413323	2017-12-14 16:44:00.413323	1
365	\N	337	2017-12-14 16:44:00.425509	2017-12-14 16:44:00.425509	1
366	\N	338	2017-12-14 16:44:00.438282	2017-12-14 16:44:00.438282	1
367	\N	339	2017-12-14 16:44:00.450337	2017-12-14 16:44:00.450337	1
368	\N	340	2017-12-14 16:44:00.463212	2017-12-14 16:44:00.463212	1
369	\N	341	2017-12-14 16:44:00.475676	2017-12-14 16:44:00.475676	1
370	\N	342	2017-12-14 16:44:00.488284	2017-12-14 16:44:00.488284	1
371	\N	343	2017-12-14 16:44:00.500483	2017-12-14 16:44:00.500483	1
372	\N	344	2017-12-14 16:44:00.513407	2017-12-14 16:44:00.513407	1
373	\N	345	2017-12-14 16:44:00.52545	2017-12-14 16:44:00.52545	1
374	\N	346	2017-12-14 16:44:00.538351	2017-12-14 16:44:00.538351	1
375	\N	347	2017-12-14 16:44:00.550397	2017-12-14 16:44:00.550397	1
376	\N	348	2017-12-14 16:44:00.563275	2017-12-14 16:44:00.563275	1
377	\N	349	2017-12-14 16:44:00.587827	2017-12-14 16:44:00.587827	1
378	\N	350	2017-12-14 16:44:00.600423	2017-12-14 16:44:00.600423	1
379	\N	351	2017-12-14 16:44:00.613334	2017-12-14 16:44:00.613334	1
380	\N	352	2017-12-14 16:44:00.625195	2017-12-14 16:44:00.625195	1
381	\N	353	2017-12-14 16:44:00.638504	2017-12-14 16:44:00.638504	1
382	\N	354	2017-12-14 16:44:00.650404	2017-12-14 16:44:00.650404	1
383	\N	355	2017-12-14 16:44:00.663291	2017-12-14 16:44:00.663291	1
384	\N	356	2017-12-14 16:44:00.675344	2017-12-14 16:44:00.675344	1
385	\N	357	2017-12-14 16:44:00.688487	2017-12-14 16:44:00.688487	1
386	\N	358	2017-12-14 16:44:00.700553	2017-12-14 16:44:00.700553	1
387	\N	359	2017-12-14 16:44:00.713458	2017-12-14 16:44:00.713458	1
388	\N	360	2017-12-14 16:44:00.725543	2017-12-14 16:44:00.725543	1
389	\N	361	2017-12-14 16:44:00.738513	2017-12-14 16:44:00.738513	1
390	\N	362	2017-12-14 16:44:00.763482	2017-12-14 16:44:00.763482	1
391	\N	363	2017-12-14 16:44:00.775431	2017-12-14 16:44:00.775431	1
392	\N	364	2017-12-14 16:44:00.788486	2017-12-14 16:44:00.788486	1
393	\N	365	2017-12-14 16:44:00.800505	2017-12-14 16:44:00.800505	1
394	\N	366	2017-12-14 16:44:00.81345	2017-12-14 16:44:00.81345	1
395	\N	367	2017-12-14 16:44:00.825435	2017-12-14 16:44:00.825435	1
396	\N	368	2017-12-14 16:44:00.83841	2017-12-14 16:44:00.83841	1
397	\N	369	2017-12-14 16:44:00.850342	2017-12-14 16:44:00.850342	1
398	\N	370	2017-12-14 16:44:00.863157	2017-12-14 16:44:00.863157	1
399	\N	371	2017-12-14 16:44:00.875511	2017-12-14 16:44:00.875511	1
400	\N	372	2017-12-14 16:44:00.888427	2017-12-14 16:44:00.888427	1
401	\N	373	2017-12-14 16:44:00.900508	2017-12-14 16:44:00.900508	1
402	\N	374	2017-12-14 16:44:00.913414	2017-12-14 16:44:00.913414	1
403	\N	375	2017-12-14 16:44:00.925382	2017-12-14 16:44:00.925382	1
404	\N	376	2017-12-14 16:44:00.938437	2017-12-14 16:44:00.938437	1
405	\N	377	2017-12-14 16:44:00.950569	2017-12-14 16:44:00.950569	1
406	\N	378	2017-12-14 16:44:00.963474	2017-12-14 16:44:00.963474	1
407	\N	379	2017-12-14 16:44:00.975457	2017-12-14 16:44:00.975457	1
408	\N	380	2017-12-14 16:44:00.988473	2017-12-14 16:44:00.988473	1
409	\N	381	2017-12-14 16:44:01.008924	2017-12-14 16:44:01.008924	1
410	\N	382	2017-12-14 16:44:01.022869	2017-12-14 16:44:01.022869	1
411	\N	383	2017-12-14 16:44:01.092252	2017-12-14 16:44:01.092252	1
412	\N	384	2017-12-14 16:44:01.105169	2017-12-14 16:44:01.105169	1
413	\N	385	2017-12-14 16:44:01.117209	2017-12-14 16:44:01.117209	1
414	\N	386	2017-12-14 16:44:01.13016	2017-12-14 16:44:01.13016	1
415	\N	387	2017-12-14 16:44:01.142116	2017-12-14 16:44:01.142116	1
416	\N	388	2017-12-14 16:44:01.163522	2017-12-14 16:44:01.163522	1
417	\N	389	2017-12-14 16:44:01.175819	2017-12-14 16:44:01.175819	1
418	\N	390	2017-12-14 16:44:01.188491	2017-12-14 16:44:01.188491	1
419	\N	391	2017-12-14 16:44:01.200613	2017-12-14 16:44:01.200613	1
420	\N	392	2017-12-14 16:44:01.213549	2017-12-14 16:44:01.213549	1
421	\N	393	2017-12-14 16:44:01.225568	2017-12-14 16:44:01.225568	1
422	\N	394	2017-12-14 16:44:01.238597	2017-12-14 16:44:01.238597	1
423	\N	395	2017-12-14 16:44:01.250363	2017-12-14 16:44:01.250363	1
424	\N	396	2017-12-14 16:44:01.263506	2017-12-14 16:44:01.263506	1
425	\N	397	2017-12-14 16:44:01.275448	2017-12-14 16:44:01.275448	1
426	\N	398	2017-12-14 16:44:01.288588	2017-12-14 16:44:01.288588	1
427	\N	399	2017-12-14 16:44:01.300487	2017-12-14 16:44:01.300487	1
428	\N	400	2017-12-14 16:44:01.313527	2017-12-14 16:44:01.313527	1
429	\N	401	2017-12-14 16:44:01.32558	2017-12-14 16:44:01.32558	1
430	\N	402	2017-12-14 16:44:01.338564	2017-12-14 16:44:01.338564	1
431	\N	403	2017-12-14 16:44:01.350551	2017-12-14 16:44:01.350551	1
432	\N	404	2017-12-14 16:44:01.363494	2017-12-14 16:44:01.363494	1
433	\N	405	2017-12-14 16:44:01.37574	2017-12-14 16:44:01.37574	1
434	\N	406	2017-12-14 16:44:01.38911	2017-12-14 16:44:01.38911	1
435	\N	407	2017-12-14 16:44:01.437484	2017-12-14 16:44:01.437484	1
436	\N	408	2017-12-14 16:44:01.49293	2017-12-14 16:44:01.49293	1
437	\N	421	2017-12-14 16:44:01.505597	2017-12-14 16:44:01.505597	1
512	\N	12	2017-12-15 11:05:43.299128	2017-12-15 11:05:43.299128	2
513	\N	13	2017-12-15 11:05:43.306748	2017-12-15 11:05:43.306748	2
514	\N	14	2017-12-15 11:05:43.315141	2017-12-15 11:05:43.315141	2
515	\N	15	2017-12-15 11:05:43.323366	2017-12-15 11:05:43.323366	2
516	\N	16	2017-12-15 11:05:43.331766	2017-12-15 11:05:43.331766	2
517	\N	18	2017-12-15 11:05:43.340142	2017-12-15 11:05:43.340142	2
518	\N	19	2017-12-15 11:05:43.348501	2017-12-15 11:05:43.348501	2
519	\N	20	2017-12-15 11:05:43.356692	2017-12-15 11:05:43.356692	2
520	\N	21	2017-12-15 11:05:43.3654	2017-12-15 11:05:43.3654	2
521	\N	22	2017-12-15 11:05:43.373398	2017-12-15 11:05:43.373398	2
522	\N	23	2017-12-15 11:05:43.381787	2017-12-15 11:05:43.381787	2
523	\N	24	2017-12-15 11:05:43.390115	2017-12-15 11:05:43.390115	2
524	\N	25	2017-12-15 11:05:43.398066	2017-12-15 11:05:43.398066	2
525	\N	26	2017-12-15 11:05:43.406421	2017-12-15 11:05:43.406421	2
526	\N	171	2017-12-15 11:05:43.414932	2017-12-15 11:05:43.414932	2
527	\N	174	2017-12-15 11:05:43.423434	2017-12-15 11:05:43.423434	2
528	\N	175	2017-12-15 11:05:43.431687	2017-12-15 11:05:43.431687	2
529	\N	186	2017-12-15 11:05:43.439934	2017-12-15 11:05:43.439934	2
694	\N	12	2018-02-15 11:37:57.315144	2018-02-15 11:37:57.315144	4
695	\N	13	2018-02-15 11:37:57.318296	2018-02-15 11:37:57.318296	4
696	\N	14	2018-02-15 11:37:57.321062	2018-02-15 11:37:57.321062	4
697	\N	15	2018-02-15 11:37:57.323775	2018-02-15 11:37:57.323775	4
698	\N	16	2018-02-15 11:37:57.326449	2018-02-15 11:37:57.326449	4
699	\N	18	2018-02-15 11:37:57.329142	2018-02-15 11:37:57.329142	4
700	\N	19	2018-02-15 11:37:57.331803	2018-02-15 11:37:57.331803	4
701	\N	20	2018-02-15 11:37:57.334472	2018-02-15 11:37:57.334472	4
702	\N	21	2018-02-15 11:37:57.337153	2018-02-15 11:37:57.337153	4
703	\N	22	2018-02-15 11:37:57.339827	2018-02-15 11:37:57.339827	4
704	\N	23	2018-02-15 11:37:57.34249	2018-02-15 11:37:57.34249	4
705	\N	24	2018-02-15 11:37:57.345095	2018-02-15 11:37:57.345095	4
706	\N	25	2018-02-15 11:37:57.347734	2018-02-15 11:37:57.347734	4
707	\N	26	2018-02-15 11:37:57.350351	2018-02-15 11:37:57.350351	4
708	\N	72	2018-02-15 11:37:57.352913	2018-02-15 11:37:57.352913	4
709	\N	73	2018-02-15 11:37:57.355424	2018-02-15 11:37:57.355424	4
710	\N	74	2018-02-15 11:37:57.358147	2018-02-15 11:37:57.358147	4
711	\N	75	2018-02-15 11:37:57.360745	2018-02-15 11:37:57.360745	4
712	\N	76	2018-02-15 11:37:57.36322	2018-02-15 11:37:57.36322	4
713	\N	171	2018-02-15 11:37:57.365719	2018-02-15 11:37:57.365719	4
714	\N	173	2018-02-15 11:37:57.368245	2018-02-15 11:37:57.368245	4
715	\N	175	2018-02-15 11:37:57.370715	2018-02-15 11:37:57.370715	4
716	\N	291	2018-02-15 11:37:57.373194	2018-02-15 11:37:57.373194	4
717	\N	292	2018-02-15 11:37:57.375632	2018-02-15 11:37:57.375632	4
718	\N	293	2018-02-15 11:37:57.378051	2018-02-15 11:37:57.378051	4
719	\N	294	2018-02-15 11:37:57.380538	2018-02-15 11:37:57.380538	4
720	\N	295	2018-02-15 11:37:57.382979	2018-02-15 11:37:57.382979	4
721	\N	297	2018-02-15 11:37:57.385414	2018-02-15 11:37:57.385414	4
722	\N	298	2018-02-15 11:37:57.38786	2018-02-15 11:37:57.38786	4
723	\N	299	2018-02-15 11:37:57.390259	2018-02-15 11:37:57.390259	4
724	\N	300	2018-02-15 11:37:57.39271	2018-02-15 11:37:57.39271	4
725	\N	301	2018-02-15 11:37:57.395153	2018-02-15 11:37:57.395153	4
726	\N	302	2018-02-15 11:37:57.397549	2018-02-15 11:37:57.397549	4
\.


--
-- Name: permissions_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('permissions_roles_id_seq', 726, true);


--
-- Data for Name: person_contact_infos; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY person_contact_infos (id, person_id, contact_number, email, postal_address, location_address, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, suburb_id) FROM stdin;
34	35	0276113371                                        	nana@gmail.com				\N	\N	t	f	2017-12-15 15:36:29.002902	2018-01-05 14:14:20.113513	1
33	34	0243554433	dav@gmail.com				\N	\N	t	f	2017-12-15 11:15:46.024237	2018-01-05 14:14:33.317414	2
38	38	09876543	phil@gmail.com				\N	\N	t	f	2018-01-05 15:07:45.524892	2018-01-05 15:07:45.524892	2
31	32	0243112909	kobby@gmail.com				\N	\N	t	f	2017-12-14 19:58:18.022553	2018-01-05 17:50:27.603559	1
39	39	0248152204                                        		\N	\N	\N	\N	\N	t	f	2018-01-09 16:11:03.781859	2018-01-09 16:11:03.781859	\N
40	41	0244567812                                        		\N	\N	\N	\N	\N	t	f	2018-01-10 14:42:25.908808	2018-01-10 14:42:25.908808	\N
37	37	0245667790	jerry@gmail.com		Lapaz		\N	\N	t	f	2018-01-05 14:18:50.075978	2018-01-16 10:05:06.513583	2
41	42	0244786611                                        		\N	\N	\N	\N	\N	t	f	2018-01-19 09:46:18.76299	2018-01-19 09:46:18.76299	\N
42	43	0244786611                                        		\N	\N	\N	\N	\N	t	f	2018-01-19 10:11:05.247369	2018-01-19 10:11:05.247369	\N
43	44	0248152205                                        		\N	\N	\N	\N	\N	t	f	2018-01-19 12:50:31.374838	2018-01-19 12:50:31.374838	\N
45	46	0276113372                                        		\N	\N	\N	\N	\N	t	f	2018-01-22 11:49:44.56928	2018-01-22 11:49:44.56928	\N
44	45	0244567234                                        					\N	\N	t	f	2018-01-22 09:59:20.509773	2018-01-22 11:51:51.172176	1
46	47	000044444                                         		\N	\N	\N	\N	\N	t	f	2018-01-23 06:31:52.117547	2018-01-23 06:31:52.117547	\N
47	48	444445555                                         					\N	\N	t	f	2018-01-23 06:32:00.530496	2018-01-23 08:52:03.583548	\N
48	49	0205869653                                        		\N	\N	\N	\N	\N	t	f	2018-01-23 09:54:45.941642	2018-01-23 09:54:45.941642	\N
49	50	0504899386                                        		\N	\N	\N	\N	\N	t	f	2018-01-23 11:27:10.169543	2018-01-23 11:27:10.169543	\N
51	52	44454445                                          		\N	\N	\N	\N	\N	t	f	2018-01-23 19:42:45.268897	2018-01-23 19:42:45.268897	\N
52	53	44445555                                          		\N	\N	\N	\N	\N	t	f	2018-01-23 19:43:10.833504	2018-01-23 19:43:10.833504	\N
53	54	45444455                                          		\N	\N	\N	\N	\N	t	f	2018-01-23 19:48:07.117042	2018-01-23 19:48:07.117042	\N
50	51	74793530                                          	h@aol.com	baabu close , ksi			\N	\N	t	f	2018-01-23 19:42:24.287349	2018-01-23 21:15:04.419757	1
55	56	0244567896                                        					36	\N	t	f	2018-01-25 10:38:29.482821	2018-01-29 10:24:42.837379	2
54	55	000886654                                         					36	\N	t	f	2018-01-23 20:38:42.20895	2018-01-29 10:28:48.064241	\N
56	57	0207604492                                        		\N	\N	\N	\N	\N	t	f	2018-01-29 12:13:15.008472	2018-01-29 12:13:15.008472	\N
57	58	0246220138                                        		\N	\N	\N	\N	\N	t	f	2018-02-01 10:05:06.030573	2018-02-01 10:05:06.030573	\N
58	59	77774344                                          		\N	\N	\N	\N	\N	t	f	2018-02-05 22:42:40.537806	2018-02-05 22:42:40.537806	\N
59	60	9274488497                                        					36	\N	t	f	2018-02-08 14:51:47.004518	2018-02-08 14:51:47.004518	\N
60	61	9274488497                                        					36	\N	t	f	2018-02-08 15:29:32.547568	2018-02-08 15:29:32.547568	\N
61	62	095049509405045					36	\N	t	f	2018-02-08 15:44:49.582009	2018-02-08 16:08:33.490451	\N
36	36	0243554455	clemsedem@gmail.com				36	\N	t	f	2018-01-05 11:52:52.852373	2018-02-08 16:10:55.339339	2
63	64	0234567890                                        					36	\N	t	f	2018-02-12 10:12:20.766132	2018-02-12 10:12:20.766132	\N
64	65	0234567890                                        					36	\N	t	f	2018-02-12 10:12:21.192304	2018-02-12 10:12:21.192304	\N
65	66	0234567890                                        					36	\N	t	f	2018-02-12 12:17:42.301162	2018-02-12 12:17:42.301162	4
66	67	9274488497                                        					36	\N	t	f	2018-02-12 15:25:22.282437	2018-02-12 15:25:22.282437	\N
67	68	05567123132                                       					36	\N	t	f	2018-02-12 16:09:35.712532	2018-02-12 16:09:35.712532	3
68	69	8hsjsaoj                                          					36	\N	t	f	2018-02-12 16:20:31.999955	2018-02-12 16:20:31.999955	1
69	70	+23320574686377                                   					32	\N	t	f	2018-02-14 17:20:22.622771	2018-02-14 17:20:22.622771	\N
70	71	0234770989                                        					36	\N	t	f	2018-02-15 15:26:02.717291	2018-02-15 15:26:02.717291	\N
71	72	33332222                                          					36	\N	t	f	2018-02-28 08:57:23.13744	2018-02-28 08:57:23.13744	\N
72	73	0578119303                                        					36	\N	t	f	2018-02-28 09:40:52.705011	2018-02-28 09:40:52.705011	1
73	74	0244675123                                        					36	\N	t	f	2018-02-28 09:41:41.495672	2018-02-28 09:41:41.495672	1
74	75	7iq9w9qw9wuw                                      					36	\N	t	f	2018-02-28 10:10:32.661997	2018-02-28 10:10:32.661997	1
75	76	0234770989                                        					36	\N	t	f	2018-02-28 10:24:59.911132	2018-02-28 10:24:59.911132	\N
76	77	0234770989                                        					36	\N	t	f	2018-02-28 10:34:48.697251	2018-02-28 10:34:48.697251	\N
77	78	0234770989                                        					36	\N	t	f	2018-02-28 10:40:02.080652	2018-02-28 10:40:02.080652	\N
78	79	0234770989                                        					36	\N	t	f	2018-02-28 10:57:00.14586	2018-02-28 10:57:00.14586	\N
81	82	024111111111					36	\N	t	f	2018-03-02 15:07:43.264502	2018-03-02 15:07:43.264502	4
62	63	0243556600					36	\N	t	f	2018-02-09 17:52:30.720073	2018-02-28 16:14:57.116528	1
82	83	023455442					36	\N	t	f	2018-03-02 15:22:06.739443	2018-03-02 15:22:06.739443	2
83	84	023466557					36	\N	t	f	2018-03-02 15:34:53.713912	2018-03-02 15:34:53.713912	1
79	80	008398493	clara@appsnmobilesolutions.com	1234	1234		36	\N	t	f	2018-03-02 11:36:54.358382	2018-03-02 14:59:50.422977	2
80	81	998789243	bob@gmail.com	0000	0000		36	\N	t	f	2018-03-02 15:01:13.906035	2018-03-02 15:36:56.085102	4
84	85	030245961	ron@gmail.com	4321	4321		84	\N	t	f	2018-03-02 15:42:22.428788	2018-03-02 15:42:22.428788	3
\.


--
-- Name: person_contact_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('person_contact_infos_id_seq', 84, true);


--
-- Data for Name: person_info_extras; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY person_info_extras (id, person_id, specialty_id, specialty_duration, has_specialty, forign_training, foreign_institution_desc, profession_group_id, licence_number, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, foreign_licence_number) FROM stdin;
1	14	1	2	t	t	Lololo	1	68783836		\N	\N	t	f	2017-11-30 18:42:16.283642	2017-12-05 11:56:12.569784	hohoh
2	51	2	20	t	f	Rcog	1	1235567	<p>gfuyhko;</p>	\N	\N	t	f	2018-01-23 21:13:24.091471	2018-01-23 21:13:24.091471	456790
\.


--
-- Name: person_info_extras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('person_info_extras_id_seq', 2, true);


--
-- Data for Name: person_infos; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY person_infos (id, surname, other_names, person_type_id, entity_id, user_id, active_status, del_status, created_at, updated_at, full_name, dob, reg_id, pd_sub) FROM stdin;
32	Appiah	Kobby	D	\N	\N	t	f	2017-12-14 19:58:18.020366	2018-01-04 18:06:41.879384	\N	\N	\N	t
35	Osafo	Nana	C	\N	\N	t	f	2017-12-15 15:36:28.956634	2018-01-05 14:14:20.111227	\N	\N	25	f
34	Asamoah	David	N	\N	\N	t	f	2017-12-15 11:15:46.021883	2018-01-05 14:14:33.315406	\N	\N	\N	f
37	Bansah	Jerry	D	\N	\N	t	f	2018-01-05 14:18:50.07363	2018-01-05 14:18:50.07363	\N	1970-04-15	\N	t
38	Phil	Lips	D	\N	\N	t	f	2018-01-05 15:07:45.5147	2018-01-05 15:07:45.5147	\N	\N	\N	t
39	Clem	Sedem	C	\N	\N	t	f	2018-01-09 16:11:03.778823	2018-01-09 16:11:03.778823	\N	\N	27	\N
43	Koff	Kofikofi	D	\N	\N	t	f	2018-01-19 10:11:05.244887	2018-01-19 10:11:05.244887	\N	\N	28	\N
44	Abe	Clem	C	\N	\N	t	f	2018-01-19 12:50:31.371715	2018-01-19 12:50:31.371715	\N	\N	37	\N
46	Alfred	Kwame	C	\N	\N	t	f	2018-01-22 11:49:44.5591	2018-01-22 11:49:44.5591	\N	\N	29	\N
45	New	Doctor	D	\N	\N	t	f	2018-01-22 09:59:20.506636	2018-01-22 11:53:11.664891	\N	\N	38	t
47	Nana Yaa	Vp	C	\N	\N	t	f	2018-01-23 06:31:52.107538	2018-01-23 06:31:52.107538	\N	\N	47	\N
48	Gloria	Appiah	D	\N	\N	t	f	2018-01-23 06:32:00.528188	2018-01-23 08:52:03.582159	\N	\N	46	t
49	Addae	Freda	C	\N	\N	t	f	2018-01-23 09:54:45.931389	2018-01-23 09:54:45.931389	\N	\N	48	t
50	Tetteh	Andrew	C	\N	\N	t	f	2018-01-23 11:27:10.167024	2018-01-23 11:27:10.167024	\N	\N	49	t
52	Samuel	Samuel	D	\N	\N	t	f	2018-01-23 19:42:45.266589	2018-01-23 19:42:45.266589	\N	\N	45	t
53	Apps	Samuel	D	\N	\N	t	f	2018-01-23 19:43:10.831068	2018-01-23 19:43:10.831068	\N	\N	34	t
54	Maid	Angela	C	\N	\N	t	f	2018-01-23 19:48:07.114482	2018-01-23 19:48:07.114482	\N	\N	50	t
51	Koby	Appiah	D	\N	\N	t	f	2018-01-23 19:42:24.27649	2018-01-23 21:15:04.418172	\N	2018-01-26	26	t
56	Best	Doc	D	\N	36	t	f	2018-01-25 10:38:29.480001	2018-01-29 10:24:42.836041	\N	\N	54	t
55	Appiah	K	C	\N	36	t	f	2018-01-23 20:38:42.198343	2018-01-29 10:28:48.062815	\N	\N	51	t
57	Tuwmasi	Kwaku	C	\N	\N	t	f	2018-01-29 12:13:14.997839	2018-01-29 12:13:14.997839	\N	\N	58	t
58	Asamoah	David	C	\N	\N	t	f	2018-02-01 10:05:06.019589	2018-02-01 10:05:06.019589	\N	\N	59	t
59	Boateng	Isaac	C	\N	\N	t	f	2018-02-05 22:42:40.510869	2018-02-05 22:42:40.510869	\N	\N	60	t
60	David	Kojo	N	\N	\N	t	f	2018-02-08 14:51:47.002495	2018-02-08 14:51:47.002495	\N	\N	\N	f
61	David	Kojo	N	\N	\N	t	f	2018-02-08 15:29:32.546073	2018-02-08 15:29:32.546073	\N	\N	\N	f
62	David	Kojo	N	\N	36	t	f	2018-02-08 15:44:49.580528	2018-02-08 16:08:33.488762	\N	\N	\N	f
36	Clem	Sedem	D	\N	36	t	f	2018-01-05 11:52:52.814418	2018-02-08 16:10:55.337771	\N	1991-03-02	\N	f
67	David	Kojo	N	\N	36	t	f	2018-02-12 15:25:22.281147	2018-02-12 15:25:22.281147	\N	\N	61	f
68	Docu	Docu	D	\N	36	t	f	2018-02-12 16:09:35.710752	2018-02-12 16:09:35.710752	\N	\N	57	f
69	Sam	Hsj	D	\N	36	t	f	2018-02-12 16:20:31.998627	2018-02-12 16:20:31.998627	\N	\N	30	t
70	Appiah-Sakyi	Nyamekye	C	\N	32	t	f	2018-02-14 17:20:22.621165	2018-02-14 17:20:22.621165	\N	\N	63	f
71	Han	Dee	C	\N	36	t	f	2018-02-15 15:26:02.71579	2018-02-15 15:26:02.71579	\N	\N	64	f
72	Adoma	Nana	C	\N	36	t	f	2018-02-28 08:57:23.135865	2018-02-28 08:57:23.135865	\N	\N	35	f
73	Joe	Man	D	\N	36	t	f	2018-02-28 09:40:52.703743	2018-02-28 09:40:52.703743	\N	\N	53	f
74	Bambi	Bami1	D	\N	36	t	f	2018-02-28 09:41:41.494424	2018-02-28 09:41:41.494424	\N	\N	36	f
75	Sansn	Nsnsn	D	\N	36	t	f	2018-02-28 10:10:32.660658	2018-02-28 10:10:32.660658	\N	\N	31	f
76	Dee	Dee	C	\N	36	t	f	2018-02-28 10:24:59.909763	2018-02-28 10:24:59.909763	\N	\N	64	f
77	Dee	Dee	C	\N	36	t	f	2018-02-28 10:34:48.695975	2018-02-28 10:34:48.695975	\N	\N	64	f
78	Dee	Dee	C	\N	36	t	f	2018-02-28 10:40:02.07933	2018-02-28 10:40:02.07933	\N	\N	64	f
79	Dee	Dee	C	\N	36	t	f	2018-02-28 10:57:00.144504	2018-02-28 10:57:00.144504	\N	\N	64	f
63	Ago	Ame	D	\N	36	t	f	2018-02-09 17:52:30.718442	2018-02-28 16:14:57.115065	\N	\N	\N	t
80	Quaye	Mady	C	\N	36	t	f	2018-03-02 11:36:54.356315	2018-03-02 14:59:50.42129	\N	\N	65	f
82	Binin	Aj	D	\N	36	t	f	2018-03-02 15:07:43.263094	2018-03-02 15:07:43.263094	\N	2018-03-08	\N	t
83	Addae	Freda	N	\N	36	t	f	2018-03-02 15:22:06.738016	2018-03-02 15:22:06.738016	\N	\N	\N	f
84	Quaye	Clara	N	\N	36	t	f	2018-03-02 15:34:53.712628	2018-03-02 15:34:53.712628	\N	\N	\N	f
81	Bob	Kojo	C	\N	36	t	f	2018-03-02 15:01:13.904117	2018-03-02 15:36:56.083943	\N	2018-03-02	\N	f
85	Doe	Ron	C	\N	84	t	f	2018-03-02 15:42:22.427459	2018-03-02 15:42:22.427459	\N	2018-02-06	\N	f
\.


--
-- Name: person_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('person_infos_id_seq', 85, true);


--
-- Data for Name: person_type_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY person_type_masters (id, user_type_title, comment, entity, user_id, active_status, del_status, created_at, updated_at, ref_id) FROM stdin;
5	Patient		\N	\N	t	f	2017-11-03 10:21:38.829768	2017-11-11 21:27:13.590284	C
4	Laboratorist		\N	\N	t	f	2017-11-03 10:18:30.666444	2017-11-11 21:27:22.118388	L
3	Pharmacist		\N	\N	t	f	2017-11-03 10:11:50.305588	2017-11-11 21:27:30.88799	P
2	Nurse		\N	\N	t	f	2017-11-03 10:10:10.009859	2017-11-11 21:27:40.149662	N
1	Doctor		\N	\N	t	f	2017-11-03 09:51:40.20957	2017-11-11 21:27:47.779049	D
\.


--
-- Name: person_type_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('person_type_masters_id_seq', 8, true);


--
-- Data for Name: pre_appointments; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY pre_appointments (id, provider_id, requester_id, requester_cat, beneficiary_name, appointment_type_id, proposed_date, proposed_time, complaint_desc, prev_medical_history, req_urgency, comment, user_id, active_status, del_status, created_at, updated_at, confirm_status, src, allergies, suburb_id, has_pd, pd_name, medication, duration) FROM stdin;
1	\N	35	S		PD	2018-01-18 12:08:04.430862	\N	\N	\N	S	\N	\N	t	f	2018-01-08 15:32:34.699791	2018-01-18 12:08:04.431968	t	APP	\N	1	t	Nana Osafo	\N	\N
2	\N	35	S		PD	2018-01-18 14:25:33.308085	\N	\N	\N	S	\N	\N	t	f	2018-01-08 22:20:02.876968	2018-01-18 14:25:33.309289	t	APP	\N	1	t	\N	\N	\N
9	\N	44	S		PD	2018-01-19 13:00:11.259906	\N	\N	\N	S	\N	\N	t	f	2018-01-19 12:53:55.491499	2018-01-19 13:00:11.260952	t	APP	\N	2	t	\N	\N	\N
43	\N	35	\N	\N	PDHC	2018-01-30 00:00:00	22:32:00	\N	\N	\N	\N	\N	t	f	2018-01-25 10:27:18.851018	2018-01-25 10:27:18.851018	f	APP	\N	\N	\N	\N	\N	\N
44	\N	35	\N	\N	PDHC	2018-01-28 00:00:00	10:29:00	\N	\N	\N	\N	\N	t	f	2018-01-25 10:29:54.580629	2018-01-25 10:29:54.580629	f	APP	\N	\N	\N	\N	\N	\N
45	\N	49	T	Adwoa 	LA	2018-01-31 00:00:00	12:26:00	None	None	S	Fire Stone	\N	t	f	2018-01-29 12:17:53.624323	2018-01-29 12:17:53.624323	f	APP	\N	2	\N	\N	\N	\N
46	\N	49	S		LA	2018-01-31 00:00:00	12:23:00	None	None	E	Fire Stone	\N	t	f	2018-01-29 12:23:34.920985	2018-01-29 12:23:34.920985	f	APP	\N	2	\N	\N	\N	\N
50	\N	47	S		PD	2018-01-29 18:38:18.168223	\N	\N	\N	S	\N	\N	t	f	2018-01-29 18:36:18.268324	2018-01-29 18:38:18.169352	t	APP	\N	1	t	Koby appiah 	\N	\N
49	\N	47	S		PD	2018-01-29 18:38:55.185014	\N	\N	\N	S	\N	\N	t	f	2018-01-29 18:36:18.237227	2018-01-29 18:38:55.185926	t	APP	\N	1	t	Koby appiah 	\N	\N
53	\N	47	\N	\N	PC	2018-01-29 00:00:00	12:38:00	\N	\N	\N	\N	\N	t	f	2018-01-29 19:38:59.958247	2018-01-29 19:42:01.270495	t	APP	\N	\N	\N	\N	\N	\N
3	\N	35	S		PD	2018-01-17 18:16:00	\N	\N	\N	S	\N	\N	t	f	2018-01-08 22:20:59.193608	2018-01-19 15:41:15.818775	f	APP	\N	1	t	\N	\N	\N
11	\N	44	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	f	f	2018-01-19 13:00:38.751369	2018-01-19 15:42:43.327	f	APP	\N	1	\N	\N	\N	\N
10	\N	44	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	f	f	2018-01-19 13:00:27.469461	2018-01-19 15:42:48.511958	f	APP	\N	1	\N	\N	\N	\N
12	\N	44	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	f	f	2018-01-19 13:00:53.431354	2018-01-19 15:42:50.879246	f	APP	\N	1	\N	\N	\N	\N
13	\N	44	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	f	f	2018-01-19 13:00:53.566906	2018-01-19 15:42:53.324397	f	APP	\N	1	\N	\N	\N	\N
14	\N	29	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-01-22 10:34:17.258623	2018-01-22 10:34:17.258623	f	APP	\N	1	t	\N	\N	\N
8	\N	35	\N	\N	PC	2018-01-15 00:00:00	12:37:00	\N	\N	\N	\N	\N	t	f	2018-01-15 12:37:24.107725	2018-01-22 11:43:18.887773	t	APP	\N	\N	\N	\N	\N	\N
15	\N	46	S		PD	2018-01-22 11:53:28.866938	\N	\N	\N	S	\N	\N	t	f	2018-01-22 11:50:32.461517	2018-01-22 11:53:28.868031	t	APP	\N	1	t	\N	\N	\N
17	\N	46	\N	\N	PC	2018-01-22 00:00:00	11:59:00	\N	\N	\N	\N	\N	t	f	2018-01-22 11:59:27.669384	2018-01-22 12:02:13.040026	t	APP	\N	\N	\N	\N	\N	\N
16	\N	46	\N	\N	PC	2018-01-31 00:00:00	11:59:00	\N	\N	\N	\N	\N	t	f	2018-01-22 11:55:14.655377	2018-01-22 12:29:38.661556	t	APP	\N	\N	\N	\N	\N	\N
18	\N	47	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-01-23 06:51:49.971065	2018-01-23 06:51:49.971065	f	APP	\N	1	t	Koby appiah 	\N	\N
19	\N	49	S		PD	2018-01-23 09:57:49.199833	\N	\N	\N	S	\N	\N	t	f	2018-01-23 09:56:59.800055	2018-01-23 09:57:49.200951	t	APP	\N	1	t	Appiah kobby	\N	\N
20	\N	49	\N	\N	PC	2018-01-30 00:00:00	22:22:00	\N	\N	\N	\N	\N	t	f	2018-01-23 10:03:55.18538	2018-01-23 10:05:57.309034	t	APP	\N	\N	\N	\N	\N	\N
21	2	49	S		MA	2018-01-28 00:00:00	11:05:00	None	None	S	\N	\N	t	f	2018-01-23 11:02:09.901403	2018-01-23 11:02:09.901403	f	APP	\N	2	\N	\N	\N	\N
22	\N	54	S		PD	2018-01-23 20:10:18.234624	\N	\N	\N	S	\N	\N	t	f	2018-01-23 19:49:02.157999	2018-01-23 20:10:18.236305	t	APP	\N	1	t	\N	\N	\N
23	\N	54	\N	\N	PC	2018-01-26 00:00:00	22:12:00	\N	\N	\N	\N	\N	t	f	2018-01-23 20:12:30.708063	2018-01-23 20:12:30.708063	f	APP	\N	\N	\N	\N	\N	\N
4	\N	35	\N	\N	PC	2018-01-15 00:00:00	12:27:00	\N	\N	\N	\N	\N	t	f	2018-01-15 12:27:24.078984	2018-01-15 12:27:24.078984	f	APP	\N	\N	\N	\N	\N	\N
5	\N	35	\N	\N	PC	2018-05-18 00:00:00	12:34:00	\N	\N	\N	\N	\N	t	f	2018-01-15 12:29:17.67239	2018-01-15 12:29:17.67239	f	APP	\N	\N	\N	\N	\N	\N
6	\N	35	\N	\N	PC	2018-01-15 00:00:00	12:32:00	\N	\N	\N	\N	\N	t	f	2018-01-15 12:32:34.045555	2018-01-15 12:32:34.045555	f	APP	\N	\N	\N	\N	\N	\N
7	\N	35	\N	\N	PC	2018-01-15 00:00:00	12:33:00	\N	\N	\N	\N	\N	t	f	2018-01-15 12:33:56.449531	2018-01-15 12:33:56.449531	f	APP	\N	\N	\N	\N	\N	\N
52	\N	47	\N	\N	PC	\N	\N	\N	\N	\N	\N	\N	t	f	2018-01-29 19:38:37.525494	2018-01-29 19:58:11.378335	t	APP	\N	\N	\N	\N	\N	\N
24	\N	54	\N	\N	PC	2018-01-26 00:00:00	22:12:00	\N	\N	\N	\N	\N	t	f	2018-01-23 20:12:45.101744	2018-01-23 20:17:07.665248	t	APP	\N	\N	\N	\N	\N	\N
26	\N	54	\N	\N	PC	2018-04-23 00:00:00	12:14:00	\N	\N	\N	\N	\N	t	f	2018-01-23 20:19:35.339181	2018-01-23 20:19:35.339181	f	APP	\N	\N	\N	\N	\N	\N
27	\N	54	\N	\N	PC	2018-07-23 00:00:00	22:20:00	\N	\N	\N	\N	\N	t	f	2018-01-23 20:21:00.153021	2018-01-23 20:21:00.153021	f	APP	\N	\N	\N	\N	\N	\N
25	\N	54	\N	\N	PC	2018-04-23 00:00:00	12:14:00	\N	\N	\N	\N	\N	t	f	2018-01-23 20:14:47.642858	2018-01-23 20:22:11.044508	t	APP	\N	\N	\N	\N	\N	\N
28	\N	54	\N	\N	PC	2018-07-23 00:00:00	22:20:00	\N	\N	\N	\N	\N	t	f	2018-01-23 20:23:10.663097	2018-01-23 20:23:10.663097	f	APP	\N	\N	\N	\N	\N	\N
29	\N	54	\N	\N	PC	\N	\N	\N	\N	\N	\N	\N	t	f	2018-01-23 20:25:31.514394	2018-01-23 20:25:31.514394	f	APP	\N	\N	\N	\N	\N	\N
30	\N	35	\N	\N	PC	2018-01-23 00:00:00	20:31:00	\N	\N	\N	\N	\N	t	f	2018-01-23 20:31:58.271392	2018-01-23 20:31:58.271392	f	APP	\N	\N	\N	\N	\N	\N
31	\N	55	S		PD	2018-01-23 20:42:47.875675	\N	\N	\N	S	\N	\N	t	f	2018-01-23 20:41:22.925672	2018-01-23 20:42:47.876616	t	APP	\N	1	t	Koby Appiah 	\N	\N
32	\N	35	\N	\N	PC	2018-01-24 00:00:00	09:46:00	\N	\N	\N	\N	\N	t	f	2018-01-24 09:46:57.060334	2018-01-24 09:46:57.060334	f	APP	\N	\N	\N	\N	\N	\N
33	\N	35	\N	\N	PC	2018-01-24 00:00:00	09:51:00	\N	\N	\N	\N	\N	t	f	2018-01-24 09:51:28.540006	2018-01-24 09:51:28.540006	f	APP	\N	\N	\N	\N	\N	\N
34	\N	35	\N	\N	PC	2018-01-28 00:00:00	00:58:00	\N	\N	\N	\N	\N	t	f	2018-01-24 09:58:23.935304	2018-01-24 09:58:23.935304	f	APP	\N	\N	\N	\N	\N	\N
36	\N	35	\N	\N	PC	2018-01-24 00:00:00	10:10:00	\N	\N	\N	\N	\N	t	f	2018-01-24 10:10:55.005334	2018-01-24 10:22:56.051239	t	APP	\N	\N	\N	\N	\N	\N
76	\N	71	\N	\N	PC	2018-02-16 00:00:00	12:13:00	\N	\N	\N	\N	\N	t	f	2018-02-16 12:09:23.331712	2018-02-16 12:56:57.6063	t	APP	\N	\N	\N	\N	\N	\N
56	\N	47	\N	\N	PDHC	2018-06-29 00:00:00	19:53:00	\N	\N	\N	\N	\N	t	f	2018-01-29 19:48:50.136519	2018-01-29 19:59:14.671552	t	APP	\N	\N	\N	\N	\N	\N
55	\N	47	\N	\N	PDVC	\N	\N	\N	\N	\N	\N	\N	t	f	2018-01-29 19:48:30.902736	2018-02-02 11:40:19.741065	t	APP	\N	\N	\N	\N	\N	\N
37	\N	35	\N	\N	PDVC	2018-01-25 00:00:00	10:12:00	\N	\N	\N	\N	\N	t	f	2018-01-25 10:12:58.885672	2018-01-25 10:12:58.885672	f	APP	\N	\N	\N	\N	\N	\N
38	\N	35	\N	\N	PDVC	2018-01-25 00:00:00	10:12:00	\N	\N	\N	\N	\N	t	f	2018-01-25 10:12:58.89021	2018-01-25 10:12:58.89021	f	APP	\N	\N	\N	\N	\N	\N
39	\N	35	\N	\N	PDVC	2018-01-25 00:00:00	10:13:00	\N	\N	\N	\N	\N	t	f	2018-01-25 10:13:11.636298	2018-01-25 10:13:11.636298	f	APP	\N	\N	\N	\N	\N	\N
40	\N	35	\N	\N	PDVC	2018-01-25 00:00:00	10:13:00	\N	\N	\N	\N	\N	t	f	2018-01-25 10:13:11.64351	2018-01-25 10:13:11.64351	f	APP	\N	\N	\N	\N	\N	\N
41	\N	35	\N	\N	PDVC	2018-01-25 00:00:00	10:14:00	\N	\N	\N	\N	\N	t	f	2018-01-25 10:14:05.972363	2018-01-25 10:14:05.972363	f	APP	\N	\N	\N	\N	\N	\N
54	\N	47	\N	\N	PDVC	2018-01-26 00:00:00	19:51:00	\N	\N	\N	\N	\N	t	f	2018-01-29 19:45:46.848829	2018-01-30 15:03:11.732777	t	APP	\N	\N	\N	\N	\N	\N
62	1	35	S		MA	2018-02-02 00:00:00	11:55:00	testin	Testing	S	\N	\N	t	f	2018-02-02 11:55:22.793383	2018-02-05 15:34:27.30696	t	APP	\N	1	\N	\N	\N	\N
63	\N	35	S		MA	2018-02-06 00:00:00	11:59:00	testing	testing	S	Taxi Rank	\N	t	f	2018-02-02 11:59:25.905451	2018-02-05 15:10:07.93934	t	APP	\N	1	\N	\N	\N	\N
58	\N	58	S		PD	2018-02-05 15:34:54.70354	\N	\N	\N	S	\N	\N	t	f	2018-02-01 10:41:32.127397	2018-02-05 15:34:54.704608	t	APP	\N	1	t	\N	\N	\N
64	\N	35	S		MA	2018-02-02 00:00:00	12:17:00	test	test	S	Taxi Rank	\N	t	f	2018-02-02 12:17:28.810786	2018-02-05 14:39:51.641378	t	APP	\N	1	\N	\N	\N	\N
51	1	47	S		MA	2018-01-29 00:00:00	17:40:00	Headaches 	Asthmatic 	S	\N	\N	t	f	2018-01-29 18:40:33.063037	2018-02-02 14:01:03.638385	t	APP	\N	1	\N	\N	\N	\N
59	1	58	S		MA	2018-01-31 00:00:00	11:19:00	Runny nose	No	S	\N	\N	t	f	2018-02-01 11:19:09.948076	2018-02-05 15:16:43.090803	t	APP	\N	1	\N	\N	\N	\N
61	\N	35	S		MA	2018-02-02 00:00:00	11:54:00	None	Checkin	S	Taxi Rank	\N	t	f	2018-02-02 11:54:07.704637	2018-02-05 14:43:18.512829	t	APP	\N	1	\N	\N	\N	\N
47	\N	49	S		LA	2018-01-31 00:00:00	12:23:00	None	None	E	Fire Stone	\N	t	f	2018-01-29 12:23:58.682243	2018-02-05 17:15:34.138691	t	APP	\N	2	\N	\N	\N	\N
48	\N	49	\N	\N	PC	2018-01-29 00:00:00	12:38:00	\N	\N	\N	\N	\N	t	f	2018-01-29 12:35:01.284335	2018-02-05 17:16:38.829695	t	APP	\N	\N	\N	\N	\N	\N
65	\N	35	\N	\N	VC	2018-02-02 00:00:00	12:29:00	\N	\N	\N	\N	\N	t	f	2018-02-02 12:29:26.157484	2018-02-05 16:59:24.063414	t	APP	\N	\N	\N	\N	\N	\N
67	\N	59	S		PD	2018-02-05 22:46:51.156481	\N	\N	\N	S	\N	\N	t	f	2018-02-05 22:44:53.729941	2018-02-05 22:46:51.158267	t	APP	\N	1	t	koby Appiah 	\N	\N
57	\N	58	S		PD	2018-02-06 11:51:27.043168	\N	\N	\N	S	\N	\N	t	f	2018-02-01 10:41:32.077179	2018-02-06 11:51:27.044259	t	APP	\N	1	t	\N	\N	\N
42	\N	35	\N	\N	PC	2018-01-25 00:00:00	10:14:00	\N	\N	\N	\N	\N	t	f	2018-01-25 10:14:16.952498	2018-02-06 11:52:02.340044	t	APP	\N	\N	\N	\N	\N	\N
60	\N	35	\N	\N	VC	2018-02-03 00:00:00	09:56:00	\N	\N	\N	\N	\N	t	f	2018-02-02 09:56:36.010176	2018-02-06 12:05:56.386644	t	APP	\N	\N	\N	\N	\N	\N
68	1	70	T	Global 	MA	2018-02-19 00:00:00	11:25:00	Flu	Diabetic and hypertensive	E	\N	\N	t	f	2018-02-14 17:25:52.10686	2018-02-14 17:37:48.711164	t	APP	\N	1	\N	\N	\N	\N
69	\N	70	T	Glory 	LA	2018-02-18 00:00:00	10:02:00	Wbc, urine  	G\n	E	\N	\N	t	f	2018-02-14 18:03:32.043622	2018-02-14 18:10:05.472698	t	APP	\N	1	\N	\N	\N	\N
70	\N	70	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-02-14 18:12:59.133715	2018-02-14 18:12:59.133715	f	APP	\N	1	t	\N	\N	\N
73	\N	71	S		PD	2018-02-15 15:28:11.574659	\N	\N	\N	S	\N	\N	t	f	2018-02-15 15:27:48.366413	2018-02-15 15:28:11.575735	t	APP	\N	1	t	\N	\N	\N
75	\N	71	\N	\N	PC	2018-02-16 00:00:00	10:00:00	\N	\N	\N	\N	\N	t	f	2018-02-16 10:00:23.922594	2018-02-16 10:00:23.922594	f	APP	\N	\N	\N	\N	\N	\N
74	\N	71	S		PD	2018-02-16 10:01:45.931126	\N	\N	\N	S	\N	\N	t	f	2018-02-15 15:27:48.413576	2018-02-16 10:01:45.932281	t	APP	\N	1	t	\N	\N	\N
35	\N	35	\N	\N	PC	2018-01-30 00:00:00	10:16:00	\N	\N	\N	\N	\N	t	f	2018-01-24 10:09:19.64124	2018-01-24 10:43:45.321125	f	APP	\N	\N	\N	\N	\N	\N
78	\N	55	S		LA	2017-02-18 00:00:00	10:18:00	Urine	Diabetes 	E	Taxi Rank	\N	t	f	2018-02-18 09:18:20.2769	2018-02-18 09:18:20.2769	f	APP	\N	1	\N	\N	\N	\N
71	\N	71	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-02-15 15:27:30.046951	2018-03-02 10:53:24.223333	t	APP	\N	1	t	\N	\N	\N
66	\N	35	\N	\N	VC	2018-02-02 00:00:00	14:00:00	\N	\N	\N	\N	\N	t	f	2018-02-02 14:00:56.058016	2018-02-16 16:44:24.88204	t	APP	\N	\N	\N	\N	\N	\N
77	\N	71	\N	\N	VC	2018-02-16 00:00:00	17:02:00	\N	\N	\N	\N	\N	t	f	2018-02-16 17:02:38.520103	2018-02-16 17:05:40.750512	t	APP	\N	\N	\N	\N	\N	\N
80	\N	35	\N	\N	DP	\N	\N	\N	I have a bad back ache	\N	\N	\N	t	f	2018-02-28 15:22:20.128371	2018-02-28 15:22:20.128371	f	APP	\N	\N	\N	\N	Paracetamol, chloroquione	3
81	\N	71	\N	\N	VC	2018-03-28 00:00:00	16:10:00	\N	\N	\N	\N	\N	t	f	2018-02-28 16:10:27.700258	2018-02-28 16:17:19.388661	t	APP	\N	\N	\N	\N	\N	\N
83	\N	71	S		MA	2018-02-28 00:00:00	16:59:00	Thahha\n	Hrhrh	S	Taxi Rank	\N	t	f	2018-02-28 16:56:16.99896	2018-02-28 16:56:16.99896	f	APP	\N	1	\N	\N	\N	\N
84	\N	71	\N	\N	VC	2018-12-31 00:00:00	16:57:00	\N	\N	\N	\N	\N	t	f	2018-02-28 16:57:37.918127	2018-02-28 16:57:37.918127	f	APP	\N	\N	\N	\N	\N	\N
82	\N	71	\N	\N	PDHC	2018-02-28 00:00:00	16:26:00	\N	\N	\N	\N	\N	t	f	2018-02-28 16:19:24.529589	2018-02-28 17:06:36.110783	t	APP	\N	\N	\N	\N	\N	\N
85	\N	71	\N	\N	PC	2018-02-28 00:00:00	17:41:00	\N	\N	\N	\N	\N	t	f	2018-02-28 17:23:35.502601	2018-02-28 17:26:48.844626	t	APP	\N	\N	\N	\N	\N	\N
86	\N	71	\N	\N	PDVC	2018-02-28 00:00:00	17:44:00	\N	\N	\N	\N	\N	t	f	2018-02-28 17:29:35.774677	2018-02-28 17:29:50.442265	t	APP	\N	\N	\N	\N	\N	\N
87	\N	71	\N	\N	DP	\N	\N	\N	Thheg	\N	\N	\N	t	f	2018-02-28 17:41:06.222969	2018-02-28 17:41:06.222969	f	APP	\N	\N	\N	\N	Para	23
88	\N	35	T	Kiki	MD	\N	\N	None 	Love	S	\N	\N	t	f	2018-02-28 17:46:15.394865	2018-02-28 17:46:15.394865	f	APP	\N	\N	\N	\N	\N	\N
89	\N	35	\N	\N	DP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-02-28 17:47:40.376723	2018-02-28 17:47:40.376723	f	APP	\N	\N	\N	\N	\N	\N
90	\N	71	\N	\N	DP	\N	\N	\N	Headache \nCold	\N	\N	\N	t	f	2018-03-01 09:44:12.777787	2018-03-01 10:38:03.359579	t	APP	\N	\N	\N	\N	Paracetamol, Panadol	5
72	\N	71	S		PD	2018-03-01 15:23:19.984133	\N	\N	\N	S	\N	\N	t	f	2018-02-15 15:27:30.080981	2018-03-01 16:18:32.985282	t	APP	\N	1	t	\N	\N	\N
91	\N	80	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 16:51:14.760224	2018-03-02 16:51:14.760224	f	APP	\N	2	t	\N	\N	\N
92	\N	80	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 16:51:14.768545	2018-03-02 16:53:46.239813	t	APP	\N	2	t	\N	\N	\N
93	\N	80	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 16:55:45.216835	2018-03-02 16:55:45.216835	f	APP	\N	1	t	Bansah Jerry\n	\N	\N
94	\N	80	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 16:59:19.174515	2018-03-02 16:59:19.174515	f	APP	\N	2	t	Bansah jerry	\N	\N
95	\N	80	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 16:59:19.204075	2018-03-02 16:59:19.204075	f	APP	\N	2	t	Bansah jerry	\N	\N
97	\N	80	\N	\N	DP	\N	\N	\N	Headache since last month	\N	\N	\N	t	f	2018-03-02 17:17:15.826157	2018-03-02 17:20:23.444547	t	APP	\N	\N	\N	\N	Paracetamol	0
96	\N	80	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-02 17:01:14.542676	2018-03-04 11:48:19.700476	f	APP	\N	1	t	Bansah jerry	\N	\N
\.


--
-- Name: pre_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('pre_appointments_id_seq', 97, true);


--
-- Data for Name: profesional_groups; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY profesional_groups (id, group_name, comment, user_id, entity_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Ghana Medical Association				t	f	2017-11-29 17:01:38.652699	2017-12-11 21:17:32.013776
\.


--
-- Name: profesional_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('profesional_groups_id_seq', 1, true);


--
-- Data for Name: provider_engaged_users; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY provider_engaged_users (id, provider_id, person_id, comment, user_id, entity_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	2	37		\N	\N	t	f	2018-01-17 16:21:37.010013	2018-01-17 16:21:37.010013
2	7	32		\N	\N	t	f	2018-01-17 16:26:36.002939	2018-01-17 16:26:36.002939
\.


--
-- Name: provider_engaged_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('provider_engaged_users_id_seq', 2, true);


--
-- Data for Name: provider_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY provider_masters (id, provider_name, alias, provider_type_id, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
5	Lawer Eye Clinic		2		\N	\N	t	f	2017-11-07 10:52:44.579415	2017-11-11 21:23:12.837465
4	Aseye Eye Specialist		2		\N	\N	t	f	2017-11-07 10:52:08.050862	2017-11-11 21:23:24.001424
3	Emmanuel Eye Clinic		2		\N	\N	t	f	2017-11-07 10:51:30.093442	2017-11-11 21:23:36.811823
6	Akosombo Hospital	Agh	8		\N	\N	t	f	2017-12-04 18:39:29.886651	2017-12-04 18:39:29.886651
7	Glorylove		9		\N	\N	t	f	2018-01-17 16:19:10.151963	2018-01-17 16:19:10.151963
2	Nyaho Hospital	Nyaho	1		\N	36	t	f	2017-11-02 17:55:39.53986	2018-01-25 17:18:55.444336
1	37 Military Hospital		1		\N	36	t	f	2017-11-02 17:26:55.396258	2018-01-25 17:19:02.931346
\.


--
-- Name: provider_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('provider_masters_id_seq', 7, true);


--
-- Data for Name: provider_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY provider_services (id, service_provider_id, service_id, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	2	1		\N	\N	t	f	2017-11-03 09:06:29.863901	2017-11-03 09:06:29.863901
2	5	3		\N	\N	t	f	2017-11-07 11:15:36.537808	2017-11-07 11:15:36.537808
3	5	2		\N	\N	t	f	2017-11-07 11:15:57.323937	2017-11-07 11:15:57.323937
4	7	3		\N	\N	t	f	2018-01-17 16:20:20.549455	2018-01-17 16:20:20.549455
\.


--
-- Name: provider_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('provider_services_id_seq', 4, true);


--
-- Data for Name: region_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY region_masters (id, region_state_name, comment, country_id, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	Greater Accra		2	\N	\N	t	f	2017-11-02 12:58:59.876358	2017-11-11 20:54:13.43112
2	Abuja		3	\N	\N	t	f	2017-11-07 10:40:02.998527	2017-11-11 20:54:41.820952
4	Brong Ahafo Region		2	\N	36	t	f	2017-11-21 17:50:48.773701	2018-01-25 12:44:36.852975
3	Central		2	\N	36	t	f	2017-11-21 17:34:03.14033	2018-01-25 14:09:08.399991
\.


--
-- Name: region_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('region_masters_id_seq', 4, true);


--
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY registration (id, surname, other_names, mobile_number, password, status, telco, src, verified, email, username, user_type, created_at, surburb_id, registration_number, registration_board, hospital_name, specialty, specialty_name, user_id, user_uniq_code) FROM stdin;
61	David	Kojo	9274488497                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	APP	t		kojo	N	15:27:13.458239	\N	\N	\N	\N	\N	\N	36	pas123
57	docu	docu	05567123132                                       	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	AIR	APP	t		best doc	D	12:07:41.745703	3	0	uihu	hheh	No	\N	36	pas123
27	Clem	Sedem	0248152204                                        	e2e58fcf185ef6e5513c504e287ddb72af7be9c54fc0023a356a7ce559240885	t	MTN	APP	t		sedem	C	11:02:55.010654	\N	\N				\N	\N	\N
46	gloria	appiah	444445555                                         	98a9d96889b90ce05e2a3cdba62e05ce6d5d3a90179a0b1e44ec7b9220eefc29	t	VOD	APP	t		gloria	D	20:51:10.054957	1	\N	\N	\N	\N	\N	\N	\N
37	Abe	Clem	0248152205                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t		klem	C	12:50:17.144058	\N	\N				\N	\N	\N
30	Sam	Hsj	8hsjsaoj                                          	47e4336f4b44be1af3bbc4bf4d3e04ea8bddc8c41a76f43d952182fa26af725e	t	MTN	APP	t		samuelapp24	D	21:46:42.793958	1	\N				\N	\N	pas123
25	Osafo	Nana	0276113371                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	TIG	APP	t	nana@gmail.com	saha	C	14:09:07.179583	\N	\N				\N	\N	\N
50	Maid	angela	45444455                                          	aca5b8e5685f39e41758a05cfec88dd72d8d9ec8b899c233da1ffc33bbc15ba0	t	MTN	APP	t		angela	C	19:47:49.000156	\N	\N	\N	\N	\N	\N	\N	\N
62	Ago	Ame	0234567890                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t		ago	D	17:22:23.276613	2	\N	\N	\N	\N	\N	36	pas123
35	Adoma	Nana	33332222                                          	e7108a18b71b1e942c34239afe5bb82e6f2316d46f5673240c400c0bfd8f392f	t	MTN	APP	t		nana	C	20:52:37.036546	\N	\N				\N	\N	pas123
53	Joe	Man	0578119303                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	APP	t		joe	D	10:09:40.509252	1	\N	\N	\N	\N	\N	\N	pas123
29	Alfred	Kwame	0276113372                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	TIG	APP	f		kob	C	14:10:26.986291	\N	\N				\N	\N	\N
28	koff	KofiKofi	0244786611                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	MTN	APP	t		nananana	D	13:59:57.043573	2	22334455	Medical board1	Korle bu	Yes	\N	\N	\N
32	Kwame	Kwame	0244567812                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	MTN	APP	t		saha1	D	09:39:37.382212	2	112233	MDCH	Police hospital	Yes	\N	\N	\N
47	Nana Yaa	VP	000044444                                         	521fdac8795a920e4e6d4ffbb9788237699a71c462bad2ae3de570328456c2e5	t	MTN	APP	t		nanayaa	C	21:08:54.770668	\N	\N	\N	\N	\N	\N	\N	\N
31	Sansn	Nsnsn	7iq9w9qw9wuw                                      	6db20803f22153320547417961a7774de70d90c6257d32b7cd26e7d994fc4a1c	t	MTN	APP	t		samuelapp24	D	21:48:11.192302	1	\N				\N	\N	pas123
48	Addae	Freda	0205869653                                        	0f8eb4b72b6e0c9e88b388eb967b49e067ef1004bf07bffc22c3acb13b43580a	t	VOD	APP	t		freda	C	09:48:59.107225	\N	\N	\N	\N	\N	\N	\N	\N
38	New	Doctor	0244567234                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	AIR	APP	t		doc	D	06:04:24.816732	2	122233	Medical App Board	Ho Poly	No	\N	\N	\N
49	Tetteh	Andrew 	0504899386                                        	15d283140e2e1021aacec3e370bc99235b59d6a31bab3b6ee86e1f56b78e060a	t	VOD	APP	t		andymistic	C	11:24:33.095509	\N	\N	\N	\N	\N	\N	\N	\N
51	Appiah 	K	000886654                                         	b0b4df86a1580b5f33f2b436c83219b0d7efd32209747fbb2883b70855d7c21b	t	MTN	APP	t		john	C	20:36:07.942013	\N	\N	\N	\N	\N	\N	\N	\N
26	Koby	Appiah	74793530                                          	19513fdc9da4fb72a4a05eb66917548d3c90ff94d5419e1f2363eea89dfee1dd	t	MTN	APP	t		koby	D	22:18:34.203639	2	11100044	GMDC	Komfo anokye hospital 	No	\N	\N	\N
58	Tuwmasi	Kwaku	0207604492                                        	0b14d501a594442a01c6859541bcb3e8164d183d32937b851835442f69d5c94e	t	VOD	APP	t		kwakut	C	08:11:56.680721	\N	\N	\N	\N	\N	\N	36	\N
59	Asamoah	David	0246220138                                        	e6c394bead3436aa4bb89dc8d9d3f714d63a64ce76f3b4ac5d4ae354b7cedcc6	t	MTN	APP	t		asamoah	C	10:00:00.883869	\N	\N	\N	\N	\N	\N	36	\N
60	Boateng	isaac	77774344                                          	059ffaf61479a44b16cf967a25e34e5d3d205fc49237153a4ded8a455851b6ac	t	VOD	APP	t		isaac	C	22:42:15.898309	\N	\N	\N	\N	\N	\N	32	\N
45	samuel	samuel	44454445                                          	19513fdc9da4fb72a4a05eb66917548d3c90ff94d5419e1f2363eea89dfee1dd	t	AIR	APP	t		samuel 	D	20:47:43.856591	1	\N	\N	\N	\N	\N	\N	\N
34	Apps	Samuel	44445555                                          	6db20803f22153320547417961a7774de70d90c6257d32b7cd26e7d994fc4a1c	t	TIG	APP	t		samapps	D	19:48:15.767871	1	\N				\N	\N	\N
63	Appiah-sakyi	Nyamekye	+23320574686377                                   	0432c841a09c578e2388de0ed7e471d28a0c11f093ac280f72e9479dc2f5947c	t	VOD	APP	t		nana adoma 	C	17:13:00.269752	\N	\N	\N	\N	\N	\N	\N	kasakyi14
36	bambi	Bami1	0244675123                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	TIG	APP	t		bambi2	D	10:09:19.119416	1	\N				\N	\N	pas123
64	Dee	Dee	0234770989                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	APP	t		han	C	15:21:01.681442	\N	\N	\N	\N	\N	\N	36	pas123
65	Quaye	Mady	0248021199                                        	d8f7fd2d0c41c787779fc29d0a92408247c5c45a7812b790fac756066fde5e2b	t	MTN	APP	t	Clara@appsnmobliesolutions.com	clara	C	11:32:23.654957	\N	\N	\N	\N	\N	\N	29	nanakofihayford
66	Araba	Maame	0279545773                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	TIG	APP	f	freda@appsnmobilesolutions.com 	sweetness	C	16:40:12.505246	\N	\N	\N	\N	\N	\N	\N	12345678
\.


--
-- Name: registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('registration_id_seq', 66, true);


--
-- Data for Name: request_categories; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY request_categories (id, category, ref_id, created_at, updated_at) FROM stdin;
1	Self	S	2017-11-03 14:40:26.429892	2017-11-03 14:40:26.429892
2	Beneficiary	T	2017-11-03 14:40:41.742451	2017-11-03 14:40:41.742451
\.


--
-- Name: request_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('request_categories_id_seq', 2, true);


--
-- Data for Name: request_urgencies; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY request_urgencies (id, urgency, ref_id, created_at, updated_at) FROM stdin;
1	Standard	S	2017-11-03 16:55:25.400372	2017-11-03 16:55:25.400372
2	Express	E	2017-11-03 16:56:00.18175	2017-11-03 16:56:00.18175
\.


--
-- Name: request_urgencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('request_urgencies_id_seq', 2, true);


--
-- Data for Name: requester_allergies; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY requester_allergies (id, pre_appointment_id, allergy_id, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
33	60	2		\N	t	f	2018-02-02 09:57:54.892359	2018-02-02 09:57:54.892359
34	60	3		\N	t	f	2018-02-02 09:57:54.984465	2018-02-02 09:57:54.984465
\.


--
-- Name: requester_allergies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('requester_allergies_id_seq', 34, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY roles (id, name, created_at, updated_at, user_id, comment, active_status, del_status) FROM stdin;
3	Nurse	2017-12-14 16:31:50.541952	2017-12-14 16:31:50.541952	9		t	f
1	Super Admin	2017-12-14 15:10:54.336974	2017-12-14 16:44:01.565072	9		t	f
2	Customer Service	2017-12-14 15:10:54.372358	2017-12-14 16:46:10.186552	9		t	f
4	Doctor	2018-02-08 17:28:23.049753	2018-02-08 17:28:23.049753	36		t	f
5	Patient	2018-02-09 10:02:54.228164	2018-02-09 10:02:54.228164	36		t	f
6	Laboratorist	2018-02-09 10:03:28.520383	2018-02-09 10:03:28.520383	36		t	f
7	Pharmacist	2018-02-09 10:03:55.672648	2018-02-09 10:03:55.672648	36		t	f
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('roles_id_seq', 7, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY schema_migrations (version) FROM stdin;
20170927140238
20170927142638
20170927143101
20170927143221
20170928184927
20171006104440
20171006145419
20171006153431
20171006154201
20171006155809
20171010123340
20171019115213
20171019120529
20171019122039
20171020103602
20171024124330
20171025202155
20171027141721
20171027153950
20171027175422
20171030085932
20171030101516
20171030114341
20171101105314
20171101122318
20171101141249
20171101162029
20171101174656
20171103142920
20171103143733
20171103165252
20171103173551
20171105163738
20171106120750
20171108175157
20171113181034
20171113190958
20171114092229
20171115093052
20171115163239
20171121153718
20171121163914
20171123123227
20171123163042
20171123163940
20171129095321
20171129161406
20171205150014
20171205160133
20171206112816
20171206163053
20171211093732
20171211123201
20171212140408
20171212180134
20171212181104
20171213154046
20171213160831
20171213161148
20171213163320
20171214111506
20171214112349
20171214144718
20171214151848
20171214160949
20171219111623
20171219160458
20180104171914
20180104181225
20180104203936
20180104212704
20180105101804
20180105154653
20180108145527
20180117122809
20180117144158
20180129110325
20180202110720
20180202111103
20180223111341
20180227182009
\.


--
-- Data for Name: service_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY service_masters (id, title, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
3	Physiotherapy Services		\N	36	t	f	2017-11-07 10:49:55.7931	2018-01-25 15:49:10.52437
2	Eye Health Care		\N	36	t	f	2017-11-07 10:49:18.907214	2018-01-25 15:49:15.230846
1	Mental Health Care		\N	36	t	f	2017-11-03 09:05:53.089627	2018-01-25 15:49:25.971976
4	Dental Service		\N	36	t	f	2017-12-04 18:36:02.681764	2018-03-02 13:33:49.34265
\.


--
-- Name: service_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('service_masters_id_seq', 4, true);


--
-- Data for Name: service_prov_extra_infos; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY service_prov_extra_infos (id, service_prov_id, suburb_id, contact_number1, contact_number2, postal_address, location_address, contact_person_name, web_url, longitude, latitude, comment, entity_id, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	1	1	0234569909									\N	\N	t	f	2017-11-02 17:26:55.399093	2017-11-02 17:26:55.399093
2	2	2	0245443322									\N	\N	t	f	2017-11-02 17:55:39.542178	2017-11-02 17:55:39.542178
3	3	2	24887									\N	\N	t	f	2017-11-07 10:51:30.096036	2017-11-07 10:51:30.096036
4	4	1	7894									\N	\N	t	f	2017-11-07 10:52:08.052964	2017-11-07 10:52:08.052964
5	5	3	5469									\N	\N	t	f	2017-11-07 10:52:44.581463	2017-11-07 10:52:44.581463
6	6	2	47474747	46464646	akosombo	akososmbo		wwww.url.com				\N	\N	t	f	2017-12-04 18:39:29.889234	2017-12-04 18:39:29.889234
7	7	3	0205869587									\N	\N	t	f	2018-01-17 16:19:10.154051	2018-01-17 16:19:10.154051
\.


--
-- Name: service_prov_extra_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('service_prov_extra_infos_id_seq', 7, true);


--
-- Data for Name: service_prov_types; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY service_prov_types (id, service_prov_type_title, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
3	Herbal Centre		\N	\N	t	f	2017-11-07 10:50:44.247617	2017-11-11 21:13:56.563655
2	Clinic		\N	\N	t	f	2017-11-07 10:50:26.110801	2017-11-11 21:14:04.804177
1	Hospital		\N	\N	t	f	2017-11-02 12:57:22.279357	2017-11-11 21:14:11.86312
4	Cocoa Clinic		\N	\N	t	f	2017-11-21 18:03:44.559779	2017-11-21 18:03:44.559779
5	Pharmacy		\N	\N	t	f	2017-11-21 21:07:48.912613	2017-11-21 21:07:48.912613
9	Physio		\N	36	t	f	2018-01-17 16:17:41.996204	2018-01-25 16:12:25.961342
8	Tertiary Hospital		\N	36	t	f	2017-12-04 18:37:25.602415	2018-01-25 16:17:08.338432
7	Maternity Home		\N	36	t	f	2017-11-21 21:09:06.495535	2018-01-25 16:17:15.467643
6	Diagnostic Centres		\N	36	t	f	2017-11-21 21:08:20.585147	2018-01-25 16:17:28.029945
\.


--
-- Name: service_prov_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('service_prov_types_id_seq', 9, true);


--
-- Data for Name: specialty_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY specialty_masters (id, title, alias, comment, user_id, entity_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Pathology					t	f	2017-11-29 10:35:21.263252	2017-11-29 11:22:08.763144
2	Cardiothoracic Surgery					t	f	2017-11-29 12:17:43.933474	2017-11-29 12:17:43.933474
3	Colon And Rectal Surgery					t	f	2017-11-29 12:18:19.93821	2017-11-29 12:18:19.93821
\.


--
-- Name: specialty_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('specialty_masters_id_seq', 3, true);


--
-- Data for Name: suburb_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY suburb_masters (id, suburb_name, comment, city_town_id, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
3	Wari		2	\N	\N	t	\N	2017-11-07 10:46:57.865432	2017-11-11 21:02:16.521142
4	Baduben		3	\N	\N	t	\N	2017-11-21 18:02:53.604344	2017-11-21 18:02:53.604344
2	Fire Stone		1	\N	36	t	\N	2017-11-02 14:59:54.210243	2018-01-25 15:16:48.154841
1	Taxi Rank		1	\N	36	t	\N	2017-11-02 13:51:43.321541	2018-01-25 15:19:40.982609
\.


--
-- Name: suburb_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('suburb_masters_id_seq', 4, true);


--
-- Data for Name: user_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY user_services (id, service_desc, service_alias, comment, entity_id, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Personal Doctor			\N	9	t	f	2017-12-19 15:45:47.900185	2017-12-19 15:46:06.209912
2	Phone Consult			\N	9	t	f	2017-12-21 11:38:51.242527	2017-12-21 11:38:51.242527
4	Home Care			\N	9	t	f	2017-12-21 11:39:20.686946	2018-03-02 13:00:53.979693
3	Video Consult			\N	9	t	f	2017-12-21 11:39:05.353977	2018-03-02 13:01:09.996205
\.


--
-- Name: user_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('user_services_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, person_id, username, active_status, del_status, profile_file_name, profile_content_type, profile_file_size, profile_updated_at, role_id) FROM stdin;
3		$2a$11$24FwD8/bPk2fijgsywKivOVkrZ0vMgD3Bua/YGhKiATATuJ19PVG6	\N	\N	\N	0	\N	\N	\N	\N	2017-12-14 19:51:03.019181	2017-12-14 19:51:03.019181	30	jerry	\N	\N	\N	\N	\N	\N	1
7		$2a$11$s3HT2dhoixRqw6YPMsPxPO/kE3ElsAADZedpH5VNfvIxMc1ywptFS	\N	\N	\N	0	\N	\N	\N	\N	2018-01-05 14:18:50.078718	2018-01-05 14:18:50.078718	37	jerry	\N	\N	\N	\N	\N	\N	1
8		$2a$11$rpzrKEpE9jTJO4Ev4GPUM.vr81c8.YOQ1xqgOlyfOIE8CRolXn1.y	\N	\N	\N	0	\N	\N	\N	\N	2018-01-05 15:07:45.527506	2018-01-05 15:07:45.527506	38	phil	\N	\N	\N	\N	\N	\N	1
5		$2a$11$RtAp.Vhz76703foeqjbdk./qxfFZHnlLwQAKt5qCOsIZuJOJbHYEm	\N	\N	\N	1	2018-01-03 17:18:34.104092	2018-01-03 17:18:34.104092	41.210.31.180	41.210.31.180	2017-12-15 11:15:46.026676	2018-01-03 17:18:34.106953	34	david	\N	\N	\N	\N	\N	\N	2
10			\N	\N	\N	0	\N	\N	\N	\N	2018-02-08 15:29:32.54908	2018-02-08 15:29:32.54908	61	kojo	\N	\N	\N	\N	\N	\N	3
11			\N	\N	\N	0	\N	\N	\N	\N	2018-02-08 15:44:49.583592	2018-02-08 15:44:49.583592	62	kojo	\N	\N	\N	\N	\N	\N	3
24		$2a$11$NCXqncn6x5Xg4v0SYbg5WOFN5f/23Ye0FZmPiq7tKFEcRlOf/54sC	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 10:10:32.663437	2018-02-28 10:10:32.663437	75	samuelapp24	\N	\N	\N	\N	\N	\N	4
25		$2a$11$VC.M/S6htxnnBHuy/dVXF.K1ZkApJ58IKNiYNyLCxaV9aKrbvekrC	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 10:24:59.912506	2018-02-28 10:24:59.912506	76	han	\N	\N	\N	\N	\N	\N	5
26		$2a$11$JffZyT87l7kSe39yivjMZeSn1aODszedARIsrVZ1NhHfvvziMJo7.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 10:34:48.698628	2018-02-28 10:34:48.698628	77	han	\N	\N	\N	\N	\N	\N	4
27		$2a$11$NJPIuYedh2Eu09l7aPBoW.SkfKiKRdzk9i/CnwQTgTBkD6dTNnITG	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 10:40:02.081993	2018-02-28 10:40:02.081993	78	han	\N	\N	\N	\N	\N	\N	5
28		$2a$11$76zgWRGFTz3BdbOBtdjtEe38bDhdeEYV00WW/2gwQtkZ1z9cwuOdK	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 10:57:00.147256	2018-02-28 10:57:00.147256	79	han	\N	\N	\N	\N	\N	\N	5
33		$2a$11$2yFqtFUnl2kuh6XodFBY..FshgHN3wsCxicY3P.UOJ8mP4dDn4QD2	\N	\N	\N	1	2018-03-02 15:36:59.077653	2018-03-02 15:36:59.077653	41.210.19.46	41.210.19.46	2018-03-02 15:34:53.715227	2018-03-02 15:36:59.078866	84	clara	\N	\N	\N	\N	\N	\N	1
16		$2a$11$SAz94Du/FtexX51PHktayu6h9qZ.geNptDxbI864b1mBUwKRYcsD2	\N	\N	\N	0	\N	\N	\N	\N	2018-02-12 15:25:22.283767	2018-02-12 15:25:22.283767	67	kojo	\N	\N	\N	\N	\N	\N	3
17		$2a$11$utRI8rOtldlMVwxT6W2rYOawTCX15FEYXHuxzqHSw4WMZ12/wM5n6	\N	\N	\N	0	\N	\N	\N	\N	2018-02-12 16:09:35.714137	2018-02-12 16:09:35.714137	68	best doc	\N	\N	\N	\N	\N	\N	4
18		$2a$11$fE5w4pqg5VJsLuTQmiRBiuNTNibdqnjXyYJ0ViybahvonjctWmQSS	\N	\N	\N	0	\N	\N	\N	\N	2018-02-12 16:20:32.001301	2018-02-12 16:20:32.001301	69	samuelapp24	\N	\N	\N	\N	\N	\N	4
34		$2a$11$oz9cnRSlYRmvYJlmPW6VE.x/pNA.RSpTJ.0hfCrpl5QLS6BPxIz/S	\N	\N	\N	0	\N	\N	\N	\N	2018-03-02 15:42:22.430032	2018-03-02 15:42:22.430032	85	ron	\N	\N	\N	\N	\N	\N	4
32		$2a$11$q..hS8oTwCdjQ9IbqUPboussyF8j3GoanZOcVCEFnA3RB7xXjEuBK	\N	\N	\N	2	2018-03-02 16:44:59.550787	2018-03-02 15:30:38.862514	197.251.130.69	41.210.19.46	2018-03-02 15:22:06.740726	2018-03-02 16:44:59.553791	83	freda	\N	\N	\N	\N	\N	\N	1
19		$2a$11$t7tmUiarg7087GaZpcnSh.mR4k19sG5M6w8ozmAsppMhrv8XveAwC	\N	\N	\N	0	\N	\N	\N	\N	2018-02-14 17:20:22.624192	2018-02-14 17:20:22.624192	70	nana adoma	\N	\N	\N	\N	\N	\N	5
6		$2a$11$g3m7AlKLlJuZfoDPt9joouLKcoJmIs3rgs4RtvHigWgvEbt8roq7u	\N	\N	\N	52	2018-03-02 09:26:19.527144	2018-02-27 12:56:33.420462	197.251.138.5	41.66.199.171	2018-01-05 11:52:52.858909	2018-03-02 09:26:19.530016	36	clem	\N	\N	clem.jpg	image/jpeg	79054	2018-01-05 12:01:00.41165	1
15		$2a$11$LPFm7DDXNgv9SeXs3mZSXOOguvPty5puwwG/Bam5eaK1RXC1EWIFC	\N	\N	\N	27	2018-03-02 09:27:48.1855	2018-03-01 12:33:24.781344	197.251.138.5	197.251.140.86	2018-02-12 12:17:42.30264	2018-03-02 09:27:48.186571	63	ago	\N	\N	\N	\N	\N	\N	4
4		$2a$11$dDo0NvtWRXlIUhaFynZnueU2TMa8Ixnp381FfyIYSSHdYGoQHO36C	\N	\N	2018-01-23 19:40:48.737436	15	2018-02-27 03:50:42.218337	2018-02-26 09:37:46.666851	178.153.23.1	178.153.23.1	2017-12-14 19:58:18.02499	2018-02-27 03:50:42.2223	32	kobby	\N	\N	\N	\N	\N	\N	1
20		$2a$11$1y23ShRg2e3QSjA3XANDF.Ul9Seq4tFDAif8.tXx9q8MkxffQVsm6	\N	\N	\N	0	\N	\N	\N	\N	2018-02-15 15:26:02.718831	2018-02-15 15:26:02.718831	71	han	\N	\N	\N	\N	\N	\N	5
9			\N	\N	\N	0	\N	\N	\N	\N	2018-02-08 14:51:47.006325	2018-02-08 14:51:47.006325	60	kojo	\N	\N	\N	\N	\N	\N	3
30		$2a$11$Vqq32zLv7ZsaGt5UUWPxe.nZEu7x45pZSZt0WtmubJDO0oWdJg4.a	\N	\N	\N	0	\N	\N	\N	\N	2018-03-02 15:01:13.907529	2018-03-02 15:01:13.907529	81	bob	\N	\N	\N	\N	\N	\N	5
21		$2a$11$AKtisnef.cteOiwbw4lqSuxRvqkq2JI9LsGmcG1U9mq9EUlmOXIcW	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 08:57:23.138968	2018-02-28 08:57:23.138968	72	nana	\N	\N	\N	\N	\N	\N	5
22		$2a$11$iRt.sam4HqL7beOH0EnNVOcWZgAdU5pUjeokK8Yzb3GtXTFCOBmFG	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 09:40:52.706467	2018-02-28 09:40:52.706467	73	joe	\N	\N	\N	\N	\N	\N	4
23		$2a$11$wnUNTZPbduN7304NX.IVfOUFl3Vps83dOzUshuQD0PeDvxebkYWge	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 09:41:41.496951	2018-02-28 09:41:41.496951	74	bambi2	\N	\N	\N	\N	\N	\N	4
31		$2a$11$2a3VoK9vFunmC5PQ1o0l1.xCX/JLX8YBUxK8boFvKd5rLIv19enrW	\N	\N	\N	0	\N	\N	\N	\N	2018-03-02 15:07:43.265905	2018-03-02 15:07:43.265905	82	bin	\N	\N	\N	\N	\N	\N	4
2		$2a$11$tc7AT1adEthV9T3iOnj3F.NeB0bn7K2DdSsq3IldKnpxOLm6AVstC	\N	\N	\N	70	2018-03-02 15:28:57.993292	2018-03-02 11:47:01.800365	41.210.19.46	41.210.18.199	2017-12-14 17:20:18.148023	2018-03-02 15:28:57.994381	29	sweetness	\N	\N	\N	\N	\N	\N	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('users_id_seq', 34, true);


--
-- Name: affected_system_masters affected_system_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY affected_system_masters
    ADD CONSTRAINT affected_system_masters_pkey PRIMARY KEY (id);


--
-- Name: allergies_masters allergies_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY allergies_masters
    ADD CONSTRAINT allergies_masters_pkey PRIMARY KEY (id);


--
-- Name: appointment_types appointment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY appointment_types
    ADD CONSTRAINT appointment_types_pkey PRIMARY KEY (id);


--
-- Name: city_town_masters city_town_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY city_town_masters
    ADD CONSTRAINT city_town_masters_pkey PRIMARY KEY (id);


--
-- Name: condition_masters condition_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY condition_masters
    ADD CONSTRAINT condition_masters_pkey PRIMARY KEY (id);


--
-- Name: confirmed_appointments confirmed_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY confirmed_appointments
    ADD CONSTRAINT confirmed_appointments_pkey PRIMARY KEY (id);


--
-- Name: confirmed_conditions confirmed_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY confirmed_conditions
    ADD CONSTRAINT confirmed_conditions_pkey PRIMARY KEY (id);


--
-- Name: confirmed_personal_doctor_services confirmed_personal_doctor_services_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY confirmed_personal_doctor_services
    ADD CONSTRAINT confirmed_personal_doctor_services_pkey PRIMARY KEY (id);


--
-- Name: country_masters country_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY country_masters
    ADD CONSTRAINT country_masters_pkey PRIMARY KEY (id);


--
-- Name: engaged_user_services engaged_user_services_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY engaged_user_services
    ADD CONSTRAINT engaged_user_services_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: lab_detail_images lab_detail_images_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY lab_detail_images
    ADD CONSTRAINT lab_detail_images_pkey PRIMARY KEY (id);


--
-- Name: lab_details lab_details_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY lab_details
    ADD CONSTRAINT lab_details_pkey PRIMARY KEY (id);


--
-- Name: lab_services lab_services_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY lab_services
    ADD CONSTRAINT lab_services_pkey PRIMARY KEY (id);


--
-- Name: password_table password_table_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY password_table
    ADD CONSTRAINT password_table_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: permissions_roles permissions_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY permissions_roles
    ADD CONSTRAINT permissions_roles_pkey PRIMARY KEY (id);


--
-- Name: person_contact_infos person_contact_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY person_contact_infos
    ADD CONSTRAINT person_contact_infos_pkey PRIMARY KEY (id);


--
-- Name: person_info_extras person_info_extras_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY person_info_extras
    ADD CONSTRAINT person_info_extras_pkey PRIMARY KEY (id);


--
-- Name: person_infos person_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY person_infos
    ADD CONSTRAINT person_infos_pkey PRIMARY KEY (id);


--
-- Name: person_type_masters person_type_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY person_type_masters
    ADD CONSTRAINT person_type_masters_pkey PRIMARY KEY (id);


--
-- Name: pre_appointments pre_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY pre_appointments
    ADD CONSTRAINT pre_appointments_pkey PRIMARY KEY (id);


--
-- Name: profesional_groups profesional_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY profesional_groups
    ADD CONSTRAINT profesional_groups_pkey PRIMARY KEY (id);


--
-- Name: provider_engaged_users provider_engaged_users_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY provider_engaged_users
    ADD CONSTRAINT provider_engaged_users_pkey PRIMARY KEY (id);


--
-- Name: provider_masters provider_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY provider_masters
    ADD CONSTRAINT provider_masters_pkey PRIMARY KEY (id);


--
-- Name: provider_services provider_services_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY provider_services
    ADD CONSTRAINT provider_services_pkey PRIMARY KEY (id);


--
-- Name: region_masters region_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY region_masters
    ADD CONSTRAINT region_masters_pkey PRIMARY KEY (id);


--
-- Name: registration registration_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (id);


--
-- Name: request_categories request_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY request_categories
    ADD CONSTRAINT request_categories_pkey PRIMARY KEY (id);


--
-- Name: request_urgencies request_urgencies_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY request_urgencies
    ADD CONSTRAINT request_urgencies_pkey PRIMARY KEY (id);


--
-- Name: requester_allergies requester_allergies_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY requester_allergies
    ADD CONSTRAINT requester_allergies_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: service_masters service_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY service_masters
    ADD CONSTRAINT service_masters_pkey PRIMARY KEY (id);


--
-- Name: service_prov_extra_infos service_prov_extra_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY service_prov_extra_infos
    ADD CONSTRAINT service_prov_extra_infos_pkey PRIMARY KEY (id);


--
-- Name: service_prov_types service_prov_types_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY service_prov_types
    ADD CONSTRAINT service_prov_types_pkey PRIMARY KEY (id);


--
-- Name: specialty_masters specialty_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY specialty_masters
    ADD CONSTRAINT specialty_masters_pkey PRIMARY KEY (id);


--
-- Name: suburb_masters suburb_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY suburb_masters
    ADD CONSTRAINT suburb_masters_pkey PRIMARY KEY (id);


--
-- Name: user_services user_services_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY user_services
    ADD CONSTRAINT user_services_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: clemence
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: clemence
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

