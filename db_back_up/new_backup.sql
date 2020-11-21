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
-- Name: patient_med_records; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE patient_med_records (
    id integer NOT NULL,
    confirmed_appt_id integer,
    patient_id integer,
    doctor_id integer,
    clinical_complaints text,
    clinical_examinations text,
    working_diagnosis text,
    investigation_rquired text,
    treatments text,
    follow_up_plan character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    active_status boolean,
    del_status boolean,
    order_status boolean
);


ALTER TABLE patient_med_records OWNER TO clemence;

--
-- Name: patient_med_records_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE patient_med_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patient_med_records_id_seq OWNER TO clemence;

--
-- Name: patient_med_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE patient_med_records_id_seq OWNED BY patient_med_records.id;


--
-- Name: pds_patient_prev_med_histories; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE pds_patient_prev_med_histories (
    id integer NOT NULL,
    confirmed_pds_id integer,
    prev_med_histry character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE pds_patient_prev_med_histories OWNER TO clemence;

--
-- Name: pds_patient_prev_med_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE pds_patient_prev_med_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pds_patient_prev_med_histories_id_seq OWNER TO clemence;

--
-- Name: pds_patient_prev_med_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE pds_patient_prev_med_histories_id_seq OWNED BY pds_patient_prev_med_histories.id;


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
    duration integer,
    test_list text
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
-- Name: referals; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE referals (
    id integer NOT NULL,
    surname character varying,
    other_names character varying,
    dob date,
    contact character varying,
    refered_by integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    processed_status boolean
);


ALTER TABLE referals OWNER TO clemence;

--
-- Name: referals_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE referals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE referals_id_seq OWNER TO clemence;

--
-- Name: referals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE referals_id_seq OWNED BY referals.id;


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
    user_uniq_code text,
    dob date
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
    updated_at timestamp without time zone NOT NULL,
    requester_id integer
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
-- Name: patient_med_records id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY patient_med_records ALTER COLUMN id SET DEFAULT nextval('patient_med_records_id_seq'::regclass);


--
-- Name: pds_patient_prev_med_histories id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY pds_patient_prev_med_histories ALTER COLUMN id SET DEFAULT nextval('pds_patient_prev_med_histories_id_seq'::regclass);


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
-- Name: referals id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY referals ALTER COLUMN id SET DEFAULT nextval('referals_id_seq'::regclass);


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
9	Sausage		\N	\N	t	f	2018-03-05 15:25:54.963537	2018-03-05 15:25:54.963537
10	Onion		\N	\N	t	f	2018-03-16 12:57:04.363784	2018-03-16 12:57:04.363784
\.


--
-- Name: allergies_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('allergies_masters_id_seq', 10, true);


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
1	Accra		2	\N	83	t	f	2018-03-05 11:21:02.925539	2018-03-05 11:21:02.925539
\.


--
-- Name: city_town_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('city_town_masters_id_seq', 1, true);


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
13	Pelvic Dislocation		\N	t	f	2018-03-05 15:26:53.392617	2018-03-05 15:26:53.392617
\.


--
-- Name: condition_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('condition_masters_id_seq', 13, true);


--
-- Data for Name: confirmed_appointments; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY confirmed_appointments (id, pre_appointment_id, provider_id, complaint_desc, confirmed_date, confirmed_time, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, suburb_id, doctor_id, patient_id, attended_to) FROM stdin;
8	23	\N		2018-03-19 09:09:00	\N		36	\N	t	f	2018-03-19 09:09:54.678127	2018-03-21 18:21:46.541492	\N	63	101	f
1	1	8	<p>Headache</p>	2018-03-17 14:56:00	\N		36	\N	t	f	2018-03-16 14:56:34.891917	2018-03-16 14:56:34.891917	1	\N	\N	f
2	9	\N		\N	\N		36	\N	t	f	2018-03-16 15:20:40.903358	2018-03-16 15:20:40.903358	1	\N	\N	f
3	19	\N	\N	\N	\N	\N	\N	\N	f	f	2018-03-16 16:56:04.23591	2018-03-16 16:56:04.23591	2	63	107	f
4	19	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-16 17:04:54.791629	2018-03-16 17:04:54.791629	2	63	107	f
5	20	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 09:04:27.259573	2018-03-19 09:04:27.259573	2	63	101	f
7	22	\N		2018-03-19 09:09:00	\N		36	\N	t	f	2018-03-19 09:09:21.570961	2018-03-21 10:52:54.343645	\N	63	101	f
9	24	\N		2018-03-20 09:34:00	\N		36	\N	t	f	2018-03-19 09:35:19.553519	2018-03-22 16:46:14.896348	\N	63	101	t
6	21	\N		2018-03-19 09:08:00	\N		36	\N	t	f	2018-03-19 09:08:47.322713	2018-03-22 17:16:28.918965	\N	63	101	t
10	27	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 09:58:56.767957	2018-03-23 05:26:09.133408	2	\N	97	t
11	27	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 10:00:10.338939	2018-03-23 05:26:09.135765	2	\N	97	t
12	27	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 10:10:01.723492	2018-03-23 05:26:09.137661	2	\N	97	t
13	27	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 10:10:04.829715	2018-03-23 05:26:09.139578	2	\N	97	t
14	27	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 10:10:27.952843	2018-03-23 05:26:09.1415	2	\N	97	t
15	27	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 10:15:59.306789	2018-03-23 05:26:09.143353	2	\N	97	t
16	27	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 10:18:48.924412	2018-03-23 05:26:09.145226	1	102	97	t
17	28	\N		2018-03-20 10:40:00	\N		32	\N	t	f	2018-03-19 10:40:48.92159	2018-03-23 05:26:09.147078	\N	102	97	t
18	29	\N		2018-03-21 14:54:00	\N		32	\N	t	f	2018-03-21 14:54:09.632935	2018-03-23 05:26:09.148972	\N	102	97	t
19	39	8		2018-04-09 09:00:00	\N		116	\N	t	f	2018-04-06 10:39:57.163412	2018-04-06 10:39:57.163412	1	\N	\N	f
20	42	\N		2018-04-11 15:31:00	\N		36	\N	t	f	2018-04-10 15:32:49.488331	2018-04-10 15:32:49.488331	2	\N	\N	f
21	44	\N		2018-04-11 15:45:00	\N		36	\N	t	f	2018-04-10 15:45:34.172173	2018-04-10 16:01:16.290025	2	63	101	t
\.


--
-- Name: confirmed_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('confirmed_appointments_id_seq', 21, true);


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
2	63	107		\N	\N	t	f	2018-03-16 17:04:54.798194	2018-03-16 17:04:54.798194	19	2	PD	4
3	63	101		\N	\N	t	f	2018-03-19 09:04:27.265729	2018-03-19 09:04:27.265729	20	2	PD	5
4	63	101	\N	\N	36	t	f	2018-03-19 09:08:47.331812	2018-03-19 09:08:47.331812	21	2	PC	6
5	63	101	\N	\N	36	t	f	2018-03-19 09:09:21.579342	2018-03-19 09:09:21.579342	22	2	PDVC	7
6	63	101	\N	\N	36	t	f	2018-03-19 09:09:54.686955	2018-03-19 09:09:54.686955	23	2	PDHC	8
7	63	101	\N	\N	36	t	f	2018-03-19 09:35:19.562666	2018-03-19 09:35:19.562666	24	2	DP	9
8	102	97		\N	\N	t	f	2018-03-19 10:18:48.92987	2018-03-19 10:18:48.92987	27	1	PD	16
9	102	97	\N	\N	32	t	f	2018-03-19 10:40:48.930396	2018-03-19 10:40:48.930396	28	1	PC	17
10	102	97	\N	\N	32	t	f	2018-03-21 14:54:09.643034	2018-03-21 14:54:09.643034	29	1	PC	18
\.


--
-- Name: confirmed_personal_doctor_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('confirmed_personal_doctor_services_id_seq', 10, true);


--
-- Data for Name: country_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY country_masters (id, country_name, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	Ghana		\N	36	t	\N	2018-03-05 11:00:17.224621	2018-03-05 11:00:17.224621
2	Nigeria		\N	84	t	\N	2018-03-05 11:01:11.584752	2018-03-05 11:01:11.584752
3	Togo		\N	84	t	\N	2018-03-05 11:01:44.630775	2018-03-05 11:01:44.630775
4	South Africa		\N	83	t	\N	2018-03-05 11:02:59.566294	2018-03-05 11:02:59.566294
\.


--
-- Name: country_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('country_masters_id_seq', 4, true);


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
1	43	\N	\N	\N	\N	\N	2018-04-10 10:39:11.710074	2018-04-10 10:39:11.710074	voting1.png	image/png	264268	2018-04-10 10:39:11.028303
\.


--
-- Name: lab_detail_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('lab_detail_images_id_seq', 1, true);


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
36	21	1		\N	t	f	2018-03-05 16:29:46.235809	2018-03-05 16:29:46.235809
37	21	2		\N	t	f	2018-03-05 16:29:46.237955	2018-03-05 16:29:46.237955
38	21	4		\N	t	f	2018-03-05 16:29:46.239733	2018-03-05 16:29:46.239733
39	21	3		\N	t	f	2018-03-05 16:29:46.241523	2018-03-05 16:29:46.241523
40	33	1		\N	t	f	2018-03-26 17:03:13.037746	2018-03-26 17:03:13.037746
41	33	2		\N	t	f	2018-03-26 17:03:13.040054	2018-03-26 17:03:13.040054
42	33	3		\N	t	f	2018-03-26 17:03:13.042005	2018-03-26 17:03:13.042005
43	42	5		\N	t	f	2018-04-09 15:00:15.101321	2018-04-09 15:00:15.101321
44	42	9		\N	t	f	2018-04-09 15:00:15.103291	2018-04-09 15:00:15.103291
\.


--
-- Name: lab_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('lab_details_id_seq', 44, true);


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
9	Pelvic	2.0			t	f	2018-03-05 15:25:10.391686	2018-03-05 15:25:10.391686
\.


--
-- Name: lab_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('lab_services_id_seq', 9, true);


--
-- Data for Name: password_table; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY password_table (id, password, mobile_number, created_at, status, username) FROM stdin;
1	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0276113371	11:21:06.171255	f	saha
2	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0276113371	11:57:29.11303	f	saha
3	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	02447611337	11:59:13.785258	f	saha1
4	19fb57bda3a30aa7e10bd8f806f80bd33acd690d7ff74d8ce541a3d56f40ed4a	0248021199	15:44:10.758968	f	clara
5	942bfa93ce756706e02ad2b9bb732888bf9fd9fb9b59d4dd0042fab043a5dd30	44444444	16:00:26.2828	f	shola1
6	161eb88de06d3f94c2b4808435675903bcc978198da48498ceaa60612bbeed20	55555555	16:11:47.494544	f	joni1
7	836fff1d12aa49e02c8dc58540d7ff8ad925d72b061406f7e9d4d0c6ac0a8e30	666666	16:26:49.925093	f	joni1 
8	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0248153304	16:59:31.390426	f	sedem
9	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0244761122	21:20:23.9434	f	doc
10	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0571238789	09:14:22.935163	f	davi
11	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0244567123	11:04:16.708272	f	doc1
12	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	023344555	21:21:24.995062	f	new doc
13	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	024476113371	22:12:42.323234	f	bel
15	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0276113323	12:02:40.487942	f	test
16	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	0578009833	15:52:48.404162	f	sedem1
17	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0256665566	09:41:31.684825	f	andy11
18	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243333344	09:45:32.537673	f	\N
19	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	098380300	10:30:00.797737	f	nyan
20	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0246786578	15:45:32.191392	f	chris
21	b8164ad101cfd99e964a78f4cd44d531716408fd65190149539df6325973a8ea	0243556787	11:42:57.004508	f	sweetness
22	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0248021199	11:43:24.015793	f	akosua
23	e382e1c5da60817b34a9290c06165d30b4da1072277b5e55061607f7ad43c206	025433211	11:45:48.584166	f	mandy
24	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0504899386	09:43:21.231653	f	andrew
25	c2b6161a5690716f4136ddba1ae607d6adae10c061b99a4533931990aa4b8b4a	0246220138	09:45:57.76555	f	asamoah
26	c2b6161a5690716f4136ddba1ae607d6adae10c061b99a4533931990aa4b8b4a	0246220138	09:46:38.934916	f	ghinger
27	c2b6161a5690716f4136ddba1ae607d6adae10c061b99a4533931990aa4b8b4a	0246220138	09:47:13.915515	f	dasamoah
28	c2b6161a5690716f4136ddba1ae607d6adae10c061b99a4533931990aa4b8b4a	0246220138	09:47:56.03789	f	ghana
29	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	0567990011	17:04:44.868198	t	kate
30	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0267218638	10:51:59.38255	f	setor
31	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0267218638                                        	10:57:00.241455	f	setor
\.


--
-- Name: password_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('password_table_id_seq', 31, true);


--
-- Data for Name: patient_med_records; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY patient_med_records (id, confirmed_appt_id, patient_id, doctor_id, clinical_complaints, clinical_examinations, working_diagnosis, investigation_rquired, treatments, follow_up_plan, created_at, updated_at, active_status, del_status, order_status) FROM stdin;
1	9	101	63	<p>come</p>	<p>come</p>	<p>come</p>	<p>come</p>	<p>come</p>	<p>come</p>	2018-03-22 16:46:14.890697	2018-03-22 16:46:14.890697	t	f	f
3	\N	97	102	ghhgh	hghghg	ghghgkghg	hghkgg	kghg	kgkhgkh	2018-03-23 05:26:09.128542	2018-03-23 05:26:09.128542	\N	\N	\N
4	\N	97	102	dddd	jlkjk	vjbh	jv vv	ihui	uiuu	2018-03-23 05:32:04.456694	2018-03-23 05:32:04.456694	\N	\N	\N
5	\N	97	102	gfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfgh	gfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfgh	gfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfgh	gfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfgh	gfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfgh	gfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfghgfaghfaghfaghfgh	2018-03-23 10:55:00.509845	2018-03-23 10:55:00.509845	\N	\N	\N
2	6	101	63	<p>Have headache, Cold</p>\r\n<p>Also have a stomach upset</p>	<p>Maleria Test</p>\r\n<p>Typhoid Test</p>\r\n<p>Urine Test</p>	<p>None for now</p>	<p>None for now</p>	<p>Maleria</p>\r\n<p>Typhoid</p>	<p>Come for the remaining injections spread over 4 days</p>	2018-03-22 17:16:28.913899	2018-03-23 11:26:54.131325	t	f	t
6	\N	97	102							2018-03-23 14:02:53.703798	2018-03-23 14:02:53.703798	\N	\N	\N
7	21	101	63	<p>jkdj k</p>	<p>df</p>	<p>sdfd</p>	<p>dfsdf</p>	<p>sf</p>	<p>dfd</p>	2018-04-10 16:01:16.284638	2018-04-10 16:01:16.284638	t	f	f
\.


--
-- Name: patient_med_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('patient_med_records_id_seq', 7, true);


--
-- Data for Name: pds_patient_prev_med_histories; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY pds_patient_prev_med_histories (id, confirmed_pds_id, prev_med_histry, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	2	<p>Diabetic, asma</p>	36	t	f	2018-03-16 17:04:54.80865	2018-03-16 17:04:54.80865
2	3	Debetic	36	t	f	2018-03-19 09:04:27.275732	2018-03-19 09:04:27.275732
3	8	<p>Headaches</p>	36	t	f	2018-03-19 10:18:48.932309	2018-03-19 10:18:48.932309
\.


--
-- Name: pds_patient_prev_med_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('pds_patient_prev_med_histories_id_seq', 3, true);


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
484	PersonInfo	process_referal	process_referal	\N	2018-03-28 14:28:34.299585	2018-03-28 14:28:34.299585
485	PersonInfo	process_referal_create	process_referal_create	\N	2018-03-28 14:28:34.302777	2018-03-28 14:28:34.302777
486	ConfirmedPersonalDoctorService	disable_personal_patient	disable_personal_patient	\N	2018-03-28 14:28:34.332102	2018-03-28 14:28:34.332102
487	DoctorHome	manage	manage	\N	2018-03-28 14:28:34.445282	2018-03-28 14:28:34.445282
488	DoctorHome	index	list	\N	2018-03-28 14:28:34.449296	2018-03-28 14:28:34.449296
489	DoctorHome	warning	warning	\N	2018-03-28 14:28:34.451282	2018-03-28 14:28:34.451282
490	DoctorHome	info	info	\N	2018-03-28 14:28:34.453224	2018-03-28 14:28:34.453224
491	DoctorHome	success	success	\N	2018-03-28 14:28:34.455115	2018-03-28 14:28:34.455115
492	DoctorHome	danger	danger	\N	2018-03-28 14:28:34.457078	2018-03-28 14:28:34.457078
493	Referal	manage	manage	\N	2018-03-28 14:28:34.54478	2018-03-28 14:28:34.54478
494	Referal	create	create and update	\N	2018-03-28 14:28:34.548642	2018-03-28 14:28:34.548642
495	Referal	index	list	\N	2018-03-28 14:28:34.550611	2018-03-28 14:28:34.550611
496	Referal	update	create and update	\N	2018-03-28 14:28:34.552539	2018-03-28 14:28:34.552539
497	Referal	show	show	\N	2018-03-28 14:28:34.555081	2018-03-28 14:28:34.555081
498	Referal	destroy	delete	\N	2018-03-28 14:28:34.557643	2018-03-28 14:28:34.557643
499	Referal	all_referal_excel	all_referal_excel	\N	2018-03-28 14:28:34.55953	2018-03-28 14:28:34.55953
500	Referal	my_referal	my_referal	\N	2018-03-28 14:28:34.561456	2018-03-28 14:28:34.561456
501	Referal	refer_patient	refer_patient	\N	2018-03-28 14:28:34.563393	2018-03-28 14:28:34.563393
502	Referal	enable_referal	enable_referal	\N	2018-03-28 14:28:34.565375	2018-03-28 14:28:34.565375
503	Referal	disable_referal	disable_referal	\N	2018-03-28 14:28:34.567276	2018-03-28 14:28:34.567276
504	Referal	warning	warning	\N	2018-03-28 14:28:34.569148	2018-03-28 14:28:34.569148
505	Referal	info	info	\N	2018-03-28 14:28:34.571014	2018-03-28 14:28:34.571014
506	Referal	success	success	\N	2018-03-28 14:28:34.572954	2018-03-28 14:28:34.572954
507	Referal	danger	danger	\N	2018-03-28 14:28:34.574852	2018-03-28 14:28:34.574852
508	ConfirmedAppointment	doctor_pds	doctor_pds	\N	2018-03-28 14:28:34.619364	2018-03-28 14:28:34.619364
509	ConfirmedAppointment	find_patient_details	find_patient_details	\N	2018-03-28 14:28:34.621393	2018-03-28 14:28:34.621393
510	ConfirmedAppointment	update_attend_status	update_attend_status	\N	2018-03-28 14:28:34.623336	2018-03-28 14:28:34.623336
511	PatientMedRecord	manage	manage	\N	2018-03-28 14:28:34.671596	2018-03-28 14:28:34.671596
512	PatientMedRecord	create	create and update	\N	2018-03-28 14:28:34.675373	2018-03-28 14:28:34.675373
513	PatientMedRecord	index	list	\N	2018-03-28 14:28:34.677352	2018-03-28 14:28:34.677352
514	PatientMedRecord	update	create and update	\N	2018-03-28 14:28:34.679349	2018-03-28 14:28:34.679349
515	PatientMedRecord	show	show	\N	2018-03-28 14:28:34.681811	2018-03-28 14:28:34.681811
516	PatientMedRecord	destroy	delete	\N	2018-03-28 14:28:34.684353	2018-03-28 14:28:34.684353
517	PatientMedRecord	patient_confirmed_unattended_to_appt	patient_confirmed_unattended_to_appt	\N	2018-03-28 14:28:34.686228	2018-03-28 14:28:34.686228
518	PatientMedRecord	record_detail	record_detail	\N	2018-03-28 14:28:34.688056	2018-03-28 14:28:34.688056
519	PatientMedRecord	patient_unordered_record	patient_unordered_record	\N	2018-03-28 14:28:34.689911	2018-03-28 14:28:34.689911
520	PatientMedRecord	order_treatment	order_treatment	\N	2018-03-28 14:28:34.691825	2018-03-28 14:28:34.691825
521	PatientMedRecord	warning	warning	\N	2018-03-28 14:28:34.693706	2018-03-28 14:28:34.693706
522	PatientMedRecord	info	info	\N	2018-03-28 14:28:34.695548	2018-03-28 14:28:34.695548
523	PatientMedRecord	success	success	\N	2018-03-28 14:28:34.697471	2018-03-28 14:28:34.697471
524	PatientMedRecord	danger	danger	\N	2018-03-28 14:28:34.699424	2018-03-28 14:28:34.699424
525	PreAppointment	create_order_show	create_order_show	\N	2018-03-28 14:28:34.752404	2018-03-28 14:28:34.752404
526	PreAppointment	place_order	place_order	\N	2018-03-28 14:28:34.754453	2018-03-28 14:28:34.754453
527	PreAppointment	process_order	process_order	\N	2018-03-28 14:28:34.758003	2018-03-28 14:28:34.758003
528	PdsPatientPrevMedHistory	manage	manage	\N	2018-03-28 14:28:34.800096	2018-03-28 14:28:34.800096
529	PdsPatientPrevMedHistory	create	create and update	\N	2018-03-28 14:28:34.803884	2018-03-28 14:28:34.803884
530	PdsPatientPrevMedHistory	index	list	\N	2018-03-28 14:28:34.805778	2018-03-28 14:28:34.805778
531	PdsPatientPrevMedHistory	update	create and update	\N	2018-03-28 14:28:34.807714	2018-03-28 14:28:34.807714
532	PdsPatientPrevMedHistory	show	show	\N	2018-03-28 14:28:34.810224	2018-03-28 14:28:34.810224
533	PdsPatientPrevMedHistory	destroy	delete	\N	2018-03-28 14:28:34.812708	2018-03-28 14:28:34.812708
534	PdsPatientPrevMedHistory	warning	warning	\N	2018-03-28 14:28:34.814563	2018-03-28 14:28:34.814563
535	PdsPatientPrevMedHistory	info	info	\N	2018-03-28 14:28:34.816442	2018-03-28 14:28:34.816442
536	PdsPatientPrevMedHistory	success	success	\N	2018-03-28 14:28:34.818369	2018-03-28 14:28:34.818369
537	PdsPatientPrevMedHistory	danger	danger	\N	2018-03-28 14:28:34.820263	2018-03-28 14:28:34.820263
538	Registration	get_location	get_location	\N	2018-04-10 15:54:47.455961	2018-04-10 15:54:47.455961
539	Registration	find_regions	find_regions	\N	2018-04-10 15:54:47.459041	2018-04-10 15:54:47.459041
540	Registration	find_cities_for_region	find_cities_for_region	\N	2018-04-10 15:54:47.461088	2018-04-10 15:54:47.461088
541	Registration	find_suburbs_for_city	find_suburbs_for_city	\N	2018-04-10 15:54:47.463077	2018-04-10 15:54:47.463077
542	Registration	get_location_process	get_location_process	\N	2018-04-10 15:54:47.465091	2018-04-10 15:54:47.465091
543	Registration	process_registration	process_registration	\N	2018-04-10 15:54:47.467157	2018-04-10 15:54:47.467157
544	PreAppointment	my_appointment	my_appointment	\N	2018-04-10 15:54:47.770914	2018-04-10 15:54:47.770914
545	PreAppointment	patient_appt_show	patient_appt_show	\N	2018-04-10 15:54:47.773189	2018-04-10 15:54:47.773189
546	PreAppointment	patient_new_appointment	patient_new_appointment	\N	2018-04-10 15:54:47.775182	2018-04-10 15:54:47.775182
547	PreAppointment	process_patient_new_appointment	process_patient_new_appointment	\N	2018-04-10 15:54:47.777189	2018-04-10 15:54:47.777189
548	PreAppointment	patient_lab_details	patient_lab_details	\N	2018-04-10 15:54:47.779204	2018-04-10 15:54:47.779204
549	PreAppointment	patient_lab_detail_image	patient_lab_detail_image	\N	2018-04-10 15:54:47.781279	2018-04-10 15:54:47.781279
550	PreAppointment	med_record	med_record	\N	2018-04-10 15:54:47.783253	2018-04-10 15:54:47.783253
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('permissions_id_seq', 550, true);


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
1667	\N	369	2018-03-29 11:38:38.800503	2018-03-29 11:38:38.800503	8
1668	\N	370	2018-03-29 11:38:38.801446	2018-03-29 11:38:38.801446	8
1669	\N	371	2018-03-29 11:38:38.802379	2018-03-29 11:38:38.802379	8
1670	\N	372	2018-03-29 11:38:38.803293	2018-03-29 11:38:38.803293	8
1671	\N	373	2018-03-29 11:38:38.804242	2018-03-29 11:38:38.804242	8
1672	\N	374	2018-03-29 11:38:38.805193	2018-03-29 11:38:38.805193	8
1673	\N	375	2018-03-29 11:38:38.806138	2018-03-29 11:38:38.806138	8
1674	\N	376	2018-03-29 11:38:38.807094	2018-03-29 11:38:38.807094	8
1675	\N	377	2018-03-29 11:38:38.808042	2018-03-29 11:38:38.808042	8
1676	\N	378	2018-03-29 11:38:38.809004	2018-03-29 11:38:38.809004	8
1677	\N	379	2018-03-29 11:38:38.809942	2018-03-29 11:38:38.809942	8
1678	\N	380	2018-03-29 11:38:38.810873	2018-03-29 11:38:38.810873	8
1679	\N	381	2018-03-29 11:38:38.811805	2018-03-29 11:38:38.811805	8
1680	\N	382	2018-03-29 11:38:38.812749	2018-03-29 11:38:38.812749	8
1681	\N	383	2018-03-29 11:38:38.813695	2018-03-29 11:38:38.813695	8
1682	\N	384	2018-03-29 11:38:38.814642	2018-03-29 11:38:38.814642	8
1683	\N	385	2018-03-29 11:38:38.815558	2018-03-29 11:38:38.815558	8
1684	\N	386	2018-03-29 11:38:38.816451	2018-03-29 11:38:38.816451	8
1685	\N	387	2018-03-29 11:38:38.817364	2018-03-29 11:38:38.817364	8
1686	\N	388	2018-03-29 11:38:38.818292	2018-03-29 11:38:38.818292	8
1687	\N	389	2018-03-29 11:38:38.819198	2018-03-29 11:38:38.819198	8
1688	\N	390	2018-03-29 11:38:38.82012	2018-03-29 11:38:38.82012	8
1689	\N	391	2018-03-29 11:38:38.821076	2018-03-29 11:38:38.821076	8
1690	\N	392	2018-03-29 11:38:38.82202	2018-03-29 11:38:38.82202	8
1691	\N	393	2018-03-29 11:38:38.82296	2018-03-29 11:38:38.82296	8
1692	\N	394	2018-03-29 11:38:38.82389	2018-03-29 11:38:38.82389	8
1693	\N	395	2018-03-29 11:38:38.824818	2018-03-29 11:38:38.824818	8
1694	\N	396	2018-03-29 11:38:38.825752	2018-03-29 11:38:38.825752	8
1695	\N	397	2018-03-29 11:38:38.826714	2018-03-29 11:38:38.826714	8
1696	\N	398	2018-03-29 11:38:38.827668	2018-03-29 11:38:38.827668	8
1697	\N	399	2018-03-29 11:38:38.828593	2018-03-29 11:38:38.828593	8
1698	\N	400	2018-03-29 11:38:38.829503	2018-03-29 11:38:38.829503	8
1699	\N	401	2018-03-29 11:38:38.830429	2018-03-29 11:38:38.830429	8
1700	\N	402	2018-03-29 11:38:38.831352	2018-03-29 11:38:38.831352	8
1701	\N	403	2018-03-29 11:38:38.832278	2018-03-29 11:38:38.832278	8
1702	\N	404	2018-03-29 11:38:38.833183	2018-03-29 11:38:38.833183	8
1703	\N	405	2018-03-29 11:38:38.834112	2018-03-29 11:38:38.834112	8
1704	\N	406	2018-03-29 11:38:38.835061	2018-03-29 11:38:38.835061	8
1705	\N	407	2018-03-29 11:38:38.836021	2018-03-29 11:38:38.836021	8
1706	\N	408	2018-03-29 11:38:38.836944	2018-03-29 11:38:38.836944	8
1707	\N	421	2018-03-29 11:38:38.837889	2018-03-29 11:38:38.837889	8
1708	\N	422	2018-03-29 11:38:38.838815	2018-03-29 11:38:38.838815	8
1709	\N	423	2018-03-29 11:38:38.839751	2018-03-29 11:38:38.839751	8
1710	\N	424	2018-03-29 11:38:38.840714	2018-03-29 11:38:38.840714	8
1711	\N	425	2018-03-29 11:38:38.84163	2018-03-29 11:38:38.84163	8
1712	\N	426	2018-03-29 11:38:38.842568	2018-03-29 11:38:38.842568	8
1713	\N	427	2018-03-29 11:38:38.843452	2018-03-29 11:38:38.843452	8
1714	\N	428	2018-03-29 11:38:38.844391	2018-03-29 11:38:38.844391	8
1715	\N	429	2018-03-29 11:38:38.845306	2018-03-29 11:38:38.845306	8
1716	\N	430	2018-03-29 11:38:38.846238	2018-03-29 11:38:38.846238	8
1717	\N	431	2018-03-29 11:38:38.847148	2018-03-29 11:38:38.847148	8
1718	\N	432	2018-03-29 11:38:38.8481	2018-03-29 11:38:38.8481	8
1719	\N	433	2018-03-29 11:38:38.849063	2018-03-29 11:38:38.849063	8
1720	\N	434	2018-03-29 11:38:38.850021	2018-03-29 11:38:38.850021	8
1721	\N	435	2018-03-29 11:38:38.850926	2018-03-29 11:38:38.850926	8
1722	\N	436	2018-03-29 11:38:38.851867	2018-03-29 11:38:38.851867	8
1723	\N	437	2018-03-29 11:38:38.852797	2018-03-29 11:38:38.852797	8
1724	\N	438	2018-03-29 11:38:38.853734	2018-03-29 11:38:38.853734	8
1725	\N	439	2018-03-29 11:38:38.854699	2018-03-29 11:38:38.854699	8
1726	\N	440	2018-03-29 11:38:38.855617	2018-03-29 11:38:38.855617	8
1727	\N	441	2018-03-29 11:38:38.856524	2018-03-29 11:38:38.856524	8
1728	\N	442	2018-03-29 11:38:38.857463	2018-03-29 11:38:38.857463	8
1729	\N	443	2018-03-29 11:38:38.858386	2018-03-29 11:38:38.858386	8
1730	\N	444	2018-03-29 11:38:38.859308	2018-03-29 11:38:38.859308	8
1731	\N	445	2018-03-29 11:38:38.860221	2018-03-29 11:38:38.860221	8
1732	\N	446	2018-03-29 11:38:38.861138	2018-03-29 11:38:38.861138	8
1733	\N	447	2018-03-29 11:38:38.862096	2018-03-29 11:38:38.862096	8
1734	\N	448	2018-03-29 11:38:38.863046	2018-03-29 11:38:38.863046	8
1735	\N	449	2018-03-29 11:38:38.864002	2018-03-29 11:38:38.864002	8
1736	\N	450	2018-03-29 11:38:38.864943	2018-03-29 11:38:38.864943	8
1737	\N	451	2018-03-29 11:38:38.86587	2018-03-29 11:38:38.86587	8
1738	\N	452	2018-03-29 11:38:38.866816	2018-03-29 11:38:38.866816	8
1739	\N	453	2018-03-29 11:38:38.867746	2018-03-29 11:38:38.867746	8
1740	\N	454	2018-03-29 11:38:38.868704	2018-03-29 11:38:38.868704	8
1741	\N	455	2018-03-29 11:38:38.86962	2018-03-29 11:38:38.86962	8
1742	\N	456	2018-03-29 11:38:38.870526	2018-03-29 11:38:38.870526	8
1743	\N	458	2018-03-29 11:38:38.871458	2018-03-29 11:38:38.871458	8
1295	\N	72	2018-03-29 10:52:47.504794	2018-03-29 10:52:47.504794	5
1296	\N	73	2018-03-29 10:52:47.508458	2018-03-29 10:52:47.508458	5
1297	\N	75	2018-03-29 10:52:47.511106	2018-03-29 10:52:47.511106	5
1298	\N	83	2018-03-29 10:52:47.513772	2018-03-29 10:52:47.513772	5
1299	\N	84	2018-03-29 10:52:47.516418	2018-03-29 10:52:47.516418	5
1300	\N	2	2018-03-29 11:38:38.437687	2018-03-29 11:38:38.437687	8
1301	\N	3	2018-03-29 11:38:38.438862	2018-03-29 11:38:38.438862	8
1302	\N	4	2018-03-29 11:38:38.439867	2018-03-29 11:38:38.439867	8
1303	\N	5	2018-03-29 11:38:38.440839	2018-03-29 11:38:38.440839	8
1304	\N	6	2018-03-29 11:38:38.441827	2018-03-29 11:38:38.441827	8
1305	\N	7	2018-03-29 11:38:38.442815	2018-03-29 11:38:38.442815	8
1306	\N	8	2018-03-29 11:38:38.44375	2018-03-29 11:38:38.44375	8
1307	\N	9	2018-03-29 11:38:38.444707	2018-03-29 11:38:38.444707	8
1308	\N	10	2018-03-29 11:38:38.445636	2018-03-29 11:38:38.445636	8
1309	\N	11	2018-03-29 11:38:38.446573	2018-03-29 11:38:38.446573	8
1310	\N	12	2018-03-29 11:38:38.447521	2018-03-29 11:38:38.447521	8
1311	\N	13	2018-03-29 11:38:38.448488	2018-03-29 11:38:38.448488	8
1312	\N	14	2018-03-29 11:38:38.449527	2018-03-29 11:38:38.449527	8
1313	\N	15	2018-03-29 11:38:38.45058	2018-03-29 11:38:38.45058	8
1314	\N	16	2018-03-29 11:38:38.45155	2018-03-29 11:38:38.45155	8
1315	\N	17	2018-03-29 11:38:38.452517	2018-03-29 11:38:38.452517	8
1316	\N	18	2018-03-29 11:38:38.453487	2018-03-29 11:38:38.453487	8
1317	\N	19	2018-03-29 11:38:38.454452	2018-03-29 11:38:38.454452	8
1318	\N	20	2018-03-29 11:38:38.455458	2018-03-29 11:38:38.455458	8
1319	\N	21	2018-03-29 11:38:38.456408	2018-03-29 11:38:38.456408	8
1320	\N	22	2018-03-29 11:38:38.457382	2018-03-29 11:38:38.457382	8
1321	\N	23	2018-03-29 11:38:38.458359	2018-03-29 11:38:38.458359	8
1322	\N	24	2018-03-29 11:38:38.459317	2018-03-29 11:38:38.459317	8
1323	\N	25	2018-03-29 11:38:38.4603	2018-03-29 11:38:38.4603	8
1324	\N	26	2018-03-29 11:38:38.46123	2018-03-29 11:38:38.46123	8
1325	\N	27	2018-03-29 11:38:38.462222	2018-03-29 11:38:38.462222	8
1326	\N	28	2018-03-29 11:38:38.463165	2018-03-29 11:38:38.463165	8
1327	\N	29	2018-03-29 11:38:38.464124	2018-03-29 11:38:38.464124	8
1328	\N	30	2018-03-29 11:38:38.465086	2018-03-29 11:38:38.465086	8
1329	\N	31	2018-03-29 11:38:38.466035	2018-03-29 11:38:38.466035	8
1330	\N	32	2018-03-29 11:38:38.466987	2018-03-29 11:38:38.466987	8
1331	\N	33	2018-03-29 11:38:38.46793	2018-03-29 11:38:38.46793	8
1332	\N	34	2018-03-29 11:38:38.46887	2018-03-29 11:38:38.46887	8
1333	\N	35	2018-03-29 11:38:38.469809	2018-03-29 11:38:38.469809	8
1334	\N	36	2018-03-29 11:38:38.470789	2018-03-29 11:38:38.470789	8
1335	\N	37	2018-03-29 11:38:38.471743	2018-03-29 11:38:38.471743	8
1336	\N	38	2018-03-29 11:38:38.472713	2018-03-29 11:38:38.472713	8
1337	\N	39	2018-03-29 11:38:38.473684	2018-03-29 11:38:38.473684	8
1338	\N	40	2018-03-29 11:38:38.474628	2018-03-29 11:38:38.474628	8
1339	\N	41	2018-03-29 11:38:38.475579	2018-03-29 11:38:38.475579	8
1340	\N	42	2018-03-29 11:38:38.476526	2018-03-29 11:38:38.476526	8
1341	\N	43	2018-03-29 11:38:38.477453	2018-03-29 11:38:38.477453	8
1342	\N	44	2018-03-29 11:38:38.478383	2018-03-29 11:38:38.478383	8
1343	\N	45	2018-03-29 11:38:38.479321	2018-03-29 11:38:38.479321	8
1344	\N	46	2018-03-29 11:38:38.480307	2018-03-29 11:38:38.480307	8
1345	\N	47	2018-03-29 11:38:38.481277	2018-03-29 11:38:38.481277	8
1346	\N	48	2018-03-29 11:38:38.482236	2018-03-29 11:38:38.482236	8
1347	\N	49	2018-03-29 11:38:38.483172	2018-03-29 11:38:38.483172	8
1348	\N	50	2018-03-29 11:38:38.484138	2018-03-29 11:38:38.484138	8
1349	\N	51	2018-03-29 11:38:38.485091	2018-03-29 11:38:38.485091	8
1350	\N	52	2018-03-29 11:38:38.486018	2018-03-29 11:38:38.486018	8
1351	\N	53	2018-03-29 11:38:38.486948	2018-03-29 11:38:38.486948	8
1352	\N	54	2018-03-29 11:38:38.487893	2018-03-29 11:38:38.487893	8
1353	\N	55	2018-03-29 11:38:38.488836	2018-03-29 11:38:38.488836	8
1354	\N	56	2018-03-29 11:38:38.489778	2018-03-29 11:38:38.489778	8
1355	\N	57	2018-03-29 11:38:38.490733	2018-03-29 11:38:38.490733	8
1356	\N	58	2018-03-29 11:38:38.491703	2018-03-29 11:38:38.491703	8
1357	\N	59	2018-03-29 11:38:38.492629	2018-03-29 11:38:38.492629	8
1358	\N	60	2018-03-29 11:38:38.49359	2018-03-29 11:38:38.49359	8
1359	\N	61	2018-03-29 11:38:38.494547	2018-03-29 11:38:38.494547	8
1360	\N	62	2018-03-29 11:38:38.495478	2018-03-29 11:38:38.495478	8
1361	\N	63	2018-03-29 11:38:38.496424	2018-03-29 11:38:38.496424	8
1362	\N	64	2018-03-29 11:38:38.49736	2018-03-29 11:38:38.49736	8
1363	\N	65	2018-03-29 11:38:38.498329	2018-03-29 11:38:38.498329	8
1364	\N	66	2018-03-29 11:38:38.499336	2018-03-29 11:38:38.499336	8
1365	\N	67	2018-03-29 11:38:38.500297	2018-03-29 11:38:38.500297	8
1366	\N	68	2018-03-29 11:38:38.501302	2018-03-29 11:38:38.501302	8
1367	\N	69	2018-03-29 11:38:38.502283	2018-03-29 11:38:38.502283	8
1368	\N	70	2018-03-29 11:38:38.503241	2018-03-29 11:38:38.503241	8
1369	\N	71	2018-03-29 11:38:38.504268	2018-03-29 11:38:38.504268	8
1370	\N	72	2018-03-29 11:38:38.505267	2018-03-29 11:38:38.505267	8
1371	\N	73	2018-03-29 11:38:38.506264	2018-03-29 11:38:38.506264	8
1372	\N	74	2018-03-29 11:38:38.507261	2018-03-29 11:38:38.507261	8
1373	\N	75	2018-03-29 11:38:38.508257	2018-03-29 11:38:38.508257	8
1374	\N	76	2018-03-29 11:38:38.509232	2018-03-29 11:38:38.509232	8
1375	\N	77	2018-03-29 11:38:38.510235	2018-03-29 11:38:38.510235	8
1376	\N	78	2018-03-29 11:38:38.51122	2018-03-29 11:38:38.51122	8
1377	\N	79	2018-03-29 11:38:38.512205	2018-03-29 11:38:38.512205	8
1378	\N	80	2018-03-29 11:38:38.513228	2018-03-29 11:38:38.513228	8
1379	\N	81	2018-03-29 11:38:38.514225	2018-03-29 11:38:38.514225	8
1380	\N	82	2018-03-29 11:38:38.515226	2018-03-29 11:38:38.515226	8
1381	\N	83	2018-03-29 11:38:38.516268	2018-03-29 11:38:38.516268	8
1382	\N	84	2018-03-29 11:38:38.517263	2018-03-29 11:38:38.517263	8
1383	\N	85	2018-03-29 11:38:38.518262	2018-03-29 11:38:38.518262	8
1384	\N	86	2018-03-29 11:38:38.51924	2018-03-29 11:38:38.51924	8
1385	\N	87	2018-03-29 11:38:38.520225	2018-03-29 11:38:38.520225	8
1386	\N	88	2018-03-29 11:38:38.521218	2018-03-29 11:38:38.521218	8
1387	\N	89	2018-03-29 11:38:38.522206	2018-03-29 11:38:38.522206	8
1388	\N	90	2018-03-29 11:38:38.523225	2018-03-29 11:38:38.523225	8
1389	\N	91	2018-03-29 11:38:38.524196	2018-03-29 11:38:38.524196	8
1390	\N	92	2018-03-29 11:38:38.525222	2018-03-29 11:38:38.525222	8
1391	\N	93	2018-03-29 11:38:38.526201	2018-03-29 11:38:38.526201	8
1392	\N	94	2018-03-29 11:38:38.527187	2018-03-29 11:38:38.527187	8
1393	\N	95	2018-03-29 11:38:38.528172	2018-03-29 11:38:38.528172	8
1394	\N	96	2018-03-29 11:38:38.529234	2018-03-29 11:38:38.529234	8
1395	\N	97	2018-03-29 11:38:38.53022	2018-03-29 11:38:38.53022	8
1396	\N	98	2018-03-29 11:38:38.531201	2018-03-29 11:38:38.531201	8
1397	\N	99	2018-03-29 11:38:38.532194	2018-03-29 11:38:38.532194	8
1398	\N	100	2018-03-29 11:38:38.53319	2018-03-29 11:38:38.53319	8
1399	\N	101	2018-03-29 11:38:38.534179	2018-03-29 11:38:38.534179	8
1400	\N	102	2018-03-29 11:38:38.535166	2018-03-29 11:38:38.535166	8
1401	\N	103	2018-03-29 11:38:38.536134	2018-03-29 11:38:38.536134	8
1402	\N	104	2018-03-29 11:38:38.537127	2018-03-29 11:38:38.537127	8
1403	\N	105	2018-03-29 11:38:38.538103	2018-03-29 11:38:38.538103	8
1404	\N	106	2018-03-29 11:38:38.539101	2018-03-29 11:38:38.539101	8
1405	\N	107	2018-03-29 11:38:38.540082	2018-03-29 11:38:38.540082	8
1406	\N	108	2018-03-29 11:38:38.541048	2018-03-29 11:38:38.541048	8
1407	\N	109	2018-03-29 11:38:38.542032	2018-03-29 11:38:38.542032	8
1408	\N	110	2018-03-29 11:38:38.543001	2018-03-29 11:38:38.543001	8
1409	\N	111	2018-03-29 11:38:38.543948	2018-03-29 11:38:38.543948	8
1410	\N	112	2018-03-29 11:38:38.544892	2018-03-29 11:38:38.544892	8
1411	\N	113	2018-03-29 11:38:38.545835	2018-03-29 11:38:38.545835	8
1412	\N	114	2018-03-29 11:38:38.546797	2018-03-29 11:38:38.546797	8
1413	\N	115	2018-03-29 11:38:38.547747	2018-03-29 11:38:38.547747	8
1414	\N	116	2018-03-29 11:38:38.548703	2018-03-29 11:38:38.548703	8
1415	\N	117	2018-03-29 11:38:38.549662	2018-03-29 11:38:38.549662	8
1416	\N	118	2018-03-29 11:38:38.550595	2018-03-29 11:38:38.550595	8
1417	\N	119	2018-03-29 11:38:38.55152	2018-03-29 11:38:38.55152	8
1418	\N	120	2018-03-29 11:38:38.552447	2018-03-29 11:38:38.552447	8
1419	\N	121	2018-03-29 11:38:38.553376	2018-03-29 11:38:38.553376	8
1420	\N	122	2018-03-29 11:38:38.554321	2018-03-29 11:38:38.554321	8
1421	\N	123	2018-03-29 11:38:38.555264	2018-03-29 11:38:38.555264	8
1422	\N	124	2018-03-29 11:38:38.556217	2018-03-29 11:38:38.556217	8
1423	\N	125	2018-03-29 11:38:38.557154	2018-03-29 11:38:38.557154	8
1424	\N	126	2018-03-29 11:38:38.55816	2018-03-29 11:38:38.55816	8
1425	\N	127	2018-03-29 11:38:38.559115	2018-03-29 11:38:38.559115	8
1426	\N	128	2018-03-29 11:38:38.560105	2018-03-29 11:38:38.560105	8
1427	\N	129	2018-03-29 11:38:38.56106	2018-03-29 11:38:38.56106	8
1428	\N	130	2018-03-29 11:38:38.562044	2018-03-29 11:38:38.562044	8
1429	\N	131	2018-03-29 11:38:38.563009	2018-03-29 11:38:38.563009	8
1430	\N	132	2018-03-29 11:38:38.563963	2018-03-29 11:38:38.563963	8
1431	\N	133	2018-03-29 11:38:38.564918	2018-03-29 11:38:38.564918	8
1432	\N	134	2018-03-29 11:38:38.565888	2018-03-29 11:38:38.565888	8
1433	\N	135	2018-03-29 11:38:38.566843	2018-03-29 11:38:38.566843	8
1434	\N	136	2018-03-29 11:38:38.567803	2018-03-29 11:38:38.567803	8
1435	\N	137	2018-03-29 11:38:38.56877	2018-03-29 11:38:38.56877	8
1436	\N	138	2018-03-29 11:38:38.569719	2018-03-29 11:38:38.569719	8
1437	\N	139	2018-03-29 11:38:38.570716	2018-03-29 11:38:38.570716	8
1438	\N	140	2018-03-29 11:38:38.571657	2018-03-29 11:38:38.571657	8
1439	\N	141	2018-03-29 11:38:38.572585	2018-03-29 11:38:38.572585	8
1440	\N	142	2018-03-29 11:38:38.573486	2018-03-29 11:38:38.573486	8
1441	\N	143	2018-03-29 11:38:38.574413	2018-03-29 11:38:38.574413	8
1442	\N	144	2018-03-29 11:38:38.575366	2018-03-29 11:38:38.575366	8
1443	\N	145	2018-03-29 11:38:38.576289	2018-03-29 11:38:38.576289	8
1444	\N	146	2018-03-29 11:38:38.577252	2018-03-29 11:38:38.577252	8
1445	\N	147	2018-03-29 11:38:38.57816	2018-03-29 11:38:38.57816	8
1446	\N	148	2018-03-29 11:38:38.579103	2018-03-29 11:38:38.579103	8
1447	\N	149	2018-03-29 11:38:38.58008	2018-03-29 11:38:38.58008	8
1448	\N	150	2018-03-29 11:38:38.581046	2018-03-29 11:38:38.581046	8
1449	\N	151	2018-03-29 11:38:38.58203	2018-03-29 11:38:38.58203	8
1450	\N	152	2018-03-29 11:38:38.583002	2018-03-29 11:38:38.583002	8
1451	\N	153	2018-03-29 11:38:38.583963	2018-03-29 11:38:38.583963	8
1452	\N	154	2018-03-29 11:38:38.584925	2018-03-29 11:38:38.584925	8
1453	\N	155	2018-03-29 11:38:38.585871	2018-03-29 11:38:38.585871	8
1454	\N	156	2018-03-29 11:38:38.586831	2018-03-29 11:38:38.586831	8
1455	\N	157	2018-03-29 11:38:38.587776	2018-03-29 11:38:38.587776	8
1456	\N	158	2018-03-29 11:38:38.588759	2018-03-29 11:38:38.588759	8
1457	\N	159	2018-03-29 11:38:38.589721	2018-03-29 11:38:38.589721	8
1458	\N	160	2018-03-29 11:38:38.590702	2018-03-29 11:38:38.590702	8
1459	\N	161	2018-03-29 11:38:38.59166	2018-03-29 11:38:38.59166	8
1460	\N	162	2018-03-29 11:38:38.592601	2018-03-29 11:38:38.592601	8
1461	\N	163	2018-03-29 11:38:38.593513	2018-03-29 11:38:38.593513	8
1462	\N	164	2018-03-29 11:38:38.594485	2018-03-29 11:38:38.594485	8
1463	\N	165	2018-03-29 11:38:38.59542	2018-03-29 11:38:38.59542	8
1464	\N	166	2018-03-29 11:38:38.596346	2018-03-29 11:38:38.596346	8
1465	\N	167	2018-03-29 11:38:38.597289	2018-03-29 11:38:38.597289	8
1466	\N	168	2018-03-29 11:38:38.59823	2018-03-29 11:38:38.59823	8
1467	\N	169	2018-03-29 11:38:38.599197	2018-03-29 11:38:38.599197	8
1468	\N	170	2018-03-29 11:38:38.600149	2018-03-29 11:38:38.600149	8
1469	\N	171	2018-03-29 11:38:38.601111	2018-03-29 11:38:38.601111	8
1470	\N	172	2018-03-29 11:38:38.602094	2018-03-29 11:38:38.602094	8
1471	\N	173	2018-03-29 11:38:38.603072	2018-03-29 11:38:38.603072	8
1472	\N	174	2018-03-29 11:38:38.604034	2018-03-29 11:38:38.604034	8
1473	\N	175	2018-03-29 11:38:38.605002	2018-03-29 11:38:38.605002	8
1474	\N	176	2018-03-29 11:38:38.605977	2018-03-29 11:38:38.605977	8
1475	\N	177	2018-03-29 11:38:38.606922	2018-03-29 11:38:38.606922	8
1476	\N	178	2018-03-29 11:38:38.607901	2018-03-29 11:38:38.607901	8
1477	\N	179	2018-03-29 11:38:38.608856	2018-03-29 11:38:38.608856	8
1478	\N	180	2018-03-29 11:38:38.609803	2018-03-29 11:38:38.609803	8
1479	\N	181	2018-03-29 11:38:38.610748	2018-03-29 11:38:38.610748	8
1480	\N	182	2018-03-29 11:38:38.611726	2018-03-29 11:38:38.611726	8
1481	\N	183	2018-03-29 11:38:38.612697	2018-03-29 11:38:38.612697	8
1482	\N	184	2018-03-29 11:38:38.613673	2018-03-29 11:38:38.613673	8
1483	\N	185	2018-03-29 11:38:38.614622	2018-03-29 11:38:38.614622	8
1484	\N	186	2018-03-29 11:38:38.615529	2018-03-29 11:38:38.615529	8
1485	\N	187	2018-03-29 11:38:38.616473	2018-03-29 11:38:38.616473	8
1486	\N	188	2018-03-29 11:38:38.617394	2018-03-29 11:38:38.617394	8
1487	\N	189	2018-03-29 11:38:38.61835	2018-03-29 11:38:38.61835	8
1488	\N	190	2018-03-29 11:38:38.619288	2018-03-29 11:38:38.619288	8
1489	\N	191	2018-03-29 11:38:38.62024	2018-03-29 11:38:38.62024	8
1490	\N	192	2018-03-29 11:38:38.621171	2018-03-29 11:38:38.621171	8
1491	\N	193	2018-03-29 11:38:38.62213	2018-03-29 11:38:38.62213	8
1492	\N	194	2018-03-29 11:38:38.623119	2018-03-29 11:38:38.623119	8
1493	\N	195	2018-03-29 11:38:38.624107	2018-03-29 11:38:38.624107	8
1494	\N	196	2018-03-29 11:38:38.625092	2018-03-29 11:38:38.625092	8
1495	\N	197	2018-03-29 11:38:38.626102	2018-03-29 11:38:38.626102	8
1496	\N	198	2018-03-29 11:38:38.627076	2018-03-29 11:38:38.627076	8
1497	\N	199	2018-03-29 11:38:38.628042	2018-03-29 11:38:38.628042	8
1498	\N	200	2018-03-29 11:38:38.629019	2018-03-29 11:38:38.629019	8
1499	\N	201	2018-03-29 11:38:38.629986	2018-03-29 11:38:38.629986	8
1500	\N	202	2018-03-29 11:38:38.630953	2018-03-29 11:38:38.630953	8
1501	\N	203	2018-03-29 11:38:38.631918	2018-03-29 11:38:38.631918	8
1502	\N	204	2018-03-29 11:38:38.632876	2018-03-29 11:38:38.632876	8
1503	\N	205	2018-03-29 11:38:38.63384	2018-03-29 11:38:38.63384	8
1504	\N	206	2018-03-29 11:38:38.634798	2018-03-29 11:38:38.634798	8
1505	\N	207	2018-03-29 11:38:38.635749	2018-03-29 11:38:38.635749	8
1506	\N	208	2018-03-29 11:38:38.636725	2018-03-29 11:38:38.636725	8
1507	\N	209	2018-03-29 11:38:38.637697	2018-03-29 11:38:38.637697	8
1508	\N	210	2018-03-29 11:38:38.638645	2018-03-29 11:38:38.638645	8
1509	\N	211	2018-03-29 11:38:38.639582	2018-03-29 11:38:38.639582	8
1510	\N	212	2018-03-29 11:38:38.640491	2018-03-29 11:38:38.640491	8
1511	\N	213	2018-03-29 11:38:38.641446	2018-03-29 11:38:38.641446	8
1512	\N	214	2018-03-29 11:38:38.642391	2018-03-29 11:38:38.642391	8
1513	\N	215	2018-03-29 11:38:38.643365	2018-03-29 11:38:38.643365	8
1514	\N	216	2018-03-29 11:38:38.644341	2018-03-29 11:38:38.644341	8
1515	\N	217	2018-03-29 11:38:38.645297	2018-03-29 11:38:38.645297	8
1516	\N	218	2018-03-29 11:38:38.646273	2018-03-29 11:38:38.646273	8
1517	\N	219	2018-03-29 11:38:38.647238	2018-03-29 11:38:38.647238	8
1518	\N	220	2018-03-29 11:38:38.648236	2018-03-29 11:38:38.648236	8
1519	\N	221	2018-03-29 11:38:38.649226	2018-03-29 11:38:38.649226	8
1520	\N	222	2018-03-29 11:38:38.650218	2018-03-29 11:38:38.650218	8
1521	\N	223	2018-03-29 11:38:38.651198	2018-03-29 11:38:38.651198	8
1522	\N	224	2018-03-29 11:38:38.652208	2018-03-29 11:38:38.652208	8
1523	\N	225	2018-03-29 11:38:38.65319	2018-03-29 11:38:38.65319	8
1524	\N	226	2018-03-29 11:38:38.654169	2018-03-29 11:38:38.654169	8
1525	\N	227	2018-03-29 11:38:38.655156	2018-03-29 11:38:38.655156	8
1526	\N	228	2018-03-29 11:38:38.656127	2018-03-29 11:38:38.656127	8
1527	\N	229	2018-03-29 11:38:38.657116	2018-03-29 11:38:38.657116	8
1528	\N	230	2018-03-29 11:38:38.658096	2018-03-29 11:38:38.658096	8
1529	\N	231	2018-03-29 11:38:38.659101	2018-03-29 11:38:38.659101	8
1530	\N	232	2018-03-29 11:38:38.660176	2018-03-29 11:38:38.660176	8
1531	\N	233	2018-03-29 11:38:38.661227	2018-03-29 11:38:38.661227	8
1532	\N	234	2018-03-29 11:38:38.662263	2018-03-29 11:38:38.662263	8
1533	\N	235	2018-03-29 11:38:38.663272	2018-03-29 11:38:38.663272	8
1534	\N	236	2018-03-29 11:38:38.664264	2018-03-29 11:38:38.664264	8
1535	\N	237	2018-03-29 11:38:38.665253	2018-03-29 11:38:38.665253	8
1536	\N	238	2018-03-29 11:38:38.666208	2018-03-29 11:38:38.666208	8
1537	\N	239	2018-03-29 11:38:38.667194	2018-03-29 11:38:38.667194	8
1538	\N	240	2018-03-29 11:38:38.668182	2018-03-29 11:38:38.668182	8
1539	\N	241	2018-03-29 11:38:38.669182	2018-03-29 11:38:38.669182	8
1540	\N	242	2018-03-29 11:38:38.67017	2018-03-29 11:38:38.67017	8
1541	\N	243	2018-03-29 11:38:38.671185	2018-03-29 11:38:38.671185	8
1542	\N	244	2018-03-29 11:38:38.672208	2018-03-29 11:38:38.672208	8
1543	\N	245	2018-03-29 11:38:38.673203	2018-03-29 11:38:38.673203	8
1544	\N	246	2018-03-29 11:38:38.674181	2018-03-29 11:38:38.674181	8
1545	\N	247	2018-03-29 11:38:38.675162	2018-03-29 11:38:38.675162	8
1546	\N	248	2018-03-29 11:38:38.67615	2018-03-29 11:38:38.67615	8
1547	\N	249	2018-03-29 11:38:38.677144	2018-03-29 11:38:38.677144	8
1548	\N	250	2018-03-29 11:38:38.678133	2018-03-29 11:38:38.678133	8
1549	\N	251	2018-03-29 11:38:38.679125	2018-03-29 11:38:38.679125	8
1550	\N	252	2018-03-29 11:38:38.680123	2018-03-29 11:38:38.680123	8
1551	\N	253	2018-03-29 11:38:38.681104	2018-03-29 11:38:38.681104	8
1552	\N	254	2018-03-29 11:38:38.68209	2018-03-29 11:38:38.68209	8
1553	\N	255	2018-03-29 11:38:38.68307	2018-03-29 11:38:38.68307	8
1554	\N	256	2018-03-29 11:38:38.684037	2018-03-29 11:38:38.684037	8
1555	\N	257	2018-03-29 11:38:38.685015	2018-03-29 11:38:38.685015	8
1556	\N	258	2018-03-29 11:38:38.685979	2018-03-29 11:38:38.685979	8
1557	\N	259	2018-03-29 11:38:38.686951	2018-03-29 11:38:38.686951	8
1558	\N	260	2018-03-29 11:38:38.687927	2018-03-29 11:38:38.687927	8
1559	\N	261	2018-03-29 11:38:38.688928	2018-03-29 11:38:38.688928	8
1560	\N	262	2018-03-29 11:38:38.689905	2018-03-29 11:38:38.689905	8
1561	\N	263	2018-03-29 11:38:38.69087	2018-03-29 11:38:38.69087	8
1562	\N	264	2018-03-29 11:38:38.691867	2018-03-29 11:38:38.691867	8
1563	\N	265	2018-03-29 11:38:38.692851	2018-03-29 11:38:38.692851	8
1564	\N	266	2018-03-29 11:38:38.693827	2018-03-29 11:38:38.693827	8
1565	\N	267	2018-03-29 11:38:38.694802	2018-03-29 11:38:38.694802	8
1566	\N	268	2018-03-29 11:38:38.695773	2018-03-29 11:38:38.695773	8
1567	\N	269	2018-03-29 11:38:38.696761	2018-03-29 11:38:38.696761	8
1568	\N	270	2018-03-29 11:38:38.697735	2018-03-29 11:38:38.697735	8
1569	\N	271	2018-03-29 11:38:38.698733	2018-03-29 11:38:38.698733	8
1570	\N	272	2018-03-29 11:38:38.699722	2018-03-29 11:38:38.699722	8
1571	\N	273	2018-03-29 11:38:38.700734	2018-03-29 11:38:38.700734	8
1572	\N	274	2018-03-29 11:38:38.701694	2018-03-29 11:38:38.701694	8
1573	\N	275	2018-03-29 11:38:38.702683	2018-03-29 11:38:38.702683	8
1574	\N	276	2018-03-29 11:38:38.703648	2018-03-29 11:38:38.703648	8
1575	\N	277	2018-03-29 11:38:38.704609	2018-03-29 11:38:38.704609	8
1576	\N	278	2018-03-29 11:38:38.705552	2018-03-29 11:38:38.705552	8
1577	\N	279	2018-03-29 11:38:38.70651	2018-03-29 11:38:38.70651	8
1578	\N	280	2018-03-29 11:38:38.707475	2018-03-29 11:38:38.707475	8
1579	\N	281	2018-03-29 11:38:38.708435	2018-03-29 11:38:38.708435	8
1580	\N	282	2018-03-29 11:38:38.709386	2018-03-29 11:38:38.709386	8
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
727	\N	2	2018-03-28 14:29:46.788694	2018-03-28 14:29:46.788694	1
728	\N	3	2018-03-28 14:29:46.791872	2018-03-28 14:29:46.791872	1
729	\N	4	2018-03-28 14:29:46.794197	2018-03-28 14:29:46.794197	1
730	\N	5	2018-03-28 14:29:46.796772	2018-03-28 14:29:46.796772	1
731	\N	6	2018-03-28 14:29:46.799349	2018-03-28 14:29:46.799349	1
732	\N	7	2018-03-28 14:29:46.801691	2018-03-28 14:29:46.801691	1
733	\N	8	2018-03-28 14:29:46.804247	2018-03-28 14:29:46.804247	1
734	\N	9	2018-03-28 14:29:46.806513	2018-03-28 14:29:46.806513	1
735	\N	10	2018-03-28 14:29:46.808707	2018-03-28 14:29:46.808707	1
736	\N	11	2018-03-28 14:29:46.811042	2018-03-28 14:29:46.811042	1
737	\N	12	2018-03-28 14:29:46.813118	2018-03-28 14:29:46.813118	1
738	\N	13	2018-03-28 14:29:46.815391	2018-03-28 14:29:46.815391	1
739	\N	14	2018-03-28 14:29:46.817886	2018-03-28 14:29:46.817886	1
740	\N	15	2018-03-28 14:29:46.820225	2018-03-28 14:29:46.820225	1
741	\N	16	2018-03-28 14:29:46.822719	2018-03-28 14:29:46.822719	1
742	\N	17	2018-03-28 14:29:46.82499	2018-03-28 14:29:46.82499	1
743	\N	18	2018-03-28 14:29:46.827433	2018-03-28 14:29:46.827433	1
744	\N	19	2018-03-28 14:29:46.829709	2018-03-28 14:29:46.829709	1
745	\N	20	2018-03-28 14:29:46.832218	2018-03-28 14:29:46.832218	1
746	\N	21	2018-03-28 14:29:46.834739	2018-03-28 14:29:46.834739	1
747	\N	22	2018-03-28 14:29:46.837222	2018-03-28 14:29:46.837222	1
748	\N	23	2018-03-28 14:29:46.839757	2018-03-28 14:29:46.839757	1
749	\N	24	2018-03-28 14:29:46.842265	2018-03-28 14:29:46.842265	1
750	\N	25	2018-03-28 14:29:46.844557	2018-03-28 14:29:46.844557	1
751	\N	26	2018-03-28 14:29:46.847027	2018-03-28 14:29:46.847027	1
752	\N	27	2018-03-28 14:29:46.849279	2018-03-28 14:29:46.849279	1
753	\N	28	2018-03-28 14:29:46.851805	2018-03-28 14:29:46.851805	1
754	\N	29	2018-03-28 14:29:46.854108	2018-03-28 14:29:46.854108	1
755	\N	30	2018-03-28 14:29:46.856698	2018-03-28 14:29:46.856698	1
756	\N	31	2018-03-28 14:29:46.859009	2018-03-28 14:29:46.859009	1
757	\N	32	2018-03-28 14:29:46.861583	2018-03-28 14:29:46.861583	1
758	\N	33	2018-03-28 14:29:46.863822	2018-03-28 14:29:46.863822	1
759	\N	34	2018-03-28 14:29:46.866243	2018-03-28 14:29:46.866243	1
760	\N	35	2018-03-28 14:29:46.868381	2018-03-28 14:29:46.868381	1
761	\N	36	2018-03-28 14:29:46.870616	2018-03-28 14:29:46.870616	1
762	\N	37	2018-03-28 14:29:46.873173	2018-03-28 14:29:46.873173	1
763	\N	38	2018-03-28 14:29:46.87571	2018-03-28 14:29:46.87571	1
764	\N	39	2018-03-28 14:29:46.877941	2018-03-28 14:29:46.877941	1
765	\N	40	2018-03-28 14:29:46.880492	2018-03-28 14:29:46.880492	1
766	\N	41	2018-03-28 14:29:46.882757	2018-03-28 14:29:46.882757	1
767	\N	42	2018-03-28 14:29:46.885258	2018-03-28 14:29:46.885258	1
768	\N	43	2018-03-28 14:29:46.887725	2018-03-28 14:29:46.887725	1
769	\N	44	2018-03-28 14:29:46.890035	2018-03-28 14:29:46.890035	1
770	\N	45	2018-03-28 14:29:46.892146	2018-03-28 14:29:46.892146	1
771	\N	46	2018-03-28 14:29:46.894446	2018-03-28 14:29:46.894446	1
772	\N	47	2018-03-28 14:29:46.896547	2018-03-28 14:29:46.896547	1
773	\N	48	2018-03-28 14:29:46.89882	2018-03-28 14:29:46.89882	1
774	\N	49	2018-03-28 14:29:46.901137	2018-03-28 14:29:46.901137	1
775	\N	50	2018-03-28 14:29:46.903315	2018-03-28 14:29:46.903315	1
776	\N	51	2018-03-28 14:29:46.905607	2018-03-28 14:29:46.905607	1
777	\N	52	2018-03-28 14:29:46.907764	2018-03-28 14:29:46.907764	1
778	\N	53	2018-03-28 14:29:46.910086	2018-03-28 14:29:46.910086	1
779	\N	54	2018-03-28 14:29:46.912378	2018-03-28 14:29:46.912378	1
780	\N	55	2018-03-28 14:29:46.914615	2018-03-28 14:29:46.914615	1
781	\N	56	2018-03-28 14:29:46.917116	2018-03-28 14:29:46.917116	1
782	\N	57	2018-03-28 14:29:46.919619	2018-03-28 14:29:46.919619	1
783	\N	58	2018-03-28 14:29:46.92188	2018-03-28 14:29:46.92188	1
784	\N	59	2018-03-28 14:29:46.924369	2018-03-28 14:29:46.924369	1
785	\N	60	2018-03-28 14:29:46.926644	2018-03-28 14:29:46.926644	1
786	\N	61	2018-03-28 14:29:46.929052	2018-03-28 14:29:46.929052	1
787	\N	62	2018-03-28 14:29:46.931281	2018-03-28 14:29:46.931281	1
788	\N	63	2018-03-28 14:29:46.933846	2018-03-28 14:29:46.933846	1
789	\N	64	2018-03-28 14:29:46.936315	2018-03-28 14:29:46.936315	1
790	\N	65	2018-03-28 14:29:46.938825	2018-03-28 14:29:46.938825	1
791	\N	66	2018-03-28 14:29:46.941353	2018-03-28 14:29:46.941353	1
792	\N	67	2018-03-28 14:29:46.943568	2018-03-28 14:29:46.943568	1
793	\N	68	2018-03-28 14:29:46.969543	2018-03-28 14:29:46.969543	1
794	\N	69	2018-03-28 14:29:46.972168	2018-03-28 14:29:46.972168	1
795	\N	70	2018-03-28 14:29:46.974189	2018-03-28 14:29:46.974189	1
796	\N	71	2018-03-28 14:29:46.976219	2018-03-28 14:29:46.976219	1
797	\N	72	2018-03-28 14:29:46.978262	2018-03-28 14:29:46.978262	1
798	\N	73	2018-03-28 14:29:46.980305	2018-03-28 14:29:46.980305	1
799	\N	74	2018-03-28 14:29:46.982313	2018-03-28 14:29:46.982313	1
800	\N	75	2018-03-28 14:29:46.984349	2018-03-28 14:29:46.984349	1
801	\N	76	2018-03-28 14:29:46.986386	2018-03-28 14:29:46.986386	1
802	\N	77	2018-03-28 14:29:46.988352	2018-03-28 14:29:46.988352	1
803	\N	78	2018-03-28 14:29:46.990323	2018-03-28 14:29:46.990323	1
804	\N	79	2018-03-28 14:29:46.992298	2018-03-28 14:29:46.992298	1
805	\N	80	2018-03-28 14:29:46.99432	2018-03-28 14:29:46.99432	1
806	\N	81	2018-03-28 14:29:46.996349	2018-03-28 14:29:46.996349	1
807	\N	82	2018-03-28 14:29:46.998344	2018-03-28 14:29:46.998344	1
808	\N	83	2018-03-28 14:29:47.000345	2018-03-28 14:29:47.000345	1
809	\N	84	2018-03-28 14:29:47.002344	2018-03-28 14:29:47.002344	1
810	\N	85	2018-03-28 14:29:47.004334	2018-03-28 14:29:47.004334	1
811	\N	86	2018-03-28 14:29:47.006375	2018-03-28 14:29:47.006375	1
812	\N	87	2018-03-28 14:29:47.008367	2018-03-28 14:29:47.008367	1
813	\N	88	2018-03-28 14:29:47.010349	2018-03-28 14:29:47.010349	1
814	\N	89	2018-03-28 14:29:47.01233	2018-03-28 14:29:47.01233	1
815	\N	90	2018-03-28 14:29:47.014367	2018-03-28 14:29:47.014367	1
816	\N	91	2018-03-28 14:29:47.016349	2018-03-28 14:29:47.016349	1
817	\N	92	2018-03-28 14:29:47.018347	2018-03-28 14:29:47.018347	1
818	\N	93	2018-03-28 14:29:47.020312	2018-03-28 14:29:47.020312	1
819	\N	94	2018-03-28 14:29:47.022355	2018-03-28 14:29:47.022355	1
820	\N	95	2018-03-28 14:29:47.024367	2018-03-28 14:29:47.024367	1
821	\N	96	2018-03-28 14:29:47.026357	2018-03-28 14:29:47.026357	1
822	\N	97	2018-03-28 14:29:47.028344	2018-03-28 14:29:47.028344	1
823	\N	98	2018-03-28 14:29:47.030362	2018-03-28 14:29:47.030362	1
824	\N	99	2018-03-28 14:29:47.032343	2018-03-28 14:29:47.032343	1
825	\N	100	2018-03-28 14:29:47.03435	2018-03-28 14:29:47.03435	1
826	\N	101	2018-03-28 14:29:47.036372	2018-03-28 14:29:47.036372	1
827	\N	102	2018-03-28 14:29:47.038372	2018-03-28 14:29:47.038372	1
828	\N	103	2018-03-28 14:29:47.040375	2018-03-28 14:29:47.040375	1
829	\N	104	2018-03-28 14:29:47.042384	2018-03-28 14:29:47.042384	1
830	\N	105	2018-03-28 14:29:47.044413	2018-03-28 14:29:47.044413	1
831	\N	106	2018-03-28 14:29:47.046437	2018-03-28 14:29:47.046437	1
832	\N	107	2018-03-28 14:29:47.048441	2018-03-28 14:29:47.048441	1
833	\N	108	2018-03-28 14:29:47.050406	2018-03-28 14:29:47.050406	1
834	\N	109	2018-03-28 14:29:47.052382	2018-03-28 14:29:47.052382	1
835	\N	110	2018-03-28 14:29:47.054357	2018-03-28 14:29:47.054357	1
836	\N	111	2018-03-28 14:29:47.056332	2018-03-28 14:29:47.056332	1
837	\N	112	2018-03-28 14:29:47.058333	2018-03-28 14:29:47.058333	1
838	\N	113	2018-03-28 14:29:47.060298	2018-03-28 14:29:47.060298	1
839	\N	114	2018-03-28 14:29:47.062327	2018-03-28 14:29:47.062327	1
840	\N	115	2018-03-28 14:29:47.064337	2018-03-28 14:29:47.064337	1
841	\N	116	2018-03-28 14:29:47.066325	2018-03-28 14:29:47.066325	1
842	\N	117	2018-03-28 14:29:47.0683	2018-03-28 14:29:47.0683	1
843	\N	118	2018-03-28 14:29:47.070278	2018-03-28 14:29:47.070278	1
844	\N	119	2018-03-28 14:29:47.072255	2018-03-28 14:29:47.072255	1
845	\N	120	2018-03-28 14:29:47.074224	2018-03-28 14:29:47.074224	1
846	\N	121	2018-03-28 14:29:47.076231	2018-03-28 14:29:47.076231	1
847	\N	122	2018-03-28 14:29:47.078267	2018-03-28 14:29:47.078267	1
848	\N	123	2018-03-28 14:29:47.080263	2018-03-28 14:29:47.080263	1
849	\N	124	2018-03-28 14:29:47.082246	2018-03-28 14:29:47.082246	1
850	\N	125	2018-03-28 14:29:47.084232	2018-03-28 14:29:47.084232	1
851	\N	126	2018-03-28 14:29:47.086219	2018-03-28 14:29:47.086219	1
852	\N	127	2018-03-28 14:29:47.088194	2018-03-28 14:29:47.088194	1
853	\N	128	2018-03-28 14:29:47.090183	2018-03-28 14:29:47.090183	1
854	\N	129	2018-03-28 14:29:47.092256	2018-03-28 14:29:47.092256	1
855	\N	130	2018-03-28 14:29:47.09429	2018-03-28 14:29:47.09429	1
856	\N	131	2018-03-28 14:29:47.096339	2018-03-28 14:29:47.096339	1
857	\N	132	2018-03-28 14:29:47.09839	2018-03-28 14:29:47.09839	1
858	\N	133	2018-03-28 14:29:47.10039	2018-03-28 14:29:47.10039	1
859	\N	134	2018-03-28 14:29:47.102416	2018-03-28 14:29:47.102416	1
860	\N	135	2018-03-28 14:29:47.104445	2018-03-28 14:29:47.104445	1
861	\N	136	2018-03-28 14:29:47.106487	2018-03-28 14:29:47.106487	1
862	\N	137	2018-03-28 14:29:47.108476	2018-03-28 14:29:47.108476	1
863	\N	138	2018-03-28 14:29:47.110456	2018-03-28 14:29:47.110456	1
864	\N	139	2018-03-28 14:29:47.112424	2018-03-28 14:29:47.112424	1
865	\N	140	2018-03-28 14:29:47.11439	2018-03-28 14:29:47.11439	1
866	\N	141	2018-03-28 14:29:47.116393	2018-03-28 14:29:47.116393	1
867	\N	142	2018-03-28 14:29:47.118387	2018-03-28 14:29:47.118387	1
868	\N	143	2018-03-28 14:29:47.120368	2018-03-28 14:29:47.120368	1
869	\N	144	2018-03-28 14:29:47.122348	2018-03-28 14:29:47.122348	1
870	\N	145	2018-03-28 14:29:47.124347	2018-03-28 14:29:47.124347	1
871	\N	146	2018-03-28 14:29:47.126392	2018-03-28 14:29:47.126392	1
872	\N	147	2018-03-28 14:29:47.128365	2018-03-28 14:29:47.128365	1
873	\N	148	2018-03-28 14:29:47.130405	2018-03-28 14:29:47.130405	1
874	\N	149	2018-03-28 14:29:47.1324	2018-03-28 14:29:47.1324	1
875	\N	150	2018-03-28 14:29:47.134379	2018-03-28 14:29:47.134379	1
876	\N	151	2018-03-28 14:29:47.136382	2018-03-28 14:29:47.136382	1
877	\N	152	2018-03-28 14:29:47.138423	2018-03-28 14:29:47.138423	1
878	\N	153	2018-03-28 14:29:47.140391	2018-03-28 14:29:47.140391	1
879	\N	154	2018-03-28 14:29:47.142362	2018-03-28 14:29:47.142362	1
880	\N	155	2018-03-28 14:29:47.144346	2018-03-28 14:29:47.144346	1
881	\N	156	2018-03-28 14:29:47.146301	2018-03-28 14:29:47.146301	1
882	\N	157	2018-03-28 14:29:47.148291	2018-03-28 14:29:47.148291	1
883	\N	158	2018-03-28 14:29:47.150279	2018-03-28 14:29:47.150279	1
884	\N	159	2018-03-28 14:29:47.152267	2018-03-28 14:29:47.152267	1
885	\N	160	2018-03-28 14:29:47.154237	2018-03-28 14:29:47.154237	1
886	\N	161	2018-03-28 14:29:47.15621	2018-03-28 14:29:47.15621	1
887	\N	162	2018-03-28 14:29:47.15823	2018-03-28 14:29:47.15823	1
888	\N	163	2018-03-28 14:29:47.160255	2018-03-28 14:29:47.160255	1
889	\N	164	2018-03-28 14:29:47.162243	2018-03-28 14:29:47.162243	1
890	\N	165	2018-03-28 14:29:47.164239	2018-03-28 14:29:47.164239	1
891	\N	166	2018-03-28 14:29:47.166183	2018-03-28 14:29:47.166183	1
892	\N	167	2018-03-28 14:29:47.168166	2018-03-28 14:29:47.168166	1
893	\N	168	2018-03-28 14:29:47.170162	2018-03-28 14:29:47.170162	1
894	\N	169	2018-03-28 14:29:47.172144	2018-03-28 14:29:47.172144	1
895	\N	170	2018-03-28 14:29:47.174131	2018-03-28 14:29:47.174131	1
896	\N	171	2018-03-28 14:29:47.176241	2018-03-28 14:29:47.176241	1
897	\N	172	2018-03-28 14:29:47.178321	2018-03-28 14:29:47.178321	1
898	\N	173	2018-03-28 14:29:47.180348	2018-03-28 14:29:47.180348	1
899	\N	174	2018-03-28 14:29:47.182346	2018-03-28 14:29:47.182346	1
900	\N	175	2018-03-28 14:29:47.184339	2018-03-28 14:29:47.184339	1
901	\N	176	2018-03-28 14:29:47.186347	2018-03-28 14:29:47.186347	1
902	\N	177	2018-03-28 14:29:47.188376	2018-03-28 14:29:47.188376	1
903	\N	178	2018-03-28 14:29:47.190432	2018-03-28 14:29:47.190432	1
904	\N	179	2018-03-28 14:29:47.192435	2018-03-28 14:29:47.192435	1
905	\N	180	2018-03-28 14:29:47.194481	2018-03-28 14:29:47.194481	1
906	\N	181	2018-03-28 14:29:47.196496	2018-03-28 14:29:47.196496	1
907	\N	182	2018-03-28 14:29:47.1985	2018-03-28 14:29:47.1985	1
908	\N	183	2018-03-28 14:29:47.200479	2018-03-28 14:29:47.200479	1
909	\N	184	2018-03-28 14:29:47.202492	2018-03-28 14:29:47.202492	1
910	\N	185	2018-03-28 14:29:47.204481	2018-03-28 14:29:47.204481	1
911	\N	186	2018-03-28 14:29:47.206472	2018-03-28 14:29:47.206472	1
912	\N	187	2018-03-28 14:29:47.208458	2018-03-28 14:29:47.208458	1
913	\N	188	2018-03-28 14:29:47.21048	2018-03-28 14:29:47.21048	1
914	\N	189	2018-03-28 14:29:47.212459	2018-03-28 14:29:47.212459	1
915	\N	190	2018-03-28 14:29:47.214474	2018-03-28 14:29:47.214474	1
916	\N	191	2018-03-28 14:29:47.216478	2018-03-28 14:29:47.216478	1
917	\N	192	2018-03-28 14:29:47.218488	2018-03-28 14:29:47.218488	1
918	\N	193	2018-03-28 14:29:47.220466	2018-03-28 14:29:47.220466	1
919	\N	194	2018-03-28 14:29:47.22245	2018-03-28 14:29:47.22245	1
920	\N	195	2018-03-28 14:29:47.224476	2018-03-28 14:29:47.224476	1
921	\N	196	2018-03-28 14:29:47.2265	2018-03-28 14:29:47.2265	1
922	\N	197	2018-03-28 14:29:47.228517	2018-03-28 14:29:47.228517	1
923	\N	198	2018-03-28 14:29:47.230544	2018-03-28 14:29:47.230544	1
924	\N	199	2018-03-28 14:29:47.232556	2018-03-28 14:29:47.232556	1
925	\N	200	2018-03-28 14:29:47.23457	2018-03-28 14:29:47.23457	1
926	\N	201	2018-03-28 14:29:47.236556	2018-03-28 14:29:47.236556	1
927	\N	202	2018-03-28 14:29:47.238509	2018-03-28 14:29:47.238509	1
928	\N	203	2018-03-28 14:29:47.240486	2018-03-28 14:29:47.240486	1
929	\N	204	2018-03-28 14:29:47.242528	2018-03-28 14:29:47.242528	1
930	\N	205	2018-03-28 14:29:47.244509	2018-03-28 14:29:47.244509	1
931	\N	206	2018-03-28 14:29:47.246493	2018-03-28 14:29:47.246493	1
932	\N	207	2018-03-28 14:29:47.248451	2018-03-28 14:29:47.248451	1
933	\N	208	2018-03-28 14:29:47.250402	2018-03-28 14:29:47.250402	1
934	\N	209	2018-03-28 14:29:47.252391	2018-03-28 14:29:47.252391	1
935	\N	210	2018-03-28 14:29:47.254379	2018-03-28 14:29:47.254379	1
936	\N	211	2018-03-28 14:29:47.25636	2018-03-28 14:29:47.25636	1
937	\N	212	2018-03-28 14:29:47.258306	2018-03-28 14:29:47.258306	1
938	\N	213	2018-03-28 14:29:47.260297	2018-03-28 14:29:47.260297	1
939	\N	214	2018-03-28 14:29:47.262315	2018-03-28 14:29:47.262315	1
940	\N	215	2018-03-28 14:29:47.264359	2018-03-28 14:29:47.264359	1
941	\N	216	2018-03-28 14:29:47.266378	2018-03-28 14:29:47.266378	1
942	\N	217	2018-03-28 14:29:47.268345	2018-03-28 14:29:47.268345	1
943	\N	218	2018-03-28 14:29:47.270393	2018-03-28 14:29:47.270393	1
944	\N	219	2018-03-28 14:29:47.272418	2018-03-28 14:29:47.272418	1
945	\N	220	2018-03-28 14:29:47.274418	2018-03-28 14:29:47.274418	1
946	\N	221	2018-03-28 14:29:47.276414	2018-03-28 14:29:47.276414	1
947	\N	222	2018-03-28 14:29:47.278418	2018-03-28 14:29:47.278418	1
948	\N	223	2018-03-28 14:29:47.280397	2018-03-28 14:29:47.280397	1
949	\N	224	2018-03-28 14:29:47.282355	2018-03-28 14:29:47.282355	1
950	\N	225	2018-03-28 14:29:47.284356	2018-03-28 14:29:47.284356	1
951	\N	226	2018-03-28 14:29:47.286323	2018-03-28 14:29:47.286323	1
952	\N	227	2018-03-28 14:29:47.288313	2018-03-28 14:29:47.288313	1
953	\N	228	2018-03-28 14:29:47.290315	2018-03-28 14:29:47.290315	1
954	\N	229	2018-03-28 14:29:47.292316	2018-03-28 14:29:47.292316	1
955	\N	230	2018-03-28 14:29:47.294334	2018-03-28 14:29:47.294334	1
956	\N	231	2018-03-28 14:29:47.29639	2018-03-28 14:29:47.29639	1
957	\N	232	2018-03-28 14:29:47.298432	2018-03-28 14:29:47.298432	1
958	\N	233	2018-03-28 14:29:47.300444	2018-03-28 14:29:47.300444	1
959	\N	234	2018-03-28 14:29:47.302433	2018-03-28 14:29:47.302433	1
960	\N	235	2018-03-28 14:29:47.304461	2018-03-28 14:29:47.304461	1
961	\N	236	2018-03-28 14:29:47.306512	2018-03-28 14:29:47.306512	1
962	\N	237	2018-03-28 14:29:47.308499	2018-03-28 14:29:47.308499	1
963	\N	238	2018-03-28 14:29:47.310534	2018-03-28 14:29:47.310534	1
964	\N	239	2018-03-28 14:29:47.312542	2018-03-28 14:29:47.312542	1
965	\N	240	2018-03-28 14:29:47.314581	2018-03-28 14:29:47.314581	1
966	\N	241	2018-03-28 14:29:47.316559	2018-03-28 14:29:47.316559	1
967	\N	242	2018-03-28 14:29:47.318566	2018-03-28 14:29:47.318566	1
968	\N	243	2018-03-28 14:29:47.320548	2018-03-28 14:29:47.320548	1
969	\N	244	2018-03-28 14:29:47.322523	2018-03-28 14:29:47.322523	1
970	\N	245	2018-03-28 14:29:47.324532	2018-03-28 14:29:47.324532	1
971	\N	246	2018-03-28 14:29:47.326551	2018-03-28 14:29:47.326551	1
972	\N	247	2018-03-28 14:29:47.3286	2018-03-28 14:29:47.3286	1
973	\N	248	2018-03-28 14:29:47.330619	2018-03-28 14:29:47.330619	1
974	\N	249	2018-03-28 14:29:47.332623	2018-03-28 14:29:47.332623	1
975	\N	250	2018-03-28 14:29:47.334592	2018-03-28 14:29:47.334592	1
976	\N	251	2018-03-28 14:29:47.336592	2018-03-28 14:29:47.336592	1
977	\N	252	2018-03-28 14:29:47.338595	2018-03-28 14:29:47.338595	1
978	\N	253	2018-03-28 14:29:47.340594	2018-03-28 14:29:47.340594	1
979	\N	254	2018-03-28 14:29:47.342591	2018-03-28 14:29:47.342591	1
980	\N	255	2018-03-28 14:29:47.344597	2018-03-28 14:29:47.344597	1
981	\N	256	2018-03-28 14:29:47.346592	2018-03-28 14:29:47.346592	1
982	\N	257	2018-03-28 14:29:47.348595	2018-03-28 14:29:47.348595	1
983	\N	258	2018-03-28 14:29:47.350599	2018-03-28 14:29:47.350599	1
984	\N	259	2018-03-28 14:29:47.352597	2018-03-28 14:29:47.352597	1
985	\N	260	2018-03-28 14:29:47.354596	2018-03-28 14:29:47.354596	1
986	\N	261	2018-03-28 14:29:47.356573	2018-03-28 14:29:47.356573	1
987	\N	262	2018-03-28 14:29:47.358532	2018-03-28 14:29:47.358532	1
988	\N	263	2018-03-28 14:29:47.360534	2018-03-28 14:29:47.360534	1
989	\N	264	2018-03-28 14:29:47.362524	2018-03-28 14:29:47.362524	1
990	\N	265	2018-03-28 14:29:47.364521	2018-03-28 14:29:47.364521	1
991	\N	266	2018-03-28 14:29:47.366506	2018-03-28 14:29:47.366506	1
992	\N	267	2018-03-28 14:29:47.368501	2018-03-28 14:29:47.368501	1
993	\N	268	2018-03-28 14:29:47.370505	2018-03-28 14:29:47.370505	1
994	\N	269	2018-03-28 14:29:47.372526	2018-03-28 14:29:47.372526	1
995	\N	270	2018-03-28 14:29:47.374536	2018-03-28 14:29:47.374536	1
996	\N	271	2018-03-28 14:29:47.37657	2018-03-28 14:29:47.37657	1
997	\N	272	2018-03-28 14:29:47.37858	2018-03-28 14:29:47.37858	1
998	\N	273	2018-03-28 14:29:47.38061	2018-03-28 14:29:47.38061	1
999	\N	274	2018-03-28 14:29:47.382607	2018-03-28 14:29:47.382607	1
1000	\N	275	2018-03-28 14:29:47.384607	2018-03-28 14:29:47.384607	1
1001	\N	276	2018-03-28 14:29:47.386746	2018-03-28 14:29:47.386746	1
1002	\N	277	2018-03-28 14:29:47.388815	2018-03-28 14:29:47.388815	1
1003	\N	278	2018-03-28 14:29:47.390931	2018-03-28 14:29:47.390931	1
1004	\N	279	2018-03-28 14:29:47.393067	2018-03-28 14:29:47.393067	1
1005	\N	280	2018-03-28 14:29:47.395176	2018-03-28 14:29:47.395176	1
1006	\N	281	2018-03-28 14:29:47.397255	2018-03-28 14:29:47.397255	1
1007	\N	282	2018-03-28 14:29:47.399357	2018-03-28 14:29:47.399357	1
1008	\N	283	2018-03-28 14:29:47.401413	2018-03-28 14:29:47.401413	1
1009	\N	284	2018-03-28 14:29:47.403446	2018-03-28 14:29:47.403446	1
1010	\N	285	2018-03-28 14:29:47.405531	2018-03-28 14:29:47.405531	1
1011	\N	286	2018-03-28 14:29:47.407567	2018-03-28 14:29:47.407567	1
1012	\N	287	2018-03-28 14:29:47.409604	2018-03-28 14:29:47.409604	1
1013	\N	288	2018-03-28 14:29:47.411645	2018-03-28 14:29:47.411645	1
1014	\N	289	2018-03-28 14:29:47.413746	2018-03-28 14:29:47.413746	1
1015	\N	290	2018-03-28 14:29:47.415859	2018-03-28 14:29:47.415859	1
1016	\N	291	2018-03-28 14:29:47.417945	2018-03-28 14:29:47.417945	1
1017	\N	292	2018-03-28 14:29:47.420037	2018-03-28 14:29:47.420037	1
1018	\N	293	2018-03-28 14:29:47.422121	2018-03-28 14:29:47.422121	1
1019	\N	294	2018-03-28 14:29:47.424156	2018-03-28 14:29:47.424156	1
1020	\N	295	2018-03-28 14:29:47.426227	2018-03-28 14:29:47.426227	1
1021	\N	296	2018-03-28 14:29:47.428249	2018-03-28 14:29:47.428249	1
1022	\N	297	2018-03-28 14:29:47.430278	2018-03-28 14:29:47.430278	1
1023	\N	298	2018-03-28 14:29:47.432322	2018-03-28 14:29:47.432322	1
1024	\N	299	2018-03-28 14:29:47.434344	2018-03-28 14:29:47.434344	1
1025	\N	300	2018-03-28 14:29:47.436409	2018-03-28 14:29:47.436409	1
1026	\N	301	2018-03-28 14:29:47.438441	2018-03-28 14:29:47.438441	1
1027	\N	302	2018-03-28 14:29:47.440475	2018-03-28 14:29:47.440475	1
1028	\N	303	2018-03-28 14:29:47.442608	2018-03-28 14:29:47.442608	1
1029	\N	304	2018-03-28 14:29:47.44471	2018-03-28 14:29:47.44471	1
1030	\N	305	2018-03-28 14:29:47.446795	2018-03-28 14:29:47.446795	1
1031	\N	306	2018-03-28 14:29:47.448901	2018-03-28 14:29:47.448901	1
1032	\N	307	2018-03-28 14:29:47.450987	2018-03-28 14:29:47.450987	1
1033	\N	308	2018-03-28 14:29:47.45305	2018-03-28 14:29:47.45305	1
1034	\N	309	2018-03-28 14:29:47.455128	2018-03-28 14:29:47.455128	1
1035	\N	310	2018-03-28 14:29:47.457196	2018-03-28 14:29:47.457196	1
1036	\N	311	2018-03-28 14:29:47.459336	2018-03-28 14:29:47.459336	1
1037	\N	312	2018-03-28 14:29:47.461607	2018-03-28 14:29:47.461607	1
1038	\N	313	2018-03-28 14:29:47.463735	2018-03-28 14:29:47.463735	1
1039	\N	314	2018-03-28 14:29:47.465917	2018-03-28 14:29:47.465917	1
1040	\N	315	2018-03-28 14:29:47.468042	2018-03-28 14:29:47.468042	1
1041	\N	316	2018-03-28 14:29:47.470247	2018-03-28 14:29:47.470247	1
1042	\N	317	2018-03-28 14:29:47.472323	2018-03-28 14:29:47.472323	1
1043	\N	318	2018-03-28 14:29:47.474399	2018-03-28 14:29:47.474399	1
1044	\N	319	2018-03-28 14:29:47.476436	2018-03-28 14:29:47.476436	1
1045	\N	320	2018-03-28 14:29:47.478512	2018-03-28 14:29:47.478512	1
1046	\N	321	2018-03-28 14:29:47.480573	2018-03-28 14:29:47.480573	1
1047	\N	322	2018-03-28 14:29:47.482622	2018-03-28 14:29:47.482622	1
1048	\N	323	2018-03-28 14:29:47.484687	2018-03-28 14:29:47.484687	1
1049	\N	324	2018-03-28 14:29:47.486782	2018-03-28 14:29:47.486782	1
1050	\N	325	2018-03-28 14:29:47.488883	2018-03-28 14:29:47.488883	1
1051	\N	326	2018-03-28 14:29:47.490974	2018-03-28 14:29:47.490974	1
1052	\N	327	2018-03-28 14:29:47.493068	2018-03-28 14:29:47.493068	1
1053	\N	328	2018-03-28 14:29:47.495129	2018-03-28 14:29:47.495129	1
1054	\N	329	2018-03-28 14:29:47.497183	2018-03-28 14:29:47.497183	1
1055	\N	330	2018-03-28 14:29:47.499314	2018-03-28 14:29:47.499314	1
1056	\N	331	2018-03-28 14:29:47.501417	2018-03-28 14:29:47.501417	1
1057	\N	332	2018-03-28 14:29:47.503452	2018-03-28 14:29:47.503452	1
1058	\N	333	2018-03-28 14:29:47.505489	2018-03-28 14:29:47.505489	1
1059	\N	334	2018-03-28 14:29:47.50752	2018-03-28 14:29:47.50752	1
1060	\N	335	2018-03-28 14:29:47.509563	2018-03-28 14:29:47.509563	1
1061	\N	336	2018-03-28 14:29:47.511608	2018-03-28 14:29:47.511608	1
1062	\N	337	2018-03-28 14:29:47.513644	2018-03-28 14:29:47.513644	1
1063	\N	338	2018-03-28 14:29:47.51575	2018-03-28 14:29:47.51575	1
1064	\N	339	2018-03-28 14:29:47.517797	2018-03-28 14:29:47.517797	1
1065	\N	340	2018-03-28 14:29:47.519945	2018-03-28 14:29:47.519945	1
1066	\N	341	2018-03-28 14:29:47.522036	2018-03-28 14:29:47.522036	1
1067	\N	342	2018-03-28 14:29:47.524159	2018-03-28 14:29:47.524159	1
1068	\N	343	2018-03-28 14:29:47.526298	2018-03-28 14:29:47.526298	1
1069	\N	344	2018-03-28 14:29:47.528414	2018-03-28 14:29:47.528414	1
1070	\N	345	2018-03-28 14:29:47.530443	2018-03-28 14:29:47.530443	1
1071	\N	346	2018-03-28 14:29:47.532474	2018-03-28 14:29:47.532474	1
1072	\N	347	2018-03-28 14:29:47.534559	2018-03-28 14:29:47.534559	1
1073	\N	348	2018-03-28 14:29:47.536596	2018-03-28 14:29:47.536596	1
1074	\N	349	2018-03-28 14:29:47.538656	2018-03-28 14:29:47.538656	1
1075	\N	350	2018-03-28 14:29:47.540791	2018-03-28 14:29:47.540791	1
1076	\N	351	2018-03-28 14:29:47.542867	2018-03-28 14:29:47.542867	1
1077	\N	352	2018-03-28 14:29:47.544968	2018-03-28 14:29:47.544968	1
1078	\N	353	2018-03-28 14:29:47.547031	2018-03-28 14:29:47.547031	1
1079	\N	354	2018-03-28 14:29:47.549123	2018-03-28 14:29:47.549123	1
1080	\N	355	2018-03-28 14:29:47.551227	2018-03-28 14:29:47.551227	1
1081	\N	356	2018-03-28 14:29:47.553383	2018-03-28 14:29:47.553383	1
1082	\N	357	2018-03-28 14:29:47.555501	2018-03-28 14:29:47.555501	1
1083	\N	358	2018-03-28 14:29:47.557588	2018-03-28 14:29:47.557588	1
1084	\N	359	2018-03-28 14:29:47.559621	2018-03-28 14:29:47.559621	1
1085	\N	360	2018-03-28 14:29:47.561676	2018-03-28 14:29:47.561676	1
1086	\N	361	2018-03-28 14:29:47.563732	2018-03-28 14:29:47.563732	1
1087	\N	362	2018-03-28 14:29:47.565799	2018-03-28 14:29:47.565799	1
1088	\N	363	2018-03-28 14:29:47.567874	2018-03-28 14:29:47.567874	1
1089	\N	364	2018-03-28 14:29:47.569996	2018-03-28 14:29:47.569996	1
1090	\N	365	2018-03-28 14:29:47.572109	2018-03-28 14:29:47.572109	1
1091	\N	366	2018-03-28 14:29:47.574147	2018-03-28 14:29:47.574147	1
1092	\N	367	2018-03-28 14:29:47.576196	2018-03-28 14:29:47.576196	1
1093	\N	368	2018-03-28 14:29:47.578327	2018-03-28 14:29:47.578327	1
1094	\N	369	2018-03-28 14:29:47.580443	2018-03-28 14:29:47.580443	1
1095	\N	370	2018-03-28 14:29:47.582536	2018-03-28 14:29:47.582536	1
1096	\N	371	2018-03-28 14:29:47.584605	2018-03-28 14:29:47.584605	1
1097	\N	372	2018-03-28 14:29:47.586723	2018-03-28 14:29:47.586723	1
1098	\N	373	2018-03-28 14:29:47.588829	2018-03-28 14:29:47.588829	1
1099	\N	374	2018-03-28 14:29:47.590946	2018-03-28 14:29:47.590946	1
1100	\N	375	2018-03-28 14:29:47.593059	2018-03-28 14:29:47.593059	1
1101	\N	376	2018-03-28 14:29:47.595207	2018-03-28 14:29:47.595207	1
1102	\N	377	2018-03-28 14:29:47.597379	2018-03-28 14:29:47.597379	1
1103	\N	378	2018-03-28 14:29:47.599478	2018-03-28 14:29:47.599478	1
1104	\N	379	2018-03-28 14:29:47.601551	2018-03-28 14:29:47.601551	1
1105	\N	380	2018-03-28 14:29:47.603621	2018-03-28 14:29:47.603621	1
1106	\N	381	2018-03-28 14:29:47.605718	2018-03-28 14:29:47.605718	1
1107	\N	382	2018-03-28 14:29:47.60781	2018-03-28 14:29:47.60781	1
1108	\N	383	2018-03-28 14:29:47.609926	2018-03-28 14:29:47.609926	1
1109	\N	384	2018-03-28 14:29:47.612094	2018-03-28 14:29:47.612094	1
1110	\N	385	2018-03-28 14:29:47.614299	2018-03-28 14:29:47.614299	1
1111	\N	386	2018-03-28 14:29:47.616503	2018-03-28 14:29:47.616503	1
1112	\N	387	2018-03-28 14:29:47.618656	2018-03-28 14:29:47.618656	1
1113	\N	388	2018-03-28 14:29:47.620842	2018-03-28 14:29:47.620842	1
1114	\N	389	2018-03-28 14:29:47.623053	2018-03-28 14:29:47.623053	1
1115	\N	390	2018-03-28 14:29:47.625296	2018-03-28 14:29:47.625296	1
1116	\N	391	2018-03-28 14:29:47.627504	2018-03-28 14:29:47.627504	1
1117	\N	392	2018-03-28 14:29:47.629672	2018-03-28 14:29:47.629672	1
1118	\N	393	2018-03-28 14:29:47.631849	2018-03-28 14:29:47.631849	1
1119	\N	394	2018-03-28 14:29:47.634063	2018-03-28 14:29:47.634063	1
1120	\N	395	2018-03-28 14:29:47.636311	2018-03-28 14:29:47.636311	1
1121	\N	396	2018-03-28 14:29:47.638522	2018-03-28 14:29:47.638522	1
1122	\N	397	2018-03-28 14:29:47.640812	2018-03-28 14:29:47.640812	1
1123	\N	398	2018-03-28 14:29:47.643052	2018-03-28 14:29:47.643052	1
1124	\N	399	2018-03-28 14:29:47.645317	2018-03-28 14:29:47.645317	1
1125	\N	400	2018-03-28 14:29:47.647557	2018-03-28 14:29:47.647557	1
1126	\N	401	2018-03-28 14:29:47.649779	2018-03-28 14:29:47.649779	1
1127	\N	402	2018-03-28 14:29:47.651996	2018-03-28 14:29:47.651996	1
1128	\N	403	2018-03-28 14:29:47.654239	2018-03-28 14:29:47.654239	1
1129	\N	404	2018-03-28 14:29:47.656377	2018-03-28 14:29:47.656377	1
1130	\N	405	2018-03-28 14:29:47.658541	2018-03-28 14:29:47.658541	1
1131	\N	406	2018-03-28 14:29:47.660719	2018-03-28 14:29:47.660719	1
1132	\N	407	2018-03-28 14:29:47.662868	2018-03-28 14:29:47.662868	1
1133	\N	408	2018-03-28 14:29:47.665045	2018-03-28 14:29:47.665045	1
1134	\N	421	2018-03-28 14:29:47.667336	2018-03-28 14:29:47.667336	1
1135	\N	422	2018-03-28 14:29:47.669499	2018-03-28 14:29:47.669499	1
1136	\N	423	2018-03-28 14:29:47.671675	2018-03-28 14:29:47.671675	1
1137	\N	424	2018-03-28 14:29:47.673836	2018-03-28 14:29:47.673836	1
1138	\N	425	2018-03-28 14:29:47.676038	2018-03-28 14:29:47.676038	1
1139	\N	426	2018-03-28 14:29:47.67831	2018-03-28 14:29:47.67831	1
1140	\N	427	2018-03-28 14:29:47.680591	2018-03-28 14:29:47.680591	1
1141	\N	428	2018-03-28 14:29:47.693679	2018-03-28 14:29:47.693679	1
1142	\N	429	2018-03-28 14:29:47.695799	2018-03-28 14:29:47.695799	1
1143	\N	430	2018-03-28 14:29:47.697858	2018-03-28 14:29:47.697858	1
1144	\N	431	2018-03-28 14:29:47.699915	2018-03-28 14:29:47.699915	1
1145	\N	432	2018-03-28 14:29:47.701991	2018-03-28 14:29:47.701991	1
1146	\N	433	2018-03-28 14:29:47.704031	2018-03-28 14:29:47.704031	1
1147	\N	434	2018-03-28 14:29:47.706111	2018-03-28 14:29:47.706111	1
1148	\N	435	2018-03-28 14:29:47.708125	2018-03-28 14:29:47.708125	1
1149	\N	436	2018-03-28 14:29:47.71018	2018-03-28 14:29:47.71018	1
1150	\N	437	2018-03-28 14:29:47.712236	2018-03-28 14:29:47.712236	1
1151	\N	438	2018-03-28 14:29:47.71429	2018-03-28 14:29:47.71429	1
1152	\N	439	2018-03-28 14:29:47.716351	2018-03-28 14:29:47.716351	1
1153	\N	440	2018-03-28 14:29:47.718353	2018-03-28 14:29:47.718353	1
1154	\N	441	2018-03-28 14:29:47.720342	2018-03-28 14:29:47.720342	1
1155	\N	442	2018-03-28 14:29:47.722368	2018-03-28 14:29:47.722368	1
1156	\N	443	2018-03-28 14:29:47.738001	2018-03-28 14:29:47.738001	1
1157	\N	444	2018-03-28 14:29:47.740117	2018-03-28 14:29:47.740117	1
1158	\N	445	2018-03-28 14:29:47.742219	2018-03-28 14:29:47.742219	1
1159	\N	446	2018-03-28 14:29:47.744343	2018-03-28 14:29:47.744343	1
1160	\N	447	2018-03-28 14:29:47.746447	2018-03-28 14:29:47.746447	1
1161	\N	448	2018-03-28 14:29:47.748472	2018-03-28 14:29:47.748472	1
1162	\N	449	2018-03-28 14:29:47.750509	2018-03-28 14:29:47.750509	1
1163	\N	450	2018-03-28 14:29:47.752533	2018-03-28 14:29:47.752533	1
1164	\N	451	2018-03-28 14:29:47.754576	2018-03-28 14:29:47.754576	1
1165	\N	452	2018-03-28 14:29:47.756593	2018-03-28 14:29:47.756593	1
1166	\N	453	2018-03-28 14:29:47.758608	2018-03-28 14:29:47.758608	1
1167	\N	454	2018-03-28 14:29:47.760603	2018-03-28 14:29:47.760603	1
1168	\N	455	2018-03-28 14:29:47.762641	2018-03-28 14:29:47.762641	1
1169	\N	456	2018-03-28 14:29:47.764628	2018-03-28 14:29:47.764628	1
1170	\N	458	2018-03-28 14:29:47.766624	2018-03-28 14:29:47.766624	1
1171	\N	459	2018-03-28 14:29:47.768609	2018-03-28 14:29:47.768609	1
1172	\N	460	2018-03-28 14:29:47.770604	2018-03-28 14:29:47.770604	1
1173	\N	461	2018-03-28 14:29:47.77262	2018-03-28 14:29:47.77262	1
1174	\N	462	2018-03-28 14:29:47.774633	2018-03-28 14:29:47.774633	1
1175	\N	463	2018-03-28 14:29:47.776629	2018-03-28 14:29:47.776629	1
1176	\N	464	2018-03-28 14:29:47.778632	2018-03-28 14:29:47.778632	1
1177	\N	465	2018-03-28 14:29:47.780622	2018-03-28 14:29:47.780622	1
1178	\N	466	2018-03-28 14:29:47.782708	2018-03-28 14:29:47.782708	1
1179	\N	467	2018-03-28 14:29:47.784772	2018-03-28 14:29:47.784772	1
1180	\N	468	2018-03-28 14:29:47.786817	2018-03-28 14:29:47.786817	1
1181	\N	469	2018-03-28 14:29:47.788858	2018-03-28 14:29:47.788858	1
1182	\N	470	2018-03-28 14:29:47.790922	2018-03-28 14:29:47.790922	1
1183	\N	471	2018-03-28 14:29:47.793009	2018-03-28 14:29:47.793009	1
1184	\N	472	2018-03-28 14:29:47.795055	2018-03-28 14:29:47.795055	1
1185	\N	473	2018-03-28 14:29:47.797134	2018-03-28 14:29:47.797134	1
1186	\N	474	2018-03-28 14:29:47.799171	2018-03-28 14:29:47.799171	1
1187	\N	475	2018-03-28 14:29:47.801229	2018-03-28 14:29:47.801229	1
1188	\N	476	2018-03-28 14:29:47.803252	2018-03-28 14:29:47.803252	1
1189	\N	477	2018-03-28 14:29:47.80528	2018-03-28 14:29:47.80528	1
1190	\N	478	2018-03-28 14:29:47.80733	2018-03-28 14:29:47.80733	1
1191	\N	479	2018-03-28 14:29:47.809396	2018-03-28 14:29:47.809396	1
1192	\N	480	2018-03-28 14:29:47.811411	2018-03-28 14:29:47.811411	1
1193	\N	481	2018-03-28 14:29:47.813438	2018-03-28 14:29:47.813438	1
1194	\N	482	2018-03-28 14:29:47.815442	2018-03-28 14:29:47.815442	1
1195	\N	483	2018-03-28 14:29:47.817444	2018-03-28 14:29:47.817444	1
1196	\N	484	2018-03-28 14:29:47.81944	2018-03-28 14:29:47.81944	1
1197	\N	485	2018-03-28 14:29:47.821429	2018-03-28 14:29:47.821429	1
1198	\N	486	2018-03-28 14:29:47.82344	2018-03-28 14:29:47.82344	1
1199	\N	487	2018-03-28 14:29:47.825448	2018-03-28 14:29:47.825448	1
1200	\N	488	2018-03-28 14:29:47.827463	2018-03-28 14:29:47.827463	1
1201	\N	489	2018-03-28 14:29:47.829508	2018-03-28 14:29:47.829508	1
1202	\N	490	2018-03-28 14:29:47.831502	2018-03-28 14:29:47.831502	1
1203	\N	491	2018-03-28 14:29:47.833501	2018-03-28 14:29:47.833501	1
1204	\N	492	2018-03-28 14:29:47.835516	2018-03-28 14:29:47.835516	1
1205	\N	493	2018-03-28 14:29:47.837521	2018-03-28 14:29:47.837521	1
1206	\N	494	2018-03-28 14:29:47.839528	2018-03-28 14:29:47.839528	1
1207	\N	495	2018-03-28 14:29:47.841534	2018-03-28 14:29:47.841534	1
1208	\N	496	2018-03-28 14:29:47.843523	2018-03-28 14:29:47.843523	1
1209	\N	497	2018-03-28 14:29:47.84554	2018-03-28 14:29:47.84554	1
1210	\N	498	2018-03-28 14:29:47.847538	2018-03-28 14:29:47.847538	1
1211	\N	499	2018-03-28 14:29:47.84954	2018-03-28 14:29:47.84954	1
1212	\N	500	2018-03-28 14:29:47.851529	2018-03-28 14:29:47.851529	1
1213	\N	501	2018-03-28 14:29:47.853528	2018-03-28 14:29:47.853528	1
1214	\N	502	2018-03-28 14:29:47.855523	2018-03-28 14:29:47.855523	1
1215	\N	503	2018-03-28 14:29:47.857521	2018-03-28 14:29:47.857521	1
1216	\N	504	2018-03-28 14:29:47.859536	2018-03-28 14:29:47.859536	1
1217	\N	505	2018-03-28 14:29:47.861536	2018-03-28 14:29:47.861536	1
1218	\N	506	2018-03-28 14:29:47.863544	2018-03-28 14:29:47.863544	1
1219	\N	507	2018-03-28 14:29:47.865536	2018-03-28 14:29:47.865536	1
1220	\N	508	2018-03-28 14:29:47.867523	2018-03-28 14:29:47.867523	1
1221	\N	509	2018-03-28 14:29:47.869511	2018-03-28 14:29:47.869511	1
1222	\N	510	2018-03-28 14:29:47.871516	2018-03-28 14:29:47.871516	1
1223	\N	511	2018-03-28 14:29:47.873525	2018-03-28 14:29:47.873525	1
1224	\N	512	2018-03-28 14:29:47.87553	2018-03-28 14:29:47.87553	1
1225	\N	513	2018-03-28 14:29:47.877532	2018-03-28 14:29:47.877532	1
1226	\N	514	2018-03-28 14:29:47.879535	2018-03-28 14:29:47.879535	1
1227	\N	515	2018-03-28 14:29:47.881522	2018-03-28 14:29:47.881522	1
1228	\N	516	2018-03-28 14:29:47.883517	2018-03-28 14:29:47.883517	1
1229	\N	517	2018-03-28 14:29:47.88551	2018-03-28 14:29:47.88551	1
1230	\N	518	2018-03-28 14:29:47.887506	2018-03-28 14:29:47.887506	1
1231	\N	519	2018-03-28 14:29:47.889526	2018-03-28 14:29:47.889526	1
1232	\N	520	2018-03-28 14:29:47.891527	2018-03-28 14:29:47.891527	1
1233	\N	521	2018-03-28 14:29:47.89353	2018-03-28 14:29:47.89353	1
1234	\N	522	2018-03-28 14:29:47.895532	2018-03-28 14:29:47.895532	1
1235	\N	523	2018-03-28 14:29:47.897527	2018-03-28 14:29:47.897527	1
1236	\N	524	2018-03-28 14:29:47.899519	2018-03-28 14:29:47.899519	1
1237	\N	525	2018-03-28 14:29:47.901509	2018-03-28 14:29:47.901509	1
1238	\N	526	2018-03-28 14:29:47.903492	2018-03-28 14:29:47.903492	1
1239	\N	527	2018-03-28 14:29:47.905514	2018-03-28 14:29:47.905514	1
1240	\N	528	2018-03-28 14:29:47.907515	2018-03-28 14:29:47.907515	1
1241	\N	529	2018-03-28 14:29:47.909519	2018-03-28 14:29:47.909519	1
1242	\N	530	2018-03-28 14:29:47.911498	2018-03-28 14:29:47.911498	1
1243	\N	531	2018-03-28 14:29:47.91348	2018-03-28 14:29:47.91348	1
1244	\N	532	2018-03-28 14:29:47.915496	2018-03-28 14:29:47.915496	1
1245	\N	533	2018-03-28 14:29:47.917515	2018-03-28 14:29:47.917515	1
1246	\N	534	2018-03-28 14:29:47.919529	2018-03-28 14:29:47.919529	1
1247	\N	535	2018-03-28 14:29:47.921528	2018-03-28 14:29:47.921528	1
1248	\N	536	2018-03-28 14:29:47.923531	2018-03-28 14:29:47.923531	1
1249	\N	537	2018-03-28 14:29:47.925516	2018-03-28 14:29:47.925516	1
1581	\N	283	2018-03-29 11:38:38.710369	2018-03-29 11:38:38.710369	8
1582	\N	284	2018-03-29 11:38:38.711375	2018-03-29 11:38:38.711375	8
1583	\N	285	2018-03-29 11:38:38.712392	2018-03-29 11:38:38.712392	8
1584	\N	286	2018-03-29 11:38:38.713418	2018-03-29 11:38:38.713418	8
1585	\N	287	2018-03-29 11:38:38.714416	2018-03-29 11:38:38.714416	8
1586	\N	288	2018-03-29 11:38:38.715429	2018-03-29 11:38:38.715429	8
1587	\N	289	2018-03-29 11:38:38.716428	2018-03-29 11:38:38.716428	8
1588	\N	290	2018-03-29 11:38:38.717441	2018-03-29 11:38:38.717441	8
1589	\N	291	2018-03-29 11:38:38.718453	2018-03-29 11:38:38.718453	8
1590	\N	292	2018-03-29 11:38:38.719496	2018-03-29 11:38:38.719496	8
1591	\N	293	2018-03-29 11:38:38.720523	2018-03-29 11:38:38.720523	8
1592	\N	294	2018-03-29 11:38:38.721572	2018-03-29 11:38:38.721572	8
1593	\N	295	2018-03-29 11:38:38.730746	2018-03-29 11:38:38.730746	8
1594	\N	296	2018-03-29 11:38:38.731768	2018-03-29 11:38:38.731768	8
1595	\N	297	2018-03-29 11:38:38.732716	2018-03-29 11:38:38.732716	8
1596	\N	298	2018-03-29 11:38:38.733685	2018-03-29 11:38:38.733685	8
1597	\N	299	2018-03-29 11:38:38.7346	2018-03-29 11:38:38.7346	8
1598	\N	300	2018-03-29 11:38:38.735551	2018-03-29 11:38:38.735551	8
1599	\N	301	2018-03-29 11:38:38.736497	2018-03-29 11:38:38.736497	8
1600	\N	302	2018-03-29 11:38:38.737441	2018-03-29 11:38:38.737441	8
1601	\N	303	2018-03-29 11:38:38.738393	2018-03-29 11:38:38.738393	8
1602	\N	304	2018-03-29 11:38:38.739335	2018-03-29 11:38:38.739335	8
1603	\N	305	2018-03-29 11:38:38.740298	2018-03-29 11:38:38.740298	8
1604	\N	306	2018-03-29 11:38:38.741253	2018-03-29 11:38:38.741253	8
1605	\N	307	2018-03-29 11:38:38.742193	2018-03-29 11:38:38.742193	8
1606	\N	308	2018-03-29 11:38:38.743146	2018-03-29 11:38:38.743146	8
1607	\N	309	2018-03-29 11:38:38.744102	2018-03-29 11:38:38.744102	8
1608	\N	310	2018-03-29 11:38:38.745065	2018-03-29 11:38:38.745065	8
1609	\N	311	2018-03-29 11:38:38.746022	2018-03-29 11:38:38.746022	8
1610	\N	312	2018-03-29 11:38:38.74696	2018-03-29 11:38:38.74696	8
1611	\N	313	2018-03-29 11:38:38.747892	2018-03-29 11:38:38.747892	8
1612	\N	314	2018-03-29 11:38:38.748831	2018-03-29 11:38:38.748831	8
1613	\N	315	2018-03-29 11:38:38.74977	2018-03-29 11:38:38.74977	8
1614	\N	316	2018-03-29 11:38:38.750726	2018-03-29 11:38:38.750726	8
1615	\N	317	2018-03-29 11:38:38.751672	2018-03-29 11:38:38.751672	8
1616	\N	318	2018-03-29 11:38:38.752596	2018-03-29 11:38:38.752596	8
1617	\N	319	2018-03-29 11:38:38.753499	2018-03-29 11:38:38.753499	8
1618	\N	320	2018-03-29 11:38:38.754463	2018-03-29 11:38:38.754463	8
1619	\N	321	2018-03-29 11:38:38.755418	2018-03-29 11:38:38.755418	8
1620	\N	322	2018-03-29 11:38:38.756386	2018-03-29 11:38:38.756386	8
1621	\N	323	2018-03-29 11:38:38.757331	2018-03-29 11:38:38.757331	8
1622	\N	324	2018-03-29 11:38:38.758281	2018-03-29 11:38:38.758281	8
1623	\N	325	2018-03-29 11:38:38.759253	2018-03-29 11:38:38.759253	8
1624	\N	326	2018-03-29 11:38:38.7602	2018-03-29 11:38:38.7602	8
1625	\N	327	2018-03-29 11:38:38.761162	2018-03-29 11:38:38.761162	8
1626	\N	328	2018-03-29 11:38:38.762103	2018-03-29 11:38:38.762103	8
1627	\N	329	2018-03-29 11:38:38.763066	2018-03-29 11:38:38.763066	8
1628	\N	330	2018-03-29 11:38:38.764016	2018-03-29 11:38:38.764016	8
1629	\N	331	2018-03-29 11:38:38.764951	2018-03-29 11:38:38.764951	8
1630	\N	332	2018-03-29 11:38:38.765883	2018-03-29 11:38:38.765883	8
1631	\N	333	2018-03-29 11:38:38.766824	2018-03-29 11:38:38.766824	8
1632	\N	334	2018-03-29 11:38:38.767784	2018-03-29 11:38:38.767784	8
1633	\N	335	2018-03-29 11:38:38.768721	2018-03-29 11:38:38.768721	8
1634	\N	336	2018-03-29 11:38:38.769692	2018-03-29 11:38:38.769692	8
1635	\N	337	2018-03-29 11:38:38.770616	2018-03-29 11:38:38.770616	8
1636	\N	338	2018-03-29 11:38:38.771519	2018-03-29 11:38:38.771519	8
1637	\N	339	2018-03-29 11:38:38.772435	2018-03-29 11:38:38.772435	8
1638	\N	340	2018-03-29 11:38:38.773371	2018-03-29 11:38:38.773371	8
1639	\N	341	2018-03-29 11:38:38.774289	2018-03-29 11:38:38.774289	8
1640	\N	342	2018-03-29 11:38:38.775209	2018-03-29 11:38:38.775209	8
1641	\N	343	2018-03-29 11:38:38.776137	2018-03-29 11:38:38.776137	8
1642	\N	344	2018-03-29 11:38:38.77709	2018-03-29 11:38:38.77709	8
1643	\N	345	2018-03-29 11:38:38.778047	2018-03-29 11:38:38.778047	8
1644	\N	346	2018-03-29 11:38:38.779001	2018-03-29 11:38:38.779001	8
1645	\N	347	2018-03-29 11:38:38.779937	2018-03-29 11:38:38.779937	8
1646	\N	348	2018-03-29 11:38:38.780881	2018-03-29 11:38:38.780881	8
1647	\N	349	2018-03-29 11:38:38.781848	2018-03-29 11:38:38.781848	8
1648	\N	350	2018-03-29 11:38:38.782768	2018-03-29 11:38:38.782768	8
1649	\N	351	2018-03-29 11:38:38.783726	2018-03-29 11:38:38.783726	8
1650	\N	352	2018-03-29 11:38:38.784678	2018-03-29 11:38:38.784678	8
1651	\N	353	2018-03-29 11:38:38.785603	2018-03-29 11:38:38.785603	8
1652	\N	354	2018-03-29 11:38:38.786497	2018-03-29 11:38:38.786497	8
1653	\N	355	2018-03-29 11:38:38.787422	2018-03-29 11:38:38.787422	8
1654	\N	356	2018-03-29 11:38:38.788355	2018-03-29 11:38:38.788355	8
1655	\N	357	2018-03-29 11:38:38.789274	2018-03-29 11:38:38.789274	8
1656	\N	358	2018-03-29 11:38:38.790176	2018-03-29 11:38:38.790176	8
1657	\N	359	2018-03-29 11:38:38.791096	2018-03-29 11:38:38.791096	8
1658	\N	360	2018-03-29 11:38:38.792054	2018-03-29 11:38:38.792054	8
1659	\N	361	2018-03-29 11:38:38.793	2018-03-29 11:38:38.793	8
1660	\N	362	2018-03-29 11:38:38.793961	2018-03-29 11:38:38.793961	8
1661	\N	363	2018-03-29 11:38:38.794891	2018-03-29 11:38:38.794891	8
1662	\N	364	2018-03-29 11:38:38.795822	2018-03-29 11:38:38.795822	8
1663	\N	365	2018-03-29 11:38:38.796772	2018-03-29 11:38:38.796772	8
1664	\N	366	2018-03-29 11:38:38.797731	2018-03-29 11:38:38.797731	8
1665	\N	367	2018-03-29 11:38:38.798674	2018-03-29 11:38:38.798674	8
1666	\N	368	2018-03-29 11:38:38.799615	2018-03-29 11:38:38.799615	8
1744	\N	459	2018-03-29 11:38:38.872385	2018-03-29 11:38:38.872385	8
1745	\N	460	2018-03-29 11:38:38.873373	2018-03-29 11:38:38.873373	8
1746	\N	461	2018-03-29 11:38:38.87428	2018-03-29 11:38:38.87428	8
1747	\N	462	2018-03-29 11:38:38.875239	2018-03-29 11:38:38.875239	8
1748	\N	463	2018-03-29 11:38:38.876173	2018-03-29 11:38:38.876173	8
1749	\N	464	2018-03-29 11:38:38.877098	2018-03-29 11:38:38.877098	8
1750	\N	465	2018-03-29 11:38:38.87806	2018-03-29 11:38:38.87806	8
1751	\N	466	2018-03-29 11:38:38.879027	2018-03-29 11:38:38.879027	8
1752	\N	467	2018-03-29 11:38:38.879932	2018-03-29 11:38:38.879932	8
1753	\N	468	2018-03-29 11:38:38.88087	2018-03-29 11:38:38.88087	8
1754	\N	469	2018-03-29 11:38:38.881819	2018-03-29 11:38:38.881819	8
1755	\N	470	2018-03-29 11:38:38.882759	2018-03-29 11:38:38.882759	8
1756	\N	471	2018-03-29 11:38:38.883711	2018-03-29 11:38:38.883711	8
1757	\N	472	2018-03-29 11:38:38.884641	2018-03-29 11:38:38.884641	8
1758	\N	473	2018-03-29 11:38:38.885539	2018-03-29 11:38:38.885539	8
1759	\N	474	2018-03-29 11:38:38.88648	2018-03-29 11:38:38.88648	8
1760	\N	475	2018-03-29 11:38:38.887457	2018-03-29 11:38:38.887457	8
1761	\N	476	2018-03-29 11:38:38.88841	2018-03-29 11:38:38.88841	8
1762	\N	477	2018-03-29 11:38:38.88937	2018-03-29 11:38:38.88937	8
1763	\N	478	2018-03-29 11:38:38.890336	2018-03-29 11:38:38.890336	8
1764	\N	479	2018-03-29 11:38:38.891274	2018-03-29 11:38:38.891274	8
1765	\N	480	2018-03-29 11:38:38.892234	2018-03-29 11:38:38.892234	8
1766	\N	481	2018-03-29 11:38:38.893186	2018-03-29 11:38:38.893186	8
1767	\N	482	2018-03-29 11:38:38.894143	2018-03-29 11:38:38.894143	8
1768	\N	483	2018-03-29 11:38:38.895089	2018-03-29 11:38:38.895089	8
1769	\N	484	2018-03-29 11:38:38.896045	2018-03-29 11:38:38.896045	8
1770	\N	485	2018-03-29 11:38:38.896977	2018-03-29 11:38:38.896977	8
1771	\N	486	2018-03-29 11:38:38.897923	2018-03-29 11:38:38.897923	8
1772	\N	487	2018-03-29 11:38:38.898855	2018-03-29 11:38:38.898855	8
1773	\N	488	2018-03-29 11:38:38.899802	2018-03-29 11:38:38.899802	8
1774	\N	489	2018-03-29 11:38:38.900734	2018-03-29 11:38:38.900734	8
1775	\N	490	2018-03-29 11:38:38.901674	2018-03-29 11:38:38.901674	8
1776	\N	491	2018-03-29 11:38:38.902622	2018-03-29 11:38:38.902622	8
1777	\N	492	2018-03-29 11:38:38.903509	2018-03-29 11:38:38.903509	8
1778	\N	493	2018-03-29 11:38:38.90443	2018-03-29 11:38:38.90443	8
1779	\N	494	2018-03-29 11:38:38.905357	2018-03-29 11:38:38.905357	8
1780	\N	495	2018-03-29 11:38:38.906284	2018-03-29 11:38:38.906284	8
1781	\N	496	2018-03-29 11:38:38.907201	2018-03-29 11:38:38.907201	8
1782	\N	497	2018-03-29 11:38:38.908113	2018-03-29 11:38:38.908113	8
1783	\N	498	2018-03-29 11:38:38.909078	2018-03-29 11:38:38.909078	8
1784	\N	499	2018-03-29 11:38:38.910034	2018-03-29 11:38:38.910034	8
1785	\N	500	2018-03-29 11:38:38.910971	2018-03-29 11:38:38.910971	8
1786	\N	501	2018-03-29 11:38:38.911898	2018-03-29 11:38:38.911898	8
1787	\N	502	2018-03-29 11:38:38.912859	2018-03-29 11:38:38.912859	8
1788	\N	503	2018-03-29 11:38:38.913798	2018-03-29 11:38:38.913798	8
1789	\N	504	2018-03-29 11:38:38.914761	2018-03-29 11:38:38.914761	8
1790	\N	505	2018-03-29 11:38:38.915736	2018-03-29 11:38:38.915736	8
1791	\N	506	2018-03-29 11:38:38.916711	2018-03-29 11:38:38.916711	8
1792	\N	507	2018-03-29 11:38:38.917647	2018-03-29 11:38:38.917647	8
1793	\N	508	2018-03-29 11:38:38.918572	2018-03-29 11:38:38.918572	8
1794	\N	509	2018-03-29 11:38:38.919483	2018-03-29 11:38:38.919483	8
1795	\N	510	2018-03-29 11:38:38.920431	2018-03-29 11:38:38.920431	8
1796	\N	511	2018-03-29 11:38:38.921398	2018-03-29 11:38:38.921398	8
1797	\N	512	2018-03-29 11:38:38.922336	2018-03-29 11:38:38.922336	8
1798	\N	513	2018-03-29 11:38:38.923275	2018-03-29 11:38:38.923275	8
1799	\N	514	2018-03-29 11:38:38.924225	2018-03-29 11:38:38.924225	8
1800	\N	515	2018-03-29 11:38:38.925173	2018-03-29 11:38:38.925173	8
1801	\N	516	2018-03-29 11:38:38.926129	2018-03-29 11:38:38.926129	8
1802	\N	517	2018-03-29 11:38:38.9271	2018-03-29 11:38:38.9271	8
1803	\N	518	2018-03-29 11:38:38.928065	2018-03-29 11:38:38.928065	8
1804	\N	519	2018-03-29 11:38:38.92904	2018-03-29 11:38:38.92904	8
1805	\N	520	2018-03-29 11:38:38.929999	2018-03-29 11:38:38.929999	8
1806	\N	521	2018-03-29 11:38:38.93095	2018-03-29 11:38:38.93095	8
1807	\N	522	2018-03-29 11:38:38.931913	2018-03-29 11:38:38.931913	8
1808	\N	523	2018-03-29 11:38:38.932863	2018-03-29 11:38:38.932863	8
1809	\N	524	2018-03-29 11:38:38.933817	2018-03-29 11:38:38.933817	8
1810	\N	525	2018-03-29 11:38:38.934796	2018-03-29 11:38:38.934796	8
1811	\N	526	2018-03-29 11:38:38.935746	2018-03-29 11:38:38.935746	8
1812	\N	527	2018-03-29 11:38:38.936717	2018-03-29 11:38:38.936717	8
1813	\N	528	2018-03-29 11:38:38.937685	2018-03-29 11:38:38.937685	8
1814	\N	529	2018-03-29 11:38:38.93862	2018-03-29 11:38:38.93862	8
1815	\N	530	2018-03-29 11:38:38.939563	2018-03-29 11:38:38.939563	8
1816	\N	531	2018-03-29 11:38:38.94048	2018-03-29 11:38:38.94048	8
1817	\N	532	2018-03-29 11:38:38.941414	2018-03-29 11:38:38.941414	8
1818	\N	533	2018-03-29 11:38:38.942351	2018-03-29 11:38:38.942351	8
1819	\N	534	2018-03-29 11:38:38.943278	2018-03-29 11:38:38.943278	8
1820	\N	535	2018-03-29 11:38:38.944201	2018-03-29 11:38:38.944201	8
1821	\N	536	2018-03-29 11:38:38.945159	2018-03-29 11:38:38.945159	8
1822	\N	537	2018-03-29 11:38:38.94612	2018-03-29 11:38:38.94612	8
1823	\N	12	2018-04-10 15:59:46.312134	2018-04-10 15:59:46.312134	4
1824	\N	13	2018-04-10 15:59:46.315503	2018-04-10 15:59:46.315503	4
1825	\N	14	2018-04-10 15:59:46.318179	2018-04-10 15:59:46.318179	4
1826	\N	15	2018-04-10 15:59:46.320823	2018-04-10 15:59:46.320823	4
1827	\N	16	2018-04-10 15:59:46.32351	2018-04-10 15:59:46.32351	4
1828	\N	18	2018-04-10 15:59:46.326104	2018-04-10 15:59:46.326104	4
1829	\N	19	2018-04-10 15:59:46.328653	2018-04-10 15:59:46.328653	4
1830	\N	20	2018-04-10 15:59:46.331173	2018-04-10 15:59:46.331173	4
1831	\N	21	2018-04-10 15:59:46.333695	2018-04-10 15:59:46.333695	4
1832	\N	22	2018-04-10 15:59:46.336156	2018-04-10 15:59:46.336156	4
1833	\N	23	2018-04-10 15:59:46.338635	2018-04-10 15:59:46.338635	4
1834	\N	24	2018-04-10 15:59:46.341069	2018-04-10 15:59:46.341069	4
1835	\N	25	2018-04-10 15:59:46.343547	2018-04-10 15:59:46.343547	4
1836	\N	26	2018-04-10 15:59:46.345937	2018-04-10 15:59:46.345937	4
1837	\N	72	2018-04-10 15:59:46.34836	2018-04-10 15:59:46.34836	4
1838	\N	73	2018-04-10 15:59:46.350724	2018-04-10 15:59:46.350724	4
1839	\N	74	2018-04-10 15:59:46.353104	2018-04-10 15:59:46.353104	4
1840	\N	75	2018-04-10 15:59:46.355494	2018-04-10 15:59:46.355494	4
1841	\N	76	2018-04-10 15:59:46.357853	2018-04-10 15:59:46.357853	4
1842	\N	171	2018-04-10 15:59:46.36021	2018-04-10 15:59:46.36021	4
1843	\N	173	2018-04-10 15:59:46.36251	2018-04-10 15:59:46.36251	4
1844	\N	175	2018-04-10 15:59:46.364742	2018-04-10 15:59:46.364742	4
1845	\N	291	2018-04-10 15:59:46.367032	2018-04-10 15:59:46.367032	4
1846	\N	292	2018-04-10 15:59:46.369341	2018-04-10 15:59:46.369341	4
1847	\N	293	2018-04-10 15:59:46.371601	2018-04-10 15:59:46.371601	4
1848	\N	294	2018-04-10 15:59:46.373908	2018-04-10 15:59:46.373908	4
1849	\N	295	2018-04-10 15:59:46.376164	2018-04-10 15:59:46.376164	4
1850	\N	297	2018-04-10 15:59:46.378393	2018-04-10 15:59:46.378393	4
1851	\N	298	2018-04-10 15:59:46.38059	2018-04-10 15:59:46.38059	4
1852	\N	299	2018-04-10 15:59:46.382791	2018-04-10 15:59:46.382791	4
1853	\N	300	2018-04-10 15:59:46.385028	2018-04-10 15:59:46.385028	4
1854	\N	301	2018-04-10 15:59:46.387267	2018-04-10 15:59:46.387267	4
1855	\N	302	2018-04-10 15:59:46.389523	2018-04-10 15:59:46.389523	4
1856	\N	303	2018-04-10 15:59:46.391711	2018-04-10 15:59:46.391711	4
1857	\N	304	2018-04-10 15:59:46.393879	2018-04-10 15:59:46.393879	4
1858	\N	305	2018-04-10 15:59:46.396057	2018-04-10 15:59:46.396057	4
1859	\N	306	2018-04-10 15:59:46.398283	2018-04-10 15:59:46.398283	4
1860	\N	307	2018-04-10 15:59:46.400492	2018-04-10 15:59:46.400492	4
1861	\N	309	2018-04-10 15:59:46.402641	2018-04-10 15:59:46.402641	4
1862	\N	311	2018-04-10 15:59:46.404773	2018-04-10 15:59:46.404773	4
1863	\N	312	2018-04-10 15:59:46.406935	2018-04-10 15:59:46.406935	4
1864	\N	313	2018-04-10 15:59:46.40911	2018-04-10 15:59:46.40911	4
1865	\N	327	2018-04-10 15:59:46.411283	2018-04-10 15:59:46.411283	4
1866	\N	328	2018-04-10 15:59:46.413423	2018-04-10 15:59:46.413423	4
1867	\N	329	2018-04-10 15:59:46.415531	2018-04-10 15:59:46.415531	4
1868	\N	330	2018-04-10 15:59:46.417623	2018-04-10 15:59:46.417623	4
1869	\N	334	2018-04-10 15:59:46.419722	2018-04-10 15:59:46.419722	4
1870	\N	335	2018-04-10 15:59:46.421798	2018-04-10 15:59:46.421798	4
1871	\N	336	2018-04-10 15:59:46.423984	2018-04-10 15:59:46.423984	4
1872	\N	397	2018-04-10 15:59:46.42618	2018-04-10 15:59:46.42618	4
1873	\N	398	2018-04-10 15:59:46.428334	2018-04-10 15:59:46.428334	4
1874	\N	399	2018-04-10 15:59:46.430487	2018-04-10 15:59:46.430487	4
1875	\N	400	2018-04-10 15:59:46.432645	2018-04-10 15:59:46.432645	4
1876	\N	401	2018-04-10 15:59:46.434827	2018-04-10 15:59:46.434827	4
1877	\N	407	2018-04-10 15:59:46.436998	2018-04-10 15:59:46.436998	4
1878	\N	421	2018-04-10 15:59:46.439201	2018-04-10 15:59:46.439201	4
1879	\N	435	2018-04-10 15:59:46.44134	2018-04-10 15:59:46.44134	4
1880	\N	436	2018-04-10 15:59:46.443463	2018-04-10 15:59:46.443463	4
1881	\N	437	2018-04-10 15:59:46.445666	2018-04-10 15:59:46.445666	4
1882	\N	438	2018-04-10 15:59:46.447805	2018-04-10 15:59:46.447805	4
1883	\N	447	2018-04-10 15:59:46.44998	2018-04-10 15:59:46.44998	4
1884	\N	448	2018-04-10 15:59:46.452292	2018-04-10 15:59:46.452292	4
1885	\N	488	2018-04-10 15:59:46.454513	2018-04-10 15:59:46.454513	4
1886	\N	490	2018-04-10 15:59:46.456654	2018-04-10 15:59:46.456654	4
1887	\N	491	2018-04-10 15:59:46.458787	2018-04-10 15:59:46.458787	4
1888	\N	492	2018-04-10 15:59:46.460951	2018-04-10 15:59:46.460951	4
1889	\N	493	2018-04-10 15:59:46.463077	2018-04-10 15:59:46.463077	4
1890	\N	494	2018-04-10 15:59:46.465238	2018-04-10 15:59:46.465238	4
1891	\N	499	2018-04-10 15:59:46.467333	2018-04-10 15:59:46.467333	4
1892	\N	500	2018-04-10 15:59:46.469448	2018-04-10 15:59:46.469448	4
1893	\N	501	2018-04-10 15:59:46.471533	2018-04-10 15:59:46.471533	4
1894	\N	502	2018-04-10 15:59:46.473645	2018-04-10 15:59:46.473645	4
1895	\N	503	2018-04-10 15:59:46.475722	2018-04-10 15:59:46.475722	4
1896	\N	506	2018-04-10 15:59:46.477814	2018-04-10 15:59:46.477814	4
1897	\N	528	2018-04-10 15:59:46.479947	2018-04-10 15:59:46.479947	4
1898	\N	529	2018-04-10 15:59:46.482117	2018-04-10 15:59:46.482117	4
1899	\N	530	2018-04-10 15:59:46.48424	2018-04-10 15:59:46.48424	4
1900	\N	531	2018-04-10 15:59:46.486341	2018-04-10 15:59:46.486341	4
1901	\N	532	2018-04-10 15:59:46.488502	2018-04-10 15:59:46.488502	4
\.


--
-- Name: permissions_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('permissions_roles_id_seq', 1901, true);


--
-- Data for Name: person_contact_infos; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY person_contact_infos (id, person_id, contact_number, email, postal_address, location_address, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, suburb_id) FROM stdin;
101	102	0244567123                                        					32	\N	t	f	2018-03-11 21:19:09.302572	2018-03-11 21:19:09.302572	1
102	103	023344555                                         					32	\N	t	f	2018-03-11 21:33:03.473015	2018-03-11 21:33:03.473015	1
103	104	024476113371                                      					32	\N	t	f	2018-03-11 22:13:32.420994	2018-03-11 22:13:32.420994	\N
107	108	0245668979	sexton@gmail.com				36	\N	t	f	2018-03-27 15:12:03.345616	2018-03-27 15:12:03.345616	1
108	109	0243556789	mawuli@gmail.com				36	\N	t	f	2018-03-27 15:18:44.034797	2018-03-27 15:18:44.034797	2
109	110	0243556789	mawuli@gmail.com				36	\N	t	f	2018-03-27 15:19:11.361413	2018-03-27 15:19:11.361413	2
110	111	0243119000	clarence@gmail.com				36	\N	t	f	2018-03-27 15:21:35.060377	2018-03-27 15:21:35.060377	1
111	112	0234895049	xorse@gmail.com				36	\N	t	f	2018-03-27 15:37:29.479281	2018-03-27 15:37:29.479281	1
113	114	0243556689					36	\N	t	f	2018-03-27 16:26:00.802276	2018-03-27 16:26:00.802276	\N
115	116	0235332234					36	\N	t	f	2018-03-27 16:58:57.816562	2018-03-27 16:58:57.816562	\N
116	117	0248021199					116	\N	t	f	2018-03-27 17:12:12.084007	2018-03-27 17:12:12.084007	1
123	124	098380300					36	\N	t	f	2018-03-28 10:30:00.787513	2018-03-28 10:30:00.787513	1
125	126	0243556787	freda@gmail.com				36	\N	t	f	2018-03-29 11:42:56.995016	2018-03-29 11:42:56.995016	2
126	127	0248021199	akosua@gmail.com				83	\N	t	f	2018-03-29 11:43:24.01232	2018-03-29 11:43:24.01232	1
127	128	025433211	cla@gmail.com				36	\N	t	f	2018-03-29 11:45:48.580548	2018-03-29 11:45:48.580548	1
133	134	0267218638                                        	Setor@ymail.com				36	\N	t	f	2018-04-09 10:57:00.225169	2018-04-09 10:57:00.225169	2
33	34	0243554433	dav@gmail.com				\N	\N	t	f	2017-12-15 11:15:46.024237	2018-01-05 14:14:33.317414	2
31	32	0243112909	kobby@gmail.com				32	\N	t	f	2017-12-14 19:58:18.022553	2018-03-09 12:27:27.717476	2
90	91	02447611337                                       					32	\N	t	f	2018-03-05 12:03:55.196455	2018-03-12 09:26:04.277092	2
34	35	0276113371                                        	nana@gmail.com				\N	\N	t	f	2017-12-15 15:36:29.002902	2018-01-05 14:14:20.113513	2
38	38	09876543	phil@gmail.com				\N	\N	t	f	2018-01-05 15:07:45.524892	2018-01-05 15:07:45.524892	2
39	39	0248152204                                        		\N	\N	\N	\N	\N	t	f	2018-01-09 16:11:03.781859	2018-01-09 16:11:03.781859	2
40	41	0244567812                                        		\N	\N	\N	\N	\N	t	f	2018-01-10 14:42:25.908808	2018-01-10 14:42:25.908808	2
37	37	0245667790	jerry@gmail.com		Lapaz		\N	\N	t	f	2018-01-05 14:18:50.075978	2018-01-16 10:05:06.513583	2
41	42	0244786611                                        		\N	\N	\N	\N	\N	t	f	2018-01-19 09:46:18.76299	2018-01-19 09:46:18.76299	2
42	43	0244786611                                        		\N	\N	\N	\N	\N	t	f	2018-01-19 10:11:05.247369	2018-01-19 10:11:05.247369	2
43	44	0248152205                                        		\N	\N	\N	\N	\N	t	f	2018-01-19 12:50:31.374838	2018-01-19 12:50:31.374838	2
45	46	0276113372                                        		\N	\N	\N	\N	\N	t	f	2018-01-22 11:49:44.56928	2018-01-22 11:49:44.56928	2
44	45	0244567234                                        					\N	\N	t	f	2018-01-22 09:59:20.509773	2018-01-22 11:51:51.172176	2
46	47	000044444                                         		\N	\N	\N	\N	\N	t	f	2018-01-23 06:31:52.117547	2018-01-23 06:31:52.117547	2
47	48	444445555                                         					\N	\N	t	f	2018-01-23 06:32:00.530496	2018-01-23 08:52:03.583548	2
48	49	0205869653                                        		\N	\N	\N	\N	\N	t	f	2018-01-23 09:54:45.941642	2018-01-23 09:54:45.941642	2
49	50	0504899386                                        		\N	\N	\N	\N	\N	t	f	2018-01-23 11:27:10.169543	2018-01-23 11:27:10.169543	2
51	52	44454445                                          		\N	\N	\N	\N	\N	t	f	2018-01-23 19:42:45.268897	2018-01-23 19:42:45.268897	2
52	53	44445555                                          		\N	\N	\N	\N	\N	t	f	2018-01-23 19:43:10.833504	2018-01-23 19:43:10.833504	2
53	54	45444455                                          		\N	\N	\N	\N	\N	t	f	2018-01-23 19:48:07.117042	2018-01-23 19:48:07.117042	2
50	51	74793530                                          	h@aol.com	baabu close , ksi			\N	\N	t	f	2018-01-23 19:42:24.287349	2018-01-23 21:15:04.419757	2
55	56	0244567896                                        					36	\N	t	f	2018-01-25 10:38:29.482821	2018-01-29 10:24:42.837379	2
54	55	000886654                                         					36	\N	t	f	2018-01-23 20:38:42.20895	2018-01-29 10:28:48.064241	2
56	57	0207604492                                        		\N	\N	\N	\N	\N	t	f	2018-01-29 12:13:15.008472	2018-01-29 12:13:15.008472	2
57	58	0246220138                                        		\N	\N	\N	\N	\N	t	f	2018-02-01 10:05:06.030573	2018-02-01 10:05:06.030573	2
58	59	77774344                                          		\N	\N	\N	\N	\N	t	f	2018-02-05 22:42:40.537806	2018-02-05 22:42:40.537806	2
59	60	9274488497                                        					36	\N	t	f	2018-02-08 14:51:47.004518	2018-02-08 14:51:47.004518	2
60	61	9274488497                                        					36	\N	t	f	2018-02-08 15:29:32.547568	2018-02-08 15:29:32.547568	2
61	62	095049509405045					36	\N	t	f	2018-02-08 15:44:49.582009	2018-02-08 16:08:33.490451	2
36	36	0243554455	clemsedem@gmail.com				36	\N	t	f	2018-01-05 11:52:52.852373	2018-02-08 16:10:55.339339	2
63	64	0234567890                                        					36	\N	t	f	2018-02-12 10:12:20.766132	2018-02-12 10:12:20.766132	2
64	65	0234567890                                        					36	\N	t	f	2018-02-12 10:12:21.192304	2018-02-12 10:12:21.192304	2
65	66	0234567890                                        					36	\N	t	f	2018-02-12 12:17:42.301162	2018-02-12 12:17:42.301162	2
66	67	9274488497                                        					36	\N	t	f	2018-02-12 15:25:22.282437	2018-02-12 15:25:22.282437	2
67	68	05567123132                                       					36	\N	t	f	2018-02-12 16:09:35.712532	2018-02-12 16:09:35.712532	2
68	69	8hsjsaoj                                          					36	\N	t	f	2018-02-12 16:20:31.999955	2018-02-12 16:20:31.999955	2
69	70	+23320574686377                                   					32	\N	t	f	2018-02-14 17:20:22.622771	2018-02-14 17:20:22.622771	2
70	71	0234770989                                        					36	\N	t	f	2018-02-15 15:26:02.717291	2018-02-15 15:26:02.717291	2
71	72	33332222                                          					36	\N	t	f	2018-02-28 08:57:23.13744	2018-02-28 08:57:23.13744	2
72	73	0578119303                                        					36	\N	t	f	2018-02-28 09:40:52.705011	2018-02-28 09:40:52.705011	2
73	74	0244675123                                        					36	\N	t	f	2018-02-28 09:41:41.495672	2018-02-28 09:41:41.495672	2
74	75	7iq9w9qw9wuw                                      					36	\N	t	f	2018-02-28 10:10:32.661997	2018-02-28 10:10:32.661997	2
75	76	0234770989                                        					36	\N	t	f	2018-02-28 10:24:59.911132	2018-02-28 10:24:59.911132	2
76	77	0234770989                                        					36	\N	t	f	2018-02-28 10:34:48.697251	2018-02-28 10:34:48.697251	2
77	78	0234770989                                        					36	\N	t	f	2018-02-28 10:40:02.080652	2018-02-28 10:40:02.080652	2
78	79	0234770989                                        					36	\N	t	f	2018-02-28 10:57:00.14586	2018-02-28 10:57:00.14586	2
81	82	024111111111					36	\N	t	f	2018-03-02 15:07:43.264502	2018-03-02 15:07:43.264502	2
62	63	0243556600					36	\N	t	f	2018-02-09 17:52:30.720073	2018-02-28 16:14:57.116528	2
82	83	023455442					36	\N	t	f	2018-03-02 15:22:06.739443	2018-03-02 15:22:06.739443	2
83	84	023466557					36	\N	t	f	2018-03-02 15:34:53.713912	2018-03-02 15:34:53.713912	2
79	80	008398493	clara@appsnmobilesolutions.com	1234	1234		36	\N	t	f	2018-03-02 11:36:54.358382	2018-03-02 14:59:50.422977	2
80	81	998789243	bob@gmail.com	0000	0000		36	\N	t	f	2018-03-02 15:01:13.906035	2018-03-02 15:36:56.085102	2
84	85	030245961	ron@gmail.com	4321	4321		36	\N	t	f	2018-03-02 15:42:22.428788	2018-03-05 08:30:42.457532	2
85	86	0266658975	baby@gmail.com				84	\N	t	f	2018-03-05 10:36:35.260496	2018-03-05 10:36:35.260496	2
86	87	0248152204                                        					36	\N	t	f	2018-03-05 11:05:38.46582	2018-03-05 11:05:38.46582	2
87	88	0276113371                                        					84	\N	t	f	2018-03-05 11:37:35.576914	2018-03-05 11:37:35.576914	2
88	89	0276113371                                        					84	\N	t	f	2018-03-05 11:37:45.819186	2018-03-05 11:37:45.819186	2
89	90	0276113371                                        					84	\N	t	f	2018-03-05 11:37:58.005688	2018-03-05 11:37:58.005688	2
91	92	02447611337                                       					36	\N	t	f	2018-03-05 12:08:55.444854	2018-03-05 12:08:55.444854	2
92	93	02447611337                                       					36	\N	t	f	2018-03-05 12:13:53.760272	2018-03-05 12:13:53.760272	2
93	94	0248021199                                        			madina		84	\N	t	f	2018-03-05 17:30:22.050898	2018-03-05 17:30:22.050898	2
95	96	666666                                            					32	\N	t	f	2018-03-06 16:27:29.287204	2018-03-06 16:27:29.287204	2
96	97	0276113371                                        					32	\N	t	f	2018-03-06 16:37:13.979623	2018-03-06 16:37:13.979623	2
97	98	0248153304                                        					32	\N	t	f	2018-03-06 16:59:50.55755	2018-03-06 16:59:50.55755	2
104	105	0244761321                                        					32	\N	t	f	2018-03-15 11:26:48.402332	2018-03-15 11:26:48.402332	1
105	106	0276113323                                        					32	\N	t	f	2018-03-15 12:04:46.019012	2018-03-15 12:04:46.019012	\N
94	95	44444444                                          					32	\N	t	f	2018-03-06 16:03:35.185372	2018-03-06 17:34:17.844684	2
98	99	0243559680					32	\N	t	f	2018-03-06 18:29:57.777566	2018-03-06 18:29:57.777566	2
99	100	0244761122                                        					32	\N	t	f	2018-03-06 21:22:21.365233	2018-03-06 21:22:21.365233	2
106	107	0578009833                                        	sedem@gmail.com				36	\N	t	f	2018-03-16 16:16:07.526753	2018-03-19 11:15:47.564401	2
100	101	0571238789                                        	clem@dd.com				36	\N	t	f	2018-03-07 09:15:51.921153	2018-03-26 12:33:04.624332	2
117	118	0244444444	aa@gmail.com				36	\N	t	f	2018-03-28 09:23:10.74845	2018-03-28 09:23:10.74845	1
118	119	0233333333					36	\N	t	f	2018-03-28 09:28:47.42723	2018-03-28 09:28:47.42723	\N
119	120	0256665566	andy@gmail.com				36	\N	t	f	2018-03-28 09:36:16.656419	2018-03-28 09:36:16.656419	1
120	121	0256665566	andy@gmail.com				36	\N	t	f	2018-03-28 09:40:26.909788	2018-03-28 09:40:26.909788	1
121	122	0256665566	andy@gmail.com				36	\N	t	f	2018-03-28 09:41:31.675975	2018-03-28 09:41:31.675975	1
122	123	0243333344					36	\N	t	f	2018-03-28 09:45:32.529266	2018-03-28 09:45:32.529266	\N
124	125	0246786578	chris@gmail.com				36	\N	t	f	2018-03-28 15:45:32.18067	2018-03-28 15:45:32.18067	1
128	129	0504899386	andy@gmail.com				116	\N	t	f	2018-04-05 09:43:21.2229	2018-04-05 09:43:21.2229	1
129	130	0246220138	david@gmail.com				116	\N	t	f	2018-04-05 09:45:57.761947	2018-04-05 09:45:57.761947	2
130	131	0246220138	david@gmail.com				116	\N	t	f	2018-04-05 09:46:38.925151	2018-04-05 09:46:38.925151	2
131	132	0246220138	david@gmail.com				116	\N	t	f	2018-04-05 09:47:13.91178	2018-04-05 09:47:13.91178	2
132	133	0246220138	david@gmail.com				116	\N	t	f	2018-04-05 09:47:56.034357	2018-04-05 09:47:56.034357	2
\.


--
-- Name: person_contact_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('person_contact_infos_id_seq', 133, true);


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
35	Osafo	Nana	C	\N	\N	t	f	2017-12-15 15:36:28.956634	2018-01-05 14:14:20.111227	\N	\N	25	f
34	Asamoah	David	N	\N	\N	t	f	2017-12-15 11:15:46.021883	2018-01-05 14:14:33.315406	\N	\N	\N	f
37	Bansah	Jerry	D	\N	\N	t	f	2018-01-05 14:18:50.07363	2018-01-05 14:18:50.07363	\N	1970-04-15	\N	t
38	Phil	Lips	D	\N	\N	t	f	2018-01-05 15:07:45.5147	2018-01-05 15:07:45.5147	\N	\N	\N	t
39	Clem	Sedem	C	\N	\N	t	f	2018-01-09 16:11:03.778823	2018-01-09 16:11:03.778823	\N	\N	27	\N
98	Kwame	Sedem	C	\N	32	t	f	2018-03-06 16:59:50.556265	2018-03-06 16:59:50.556265	\N	\N	8	f
43	Koff	Kofikofi	D	\N	\N	t	f	2018-01-19 10:11:05.244887	2018-01-19 10:11:05.244887	\N	\N	28	\N
44	Abe	Clem	C	\N	\N	t	f	2018-01-19 12:50:31.371715	2018-01-19 12:50:31.371715	\N	\N	37	\N
46	Alfred	Kwame	C	\N	\N	t	f	2018-01-22 11:49:44.5591	2018-01-22 11:49:44.5591	\N	\N	29	\N
99	Osafo	Nana	D	\N	32	t	f	2018-03-06 18:29:57.776136	2018-03-06 18:29:57.776136	\N	\N	\N	f
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
100	Osafo	Bosompem	D	\N	32	t	f	2018-03-06 21:22:21.36395	2018-03-06 21:22:21.36395	\N	\N	9	f
63	Ago	Ame	D	\N	36	t	f	2018-02-09 17:52:30.718442	2018-02-28 16:14:57.115065	\N	\N	\N	t
116	Quaye	Clara	N	\N	36	t	f	2018-03-27 16:58:57.815168	2018-03-27 16:58:57.815168	\N	\N	\N	f
80	Quaye	Mady	C	\N	36	t	f	2018-03-02 11:36:54.356315	2018-03-02 14:59:50.42129	\N	\N	65	f
82	Binin	Aj	D	\N	36	t	f	2018-03-02 15:07:43.263094	2018-03-02 15:07:43.263094	\N	2018-03-08	\N	t
83	Addae	Freda	N	\N	36	t	f	2018-03-02 15:22:06.738016	2018-03-02 15:22:06.738016	\N	\N	\N	f
84	Quaye	Clara	N	\N	36	t	f	2018-03-02 15:34:53.712628	2018-03-02 15:34:53.712628	\N	\N	\N	f
81	Bob	Kojo	C	\N	36	t	f	2018-03-02 15:01:13.904117	2018-03-02 15:36:56.083943	\N	2018-03-02	\N	f
117	Quaye	Clara	D	\N	116	t	f	2018-03-27 17:12:12.082682	2018-03-27 17:12:12.082682	\N	\N	\N	f
32	Appiah	Kobby	D	\N	32	t	f	2017-12-14 19:58:18.020366	2018-03-09 12:27:27.715985	\N	\N	\N	t
102	Nana	Clem	D	\N	32	t	f	2018-03-11 21:19:09.300786	2018-03-11 21:19:09.300786	\N	\N	11	t
103	New	Doc	D	\N	32	t	f	2018-03-11 21:33:03.471718	2018-03-11 21:33:03.471718	\N	\N	12	f
85	Doe	Ron	C	\N	36	t	f	2018-03-02 15:42:22.427459	2018-03-05 10:34:13.974602	\N	2018-02-06	\N	f
86	Asamoah	Baby	P	\N	84	t	f	2018-03-05 10:36:35.25894	2018-03-05 10:36:35.25894	\N	2016-08-25	\N	f
87	Agozi	Clemence	C	\N	36	t	f	2018-03-05 11:05:38.464416	2018-03-05 11:05:38.464416	\N	\N	1	f
88	Osafo	Nana	C	\N	84	t	f	2018-03-05 11:37:35.575607	2018-03-05 11:37:35.575607	\N	\N	1	f
89	Osafo	Nana	C	\N	84	t	f	2018-03-05 11:37:45.817874	2018-03-05 11:37:45.817874	\N	\N	1	f
90	Osafo	Nana	C	\N	84	t	f	2018-03-05 11:37:58.00442	2018-03-05 11:37:58.00442	\N	\N	1	f
92	Saha	Saha	C	\N	36	t	f	2018-03-05 12:08:55.44353	2018-03-05 12:08:55.44353	\N	\N	3	f
93	Saha	Saha	C	\N	36	t	f	2018-03-05 12:13:53.759035	2018-03-05 12:13:53.759035	\N	\N	3	f
94	Quaye	Mady	C	\N	84	t	f	2018-03-05 17:30:22.049374	2018-03-05 17:30:22.049374	\N	\N	4	f
95	Shola1	Shola1	D	\N	32	t	f	2018-03-06 16:03:35.183638	2018-03-06 16:07:08.778457	\N	\N	5	t
96	Ocas	Joni1	C	\N	32	t	f	2018-03-06 16:27:29.285473	2018-03-06 16:27:29.285473	\N	\N	7	f
97	Osafo	Nana	C	\N	32	t	f	2018-03-06 16:37:13.978314	2018-03-06 16:37:13.978314	\N	\N	2	f
104	Bel	Bel	C	\N	32	t	f	2018-03-11 22:13:32.419697	2018-03-11 22:13:32.419697	\N	\N	13	f
91	Saha	Saha	C	\N	32	t	f	2018-03-05 12:03:55.195065	2018-03-12 09:26:04.27545	\N	1991-02-05	3	f
106	Test	Test	C	\N	32	t	f	2018-03-15 12:04:46.01774	2018-03-15 12:04:46.01774	\N	\N	15	f
107	Sedem	Kwame	C	\N	36	t	f	2018-03-16 16:16:07.523882	2018-03-16 16:16:07.523882	\N	2001-05-10	16	f
101	Davi	Agonam	C	\N	36	t	f	2018-03-07 09:15:51.919833	2018-03-26 12:31:52.848276	\N	1991-03-02	10	f
108	Sexton	Micheal	C	\N	36	t	f	2018-03-27 15:12:03.344024	2018-03-27 15:12:03.344024	\N	2018-03-06	\N	f
109	Mawuli	Akppo	C	\N	36	t	f	2018-03-27 15:18:44.033489	2018-03-27 15:18:44.033489	\N	2018-03-04	\N	f
110	Mawuli	Akppo	C	\N	36	t	f	2018-03-27 15:19:11.359991	2018-03-27 15:19:11.359991	\N	2018-03-04	\N	f
111	Mensah	Clarence	C	\N	36	t	f	2018-03-27 15:21:35.059054	2018-03-27 15:21:35.059054	\N	2015-11-02	\N	f
112	Agbe	Xorse	C	\N	36	t	f	2018-03-27 15:37:29.477911	2018-03-27 15:37:29.477911	\N	2017-02-05	\N	f
118	Aa	Bb	C	\N	36	t	f	2018-03-28 09:23:10.746782	2018-03-28 09:23:10.746782	\N	\N	\N	f
114	Nti	Padmore	D	\N	36	t	f	2018-03-27 16:26:00.801	2018-03-27 16:26:00.801	\N	\N	\N	f
119	Ab	Cd	C	\N	36	t	f	2018-03-28 09:28:47.425866	2018-03-28 09:28:47.425866	\N	\N	\N	f
120	Tetteh	Andy	D	\N	36	t	f	2018-03-28 09:36:16.654964	2018-03-28 09:36:16.654964	\N	\N	\N	f
121	Tetteh	Andy	D	\N	36	t	f	2018-03-28 09:40:26.908381	2018-03-28 09:40:26.908381	\N	\N	\N	f
122	Tetteh	Andy	D	\N	36	t	f	2018-03-28 09:41:31.674631	2018-03-28 09:41:31.674631	\N	\N	\N	f
123	Yusiff	Sherif	D	\N	36	t	f	2018-03-28 09:45:32.527886	2018-03-28 09:45:32.527886	\N	\N	\N	f
124	Nyan	Tiery	D	\N	36	t	f	2018-03-28 10:30:00.785627	2018-03-28 10:30:00.785627	\N	\N	\N	f
125	Apetorgbor	Chris	D	\N	36	t	f	2018-03-28 15:45:32.178574	2018-03-28 15:45:32.178574	\N	2017-08-06	\N	f
126	Addae	Freda	N	\N	36	t	f	2018-03-29 11:42:56.993409	2018-03-29 11:42:56.993409	\N	2017-07-02	\N	f
127	Ababio	Kiki	C	\N	83	t	f	2018-03-29 11:43:24.011031	2018-03-29 11:43:24.011031	\N	2018-01-08	\N	f
128	Quaye	Clara	N	\N	36	t	f	2018-03-29 11:45:48.579241	2018-03-29 11:45:48.579241	\N	2018-03-11	\N	f
129	Tetteh	Andrew	C	\N	116	t	f	2018-04-05 09:43:21.221216	2018-04-05 09:43:21.221216	\N	2018-04-01	\N	f
130	Asamoah	David	C	\N	116	t	f	2018-04-05 09:45:57.760509	2018-04-05 09:45:57.760509	\N	2018-04-01	\N	f
131	Asamoah	David	C	\N	116	f	f	2018-04-05 09:46:38.923544	2018-04-05 09:49:12.131304	\N	2018-04-01	\N	f
133	Asamoah	David	C	\N	116	f	f	2018-04-05 09:47:56.032742	2018-04-05 09:48:42.540948	\N	2018-04-01	\N	f
132	Asamoah	David	C	\N	116	f	f	2018-04-05 09:47:13.910325	2018-04-05 09:48:47.009784	\N	2018-04-01	\N	f
134	Sese	Setor	C	\N	36	t	f	2018-04-09 10:57:00.223503	2018-04-09 10:57:00.223503	\N	2001-01-01	75	f
\.


--
-- Name: person_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('person_infos_id_seq', 134, true);


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

COPY pre_appointments (id, provider_id, requester_id, requester_cat, beneficiary_name, appointment_type_id, proposed_date, proposed_time, complaint_desc, prev_medical_history, req_urgency, comment, user_id, active_status, del_status, created_at, updated_at, confirm_status, src, allergies, suburb_id, has_pd, pd_name, medication, duration, test_list) FROM stdin;
2	2	101	T	Clarance Maensah	MA	2018-03-16 00:00:00	09:05:00	Headache, fever\nDizziness	Diabetic	E	\N	\N	t	f	2018-03-16 09:05:18.386035	2018-03-16 09:05:18.386035	f	APP	\N	\N	\N	\N	\N	\N	\N
3	6	97	T	Nana Bosompem	MA	2018-03-16 00:00:00	09:51:00	I have some sore throat	I ave had headache before	S	\N	\N	t	f	2018-03-16 09:51:07.777841	2018-03-16 09:51:07.777841	f	APP	Allergic to oniions	2	\N	\N	\N	\N	\N
4	\N	97	S		MD	\N	\N	Paracetamol, chloriquinone	I have had  headache 	S	\N	\N	t	f	2018-03-16 10:00:19.641017	2018-03-16 10:00:19.641017	f	APP	Dust	2	\N	\N	\N	\N	\N
5	\N	97	S		LA	2018-03-16 00:00:00	10:17:00	Urine test	Haeadache	S	Accra Central	\N	t	f	2018-03-16 10:24:54.671445	2018-03-16 10:24:54.671445	f	APP	Cats	2	\N	\N	\N	\N	\N
6	\N	97	S		LA	2018-03-16 00:00:00	10:28:00	I want to have a urine test	Cataarrh	S	\N	\N	t	f	2018-03-16 10:28:21.394017	2018-03-16 10:28:21.394017	f	APP	Dont like dusts	2	\N	\N	\N	\N	\N
7	\N	97	S		LA	\N	\N	Urine and blood	Headache	S	\N	\N	t	f	2018-03-16 10:33:28.107611	2018-03-16 10:33:28.107611	f	APP	Cats	1	\N	\N	\N	\N	\N
8	\N	97	S		LA	2018-03-16 10:41:00	\N	test	test	S	\N	\N	t	f	2018-03-16 10:41:39.818639	2018-03-16 10:41:39.818639	f	APP	test	1	\N	\N	\N	\N	\N
10	3	97	S		MA	2018-03-16 10:55:00	\N	test med	test med	S	\N	\N	t	f	2018-03-16 10:55:22.390753	2018-03-16 10:55:22.390753	f	APP	test	2	\N	\N	\N	\N	\N
11	\N	97	\N	\N	VC	2018-03-16 11:04:00	\N	\N	\N	\N	\N	\N	t	f	2018-03-16 11:04:17.877424	2018-03-16 11:04:17.877424	f	APP	\N	\N	\N	\N	\N	\N	\N
12	\N	97	S		HC	2018-03-16 11:07:00	\N	leg pain	chest pain	S	\N	\N	t	f	2018-03-16 11:07:56.214205	2018-03-16 11:07:56.214205	f	APP	none	2	\N	\N	\N	\N	\N
13	\N	97	\N	\N	PC	2018-07-21 11:14:00	\N	\N	\N	\N	\N	\N	t	f	2018-03-16 11:14:36.693463	2018-03-16 11:14:36.693463	f	APP	\N	\N	\N	\N	\N	\N	\N
14	\N	97	\N	\N	PDVC	2018-09-22 11:15:00	\N	\N	\N	\N	\N	\N	t	f	2018-03-16 11:15:08.499167	2018-03-16 11:15:08.499167	f	APP	\N	\N	\N	\N	\N	\N	\N
15	\N	97	\N	\N	PDHC	2018-12-16 11:15:00	\N	\N	\N	\N	\N	\N	t	f	2018-03-16 11:15:42.820179	2018-03-16 11:15:42.820179	f	APP	\N	\N	\N	\N	\N	\N	\N
16	\N	97	\N	\N	DP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-16 11:16:16.987542	2018-03-16 11:16:16.987542	f	APP	\N	\N	\N	\N	i require malaria drugs	0	\N
17	\N	97	\N	\N	DP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-16 11:46:15.440557	2018-03-16 11:46:15.440557	f	APP	\N	\N	\N	\N	Paracetamol	13	\N
1	8	101	S		MA	2018-03-24 00:00:00	11:30:00	Headache	Diabetic	S	\N	\N	t	f	2018-03-16 08:29:46.492621	2018-03-16 14:56:34.894901	t	APP	\N	\N	\N	\N	\N	\N	\N
9	\N	97	S		MD	\N	\N	\N	i dont remember	S	\N	\N	t	f	2018-03-16 10:51:15.554939	2018-03-16 15:20:40.905998	t	APP	none	1	\N	\N	i dont know	\N	\N
18	\N	101	S		HC	2018-03-16 15:47:00	\N	Cold, fever	Diabetic	S	\N	\N	t	f	2018-03-16 15:47:12.973761	2018-03-16 15:47:12.973761	f	APP	Kenkey	1	\N	\N	\N	\N	\N
19	\N	107			PD	\N	\N		<p>Diabetic, asma</p>			\N	t	f	2018-03-16 16:27:35.970243	2018-03-16 17:04:54.811469	t	PTL	\N	2	t	Ago Ame	\N	\N	\N
20	\N	101	\N	\N	PD	\N	\N	\N	Debetic	\N	\N	\N	t	f	2018-03-19 09:03:43.971171	2018-03-19 09:04:27.278244	t	APP	\N	2	t	Ago Ame	\N	\N	\N
21	\N	101	\N	\N	PC	2018-03-19 09:06:00	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 09:06:50.903147	2018-03-19 09:08:47.325355	t	APP	\N	\N	\N	\N	\N	\N	\N
22	\N	101	\N	\N	PDVC	2018-03-19 09:08:00	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 09:09:00.226781	2018-03-19 09:09:21.573319	t	APP	\N	\N	\N	\N	\N	\N	\N
23	\N	101	\N	\N	PDHC	2018-03-19 09:09:00	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 09:09:34.769877	2018-03-19 09:09:54.680552	t	APP	\N	\N	\N	\N	\N	\N	\N
25	\N	101	S		LA	2018-03-19 09:27:00	\N	Malarial	Diabetic	S	\N	\N	t	f	2018-03-19 09:27:25.790175	2018-03-19 09:27:25.790175	f	APP	Sugar	1	\N	\N	\N	\N	\N
24	\N	101	\N	\N	DP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 09:10:25.685526	2018-03-19 09:35:19.556182	t	APP	\N	\N	\N	\N	Paracetamol, turmol, transilicate 	5	\N
26	\N	97	S		LA	2018-07-24 12:56:00	\N	\N	Headache	S	\N	\N	t	f	2018-03-19 09:54:48.816229	2018-03-19 09:54:48.816229	f	APP	Beans	1	\N	\N	\N	\N	Urine test or blood test
27	\N	97			PD	\N	\N		<p>Headaches</p>			\N	t	f	2018-03-19 09:57:57.483649	2018-03-19 10:18:48.934475	t	PTL	\N	1	t	\N	\N	\N	\N
28	\N	97	\N	\N	PC	2018-03-19 10:26:00	\N	\N	\N	\N	\N	\N	t	f	2018-03-19 10:26:30.974126	2018-03-19 10:40:48.924064	t	APP	\N	\N	\N	\N	\N	\N	\N
29	\N	97	\N	\N	PC	2018-03-21 14:45:00	\N	\N	\N	\N	\N	\N	t	f	2018-03-21 14:45:52.651322	2018-03-21 14:54:09.636008	t	APP	\N	\N	\N	\N	\N	\N	\N
30	\N	97	\N	\N	PDHC	2018-03-23 14:46:00	\N	\N	\N	\N	\N	\N	t	f	2018-03-23 14:46:18.548086	2018-03-23 14:46:18.548086	f	APP	\N	\N	\N	\N	\N	\N	\N
31	\N	97	\N	\N	DP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-03-23 15:19:38.173349	2018-03-23 15:19:38.173349	f	APP	\N	\N	\N	\N	Paracetamol	3	\N
32	\N	101			VC	\N	\N					63	t	f	2018-03-26 16:31:24.818421	2018-03-26 16:31:24.818421	f	PTL	\N	2	\N	\N	\N	\N	\N
33	6	101	S		LA	2018-03-27 17:02:00	\N			S		63	t	f	2018-03-26 17:03:13.034333	2018-03-26 17:03:13.034333	f	PTL	\N	2	\N	\N	\N	\N	\N
34	\N	101	S		PC	2018-03-26 17:07:00	\N			S		63	t	f	2018-03-26 17:07:45.655251	2018-03-26 17:07:45.655251	f	PTL	\N	2	\N	\N	\N	\N	\N
35	4	101	S		VC	2018-03-26 17:18:00	\N			S		63	t	f	2018-03-26 17:18:06.752744	2018-03-26 17:18:06.752744	f	PTL	\N	2	\N	\N	\N	\N	\N
36	\N	101	S		DP	2018-03-28 17:22:00	\N			S		63	t	f	2018-03-26 17:22:13.263526	2018-03-26 17:22:13.263526	f	PTL	\N	2	\N	\N	\N	\N	\N
37	6	101	S		MA	2018-03-28 17:35:00	\N			S		63	t	f	2018-03-26 17:35:25.305792	2018-03-26 17:35:25.305792	f	PTL	\N	2	\N	\N	\N	\N	\N
38	\N	101	S		PDHC	2018-03-26 17:42:00	\N			S		63	t	f	2018-03-26 17:42:16.361038	2018-03-26 17:42:16.361038	f	PTL	\N	2	\N	\N	\N	\N	\N
40	\N	53	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-06 10:14:41.283021	2018-04-06 10:14:41.283021	f	APP	\N	1	t	\N	\N	\N	\N
39	8	53	S		MA	2018-04-08 00:00:00	\N	Cholera	Ulcer	E	\N	\N	t	f	2018-04-06 10:13:57.95538	2018-04-06 10:39:57.166453	t	APP	\N	1	\N	\N	\N	\N	\N
41	1	101	S		MA	2018-04-10 10:30:00	\N	<p>Headache</p>\r\n<p>Cold and Fever</p>	<p>Diabetic</p>	S	\N	\N	t	f	2018-04-09 14:30:04.997961	2018-04-09 14:30:04.997961	f	WEB	\N	2	\N	\N		\N	\N
43	\N	101	S		LA	2018-04-11 10:39:00	\N			S		\N	t	f	2018-04-10 10:39:11.708012	2018-04-10 11:25:07.841018	f	PTL		2	f			\N	\N
42	\N	101	T	Casland	LA	2018-04-09 15:00:00	\N			E	\N	\N	t	f	2018-04-09 15:00:15.097903	2018-04-10 15:32:49.490803	t	WEB		2	f			\N	\N
44	\N	101	S		VC	2018-04-10 15:44:00	\N			S	\N	\N	t	f	2018-04-10 15:44:59.433704	2018-04-10 15:45:34.174737	t	WEB		2	f			\N	\N
\.


--
-- Name: pre_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('pre_appointments_id_seq', 44, true);


--
-- Data for Name: profesional_groups; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY profesional_groups (id, group_name, comment, user_id, entity_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Ghana Medical Association				t	f	2017-11-29 17:01:38.652699	2017-12-11 21:17:32.013776
2	Sweetness Medical Association				t	f	2018-03-05 15:33:49.628483	2018-03-05 15:33:49.628483
\.


--
-- Name: profesional_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('profesional_groups_id_seq', 2, true);


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
8	University Of Ghana	Legon	5		\N	83	t	f	2018-03-05 11:27:58.99268	2018-03-05 11:27:58.99268
\.


--
-- Name: provider_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('provider_masters_id_seq', 8, true);


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
-- Data for Name: referals; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY referals (id, surname, other_names, dob, contact, refered_by, user_id, active_status, del_status, created_at, updated_at, processed_status) FROM stdin;
1	Menssah	Clarance	2016-09-05	0243556709	63	\N	t	f	2018-03-27 17:33:32.435365	2018-03-27 17:33:32.435365	f
2	Addae	Freda	2018-03-01	0205869653	117	\N	t	f	2018-03-27 17:35:03.400077	2018-03-27 17:35:03.400077	f
\.


--
-- Name: referals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('referals_id_seq', 2, true);


--
-- Data for Name: region_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY region_masters (id, region_state_name, comment, country_id, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	Volta		1	\N	36	t	f	2018-03-05 11:01:20.717709	2018-03-05 11:01:20.717709
2	Greater Accra		1	\N	83	t	f	2018-03-05 11:17:06.265971	2018-03-05 11:17:06.265971
3	Lagos		2	\N	83	t	f	2018-03-05 11:19:02.294644	2018-03-05 11:19:02.294644
\.


--
-- Name: region_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('region_masters_id_seq', 3, true);


--
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY registration (id, surname, other_names, mobile_number, password, status, telco, src, verified, email, username, user_type, created_at, surburb_id, registration_number, registration_board, hospital_name, specialty, specialty_name, user_id, user_uniq_code, dob) FROM stdin;
17	Apetorgbor	Chris	0246786578                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	PTL	t	chris@gmail.com	chris	D	15:45:32.205645	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-06
18	Addae	Freda	0243556787                                        	b8164ad101cfd99e964a78f4cd44d531716408fd65190149539df6325973a8ea	t	MTN	PTL	t	freda@gmail.com	sweetness	N	11:42:57.017165	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-02
19	Ababio	kiki	0248021199                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	MTN	PTL	t	akosua@gmail.com	akosua	C	11:43:24.017399	\N	\N	\N	\N	\N	\N	\N	\N	2018-01-08
20	Quaye	Clara	025433211                                         	e382e1c5da60817b34a9290c06165d30b4da1072277b5e55061607f7ad43c206	t	\N	PTL	t	cla@gmail.com	mandy	N	11:45:48.585888	\N	\N	\N	\N	\N	\N	\N	\N	2018-03-11
30	Tetteh	Celestina	0576889902                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	f	cele@gmail.com	Celest	C	14:19:28.754905	\N	\N	\N	\N	\N	\N	\N	pas123	\N
12	new 	doc	023344555                                         	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	AIR	APP	t	sss@gmil.cp,	new doc	D	21:21:24.992979	1	11222	None	37	No	\N	32	\N	\N
31	Agbe	Nyegah	050980045                                         	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	WEB	f	agbe@gmail.com	agbe	C	14:27:01.437347	\N	\N	\N	\N	\N	\N	\N	pas123	\N
32	Agbe	Nyegah	0244568890                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	agbe1@yahoo.com	agbe1	C	14:29:16.065894	\N	\N	\N	\N	\N	\N	\N	pas123	\N
13	bel	bel	024476113371                                      	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	TIG	APP	t	ssskokjs	bel	C	22:12:42.32017	\N	\N	\N	\N	\N	\N	32	\N	\N
3	saha	saha	02447611337                                       	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	MTN	APP	t	anan@gmail.com	saha1	C	11:59:13.78284	\N	\N	\N	\N	\N	\N	36	\N	\N
4	Quaye	Mady	0248021199                                        	19fb57bda3a30aa7e10bd8f806f80bd33acd690d7ff74d8ce541a3d56f40ed4a	t	MTN	APP	t	Clara@appsnmobilesolutions.com	clara	C	15:44:10.748934	\N	\N	\N	\N	\N	\N	84	\N	\N
15	test	test	0276113323                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	AIR	APP	t	s@gmail.com	test	C	12:02:40.485385	\N	\N	\N	\N	\N	\N	32	\N	1993-06-04
7	Ocas	joni1 	666666                                            	836fff1d12aa49e02c8dc58540d7ff8ad925d72b061406f7e9d4d0c6ac0a8e30	t	AIR	APP	t	Oc@aol.com	joni1 	C	16:26:49.922651	\N	\N	\N	\N	\N	\N	32	\N	\N
6	Ocansey	joni1	55555555                                          	161eb88de06d3f94c2b4808435675903bcc978198da48498ceaa60612bbeed20	f	VOD	APP	f	J@ail.com	joni1	C	16:11:47.492107	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	osafo	Nana	0276113371                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	TIG	APP	t	nana@app.com	saha	C	11:57:29.110563	\N	\N	\N	\N	\N	\N	32	\N	\N
8	Kwame	Sedem	0248153304                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t		sedem	C	16:59:31.387848	\N	\N	\N	\N	\N	\N	32	\N	\N
5	shola1	shola1	44444444                                          	942bfa93ce756706e02ad2b9bb732888bf9fd9fb9b59d4dd0042fab043a5dd30	t	TIG	APP	t	kas@aol.com	shola1	D	16:00:26.272811	2	4566778	Ecoh london	Korle bu	Yes	Obgyn	32	\N	\N
16	Sedem	Kwame	0578009833                                        	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	t	TIG	APP	t	sedem@gmail.com	sedem1	C	15:52:48.40141	\N	\N	\N	\N	\N	\N	36	\N	2001-05-10
10	Davi	Agonam	0571238789                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	APP	t	davi@gmail.com	davi	C	09:14:22.932503	\N	\N	\N	\N	\N	\N	32	\N	\N
9	Osafo	Bosompem	0244761122                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	MTN	APP	t	nana@apps.com	doc	D	21:20:23.94046	1	123456	none	37	Yes	Dentistry	32	\N	\N
11	Nana	Clem	0244567123                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	VOD	APP	t	nobkobby@fmail.com	doc1	D	11:04:16.705593	1	122333	menme	korle u	No	\N	32	\N	\N
33	Asamoah	David	0246220138                                        	0de681222d5ab5f4fb5f704adadee5878ade93afc0dfb842e43332e1ca5a08d5	t	MTN	WEB	f	asamoahdavid95@gmail.com	asamoahdave	C	09:38:51.557351	\N	\N	\N	\N	\N	\N	\N	App$l0g1n	1993-04-20
34	Tetteh	Andrew	0504899386                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	PTL	t	andy@gmail.com	andrew	C	09:43:21.246387	\N	\N	\N	\N	\N	\N	\N	\N	2018-04-01
39	Aa	Bb	0245667890                                        	9d3735dc0525bc06f2863a4cc69452bb36b973c23c37cddde9304dabe9ba38df	t	MTN	WEB	f	aa@gmail.com	baba	C	14:46:27.309995	2	\N	\N	\N	\N	\N	\N	pas1234	2018-04-02
40	Sekyere	Mawu	0240998089                                        	9d3735dc0525bc06f2863a4cc69452bb36b973c23c37cddde9304dabe9ba38df	t	MTN	WEB	f	mawu@gmail.com	mawu	C	14:51:11.517902	2	\N	\N	\N	\N	\N	\N	pas1234	2018-04-01
41	Nya	Nunya	024390980                                         	9d3735dc0525bc06f2863a4cc69452bb36b973c23c37cddde9304dabe9ba38df	t	MTN	WEB	f	nunya@yahoo.com	nunya	C	14:54:44.043357	2	\N	\N	\N	\N	\N	\N	pas1234	2018-04-02
42	Baby	Jet	0245674365                                        	9d3735dc0525bc06f2863a4cc69452bb36b973c23c37cddde9304dabe9ba38df	t	MTN	WEB	f	jet@gmail.com	jet	C	15:00:34.185497	2	\N	\N	\N	\N	\N	\N	pas1234	2018-04-05
43	Jet	Baby	0243550900                                        	9d3735dc0525bc06f2863a4cc69452bb36b973c23c37cddde9304dabe9ba38df	t	MTN	WEB	f	jet@yahoo.com	babyjet	C	15:03:26.406113	1	\N	\N	\N	\N	\N	\N	pas1234	2018-04-05
44	Jet	Baby	0243550901                                        	83aecb45c2ed80eec6eb3ee6a9644dffa5e30cb61d989a2f6094dc445720c395	t	MTN	WEB	f	jet1@yahoo.com	babyjet1	C	15:05:30.135678	1	\N	\N	\N	\N	\N	\N	ppas123	2018-04-05
45	Agozi	Clem	0243556699                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	clemsedem@hotmail.com	clemsedem1	C	15:10:39.01434	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-05
46	Agozi	Clem	0243556691                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	clemsedem1@hotmail.com	clemsedem11	C	15:19:39.48732	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-05
47	Ago	Zi	024564433                                         	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	zizi@gmail.com	zizi	C	15:21:52.620292	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-01
48	Ago	Zi	024564432                                         	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	zizi@zgmail.com	zizizi	C	15:24:25.999036	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-01
49	Jdka	Kdfk	024345990                                         	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	kdk@gmail.com	kdfk	C	15:26:27.035596	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-05
50	Kdjfk	Dkfkj	0243299400                                        	9d3735dc0525bc06f2863a4cc69452bb36b973c23c37cddde9304dabe9ba38df	t	MTN	WEB	f	ce@jdf.com	kdf kj	C	15:28:01.44549	2	\N	\N	\N	\N	\N	\N	pas1234	2018-04-05
51	Kdjfk	Dkfkj	0244299400                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	ce@jdsf.com	dkdf kj	C	15:29:19.561244	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-05
52	Kdjfk	Dkfkj	02442994098                                       	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	ce@jdsdf.com	dkdfd	C	15:32:06.395515	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-05
53	Djf	Jdkj	0264569034                                        	9d3735dc0525bc06f2863a4cc69452bb36b973c23c37cddde9304dabe9ba38df	t	AIR	WEB	f	kdjf2@dljf.com	klsk	C	15:34:12.167619	2	\N	\N	\N	\N	\N	\N	pas1234	2018-04-05
54	Djf	Jdkj	0264569033                                        	9d3735dc0525bc06f2863a4cc69452bb36b973c23c37cddde9304dabe9ba38df	t	AIR	WEB	f	kdjf2a@dljf.com	klska	C	15:34:45.215335	2	\N	\N	\N	\N	\N	\N	pas1234	2018-04-05
55	Djf	Jdkj	0264569031                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	kdjf2a@dqljf.com	klskaq	C	15:36:27.095999	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-05
56	Kdkk	Kdk	0243899302                                        	9d3735dc0525bc06f2863a4cc69452bb36b973c23c37cddde9304dabe9ba38df	t	MTN	WEB	f	jf@gmil.com	dkjkk	C	15:40:46.132375	1	\N	\N	\N	\N	\N	\N	pas1234	2018-04-02
57	Kdkk	Kdk	0243899300                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	jf@gmail.com	dkjkke	C	15:41:57.004408	1	\N	\N	\N	\N	\N	\N	pas123	2018-04-02
58	Jdkf	Kjdkfj	0249009988                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	kdjf@gmail.com	 jlsjk	C	15:44:04.297442	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-05
59	Jdkf	Kjdkfj	0249009980                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	kdjdf@gmail.com	 jlsjkd	C	15:46:13.607271	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-05
60	Jdkf	Kjdkfj	0249009900                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	kddfjdf@gmail.com	 jlsjkdfdk	C	15:47:05.335513	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-05
61	Dfk J	Kdj	0268994499                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	AIR	WEB	f	kdf@mail.com	klla	C	15:55:41.364796	2	\N	\N	\N	\N	\N	\N	123456	2018-04-05
62	Dkjf	Ckjj.com	024332211                                         	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	WEB	f	dk@kdj.com	slkd	C	15:57:51.678066	2	\N	\N	\N	\N	\N	\N	123456	2018-04-05
63	Kd	Kdk	0242211009                                        	8c4e1808e18b0bd7bc9966138810efe3ace592b80629018b04bbc534a31fb39c	t	MTN	WEB	f	hd@gmail.com	kdl	C	16:03:29.920454	2	\N	\N	\N	\N	\N	\N	pas123456	2018-04-05
64	Kd	Kdkd	0242211001                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	hdd@gmail.com	kdld	C	16:04:39.658985	2	\N	\N	\N	\N	\N	\N	pas123	2018-04-05
65	Kd	Kdkd	0242211000                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	WEB	f	hdds@gmail.com	kdlds	C	16:09:09.81544	2	\N	\N	\N	\N	\N	\N	123456	2018-04-05
66	Dfkj K	Ksdjk	0543399002                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	WEB	f	ks@gmail.com	jkl	C	16:23:49.783366	2	\N	\N	\N	\N	\N	\N	123456	2018-04-05
67	Dfkj K	Ksdjk	0543399000                                        	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	t	MTN	WEB	f	kss@gmail.com	jkld	C	16:24:34.056745	2	\N	\N	\N	\N	\N	\N	pas12345	2018-04-05
68	Dfkj K	Ksdjk	0543399010                                        	0e994073c73091dff73b6d9aad25acda5b9f66240fd160b59997a7d5e965d709	t	MTN	WEB	f	ksks@gmail.com	jkldk	C	16:25:10.319326	2	\N	\N	\N	\N	\N	\N	098767543	2018-04-05
69	Dfkj K	Ksdjk	0543399011                                        	807696bc0b433c690ce457db5d772ea3940f7ae7f6fd0849b51fd8d1f4f83f60	t	MTN	WEB	f	ksaks@gmail.com	jkldka	C	16:25:53.863352	2	\N	\N	\N	\N	\N	\N	23453544	2018-04-05
70	Dfkj K	Ksdjk	0543399012                                        	9c78c170241941b37ca1d7a4719e68acc801794b4e67a1553ae5e3b3360a2e93	t	MTN	WEB	f	ksdaks@gmail.com	jklsdf	C	16:28:11.7956	2	\N	\N	\N	\N	\N	\N	pas122345	2018-04-05
71	Dfk	Kjfkk	0245599006                                        	d7da6caa27948d250f1ea385bf587f9d348c7334b23fa1766016b503572a73a8	t	MTN	WEB	f	kjf@gmail.com	kd	C	16:29:56.286576	1	\N	\N	\N	\N	\N	\N	345678	2018-04-05
72	Kdfjkaf	Kjdkfj	05456669954                                       	b31bd433a24dfe957206fcc1adfbeebddf9e57c03f2541eba6577e7b4e9d7010	t	MTN	WEB	f	jkfjd@gmail.com	lkjdk	C	16:33:36.365012	2	\N	\N	\N	\N	\N	\N	3123456	2018-04-05
73	Dfkj	Kdj	0278899003                                        	1ea7bed2ed1112f2c0d34eb2a21feaa852fd592f9c9d0b06929025fddba4beda	t	TIG	WEB	f	jskj@mai.com	 kld	C	16:38:23.1439	2	\N	\N	\N	\N	\N	\N	235467	2018-04-05
74	Amedekah	Kate	0567990011                                        	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	t	AIR	WEB	f	kate@gmail.com	kate	C	17:04:44.85952	2	\N	\N	\N	\N	\N	\N	pas12345	2018-04-05
75	Sese	Setor	0267218638                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	AIR	APP	f	Setor@ymail.com	setor	C	10:51:59.371817	\N	\N	\N	\N	\N	\N	\N	12345678	2001-01-01
\.


--
-- Name: registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('registration_id_seq', 75, true);


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

COPY requester_allergies (id, pre_appointment_id, allergy_id, comment, user_id, active_status, del_status, created_at, updated_at, requester_id) FROM stdin;
1	\N	2		\N	f	t	2018-03-16 11:36:46.850097	2018-03-16 11:57:06.841713	101
2	\N	3		\N	f	t	2018-03-16 11:36:46.854945	2018-03-16 11:57:06.841713	101
3	\N	2		\N	f	t	2018-03-16 11:44:29.096414	2018-03-16 11:57:06.841713	101
4	\N	3		\N	f	t	2018-03-16 11:44:29.099362	2018-03-16 11:57:06.841713	101
5	\N	2		\N	f	t	2018-03-16 11:47:44.849629	2018-03-16 11:57:06.841713	101
6	\N	3		\N	f	t	2018-03-16 11:47:44.852425	2018-03-16 11:57:06.841713	101
7	1	2		\N	f	t	2018-03-16 11:48:17.219495	2018-03-16 11:57:06.841713	101
8	1	3		\N	f	t	2018-03-16 11:48:17.221865	2018-03-16 11:57:06.841713	101
9	1	2		\N	f	t	2018-03-16 11:48:49.122674	2018-03-16 11:57:06.841713	101
10	1	3		\N	f	t	2018-03-16 11:48:49.125136	2018-03-16 11:57:06.841713	101
11	1	2		\N	f	t	2018-03-16 11:56:46.299283	2018-03-16 11:57:06.841713	101
12	1	3		\N	f	t	2018-03-16 11:56:46.301625	2018-03-16 11:57:06.841713	101
13	1	2		\N	t	f	2018-03-16 11:57:06.844284	2018-03-16 11:57:06.844284	101
14	1	3		\N	t	f	2018-03-16 11:57:06.846844	2018-03-16 11:57:06.846844	101
15	1	8		\N	t	f	2018-03-16 11:57:06.849418	2018-03-16 11:57:06.849418	101
\.


--
-- Name: requester_allergies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('requester_allergies_id_seq', 15, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY roles (id, name, created_at, updated_at, user_id, comment, active_status, del_status) FROM stdin;
3	Nurse	2017-12-14 16:31:50.541952	2017-12-14 16:31:50.541952	9		t	f
2	Customer Service	2017-12-14 15:10:54.372358	2017-12-14 16:46:10.186552	9		t	f
4	Doctor	2018-02-08 17:28:23.049753	2018-02-08 17:28:23.049753	36		t	f
5	Patient	2018-02-09 10:02:54.228164	2018-02-09 10:02:54.228164	36		t	f
6	Laboratorist	2018-02-09 10:03:28.520383	2018-02-09 10:03:28.520383	36		t	f
7	Pharmacist	2018-02-09 10:03:55.672648	2018-02-09 10:03:55.672648	36		t	f
1	Super Admin	2017-12-14 15:10:54.336974	2018-03-28 14:29:47.929268	36		t	f
8	Patient	2018-03-29 11:38:38.436002	2018-03-29 11:38:38.436002	83		t	f
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('roles_id_seq', 8, true);


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
20180312095856
20180315091240
20180319092908
20180319154701
20180322101641
20180323135908
20180327104522
\.


--
-- Data for Name: service_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY service_masters (id, title, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
3	Physiotherapy Services		\N	36	t	f	2017-11-07 10:49:55.7931	2018-01-25 15:49:10.52437
2	Eye Health Care		\N	36	t	f	2017-11-07 10:49:18.907214	2018-01-25 15:49:15.230846
1	Mental Health Care		\N	36	t	f	2017-11-03 09:05:53.089627	2018-01-25 15:49:25.971976
4	Dental Service		\N	36	t	f	2017-12-04 18:36:02.681764	2018-03-05 10:27:51.871417
5	Gynaecology		\N	83	t	f	2018-03-05 10:28:36.551817	2018-03-05 10:28:36.551817
6	Ent		\N	84	t	f	2018-03-05 10:30:53.666423	2018-03-05 10:30:53.666423
7	Pharmacy		\N	83	t	f	2018-03-05 11:26:17.4669	2018-03-05 11:26:17.4669
\.


--
-- Name: service_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('service_masters_id_seq', 7, true);


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
8	8	1	030123456									\N	\N	t	f	2018-03-05 11:27:58.994498	2018-03-05 11:27:58.994498
\.


--
-- Name: service_prov_extra_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('service_prov_extra_infos_id_seq', 8, true);


--
-- Data for Name: service_prov_types; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY service_prov_types (id, service_prov_type_title, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
3	Herbal Centre		\N	\N	t	f	2017-11-07 10:50:44.247617	2017-11-11 21:13:56.563655
2	Clinic		\N	\N	t	f	2017-11-07 10:50:26.110801	2017-11-11 21:14:04.804177
1	Hospital		\N	\N	t	f	2017-11-02 12:57:22.279357	2017-11-11 21:14:11.86312
4	Cocoa Clinic		\N	\N	t	f	2017-11-21 18:03:44.559779	2017-11-21 18:03:44.559779
5	Pharmacy		\N	\N	t	f	2017-11-21 21:07:48.912613	2017-11-21 21:07:48.912613
8	Tertiary Hospital		\N	36	t	f	2017-12-04 18:37:25.602415	2018-01-25 16:17:08.338432
7	Maternity Home		\N	36	t	f	2017-11-21 21:09:06.495535	2018-01-25 16:17:15.467643
6	Diagnostic Centres		\N	36	t	f	2017-11-21 21:08:20.585147	2018-01-25 16:17:28.029945
9	Physio		\N	36	t	f	2018-01-17 16:17:41.996204	2018-03-05 10:50:58.933272
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
4	Cardiology					t	f	2018-03-05 15:32:18.991452	2018-03-05 15:32:54.869609
\.


--
-- Name: specialty_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('specialty_masters_id_seq', 4, true);


--
-- Data for Name: suburb_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY suburb_masters (id, suburb_name, comment, city_town_id, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	Madina		1	\N	83	t	\N	2018-03-05 11:22:15.72852	2018-03-05 11:22:15.72852
2	Accra Central		1	\N	36	t	\N	2018-03-05 12:37:23.59947	2018-03-05 12:37:23.59947
\.


--
-- Name: suburb_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('suburb_masters_id_seq', 2, true);


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
10			\N	\N	\N	0	\N	\N	\N	\N	2018-02-08 15:29:32.54908	2018-02-08 15:29:32.54908	61	kojo	\N	\N	\N	\N	\N	\N	3
11			\N	\N	\N	0	\N	\N	\N	\N	2018-02-08 15:44:49.583592	2018-02-08 15:44:49.583592	62	kojo	\N	\N	\N	\N	\N	\N	3
24		$2a$11$NCXqncn6x5Xg4v0SYbg5WOFN5f/23Ye0FZmPiq7tKFEcRlOf/54sC	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 10:10:32.663437	2018-02-28 10:10:32.663437	75	samuelapp24	\N	\N	\N	\N	\N	\N	4
25		$2a$11$VC.M/S6htxnnBHuy/dVXF.K1ZkApJ58IKNiYNyLCxaV9aKrbvekrC	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 10:24:59.912506	2018-02-28 10:24:59.912506	76	han	\N	\N	\N	\N	\N	\N	5
26		$2a$11$JffZyT87l7kSe39yivjMZeSn1aODszedARIsrVZ1NhHfvvziMJo7.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 10:34:48.698628	2018-02-28 10:34:48.698628	77	han	\N	\N	\N	\N	\N	\N	4
27		$2a$11$NJPIuYedh2Eu09l7aPBoW.SkfKiKRdzk9i/CnwQTgTBkD6dTNnITG	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 10:40:02.081993	2018-02-28 10:40:02.081993	78	han	\N	\N	\N	\N	\N	\N	5
28		$2a$11$76zgWRGFTz3BdbOBtdjtEe38bDhdeEYV00WW/2gwQtkZ1z9cwuOdK	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 10:57:00.147256	2018-02-28 10:57:00.147256	79	han	\N	\N	\N	\N	\N	\N	5
51		$2a$11$LpEtuL6hXOqhlMQ8lzLvauxSNS3iJtvLHL1SeGr7b8damlUvub85G	\N	\N	\N	0	\N	\N	\N	\N	2018-03-11 21:19:09.304182	2018-03-11 21:19:09.304182	102	doc1	\N	\N	\N	\N	\N	\N	4
16		$2a$11$SAz94Du/FtexX51PHktayu6h9qZ.geNptDxbI864b1mBUwKRYcsD2	\N	\N	\N	0	\N	\N	\N	\N	2018-02-12 15:25:22.283767	2018-02-12 15:25:22.283767	67	kojo	\N	\N	\N	\N	\N	\N	3
17		$2a$11$utRI8rOtldlMVwxT6W2rYOawTCX15FEYXHuxzqHSw4WMZ12/wM5n6	\N	\N	\N	0	\N	\N	\N	\N	2018-02-12 16:09:35.714137	2018-02-12 16:09:35.714137	68	best doc	\N	\N	\N	\N	\N	\N	4
18		$2a$11$fE5w4pqg5VJsLuTQmiRBiuNTNibdqnjXyYJ0ViybahvonjctWmQSS	\N	\N	\N	0	\N	\N	\N	\N	2018-02-12 16:20:32.001301	2018-02-12 16:20:32.001301	69	samuelapp24	\N	\N	\N	\N	\N	\N	4
34		$2a$11$oz9cnRSlYRmvYJlmPW6VE.x/pNA.RSpTJ.0hfCrpl5QLS6BPxIz/S	\N	\N	\N	0	\N	\N	\N	\N	2018-03-02 15:42:22.430032	2018-03-02 15:42:22.430032	85	ron	\N	\N	\N	\N	\N	\N	4
32		$2a$11$q..hS8oTwCdjQ9IbqUPboussyF8j3GoanZOcVCEFnA3RB7xXjEuBK	\N	\N	\N	13	2018-04-11 11:26:30.141935	2018-04-09 09:21:39.843217	41.189.179.110	41.189.179.110	2018-03-02 15:22:06.740726	2018-04-11 11:26:30.147682	83	freda	\N	\N	\N	\N	\N	\N	1
52		$2a$11$q4zWYoh7241K9aVSWEiN4OUYqn9agR22hf0sJ5pqxx40vO0vghsh.	\N	\N	\N	0	\N	\N	\N	\N	2018-03-11 21:33:03.474324	2018-03-11 21:33:03.474324	103	new doc	\N	\N	\N	\N	\N	\N	4
19		$2a$11$t7tmUiarg7087GaZpcnSh.mR4k19sG5M6w8ozmAsppMhrv8XveAwC	\N	\N	\N	0	\N	\N	\N	\N	2018-02-14 17:20:22.624192	2018-02-14 17:20:22.624192	70	nana adoma	\N	\N	\N	\N	\N	\N	5
48		$2a$11$l9ysdSOwnL2TuzreHLJJVe4Hr.Jl9t9GvqRIe4GerLg9LDXJe0Qa6	\N	\N	\N	0	\N	\N	\N	\N	2018-03-06 18:29:57.77897	2018-03-06 18:29:57.77897	99	nana	\N	\N	\N	\N	\N	\N	1
21		$2a$11$AKtisnef.cteOiwbw4lqSuxRvqkq2JI9LsGmcG1U9mq9EUlmOXIcW	\N	\N	\N	1	2018-03-06 20:51:13.316538	2018-03-06 20:51:13.316538	154.160.0.120	154.160.0.120	2018-02-28 08:57:23.138968	2018-03-06 20:51:13.318586	72	nana	\N	\N	\N	\N	\N	\N	5
35		$2a$11$nH.v/mx0k6ZI4wz20bDk8.KDMaOOYgtudodcfhK6io5tG.K6.48ge	\N	\N	\N	0	\N	\N	\N	\N	2018-03-05 10:36:35.261926	2018-03-05 10:36:35.261926	86	baby	\N	\N	\N	\N	\N	\N	7
54		$2a$11$tynqhNN5fer0MPeTOGQCbu8NQis.obKG3mEoxeFyvHtW4k6FfP4sW	\N	\N	\N	0	\N	\N	\N	\N	2018-03-15 11:26:48.40379	2018-03-15 11:26:48.40379	105	test	\N	\N	\N	\N	\N	\N	5
4		$2a$11$dDo0NvtWRXlIUhaFynZnueU2TMa8Ixnp381FfyIYSSHdYGoQHO36C	\N	\N	\N	18	2018-03-06 20:52:55.195267	2018-03-06 15:53:06.665292	154.160.0.120	41.66.255.195	2017-12-14 19:58:18.02499	2018-03-06 20:52:55.196372	32	kobby	\N	\N	\N	\N	\N	\N	1
49		$2a$11$llLVFzcJ4g9zvLJEfLeDE.Ekt8VuQtXSsOwu6WPA9.7gy9n17eqTW	\N	\N	\N	0	\N	\N	\N	\N	2018-03-06 21:22:21.366495	2018-03-06 21:22:21.366495	100	doc	\N	\N	\N	\N	\N	\N	4
9			\N	\N	\N	0	\N	\N	\N	\N	2018-02-08 14:51:47.006325	2018-02-08 14:51:47.006325	60	kojo	\N	\N	\N	\N	\N	\N	3
50		$2a$11$gl0Cu.uO.sQfmhMsV2ot.ux7.arqHf517HfOZfJUP5ihtRjGxl85m	\N	\N	\N	17	2018-04-11 12:01:19.765471	2018-04-11 11:58:13.69412	41.189.179.110	41.189.179.110	2018-03-07 09:15:51.922629	2018-04-11 12:01:19.767234	101	davi	\N	\N	\N	\N	\N	\N	5
37		$2a$11$j5wAdWBTzEJ5ylkWCqtvIejhZkuNeEN/UUXqnXCFmyT4BPUKD.QEq	\N	\N	\N	0	\N	\N	\N	\N	2018-03-05 11:37:35.578191	2018-03-05 11:37:35.578191	88	saha	\N	\N	\N	\N	\N	\N	4
38		$2a$11$KM5/9IdchkYOL6be6U6O0ehc2WBxJZc1YENsPIDIGxOMDX14RThlW	\N	\N	\N	0	\N	\N	\N	\N	2018-03-05 11:37:45.820565	2018-03-05 11:37:45.820565	89	saha	\N	\N	\N	\N	\N	\N	5
39		$2a$11$GO4ecvUfRjzUm3FIb2AUVO564kc.ME8ZnT5ae5JifnYKEiOWmQ/gi	\N	\N	\N	0	\N	\N	\N	\N	2018-03-05 11:37:58.007093	2018-03-05 11:37:58.007093	90	saha	\N	\N	\N	\N	\N	\N	1
40		$2a$11$miVwYtH3nXcWiUQNHsqe7ekgohM9oZ6vezP5H.wYHkTQFeA3uInfy	\N	\N	\N	0	\N	\N	\N	\N	2018-03-05 12:03:55.197785	2018-03-05 12:03:55.197785	91	saha1	\N	\N	\N	\N	\N	\N	5
41		$2a$11$RRYzxbjA4Z9cmmX1h7NZqe1eNLxBY9VRFZpJ0tMexKStS5Gzf8rYq	\N	\N	\N	0	\N	\N	\N	\N	2018-03-05 12:08:55.446154	2018-03-05 12:08:55.446154	92	saha1	\N	\N	\N	\N	\N	\N	5
30		$2a$11$Vqq32zLv7ZsaGt5UUWPxe.nZEu7x45pZSZt0WtmubJDO0oWdJg4.a	\N	\N	\N	0	\N	\N	\N	\N	2018-03-02 15:01:13.907529	2018-03-02 15:01:13.907529	81	bob	\N	\N	\N	\N	\N	\N	5
22		$2a$11$iRt.sam4HqL7beOH0EnNVOcWZgAdU5pUjeokK8Yzb3GtXTFCOBmFG	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 09:40:52.706467	2018-02-28 09:40:52.706467	73	joe	\N	\N	\N	\N	\N	\N	4
23		$2a$11$wnUNTZPbduN7304NX.IVfOUFl3Vps83dOzUshuQD0PeDvxebkYWge	\N	\N	\N	0	\N	\N	\N	\N	2018-02-28 09:41:41.496951	2018-02-28 09:41:41.496951	74	bambi2	\N	\N	\N	\N	\N	\N	4
31		$2a$11$2a3VoK9vFunmC5PQ1o0l1.xCX/JLX8YBUxK8boFvKd5rLIv19enrW	\N	\N	\N	0	\N	\N	\N	\N	2018-03-02 15:07:43.265905	2018-03-02 15:07:43.265905	82	bin	\N	\N	\N	\N	\N	\N	4
45		$2a$11$S32tmSXWU3bll5GFzl2dU.ny9868c113WXW9W1SJE8BhQG4htHsBC	\N	\N	\N	0	\N	\N	\N	\N	2018-03-06 16:27:29.288611	2018-03-06 16:27:29.288611	96	joni1	\N	\N	\N	\N	\N	\N	5
46		$2a$11$CKSTNFZRjDOkGdvlqODI.u3rTLp6RWVAjJMcvRG0FsHYECCqJBTae	\N	\N	\N	0	\N	\N	\N	\N	2018-03-06 16:37:13.980924	2018-03-06 16:37:13.980924	97	saha	\N	\N	\N	\N	\N	\N	5
42		$2a$11$2c.QmrQrXyPxJLON5Mm/fu3BrJHMGUPzlc5O6b5DbQtnsqlaLlkGK	\N	\N	\N	0	\N	\N	\N	\N	2018-03-05 12:13:53.761524	2018-03-05 12:13:53.761524	93	saha1	\N	\N	\N	\N	\N	\N	5
47		$2a$11$tXAzsZQHrnb.gdhyeqGjj.rxGqEU9YN5yj3KrmMPW/zUaP1eDnkea	\N	\N	\N	0	\N	\N	\N	\N	2018-03-06 16:59:50.558849	2018-03-06 16:59:50.558849	98	sedem	\N	\N	\N	\N	\N	\N	5
20		$2a$11$1y23ShRg2e3QSjA3XANDF.Ul9Seq4tFDAif8.tXx9q8MkxffQVsm6	\N	\N	\N	2	2018-03-05 16:48:01.191278	2018-03-05 16:41:08.661407	197.251.129.178	197.251.129.178	2018-02-15 15:26:02.718831	2018-03-05 16:48:01.192363	71	han	\N	\N	\N	\N	\N	\N	5
53		$2a$11$9Pl/yjfQAJ6brd1mliIZfOdcYXHzIFv3kk5rriVT/wwYKvXkMHVrC	\N	\N	\N	0	\N	\N	\N	\N	2018-03-11 22:13:32.422411	2018-03-11 22:13:32.422411	104	bel	\N	\N	\N	\N	\N	\N	5
5		$2a$11$RtAp.Vhz76703foeqjbdk./qxfFZHnlLwQAKt5qCOsIZuJOJbHYEm	\N	\N	\N	10	2018-04-10 15:06:34.116176	2018-04-10 15:05:50.312294	41.189.179.114	41.189.179.114	2017-12-15 11:15:46.026676	2018-04-10 15:06:34.118076	34	david	\N	\N	\N	\N	\N	\N	2
44		$2a$11$NW1bQLTPN/AthA70CN9KruDo4RZ/moSHbWajiiK7bW/3B/BOai6uy	\N	\N	\N	1	2018-03-06 18:24:21.59176	2018-03-06 18:24:21.59176	37.210.127.39	37.210.127.39	2018-03-06 16:03:35.186911	2018-03-06 18:24:21.592814	95	shola1	\N	\N	\N	\N	\N	\N	4
15		$2a$11$LPFm7DDXNgv9SeXs3mZSXOOguvPty5puwwG/Bam5eaK1RXC1EWIFC	\N	\N	\N	46	2018-04-10 15:50:57.28264	2018-04-10 15:08:13.498964	41.189.179.114	41.189.179.114	2018-02-12 12:17:42.30264	2018-04-10 15:50:57.28461	63	ago	\N	\N	\N	\N	\N	\N	4
57		$2a$11$6GWGWSPodypPS/162GrvaOHugbl9MTv7qjMNFVNK4DmEaH6W/rVju	\N	\N	\N	0	\N	\N	\N	\N	2018-03-27 15:12:03.347147	2018-03-27 15:12:03.347147	108	sexton	\N	\N	\N	\N	\N	\N	5
55		$2a$11$b1VRWXCOG9GyQzmfpp89jeK0S2AjbJuP2pc0kjBDBHnBS9QNRGKiC	\N	\N	\N	0	\N	\N	\N	\N	2018-03-15 12:04:46.020371	2018-03-15 12:04:46.020371	106	test	\N	\N	\N	\N	\N	\N	5
56		$2a$11$JgLD6httHb2eYR0sXDa1LeJ6cPw96wZbGNLfhKHhE4bTxOf/q6kP6	\N	\N	\N	0	\N	\N	\N	\N	2018-03-16 16:16:07.528745	2018-03-16 16:16:07.528745	107	sedem1	\N	\N	\N	\N	\N	\N	5
58		$2a$11$OguZGmMeyZsd3ada63bon.p9hQJubAphhn3DY6Q3Mi7rBivKE6pzG	\N	\N	\N	0	\N	\N	\N	\N	2018-03-27 15:18:44.036143	2018-03-27 15:18:44.036143	109	mawuli	\N	\N	\N	\N	\N	\N	5
59		$2a$11$4tq0vU5V0Rn0P3XH6DKp/upIAx.ou6emhlAQDdLEs2ejxwJ245JYu	\N	\N	\N	0	\N	\N	\N	\N	2018-03-27 15:19:11.362795	2018-03-27 15:19:11.362795	110	mawuli	\N	\N	\N	\N	\N	\N	5
60		$2a$11$MaZ8E0CMch1Jexg0FVdxjuoRLYTblq6hieGBqQ55BupqdQV1TwZqC	\N	\N	\N	0	\N	\N	\N	\N	2018-03-27 15:21:35.061719	2018-03-27 15:21:35.061719	111	mensah	\N	\N	\N	\N	\N	\N	5
6		$2a$11$g3m7AlKLlJuZfoDPt9joouLKcoJmIs3rgs4RtvHigWgvEbt8roq7u	\N	\N	\N	89	2018-04-09 14:28:08.258791	2018-04-09 10:52:33.219974	41.189.179.110	41.189.179.110	2018-01-05 11:52:52.858909	2018-04-09 14:28:08.260579	36	clem	\N	\N	clem.jpg	image/jpeg	79054	2018-01-05 12:01:00.41165	1
61		$2a$11$bfsfTGWl0avJ8lAigzF8Weu8o1hkTFr2yZX1wwYX74auZYILv24pK	\N	\N	\N	0	\N	\N	\N	\N	2018-03-27 15:37:29.480625	2018-03-27 15:37:29.480625	112	xorse	\N	\N	\N	\N	\N	\N	5
63		$2a$11$3kSRqbN.6YID2CYUNNd.m.X2ZpfBBRE7iHGD/EhiHLrU4KIhY1FWC	\N	\N	\N	0	\N	\N	\N	\N	2018-03-27 16:26:00.803566	2018-03-27 16:26:00.803566	114	paddy	\N	\N	\N	\N	\N	\N	4
67		$2a$11$WUJLZxGDyevzM3IaIdHE5uWC6T5pq7DPk4e4ykgcUOfRjBmo0jPnS	\N	\N	\N	0	\N	\N	\N	\N	2018-03-28 09:23:10.749989	2018-03-28 09:23:10.749989	118	aa	\N	\N	\N	\N	\N	\N	5
68		$2a$11$xv./gFmzxjJE8gD.C0.3h.jaHsQw1CRCNZlnoNpj5O8P7cmy7l3vO	\N	\N	\N	0	\N	\N	\N	\N	2018-03-28 09:28:47.428695	2018-03-28 09:28:47.428695	119	abc	\N	\N	\N	\N	\N	\N	5
69		$2a$11$RlG7RwGyYN7019rb6jXRteeb4nxA7JTpgS7.5FzrQ4s7NaxphIXGW	\N	\N	\N	0	\N	\N	\N	\N	2018-03-28 09:36:16.657803	2018-03-28 09:36:16.657803	120	andy	\N	\N	\N	\N	\N	\N	4
70		$2a$11$e/umcQiuAV73ghqDiski3.oJXmrfXsbkeJ2y0W/hu26XWr/CcbFJ.	\N	\N	\N	0	\N	\N	\N	\N	2018-03-28 09:40:26.91116	2018-03-28 09:40:26.91116	121	andy1	\N	\N	\N	\N	\N	\N	4
71		$2a$11$ekavxflbneXx5BL8gmrhm.7xCtnbVrGCGwTdg2Ora4V0YVx.9W3x.	\N	\N	\N	0	\N	\N	\N	\N	2018-03-28 09:41:31.67735	2018-03-28 09:41:31.67735	122	andy11	\N	\N	\N	\N	\N	\N	4
72		$2a$11$Bj0ly1erakgXGSJEelwGp.hUoto1XNl5y9./VQbksOPLLtvo1k7wm	\N	\N	\N	0	\N	\N	\N	\N	2018-03-28 09:45:32.530609	2018-03-28 09:45:32.530609	123	sherif	\N	\N	\N	\N	\N	\N	4
73		$2a$11$U5A5wLURxMl/5r4bMWpH0.g14VzBmVHaOPhcQbsdEoDPfr87QayAK	\N	\N	\N	0	\N	\N	\N	\N	2018-03-28 10:30:00.789162	2018-03-28 10:30:00.789162	124	nyan	\N	\N	\N	\N	\N	\N	4
74		$2a$11$/i.BV3AEwDdfbh3C8.SCcesnZBRYkpP2sAdAkHP6G7ByJEzu7mv1e	\N	\N	\N	0	\N	\N	\N	\N	2018-03-28 15:45:32.182378	2018-03-28 15:45:32.182378	125	chris	\N	\N	\N	\N	\N	\N	4
75		$2a$11$wFP8b7TehfNLTKg6VrY24uRyNV0SPnaPogh2dO91DdHEFnolwm28e	\N	\N	\N	0	\N	\N	\N	\N	2018-03-29 11:42:56.996546	2018-03-29 11:42:56.996546	126	sweetness	\N	\N	\N	\N	\N	\N	1
77		$2a$11$baz3UYfAl1RAhi.tMrdyvuzhxiPjyGzBM8crsyzxPdpcUgWrW/yji	\N	\N	\N	0	\N	\N	\N	\N	2018-03-29 11:45:48.581934	2018-03-29 11:45:48.581934	128	mandy	\N	\N	\N	\N	\N	\N	1
76		$2a$11$tcvnBn4jyS/l0x263MGLxujuIL9xG3uuBEq.O0EGWQAkWkqhuETBi	\N	\N	\N	1	2018-03-29 11:46:50.262123	2018-03-29 11:46:50.262123	41.189.179.79	41.189.179.79	2018-03-29 11:43:24.013659	2018-03-29 11:46:50.263862	127	akosua	\N	\N	\N	\N	\N	\N	5
80		$2a$11$JIwftqSj0OKz/iAIWbWljOP8nf7C8F5NWzC/mfymrFlTddrRwVL3W	\N	\N	\N	0	\N	\N	\N	\N	2018-04-05 09:46:38.926754	2018-04-05 09:46:38.926754	131	ghinger	\N	\N	\N	\N	\N	\N	1
81		$2a$11$E8FO6soVkaCk2fgm/pvgcuY54xXo6AvT31.D6KsWk5OI.ZGpyCdEW	\N	\N	\N	0	\N	\N	\N	\N	2018-04-05 09:47:13.913192	2018-04-05 09:47:13.913192	132	dasamoah	\N	\N	\N	\N	\N	\N	1
82		$2a$11$F6C0kwxKgmUUO06x9YYT8u/d6nl.vYiXNsNbwKKlgYjmAFmpsVQDq	\N	\N	\N	0	\N	\N	\N	\N	2018-04-05 09:47:56.035765	2018-04-05 09:47:56.035765	133	ghana	\N	\N	\N	\N	\N	\N	1
65		$2a$11$2qACcskIEaT6zJVBR6N3X.oWLP575v/n/qQWsxhYBizgwP4DdugRS	\N	\N	\N	6	2018-04-06 10:24:37.589644	2018-04-06 10:19:06.440127	41.189.179.106	41.189.179.106	2018-03-27 16:58:57.817937	2018-04-06 10:24:37.591457	116	clara	\N	\N	\N	\N	\N	\N	1
66		$2a$11$zI8WUlWeQFjo.l6ltoldg.UHoSELxq6JVbDUyqOKoX2Svpo5qschq	\N	\N	\N	7	2018-04-06 10:41:40.103495	2018-04-06 10:15:56.979825	41.189.179.106	41.189.179.106	2018-03-27 17:12:12.085307	2018-04-06 10:41:40.105803	117	mady	\N	\N	\N	\N	\N	\N	4
79		$2a$11$NGLd/ndLjYKIMdkW9BTA3eFXtKDVpHh06U5cD9Wy4maFl77ovoohK	\N	\N	\N	2	2018-04-06 12:00:53.419422	2018-04-05 09:48:49.350897	41.189.179.106	41.189.179.106	2018-04-05 09:45:57.763337	2018-04-06 12:00:53.42163	130	asamoah	\N	\N	\N	\N	\N	\N	1
78		$2a$11$oKcIpwYcSmlXHfGI.5DlpuA6c2gm2bsSG8itRA5GdP42e7Rcw5F5.	\N	\N	\N	2	2018-04-09 10:47:40.741874	2018-04-06 10:07:24.161008	41.189.179.110	41.189.179.106	2018-04-05 09:43:21.22444	2018-04-09 10:47:40.744049	129	andrew	\N	\N	\N	\N	\N	\N	1
83		$2a$11$gPdaUj2l2U0FSsz363UR0efqNsQy6d5WPYGTUBcQAr/92uOdFeloW	\N	\N	\N	1	2018-04-09 10:57:37.431732	2018-04-09 10:57:37.431732	41.189.179.110	41.189.179.110	2018-04-09 10:57:00.22668	2018-04-09 10:57:37.433607	134	setor	\N	\N	\N	\N	\N	\N	5
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('users_id_seq', 83, true);


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
-- Name: patient_med_records patient_med_records_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY patient_med_records
    ADD CONSTRAINT patient_med_records_pkey PRIMARY KEY (id);


--
-- Name: pds_patient_prev_med_histories pds_patient_prev_med_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY pds_patient_prev_med_histories
    ADD CONSTRAINT pds_patient_prev_med_histories_pkey PRIMARY KEY (id);


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
-- Name: referals referals_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY referals
    ADD CONSTRAINT referals_pkey PRIMARY KEY (id);


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

