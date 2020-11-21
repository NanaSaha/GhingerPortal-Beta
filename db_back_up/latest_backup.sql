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
    attended_to boolean,
    nurse_id integer
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
-- Name: decline_comments; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE decline_comments (
    id integer NOT NULL,
    pre_confirmed_appointment_id integer,
    available_date timestamp without time zone,
    comment character varying,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    doctor_id integer,
    nurse_id integer
);


ALTER TABLE decline_comments OWNER TO clemence;

--
-- Name: decline_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE decline_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE decline_comments_id_seq OWNER TO clemence;

--
-- Name: decline_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE decline_comments_id_seq OWNED BY decline_comments.id;


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
    foreign_licence_number character varying,
    hospital_name character varying
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
    test_list text,
    beneficiary_phone_number character varying,
    pre_confirm_status boolean
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
-- Name: pre_confirmed_appointments; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE pre_confirmed_appointments (
    id integer NOT NULL,
    pre_appointment_id integer,
    doctor_id integer,
    nurse_id integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    accepted_status boolean,
    date_time timestamp without time zone,
    decline_status boolean,
    closed boolean
);


ALTER TABLE pre_confirmed_appointments OWNER TO clemence;

--
-- Name: pre_confirmed_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE pre_confirmed_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pre_confirmed_appointments_id_seq OWNER TO clemence;

--
-- Name: pre_confirmed_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE pre_confirmed_appointments_id_seq OWNED BY pre_confirmed_appointments.id;


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
    surburb_id integer,
    user_id integer,
    user_uniq_code text,
    dob date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    specialty_id integer,
    specialty_duration character varying,
    has_specialty boolean,
    foreign_training boolean,
    foreign_institution character varying,
    professional_group_id integer,
    licence_number character varying,
    foreign_licence_number character varying,
    pd_sub boolean,
    hospital_name character varying
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
-- Name: decline_comments id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY decline_comments ALTER COLUMN id SET DEFAULT nextval('decline_comments_id_seq'::regclass);


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
-- Name: pre_confirmed_appointments id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY pre_confirmed_appointments ALTER COLUMN id SET DEFAULT nextval('pre_confirmed_appointments_id_seq'::regclass);


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
2	Cape Town		4	\N	149	t	f	2018-04-19 10:48:13.000302	2018-04-19 10:48:13.000302
3	Takoradi		5	\N	135	t	f	2018-04-20 12:20:32.448541	2018-04-20 12:20:32.448541
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
13	Pelvic Dislocation		\N	t	f	2018-03-05 15:26:53.392617	2018-03-05 15:26:53.392617
\.


--
-- Name: condition_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('condition_masters_id_seq', 13, true);


--
-- Data for Name: confirmed_appointments; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY confirmed_appointments (id, pre_appointment_id, provider_id, complaint_desc, confirmed_date, confirmed_time, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, suburb_id, doctor_id, patient_id, attended_to, nurse_id) FROM stdin;
1	2	2	<p>headache</p>	2018-04-16 10:00:00	\N		135	\N	t	f	2018-04-12 16:44:22.573949	2018-04-12 16:44:22.573949	2	\N	\N	f	\N
2	6	\N		\N	\N		36	\N	t	f	2018-04-13 16:18:41.796987	2018-04-13 16:18:41.796987	1	\N	\N	f	\N
3	9	\N	<p>drugs</p>	2018-04-16 16:19:00	\N	<p>yh</p>	135	\N	t	f	2018-04-13 16:19:57.014881	2018-04-13 16:19:57.014881	2	\N	\N	f	\N
4	10	2	<p>drugs</p>	2018-04-16 16:20:00	\N	<p>ok</p>	135	\N	t	f	2018-04-13 16:20:52.816951	2018-04-13 16:20:52.816951	1	\N	\N	f	\N
5	11	2		2018-04-16 10:24:00	\N		135	\N	t	f	2018-04-13 16:25:30.178286	2018-04-13 16:25:30.178286	1	\N	\N	f	\N
6	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:27:00.662677	2018-04-13 16:27:00.662677	2	\N	136	\N	\N
7	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:27:15.279525	2018-04-13 16:27:15.279525	2	\N	136	\N	\N
8	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:27:23.84165	2018-04-13 16:27:23.84165	2	\N	136	\N	\N
9	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:27:39.683034	2018-04-13 16:27:39.683034	2	\N	136	\N	\N
10	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:31:08.401777	2018-04-13 16:31:08.401777	2	\N	136	\N	\N
11	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:31:58.637838	2018-04-13 16:31:58.637838	2	\N	136	\N	\N
12	7	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:32:14.543337	2018-04-13 16:32:14.543337	1	\N	137	\N	\N
13	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:35:10.917303	2018-04-13 16:35:10.917303	2	\N	136	\N	\N
14	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:59:01.055241	2018-04-13 16:59:01.055241	2	140	136	\N	\N
15	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 17:06:55.552207	2018-04-13 17:06:55.552207	2	140	136	\N	\N
16	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 17:08:39.989991	2018-04-13 17:08:39.989991	2	140	136	\N	\N
17	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 17:09:25.657531	2018-04-13 17:09:25.657531	2	140	136	\N	\N
20	18	\N	<p style="box-sizing: inherit; font-family: verdana, arial, helvetica, sans-serif; font-size: 13px; line-height: 18px; margin: 0px 0px 10px; background-color: #f1f1f1;">have fever and headache</p>\r\n<p style="box-sizing: inherit; font-family: verdana, arial, helvetica, sans-serif; font-size: 13px; line-height: 18px; margin: 0px 0px 10px; background-color: #f1f1f1;">Also feeling cold</p>	2018-04-17 10:55:00	\N		36	\N	t	f	2018-04-16 10:56:29.338994	2018-04-16 10:56:29.338994	2	140	139	f	\N
21	19	\N		2018-04-16 10:56:00	\N		36	\N	t	f	2018-04-16 10:56:47.771407	2018-04-16 10:56:47.771407	2	\N	\N	f	\N
23	21	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-16 12:12:55.283371	2018-04-16 12:12:55.283371	1	140	139	\N	\N
24	22	\N		2018-04-17 12:15:00	\N		36	\N	t	f	2018-04-16 12:15:10.434808	2018-04-16 12:15:10.439988	\N	140	139	f	\N
25	25	\N		2018-04-17 12:32:00	\N		36	\N	t	f	2018-04-16 12:32:14.775482	2018-04-16 12:32:14.781411	\N	140	139	f	\N
18	16	\N		2018-04-17 10:54:00	\N		36	\N	t	f	2018-04-16 10:54:44.310448	2018-04-16 12:33:50.008946	\N	140	139	t	\N
26	13	\N		2018-04-17 12:46:00	\N		36	\N	t	f	2018-04-16 12:46:12.752019	2018-04-16 12:46:12.752019	\N	140	136	f	\N
27	36	2		2018-04-24 11:30:00	\N		135	\N	t	f	2018-04-18 16:30:37.857716	2018-04-18 16:30:37.857716	2	\N	\N	f	\N
28	41	8		2018-04-19 16:31:00	\N		135	\N	t	f	2018-04-18 16:32:04.065888	2018-04-18 16:32:04.065888	1	36	144	f	\N
29	40	2		2018-04-30 16:32:00	\N		135	\N	t	f	2018-04-18 16:33:16.263039	2018-04-18 16:33:16.263039	1	135	144	f	\N
30	39	8		2018-04-19 11:30:00	\N		135	\N	t	f	2018-04-18 16:34:42.780332	2018-04-18 16:34:42.780332	1	141	144	f	\N
31	38	2		2018-04-19 16:35:00	\N		135	\N	t	f	2018-04-18 16:35:18.804256	2018-04-18 16:35:18.804256	2	\N	\N	f	\N
32	37	7		2018-04-26 16:30:00	\N		135	\N	t	f	2018-04-18 16:36:11.319956	2018-04-18 16:36:11.319956	1	\N	\N	f	\N
33	44	1	<p>wants to see dr mansah</p>	2018-04-20 01:40:00	\N		145	\N	t	f	2018-04-18 22:39:54.255696	2018-04-18 22:39:54.255696	1	\N	\N	f	\N
34	45	8	<p>ghn</p>	2018-04-25 06:46:00	\N		145	\N	t	f	2018-04-18 22:48:02.275589	2018-04-18 22:48:02.275589	1	145	146	f	\N
35	47	8	<p>delicer at office&nbsp;</p>	2018-04-26 13:41:00	\N		145	\N	t	f	2018-04-19 13:41:57.311728	2018-04-19 13:41:57.311728	1	135	146	f	\N
36	48	8	<p>none&nbsp;</p>	2018-05-03 14:47:00	\N		145	\N	t	f	2018-04-19 13:47:37.733555	2018-04-19 13:47:37.733555	1	\N	\N	f	\N
37	46	8		2018-04-30 16:49:00	\N	<p>repated called&nbsp;</p>	145	\N	t	f	2018-04-19 13:49:05.55278	2018-04-19 13:49:05.55278	1	\N	\N	f	\N
38	51	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 14:02:01.505264	2018-04-19 14:02:01.505264	1	140	146	\N	\N
39	50	1	<p>headaches</p>	2018-04-25 17:03:00	\N	<p>seeing dr nkansah</p>	145	\N	t	f	2018-04-19 14:03:35.297706	2018-04-19 14:03:35.297706	1	\N	\N	f	\N
40	50	1	<p>headaches</p>	2018-04-25 17:03:00	\N	<p>seeing dr nkansah</p>	145	\N	t	f	2018-04-19 14:03:36.097094	2018-04-19 14:03:36.097094	1	\N	\N	f	\N
41	56	8		2018-04-19 22:24:00	\N		145	\N	t	f	2018-04-19 19:25:00.797386	2018-04-19 19:25:00.804381	1	140	146	f	\N
42	57	8		2018-04-30 08:28:00	\N		145	\N	t	f	2018-04-19 19:29:03.503311	2018-04-19 19:29:03.509153	2	140	146	f	\N
43	58	3		2018-04-24 22:35:00	\N		145	\N	t	f	2018-04-19 19:46:15.541947	2018-04-19 19:46:15.547946	1	140	146	f	\N
44	59	4		2018-05-01 22:48:00	\N		145	\N	t	f	2018-04-19 19:48:55.846387	2018-04-19 19:48:55.852673	2	140	146	f	\N
45	69	2		2018-04-28 12:06:00	\N		149	\N	t	f	2018-04-20 11:10:12.715118	2018-04-20 11:10:12.715118	\N	145	156	f	\N
46	65	2		2018-04-21 09:13:00	\N		149	\N	t	f	2018-04-20 11:14:49.68636	2018-04-20 11:14:49.68636	1	\N	\N	f	\N
47	68	8		2018-04-20 11:37:00	\N		135	\N	t	f	2018-04-20 11:37:13.470645	2018-04-20 11:37:13.470645	1	\N	\N	f	\N
48	67	2		2018-04-20 11:43:00	\N		135	\N	t	f	2018-04-20 11:46:06.797852	2018-04-20 11:46:06.797852	2	140	156	f	\N
49	55	1	<p><span style="font-family: verdana, arial, helvetica, sans-serif; font-size: 13px; background-color: #f1f1f1;">Diarrhoea</span></p>	2018-04-21 16:42:00	\N		158	\N	t	f	2018-04-20 16:42:39.164944	2018-04-20 16:42:39.164944	1	\N	\N	f	\N
50	72	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-21 05:18:56.264678	2018-04-21 05:18:56.264678	2	140	159	\N	\N
51	75	8	<p>ghana</p>	2018-04-21 09:25:00	\N	<p>gahana&nbsp;</p>	145	\N	t	f	2018-04-21 06:27:31.68926	2018-04-21 06:27:31.68926	2	145	159	f	\N
52	76	8	<p>ghg</p>	2018-04-24 09:26:00	\N	<p>ghana</p>	145	\N	t	f	2018-04-21 06:30:10.605394	2018-04-21 06:30:10.605394	1	\N	\N	f	\N
53	77	8	<p>gh</p>	2018-04-21 09:31:00	\N	<p>gh</p>	145	\N	t	f	2018-04-21 06:32:13.271139	2018-04-21 06:32:13.29185	2	140	159	f	\N
54	78	8	<p>gh</p>	2018-04-21 09:35:00	\N	<p>gh</p>	145	\N	t	f	2018-04-21 06:36:00.334693	2018-04-21 06:36:00.342266	2	140	159	f	\N
55	99	8	<p>Personal consultation</p>	2018-04-25 17:42:00	\N	<p>will see you</p>	135	\N	t	f	2018-04-23 17:43:04.226005	2018-04-23 17:43:04.226005	2	142	137	f	\N
56	97	8		2018-05-04 17:52:00	\N		135	\N	t	f	2018-04-23 17:52:54.00627	2018-04-23 17:52:54.00627	1	\N	\N	f	\N
57	101	3	<p>Regular diet check ups</p>	2018-04-27 17:53:00	\N	<p>will be going</p>	135	\N	t	f	2018-04-23 17:54:04.197265	2018-04-23 17:54:04.197265	1	36	137	f	\N
58	96	1	<p>Stomach upset</p>	2018-04-30 17:55:00	\N		135	\N	t	f	2018-04-23 17:56:00.820986	2018-04-23 17:56:00.820986	2	148	137	f	\N
59	91	8		2018-04-23 17:56:00	\N		135	\N	t	f	2018-04-23 17:57:05.362305	2018-04-23 17:57:05.362305	1	\N	\N	f	\N
60	7	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-23 17:58:55.594922	2018-04-23 17:58:55.594922	1	140	137	\N	\N
61	105	8		2018-05-08 01:19:00	\N		145	\N	t	f	2018-04-23 22:20:12.780013	2018-04-23 22:20:12.780013	2	153	155	f	\N
62	111	1		2018-04-27 10:00:00	\N		135	\N	t	f	2018-04-26 12:06:47.94315	2018-04-26 12:06:47.94315	1	\N	\N	f	\N
63	112	2		2018-04-27 12:07:00	\N		135	\N	t	f	2018-04-26 12:07:53.153936	2018-04-26 12:07:53.153936	1	\N	\N	f	\N
64	113	8		2018-04-30 12:00:00	\N		135	\N	t	f	2018-04-26 12:09:27.99686	2018-04-26 12:09:27.99686	1	140	179	f	\N
65	114	8		2018-04-26 12:10:00	\N		135	\N	t	f	2018-04-26 12:10:20.097911	2018-04-26 12:10:20.097911	1	\N	\N	f	\N
66	115	1		2018-04-26 12:11:00	\N		135	\N	t	f	2018-04-26 12:11:40.388429	2018-04-26 12:11:40.388429	2	140	179	f	\N
67	116	5		2018-04-26 12:13:00	\N		135	\N	t	f	2018-04-26 12:13:33.381071	2018-04-26 12:13:33.381071	1	157	179	f	\N
68	117	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 12:20:50.331833	2018-04-26 12:20:50.331833	1	140	179	\N	\N
22	14	\N		\N	\N		36	\N	t	f	2018-04-16 11:57:33.596145	2018-06-07 17:20:59.675696	1	140	137	t	\N
70	150	1		2018-05-02 22:01:00	\N		145	\N	t	f	2018-05-02 19:01:31.057118	2018-05-02 19:01:31.057118	1	\N	146	f	\N
71	153	1		2018-05-02 22:09:00	\N		145	\N	t	f	2018-05-02 19:10:02.59445	2018-05-02 19:10:02.600692	1	140	146	f	\N
72	167	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-04 14:34:17.667042	2018-05-04 14:34:17.667042	1	\N	216	\N	\N
19	17	\N		2018-04-17 10:55:00	\N		36	\N	t	f	2018-04-16 10:55:23.41787	2018-06-08 16:21:44.46954	\N	140	139	t	\N
73	167	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-04 14:34:20.726557	2018-05-04 14:34:20.726557	1	\N	216	\N	\N
74	167	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-04 14:34:55.406941	2018-05-04 14:34:55.406941	1	\N	216	\N	\N
75	167	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-04 14:44:02.678309	2018-05-04 14:44:02.678309	1	155	216	\N	\N
76	168	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-04 15:25:09.647386	2018-05-04 15:25:09.647386	1	140	208	\N	\N
77	169	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-05 14:31:52.709112	2018-05-05 14:31:52.709112	1	228	229	\N	\N
78	171	9		2018-05-08 23:14:00	\N		149	\N	t	f	2018-05-05 22:14:06.915826	2018-05-05 22:14:06.915826	3	230	137	f	\N
79	172	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-05 22:22:32.460186	2018-05-05 22:22:32.460186	3	230	136	\N	\N
80	170	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-05 22:22:52.019321	2018-05-05 22:22:52.019321	3	230	137	\N	\N
81	173	1		2018-05-08 10:05:00	\N		135	\N	t	f	2018-05-07 15:06:33.605349	2018-05-07 15:06:33.605349	1	\N	232	f	\N
82	174	8		2018-05-08 15:07:00	\N		135	\N	t	f	2018-05-07 15:08:08.521602	2018-05-07 15:08:08.521602	1	228	232	f	\N
83	175	3	<p>none</p>	2018-05-09 15:08:00	\N		135	\N	t	f	2018-05-07 15:09:15.814312	2018-05-07 15:09:15.814312	1	\N	232	f	\N
84	175	3	<p>none</p>	2018-05-09 15:08:00	\N	<p>none</p>	135	\N	t	f	2018-05-07 15:09:41.592487	2018-05-07 15:09:41.592487	1	\N	232	f	\N
85	177	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-08 20:33:21.86559	2018-05-08 20:33:21.86559	1	230	193	\N	\N
86	176	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-08 20:33:45.346067	2018-05-08 20:33:45.346067	1	230	232	\N	\N
87	179	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-09 09:38:38.777165	2018-05-09 09:38:38.777165	1	236	234	\N	\N
88	182	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-09 15:47:40.853954	2018-05-09 15:47:40.853954	3	230	237	\N	\N
89	184	9		2018-05-12 16:55:00	\N		149	\N	t	f	2018-05-09 15:54:30.682408	2018-05-09 15:54:30.689815	3	230	237	f	\N
90	189	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-10 02:58:42.493652	2018-05-10 02:58:42.493652	1	238	239	\N	\N
137	185	\N	Medical 	2018-06-13 13:26:00	\N	\N	\N	\N	t	f	2018-06-07 15:00:56.707692	2018-06-07 15:03:10.081156	1	\N	146	f	192
92	193	\N		2018-05-22 06:10:00	\N		145	\N	t	f	2018-05-10 03:10:42.038315	2018-05-10 03:10:42.044121	1	238	239	f	\N
93	192	1		2018-05-28 06:11:00	\N		145	\N	t	f	2018-05-10 03:12:18.511505	2018-05-10 03:12:18.511505	1	\N	239	f	\N
91	194	1		2018-05-30 06:07:00	\N		145	\N	t	f	2018-05-10 03:07:33.851371	2018-05-10 15:12:44.334374	1	238	239	f	\N
94	196	1		2018-05-10 18:20:00	\N		145	\N	t	f	2018-05-10 15:20:25.140373	2018-05-10 15:20:25.140373	1	\N	239	f	\N
95	202	6		2018-05-28 18:24:00	\N		145	\N	t	f	2018-05-10 15:29:07.404314	2018-05-10 15:29:07.404314	1	\N	239	f	\N
96	201	8		2018-05-10 18:30:00	\N		145	\N	t	f	2018-05-10 15:30:45.529508	2018-05-10 15:30:45.535818	1	238	239	f	\N
97	200	1		2018-05-28 18:31:00	\N		145	\N	t	f	2018-05-10 15:31:22.7592	2018-05-10 15:31:22.765046	4	238	239	f	\N
98	199	1		2018-05-21 18:31:00	\N		145	\N	t	f	2018-05-10 15:32:03.703366	2018-05-10 15:32:03.7094	1	238	239	f	\N
99	198	1		2018-05-29 18:33:00	\N		145	\N	t	f	2018-05-10 15:34:01.684335	2018-05-10 15:34:01.684335	4	\N	239	f	\N
100	197	\N		2018-05-17 18:36:00	\N		145	\N	t	f	2018-05-10 15:36:31.124925	2018-05-10 15:36:31.124925	4	\N	239	f	\N
101	195	\N		2018-05-10 18:37:00	\N		145	\N	t	f	2018-05-10 15:38:50.159259	2018-05-10 15:38:50.159259	4	155	139	f	\N
102	191	\N		2018-05-17 18:39:00	\N		145	\N	t	f	2018-05-10 15:40:03.513882	2018-05-10 15:40:03.513882	4	155	239	f	\N
103	190	\N		2018-06-29 18:40:00	\N		145	\N	t	f	2018-05-10 15:41:25.630145	2018-05-10 15:41:25.630145	1	\N	239	f	\N
104	188	\N	<p>wdfsfs</p>	2018-06-29 18:42:00	\N		145	\N	t	f	2018-05-10 15:42:39.153479	2018-05-10 15:42:39.153479	1	\N	239	f	\N
105	187	\N		2018-05-24 18:44:00	\N		145	\N	t	f	2018-05-10 15:47:24.958618	2018-05-10 15:47:24.958618	1	\N	239	f	\N
106	186	1		2018-05-31 18:47:00	\N		145	\N	t	f	2018-05-10 15:47:56.48111	2018-05-10 15:47:56.48111	4	\N	239	f	\N
107	206	\N		2018-05-10 17:06:00	\N		135	\N	t	f	2018-05-10 17:06:45.467803	2018-05-10 17:06:45.467803	1	\N	136	f	\N
108	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 13:58:42.193598	2018-06-06 13:58:42.193598	2	140	193	f	\N
109	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 14:01:47.35414	2018-06-06 14:01:47.35414	2	140	193	f	\N
110	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 14:03:01.688459	2018-06-06 14:03:01.688459	2	140	193	f	\N
111	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:12:12.861485	2018-06-06 15:12:12.861485	2	140	193	f	\N
112	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:16:27.399633	2018-06-06 15:16:27.399633	2	140	193	f	\N
113	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:17:08.408162	2018-06-06 15:17:08.408162	2	140	193	f	\N
114	211	\N	\N	2018-06-07 10:47:00	\N	\N	\N	\N	t	f	2018-06-06 15:19:41.489834	2018-06-06 15:19:41.489834	1	140	137	f	\N
115	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:24:43.673816	2018-06-06 15:24:43.673816	2	140	193	f	\N
116	211	\N	\N	2018-06-07 10:47:00	\N	\N	\N	\N	t	f	2018-06-06 15:25:46.880348	2018-06-06 15:25:46.880348	1	140	137	f	\N
120	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 15:45:21.831477	2018-06-06 15:45:21.831477	1	140	137	f	\N
121	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 15:57:50.464499	2018-06-06 15:57:50.464499	1	140	137	f	\N
122	218	\N	fa	2018-06-06 21:32:00	\N	\N	\N	\N	t	f	2018-06-06 15:59:59.856901	2018-06-06 15:59:59.856901	\N	140	137	f	\N
123	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 16:01:07.215318	2018-06-06 16:01:07.215318	1	140	137	f	\N
124	218	\N	fa	2018-06-06 21:32:00	\N	\N	\N	\N	t	f	2018-06-06 16:01:44.827468	2018-06-06 16:01:44.827468	\N	140	137	f	\N
125	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 16:02:14.793244	2018-06-06 16:02:14.793244	1	140	137	f	\N
126	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 16:02:26.881008	2018-06-06 16:02:26.881008	1	140	137	f	\N
127	218	\N	fa	2018-06-06 21:32:00	\N	\N	\N	\N	t	f	2018-06-06 16:08:48.282568	2018-06-06 16:08:48.282568	\N	140	137	f	\N
129	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 16:17:17.502047	2018-06-06 16:17:17.502047	1	140	137	f	\N
131	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-07 10:19:04.821304	2018-06-07 10:19:04.821304	1	140	137	f	\N
132	226	1		2018-06-08 11:00:00	\N		158	\N	t	f	2018-06-07 11:00:23.634516	2018-06-07 11:00:23.634516	1	\N	247	f	\N
133	224	\N	\N	\N	\N	\N	\N	\N	t	f	2018-06-07 11:08:09.34588	2018-06-07 11:08:09.34588	1	248	247	\N	\N
134	227	\N	Want to make free night call with you	2018-06-08 12:04:00	\N	\N	\N	\N	t	f	2018-06-07 12:14:30.552396	2018-06-07 12:14:30.552396	\N	248	247	f	\N
135	185	\N	Medical 	2018-06-13 13:26:00	\N	\N	\N	\N	t	f	2018-06-07 14:42:12.865336	2018-06-07 14:42:12.865336	1	192	146	f	\N
136	185	\N	Medical 	2018-06-13 13:26:00	\N	\N	\N	\N	t	f	2018-06-07 14:46:10.588214	2018-06-07 14:46:10.588214	1	192	146	f	\N
128	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 16:13:05.379431	2018-06-08 17:13:26.131413	2	140	193	t	\N
69	149	\N	<p>Wound&nbsp;dressing&nbsp;</p>	2018-05-03 12:08:00	\N		36	\N	t	f	2018-05-02 12:08:21.677971	2018-06-07 15:03:13.863519	1	\N	193	f	192
138	206	\N		2018-06-07 16:52:00	\N	\N	\N	\N	t	f	2018-06-07 16:52:48.06485	2018-06-07 16:52:48.06485	1	248	136	f	\N
139	145	\N	None	2018-06-28 16:53:00	\N	\N	\N	\N	t	f	2018-06-07 16:54:49.193239	2018-06-07 16:54:49.193239	\N	248	137	f	\N
140	171	\N		2018-06-13 16:54:00	\N	\N	\N	\N	t	f	2018-06-07 16:54:52.914648	2018-06-07 16:54:52.914648	3	248	137	f	\N
130	211	\N	\N	2018-06-07 10:47:00	\N	\N	\N	\N	t	f	2018-06-07 10:05:32.297543	2018-06-07 17:05:13.718783	1	140	137	t	\N
119	211	\N	\N	2018-06-07 10:47:00	\N	\N	\N	\N	t	f	2018-06-06 15:33:12.693763	2018-06-08 09:29:15.515493	1	140	137	t	\N
141	160	\N	Consult	2018-06-22 16:53:00	\N	\N	\N	\N	t	f	2018-06-08 09:58:41.67505	2018-06-08 09:58:41.67505	\N	248	159	f	\N
142	227	\N	Want to make free night call with you	2018-06-08 12:04:00	\N	\N	\N	\N	t	f	2018-06-08 09:59:21.252423	2018-06-08 09:59:21.252423	\N	248	247	f	\N
118	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:32:57.970181	2018-06-08 17:16:48.961371	2	140	193	t	\N
117	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:28:20.332366	2018-06-08 17:20:54.720568	2	140	193	t	\N
143	193	\N	Doddy	2018-06-21 19:46:00	\N	\N	\N	\N	t	f	2018-06-10 19:48:37.891825	2018-06-10 19:48:37.891825	\N	248	239	f	\N
144	138	\N	None	2018-06-19 16:54:00	\N	\N	\N	\N	t	f	2018-06-10 20:23:20.505465	2018-06-10 20:23:20.505465	1	248	137	f	\N
145	211	\N	\N	2018-06-07 16:51:00	\N	\N	\N	\N	t	f	2018-06-10 20:23:40.024415	2018-06-10 20:23:40.024415	1	248	137	f	\N
146	140	\N	Home	2018-06-10 20:21:00	\N	\N	\N	\N	t	f	2018-06-10 20:23:46.095019	2018-06-10 20:23:46.095019	\N	248	137	f	\N
147	154	\N	Ha 	2018-06-10 20:22:00	\N	\N	\N	\N	t	f	2018-06-10 20:23:49.982393	2018-06-10 20:23:49.982393	1	248	146	f	\N
\.


--
-- Name: confirmed_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('confirmed_appointments_id_seq', 147, true);


--
-- Data for Name: confirmed_conditions; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY confirmed_conditions (id, confirmed_appointment_id, condition_id, allergy_id, comment, user_id, entity, active_status, del_status, created_at, updated_at) FROM stdin;
\.


--
-- Name: confirmed_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('confirmed_conditions_id_seq', 1, false);


--
-- Data for Name: confirmed_personal_doctor_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY confirmed_personal_doctor_services (id, doctor_id, patient_id, comment, entity_id, user_id, active_status, del_status, created_at, updated_at, pre_appointment_id, suburb_id, appointment_type_id, confirmed_appointment_id) FROM stdin;
1	140	136		\N	\N	t	f	2018-04-13 16:59:01.060295	2018-04-13 16:59:01.060295	12	2	PD	14
2	140	136		\N	\N	t	f	2018-04-13 17:06:55.557897	2018-04-13 17:06:55.557897	12	2	PD	15
3	140	136		\N	\N	t	f	2018-04-13 17:08:39.995545	2018-04-13 17:08:39.995545	12	2	PD	16
4	140	136		\N	\N	t	f	2018-04-13 17:09:25.662856	2018-04-13 17:09:25.662856	12	2	PD	17
5	140	139		\N	\N	t	f	2018-04-16 12:12:55.289118	2018-04-16 12:12:55.289118	21	1	PD	23
6	140	139	\N	\N	36	t	f	2018-04-16 12:15:10.442559	2018-04-16 12:15:10.442559	22	1	DP	24
7	140	139	\N	\N	36	t	f	2018-04-16 12:32:14.784221	2018-04-16 12:32:14.784221	25	1	PC	25
8	140	146	a big man	\N	\N	t	f	2018-04-19 14:02:01.511015	2018-04-19 14:02:01.511015	51	1	PD	38
9	140	146	\N	\N	145	t	f	2018-04-19 19:25:00.80743	2018-04-19 19:25:00.80743	56	1	PC	41
10	140	146	\N	\N	145	t	f	2018-04-19 19:29:03.51202	2018-04-19 19:29:03.51202	57	1	DP	42
11	140	146	\N	\N	145	t	f	2018-04-19 19:46:15.550721	2018-04-19 19:46:15.550721	58	1	PDHC	43
12	140	146	\N	\N	145	t	f	2018-04-19 19:48:55.855545	2018-04-19 19:48:55.855545	59	1	PDHC	44
13	140	159		\N	\N	t	f	2018-04-21 05:18:56.270474	2018-04-21 05:18:56.270474	72	2	PD	50
14	140	159	\N	\N	145	t	f	2018-04-21 06:32:13.294939	2018-04-21 06:32:13.294939	77	2	PC	53
15	140	159	\N	\N	145	t	f	2018-04-21 06:36:00.345893	2018-04-21 06:36:00.345893	78	2	PDHC	54
16	140	137	Will be assigned	\N	\N	t	f	2018-04-23 17:58:55.600192	2018-04-23 17:58:55.600192	7	1	PD	60
17	140	179		\N	\N	t	f	2018-04-26 12:20:50.337815	2018-04-26 12:20:50.337815	117	1	PD	68
18	140	146	\N	\N	145	t	f	2018-05-02 19:10:02.603803	2018-05-02 19:10:02.603803	153	1	PDVC	71
19	155	216		\N	\N	t	f	2018-05-04 14:44:02.689387	2018-05-04 14:44:02.689387	167	1	PD	75
20	140	208		\N	\N	t	f	2018-05-04 15:25:09.652804	2018-05-04 15:25:09.652804	168	1	PD	76
21	228	229		\N	\N	t	f	2018-05-05 14:31:52.714775	2018-05-05 14:31:52.714775	169	1	PD	77
22	230	136		\N	\N	t	f	2018-05-05 22:22:32.465965	2018-05-05 22:22:32.465965	172	3	PD	79
23	230	137		\N	\N	t	f	2018-05-05 22:22:52.024997	2018-05-05 22:22:52.024997	170	3	PD	80
24	230	193	Health check	\N	\N	t	f	2018-05-08 20:33:21.871349	2018-05-08 20:33:21.871349	177	1	PD	85
25	230	232		\N	\N	f	f	2018-05-08 20:33:45.35169	2018-05-08 21:55:15.804721	176	1	PD	86
26	236	234		\N	\N	t	f	2018-05-09 09:38:38.782349	2018-05-09 09:38:38.782349	179	1	PD	87
27	230	237	correct	\N	\N	t	f	2018-05-09 15:47:40.859556	2018-05-09 15:47:40.859556	182	3	PD	88
28	230	237	\N	\N	149	t	f	2018-05-09 15:54:30.693787	2018-05-09 15:54:30.693787	184	3	PC	89
29	238	239		\N	\N	t	f	2018-05-10 02:58:42.499112	2018-05-10 02:58:42.499112	189	1	PD	90
30	238	239	\N	\N	145	t	f	2018-05-10 03:07:33.86056	2018-05-10 03:07:33.86056	194	1	PDHC	91
31	238	239	\N	\N	145	t	f	2018-05-10 03:10:42.046993	2018-05-10 03:10:42.046993	193	1	PDVC	92
32	238	239	\N	\N	145	t	f	2018-05-10 15:30:45.538737	2018-05-10 15:30:45.538737	201	1	PDHC	96
33	238	239	\N	\N	145	t	f	2018-05-10 15:31:22.767821	2018-05-10 15:31:22.767821	200	1	PDHC	97
34	238	239	\N	\N	145	t	f	2018-05-10 15:32:03.712201	2018-05-10 15:32:03.712201	199	1	PDVC	98
35	248	247		\N	\N	t	f	2018-06-07 11:08:09.351578	2018-06-07 11:08:09.351578	224	1	PD	133
\.


--
-- Name: confirmed_personal_doctor_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('confirmed_personal_doctor_services_id_seq', 35, true);


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
-- Data for Name: decline_comments; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY decline_comments (id, pre_confirmed_appointment_id, available_date, comment, active_status, del_status, created_at, updated_at, doctor_id, nurse_id) FROM stdin;
1	16	2018-06-07 18:33:00	I cannot be available	t	f	2018-06-06 18:33:35.735873	2018-06-06 18:33:35.735873	140	\N
2	16	2018-06-07 18:34:00	Cnt be aroound 	t	f	2018-06-06 18:34:38.419063	2018-06-06 18:34:38.419063	140	\N
3	16	2018-06-07 18:36:00	dfkdtj kjdkf dfk 	t	f	2018-06-06 18:36:42.367305	2018-06-06 18:36:42.367305	140	\N
4	16	2018-06-07 18:37:00	dfkjd fdj kdj l;dkj dkljf dkfjdfhd kjfhl f \r\nd kjdl hdjh d	t	f	2018-06-06 18:37:58.995325	2018-06-06 18:37:58.995325	140	\N
5	16	2018-06-08 18:39:00	rtrt	t	f	2018-06-06 18:39:05.039217	2018-06-06 18:39:05.039217	140	\N
6	16	2018-06-07 18:40:00	df df dfd 	t	f	2018-06-06 18:40:52.492712	2018-06-06 18:40:52.492712	140	\N
7	16	2018-06-13 18:43:00	df df 	t	f	2018-06-06 18:43:40.42516	2018-06-06 18:43:40.42516	140	\N
8	11	2018-06-19 09:12:00	d kjdkf kjfldk j d	t	f	2018-06-07 09:13:32.063012	2018-06-07 09:13:32.063012	140	\N
9	16	2018-06-08 09:16:00	dk jdl djk ljsda jt kljdk j;dkl fjd;skf jdkfj djfdkjfkd jkdj kdj d dkjsktj klj kdlje k ldskfj; kd kdj;fkl djf	t	f	2018-06-07 09:16:27.631068	2018-06-07 09:16:27.631068	140	\N
10	16	2018-06-08 09:33:00	dfj kdljf kdjfk jd;lkfj df	t	f	2018-06-07 09:33:12.539569	2018-06-07 09:33:12.539569	140	\N
11	16	2018-06-07 09:34:00	df dfdfdfdf df 	t	f	2018-06-07 09:34:41.920811	2018-06-07 09:34:41.920811	140	\N
12	16	2018-06-07 09:42:00	klklk;lkl	t	f	2018-06-07 09:42:09.236992	2018-06-07 09:42:09.236992	140	\N
13	16	2018-06-08 09:57:00	kjkj	t	f	2018-06-07 09:57:20.249287	2018-06-07 09:57:20.249287	140	\N
14	16	2018-06-07 09:59:00	dsfdsf 	t	f	2018-06-07 09:59:25.912301	2018-06-07 09:59:25.912301	140	\N
15	16	2018-06-08 10:11:00	I cannot make it 	t	f	2018-06-07 10:11:14.725543	2018-06-07 10:11:14.725543	140	\N
16	3	2018-06-08 11:14:00	dsfdfd fdfdfd f	t	f	2018-06-07 11:14:09.351204	2018-06-07 11:14:09.351204	140	\N
17	16	2018-06-07 11:56:00	dfdfdfd 	t	f	2018-06-07 11:56:58.840114	2018-06-07 11:56:58.840114	140	\N
18	11	2018-06-14 11:58:00	ghgjhgh	t	f	2018-06-07 11:58:34.799971	2018-06-07 11:58:34.799971	140	\N
19	28	2018-06-08 14:49:00	have ldjkfk djf dkfjl kdf d	t	f	2018-06-07 14:49:34.618048	2018-06-07 14:49:34.618048	192	\N
20	28	2018-06-08 15:00:00	clemse kjd df erdlfjd d 	t	f	2018-06-07 15:00:19.861631	2018-06-07 15:00:19.861631	\N	192
\.


--
-- Name: decline_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('decline_comments_id_seq', 20, true);


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
1	19	\N	\N	\N	\N	\N	2018-04-16 10:02:23.800187	2018-04-16 10:02:23.800187	voting1.png	image/png	264268	2018-04-16 10:02:23.299645
\.


--
-- Name: lab_detail_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('lab_detail_images_id_seq', 1, true);


--
-- Data for Name: lab_details; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY lab_details (id, pre_appointment_id, lab_service_id, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	19	1		\N	t	f	2018-04-16 10:02:23.809939	2018-04-16 10:02:23.809939
2	19	2		\N	t	f	2018-04-16 10:02:23.811755	2018-04-16 10:02:23.811755
3	27	1		\N	t	f	2018-04-16 12:36:46.36277	2018-04-16 12:36:46.36277
4	38	1		\N	t	f	2018-04-18 16:18:56.18681	2018-04-18 16:18:56.18681
\.


--
-- Name: lab_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('lab_details_id_seq', 4, true);


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
10	Bypass Test	100000.0			t	f	2018-04-23 12:07:21.755176	2018-04-23 12:07:21.755176
\.


--
-- Name: lab_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('lab_services_id_seq', 10, true);


--
-- Data for Name: password_table; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY password_table (id, password, mobile_number, created_at, status, username) FROM stdin;
120	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	024679875544	09:26:58.321914	t	paddy123
124	ffff233db410e5acf113cff436edf4e8ec9d3d4284136219667294d674378e30	444444	00:54:48.916172	t	drpaddy
127	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0277234567	14:36:23.745325	t	andy
128	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0277412356	15:16:44.663477	t	andrew
131	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	0249013344	16:02:18.660184	t	johnson
132	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0249737027	21:10:47.35314	t	paddy3
134	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0264680508	10:26:50.166799	t	senior
121	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541000000	09:33:38.00911	t	clementine1
122	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541200000	09:36:54.796703	t	clementine2
125	5f5d906024bedc60d3998a753fb800074f39a2c5fde6ac6b10239044084ad06d	455778	01:37:13.305435	t	patpaddy
129	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	027789456	13:00:47.836593	t	mina
133	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0276624567	11:12:20.013384	t	paddy4
1	03b6a8383bf6bf35253263ed02584d098ed48e570c1f31d5cb9aec883e556918	0245667787	12:09:33.299315	t	andy
2	d169aa18ee15483aef92fb71a3eed0031e8d74715652e213a85fc66965edbed7	0541840988	12:51:56.696992	t	paddy
3	555cf638ea8288ac324dafe31787122f31c8d8d5825c6fb52b654aa01233f2b3	0248021199	12:53:09.452441	t	clara
4	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0248029911	12:54:03.715402	t	mady
5	555cf638ea8288ac324dafe31787122f31c8d8d5825c6fb52b654aa01233f2b3	0248021199                                        	12:57:44.365379	t	clara
6	d169aa18ee15483aef92fb71a3eed0031e8d74715652e213a85fc66965edbed7	0541840988                                        	13:02:17.111951	t	paddy
7	c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646	0504899386 	13:15:29.872133	t	niimistic 
8	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	0243554422	13:17:28.456807	t	davi
9	c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646	0504899386                                        	13:21:38.591076	t	niimistic 
10	f348d5628621f3d8f59c8cabda0f8eb0aa7e0514a90be7571020b1336f26c113	0202233117	15:56:05.555954	t	doctor
11	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243668890	11:20:57.685419	t	ago
12	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243668890                                        	11:21:53.25613	t	ago
13	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0558029911	17:19:25.649761	t	maddy
14	263a601c948f2cdcb7521365a8b83120096121a618938ef1291a8de02f3837b8	0241230000	11:45:29.697408	t	kwamedanso
15	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0241889900	15:01:12.411274	t	kwame
16	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0241889900                                        	15:02:02.017119	t	kwame
17	c946f701a3b98b8ec1e4ed93de689450acba912910c28a945d7593982a29fd79	0266000350	15:57:26.025248	t	jerry
18	c946f701a3b98b8ec1e4ed93de689450acba912910c28a945d7593982a29fd79	0266000350                                        	16:02:00.092793	t	jerry
19	8ddc17508748f3a7d0e55516d63ca55f6732fd1908e6ad95e9d2dfa32be8239d	444444r	20:38:04.403802	t	joni1
20	f13620bae6ddbf35650f1add7ef56a720a73198cec3944fb01731ca72bd98389	0245667790	22:21:38.201863	t	kobby
21	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0265110090	22:28:30.578733	t	oscar
22	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0265110098	22:32:33.110436	t	oscar1
23	ecb93e1590e08c3f17be82b54932ae78926d606d57d2f680377b82d7d20b2dcf	0549001123	09:57:47.279279	t	sweetness
24	8ddc17508748f3a7d0e55516d63ca55f6732fd1908e6ad95e9d2dfa32be8239d	444444r                                           	11:04:05.041474	t	joni1
25	263a601c948f2cdcb7521365a8b83120096121a618938ef1291a8de02f3837b8	0241230000                                        	11:08:01.460786	t	kwamedanso
26	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0567445533	11:16:50.560324	t	clarence
27	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	0578001100	11:36:28.955232	t	jon
28	3c64d02e75dab84df045b1486db6ff8b3967715cd2e0ee333e4c6c79f8db7f7a	0200000000	16:14:10.44749	t	jason
29	05a3a662c87fecce26130eafef769697ea4f95d8c3249409512b7fe9bc39f45d	0261111111	18:43:10.833188	t	adzah
30	6dccb5fa4402fe7f15fb887a20a7c4ddccfc17594c9777382da09931a17138a5	+233244444329	05:58:43.303923	t	drkusmeister
31	bbd617ad5ab21eca0ed7d0895e76ae062bc99ddbf2ea0e3fc81123e5ee4ca7a6	4444445	06:20:49.083729	t	gloria
32	6dccb5fa4402fe7f15fb887a20a7c4ddccfc17594c9777382da09931a17138a5	+233244444329                                     	07:06:36.024795	t	drkusmeister
33	bbd617ad5ab21eca0ed7d0895e76ae062bc99ddbf2ea0e3fc81123e5ee4ca7a6	4444445                                           	07:15:27.1304	t	gloria
34	92b7495bead46124bc6baa6616f19b9f7783e03c81595f33e01a2204713a6cf6	546678	07:24:51.874679	t	kobby2
35	2a53a7cb14c711408babca8a8444cbb1d7e81c5c744bcc7fc9f2f26403266450	44444444	07:52:23.672204	t	drkoku
36	2a53a7cb14c711408babca8a8444cbb1d7e81c5c744bcc7fc9f2f26403266450	44444444                                          	07:55:53.384864	t	drkoku
37	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0201234467	10:47:19.887957	t	nii
38	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0201234467                                        	10:49:37.834693	t	nii
39	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	027507907	12:52:50.020152	t	naa
40	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	027507907                                         	12:53:41.341669	t	naa
41	a8447567d3aa5c32a3f197d9156a34fbd820f9290e8cccdcc640422f7aa7e147	99887766	13:27:31.044665	t	patmercy
42	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0543901100	16:08:20.788268	t	claradoc
43	b2036656b8afe1586f68af792d17100fadd2ed2367c925d58d3484e4761a4f8f	445567787	05:30:54.831328	t	patemma
44	b2036656b8afe1586f68af792d17100fadd2ed2367c925d58d3484e4761a4f8f	445567787                                         	05:43:48.315829	t	patemma
45	356e20864cb22a75b64121a04606254f11da037cd533d48c6c8e855601be0c5b	45666777	10:50:47.375914	t	nursegloria
46	356e20864cb22a75b64121a04606254f11da037cd533d48c6c8e855601be0c5b	45666777                                          	10:52:02.863341	t	nursegloria
47	625b9cf31e5744733d007297e01066a44e385d4c51ef78306ed4b38e7630e844	0244574744	11:04:27.417142	t	papsicle
48	625b9cf31e5744733d007297e01066a44e385d4c51ef78306ed4b38e7630e844	0244574744                                        	11:21:46.797892	t	papsicle
49	93aa8e032ac13dc4b3eaf50cbf465d2dbf17c4a55891f2698ebf5bdfae529be8	0200000001	10:11:51.649693	t	kwakuessel
50	f2880bb1ea28995bfa68716e8e9cd74d802b6e8b73638294f8386886e981a04d	44445666	07:30:50.545616	t	nursemercy
51	cb9d7e942f9838817d3cc1ee507240eebe305dc6f1532cf92c1d28391bf67939	0200000010	17:12:13.914362	t	chale
52	cb9d7e942f9838817d3cc1ee507240eebe305dc6f1532cf92c1d28391bf67939	0200000010                                        	17:46:21.229243	t	chale
53	e5351a1b138656788e51c7dbf1baba4d0eb75bd110d1a8b498b63926b15faf4d	0200000006	22:47:59.740226	t	may
54	45a00a3962438c5abdffe4ff1c0b3a1a11a9aec76777f7a3ee240d305fb6a721	0241000000	23:01:31.033547	t	moesha
55	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0246001190	11:11:26.233019	t	ck
56	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0246001191	11:13:04.799271	t	cky
57	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0246001196	11:20:46.459751	t	ckye
58	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0246001110	11:22:23.007113	t	cke
59	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0544110099	11:38:25.57502	t	melody
60	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0544110090	11:39:23.12805	t	melodye
61	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0567990021	12:11:53.795576	t	nora
62	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0240901278	12:33:33.36311	t	yayra
63	cee71eaf4ebca669b3db4e655c75f7755f965e498541ac3a630bfecb8ee87ee0	0240000003	12:49:11.757894	t	getty
64	b592dc6a2efc7a96111b7fd118e128d47f25f2b0a5c2719e43364431b5330c88	0243000000	12:51:30.10172	t	namak
65	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0547110090	14:09:01.112727	t	hpe
66	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0567334423	14:27:55.411342	t	chizzy
67	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0567889900	16:43:05.69208	t	clemsedem
68	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0567009900	16:50:10.058555	t	asedem
69	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0549009890	08:49:30.601037	t	jj
70	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0240990011	08:52:16.759811	t	mawu
71	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0564229984	10:46:52.681989	t	padimore
72	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0578229100	11:07:47.570925	t	kenny
73	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0548988722	11:11:21.363682	t	blaq
74	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243195788	11:28:36.170261	t	arnold
75	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0203443235	11:37:58.801313	t	naa1
76	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0578990099	12:47:28.793278	t	nancy
77	0414530a84a89ce3f1d693f0376570be8cc1177bee503027cbf15d4a79d9a9f5	0540000001	15:43:40.0559	t	pat
78	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0569001123	09:57:17.295617	t	mena
79	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0569001124	10:01:18.765422	t	mensa
80	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0569001129	10:02:55.715426	t	mensah
81	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0569001126	10:03:50.103856	t	mensahs
82	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0569001160	10:04:47.611194	t	mens
83	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0249001102	10:09:13.403833	t	stev
84	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0269012209	17:42:25.271118	t	tiery
85	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0549013390	18:15:56.873811	t	mawunya
86	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0578119903	18:23:09.927861	t	davido
87	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0568910299	18:31:02.878495	t	matthew
88	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	024399010	09:05:54.557964	t	joan
89	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0249009890	11:07:57.396129	t	celest
90	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0546778299	11:44:33.009097	t	yaa
91	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0271234567	11:49:20.180029	t	yaaa
92	df4b0a3d762c150089f185b86b1bc89874cfee38c08c61db99dbd7dde57d61f8	0541840900	20:51:13.238287	t	paddy1
93	9a02247ddd864b9a04fd8a220e02a37bf375c8f47695e50e78ba8bd35c5ffbb9	0540000987	20:52:13.480061	t	paddy2
94	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0205869653	09:33:53.16873	t	maame
95	af7acf0251392b90198d89b9934c9a7f4a60d2b7765e2d673f08a3c48cb333c1	44433333	12:21:26.19443	t	nursebecky
96	ca068749082aac43d67e55ad71962e320a398b0405baa18996492b4e756a88fd	55566666	12:29:55.428859	t	nurseaugust
97	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0248109024	12:59:51.414948	t	cloe
98	022d787db18783eec27669a3b950dbeb0e48f858567b9d9fcc866a0c601c6ee4	4456777778	13:01:09.053816	t	patgloria
99	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0245892009	13:03:19.831251	t	clueh
100	17dffde774df0caff8b6997b37163d4dc671d0c2f844aea43929e980480f288e	339909999	13:18:53.814511	t	drabdul
101	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	0541840980	14:00:19.312336	t	paddydoctor
102	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	0248190033	14:26:33.168184	t	luck
103	a14e5f92c29592c7fd21e99e0a112d206cfdf4e74270e33957689840485f97cc	55678899090	15:36:20.026259	t	drchilax
104	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	0541840000	17:57:13.555589	t	paddydoc
105	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	0541840901	21:29:12.577806	t	paddydoc1
106	47ee518e8ffc2a6940ed3c973d1801748fdfe05c23938494b38e351b87d0602a	0200000011	21:35:52.964303	t	paddydocweb
107	c6a9c46899f8e648ed1ff0f926bff782e0141e39dcea7ab882b0da525e5058ff	0200000100	21:48:10.199636	t	paddydocc
108	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0269022431	12:01:30.511662	t	zeal
109	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0248109980	12:22:14.763874	t	zealous
110	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0241840988	13:34:27.394542	t	paddydocd
111	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541850993	13:50:48.247698	t	paddydoca
112	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541012100	13:56:30.915203	t	clementina
113	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0201840988	14:03:18.393564	t	clementino
114	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0201021112	14:13:00.082994	t	clementine
115	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0201234567	14:13:12.507269	t	ben
116	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0264620508	21:26:36.591725	t	frank
117	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0248110987	13:15:28.412609	t	clacla
118	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0241233778	13:19:45.172036	t	clare
119	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0249011980	13:32:22.695953	t	mom
123	e24df920078c3dd4e7e8d2442f00e5c9ab2a231bb3918d65cc50906e49ecaef4	0556296012	15:24:11.581937	t	kay
126	8a9bcf1e51e812d0af8465a8dbcc9f741064bf0af3b3d08e6b0246437c19f7fb	0266123456	09:32:48.636931	t	jerry1
130	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0278945612	16:36:28.784814	t	minaa
\.


--
-- Name: password_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('password_table_id_seq', 134, true);


--
-- Data for Name: patient_med_records; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY patient_med_records (id, confirmed_appt_id, patient_id, doctor_id, clinical_complaints, clinical_examinations, working_diagnosis, investigation_rquired, treatments, follow_up_plan, created_at, updated_at, active_status, del_status, order_status) FROM stdin;
1	18	139	140	<p>Headache</p>	<p>Maleria test</p>	<p>Maleria</p>		<p>Give a box of ACT</p>		2018-04-16 12:33:50.004025	2018-04-16 12:33:50.004025	t	f	f
2	130	137	140	<p>df djflk j</p>	<p>&nbsp;dklfjdkjf d</p>	<p>k djlfk jd</p>	<p>dlkfj kdjf</p>	<p>df kljd;kjf</p>\r\n<p>a lsdjf kjd</p>\r\n<p>d klfjdkl;fj kd</p>	<p>kdjfl;k jdkf j;dkj</p>\r\n<p>sdkj ;lksadf</p>\r\n<p>d kldj;f ds</p>\r\n<p>&nbsp;</p>	2018-06-07 17:05:13.624581	2018-06-07 17:05:13.624581	t	f	f
3	130	137	140	<p>df dklfj kdj kdj kj</p>	<p>kjlk; jdkafk</p>	<p>jkdljf; dsjfk</p>	<p>kj;fdlkj</p>	<p>dklfj; k</p>\r\n<p>lsjd kfjads</p>\r\n<p>sdlkfj ak</p>	<p>kdlf;dj;</p>\r\n<p>lsdjkfj d</p>\r\n<p>&nbsp;</p>	2018-06-07 17:15:35.699592	2018-06-07 17:15:35.699592	t	f	f
4	22	137	140	<p>ouu iiu dsfj</p>	<p>&nbsp;kdlfj;a</p>	<p>&nbsp;d;lfaj</p>		<p>dfldkfj df</p>	<p>kdjf;l kjdf</p>	2018-06-07 17:20:59.668458	2018-06-07 17:20:59.668458	t	f	f
5	119	137	140	<p>dfkdj kfja f;ld jf;&nbsp;</p>	<p>kdlfjdfals kj</p>	<p>kjlfj d;lkfj&nbsp;</p>	<p>ljdf;kdjk dj&nbsp;</p>			2018-06-08 09:29:15.507651	2018-06-08 09:29:15.507651	t	f	f
6	19	139	140	<p>kjfdjfk&nbsp;</p>	<p>j lkkjdfk jk j</p>	<p>kdkfj&nbsp;</p>	<p>df djlfkj kaj</p>	<p>&nbsp;djlfk jdk&nbsp;</p>	<p>kdjlf;k jdkfl&nbsp;</p>	2018-06-08 16:21:44.461768	2018-06-08 16:21:44.461768	t	f	f
7	128	193	140	<p>ejfjdfkj</p>	<p>&nbsp;klj kdj;f; sa</p>	<p>&nbsp;jdk;ja fkdjfk</p>	<p>&nbsp;dlkj fkdjf&nbsp;</p>	<p>df jdlkfj&nbsp;</p>		2018-06-08 17:13:26.123057	2018-06-08 17:13:26.123057	t	f	f
8	118	193	140	<p>df jdkl jka j</p>	<p>&nbsp;kjdlkj dk j;</p>	<p>&nbsp;j;dkflaj&nbsp;</p>	<p>&nbsp;k jdlk;jf d;jf&nbsp;</p>	<p>&nbsp;kdlf jdk&nbsp;</p>	<p>&nbsp;kjdlk;jf k;d&nbsp;</p>	2018-06-08 17:16:48.954206	2018-06-08 17:16:48.954206	t	f	f
9	117	193	140	<p>df kdlf jdsl; jd jad</p>	<p>&nbsp;fkd;lfj kdfja</p>	<p>&nbsp;jd;lkj fkdsaj&nbsp;</p>	<p>&nbsp;kljd;fkjf d</p>			2018-06-08 17:20:54.713131	2018-06-08 17:20:54.713131	t	f	f
\.


--
-- Name: patient_med_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('patient_med_records_id_seq', 9, true);


--
-- Data for Name: pds_patient_prev_med_histories; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY pds_patient_prev_med_histories (id, confirmed_pds_id, prev_med_histry, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	1	None	36	t	f	2018-04-13 16:59:01.067291	2018-04-13 16:59:01.067291
2	2	None	36	t	f	2018-04-13 17:06:55.566265	2018-04-13 17:06:55.566265
3	3	None	36	t	f	2018-04-13 17:08:40.003536	2018-04-13 17:08:40.003536
4	4	None	36	t	f	2018-04-13 17:09:25.670852	2018-04-13 17:09:25.670852
5	5	Diabetic	36	t	f	2018-04-16 12:12:55.297287	2018-04-16 12:12:55.297287
6	8	Diabetes	145	t	f	2018-04-19 14:02:01.5198	2018-04-19 14:02:01.5198
7	13	Diabetes	145	t	f	2018-04-21 05:18:56.279294	2018-04-21 05:18:56.279294
8	16	\N	135	t	f	2018-04-23 17:58:55.608383	2018-04-23 17:58:55.608383
9	17	None	135	t	f	2018-04-26 12:20:50.34667	2018-04-26 12:20:50.34667
10	19	Diabetic	36	t	f	2018-05-04 14:44:02.70526	2018-05-04 14:44:02.70526
11	20	None	135	t	f	2018-05-04 15:25:09.660341	2018-05-04 15:25:09.660341
12	21		135	t	f	2018-05-05 14:31:52.722654	2018-05-05 14:31:52.722654
13	22		149	t	f	2018-05-05 22:22:32.484409	2018-05-05 22:22:32.484409
14	23		149	t	f	2018-05-05 22:22:52.027612	2018-05-05 22:22:52.027612
15	24	None	135	t	f	2018-05-08 20:33:21.879981	2018-05-08 20:33:21.879981
16	25	None	135	t	f	2018-05-08 20:33:45.353933	2018-05-08 20:33:45.353933
17	26	None	135	t	f	2018-05-09 09:38:38.784605	2018-05-09 09:38:38.784605
18	27	Malaria 	149	t	f	2018-05-09 15:47:40.862008	2018-05-09 15:47:40.862008
19	29	Diabetes 	145	t	f	2018-05-10 02:58:42.501448	2018-05-10 02:58:42.501448
20	35	None	158	t	f	2018-06-07 11:08:09.373082	2018-06-07 11:08:09.373082
\.


--
-- Name: pds_patient_prev_med_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('pds_patient_prev_med_histories_id_seq', 20, true);


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
551	Registration	user_prof_info	user_prof_info	\N	2018-04-30 12:55:06.528372	2018-04-30 12:55:06.528372
552	Registration	process_user_prof_info	process_user_prof_info	\N	2018-04-30 12:55:06.531565	2018-04-30 12:55:06.531565
553	PersonInfoExtra	new_confirm_person_info	new_confirm_person_info	\N	2018-04-30 12:55:06.772158	2018-04-30 12:55:06.772158
554	PersonInfoExtra	confirm_person_registration	confirm_person_registration	\N	2018-04-30 12:55:06.77457	2018-04-30 12:55:06.77457
555	PreAppointment	select_appt_option	select_appt_option	\N	2018-04-30 12:55:06.963608	2018-04-30 12:55:06.963608
556	PreAppointment	my_appointment_pds	my_appointment_pds	\N	2018-04-30 12:55:06.966074	2018-04-30 12:55:06.966074
557	PreAppointment	patient_new_appointment_pds	patient_new_appointment_pds	\N	2018-04-30 12:55:06.969136	2018-04-30 12:55:06.969136
558	PreAppointment	process_patient_new_appointment_pds	process_patient_new_appointment_pds	\N	2018-04-30 12:55:06.971698	2018-04-30 12:55:06.971698
559	PreAppointment	patient_video_details	patient_video_details	\N	2018-04-30 12:55:06.974233	2018-04-30 12:55:06.974233
560	PreAppointment	patient_med_details	patient_med_details	\N	2018-04-30 12:55:06.976153	2018-04-30 12:55:06.976153
561	PreAppointment	patient_medication_details	patient_medication_details	\N	2018-04-30 12:55:06.97814	2018-04-30 12:55:06.97814
562	PreAppointment	patient_home_details	patient_home_details	\N	2018-04-30 12:55:06.980136	2018-04-30 12:55:06.980136
563	PreAppointment	patient_phone_details	patient_phone_details	\N	2018-04-30 12:55:06.982108	2018-04-30 12:55:06.982108
564	PreAppointment	patient_video_details_pds	patient_video_details_pds	\N	2018-04-30 12:55:06.984053	2018-04-30 12:55:06.984053
565	PreAppointment	patient_home_details_pds	patient_home_details_pds	\N	2018-04-30 12:55:06.985993	2018-04-30 12:55:06.985993
566	PreAppointment	patient_prescription_details	patient_prescription_details	\N	2018-04-30 12:55:06.987937	2018-04-30 12:55:06.987937
567	NurseHome	manage	manage	\N	2018-04-30 13:26:59.401539	2018-04-30 13:26:59.401539
568	NurseHome	index	list	\N	2018-04-30 13:26:59.406506	2018-04-30 13:26:59.406506
569	NurseHome	warning	warning	\N	2018-04-30 13:26:59.408506	2018-04-30 13:26:59.408506
570	NurseHome	info	info	\N	2018-04-30 13:26:59.410516	2018-04-30 13:26:59.410516
571	NurseHome	success	success	\N	2018-04-30 13:26:59.412473	2018-04-30 13:26:59.412473
572	NurseHome	danger	danger	\N	2018-04-30 13:26:59.414441	2018-04-30 13:26:59.414441
573	ConfirmedAppointment	nurse_appointments	nurse_appointments	\N	2018-05-02 10:10:31.682589	2018-05-02 10:10:31.682589
574	User	edit_profile	edit_profile	\N	2018-05-02 16:00:27.336963	2018-05-02 16:00:27.336963
575	PersonInfo	edit_profile	edit_profile	\N	2018-05-04 11:58:47.884952	2018-05-04 11:58:47.884952
576	PersonInfo	update_profile	update_profile	\N	2018-05-04 11:58:47.890399	2018-05-04 11:58:47.890399
577	User	profile	profile	\N	2018-05-04 11:58:48.042113	2018-05-04 11:58:48.042113
578	User	user_credential	user_credential	\N	2018-05-04 11:58:48.045465	2018-05-04 11:58:48.045465
579	User	update_credential	update_credential	\N	2018-05-04 11:58:48.047468	2018-05-04 11:58:48.047468
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('permissions_id_seq', 579, true);


--
-- Data for Name: permissions_roles; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY permissions_roles (id, person_type_master_id, permission_id, created_at, updated_at, role_id) FROM stdin;
3522	\N	2	2018-05-31 11:50:44.159598	2018-05-31 11:50:44.159598	2
3523	\N	3	2018-05-31 11:50:44.162358	2018-05-31 11:50:44.162358	2
3524	\N	4	2018-05-31 11:50:44.164599	2018-05-31 11:50:44.164599	2
3525	\N	5	2018-05-31 11:50:44.166835	2018-05-31 11:50:44.166835	2
3526	\N	6	2018-05-31 11:50:44.169052	2018-05-31 11:50:44.169052	2
3527	\N	7	2018-05-31 11:50:44.171315	2018-05-31 11:50:44.171315	2
3528	\N	8	2018-05-31 11:50:44.173482	2018-05-31 11:50:44.173482	2
3529	\N	9	2018-05-31 11:50:44.175637	2018-05-31 11:50:44.175637	2
3530	\N	10	2018-05-31 11:50:44.177838	2018-05-31 11:50:44.177838	2
3531	\N	11	2018-05-31 11:50:44.180134	2018-05-31 11:50:44.180134	2
3532	\N	12	2018-05-31 11:50:44.18236	2018-05-31 11:50:44.18236	2
3533	\N	13	2018-05-31 11:50:44.184506	2018-05-31 11:50:44.184506	2
3534	\N	14	2018-05-31 11:50:44.186638	2018-05-31 11:50:44.186638	2
3535	\N	15	2018-05-31 11:50:44.188804	2018-05-31 11:50:44.188804	2
3536	\N	16	2018-05-31 11:50:44.190991	2018-05-31 11:50:44.190991	2
3537	\N	17	2018-05-31 11:50:44.193165	2018-05-31 11:50:44.193165	2
3538	\N	18	2018-05-31 11:50:44.195285	2018-05-31 11:50:44.195285	2
3539	\N	19	2018-05-31 11:50:44.197428	2018-05-31 11:50:44.197428	2
3540	\N	20	2018-05-31 11:50:44.199533	2018-05-31 11:50:44.199533	2
3541	\N	21	2018-05-31 11:50:44.2017	2018-05-31 11:50:44.2017	2
3542	\N	22	2018-05-31 11:50:44.203838	2018-05-31 11:50:44.203838	2
3543	\N	23	2018-05-31 11:50:44.205982	2018-05-31 11:50:44.205982	2
3544	\N	24	2018-05-31 11:50:44.208153	2018-05-31 11:50:44.208153	2
3545	\N	25	2018-05-31 11:50:44.210267	2018-05-31 11:50:44.210267	2
3546	\N	26	2018-05-31 11:50:44.212418	2018-05-31 11:50:44.212418	2
3547	\N	27	2018-05-31 11:50:44.214562	2018-05-31 11:50:44.214562	2
3548	\N	28	2018-05-31 11:50:44.216723	2018-05-31 11:50:44.216723	2
3549	\N	29	2018-05-31 11:50:44.21884	2018-05-31 11:50:44.21884	2
3550	\N	30	2018-05-31 11:50:44.221041	2018-05-31 11:50:44.221041	2
3551	\N	31	2018-05-31 11:50:44.223326	2018-05-31 11:50:44.223326	2
3552	\N	32	2018-05-31 11:50:44.225484	2018-05-31 11:50:44.225484	2
3553	\N	33	2018-05-31 11:50:44.227632	2018-05-31 11:50:44.227632	2
3554	\N	34	2018-05-31 11:50:44.229814	2018-05-31 11:50:44.229814	2
3555	\N	35	2018-05-31 11:50:44.232011	2018-05-31 11:50:44.232011	2
3556	\N	36	2018-05-31 11:50:44.234263	2018-05-31 11:50:44.234263	2
3557	\N	37	2018-05-31 11:50:44.236429	2018-05-31 11:50:44.236429	2
3558	\N	38	2018-05-31 11:50:44.23855	2018-05-31 11:50:44.23855	2
3559	\N	39	2018-05-31 11:50:44.240691	2018-05-31 11:50:44.240691	2
3560	\N	40	2018-05-31 11:50:44.242821	2018-05-31 11:50:44.242821	2
3561	\N	41	2018-05-31 11:50:44.244991	2018-05-31 11:50:44.244991	2
3562	\N	42	2018-05-31 11:50:44.24722	2018-05-31 11:50:44.24722	2
3563	\N	43	2018-05-31 11:50:44.249435	2018-05-31 11:50:44.249435	2
3564	\N	44	2018-05-31 11:50:44.251647	2018-05-31 11:50:44.251647	2
3565	\N	45	2018-05-31 11:50:44.253854	2018-05-31 11:50:44.253854	2
3566	\N	46	2018-05-31 11:50:44.256079	2018-05-31 11:50:44.256079	2
3567	\N	47	2018-05-31 11:50:44.258342	2018-05-31 11:50:44.258342	2
3568	\N	48	2018-05-31 11:50:44.260548	2018-05-31 11:50:44.260548	2
3569	\N	49	2018-05-31 11:50:44.2627	2018-05-31 11:50:44.2627	2
3570	\N	50	2018-05-31 11:50:44.264835	2018-05-31 11:50:44.264835	2
3571	\N	51	2018-05-31 11:50:44.26703	2018-05-31 11:50:44.26703	2
3572	\N	52	2018-05-31 11:50:44.269262	2018-05-31 11:50:44.269262	2
3573	\N	53	2018-05-31 11:50:44.271502	2018-05-31 11:50:44.271502	2
3574	\N	54	2018-05-31 11:50:44.273643	2018-05-31 11:50:44.273643	2
3575	\N	55	2018-05-31 11:50:44.275874	2018-05-31 11:50:44.275874	2
3576	\N	56	2018-05-31 11:50:44.278068	2018-05-31 11:50:44.278068	2
3577	\N	57	2018-05-31 11:50:44.280317	2018-05-31 11:50:44.280317	2
3578	\N	58	2018-05-31 11:50:44.282531	2018-05-31 11:50:44.282531	2
3579	\N	59	2018-05-31 11:50:44.284694	2018-05-31 11:50:44.284694	2
3580	\N	60	2018-05-31 11:50:44.28686	2018-05-31 11:50:44.28686	2
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
3581	\N	61	2018-05-31 11:50:44.289017	2018-05-31 11:50:44.289017	2
3582	\N	62	2018-05-31 11:50:44.291255	2018-05-31 11:50:44.291255	2
3583	\N	63	2018-05-31 11:50:44.29343	2018-05-31 11:50:44.29343	2
3584	\N	64	2018-05-31 11:50:44.295618	2018-05-31 11:50:44.295618	2
3585	\N	65	2018-05-31 11:50:44.297861	2018-05-31 11:50:44.297861	2
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
3586	\N	66	2018-05-31 11:50:44.300116	2018-05-31 11:50:44.300116	2
3587	\N	67	2018-05-31 11:50:44.30237	2018-05-31 11:50:44.30237	2
3588	\N	68	2018-05-31 11:50:44.304583	2018-05-31 11:50:44.304583	2
3589	\N	69	2018-05-31 11:50:44.306779	2018-05-31 11:50:44.306779	2
3590	\N	70	2018-05-31 11:50:44.309059	2018-05-31 11:50:44.309059	2
3591	\N	71	2018-05-31 11:50:44.311306	2018-05-31 11:50:44.311306	2
3592	\N	72	2018-05-31 11:50:44.313485	2018-05-31 11:50:44.313485	2
3593	\N	73	2018-05-31 11:50:44.315657	2018-05-31 11:50:44.315657	2
3594	\N	74	2018-05-31 11:50:44.317789	2018-05-31 11:50:44.317789	2
3595	\N	75	2018-05-31 11:50:44.319956	2018-05-31 11:50:44.319956	2
3596	\N	76	2018-05-31 11:50:44.322123	2018-05-31 11:50:44.322123	2
3597	\N	77	2018-05-31 11:50:44.324354	2018-05-31 11:50:44.324354	2
3598	\N	78	2018-05-31 11:50:44.326571	2018-05-31 11:50:44.326571	2
3599	\N	79	2018-05-31 11:50:44.328816	2018-05-31 11:50:44.328816	2
3600	\N	80	2018-05-31 11:50:44.338244	2018-05-31 11:50:44.338244	2
3601	\N	81	2018-05-31 11:50:44.340439	2018-05-31 11:50:44.340439	2
3602	\N	82	2018-05-31 11:50:44.342588	2018-05-31 11:50:44.342588	2
3603	\N	83	2018-05-31 11:50:44.344756	2018-05-31 11:50:44.344756	2
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
3604	\N	84	2018-05-31 11:50:44.346915	2018-05-31 11:50:44.346915	2
3605	\N	85	2018-05-31 11:50:44.349085	2018-05-31 11:50:44.349085	2
3606	\N	86	2018-05-31 11:50:44.351306	2018-05-31 11:50:44.351306	2
3607	\N	87	2018-05-31 11:50:44.353574	2018-05-31 11:50:44.353574	2
3608	\N	88	2018-05-31 11:50:44.355787	2018-05-31 11:50:44.355787	2
3609	\N	89	2018-05-31 11:50:44.35796	2018-05-31 11:50:44.35796	2
3610	\N	90	2018-05-31 11:50:44.360124	2018-05-31 11:50:44.360124	2
3611	\N	91	2018-05-31 11:50:44.362312	2018-05-31 11:50:44.362312	2
3612	\N	92	2018-05-31 11:50:44.364457	2018-05-31 11:50:44.364457	2
3613	\N	93	2018-05-31 11:50:44.366574	2018-05-31 11:50:44.366574	2
3614	\N	94	2018-05-31 11:50:44.368632	2018-05-31 11:50:44.368632	2
3615	\N	95	2018-05-31 11:50:44.370808	2018-05-31 11:50:44.370808	2
3616	\N	96	2018-05-31 11:50:44.372958	2018-05-31 11:50:44.372958	2
3617	\N	97	2018-05-31 11:50:44.37514	2018-05-31 11:50:44.37514	2
3618	\N	98	2018-05-31 11:50:44.37732	2018-05-31 11:50:44.37732	2
3619	\N	99	2018-05-31 11:50:44.379448	2018-05-31 11:50:44.379448	2
3620	\N	100	2018-05-31 11:50:44.381574	2018-05-31 11:50:44.381574	2
3621	\N	101	2018-05-31 11:50:44.383694	2018-05-31 11:50:44.383694	2
3622	\N	102	2018-05-31 11:50:44.385788	2018-05-31 11:50:44.385788	2
3623	\N	103	2018-05-31 11:50:44.387944	2018-05-31 11:50:44.387944	2
3624	\N	104	2018-05-31 11:50:44.390141	2018-05-31 11:50:44.390141	2
3625	\N	105	2018-05-31 11:50:44.392264	2018-05-31 11:50:44.392264	2
3626	\N	106	2018-05-31 11:50:44.394392	2018-05-31 11:50:44.394392	2
3627	\N	107	2018-05-31 11:50:44.396531	2018-05-31 11:50:44.396531	2
3628	\N	108	2018-05-31 11:50:44.398612	2018-05-31 11:50:44.398612	2
3629	\N	109	2018-05-31 11:50:44.400732	2018-05-31 11:50:44.400732	2
3630	\N	110	2018-05-31 11:50:44.402823	2018-05-31 11:50:44.402823	2
3631	\N	111	2018-05-31 11:50:44.40498	2018-05-31 11:50:44.40498	2
3632	\N	112	2018-05-31 11:50:44.407274	2018-05-31 11:50:44.407274	2
3633	\N	113	2018-05-31 11:50:44.409436	2018-05-31 11:50:44.409436	2
3634	\N	114	2018-05-31 11:50:44.411671	2018-05-31 11:50:44.411671	2
3635	\N	115	2018-05-31 11:50:44.413866	2018-05-31 11:50:44.413866	2
3636	\N	116	2018-05-31 11:50:44.41612	2018-05-31 11:50:44.41612	2
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
3637	\N	117	2018-05-31 11:50:44.418423	2018-05-31 11:50:44.418423	2
3638	\N	118	2018-05-31 11:50:44.420521	2018-05-31 11:50:44.420521	2
3639	\N	119	2018-05-31 11:50:44.422624	2018-05-31 11:50:44.422624	2
3640	\N	120	2018-05-31 11:50:44.424721	2018-05-31 11:50:44.424721	2
3641	\N	121	2018-05-31 11:50:44.426755	2018-05-31 11:50:44.426755	2
3642	\N	122	2018-05-31 11:50:44.42878	2018-05-31 11:50:44.42878	2
3643	\N	123	2018-05-31 11:50:44.430857	2018-05-31 11:50:44.430857	2
3644	\N	124	2018-05-31 11:50:44.432966	2018-05-31 11:50:44.432966	2
3645	\N	125	2018-05-31 11:50:44.43508	2018-05-31 11:50:44.43508	2
3646	\N	126	2018-05-31 11:50:44.43716	2018-05-31 11:50:44.43716	2
3647	\N	127	2018-05-31 11:50:44.439247	2018-05-31 11:50:44.439247	2
3648	\N	128	2018-05-31 11:50:44.441321	2018-05-31 11:50:44.441321	2
3649	\N	129	2018-05-31 11:50:44.443376	2018-05-31 11:50:44.443376	2
3650	\N	130	2018-05-31 11:50:44.445439	2018-05-31 11:50:44.445439	2
3651	\N	131	2018-05-31 11:50:44.44749	2018-05-31 11:50:44.44749	2
3652	\N	132	2018-05-31 11:50:44.449525	2018-05-31 11:50:44.449525	2
3653	\N	133	2018-05-31 11:50:44.451566	2018-05-31 11:50:44.451566	2
3654	\N	134	2018-05-31 11:50:44.453609	2018-05-31 11:50:44.453609	2
3655	\N	135	2018-05-31 11:50:44.455639	2018-05-31 11:50:44.455639	2
3656	\N	136	2018-05-31 11:50:44.457747	2018-05-31 11:50:44.457747	2
3657	\N	137	2018-05-31 11:50:44.459851	2018-05-31 11:50:44.459851	2
3658	\N	138	2018-05-31 11:50:44.461987	2018-05-31 11:50:44.461987	2
3659	\N	139	2018-05-31 11:50:44.46417	2018-05-31 11:50:44.46417	2
3660	\N	140	2018-05-31 11:50:44.46635	2018-05-31 11:50:44.46635	2
3661	\N	141	2018-05-31 11:50:44.468581	2018-05-31 11:50:44.468581	2
3662	\N	142	2018-05-31 11:50:44.470727	2018-05-31 11:50:44.470727	2
3663	\N	143	2018-05-31 11:50:44.472829	2018-05-31 11:50:44.472829	2
3664	\N	144	2018-05-31 11:50:44.474993	2018-05-31 11:50:44.474993	2
3665	\N	145	2018-05-31 11:50:44.477145	2018-05-31 11:50:44.477145	2
3666	\N	146	2018-05-31 11:50:44.479299	2018-05-31 11:50:44.479299	2
3667	\N	147	2018-05-31 11:50:44.481439	2018-05-31 11:50:44.481439	2
3668	\N	148	2018-05-31 11:50:44.483521	2018-05-31 11:50:44.483521	2
3669	\N	149	2018-05-31 11:50:44.485612	2018-05-31 11:50:44.485612	2
3670	\N	150	2018-05-31 11:50:44.487747	2018-05-31 11:50:44.487747	2
3671	\N	151	2018-05-31 11:50:44.489864	2018-05-31 11:50:44.489864	2
3672	\N	152	2018-05-31 11:50:44.492032	2018-05-31 11:50:44.492032	2
3673	\N	153	2018-05-31 11:50:44.494174	2018-05-31 11:50:44.494174	2
3674	\N	154	2018-05-31 11:50:44.496301	2018-05-31 11:50:44.496301	2
3675	\N	155	2018-05-31 11:50:44.498418	2018-05-31 11:50:44.498418	2
3676	\N	156	2018-05-31 11:50:44.500513	2018-05-31 11:50:44.500513	2
3677	\N	157	2018-05-31 11:50:44.502584	2018-05-31 11:50:44.502584	2
3678	\N	158	2018-05-31 11:50:44.504671	2018-05-31 11:50:44.504671	2
3679	\N	159	2018-05-31 11:50:44.506762	2018-05-31 11:50:44.506762	2
3680	\N	160	2018-05-31 11:50:44.508907	2018-05-31 11:50:44.508907	2
3681	\N	161	2018-05-31 11:50:44.511053	2018-05-31 11:50:44.511053	2
3682	\N	162	2018-05-31 11:50:44.513225	2018-05-31 11:50:44.513225	2
3683	\N	163	2018-05-31 11:50:44.515374	2018-05-31 11:50:44.515374	2
3684	\N	164	2018-05-31 11:50:44.517462	2018-05-31 11:50:44.517462	2
3685	\N	165	2018-05-31 11:50:44.519593	2018-05-31 11:50:44.519593	2
3686	\N	166	2018-05-31 11:50:44.521766	2018-05-31 11:50:44.521766	2
3687	\N	167	2018-05-31 11:50:44.523923	2018-05-31 11:50:44.523923	2
3688	\N	168	2018-05-31 11:50:44.526148	2018-05-31 11:50:44.526148	2
3689	\N	169	2018-05-31 11:50:44.52839	2018-05-31 11:50:44.52839	2
3690	\N	170	2018-05-31 11:50:44.530588	2018-05-31 11:50:44.530588	2
3691	\N	171	2018-05-31 11:50:44.532754	2018-05-31 11:50:44.532754	2
3692	\N	172	2018-05-31 11:50:44.534927	2018-05-31 11:50:44.534927	2
3693	\N	173	2018-05-31 11:50:44.537131	2018-05-31 11:50:44.537131	2
3694	\N	174	2018-05-31 11:50:44.539322	2018-05-31 11:50:44.539322	2
3695	\N	175	2018-05-31 11:50:44.541462	2018-05-31 11:50:44.541462	2
3696	\N	176	2018-05-31 11:50:44.543574	2018-05-31 11:50:44.543574	2
3697	\N	177	2018-05-31 11:50:44.545705	2018-05-31 11:50:44.545705	2
3698	\N	178	2018-05-31 11:50:44.547831	2018-05-31 11:50:44.547831	2
3699	\N	179	2018-05-31 11:50:44.549982	2018-05-31 11:50:44.549982	2
3700	\N	180	2018-05-31 11:50:44.552176	2018-05-31 11:50:44.552176	2
3701	\N	181	2018-05-31 11:50:44.554337	2018-05-31 11:50:44.554337	2
3702	\N	182	2018-05-31 11:50:44.556476	2018-05-31 11:50:44.556476	2
3703	\N	183	2018-05-31 11:50:44.558612	2018-05-31 11:50:44.558612	2
3704	\N	184	2018-05-31 11:50:44.560753	2018-05-31 11:50:44.560753	2
3705	\N	185	2018-05-31 11:50:44.562936	2018-05-31 11:50:44.562936	2
3706	\N	186	2018-05-31 11:50:44.565118	2018-05-31 11:50:44.565118	2
3707	\N	187	2018-05-31 11:50:44.56732	2018-05-31 11:50:44.56732	2
3708	\N	188	2018-05-31 11:50:44.569505	2018-05-31 11:50:44.569505	2
3709	\N	189	2018-05-31 11:50:44.571675	2018-05-31 11:50:44.571675	2
3710	\N	190	2018-05-31 11:50:44.573851	2018-05-31 11:50:44.573851	2
3711	\N	191	2018-05-31 11:50:44.576008	2018-05-31 11:50:44.576008	2
3712	\N	192	2018-05-31 11:50:44.578241	2018-05-31 11:50:44.578241	2
3713	\N	193	2018-05-31 11:50:44.58043	2018-05-31 11:50:44.58043	2
3714	\N	194	2018-05-31 11:50:44.582577	2018-05-31 11:50:44.582577	2
3715	\N	195	2018-05-31 11:50:44.584771	2018-05-31 11:50:44.584771	2
2438	\N	2	2018-04-20 16:06:22.633483	2018-04-20 16:06:22.633483	9
2439	\N	3	2018-04-20 16:06:22.634739	2018-04-20 16:06:22.634739	9
2440	\N	4	2018-04-20 16:06:22.63569	2018-04-20 16:06:22.63569	9
2441	\N	5	2018-04-20 16:06:22.636641	2018-04-20 16:06:22.636641	9
2442	\N	6	2018-04-20 16:06:22.637581	2018-04-20 16:06:22.637581	9
2443	\N	7	2018-04-20 16:06:22.638537	2018-04-20 16:06:22.638537	9
2444	\N	8	2018-04-20 16:06:22.639513	2018-04-20 16:06:22.639513	9
2445	\N	9	2018-04-20 16:06:22.640471	2018-04-20 16:06:22.640471	9
2446	\N	10	2018-04-20 16:06:22.6414	2018-04-20 16:06:22.6414	9
2447	\N	11	2018-04-20 16:06:22.642354	2018-04-20 16:06:22.642354	9
2448	\N	12	2018-04-20 16:06:22.643284	2018-04-20 16:06:22.643284	9
2449	\N	13	2018-04-20 16:06:22.644239	2018-04-20 16:06:22.644239	9
2450	\N	14	2018-04-20 16:06:22.645183	2018-04-20 16:06:22.645183	9
2451	\N	15	2018-04-20 16:06:22.646136	2018-04-20 16:06:22.646136	9
2452	\N	16	2018-04-20 16:06:22.647077	2018-04-20 16:06:22.647077	9
2453	\N	17	2018-04-20 16:06:22.648023	2018-04-20 16:06:22.648023	9
2454	\N	18	2018-04-20 16:06:22.648985	2018-04-20 16:06:22.648985	9
2455	\N	19	2018-04-20 16:06:22.649902	2018-04-20 16:06:22.649902	9
2456	\N	20	2018-04-20 16:06:22.650838	2018-04-20 16:06:22.650838	9
2457	\N	21	2018-04-20 16:06:22.65179	2018-04-20 16:06:22.65179	9
2458	\N	22	2018-04-20 16:06:22.652722	2018-04-20 16:06:22.652722	9
2459	\N	23	2018-04-20 16:06:22.653656	2018-04-20 16:06:22.653656	9
2460	\N	24	2018-04-20 16:06:22.654583	2018-04-20 16:06:22.654583	9
2461	\N	25	2018-04-20 16:06:22.655487	2018-04-20 16:06:22.655487	9
2462	\N	26	2018-04-20 16:06:22.656423	2018-04-20 16:06:22.656423	9
2463	\N	27	2018-04-20 16:06:22.657369	2018-04-20 16:06:22.657369	9
2464	\N	28	2018-04-20 16:06:22.658321	2018-04-20 16:06:22.658321	9
2465	\N	29	2018-04-20 16:06:22.659287	2018-04-20 16:06:22.659287	9
2466	\N	30	2018-04-20 16:06:22.660239	2018-04-20 16:06:22.660239	9
2467	\N	31	2018-04-20 16:06:22.661185	2018-04-20 16:06:22.661185	9
2468	\N	32	2018-04-20 16:06:22.662144	2018-04-20 16:06:22.662144	9
2469	\N	33	2018-04-20 16:06:22.663075	2018-04-20 16:06:22.663075	9
2470	\N	34	2018-04-20 16:06:22.66405	2018-04-20 16:06:22.66405	9
2471	\N	35	2018-04-20 16:06:22.665004	2018-04-20 16:06:22.665004	9
2472	\N	36	2018-04-20 16:06:22.665941	2018-04-20 16:06:22.665941	9
2473	\N	37	2018-04-20 16:06:22.666878	2018-04-20 16:06:22.666878	9
2474	\N	38	2018-04-20 16:06:22.667812	2018-04-20 16:06:22.667812	9
2475	\N	39	2018-04-20 16:06:22.66877	2018-04-20 16:06:22.66877	9
2476	\N	40	2018-04-20 16:06:22.669682	2018-04-20 16:06:22.669682	9
2477	\N	41	2018-04-20 16:06:22.670589	2018-04-20 16:06:22.670589	9
2478	\N	42	2018-04-20 16:06:22.671491	2018-04-20 16:06:22.671491	9
2479	\N	43	2018-04-20 16:06:22.672392	2018-04-20 16:06:22.672392	9
2480	\N	44	2018-04-20 16:06:22.673317	2018-04-20 16:06:22.673317	9
2481	\N	45	2018-04-20 16:06:22.674238	2018-04-20 16:06:22.674238	9
2482	\N	46	2018-04-20 16:06:22.675139	2018-04-20 16:06:22.675139	9
2483	\N	47	2018-04-20 16:06:22.676069	2018-04-20 16:06:22.676069	9
2484	\N	48	2018-04-20 16:06:22.677022	2018-04-20 16:06:22.677022	9
2485	\N	49	2018-04-20 16:06:22.677941	2018-04-20 16:06:22.677941	9
2486	\N	50	2018-04-20 16:06:22.678879	2018-04-20 16:06:22.678879	9
2487	\N	51	2018-04-20 16:06:22.679816	2018-04-20 16:06:22.679816	9
2488	\N	52	2018-04-20 16:06:22.680736	2018-04-20 16:06:22.680736	9
2489	\N	53	2018-04-20 16:06:22.681677	2018-04-20 16:06:22.681677	9
2490	\N	54	2018-04-20 16:06:22.682604	2018-04-20 16:06:22.682604	9
2491	\N	55	2018-04-20 16:06:22.683515	2018-04-20 16:06:22.683515	9
2492	\N	56	2018-04-20 16:06:22.684545	2018-04-20 16:06:22.684545	9
2493	\N	57	2018-04-20 16:06:22.685481	2018-04-20 16:06:22.685481	9
2494	\N	58	2018-04-20 16:06:22.686443	2018-04-20 16:06:22.686443	9
2495	\N	59	2018-04-20 16:06:22.6874	2018-04-20 16:06:22.6874	9
2496	\N	60	2018-04-20 16:06:22.688366	2018-04-20 16:06:22.688366	9
2497	\N	61	2018-04-20 16:06:22.689323	2018-04-20 16:06:22.689323	9
2498	\N	62	2018-04-20 16:06:22.690257	2018-04-20 16:06:22.690257	9
2499	\N	63	2018-04-20 16:06:22.69121	2018-04-20 16:06:22.69121	9
2500	\N	64	2018-04-20 16:06:22.692168	2018-04-20 16:06:22.692168	9
2501	\N	65	2018-04-20 16:06:22.693126	2018-04-20 16:06:22.693126	9
2502	\N	66	2018-04-20 16:06:22.694065	2018-04-20 16:06:22.694065	9
2503	\N	67	2018-04-20 16:06:22.695026	2018-04-20 16:06:22.695026	9
2504	\N	68	2018-04-20 16:06:22.695963	2018-04-20 16:06:22.695963	9
2505	\N	69	2018-04-20 16:06:22.696886	2018-04-20 16:06:22.696886	9
2506	\N	70	2018-04-20 16:06:22.697825	2018-04-20 16:06:22.697825	9
2507	\N	71	2018-04-20 16:06:22.698756	2018-04-20 16:06:22.698756	9
2508	\N	72	2018-04-20 16:06:22.699703	2018-04-20 16:06:22.699703	9
2509	\N	73	2018-04-20 16:06:22.700632	2018-04-20 16:06:22.700632	9
2510	\N	74	2018-04-20 16:06:22.701581	2018-04-20 16:06:22.701581	9
2511	\N	75	2018-04-20 16:06:22.70251	2018-04-20 16:06:22.70251	9
2512	\N	76	2018-04-20 16:06:22.703443	2018-04-20 16:06:22.703443	9
2513	\N	77	2018-04-20 16:06:22.704358	2018-04-20 16:06:22.704358	9
2514	\N	78	2018-04-20 16:06:22.705275	2018-04-20 16:06:22.705275	9
2515	\N	79	2018-04-20 16:06:22.706186	2018-04-20 16:06:22.706186	9
2516	\N	80	2018-04-20 16:06:22.70711	2018-04-20 16:06:22.70711	9
2517	\N	81	2018-04-20 16:06:22.708066	2018-04-20 16:06:22.708066	9
2518	\N	82	2018-04-20 16:06:22.709032	2018-04-20 16:06:22.709032	9
2519	\N	83	2018-04-20 16:06:22.709967	2018-04-20 16:06:22.709967	9
2520	\N	84	2018-04-20 16:06:22.710927	2018-04-20 16:06:22.710927	9
2521	\N	85	2018-04-20 16:06:22.711874	2018-04-20 16:06:22.711874	9
2522	\N	86	2018-04-20 16:06:22.712807	2018-04-20 16:06:22.712807	9
2523	\N	87	2018-04-20 16:06:22.71375	2018-04-20 16:06:22.71375	9
2524	\N	88	2018-04-20 16:06:22.714699	2018-04-20 16:06:22.714699	9
2525	\N	89	2018-04-20 16:06:22.715638	2018-04-20 16:06:22.715638	9
2526	\N	90	2018-04-20 16:06:22.716559	2018-04-20 16:06:22.716559	9
2527	\N	91	2018-04-20 16:06:22.717464	2018-04-20 16:06:22.717464	9
2528	\N	92	2018-04-20 16:06:22.718401	2018-04-20 16:06:22.718401	9
2529	\N	93	2018-04-20 16:06:22.719339	2018-04-20 16:06:22.719339	9
2530	\N	94	2018-04-20 16:06:22.720307	2018-04-20 16:06:22.720307	9
2531	\N	95	2018-04-20 16:06:22.721258	2018-04-20 16:06:22.721258	9
2532	\N	96	2018-04-20 16:06:22.722235	2018-04-20 16:06:22.722235	9
2533	\N	97	2018-04-20 16:06:22.723173	2018-04-20 16:06:22.723173	9
2534	\N	98	2018-04-20 16:06:22.724134	2018-04-20 16:06:22.724134	9
2535	\N	99	2018-04-20 16:06:22.725078	2018-04-20 16:06:22.725078	9
2536	\N	100	2018-04-20 16:06:22.726037	2018-04-20 16:06:22.726037	9
2537	\N	101	2018-04-20 16:06:22.727008	2018-04-20 16:06:22.727008	9
2538	\N	102	2018-04-20 16:06:22.727957	2018-04-20 16:06:22.727957	9
2539	\N	103	2018-04-20 16:06:22.728898	2018-04-20 16:06:22.728898	9
2540	\N	104	2018-04-20 16:06:22.729815	2018-04-20 16:06:22.729815	9
2541	\N	105	2018-04-20 16:06:22.730762	2018-04-20 16:06:22.730762	9
2542	\N	106	2018-04-20 16:06:22.731729	2018-04-20 16:06:22.731729	9
2543	\N	107	2018-04-20 16:06:22.732688	2018-04-20 16:06:22.732688	9
2544	\N	108	2018-04-20 16:06:22.733598	2018-04-20 16:06:22.733598	9
2545	\N	109	2018-04-20 16:06:22.734524	2018-04-20 16:06:22.734524	9
2546	\N	110	2018-04-20 16:06:22.735478	2018-04-20 16:06:22.735478	9
2547	\N	111	2018-04-20 16:06:22.736417	2018-04-20 16:06:22.736417	9
2548	\N	112	2018-04-20 16:06:22.737328	2018-04-20 16:06:22.737328	9
2549	\N	113	2018-04-20 16:06:22.738261	2018-04-20 16:06:22.738261	9
2550	\N	114	2018-04-20 16:06:22.739237	2018-04-20 16:06:22.739237	9
2551	\N	115	2018-04-20 16:06:22.740142	2018-04-20 16:06:22.740142	9
2552	\N	116	2018-04-20 16:06:22.741107	2018-04-20 16:06:22.741107	9
2553	\N	117	2018-04-20 16:06:22.742077	2018-04-20 16:06:22.742077	9
2554	\N	118	2018-04-20 16:06:22.743028	2018-04-20 16:06:22.743028	9
2555	\N	119	2018-04-20 16:06:22.743979	2018-04-20 16:06:22.743979	9
2556	\N	120	2018-04-20 16:06:22.744931	2018-04-20 16:06:22.744931	9
2557	\N	121	2018-04-20 16:06:22.745873	2018-04-20 16:06:22.745873	9
2558	\N	122	2018-04-20 16:06:22.74683	2018-04-20 16:06:22.74683	9
2559	\N	123	2018-04-20 16:06:22.747785	2018-04-20 16:06:22.747785	9
2560	\N	124	2018-04-20 16:06:22.748711	2018-04-20 16:06:22.748711	9
2561	\N	125	2018-04-20 16:06:22.749726	2018-04-20 16:06:22.749726	9
2562	\N	126	2018-04-20 16:06:22.750666	2018-04-20 16:06:22.750666	9
2563	\N	127	2018-04-20 16:06:22.751599	2018-04-20 16:06:22.751599	9
2564	\N	128	2018-04-20 16:06:22.752497	2018-04-20 16:06:22.752497	9
2565	\N	129	2018-04-20 16:06:22.753428	2018-04-20 16:06:22.753428	9
2566	\N	130	2018-04-20 16:06:22.754372	2018-04-20 16:06:22.754372	9
2567	\N	131	2018-04-20 16:06:22.755277	2018-04-20 16:06:22.755277	9
2568	\N	132	2018-04-20 16:06:22.7562	2018-04-20 16:06:22.7562	9
2569	\N	133	2018-04-20 16:06:22.75713	2018-04-20 16:06:22.75713	9
2570	\N	134	2018-04-20 16:06:22.75806	2018-04-20 16:06:22.75806	9
2571	\N	135	2018-04-20 16:06:22.758966	2018-04-20 16:06:22.758966	9
2572	\N	136	2018-04-20 16:06:22.759909	2018-04-20 16:06:22.759909	9
2573	\N	137	2018-04-20 16:06:22.760857	2018-04-20 16:06:22.760857	9
2574	\N	138	2018-04-20 16:06:22.761801	2018-04-20 16:06:22.761801	9
2575	\N	139	2018-04-20 16:06:22.762734	2018-04-20 16:06:22.762734	9
2576	\N	140	2018-04-20 16:06:22.763711	2018-04-20 16:06:22.763711	9
2577	\N	141	2018-04-20 16:06:22.764676	2018-04-20 16:06:22.764676	9
2578	\N	142	2018-04-20 16:06:22.765614	2018-04-20 16:06:22.765614	9
2579	\N	143	2018-04-20 16:06:22.76653	2018-04-20 16:06:22.76653	9
2580	\N	144	2018-04-20 16:06:22.767451	2018-04-20 16:06:22.767451	9
2581	\N	145	2018-04-20 16:06:22.768389	2018-04-20 16:06:22.768389	9
2582	\N	146	2018-04-20 16:06:22.769313	2018-04-20 16:06:22.769313	9
2583	\N	147	2018-04-20 16:06:22.770255	2018-04-20 16:06:22.770255	9
2584	\N	148	2018-04-20 16:06:22.771204	2018-04-20 16:06:22.771204	9
2585	\N	149	2018-04-20 16:06:22.772149	2018-04-20 16:06:22.772149	9
2586	\N	150	2018-04-20 16:06:22.773104	2018-04-20 16:06:22.773104	9
2587	\N	151	2018-04-20 16:06:22.774073	2018-04-20 16:06:22.774073	9
2588	\N	152	2018-04-20 16:06:22.775034	2018-04-20 16:06:22.775034	9
2589	\N	153	2018-04-20 16:06:22.77598	2018-04-20 16:06:22.77598	9
2590	\N	154	2018-04-20 16:06:22.776927	2018-04-20 16:06:22.776927	9
2591	\N	155	2018-04-20 16:06:22.777877	2018-04-20 16:06:22.777877	9
2592	\N	156	2018-04-20 16:06:22.778824	2018-04-20 16:06:22.778824	9
2593	\N	157	2018-04-20 16:06:22.779773	2018-04-20 16:06:22.779773	9
2594	\N	158	2018-04-20 16:06:22.780735	2018-04-20 16:06:22.780735	9
2595	\N	159	2018-04-20 16:06:22.781701	2018-04-20 16:06:22.781701	9
2596	\N	160	2018-04-20 16:06:22.782633	2018-04-20 16:06:22.782633	9
2597	\N	161	2018-04-20 16:06:22.783531	2018-04-20 16:06:22.783531	9
2598	\N	162	2018-04-20 16:06:22.78446	2018-04-20 16:06:22.78446	9
2599	\N	163	2018-04-20 16:06:22.785385	2018-04-20 16:06:22.785385	9
2600	\N	164	2018-04-20 16:06:22.786309	2018-04-20 16:06:22.786309	9
2601	\N	165	2018-04-20 16:06:22.787254	2018-04-20 16:06:22.787254	9
2602	\N	166	2018-04-20 16:06:22.788175	2018-04-20 16:06:22.788175	9
2603	\N	167	2018-04-20 16:06:22.78908	2018-04-20 16:06:22.78908	9
2604	\N	168	2018-04-20 16:06:22.790059	2018-04-20 16:06:22.790059	9
2605	\N	169	2018-04-20 16:06:22.791013	2018-04-20 16:06:22.791013	9
2606	\N	170	2018-04-20 16:06:22.79194	2018-04-20 16:06:22.79194	9
2607	\N	171	2018-04-20 16:06:22.792897	2018-04-20 16:06:22.792897	9
2608	\N	172	2018-04-20 16:06:22.793845	2018-04-20 16:06:22.793845	9
2609	\N	173	2018-04-20 16:06:22.794788	2018-04-20 16:06:22.794788	9
2610	\N	174	2018-04-20 16:06:22.795723	2018-04-20 16:06:22.795723	9
2611	\N	175	2018-04-20 16:06:22.796693	2018-04-20 16:06:22.796693	9
2612	\N	176	2018-04-20 16:06:22.797622	2018-04-20 16:06:22.797622	9
2613	\N	177	2018-04-20 16:06:22.798531	2018-04-20 16:06:22.798531	9
2614	\N	178	2018-04-20 16:06:22.799441	2018-04-20 16:06:22.799441	9
2615	\N	179	2018-04-20 16:06:22.800367	2018-04-20 16:06:22.800367	9
2616	\N	180	2018-04-20 16:06:22.801289	2018-04-20 16:06:22.801289	9
2617	\N	181	2018-04-20 16:06:22.802209	2018-04-20 16:06:22.802209	9
2618	\N	182	2018-04-20 16:06:22.803139	2018-04-20 16:06:22.803139	9
2619	\N	183	2018-04-20 16:06:22.804083	2018-04-20 16:06:22.804083	9
2620	\N	184	2018-04-20 16:06:22.805043	2018-04-20 16:06:22.805043	9
2621	\N	185	2018-04-20 16:06:22.806014	2018-04-20 16:06:22.806014	9
2622	\N	186	2018-04-20 16:06:22.806954	2018-04-20 16:06:22.806954	9
2623	\N	187	2018-04-20 16:06:22.807899	2018-04-20 16:06:22.807899	9
2624	\N	188	2018-04-20 16:06:22.808822	2018-04-20 16:06:22.808822	9
2625	\N	189	2018-04-20 16:06:22.809758	2018-04-20 16:06:22.809758	9
2626	\N	190	2018-04-20 16:06:22.810712	2018-04-20 16:06:22.810712	9
2627	\N	191	2018-04-20 16:06:22.81166	2018-04-20 16:06:22.81166	9
2628	\N	192	2018-04-20 16:06:22.812602	2018-04-20 16:06:22.812602	9
2629	\N	193	2018-04-20 16:06:22.813521	2018-04-20 16:06:22.813521	9
2630	\N	194	2018-04-20 16:06:22.814432	2018-04-20 16:06:22.814432	9
2631	\N	195	2018-04-20 16:06:22.815357	2018-04-20 16:06:22.815357	9
2632	\N	196	2018-04-20 16:06:22.816278	2018-04-20 16:06:22.816278	9
2633	\N	197	2018-04-20 16:06:22.817223	2018-04-20 16:06:22.817223	9
2634	\N	198	2018-04-20 16:06:22.818202	2018-04-20 16:06:22.818202	9
2635	\N	199	2018-04-20 16:06:22.81912	2018-04-20 16:06:22.81912	9
2636	\N	200	2018-04-20 16:06:22.820046	2018-04-20 16:06:22.820046	9
2637	\N	201	2018-04-20 16:06:22.820979	2018-04-20 16:06:22.820979	9
2638	\N	202	2018-04-20 16:06:22.821908	2018-04-20 16:06:22.821908	9
2639	\N	203	2018-04-20 16:06:22.82285	2018-04-20 16:06:22.82285	9
2640	\N	204	2018-04-20 16:06:22.823796	2018-04-20 16:06:22.823796	9
2641	\N	205	2018-04-20 16:06:22.824738	2018-04-20 16:06:22.824738	9
2642	\N	206	2018-04-20 16:06:22.825682	2018-04-20 16:06:22.825682	9
2643	\N	207	2018-04-20 16:06:22.826614	2018-04-20 16:06:22.826614	9
2644	\N	208	2018-04-20 16:06:22.827528	2018-04-20 16:06:22.827528	9
2645	\N	209	2018-04-20 16:06:22.82843	2018-04-20 16:06:22.82843	9
2646	\N	210	2018-04-20 16:06:22.829354	2018-04-20 16:06:22.829354	9
2647	\N	211	2018-04-20 16:06:22.830282	2018-04-20 16:06:22.830282	9
2648	\N	212	2018-04-20 16:06:22.831178	2018-04-20 16:06:22.831178	9
2649	\N	213	2018-04-20 16:06:22.832142	2018-04-20 16:06:22.832142	9
2650	\N	214	2018-04-20 16:06:22.8331	2018-04-20 16:06:22.8331	9
2651	\N	215	2018-04-20 16:06:22.834058	2018-04-20 16:06:22.834058	9
2652	\N	216	2018-04-20 16:06:22.835017	2018-04-20 16:06:22.835017	9
2653	\N	217	2018-04-20 16:06:22.83594	2018-04-20 16:06:22.83594	9
2654	\N	218	2018-04-20 16:06:22.836883	2018-04-20 16:06:22.836883	9
2655	\N	219	2018-04-20 16:06:22.837832	2018-04-20 16:06:22.837832	9
2656	\N	220	2018-04-20 16:06:22.838758	2018-04-20 16:06:22.838758	9
2657	\N	221	2018-04-20 16:06:22.839706	2018-04-20 16:06:22.839706	9
2658	\N	222	2018-04-20 16:06:22.840635	2018-04-20 16:06:22.840635	9
2659	\N	223	2018-04-20 16:06:22.841566	2018-04-20 16:06:22.841566	9
2660	\N	224	2018-04-20 16:06:22.842451	2018-04-20 16:06:22.842451	9
2661	\N	225	2018-04-20 16:06:22.843377	2018-04-20 16:06:22.843377	9
2662	\N	226	2018-04-20 16:06:22.844297	2018-04-20 16:06:22.844297	9
2663	\N	227	2018-04-20 16:06:22.845202	2018-04-20 16:06:22.845202	9
2664	\N	228	2018-04-20 16:06:22.846122	2018-04-20 16:06:22.846122	9
2665	\N	229	2018-04-20 16:06:22.847075	2018-04-20 16:06:22.847075	9
2666	\N	230	2018-04-20 16:06:22.848036	2018-04-20 16:06:22.848036	9
2667	\N	231	2018-04-20 16:06:22.848979	2018-04-20 16:06:22.848979	9
2668	\N	232	2018-04-20 16:06:22.849924	2018-04-20 16:06:22.849924	9
2669	\N	233	2018-04-20 16:06:22.850861	2018-04-20 16:06:22.850861	9
2670	\N	234	2018-04-20 16:06:22.851797	2018-04-20 16:06:22.851797	9
2671	\N	235	2018-04-20 16:06:22.85274	2018-04-20 16:06:22.85274	9
2672	\N	236	2018-04-20 16:06:22.853711	2018-04-20 16:06:22.853711	9
2673	\N	237	2018-04-20 16:06:22.854639	2018-04-20 16:06:22.854639	9
2674	\N	238	2018-04-20 16:06:22.855572	2018-04-20 16:06:22.855572	9
2675	\N	239	2018-04-20 16:06:22.856495	2018-04-20 16:06:22.856495	9
2676	\N	240	2018-04-20 16:06:22.857429	2018-04-20 16:06:22.857429	9
2677	\N	241	2018-04-20 16:06:22.858367	2018-04-20 16:06:22.858367	9
2678	\N	242	2018-04-20 16:06:22.859301	2018-04-20 16:06:22.859301	9
2679	\N	243	2018-04-20 16:06:22.860236	2018-04-20 16:06:22.860236	9
2680	\N	244	2018-04-20 16:06:22.861155	2018-04-20 16:06:22.861155	9
2681	\N	245	2018-04-20 16:06:22.86209	2018-04-20 16:06:22.86209	9
2682	\N	246	2018-04-20 16:06:22.863063	2018-04-20 16:06:22.863063	9
2683	\N	247	2018-04-20 16:06:22.864017	2018-04-20 16:06:22.864017	9
2684	\N	248	2018-04-20 16:06:22.864972	2018-04-20 16:06:22.864972	9
2685	\N	249	2018-04-20 16:06:22.865908	2018-04-20 16:06:22.865908	9
2686	\N	250	2018-04-20 16:06:22.866868	2018-04-20 16:06:22.866868	9
2687	\N	251	2018-04-20 16:06:22.867839	2018-04-20 16:06:22.867839	9
2688	\N	252	2018-04-20 16:06:22.868796	2018-04-20 16:06:22.868796	9
2689	\N	253	2018-04-20 16:06:22.869755	2018-04-20 16:06:22.869755	9
2690	\N	254	2018-04-20 16:06:22.870727	2018-04-20 16:06:22.870727	9
2691	\N	255	2018-04-20 16:06:22.871727	2018-04-20 16:06:22.871727	9
2692	\N	256	2018-04-20 16:06:22.872707	2018-04-20 16:06:22.872707	9
2693	\N	257	2018-04-20 16:06:22.873639	2018-04-20 16:06:22.873639	9
2694	\N	258	2018-04-20 16:06:22.874592	2018-04-20 16:06:22.874592	9
2695	\N	259	2018-04-20 16:06:22.875513	2018-04-20 16:06:22.875513	9
2696	\N	260	2018-04-20 16:06:22.876491	2018-04-20 16:06:22.876491	9
2697	\N	261	2018-04-20 16:06:22.877482	2018-04-20 16:06:22.877482	9
2698	\N	262	2018-04-20 16:06:22.878449	2018-04-20 16:06:22.878449	9
2699	\N	263	2018-04-20 16:06:22.879397	2018-04-20 16:06:22.879397	9
2700	\N	264	2018-04-20 16:06:22.880364	2018-04-20 16:06:22.880364	9
2701	\N	265	2018-04-20 16:06:22.881334	2018-04-20 16:06:22.881334	9
2702	\N	266	2018-04-20 16:06:22.882295	2018-04-20 16:06:22.882295	9
2703	\N	267	2018-04-20 16:06:22.883257	2018-04-20 16:06:22.883257	9
2704	\N	268	2018-04-20 16:06:22.884234	2018-04-20 16:06:22.884234	9
2705	\N	269	2018-04-20 16:06:22.885183	2018-04-20 16:06:22.885183	9
2706	\N	270	2018-04-20 16:06:22.886126	2018-04-20 16:06:22.886126	9
2707	\N	271	2018-04-20 16:06:22.887091	2018-04-20 16:06:22.887091	9
2708	\N	272	2018-04-20 16:06:22.888051	2018-04-20 16:06:22.888051	9
2709	\N	273	2018-04-20 16:06:22.889009	2018-04-20 16:06:22.889009	9
2710	\N	274	2018-04-20 16:06:22.889966	2018-04-20 16:06:22.889966	9
2711	\N	275	2018-04-20 16:06:22.890896	2018-04-20 16:06:22.890896	9
2712	\N	276	2018-04-20 16:06:22.891836	2018-04-20 16:06:22.891836	9
2713	\N	277	2018-04-20 16:06:22.892778	2018-04-20 16:06:22.892778	9
2714	\N	278	2018-04-20 16:06:22.893708	2018-04-20 16:06:22.893708	9
2715	\N	279	2018-04-20 16:06:22.894675	2018-04-20 16:06:22.894675	9
2716	\N	280	2018-04-20 16:06:22.895593	2018-04-20 16:06:22.895593	9
2717	\N	281	2018-04-20 16:06:22.896503	2018-04-20 16:06:22.896503	9
2718	\N	282	2018-04-20 16:06:22.897413	2018-04-20 16:06:22.897413	9
2719	\N	283	2018-04-20 16:06:22.898344	2018-04-20 16:06:22.898344	9
2720	\N	284	2018-04-20 16:06:22.899273	2018-04-20 16:06:22.899273	9
2721	\N	285	2018-04-20 16:06:22.900199	2018-04-20 16:06:22.900199	9
2722	\N	286	2018-04-20 16:06:22.901129	2018-04-20 16:06:22.901129	9
2723	\N	287	2018-04-20 16:06:22.902102	2018-04-20 16:06:22.902102	9
2724	\N	288	2018-04-20 16:06:22.903049	2018-04-20 16:06:22.903049	9
2725	\N	289	2018-04-20 16:06:22.904013	2018-04-20 16:06:22.904013	9
2726	\N	290	2018-04-20 16:06:22.904948	2018-04-20 16:06:22.904948	9
2727	\N	291	2018-04-20 16:06:22.905894	2018-04-20 16:06:22.905894	9
2728	\N	292	2018-04-20 16:06:22.906845	2018-04-20 16:06:22.906845	9
2729	\N	293	2018-04-20 16:06:22.9078	2018-04-20 16:06:22.9078	9
2730	\N	294	2018-04-20 16:06:22.908742	2018-04-20 16:06:22.908742	9
2731	\N	295	2018-04-20 16:06:22.909704	2018-04-20 16:06:22.909704	9
2732	\N	296	2018-04-20 16:06:22.910637	2018-04-20 16:06:22.910637	9
2733	\N	297	2018-04-20 16:06:22.911566	2018-04-20 16:06:22.911566	9
2734	\N	298	2018-04-20 16:06:22.91248	2018-04-20 16:06:22.91248	9
2735	\N	299	2018-04-20 16:06:22.913406	2018-04-20 16:06:22.913406	9
2736	\N	300	2018-04-20 16:06:22.914335	2018-04-20 16:06:22.914335	9
2737	\N	301	2018-04-20 16:06:22.915241	2018-04-20 16:06:22.915241	9
2738	\N	302	2018-04-20 16:06:22.916154	2018-04-20 16:06:22.916154	9
2739	\N	303	2018-04-20 16:06:22.917082	2018-04-20 16:06:22.917082	9
2740	\N	304	2018-04-20 16:06:22.918029	2018-04-20 16:06:22.918029	9
2741	\N	305	2018-04-20 16:06:22.919014	2018-04-20 16:06:22.919014	9
2742	\N	306	2018-04-20 16:06:22.92001	2018-04-20 16:06:22.92001	9
2743	\N	307	2018-04-20 16:06:22.92099	2018-04-20 16:06:22.92099	9
2744	\N	308	2018-04-20 16:06:22.921973	2018-04-20 16:06:22.921973	9
2745	\N	309	2018-04-20 16:06:22.922933	2018-04-20 16:06:22.922933	9
2746	\N	310	2018-04-20 16:06:22.923875	2018-04-20 16:06:22.923875	9
2747	\N	311	2018-04-20 16:06:22.92483	2018-04-20 16:06:22.92483	9
2748	\N	312	2018-04-20 16:06:22.925778	2018-04-20 16:06:22.925778	9
2749	\N	313	2018-04-20 16:06:22.92673	2018-04-20 16:06:22.92673	9
2750	\N	314	2018-04-20 16:06:22.927695	2018-04-20 16:06:22.927695	9
2751	\N	315	2018-04-20 16:06:22.928647	2018-04-20 16:06:22.928647	9
2752	\N	316	2018-04-20 16:06:22.929595	2018-04-20 16:06:22.929595	9
2753	\N	317	2018-04-20 16:06:22.930537	2018-04-20 16:06:22.930537	9
2754	\N	318	2018-04-20 16:06:22.931477	2018-04-20 16:06:22.931477	9
2755	\N	319	2018-04-20 16:06:22.932399	2018-04-20 16:06:22.932399	9
2756	\N	320	2018-04-20 16:06:22.93334	2018-04-20 16:06:22.93334	9
2757	\N	321	2018-04-20 16:06:22.934275	2018-04-20 16:06:22.934275	9
2758	\N	322	2018-04-20 16:06:22.93518	2018-04-20 16:06:22.93518	9
2759	\N	323	2018-04-20 16:06:22.936118	2018-04-20 16:06:22.936118	9
2760	\N	324	2018-04-20 16:06:22.9371	2018-04-20 16:06:22.9371	9
2761	\N	325	2018-04-20 16:06:22.938124	2018-04-20 16:06:22.938124	9
2762	\N	326	2018-04-20 16:06:22.939086	2018-04-20 16:06:22.939086	9
2763	\N	327	2018-04-20 16:06:22.940039	2018-04-20 16:06:22.940039	9
2764	\N	328	2018-04-20 16:06:22.941004	2018-04-20 16:06:22.941004	9
2765	\N	329	2018-04-20 16:06:22.941943	2018-04-20 16:06:22.941943	9
2766	\N	330	2018-04-20 16:06:22.942893	2018-04-20 16:06:22.942893	9
2767	\N	331	2018-04-20 16:06:22.943823	2018-04-20 16:06:22.943823	9
2768	\N	332	2018-04-20 16:06:22.944753	2018-04-20 16:06:22.944753	9
2769	\N	333	2018-04-20 16:06:22.945715	2018-04-20 16:06:22.945715	9
2770	\N	334	2018-04-20 16:06:22.946688	2018-04-20 16:06:22.946688	9
2771	\N	335	2018-04-20 16:06:22.94764	2018-04-20 16:06:22.94764	9
2772	\N	336	2018-04-20 16:06:22.948582	2018-04-20 16:06:22.948582	9
2773	\N	337	2018-04-20 16:06:22.949504	2018-04-20 16:06:22.949504	9
2774	\N	338	2018-04-20 16:06:22.950445	2018-04-20 16:06:22.950445	9
2775	\N	339	2018-04-20 16:06:22.951396	2018-04-20 16:06:22.951396	9
2776	\N	340	2018-04-20 16:06:22.952338	2018-04-20 16:06:22.952338	9
2777	\N	341	2018-04-20 16:06:22.953275	2018-04-20 16:06:22.953275	9
2778	\N	342	2018-04-20 16:06:22.954225	2018-04-20 16:06:22.954225	9
2779	\N	343	2018-04-20 16:06:22.955171	2018-04-20 16:06:22.955171	9
2780	\N	344	2018-04-20 16:06:22.956127	2018-04-20 16:06:22.956127	9
2781	\N	345	2018-04-20 16:06:22.957094	2018-04-20 16:06:22.957094	9
2782	\N	346	2018-04-20 16:06:22.958074	2018-04-20 16:06:22.958074	9
2783	\N	347	2018-04-20 16:06:22.959032	2018-04-20 16:06:22.959032	9
2784	\N	348	2018-04-20 16:06:22.959982	2018-04-20 16:06:22.959982	9
2785	\N	349	2018-04-20 16:06:22.960939	2018-04-20 16:06:22.960939	9
2786	\N	350	2018-04-20 16:06:22.96188	2018-04-20 16:06:22.96188	9
2787	\N	351	2018-04-20 16:06:22.962828	2018-04-20 16:06:22.962828	9
2788	\N	352	2018-04-20 16:06:22.96378	2018-04-20 16:06:22.96378	9
2789	\N	353	2018-04-20 16:06:22.964739	2018-04-20 16:06:22.964739	9
2790	\N	354	2018-04-20 16:06:22.965769	2018-04-20 16:06:22.965769	9
2791	\N	355	2018-04-20 16:06:22.966764	2018-04-20 16:06:22.966764	9
2792	\N	356	2018-04-20 16:06:22.967742	2018-04-20 16:06:22.967742	9
2793	\N	357	2018-04-20 16:06:22.968745	2018-04-20 16:06:22.968745	9
2794	\N	358	2018-04-20 16:06:22.969736	2018-04-20 16:06:22.969736	9
2795	\N	359	2018-04-20 16:06:22.970721	2018-04-20 16:06:22.970721	9
2796	\N	360	2018-04-20 16:06:22.971711	2018-04-20 16:06:22.971711	9
2797	\N	361	2018-04-20 16:06:22.972695	2018-04-20 16:06:22.972695	9
2798	\N	362	2018-04-20 16:06:22.973705	2018-04-20 16:06:22.973705	9
2799	\N	363	2018-04-20 16:06:22.983083	2018-04-20 16:06:22.983083	9
2800	\N	364	2018-04-20 16:06:22.984216	2018-04-20 16:06:22.984216	9
2801	\N	365	2018-04-20 16:06:22.985168	2018-04-20 16:06:22.985168	9
2802	\N	366	2018-04-20 16:06:22.986136	2018-04-20 16:06:22.986136	9
2803	\N	367	2018-04-20 16:06:22.987109	2018-04-20 16:06:22.987109	9
2804	\N	368	2018-04-20 16:06:22.988064	2018-04-20 16:06:22.988064	9
2805	\N	369	2018-04-20 16:06:22.989032	2018-04-20 16:06:22.989032	9
2806	\N	370	2018-04-20 16:06:22.989984	2018-04-20 16:06:22.989984	9
2807	\N	371	2018-04-20 16:06:22.990943	2018-04-20 16:06:22.990943	9
2808	\N	372	2018-04-20 16:06:22.991874	2018-04-20 16:06:22.991874	9
2809	\N	373	2018-04-20 16:06:22.992808	2018-04-20 16:06:22.992808	9
2810	\N	374	2018-04-20 16:06:22.993764	2018-04-20 16:06:22.993764	9
2811	\N	375	2018-04-20 16:06:22.994709	2018-04-20 16:06:22.994709	9
2812	\N	376	2018-04-20 16:06:22.995663	2018-04-20 16:06:22.995663	9
2813	\N	377	2018-04-20 16:06:22.996598	2018-04-20 16:06:22.996598	9
2814	\N	378	2018-04-20 16:06:22.997517	2018-04-20 16:06:22.997517	9
2815	\N	379	2018-04-20 16:06:22.998456	2018-04-20 16:06:22.998456	9
2816	\N	380	2018-04-20 16:06:22.999415	2018-04-20 16:06:22.999415	9
2817	\N	381	2018-04-20 16:06:23.000386	2018-04-20 16:06:23.000386	9
2818	\N	382	2018-04-20 16:06:23.001349	2018-04-20 16:06:23.001349	9
2819	\N	383	2018-04-20 16:06:23.002306	2018-04-20 16:06:23.002306	9
2820	\N	384	2018-04-20 16:06:23.003244	2018-04-20 16:06:23.003244	9
2821	\N	385	2018-04-20 16:06:23.004197	2018-04-20 16:06:23.004197	9
2822	\N	386	2018-04-20 16:06:23.005157	2018-04-20 16:06:23.005157	9
2823	\N	387	2018-04-20 16:06:23.006112	2018-04-20 16:06:23.006112	9
2824	\N	388	2018-04-20 16:06:23.007066	2018-04-20 16:06:23.007066	9
2825	\N	389	2018-04-20 16:06:23.008008	2018-04-20 16:06:23.008008	9
2826	\N	390	2018-04-20 16:06:23.008923	2018-04-20 16:06:23.008923	9
2827	\N	391	2018-04-20 16:06:23.009879	2018-04-20 16:06:23.009879	9
2828	\N	392	2018-04-20 16:06:23.010814	2018-04-20 16:06:23.010814	9
2829	\N	393	2018-04-20 16:06:23.011756	2018-04-20 16:06:23.011756	9
2830	\N	394	2018-04-20 16:06:23.012697	2018-04-20 16:06:23.012697	9
2831	\N	395	2018-04-20 16:06:23.013624	2018-04-20 16:06:23.013624	9
2832	\N	396	2018-04-20 16:06:23.014514	2018-04-20 16:06:23.014514	9
2833	\N	397	2018-04-20 16:06:23.015483	2018-04-20 16:06:23.015483	9
2834	\N	398	2018-04-20 16:06:23.016409	2018-04-20 16:06:23.016409	9
2835	\N	399	2018-04-20 16:06:23.01733	2018-04-20 16:06:23.01733	9
2836	\N	400	2018-04-20 16:06:23.018251	2018-04-20 16:06:23.018251	9
2837	\N	401	2018-04-20 16:06:23.019198	2018-04-20 16:06:23.019198	9
2838	\N	402	2018-04-20 16:06:23.020112	2018-04-20 16:06:23.020112	9
2839	\N	403	2018-04-20 16:06:23.021081	2018-04-20 16:06:23.021081	9
2840	\N	404	2018-04-20 16:06:23.02203	2018-04-20 16:06:23.02203	9
2841	\N	405	2018-04-20 16:06:23.02297	2018-04-20 16:06:23.02297	9
2842	\N	406	2018-04-20 16:06:23.023903	2018-04-20 16:06:23.023903	9
2843	\N	407	2018-04-20 16:06:23.024844	2018-04-20 16:06:23.024844	9
2844	\N	408	2018-04-20 16:06:23.025792	2018-04-20 16:06:23.025792	9
2845	\N	421	2018-04-20 16:06:23.026733	2018-04-20 16:06:23.026733	9
2846	\N	422	2018-04-20 16:06:23.027709	2018-04-20 16:06:23.027709	9
2847	\N	423	2018-04-20 16:06:23.028645	2018-04-20 16:06:23.028645	9
2848	\N	424	2018-04-20 16:06:23.02958	2018-04-20 16:06:23.02958	9
2849	\N	425	2018-04-20 16:06:23.03049	2018-04-20 16:06:23.03049	9
2850	\N	426	2018-04-20 16:06:23.031411	2018-04-20 16:06:23.031411	9
2851	\N	427	2018-04-20 16:06:23.032333	2018-04-20 16:06:23.032333	9
2852	\N	428	2018-04-20 16:06:23.033276	2018-04-20 16:06:23.033276	9
2853	\N	429	2018-04-20 16:06:23.034179	2018-04-20 16:06:23.034179	9
2854	\N	430	2018-04-20 16:06:23.035107	2018-04-20 16:06:23.035107	9
2855	\N	431	2018-04-20 16:06:23.036071	2018-04-20 16:06:23.036071	9
2856	\N	432	2018-04-20 16:06:23.037044	2018-04-20 16:06:23.037044	9
2857	\N	433	2018-04-20 16:06:23.037972	2018-04-20 16:06:23.037972	9
2858	\N	434	2018-04-20 16:06:23.038978	2018-04-20 16:06:23.038978	9
2859	\N	435	2018-04-20 16:06:23.039908	2018-04-20 16:06:23.039908	9
2860	\N	436	2018-04-20 16:06:23.040833	2018-04-20 16:06:23.040833	9
2861	\N	437	2018-04-20 16:06:23.04177	2018-04-20 16:06:23.04177	9
2862	\N	438	2018-04-20 16:06:23.042734	2018-04-20 16:06:23.042734	9
2863	\N	439	2018-04-20 16:06:23.04366	2018-04-20 16:06:23.04366	9
2864	\N	440	2018-04-20 16:06:23.044578	2018-04-20 16:06:23.044578	9
2865	\N	441	2018-04-20 16:06:23.045525	2018-04-20 16:06:23.045525	9
2866	\N	442	2018-04-20 16:06:23.046474	2018-04-20 16:06:23.046474	9
2867	\N	443	2018-04-20 16:06:23.047422	2018-04-20 16:06:23.047422	9
2868	\N	444	2018-04-20 16:06:23.048342	2018-04-20 16:06:23.048342	9
2869	\N	445	2018-04-20 16:06:23.049275	2018-04-20 16:06:23.049275	9
2870	\N	446	2018-04-20 16:06:23.050181	2018-04-20 16:06:23.050181	9
2871	\N	447	2018-04-20 16:06:23.051082	2018-04-20 16:06:23.051082	9
2872	\N	448	2018-04-20 16:06:23.052035	2018-04-20 16:06:23.052035	9
2873	\N	449	2018-04-20 16:06:23.052997	2018-04-20 16:06:23.052997	9
2874	\N	450	2018-04-20 16:06:23.053925	2018-04-20 16:06:23.053925	9
2875	\N	451	2018-04-20 16:06:23.054846	2018-04-20 16:06:23.054846	9
2876	\N	452	2018-04-20 16:06:23.055767	2018-04-20 16:06:23.055767	9
2877	\N	453	2018-04-20 16:06:23.05671	2018-04-20 16:06:23.05671	9
2878	\N	454	2018-04-20 16:06:23.057664	2018-04-20 16:06:23.057664	9
2879	\N	455	2018-04-20 16:06:23.058606	2018-04-20 16:06:23.058606	9
2880	\N	456	2018-04-20 16:06:23.059486	2018-04-20 16:06:23.059486	9
2881	\N	458	2018-04-20 16:06:23.06042	2018-04-20 16:06:23.06042	9
2882	\N	459	2018-04-20 16:06:23.061341	2018-04-20 16:06:23.061341	9
2883	\N	460	2018-04-20 16:06:23.062259	2018-04-20 16:06:23.062259	9
2884	\N	461	2018-04-20 16:06:23.063146	2018-04-20 16:06:23.063146	9
2885	\N	462	2018-04-20 16:06:23.064068	2018-04-20 16:06:23.064068	9
2886	\N	463	2018-04-20 16:06:23.065026	2018-04-20 16:06:23.065026	9
2887	\N	464	2018-04-20 16:06:23.065945	2018-04-20 16:06:23.065945	9
2888	\N	465	2018-04-20 16:06:23.06688	2018-04-20 16:06:23.06688	9
2889	\N	466	2018-04-20 16:06:23.067819	2018-04-20 16:06:23.067819	9
2890	\N	467	2018-04-20 16:06:23.068747	2018-04-20 16:06:23.068747	9
2891	\N	468	2018-04-20 16:06:23.069691	2018-04-20 16:06:23.069691	9
2892	\N	469	2018-04-20 16:06:23.070606	2018-04-20 16:06:23.070606	9
2893	\N	470	2018-04-20 16:06:23.071527	2018-04-20 16:06:23.071527	9
2894	\N	471	2018-04-20 16:06:23.072435	2018-04-20 16:06:23.072435	9
2895	\N	472	2018-04-20 16:06:23.073349	2018-04-20 16:06:23.073349	9
2896	\N	473	2018-04-20 16:06:23.074267	2018-04-20 16:06:23.074267	9
2897	\N	474	2018-04-20 16:06:23.075176	2018-04-20 16:06:23.075176	9
2898	\N	475	2018-04-20 16:06:23.076089	2018-04-20 16:06:23.076089	9
2899	\N	476	2018-04-20 16:06:23.077031	2018-04-20 16:06:23.077031	9
2900	\N	477	2018-04-20 16:06:23.077982	2018-04-20 16:06:23.077982	9
2901	\N	478	2018-04-20 16:06:23.078926	2018-04-20 16:06:23.078926	9
2902	\N	479	2018-04-20 16:06:23.079845	2018-04-20 16:06:23.079845	9
2903	\N	480	2018-04-20 16:06:23.08079	2018-04-20 16:06:23.08079	9
2904	\N	481	2018-04-20 16:06:23.081723	2018-04-20 16:06:23.081723	9
2905	\N	482	2018-04-20 16:06:23.082674	2018-04-20 16:06:23.082674	9
2906	\N	483	2018-04-20 16:06:23.08361	2018-04-20 16:06:23.08361	9
2907	\N	484	2018-04-20 16:06:23.084498	2018-04-20 16:06:23.084498	9
2908	\N	485	2018-04-20 16:06:23.085411	2018-04-20 16:06:23.085411	9
2909	\N	486	2018-04-20 16:06:23.086337	2018-04-20 16:06:23.086337	9
2910	\N	487	2018-04-20 16:06:23.08725	2018-04-20 16:06:23.08725	9
2911	\N	488	2018-04-20 16:06:23.088171	2018-04-20 16:06:23.088171	9
2912	\N	489	2018-04-20 16:06:23.089086	2018-04-20 16:06:23.089086	9
2913	\N	490	2018-04-20 16:06:23.090025	2018-04-20 16:06:23.090025	9
2914	\N	491	2018-04-20 16:06:23.090965	2018-04-20 16:06:23.090965	9
2915	\N	492	2018-04-20 16:06:23.091897	2018-04-20 16:06:23.091897	9
2916	\N	493	2018-04-20 16:06:23.092835	2018-04-20 16:06:23.092835	9
2917	\N	494	2018-04-20 16:06:23.093769	2018-04-20 16:06:23.093769	9
2918	\N	495	2018-04-20 16:06:23.094711	2018-04-20 16:06:23.094711	9
2919	\N	496	2018-04-20 16:06:23.095611	2018-04-20 16:06:23.095611	9
2920	\N	497	2018-04-20 16:06:23.096539	2018-04-20 16:06:23.096539	9
2921	\N	498	2018-04-20 16:06:23.097434	2018-04-20 16:06:23.097434	9
2922	\N	499	2018-04-20 16:06:23.098347	2018-04-20 16:06:23.098347	9
2923	\N	500	2018-04-20 16:06:23.099265	2018-04-20 16:06:23.099265	9
2924	\N	501	2018-04-20 16:06:23.10017	2018-04-20 16:06:23.10017	9
2925	\N	502	2018-04-20 16:06:23.101082	2018-04-20 16:06:23.101082	9
2926	\N	503	2018-04-20 16:06:23.102024	2018-04-20 16:06:23.102024	9
2927	\N	504	2018-04-20 16:06:23.102957	2018-04-20 16:06:23.102957	9
2928	\N	505	2018-04-20 16:06:23.103896	2018-04-20 16:06:23.103896	9
2929	\N	506	2018-04-20 16:06:23.10483	2018-04-20 16:06:23.10483	9
2930	\N	507	2018-04-20 16:06:23.105767	2018-04-20 16:06:23.105767	9
2931	\N	508	2018-04-20 16:06:23.106692	2018-04-20 16:06:23.106692	9
2932	\N	509	2018-04-20 16:06:23.107641	2018-04-20 16:06:23.107641	9
2933	\N	510	2018-04-20 16:06:23.108571	2018-04-20 16:06:23.108571	9
2934	\N	511	2018-04-20 16:06:23.109469	2018-04-20 16:06:23.109469	9
2935	\N	512	2018-04-20 16:06:23.110417	2018-04-20 16:06:23.110417	9
2936	\N	513	2018-04-20 16:06:23.111335	2018-04-20 16:06:23.111335	9
2937	\N	514	2018-04-20 16:06:23.11226	2018-04-20 16:06:23.11226	9
2938	\N	515	2018-04-20 16:06:23.113172	2018-04-20 16:06:23.113172	9
2939	\N	516	2018-04-20 16:06:23.114138	2018-04-20 16:06:23.114138	9
2940	\N	517	2018-04-20 16:06:23.115093	2018-04-20 16:06:23.115093	9
2941	\N	518	2018-04-20 16:06:23.116053	2018-04-20 16:06:23.116053	9
2942	\N	519	2018-04-20 16:06:23.117006	2018-04-20 16:06:23.117006	9
2943	\N	520	2018-04-20 16:06:23.117933	2018-04-20 16:06:23.117933	9
2944	\N	521	2018-04-20 16:06:23.118863	2018-04-20 16:06:23.118863	9
2945	\N	522	2018-04-20 16:06:23.119797	2018-04-20 16:06:23.119797	9
2946	\N	523	2018-04-20 16:06:23.120729	2018-04-20 16:06:23.120729	9
2947	\N	524	2018-04-20 16:06:23.121671	2018-04-20 16:06:23.121671	9
2948	\N	525	2018-04-20 16:06:23.122593	2018-04-20 16:06:23.122593	9
2949	\N	526	2018-04-20 16:06:23.123502	2018-04-20 16:06:23.123502	9
2950	\N	527	2018-04-20 16:06:23.124449	2018-04-20 16:06:23.124449	9
2951	\N	528	2018-04-20 16:06:23.1254	2018-04-20 16:06:23.1254	9
2952	\N	529	2018-04-20 16:06:23.126346	2018-04-20 16:06:23.126346	9
2953	\N	530	2018-04-20 16:06:23.127316	2018-04-20 16:06:23.127316	9
2954	\N	531	2018-04-20 16:06:23.128262	2018-04-20 16:06:23.128262	9
2955	\N	532	2018-04-20 16:06:23.129207	2018-04-20 16:06:23.129207	9
2956	\N	533	2018-04-20 16:06:23.130162	2018-04-20 16:06:23.130162	9
2957	\N	534	2018-04-20 16:06:23.131111	2018-04-20 16:06:23.131111	9
2958	\N	535	2018-04-20 16:06:23.13206	2018-04-20 16:06:23.13206	9
2959	\N	536	2018-04-20 16:06:23.133009	2018-04-20 16:06:23.133009	9
2960	\N	537	2018-04-20 16:06:23.133918	2018-04-20 16:06:23.133918	9
2961	\N	538	2018-04-20 16:06:23.13485	2018-04-20 16:06:23.13485	9
2962	\N	539	2018-04-20 16:06:23.135792	2018-04-20 16:06:23.135792	9
2963	\N	540	2018-04-20 16:06:23.136714	2018-04-20 16:06:23.136714	9
2964	\N	541	2018-04-20 16:06:23.137686	2018-04-20 16:06:23.137686	9
2965	\N	542	2018-04-20 16:06:23.138638	2018-04-20 16:06:23.138638	9
2966	\N	543	2018-04-20 16:06:23.139556	2018-04-20 16:06:23.139556	9
2967	\N	544	2018-04-20 16:06:23.140464	2018-04-20 16:06:23.140464	9
2968	\N	545	2018-04-20 16:06:23.141369	2018-04-20 16:06:23.141369	9
2969	\N	546	2018-04-20 16:06:23.142329	2018-04-20 16:06:23.142329	9
2970	\N	547	2018-04-20 16:06:23.143258	2018-04-20 16:06:23.143258	9
2971	\N	548	2018-04-20 16:06:23.144232	2018-04-20 16:06:23.144232	9
2972	\N	549	2018-04-20 16:06:23.145151	2018-04-20 16:06:23.145151	9
2973	\N	550	2018-04-20 16:06:23.146096	2018-04-20 16:06:23.146096	9
3716	\N	196	2018-05-31 11:50:44.58696	2018-05-31 11:50:44.58696	2
3717	\N	197	2018-05-31 11:50:44.589144	2018-05-31 11:50:44.589144	2
3718	\N	198	2018-05-31 11:50:44.591317	2018-05-31 11:50:44.591317	2
3719	\N	199	2018-05-31 11:50:44.593509	2018-05-31 11:50:44.593509	2
3720	\N	200	2018-05-31 11:50:44.595711	2018-05-31 11:50:44.595711	2
3721	\N	201	2018-05-31 11:50:44.597925	2018-05-31 11:50:44.597925	2
3722	\N	202	2018-05-31 11:50:44.60019	2018-05-31 11:50:44.60019	2
3723	\N	203	2018-05-31 11:50:44.602406	2018-05-31 11:50:44.602406	2
3724	\N	204	2018-05-31 11:50:44.604544	2018-05-31 11:50:44.604544	2
3725	\N	205	2018-05-31 11:50:44.606803	2018-05-31 11:50:44.606803	2
3726	\N	206	2018-05-31 11:50:44.609048	2018-05-31 11:50:44.609048	2
3727	\N	207	2018-05-31 11:50:44.611255	2018-05-31 11:50:44.611255	2
3728	\N	208	2018-05-31 11:50:44.613404	2018-05-31 11:50:44.613404	2
3729	\N	209	2018-05-31 11:50:44.615517	2018-05-31 11:50:44.615517	2
3730	\N	210	2018-05-31 11:50:44.617672	2018-05-31 11:50:44.617672	2
3731	\N	211	2018-05-31 11:50:44.619793	2018-05-31 11:50:44.619793	2
3732	\N	212	2018-05-31 11:50:44.621954	2018-05-31 11:50:44.621954	2
3733	\N	213	2018-05-31 11:50:44.624198	2018-05-31 11:50:44.624198	2
3734	\N	214	2018-05-31 11:50:44.626448	2018-05-31 11:50:44.626448	2
3735	\N	215	2018-05-31 11:50:44.628687	2018-05-31 11:50:44.628687	2
3736	\N	216	2018-05-31 11:50:44.639342	2018-05-31 11:50:44.639342	2
3737	\N	217	2018-05-31 11:50:44.641648	2018-05-31 11:50:44.641648	2
3738	\N	218	2018-05-31 11:50:44.643896	2018-05-31 11:50:44.643896	2
3739	\N	219	2018-05-31 11:50:44.646146	2018-05-31 11:50:44.646146	2
3740	\N	220	2018-05-31 11:50:44.648477	2018-05-31 11:50:44.648477	2
3741	\N	221	2018-05-31 11:50:44.650751	2018-05-31 11:50:44.650751	2
3742	\N	222	2018-05-31 11:50:44.653025	2018-05-31 11:50:44.653025	2
3743	\N	223	2018-05-31 11:50:44.655337	2018-05-31 11:50:44.655337	2
3744	\N	224	2018-05-31 11:50:44.657608	2018-05-31 11:50:44.657608	2
3745	\N	225	2018-05-31 11:50:44.659881	2018-05-31 11:50:44.659881	2
3746	\N	226	2018-05-31 11:50:44.662156	2018-05-31 11:50:44.662156	2
3747	\N	227	2018-05-31 11:50:44.664402	2018-05-31 11:50:44.664402	2
3748	\N	228	2018-05-31 11:50:44.666605	2018-05-31 11:50:44.666605	2
3749	\N	229	2018-05-31 11:50:44.668906	2018-05-31 11:50:44.668906	2
3750	\N	230	2018-05-31 11:50:44.671188	2018-05-31 11:50:44.671188	2
3751	\N	231	2018-05-31 11:50:44.673521	2018-05-31 11:50:44.673521	2
3752	\N	232	2018-05-31 11:50:44.675719	2018-05-31 11:50:44.675719	2
3753	\N	233	2018-05-31 11:50:44.677917	2018-05-31 11:50:44.677917	2
3754	\N	234	2018-05-31 11:50:44.680188	2018-05-31 11:50:44.680188	2
3755	\N	235	2018-05-31 11:50:44.682469	2018-05-31 11:50:44.682469	2
3756	\N	236	2018-05-31 11:50:44.684678	2018-05-31 11:50:44.684678	2
3757	\N	237	2018-05-31 11:50:44.686961	2018-05-31 11:50:44.686961	2
3758	\N	238	2018-05-31 11:50:44.689203	2018-05-31 11:50:44.689203	2
3759	\N	239	2018-05-31 11:50:44.691434	2018-05-31 11:50:44.691434	2
3760	\N	240	2018-05-31 11:50:44.693682	2018-05-31 11:50:44.693682	2
3761	\N	241	2018-05-31 11:50:44.695895	2018-05-31 11:50:44.695895	2
3762	\N	242	2018-05-31 11:50:44.69815	2018-05-31 11:50:44.69815	2
3763	\N	243	2018-05-31 11:50:44.700381	2018-05-31 11:50:44.700381	2
3764	\N	244	2018-05-31 11:50:44.7026	2018-05-31 11:50:44.7026	2
3765	\N	245	2018-05-31 11:50:44.704816	2018-05-31 11:50:44.704816	2
3766	\N	246	2018-05-31 11:50:44.707055	2018-05-31 11:50:44.707055	2
3767	\N	247	2018-05-31 11:50:44.70935	2018-05-31 11:50:44.70935	2
3768	\N	248	2018-05-31 11:50:44.711614	2018-05-31 11:50:44.711614	2
3769	\N	249	2018-05-31 11:50:44.713845	2018-05-31 11:50:44.713845	2
3770	\N	250	2018-05-31 11:50:44.716104	2018-05-31 11:50:44.716104	2
3771	\N	251	2018-05-31 11:50:44.718416	2018-05-31 11:50:44.718416	2
3772	\N	252	2018-05-31 11:50:44.720715	2018-05-31 11:50:44.720715	2
3773	\N	253	2018-05-31 11:50:44.722906	2018-05-31 11:50:44.722906	2
3774	\N	254	2018-05-31 11:50:44.725164	2018-05-31 11:50:44.725164	2
3775	\N	255	2018-05-31 11:50:44.727489	2018-05-31 11:50:44.727489	2
3776	\N	256	2018-05-31 11:50:44.729856	2018-05-31 11:50:44.729856	2
3777	\N	257	2018-05-31 11:50:44.732207	2018-05-31 11:50:44.732207	2
3778	\N	258	2018-05-31 11:50:44.734496	2018-05-31 11:50:44.734496	2
3779	\N	259	2018-05-31 11:50:44.736742	2018-05-31 11:50:44.736742	2
3780	\N	260	2018-05-31 11:50:44.739014	2018-05-31 11:50:44.739014	2
3781	\N	261	2018-05-31 11:50:44.741359	2018-05-31 11:50:44.741359	2
3782	\N	262	2018-05-31 11:50:44.743658	2018-05-31 11:50:44.743658	2
3783	\N	263	2018-05-31 11:50:44.745921	2018-05-31 11:50:44.745921	2
3784	\N	264	2018-05-31 11:50:44.748237	2018-05-31 11:50:44.748237	2
3785	\N	265	2018-05-31 11:50:44.75049	2018-05-31 11:50:44.75049	2
3786	\N	266	2018-05-31 11:50:44.752729	2018-05-31 11:50:44.752729	2
3787	\N	267	2018-05-31 11:50:44.755023	2018-05-31 11:50:44.755023	2
3788	\N	268	2018-05-31 11:50:44.757369	2018-05-31 11:50:44.757369	2
3789	\N	269	2018-05-31 11:50:44.759631	2018-05-31 11:50:44.759631	2
3790	\N	270	2018-05-31 11:50:44.761859	2018-05-31 11:50:44.761859	2
3791	\N	271	2018-05-31 11:50:44.764122	2018-05-31 11:50:44.764122	2
3792	\N	272	2018-05-31 11:50:44.766567	2018-05-31 11:50:44.766567	2
3793	\N	273	2018-05-31 11:50:44.768945	2018-05-31 11:50:44.768945	2
3794	\N	274	2018-05-31 11:50:44.77141	2018-05-31 11:50:44.77141	2
3795	\N	275	2018-05-31 11:50:44.773676	2018-05-31 11:50:44.773676	2
3796	\N	276	2018-05-31 11:50:44.776002	2018-05-31 11:50:44.776002	2
3797	\N	277	2018-05-31 11:50:44.778492	2018-05-31 11:50:44.778492	2
3798	\N	278	2018-05-31 11:50:44.782207	2018-05-31 11:50:44.782207	2
3799	\N	279	2018-05-31 11:50:44.786098	2018-05-31 11:50:44.786098	2
3800	\N	280	2018-05-31 11:50:44.78934	2018-05-31 11:50:44.78934	2
3801	\N	281	2018-05-31 11:50:44.792974	2018-05-31 11:50:44.792974	2
3802	\N	282	2018-05-31 11:50:44.795914	2018-05-31 11:50:44.795914	2
3803	\N	283	2018-05-31 11:50:44.799377	2018-05-31 11:50:44.799377	2
3804	\N	284	2018-05-31 11:50:44.802397	2018-05-31 11:50:44.802397	2
3805	\N	285	2018-05-31 11:50:44.805742	2018-05-31 11:50:44.805742	2
3806	\N	286	2018-05-31 11:50:44.808972	2018-05-31 11:50:44.808972	2
3807	\N	287	2018-05-31 11:50:44.812016	2018-05-31 11:50:44.812016	2
3808	\N	288	2018-05-31 11:50:44.81897	2018-05-31 11:50:44.81897	2
3809	\N	289	2018-05-31 11:50:44.821928	2018-05-31 11:50:44.821928	2
3810	\N	290	2018-05-31 11:50:44.82487	2018-05-31 11:50:44.82487	2
3811	\N	291	2018-05-31 11:50:44.82799	2018-05-31 11:50:44.82799	2
3812	\N	292	2018-05-31 11:50:44.831182	2018-05-31 11:50:44.831182	2
3813	\N	293	2018-05-31 11:50:44.834027	2018-05-31 11:50:44.834027	2
3814	\N	294	2018-05-31 11:50:44.837269	2018-05-31 11:50:44.837269	2
3815	\N	295	2018-05-31 11:50:44.840181	2018-05-31 11:50:44.840181	2
3816	\N	296	2018-05-31 11:50:44.84348	2018-05-31 11:50:44.84348	2
3817	\N	297	2018-05-31 11:50:44.846384	2018-05-31 11:50:44.846384	2
3818	\N	298	2018-05-31 11:50:44.84976	2018-05-31 11:50:44.84976	2
3819	\N	299	2018-05-31 11:50:44.852703	2018-05-31 11:50:44.852703	2
3820	\N	300	2018-05-31 11:50:44.856015	2018-05-31 11:50:44.856015	2
3821	\N	301	2018-05-31 11:50:44.859259	2018-05-31 11:50:44.859259	2
3822	\N	302	2018-05-31 11:50:44.863504	2018-05-31 11:50:44.863504	2
3823	\N	303	2018-05-31 11:50:44.867425	2018-05-31 11:50:44.867425	2
3824	\N	304	2018-05-31 11:50:44.870839	2018-05-31 11:50:44.870839	2
3825	\N	305	2018-05-31 11:50:44.873662	2018-05-31 11:50:44.873662	2
3826	\N	306	2018-05-31 11:50:44.877044	2018-05-31 11:50:44.877044	2
3827	\N	307	2018-05-31 11:50:44.880243	2018-05-31 11:50:44.880243	2
3828	\N	308	2018-05-31 11:50:44.883422	2018-05-31 11:50:44.883422	2
3829	\N	309	2018-05-31 11:50:44.887325	2018-05-31 11:50:44.887325	2
3830	\N	310	2018-05-31 11:50:44.890044	2018-05-31 11:50:44.890044	2
3831	\N	311	2018-05-31 11:50:44.893918	2018-05-31 11:50:44.893918	2
3832	\N	312	2018-05-31 11:50:44.897081	2018-05-31 11:50:44.897081	2
3833	\N	313	2018-05-31 11:50:44.900922	2018-05-31 11:50:44.900922	2
3834	\N	314	2018-05-31 11:50:44.903848	2018-05-31 11:50:44.903848	2
3259	\N	72	2018-05-02 16:09:42.286925	2018-05-02 16:09:42.286925	5
3260	\N	73	2018-05-02 16:09:42.289985	2018-05-02 16:09:42.289985	5
3261	\N	75	2018-05-02 16:09:42.292739	2018-05-02 16:09:42.292739	5
3262	\N	83	2018-05-02 16:09:42.295466	2018-05-02 16:09:42.295466	5
3263	\N	84	2018-05-02 16:09:42.298152	2018-05-02 16:09:42.298152	5
3264	\N	134	2018-05-02 16:09:42.300805	2018-05-02 16:09:42.300805	5
3265	\N	137	2018-05-02 16:09:42.303534	2018-05-02 16:09:42.303534	5
3266	\N	142	2018-05-02 16:09:42.306199	2018-05-02 16:09:42.306199	5
3267	\N	143	2018-05-02 16:09:42.308819	2018-05-02 16:09:42.308819	5
3268	\N	144	2018-05-02 16:09:42.311622	2018-05-02 16:09:42.311622	5
3269	\N	171	2018-05-02 16:09:42.314536	2018-05-02 16:09:42.314536	5
3270	\N	174	2018-05-02 16:09:42.317321	2018-05-02 16:09:42.317321	5
3271	\N	175	2018-05-02 16:09:42.319927	2018-05-02 16:09:42.319927	5
3272	\N	180	2018-05-02 16:09:42.322604	2018-05-02 16:09:42.322604	5
3273	\N	181	2018-05-02 16:09:42.32518	2018-05-02 16:09:42.32518	5
3274	\N	182	2018-05-02 16:09:42.327782	2018-05-02 16:09:42.327782	5
3275	\N	183	2018-05-02 16:09:42.337062	2018-05-02 16:09:42.337062	5
3276	\N	186	2018-05-02 16:09:42.339661	2018-05-02 16:09:42.339661	5
3277	\N	574	2018-05-02 16:09:42.342031	2018-05-02 16:09:42.342031	5
3835	\N	315	2018-05-31 11:50:44.906669	2018-05-31 11:50:44.906669	2
3836	\N	316	2018-05-31 11:50:44.909948	2018-05-31 11:50:44.909948	2
3837	\N	317	2018-05-31 11:50:44.912976	2018-05-31 11:50:44.912976	2
3838	\N	318	2018-05-31 11:50:44.915729	2018-05-31 11:50:44.915729	2
3839	\N	319	2018-05-31 11:50:44.918943	2018-05-31 11:50:44.918943	2
3840	\N	320	2018-05-31 11:50:44.922255	2018-05-31 11:50:44.922255	2
3841	\N	321	2018-05-31 11:50:44.92622	2018-05-31 11:50:44.92622	2
3842	\N	322	2018-05-31 11:50:44.929561	2018-05-31 11:50:44.929561	2
3843	\N	323	2018-05-31 11:50:44.932817	2018-05-31 11:50:44.932817	2
3844	\N	324	2018-05-31 11:50:44.936088	2018-05-31 11:50:44.936088	2
3845	\N	325	2018-05-31 11:50:44.939355	2018-05-31 11:50:44.939355	2
3846	\N	326	2018-05-31 11:50:44.94265	2018-05-31 11:50:44.94265	2
3847	\N	327	2018-05-31 11:50:44.945921	2018-05-31 11:50:44.945921	2
3848	\N	328	2018-05-31 11:50:44.949725	2018-05-31 11:50:44.949725	2
3849	\N	329	2018-05-31 11:50:44.953014	2018-05-31 11:50:44.953014	2
3850	\N	330	2018-05-31 11:50:44.956084	2018-05-31 11:50:44.956084	2
3851	\N	331	2018-05-31 11:50:44.959847	2018-05-31 11:50:44.959847	2
3852	\N	332	2018-05-31 11:50:44.963194	2018-05-31 11:50:44.963194	2
3853	\N	333	2018-05-31 11:50:44.967128	2018-05-31 11:50:44.967128	2
3854	\N	334	2018-05-31 11:50:44.970517	2018-05-31 11:50:44.970517	2
3855	\N	335	2018-05-31 11:50:44.973887	2018-05-31 11:50:44.973887	2
3856	\N	336	2018-05-31 11:50:44.976686	2018-05-31 11:50:44.976686	2
3857	\N	337	2018-05-31 11:50:44.979042	2018-05-31 11:50:44.979042	2
3858	\N	338	2018-05-31 11:50:44.981199	2018-05-31 11:50:44.981199	2
3859	\N	339	2018-05-31 11:50:44.983296	2018-05-31 11:50:44.983296	2
3860	\N	340	2018-05-31 11:50:44.985352	2018-05-31 11:50:44.985352	2
3861	\N	341	2018-05-31 11:50:44.987423	2018-05-31 11:50:44.987423	2
3862	\N	342	2018-05-31 11:50:44.989454	2018-05-31 11:50:44.989454	2
3863	\N	343	2018-05-31 11:50:44.991505	2018-05-31 11:50:44.991505	2
3864	\N	344	2018-05-31 11:50:44.998175	2018-05-31 11:50:44.998175	2
3865	\N	345	2018-05-31 11:50:45.000382	2018-05-31 11:50:45.000382	2
3866	\N	346	2018-05-31 11:50:45.002498	2018-05-31 11:50:45.002498	2
3867	\N	347	2018-05-31 11:50:45.004738	2018-05-31 11:50:45.004738	2
3868	\N	348	2018-05-31 11:50:45.007006	2018-05-31 11:50:45.007006	2
3869	\N	349	2018-05-31 11:50:45.009164	2018-05-31 11:50:45.009164	2
3870	\N	350	2018-05-31 11:50:45.01133	2018-05-31 11:50:45.01133	2
3871	\N	351	2018-05-31 11:50:45.013476	2018-05-31 11:50:45.013476	2
3872	\N	352	2018-05-31 11:50:45.015599	2018-05-31 11:50:45.015599	2
3873	\N	353	2018-05-31 11:50:45.017802	2018-05-31 11:50:45.017802	2
3874	\N	354	2018-05-31 11:50:45.019977	2018-05-31 11:50:45.019977	2
3875	\N	355	2018-05-31 11:50:45.022125	2018-05-31 11:50:45.022125	2
3876	\N	356	2018-05-31 11:50:45.024276	2018-05-31 11:50:45.024276	2
3877	\N	357	2018-05-31 11:50:45.026464	2018-05-31 11:50:45.026464	2
3878	\N	358	2018-05-31 11:50:45.028611	2018-05-31 11:50:45.028611	2
3879	\N	359	2018-05-31 11:50:45.030832	2018-05-31 11:50:45.030832	2
3880	\N	360	2018-05-31 11:50:45.033044	2018-05-31 11:50:45.033044	2
3881	\N	361	2018-05-31 11:50:45.035274	2018-05-31 11:50:45.035274	2
3882	\N	362	2018-05-31 11:50:45.037411	2018-05-31 11:50:45.037411	2
3883	\N	363	2018-05-31 11:50:45.039557	2018-05-31 11:50:45.039557	2
3884	\N	364	2018-05-31 11:50:45.041673	2018-05-31 11:50:45.041673	2
3885	\N	365	2018-05-31 11:50:45.043791	2018-05-31 11:50:45.043791	2
3886	\N	366	2018-05-31 11:50:45.045967	2018-05-31 11:50:45.045967	2
3887	\N	367	2018-05-31 11:50:45.048126	2018-05-31 11:50:45.048126	2
3888	\N	368	2018-05-31 11:50:45.050254	2018-05-31 11:50:45.050254	2
3386	\N	12	2018-05-04 11:59:12.928141	2018-05-04 11:59:12.928141	4
3387	\N	13	2018-05-04 11:59:12.93119	2018-05-04 11:59:12.93119	4
3388	\N	14	2018-05-04 11:59:12.93415	2018-05-04 11:59:12.93415	4
3389	\N	15	2018-05-04 11:59:12.936803	2018-05-04 11:59:12.936803	4
3390	\N	16	2018-05-04 11:59:12.939491	2018-05-04 11:59:12.939491	4
3391	\N	18	2018-05-04 11:59:12.942122	2018-05-04 11:59:12.942122	4
3392	\N	19	2018-05-04 11:59:12.944733	2018-05-04 11:59:12.944733	4
3393	\N	20	2018-05-04 11:59:12.947302	2018-05-04 11:59:12.947302	4
3394	\N	21	2018-05-04 11:59:12.949802	2018-05-04 11:59:12.949802	4
3395	\N	22	2018-05-04 11:59:12.952342	2018-05-04 11:59:12.952342	4
3396	\N	23	2018-05-04 11:59:12.954824	2018-05-04 11:59:12.954824	4
3397	\N	24	2018-05-04 11:59:12.957315	2018-05-04 11:59:12.957315	4
3398	\N	25	2018-05-04 11:59:12.9597	2018-05-04 11:59:12.9597	4
3399	\N	26	2018-05-04 11:59:12.962145	2018-05-04 11:59:12.962145	4
3400	\N	72	2018-05-04 11:59:12.964591	2018-05-04 11:59:12.964591	4
3401	\N	73	2018-05-04 11:59:12.967009	2018-05-04 11:59:12.967009	4
3402	\N	74	2018-05-04 11:59:12.969453	2018-05-04 11:59:12.969453	4
3403	\N	75	2018-05-04 11:59:12.971835	2018-05-04 11:59:12.971835	4
3404	\N	76	2018-05-04 11:59:12.974284	2018-05-04 11:59:12.974284	4
3405	\N	171	2018-05-04 11:59:12.976633	2018-05-04 11:59:12.976633	4
3406	\N	173	2018-05-04 11:59:12.978943	2018-05-04 11:59:12.978943	4
3407	\N	175	2018-05-04 11:59:12.981362	2018-05-04 11:59:12.981362	4
3408	\N	291	2018-05-04 11:59:12.983869	2018-05-04 11:59:12.983869	4
3409	\N	292	2018-05-04 11:59:12.986332	2018-05-04 11:59:12.986332	4
3410	\N	293	2018-05-04 11:59:12.98877	2018-05-04 11:59:12.98877	4
3411	\N	294	2018-05-04 11:59:12.991237	2018-05-04 11:59:12.991237	4
3412	\N	295	2018-05-04 11:59:12.993665	2018-05-04 11:59:12.993665	4
3413	\N	297	2018-05-04 11:59:12.996076	2018-05-04 11:59:12.996076	4
3414	\N	298	2018-05-04 11:59:12.998518	2018-05-04 11:59:12.998518	4
3415	\N	299	2018-05-04 11:59:13.000886	2018-05-04 11:59:13.000886	4
3416	\N	300	2018-05-04 11:59:13.003301	2018-05-04 11:59:13.003301	4
3417	\N	301	2018-05-04 11:59:13.005643	2018-05-04 11:59:13.005643	4
3418	\N	302	2018-05-04 11:59:13.007999	2018-05-04 11:59:13.007999	4
3419	\N	303	2018-05-04 11:59:13.010405	2018-05-04 11:59:13.010405	4
3420	\N	304	2018-05-04 11:59:13.012769	2018-05-04 11:59:13.012769	4
3421	\N	305	2018-05-04 11:59:13.015146	2018-05-04 11:59:13.015146	4
3422	\N	306	2018-05-04 11:59:13.017524	2018-05-04 11:59:13.017524	4
3423	\N	307	2018-05-04 11:59:13.01993	2018-05-04 11:59:13.01993	4
3424	\N	309	2018-05-04 11:59:13.022364	2018-05-04 11:59:13.022364	4
3425	\N	311	2018-05-04 11:59:13.031888	2018-05-04 11:59:13.031888	4
3426	\N	312	2018-05-04 11:59:13.034238	2018-05-04 11:59:13.034238	4
3427	\N	313	2018-05-04 11:59:13.036418	2018-05-04 11:59:13.036418	4
3428	\N	327	2018-05-04 11:59:13.038625	2018-05-04 11:59:13.038625	4
3429	\N	328	2018-05-04 11:59:13.040835	2018-05-04 11:59:13.040835	4
3430	\N	329	2018-05-04 11:59:13.043044	2018-05-04 11:59:13.043044	4
3431	\N	330	2018-05-04 11:59:13.045294	2018-05-04 11:59:13.045294	4
3432	\N	334	2018-05-04 11:59:13.047518	2018-05-04 11:59:13.047518	4
3433	\N	335	2018-05-04 11:59:13.049686	2018-05-04 11:59:13.049686	4
3434	\N	336	2018-05-04 11:59:13.051884	2018-05-04 11:59:13.051884	4
3435	\N	397	2018-05-04 11:59:13.054088	2018-05-04 11:59:13.054088	4
3436	\N	398	2018-05-04 11:59:13.056306	2018-05-04 11:59:13.056306	4
3437	\N	399	2018-05-04 11:59:13.058493	2018-05-04 11:59:13.058493	4
3438	\N	400	2018-05-04 11:59:13.0606	2018-05-04 11:59:13.0606	4
3439	\N	401	2018-05-04 11:59:13.062809	2018-05-04 11:59:13.062809	4
3440	\N	407	2018-05-04 11:59:13.065014	2018-05-04 11:59:13.065014	4
3441	\N	421	2018-05-04 11:59:13.06722	2018-05-04 11:59:13.06722	4
3442	\N	435	2018-05-04 11:59:13.069437	2018-05-04 11:59:13.069437	4
3443	\N	436	2018-05-04 11:59:13.071582	2018-05-04 11:59:13.071582	4
3444	\N	437	2018-05-04 11:59:13.073712	2018-05-04 11:59:13.073712	4
3445	\N	438	2018-05-04 11:59:13.075884	2018-05-04 11:59:13.075884	4
3446	\N	447	2018-05-04 11:59:13.078144	2018-05-04 11:59:13.078144	4
3447	\N	448	2018-05-04 11:59:13.080267	2018-05-04 11:59:13.080267	4
3448	\N	488	2018-05-04 11:59:13.08238	2018-05-04 11:59:13.08238	4
3449	\N	490	2018-05-04 11:59:13.084529	2018-05-04 11:59:13.084529	4
3450	\N	491	2018-05-04 11:59:13.086618	2018-05-04 11:59:13.086618	4
3451	\N	492	2018-05-04 11:59:13.088747	2018-05-04 11:59:13.088747	4
3452	\N	493	2018-05-04 11:59:13.090874	2018-05-04 11:59:13.090874	4
3453	\N	494	2018-05-04 11:59:13.093049	2018-05-04 11:59:13.093049	4
3454	\N	499	2018-05-04 11:59:13.09518	2018-05-04 11:59:13.09518	4
3455	\N	500	2018-05-04 11:59:13.097317	2018-05-04 11:59:13.097317	4
3456	\N	501	2018-05-04 11:59:13.099469	2018-05-04 11:59:13.099469	4
3457	\N	502	2018-05-04 11:59:13.101555	2018-05-04 11:59:13.101555	4
3458	\N	503	2018-05-04 11:59:13.103657	2018-05-04 11:59:13.103657	4
3459	\N	506	2018-05-04 11:59:13.105805	2018-05-04 11:59:13.105805	4
3460	\N	528	2018-05-04 11:59:13.107954	2018-05-04 11:59:13.107954	4
3461	\N	529	2018-05-04 11:59:13.110131	2018-05-04 11:59:13.110131	4
3462	\N	530	2018-05-04 11:59:13.112266	2018-05-04 11:59:13.112266	4
3463	\N	531	2018-05-04 11:59:13.114381	2018-05-04 11:59:13.114381	4
3464	\N	532	2018-05-04 11:59:13.116501	2018-05-04 11:59:13.116501	4
3465	\N	575	2018-05-04 11:59:13.118614	2018-05-04 11:59:13.118614	4
3466	\N	576	2018-05-04 11:59:13.120709	2018-05-04 11:59:13.120709	4
3467	\N	41	2018-05-04 11:59:34.244461	2018-05-04 11:59:34.244461	3
3468	\N	42	2018-05-04 11:59:34.247501	2018-05-04 11:59:34.247501	3
3469	\N	43	2018-05-04 11:59:34.250202	2018-05-04 11:59:34.250202	3
3470	\N	44	2018-05-04 11:59:34.253062	2018-05-04 11:59:34.253062	3
3471	\N	46	2018-05-04 11:59:34.255901	2018-05-04 11:59:34.255901	3
3472	\N	47	2018-05-04 11:59:34.258627	2018-05-04 11:59:34.258627	3
3473	\N	72	2018-05-04 11:59:34.261281	2018-05-04 11:59:34.261281	3
3474	\N	73	2018-05-04 11:59:34.263862	2018-05-04 11:59:34.263862	3
3475	\N	74	2018-05-04 11:59:34.266499	2018-05-04 11:59:34.266499	3
3476	\N	75	2018-05-04 11:59:34.269087	2018-05-04 11:59:34.269087	3
3477	\N	76	2018-05-04 11:59:34.271678	2018-05-04 11:59:34.271678	3
3478	\N	78	2018-05-04 11:59:34.274306	2018-05-04 11:59:34.274306	3
3479	\N	79	2018-05-04 11:59:34.276894	2018-05-04 11:59:34.276894	3
3480	\N	80	2018-05-04 11:59:34.279468	2018-05-04 11:59:34.279468	3
3481	\N	134	2018-05-04 11:59:34.282005	2018-05-04 11:59:34.282005	3
3482	\N	137	2018-05-04 11:59:34.284571	2018-05-04 11:59:34.284571	3
3483	\N	138	2018-05-04 11:59:34.287071	2018-05-04 11:59:34.287071	3
3484	\N	142	2018-05-04 11:59:34.289592	2018-05-04 11:59:34.289592	3
3485	\N	143	2018-05-04 11:59:34.292061	2018-05-04 11:59:34.292061	3
3486	\N	144	2018-05-04 11:59:34.29458	2018-05-04 11:59:34.29458	3
3487	\N	171	2018-05-04 11:59:34.297054	2018-05-04 11:59:34.297054	3
3488	\N	174	2018-05-04 11:59:34.299508	2018-05-04 11:59:34.299508	3
3489	\N	175	2018-05-04 11:59:34.301934	2018-05-04 11:59:34.301934	3
3490	\N	181	2018-05-04 11:59:34.30443	2018-05-04 11:59:34.30443	3
3491	\N	182	2018-05-04 11:59:34.306826	2018-05-04 11:59:34.306826	3
3492	\N	186	2018-05-04 11:59:34.309276	2018-05-04 11:59:34.309276	3
3493	\N	188	2018-05-04 11:59:34.311637	2018-05-04 11:59:34.311637	3
3494	\N	195	2018-05-04 11:59:34.313981	2018-05-04 11:59:34.313981	3
3495	\N	196	2018-05-04 11:59:34.316445	2018-05-04 11:59:34.316445	3
3496	\N	197	2018-05-04 11:59:34.318825	2018-05-04 11:59:34.318825	3
3497	\N	493	2018-05-04 11:59:34.321202	2018-05-04 11:59:34.321202	3
3498	\N	494	2018-05-04 11:59:34.323576	2018-05-04 11:59:34.323576	3
3499	\N	495	2018-05-04 11:59:34.325938	2018-05-04 11:59:34.325938	3
3500	\N	496	2018-05-04 11:59:34.32836	2018-05-04 11:59:34.32836	3
3501	\N	497	2018-05-04 11:59:34.33076	2018-05-04 11:59:34.33076	3
3502	\N	498	2018-05-04 11:59:34.333097	2018-05-04 11:59:34.333097	3
3503	\N	499	2018-05-04 11:59:34.335528	2018-05-04 11:59:34.335528	3
3504	\N	500	2018-05-04 11:59:34.337842	2018-05-04 11:59:34.337842	3
3505	\N	501	2018-05-04 11:59:34.340221	2018-05-04 11:59:34.340221	3
3506	\N	502	2018-05-04 11:59:34.342569	2018-05-04 11:59:34.342569	3
3507	\N	503	2018-05-04 11:59:34.344923	2018-05-04 11:59:34.344923	3
3508	\N	504	2018-05-04 11:59:34.347329	2018-05-04 11:59:34.347329	3
3509	\N	505	2018-05-04 11:59:34.349696	2018-05-04 11:59:34.349696	3
3510	\N	506	2018-05-04 11:59:34.352009	2018-05-04 11:59:34.352009	3
3511	\N	507	2018-05-04 11:59:34.354392	2018-05-04 11:59:34.354392	3
3512	\N	510	2018-05-04 11:59:34.356706	2018-05-04 11:59:34.356706	3
3513	\N	567	2018-05-04 11:59:34.358932	2018-05-04 11:59:34.358932	3
3514	\N	568	2018-05-04 11:59:34.361279	2018-05-04 11:59:34.361279	3
3515	\N	569	2018-05-04 11:59:34.363616	2018-05-04 11:59:34.363616	3
3516	\N	570	2018-05-04 11:59:34.365909	2018-05-04 11:59:34.365909	3
3517	\N	571	2018-05-04 11:59:34.368265	2018-05-04 11:59:34.368265	3
3518	\N	572	2018-05-04 11:59:34.370602	2018-05-04 11:59:34.370602	3
3519	\N	573	2018-05-04 11:59:34.373007	2018-05-04 11:59:34.373007	3
3520	\N	575	2018-05-04 11:59:34.375518	2018-05-04 11:59:34.375518	3
3521	\N	576	2018-05-04 11:59:34.386425	2018-05-04 11:59:34.386425	3
3889	\N	369	2018-05-31 11:50:45.05239	2018-05-31 11:50:45.05239	2
3890	\N	370	2018-05-31 11:50:45.054541	2018-05-31 11:50:45.054541	2
3891	\N	371	2018-05-31 11:50:45.05662	2018-05-31 11:50:45.05662	2
3892	\N	372	2018-05-31 11:50:45.058737	2018-05-31 11:50:45.058737	2
3893	\N	373	2018-05-31 11:50:45.060801	2018-05-31 11:50:45.060801	2
3894	\N	374	2018-05-31 11:50:45.062974	2018-05-31 11:50:45.062974	2
3895	\N	375	2018-05-31 11:50:45.065108	2018-05-31 11:50:45.065108	2
3896	\N	376	2018-05-31 11:50:45.067282	2018-05-31 11:50:45.067282	2
3897	\N	377	2018-05-31 11:50:45.069424	2018-05-31 11:50:45.069424	2
3898	\N	378	2018-05-31 11:50:45.071541	2018-05-31 11:50:45.071541	2
3899	\N	379	2018-05-31 11:50:45.073657	2018-05-31 11:50:45.073657	2
3900	\N	380	2018-05-31 11:50:45.075749	2018-05-31 11:50:45.075749	2
3901	\N	381	2018-05-31 11:50:45.077829	2018-05-31 11:50:45.077829	2
3902	\N	382	2018-05-31 11:50:45.079958	2018-05-31 11:50:45.079958	2
3903	\N	383	2018-05-31 11:50:45.082071	2018-05-31 11:50:45.082071	2
3904	\N	384	2018-05-31 11:50:45.084239	2018-05-31 11:50:45.084239	2
3905	\N	385	2018-05-31 11:50:45.086394	2018-05-31 11:50:45.086394	2
3906	\N	386	2018-05-31 11:50:45.088556	2018-05-31 11:50:45.088556	2
3907	\N	387	2018-05-31 11:50:45.090844	2018-05-31 11:50:45.090844	2
3908	\N	388	2018-05-31 11:50:45.093002	2018-05-31 11:50:45.093002	2
3909	\N	389	2018-05-31 11:50:45.095167	2018-05-31 11:50:45.095167	2
3910	\N	390	2018-05-31 11:50:45.097361	2018-05-31 11:50:45.097361	2
3911	\N	391	2018-05-31 11:50:45.09947	2018-05-31 11:50:45.09947	2
3912	\N	392	2018-05-31 11:50:45.101591	2018-05-31 11:50:45.101591	2
3913	\N	393	2018-05-31 11:50:45.103698	2018-05-31 11:50:45.103698	2
3914	\N	394	2018-05-31 11:50:45.105846	2018-05-31 11:50:45.105846	2
3915	\N	395	2018-05-31 11:50:45.108001	2018-05-31 11:50:45.108001	2
3916	\N	396	2018-05-31 11:50:45.110308	2018-05-31 11:50:45.110308	2
3917	\N	397	2018-05-31 11:50:45.112501	2018-05-31 11:50:45.112501	2
3918	\N	398	2018-05-31 11:50:45.114601	2018-05-31 11:50:45.114601	2
3919	\N	399	2018-05-31 11:50:45.116715	2018-05-31 11:50:45.116715	2
3920	\N	400	2018-05-31 11:50:45.118799	2018-05-31 11:50:45.118799	2
3921	\N	401	2018-05-31 11:50:45.120943	2018-05-31 11:50:45.120943	2
3922	\N	402	2018-05-31 11:50:45.123108	2018-05-31 11:50:45.123108	2
3923	\N	403	2018-05-31 11:50:45.125411	2018-05-31 11:50:45.125411	2
3924	\N	404	2018-05-31 11:50:45.127582	2018-05-31 11:50:45.127582	2
3925	\N	405	2018-05-31 11:50:45.129697	2018-05-31 11:50:45.129697	2
3926	\N	406	2018-05-31 11:50:45.131859	2018-05-31 11:50:45.131859	2
3927	\N	407	2018-05-31 11:50:45.133934	2018-05-31 11:50:45.133934	2
3928	\N	408	2018-05-31 11:50:45.136049	2018-05-31 11:50:45.136049	2
3929	\N	421	2018-05-31 11:50:45.138243	2018-05-31 11:50:45.138243	2
3930	\N	422	2018-05-31 11:50:45.140387	2018-05-31 11:50:45.140387	2
3931	\N	423	2018-05-31 11:50:45.142454	2018-05-31 11:50:45.142454	2
3932	\N	424	2018-05-31 11:50:45.144524	2018-05-31 11:50:45.144524	2
3933	\N	425	2018-05-31 11:50:45.146612	2018-05-31 11:50:45.146612	2
3934	\N	426	2018-05-31 11:50:45.14872	2018-05-31 11:50:45.14872	2
3935	\N	427	2018-05-31 11:50:45.150837	2018-05-31 11:50:45.150837	2
3936	\N	428	2018-05-31 11:50:45.152928	2018-05-31 11:50:45.152928	2
3937	\N	429	2018-05-31 11:50:45.155028	2018-05-31 11:50:45.155028	2
3938	\N	430	2018-05-31 11:50:45.157204	2018-05-31 11:50:45.157204	2
3939	\N	431	2018-05-31 11:50:45.159329	2018-05-31 11:50:45.159329	2
3940	\N	432	2018-05-31 11:50:45.161472	2018-05-31 11:50:45.161472	2
3941	\N	433	2018-05-31 11:50:45.163553	2018-05-31 11:50:45.163553	2
3942	\N	434	2018-05-31 11:50:45.165715	2018-05-31 11:50:45.165715	2
3943	\N	435	2018-05-31 11:50:45.167827	2018-05-31 11:50:45.167827	2
3944	\N	436	2018-05-31 11:50:45.169951	2018-05-31 11:50:45.169951	2
3945	\N	437	2018-05-31 11:50:45.172174	2018-05-31 11:50:45.172174	2
3946	\N	438	2018-05-31 11:50:45.174345	2018-05-31 11:50:45.174345	2
3947	\N	439	2018-05-31 11:50:45.176492	2018-05-31 11:50:45.176492	2
3948	\N	440	2018-05-31 11:50:45.178568	2018-05-31 11:50:45.178568	2
3949	\N	441	2018-05-31 11:50:45.180737	2018-05-31 11:50:45.180737	2
3950	\N	442	2018-05-31 11:50:45.182836	2018-05-31 11:50:45.182836	2
3951	\N	443	2018-05-31 11:50:45.184982	2018-05-31 11:50:45.184982	2
3952	\N	444	2018-05-31 11:50:45.187148	2018-05-31 11:50:45.187148	2
3953	\N	445	2018-05-31 11:50:45.189246	2018-05-31 11:50:45.189246	2
3954	\N	446	2018-05-31 11:50:45.191367	2018-05-31 11:50:45.191367	2
3955	\N	447	2018-05-31 11:50:45.19343	2018-05-31 11:50:45.19343	2
3956	\N	448	2018-05-31 11:50:45.19556	2018-05-31 11:50:45.19556	2
3957	\N	449	2018-05-31 11:50:45.197635	2018-05-31 11:50:45.197635	2
3958	\N	450	2018-05-31 11:50:45.199843	2018-05-31 11:50:45.199843	2
3959	\N	451	2018-05-31 11:50:45.202045	2018-05-31 11:50:45.202045	2
3960	\N	452	2018-05-31 11:50:45.204267	2018-05-31 11:50:45.204267	2
3961	\N	453	2018-05-31 11:50:45.206467	2018-05-31 11:50:45.206467	2
3962	\N	454	2018-05-31 11:50:45.20858	2018-05-31 11:50:45.20858	2
3963	\N	455	2018-05-31 11:50:45.210693	2018-05-31 11:50:45.210693	2
3964	\N	456	2018-05-31 11:50:45.212884	2018-05-31 11:50:45.212884	2
3965	\N	458	2018-05-31 11:50:45.215057	2018-05-31 11:50:45.215057	2
3966	\N	459	2018-05-31 11:50:45.217265	2018-05-31 11:50:45.217265	2
3967	\N	460	2018-05-31 11:50:45.219454	2018-05-31 11:50:45.219454	2
3968	\N	461	2018-05-31 11:50:45.221643	2018-05-31 11:50:45.221643	2
3969	\N	462	2018-05-31 11:50:45.223798	2018-05-31 11:50:45.223798	2
3970	\N	463	2018-05-31 11:50:45.225976	2018-05-31 11:50:45.225976	2
3971	\N	464	2018-05-31 11:50:45.228154	2018-05-31 11:50:45.228154	2
3972	\N	465	2018-05-31 11:50:45.230284	2018-05-31 11:50:45.230284	2
3973	\N	466	2018-05-31 11:50:45.232411	2018-05-31 11:50:45.232411	2
3974	\N	467	2018-05-31 11:50:45.234569	2018-05-31 11:50:45.234569	2
3975	\N	468	2018-05-31 11:50:45.236684	2018-05-31 11:50:45.236684	2
3976	\N	469	2018-05-31 11:50:45.238891	2018-05-31 11:50:45.238891	2
3977	\N	470	2018-05-31 11:50:45.241099	2018-05-31 11:50:45.241099	2
3978	\N	471	2018-05-31 11:50:45.243332	2018-05-31 11:50:45.243332	2
3979	\N	472	2018-05-31 11:50:45.245488	2018-05-31 11:50:45.245488	2
3980	\N	473	2018-05-31 11:50:45.24762	2018-05-31 11:50:45.24762	2
3981	\N	474	2018-05-31 11:50:45.249753	2018-05-31 11:50:45.249753	2
3982	\N	475	2018-05-31 11:50:45.251979	2018-05-31 11:50:45.251979	2
3983	\N	476	2018-05-31 11:50:45.25417	2018-05-31 11:50:45.25417	2
3984	\N	477	2018-05-31 11:50:45.256332	2018-05-31 11:50:45.256332	2
3985	\N	478	2018-05-31 11:50:45.25852	2018-05-31 11:50:45.25852	2
3986	\N	479	2018-05-31 11:50:45.260692	2018-05-31 11:50:45.260692	2
3987	\N	480	2018-05-31 11:50:45.262846	2018-05-31 11:50:45.262846	2
3988	\N	481	2018-05-31 11:50:45.265055	2018-05-31 11:50:45.265055	2
3989	\N	482	2018-05-31 11:50:45.267329	2018-05-31 11:50:45.267329	2
3990	\N	483	2018-05-31 11:50:45.269493	2018-05-31 11:50:45.269493	2
3991	\N	484	2018-05-31 11:50:45.271691	2018-05-31 11:50:45.271691	2
3992	\N	485	2018-05-31 11:50:45.273887	2018-05-31 11:50:45.273887	2
3993	\N	486	2018-05-31 11:50:45.276107	2018-05-31 11:50:45.276107	2
3994	\N	493	2018-05-31 11:50:45.278449	2018-05-31 11:50:45.278449	2
3995	\N	494	2018-05-31 11:50:45.280691	2018-05-31 11:50:45.280691	2
3996	\N	495	2018-05-31 11:50:45.282908	2018-05-31 11:50:45.282908	2
3997	\N	496	2018-05-31 11:50:45.285173	2018-05-31 11:50:45.285173	2
3998	\N	497	2018-05-31 11:50:45.287417	2018-05-31 11:50:45.287417	2
3999	\N	498	2018-05-31 11:50:45.289661	2018-05-31 11:50:45.289661	2
4000	\N	499	2018-05-31 11:50:45.29191	2018-05-31 11:50:45.29191	2
4001	\N	500	2018-05-31 11:50:45.294167	2018-05-31 11:50:45.294167	2
4002	\N	501	2018-05-31 11:50:45.301048	2018-05-31 11:50:45.301048	2
4003	\N	502	2018-05-31 11:50:45.303865	2018-05-31 11:50:45.303865	2
4004	\N	503	2018-05-31 11:50:45.30666	2018-05-31 11:50:45.30666	2
4005	\N	504	2018-05-31 11:50:45.309518	2018-05-31 11:50:45.309518	2
4006	\N	505	2018-05-31 11:50:45.312263	2018-05-31 11:50:45.312263	2
4007	\N	506	2018-05-31 11:50:45.314917	2018-05-31 11:50:45.314917	2
4008	\N	507	2018-05-31 11:50:45.317609	2018-05-31 11:50:45.317609	2
4009	\N	508	2018-05-31 11:50:45.320255	2018-05-31 11:50:45.320255	2
4010	\N	509	2018-05-31 11:50:45.322841	2018-05-31 11:50:45.322841	2
4011	\N	510	2018-05-31 11:50:45.325502	2018-05-31 11:50:45.325502	2
4012	\N	511	2018-05-31 11:50:45.328069	2018-05-31 11:50:45.328069	2
4013	\N	512	2018-05-31 11:50:45.330663	2018-05-31 11:50:45.330663	2
4014	\N	513	2018-05-31 11:50:45.333164	2018-05-31 11:50:45.333164	2
4015	\N	514	2018-05-31 11:50:45.335678	2018-05-31 11:50:45.335678	2
4016	\N	515	2018-05-31 11:50:45.338101	2018-05-31 11:50:45.338101	2
4017	\N	516	2018-05-31 11:50:45.340592	2018-05-31 11:50:45.340592	2
4018	\N	517	2018-05-31 11:50:45.343011	2018-05-31 11:50:45.343011	2
4019	\N	518	2018-05-31 11:50:45.345453	2018-05-31 11:50:45.345453	2
4020	\N	519	2018-05-31 11:50:45.34787	2018-05-31 11:50:45.34787	2
4021	\N	520	2018-05-31 11:50:45.350304	2018-05-31 11:50:45.350304	2
4022	\N	521	2018-05-31 11:50:45.352676	2018-05-31 11:50:45.352676	2
4023	\N	522	2018-05-31 11:50:45.355064	2018-05-31 11:50:45.355064	2
4024	\N	523	2018-05-31 11:50:45.357436	2018-05-31 11:50:45.357436	2
4025	\N	524	2018-05-31 11:50:45.359787	2018-05-31 11:50:45.359787	2
4026	\N	525	2018-05-31 11:50:45.36211	2018-05-31 11:50:45.36211	2
4027	\N	526	2018-05-31 11:50:45.364447	2018-05-31 11:50:45.364447	2
4028	\N	527	2018-05-31 11:50:45.366742	2018-05-31 11:50:45.366742	2
4029	\N	528	2018-05-31 11:50:45.369032	2018-05-31 11:50:45.369032	2
4030	\N	529	2018-05-31 11:50:45.371458	2018-05-31 11:50:45.371458	2
4031	\N	530	2018-05-31 11:50:45.373765	2018-05-31 11:50:45.373765	2
4032	\N	531	2018-05-31 11:50:45.376052	2018-05-31 11:50:45.376052	2
4033	\N	532	2018-05-31 11:50:45.378391	2018-05-31 11:50:45.378391	2
4034	\N	533	2018-05-31 11:50:45.380766	2018-05-31 11:50:45.380766	2
4035	\N	534	2018-05-31 11:50:45.383095	2018-05-31 11:50:45.383095	2
4036	\N	535	2018-05-31 11:50:45.38548	2018-05-31 11:50:45.38548	2
4037	\N	536	2018-05-31 11:50:45.387707	2018-05-31 11:50:45.387707	2
4038	\N	537	2018-05-31 11:50:45.389958	2018-05-31 11:50:45.389958	2
4039	\N	538	2018-05-31 11:50:45.392245	2018-05-31 11:50:45.392245	2
4040	\N	539	2018-05-31 11:50:45.394558	2018-05-31 11:50:45.394558	2
4041	\N	540	2018-05-31 11:50:45.396805	2018-05-31 11:50:45.396805	2
4042	\N	541	2018-05-31 11:50:45.399046	2018-05-31 11:50:45.399046	2
4043	\N	542	2018-05-31 11:50:45.401394	2018-05-31 11:50:45.401394	2
4044	\N	543	2018-05-31 11:50:45.403689	2018-05-31 11:50:45.403689	2
4045	\N	544	2018-05-31 11:50:45.405891	2018-05-31 11:50:45.405891	2
4046	\N	545	2018-05-31 11:50:45.408293	2018-05-31 11:50:45.408293	2
4047	\N	546	2018-05-31 11:50:45.410683	2018-05-31 11:50:45.410683	2
4048	\N	547	2018-05-31 11:50:45.413103	2018-05-31 11:50:45.413103	2
4049	\N	548	2018-05-31 11:50:45.415527	2018-05-31 11:50:45.415527	2
4050	\N	549	2018-05-31 11:50:45.417877	2018-05-31 11:50:45.417877	2
4051	\N	550	2018-05-31 11:50:45.420239	2018-05-31 11:50:45.420239	2
\.


--
-- Name: permissions_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('permissions_roles_id_seq', 4051, true);


--
-- Data for Name: person_contact_infos; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY person_contact_infos (id, person_id, contact_number, email, postal_address, location_address, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, suburb_id) FROM stdin;
134	135	0245667787	andy@gmail.com				36	\N	t	f	2018-04-12 12:09:33.290206	2018-04-12 12:09:33.290206	2
135	136	0248021199                                        	Clara@gmail.com				36	\N	t	f	2018-04-12 12:57:44.354646	2018-04-12 13:07:10.548494	1
136	137	0541840988                                        	padmorey@gmail.com				36	\N	t	f	2018-04-12 13:02:17.101252	2018-04-12 13:07:26.652698	1
137	138	0504899386                                        	andymistic37@gmail.com				36	\N	t	f	2018-04-12 13:21:38.580682	2018-04-12 13:21:38.580682	1
140	141	0202233117                                        	doc@gmail.com				135	\N	t	f	2018-04-13 17:06:54.567189	2018-04-13 17:06:54.567189	\N
141	142	0558029911                                        	Mady@gmail.com	uo	uiop	u	135	\N	t	f	2018-04-13 17:20:38.714928	2018-04-13 17:20:38.714928	1
144	145	0245667790	kobby@gmail.com				36	\N	t	f	2018-04-18 22:21:38.192679	2018-04-18 22:21:38.192679	2
145	146	444444r                                           	kasakyi@hotmail.com 		ghananacademy 		145	\N	t	f	2018-04-18 22:27:18.962887	2018-04-18 22:27:18.962887	1
146	147	0265110090	oscar@gmail.com				36	\N	t	f	2018-04-18 22:28:30.575299	2018-04-18 22:28:30.575299	2
147	148	0265110098	oscar@gmail.com				36	\N	t	f	2018-04-18 22:32:33.101946	2018-04-18 22:32:33.101946	2
152	153	+233244444329                                     	ykusimensah@gmail.com			not 	145	\N	t	f	2018-04-20 07:06:36.012514	2018-04-20 07:06:36.012514	2
153	154	4444445                                           	G@apl.com				145	\N	t	f	2018-04-20 07:15:27.118947	2018-04-20 07:15:27.118947	2
154	155	44444444                                          	K@aol.com				145	\N	t	f	2018-04-20 07:55:53.373578	2018-04-20 07:55:53.373578	\N
159	160	445567787                                         	g@gmail.com				145	\N	t	f	2018-04-21 05:43:48.286777	2018-04-21 05:43:48.286777	1
157	158	0543901100	cl@yahool.com				158	\N	t	f	2018-04-20 16:08:20.778676	2018-04-23 12:17:39.40606	\N
162	163	0200000010                                        	Chale@gmail.com				135	\N	t	f	2018-04-24 17:46:21.211942	2018-04-24 17:46:21.211942	1
169	170	0246001190	ck@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:11:26.249701	2018-04-25 11:11:26.249701	2
170	171	0246001191	ck@yahoo1.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:13:04.834639	2018-04-25 11:13:04.834639	2
171	172	0246001196	cyk@yahoo1.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:20:46.496867	2018-04-25 11:20:46.496867	2
172	173	0246001110	cye@yahoo1.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:22:23.038313	2018-04-25 11:22:23.038313	2
173	174	0544110099	melody@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:38:25.594547	2018-04-25 11:38:25.594547	1
174	175	0544110090	melod1y@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:39:23.168851	2018-04-25 11:39:23.168851	1
177	178	0240000003	get@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-25 12:49:11.709877	2018-04-25 12:49:11.709877	\N
179	180	0540000001	pat@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-26 15:43:40.007073	2018-04-26 15:43:40.007073	\N
180	181	0569001123	mena@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 09:57:17.332955	2018-04-27 09:57:17.332955	1
181	182	0569001124	mansah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 10:01:18.797927	2018-04-27 10:01:18.797927	2
182	183	0569001129	mans1ah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 10:02:55.747815	2018-04-27 10:02:55.747815	2
183	184	0569001126	mans2ah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 10:03:50.135322	2018-04-27 10:03:50.135322	2
186	187	0269012209	tiery@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 17:42:25.280864	2018-04-27 17:42:25.280864	1
190	191	024399010	joan@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-30 09:05:54.576527	2018-04-30 09:05:54.576527	1
192	193	0546778299	yaa2@hotmail.com	\N	\N	\N	\N	\N	t	f	2018-04-30 11:44:33.029901	2018-04-30 11:44:33.029901	1
193	194	0271234567	yaaa@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-30 11:49:20.188533	2018-04-30 11:49:20.188533	1
225	226	0541012100	fasf@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-05 13:56:30.827561	2018-05-05 13:56:30.827561	\N
227	228	0201021112	clementine@gamil.com	\N	\N	\N	\N	\N	t	f	2018-05-05 14:12:59.951906	2018-05-05 14:12:59.951906	\N
228	229	0201234567	ben@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-05 14:13:12.517253	2018-05-05 14:13:12.517253	2
230	231	0248110987	clacla@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-05-07 13:15:28.434093	2018-05-07 13:15:28.434093	3
232	233	0249011980	momo@yall.om	\N	\N	\N	\N	\N	t	f	2018-05-07 13:32:22.714483	2018-05-07 13:32:22.714483	3
207	208	0205869653	freda@appsnmobilesolutions.com 	\N	\N	\N	\N	\N	t	f	2018-05-04 09:33:53.121033	2018-05-04 09:33:53.121033	\N
138	139	0243554422                                        	davi@gmail.com		Madina Estate		139	\N	t	f	2018-04-12 13:25:40.534404	2018-05-04 11:20:03.410081	1
191	192	0249009891	celest@yahoo.com		Danfa		192	\N	t	f	2018-04-30 11:07:57.46246	2018-05-04 12:01:34.423128	1
209	210	55566666	a@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 12:29:55.439644	2018-05-04 12:29:55.439644	1
210	211	0248109024	cloe@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 12:59:51.441611	2018-05-04 12:59:51.441611	1
212	213	0245892009	cloe1@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-05-04 13:03:19.841582	2018-05-04 13:03:19.841582	2
216	217	55678899090	c@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 15:36:20.036272	2018-05-04 15:36:20.036272	1
218	219	0541840901	paddydoc1@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 21:29:12.452144	2018-05-04 21:29:12.452144	\N
219	220	0200000011	paddydoc2@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 21:35:52.974295	2018-05-04 21:35:52.974295	1
221	222	0269022431	zeal@gmail.com				222	\N	t	f	2018-05-05 12:01:30.532403	2018-05-05 12:21:06.660026	2
222	223	0248109980	zealous@yahoo.com				223	\N	t	f	2018-05-05 12:22:14.773575	2018-05-05 12:25:07.157471	1
224	225	0541850993	paddydoca@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-05 13:50:48.12485	2018-05-05 13:50:48.12485	\N
234	235	0541000000	Clem@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-09 09:33:37.920252	2018-05-09 09:33:37.920252	\N
235	236	0541200000	Hg@ymailm.com	\N	\N	\N	\N	\N	t	f	2018-05-09 09:36:54.706269	2018-05-09 09:36:54.706269	\N
237	238	444444	P@gmail.com 	\N	\N	\N	\N	\N	t	f	2018-05-10 00:54:48.827362	2018-05-10 00:54:48.827362	\N
239	240	0266123456	ababio@gmail.com 	\N	\N	\N	\N	\N	t	f	2018-05-10 09:32:48.517198	2018-05-10 09:32:48.517198	\N
242	243	027789456	mina@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-15 13:00:47.855727	2018-05-15 13:00:47.855727	2
244	245	0249013344	johnson@hotmail.com	\N	\N	\N	\N	\N	t	f	2018-05-18 16:02:18.720646	2018-05-18 16:02:18.720646	1
245	246	0249737027	padmorey@gmail.com				246	\N	t	f	2018-06-05 21:10:47.200072	2018-06-05 21:45:42.468623	1
247	248	0264680508	ionic@gmail.com	\N	\N	\N	\N	\N	t	f	2018-06-07 10:26:50.177331	2018-06-07 10:26:50.177331	3
142	143	0241889900                                        	kwame@gmail.com				36	\N	t	f	2018-04-18 15:02:02.0056	2018-04-18 15:02:02.0056	2
143	144	0266000350                                        	jerry@gmail.com				135	\N	t	f	2018-04-18 16:02:00.081965	2018-04-18 16:02:00.081965	2
148	149	0549001123	freda@gmail.com				36	\N	t	f	2018-04-19 09:57:47.270403	2018-04-19 09:57:47.270403	2
149	150	444444r                                           	kasakyi@hotmail.com				36	\N	t	f	2018-04-19 11:04:05.030736	2018-04-19 11:04:05.030736	\N
150	151	0241230000                                        	kwamedanso@gmail.com				36	\N	t	f	2018-04-19 11:08:01.450101	2018-04-19 11:08:01.450101	\N
151	152	0567445533	cle@hotmail.com				36	\N	t	f	2018-04-19 11:16:50.543224	2018-04-19 11:16:50.543224	\N
155	156	0201234467                                        	Nii@gmail.com				135	\N	t	f	2018-04-20 10:49:37.816556	2018-04-20 10:49:37.816556	\N
158	159	99887766                                          	K@aol.com 				145	\N	t	f	2018-04-21 05:08:01.103735	2018-04-21 05:08:01.103735	\N
160	161	45666777                                          	Gg@gmail.com				145	\N	t	f	2018-04-21 10:52:02.844911	2018-04-21 10:52:02.844911	\N
161	162	0244574744                                        	ykusimensah@yahoo.com				145	\N	t	f	2018-04-21 11:21:46.786531	2018-04-21 11:21:46.786531	\N
167	168	0200000006	Fd@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-24 22:47:59.694816	2018-04-24 22:47:59.694816	\N
168	169	0241000000	moes@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-24 23:01:31.028807	2018-04-24 23:01:31.028807	\N
175	176	0567990021	nora@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-25 12:11:53.834665	2018-04-25 12:11:53.834665	1
176	177	0240901278	yayra@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-25 12:33:33.400312	2018-04-25 12:33:33.400312	2
156	157	027507907                                         	Naa@gmail.com				158	\N	t	f	2018-04-20 12:53:41.325344	2018-04-25 15:01:48.700992	\N
178	179	0203443235	Naa@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-04-26 11:37:58.761392	2018-04-26 11:37:58.761392	\N
184	185	0569001160	mans4ah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 10:04:47.688401	2018-04-27 10:04:47.688401	2
185	186	0249001102	stev@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 10:09:13.438069	2018-04-27 10:09:13.438069	2
187	188	0549013390	mawunya22@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 18:15:56.884151	2018-04-27 18:15:56.884151	2
188	189	0578119903	david23@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-04-27 18:23:09.975581	2018-04-27 18:23:09.975581	1
189	190	0568910299	amoah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 18:31:02.888718	2018-04-27 18:31:02.888718	1
36	36	0243554455	clemsedem@gmail.com				36	\N	t	f	2018-01-05 11:52:52.852373	2018-02-08 16:10:55.339339	2
205	206	0541840900	paddy1@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-02 20:51:13.190771	2018-05-02 20:51:13.190771	\N
206	207	0540000987	paddy2@gmail.com				36	\N	t	f	2018-05-02 20:52:13.475304	2018-05-03 17:14:41.634867	1
139	140	0243668890                                        	ago@gmail.com		 No. AN458 Accra New Town		140	\N	t	f	2018-04-13 11:21:53.244463	2018-05-04 11:28:40.715027	1
208	209	44433333	B@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 12:21:26.152066	2018-05-04 12:21:26.152066	\N
211	212	4456777778	G@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 13:01:09.048849	2018-05-04 13:01:09.048849	\N
213	214	339909999	A@hmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 13:18:53.809534	2018-05-04 13:18:53.809534	\N
214	215	0541840980	Paddoc@	\N	\N	\N	\N	\N	t	f	2018-05-04 14:00:19.307165	2018-05-04 14:00:19.307165	\N
215	216	0248190033	Good@yah.com	\N	\N	\N	\N	\N	t	f	2018-05-04 14:26:33.163304	2018-05-04 14:26:33.163304	\N
217	218	0541840000	portugal@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 17:57:13.425084	2018-05-04 17:57:13.425084	\N
220	221	0200000100	paddydocc@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 21:48:10.111495	2018-05-04 21:48:10.111495	\N
223	224	0241840988	fdsf@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-05 13:34:27.265904	2018-05-05 13:34:27.265904	\N
226	227	0201840988	clementino@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-05 14:03:18.263671	2018-05-05 14:03:18.263671	\N
229	230	0264620508	freda.addae92@gmail.com				36	\N	t	f	2018-05-05 21:26:36.470457	2018-05-07 10:31:19.958414	\N
231	232	0241233778	Clare@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-07 13:19:45.052281	2018-05-07 13:19:45.052281	\N
233	234	024679875544	Paddy@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-09 09:26:58.196586	2018-05-09 09:26:58.196586	\N
236	237	0556296012	freda.addae92@gmail.com 	\N	\N	\N	\N	\N	t	f	2018-05-09 15:24:11.461145	2018-05-09 15:24:11.461145	\N
238	239	455778	Pt@gmail.com 	\N	\N	\N	\N	\N	t	f	2018-05-10 01:37:13.217043	2018-05-10 01:37:13.217043	\N
240	241	0277234567	andy@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-05-10 14:36:23.755832	2018-05-10 14:36:23.755832	3
241	242	0277412356	andy1@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-05-10 15:16:44.682308	2018-05-10 15:16:44.682308	1
243	244	0278945612	mina1@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-15 16:36:28.824753	2018-05-15 16:36:28.824753	2
246	247	0276624567	padmorey@gmail.com	\N	\N	\N	\N	\N	t	f	2018-06-06 11:12:19.889898	2018-06-06 11:12:19.889898	\N
\.


--
-- Name: person_contact_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('person_contact_infos_id_seq', 247, true);


--
-- Data for Name: person_info_extras; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY person_info_extras (id, person_id, specialty_id, specialty_duration, has_specialty, forign_training, foreign_institution_desc, profession_group_id, licence_number, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, foreign_licence_number, hospital_name) FROM stdin;
1	155	4	5	t	t	Royal	1	44556763	<p>no problem</p>	\N	\N	t	f	2018-04-20 13:03:58.202934	2018-04-20 13:06:55.41552	5468790	\N
2	186	2	4	f	f		1	DKF75KF		\N	\N	t	f	2018-04-27 17:37:22.651216	2018-04-27 17:37:22.651216	\N	\N
3	187	1	5	t	t	British Medical Association	2	RK6879K		\N	\N	t	f	2018-04-27 18:13:55.972941	2018-04-27 18:13:55.972941	BR658JK	\N
4	188	3	5	f	f		1	FGH45HJ		\N	\N	t	f	2018-04-27 18:17:27.123882	2018-04-27 18:17:27.123882	\N	\N
5	189	3	6	f	f		1	HJ56KK		\N	\N	t	f	2018-04-27 18:24:25.867379	2018-04-27 18:24:25.867379	\N	\N
6	189	3	6	f	f		1	HJ56KK		\N	\N	t	f	2018-04-27 18:25:49.426246	2018-04-27 18:25:49.426246	\N	\N
7	190	4	3	f	f		1	787733		\N	\N	t	f	2018-04-27 18:41:04.34088	2018-04-27 18:41:04.34088	\N	\N
8	190	4	3	f	f		1	787733		\N	\N	t	f	2018-04-27 18:41:43.121094	2018-04-27 18:41:43.121094	\N	\N
9	191	1	2	f	f		1	GH8847M		\N	\N	t	f	2018-04-30 09:47:34.35818	2018-04-30 09:47:34.35818	\N	\N
10	192	4	2	f	f		1	NU34J		\N	\N	t	f	2018-04-30 11:09:17.760689	2018-04-30 11:09:17.760689	\N	\N
11	194	3	4	f	f		1	ghr		\N	\N	t	f	2018-04-30 12:26:48.493861	2018-04-30 12:26:48.493861	\N	\N
12	210	3	1	f	f		2	3338888989		\N	\N	t	f	2018-05-04 12:33:27.881873	2018-05-04 12:33:27.881873	\N	\N
13	214	3	-6	t	t	Polishg	1	5544433		\N	\N	t	f	2018-05-04 13:38:29.192199	2018-05-04 13:38:29.192199	\N	\N
14	214	3	5	t	t	Polish	1	444		\N	\N	t	f	2018-05-04 13:39:51.66274	2018-05-04 13:39:51.66274	667788	\N
15	214	3	5	t	t	Polish	2	6688899		\N	\N	t	f	2018-05-04 15:08:27.2796	2018-05-04 15:08:27.2796	5566678	\N
16	214	2	5	t	t	Pand	1	89899900		\N	\N	t	f	2018-05-04 15:10:32.565623	2018-05-04 15:10:32.565623	kj78789	\N
17	214	2	5	f	f		1	df78783		\N	\N	t	f	2018-05-04 15:14:01.341847	2018-05-04 15:14:01.341847	\N	\N
18	214	2	5	f	f		1	df78783		\N	\N	t	f	2018-05-04 15:16:12.171347	2018-05-04 15:16:12.171347	\N	\N
19	213	4	4	f	f		1	4543545435		\N	\N	t	f	2018-05-04 15:20:32.435692	2018-05-04 15:20:32.435692	\N	\N
20	217	3	7	t	t	Fhjk	1	7999990		\N	\N	t	f	2018-05-04 15:39:56.965075	2018-05-04 15:39:56.965075	w3345	\N
21	221	1	3	t	t	4324sfs	1	324rr32		\N	\N	t	f	2018-05-04 23:45:15.633207	2018-05-04 23:45:15.633207	fsdfdsf	\N
22	222	1	3	f	f		1	hj578jsk		\N	\N	t	f	2018-05-05 12:03:59.63356	2018-05-05 12:07:13.134171		Pentecost Hospital
23	223	1	2	f	f		1	hj76hj		\N	\N	t	f	2018-05-05 12:24:44.840039	2018-05-05 12:24:44.840039	\N	Nyaho Hospital
24	228	2	2	t	t	Re32432	1	E4234		\N	\N	t	f	2018-05-05 14:19:45.198866	2018-05-05 14:19:45.198866	32432	clementine clinic
25	230	2	5	t	t	Ny	2	12345		\N	\N	t	f	2018-05-05 21:46:16.607219	2018-05-05 21:46:16.607219	98765	oyarifa general hospital
26	238	4	7	t	t	Polish	2	12345		\N	\N	t	f	2018-05-10 02:56:52.283221	2018-05-10 02:56:52.283221	76654	kbu
27	246	1	2	t	t	Eisten School	1	756757	<p>All details provided are correct.</p>	\N	\N	t	f	2018-06-05 21:35:17.758298	2018-06-05 21:35:17.758298	8043242	Emmanuel Eye Clinic
28	248	3	5	f	f		1	12345678		\N	\N	t	f	2018-06-07 10:30:40.918295	2018-06-07 10:30:40.918295	\N	accra
\.


--
-- Name: person_info_extras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('person_info_extras_id_seq', 28, true);


--
-- Data for Name: person_infos; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY person_infos (id, surname, other_names, person_type_id, entity_id, user_id, active_status, del_status, created_at, updated_at, full_name, dob, reg_id, pd_sub) FROM stdin;
135	Tetteh	Andrew	D	\N	36	t	f	2018-04-12 12:09:33.288697	2018-04-12 12:09:33.288697	\N	2017-01-01	\N	f
136	Quaye	Akosua	C	\N	36	t	f	2018-04-12 12:57:44.353239	2018-04-12 13:07:10.547046	\N	2000-01-01	2	f
137	Yeboah	Padmore	C	\N	36	t	f	2018-04-12 13:02:17.099953	2018-04-12 13:07:26.651243	\N	1992-12-16	1	f
138	Tetteh	Andrew	C	\N	36	t	f	2018-04-12 13:21:38.579398	2018-04-12 13:21:38.579398	\N	1989-01-01	4	f
141	Doctor	Doctor	D	\N	135	t	f	2018-04-13 17:06:54.565655	2018-04-13 17:06:54.565655	\N	1988-02-01	6	f
142	Maddy	Cutie	D	\N	135	t	f	2018-04-13 17:20:38.713288	2018-04-13 17:20:38.713288	\N	1991-08-30	8	f
140	Ago	Nam	D	\N	140	t	f	2018-04-13 11:21:53.242922	2018-04-16 17:38:32.732256	\N	2014-03-30	7	t
143	Amemawukpor	Kwame	C	\N	36	t	f	2018-04-18 15:02:02.004039	2018-04-18 15:02:02.004039	\N	1990-02-10	10	f
144	Bansah	Jerry	C	\N	135	t	f	2018-04-18 16:02:00.080623	2018-04-18 16:02:00.080623	\N	2016-06-05	11	f
145	Appiah	Kobby	D	\N	36	t	f	2018-04-18 22:21:38.191034	2018-04-18 22:21:38.191034	\N	2018-01-14	\N	f
146	Ocansey	Joni	C	\N	145	t	f	2018-04-18 22:27:18.961458	2018-04-18 22:27:18.961458	\N	1994-01-04	12	f
147	Atsra	Oscar	D	\N	36	t	f	2018-04-18 22:28:30.574033	2018-04-18 22:28:30.574033	\N	2018-04-09	\N	f
148	Atsra	Oscar	D	\N	36	t	f	2018-04-18 22:32:33.100584	2018-04-18 22:32:33.100584	\N	2018-04-09	\N	f
149	Addae	Freda	N	\N	36	t	f	2018-04-19 09:57:47.268738	2018-04-19 09:57:47.268738	\N	2018-04-18	\N	f
150	Ocansey	Joni	C	\N	36	t	f	2018-04-19 11:04:05.029342	2018-04-19 11:04:05.029342	\N	1994-01-04	12	f
151	Danso	Kwame	P	\N	36	t	f	2018-04-19 11:08:01.448818	2018-04-19 11:08:01.448818	\N	2012-01-02	9	f
152	Mensah	Clarence	C	\N	36	t	f	2018-04-19 11:16:50.541806	2018-04-19 11:16:50.541806	\N	2018-04-19	\N	f
153	Kusimensah	Yaw	D	\N	145	t	f	2018-04-20 07:06:36.010974	2018-04-20 07:06:36.010974	\N	2028-02-19	19	f
154	Appiah	Gloria	C	\N	145	t	f	2018-04-20 07:15:27.117664	2018-04-20 07:15:27.117664	\N	2018-04-02	20	f
156	Tetteh	Andy	C	\N	135	t	f	2018-04-20 10:49:37.814717	2018-04-20 10:49:37.814717	\N	2001-01-01	23	f
159	Doku	Mercy	C	\N	145	t	f	2018-04-21 05:08:01.102093	2018-04-21 05:08:01.102093	\N	1986-12-01	25	f
160	Oduro	Patemma	C	\N	145	t	f	2018-04-21 05:43:48.284862	2018-04-21 05:43:48.284862	\N	1984-09-01	27	f
161	Apps	Nursegloria	N	\N	145	t	f	2018-04-21 10:52:02.84301	2018-04-21 10:52:02.84301	\N	1988-12-01	28	f
162	Kusi	Yaw	C	\N	145	t	f	2018-04-21 11:21:46.785227	2018-04-21 11:21:46.785227	\N	1988-01-28	29	f
158	Clara	Quaye	N	\N	158	t	f	2018-04-20 16:08:20.777077	2018-04-23 12:17:39.404506	\N	2018-04-20	\N	f
155	Apps	Koku	D	\N	145	t	f	2018-04-20 07:55:53.372199	2018-04-23 21:17:20.178842	\N	1997-08-01	22	t
163	Essel	Chale	D	\N	135	t	f	2018-04-24 17:46:21.210083	2018-04-24 17:46:21.210083	\N	2001-01-01	32	t
36	Clem	Sedem	D	\N	36	t	f	2018-01-05 11:52:52.814418	2018-02-08 16:10:55.337771	\N	1991-03-02	\N	f
168	Morin	Nod	C	\N	\N	t	f	2018-04-24 22:47:59.678245	2018-04-24 22:47:59.678245	\N	2001-01-01	37	\N
169	Bum	Moesha	C	\N	\N	t	f	2018-04-24 23:01:31.027312	2018-04-24 23:01:31.027312	\N	2001-01-10	38	\N
170	Mensah	Kwame	C	\N	\N	t	f	2018-04-25 11:11:26.237336	2018-04-25 11:11:26.237336	\N	2018-04-25	39	\N
171	Mensah	Kwame	C	\N	\N	t	f	2018-04-25 11:13:04.820896	2018-04-25 11:13:04.820896	\N	2018-04-25	40	\N
172	Mensah	Kwame	C	\N	\N	t	f	2018-04-25 11:20:46.482567	2018-04-25 11:20:46.482567	\N	2018-04-25	41	\N
173	Mensah	Kwame	C	\N	\N	t	f	2018-04-25 11:22:23.025802	2018-04-25 11:22:23.025802	\N	2018-04-25	42	\N
174	Agozi	Melody	C	\N	\N	t	f	2018-04-25 11:38:25.579381	2018-04-25 11:38:25.579381	\N	2002-08-01	43	\N
175	Agozi	Melody	C	\N	\N	t	f	2018-04-25 11:39:23.156274	2018-04-25 11:39:23.156274	\N	2002-08-01	44	\N
176	Agozi	Nora	C	\N	\N	t	f	2018-04-25 12:11:53.818975	2018-04-25 12:11:53.818975	\N	2000-10-09	45	\N
177	Agozi	Yayra	C	\N	\N	t	f	2018-04-25 12:33:33.385503	2018-04-25 12:33:33.385503	\N	2018-04-25	46	\N
178	Amoah	getty	C	\N	\N	t	f	2018-04-25 12:49:11.69538	2018-04-25 12:49:11.69538	\N	2001-01-01	47	\N
157	Mac	Naa	D	\N	158	t	f	2018-04-20 12:53:41.324007	2018-04-25 15:01:48.699507	\N	2001-01-01	24	f
179	Ayeley	Naa	C	\N	\N	t	f	2018-04-26 11:37:58.738952	2018-04-26 11:37:58.738952	\N	2001-01-01	59	\N
180	Osei	Patricia	C	\N	\N	t	f	2018-04-26 15:43:39.992162	2018-04-26 15:43:39.992162	\N	2001-01-01	61	\N
181	Mena	Mansah	C	\N	\N	t	f	2018-04-27 09:57:17.317927	2018-04-27 09:57:17.317927	\N	2018-04-25	62	\N
182	Mena	Mansah	C	\N	\N	t	f	2018-04-27 10:01:18.785078	2018-04-27 10:01:18.785078	\N	2018-04-02	63	\N
183	Mena	Mansah	C	\N	\N	t	f	2018-04-27 10:02:55.734669	2018-04-27 10:02:55.734669	\N	2018-04-02	64	\N
184	Mena	Mansah	C	\N	\N	t	f	2018-04-27 10:03:50.122757	2018-04-27 10:03:50.122757	\N	2018-04-02	65	\N
185	Mena	Mansah	C	\N	\N	t	f	2018-04-27 10:04:47.658474	2018-04-27 10:04:47.658474	\N	2018-04-02	66	\N
186	Donalds	Stev	D	\N	\N	t	f	2018-04-27 10:09:13.424418	2018-04-27 10:09:13.424418	\N	2018-04-01	67	t
187	Nyan	Tiery	D	\N	\N	t	f	2018-04-27 17:42:25.275922	2018-04-27 17:42:25.275922	\N	2018-04-01	68	t
188	Gbeku	Mawunya	D	\N	\N	t	f	2018-04-27 18:15:56.878831	2018-04-27 18:15:56.878831	\N	2018-04-01	69	t
189	Asamoah	David	D	\N	\N	t	f	2018-04-27 18:23:09.961633	2018-04-27 18:23:09.961633	\N	2018-04-27	70	t
190	Amoah	Matthew	D	\N	\N	t	f	2018-04-27 18:31:02.883556	2018-04-27 18:31:02.883556	\N	2018-04-27	71	f
191	Jonah	Joan	D	\N	\N	t	f	2018-04-30 09:05:54.563123	2018-04-30 09:05:54.563123	\N	2018-04-01	72	f
193	Yaa	Freda	C	\N	\N	t	f	2018-04-30 11:44:33.014475	2018-04-30 11:44:33.014475	\N	2018-04-30	74	f
194	Yaa	Freda	D	\N	\N	t	f	2018-04-30 11:49:20.184252	2018-04-30 11:49:20.184252	\N	2018-04-03	75	f
206	Paddy1	Paddy1	N	\N	\N	t	f	2018-05-02 20:51:13.175805	2018-05-02 20:51:13.175805	\N	2001-01-01	87	\N
192	Tetteh	Celestina	N	\N	192	t	f	2018-04-30 11:07:57.427433	2018-05-02 15:41:11.283527	\N	2018-04-01	73	f
220	Paddydoc	Paddydoc	D	\N	\N	t	f	2018-05-04 21:35:52.969202	2018-05-04 21:35:52.969202	\N	2018-05-04	101	t
221	paddydocc	paddydocc	D	\N	\N	t	f	2018-05-04 21:48:10.109982	2018-05-04 21:48:10.109982	\N	2001-01-01	102	\N
207	Paddy	Paddy	D	\N	36	t	f	2018-05-02 20:52:13.473834	2018-05-03 17:14:41.63318	\N	2001-01-01	88	f
208	Araba	Yaa	C	\N	\N	t	f	2018-05-04 09:33:53.102234	2018-05-04 09:33:53.102234	\N	1988-01-07	89	\N
139	Agonam	Davi	C	\N	139	t	f	2018-04-12 13:25:40.532757	2018-05-04 11:20:03.40824	\N	2001-01-01	5	f
209	Winkles	Becky	N	\N	\N	t	f	2018-05-04 12:21:26.133157	2018-05-04 12:21:26.133157	\N	2001-01-01	90	\N
210	Winkles	August	N	\N	\N	t	f	2018-05-04 12:29:55.434344	2018-05-04 12:29:55.434344	\N	2018-05-07	91	f
211	Cloe	Hulda	N	\N	\N	t	f	2018-05-04 12:59:51.420496	2018-05-04 12:59:51.420496	\N	2018-05-16	92	f
212	Apps	Gloria	C	\N	\N	t	f	2018-05-04 13:01:09.047325	2018-05-04 13:01:09.047325	\N	1992-01-01	93	\N
213	Cloe	Hulda	D	\N	\N	t	f	2018-05-04 13:03:19.836356	2018-05-04 13:03:19.836356	\N	2018-05-08	94	f
214	Malik	Abdul	D	\N	\N	t	f	2018-05-04 13:18:53.807978	2018-05-04 13:18:53.807978	\N	1993-01-01	95	\N
215	Paddy	DOCTOR	D	\N	\N	t	f	2018-05-04 14:00:19.305602	2018-05-04 14:00:19.305602	\N	2001-01-01	96	\N
216	Good	Luck	C	\N	\N	t	f	2018-05-04 14:26:33.161794	2018-05-04 14:26:33.161794	\N	2001-01-01	97	\N
217	Chilax	Victor	D	\N	\N	t	f	2018-05-04 15:36:20.031263	2018-05-04 15:36:20.031263	\N	2018-04-29	98	t
218	Paddydoc	Paddy	D	\N	\N	t	f	2018-05-04 17:57:13.409779	2018-05-04 17:57:13.409779	\N	2001-01-01	99	\N
219	paddydoc1	paddydoc1	D	\N	\N	t	f	2018-05-04 21:29:12.432621	2018-05-04 21:29:12.432621	\N	2001-01-01	100	\N
223	Agozi	Zeal	N	\N	223	t	f	2018-05-05 12:22:14.768642	2018-05-05 12:25:07.156	\N	2018-05-06	104	f
224	Paddydocd	Paddydocd	D	\N	\N	t	f	2018-05-05 13:34:27.250045	2018-05-05 13:34:27.250045	\N	2001-01-01	105	t
225	paddydoca	paddydoca	D	\N	\N	t	f	2018-05-05 13:50:48.108135	2018-05-05 13:50:48.108135	\N	2001-01-01	106	t
226	clementina	clementina	D	\N	\N	t	f	2018-05-05 13:56:30.826089	2018-05-05 13:56:30.826089	\N	2001-01-01	107	t
227	clementino	clementino	D	\N	\N	t	f	2018-05-05 14:03:18.248824	2018-05-05 14:03:18.248824	\N	2001-01-01	108	t
228	clementine	clementine	D	\N	\N	t	f	2018-05-05 14:12:59.937002	2018-05-05 14:12:59.937002	\N	2001-01-01	109	t
229	Ben	Fiifi	C	\N	\N	t	f	2018-05-05 14:13:12.512263	2018-05-05 14:13:12.512263	\N	2016-11-27	110	f
230	Adom	Yaw	D	\N	36	t	f	2018-05-05 21:26:36.449115	2018-05-07 10:31:19.95681	\N	1987-01-19	111	t
231	Mensah	Clara	C	\N	\N	t	f	2018-05-07 13:15:28.417819	2018-05-07 13:15:28.417819	\N	2018-05-06	112	f
232	Mady	Clare	C	\N	\N	t	f	2018-05-07 13:19:45.034364	2018-05-07 13:19:45.034364	\N	2001-01-01	113	\N
233	Budog	Momo	C	\N	\N	t	f	2018-05-07 13:32:22.701254	2018-05-07 13:32:22.701254	\N	2018-05-07	114	f
234	Padmore	Paddy	C	\N	\N	t	f	2018-05-09 09:26:58.176957	2018-05-09 09:26:58.176957	\N	2001-01-01	115	\N
235	Clementina	Clementina	D	\N	\N	t	f	2018-05-09 09:33:37.918444	2018-05-09 09:33:37.918444	\N	1994-06-01	116	\N
236	Clementine2	Cle	D	\N	\N	t	f	2018-05-09 09:36:54.704594	2018-05-09 09:36:54.704594	\N	1985-01-01	117	t
222	Agozi	Zeal	D	\N	222	t	f	2018-05-05 12:01:30.516922	2018-05-09 10:31:39.454384	\N	2018-05-09	103	t
237	Dadson	Samson	C	\N	\N	t	f	2018-05-09 15:24:11.435665	2018-05-09 15:24:11.435665	\N	1990-01-01	118	\N
238	New 	Paddy	D	\N	\N	t	f	2018-05-10 00:54:48.825672	2018-05-10 00:54:48.825672	\N	1996-01-01	119	t
239	Newman 	Patpaddy	C	\N	\N	t	f	2018-05-10 01:37:13.215519	2018-05-10 01:37:13.215519	\N	1996-05-01	120	\N
240	Ababio	Bansah	D	\N	\N	t	f	2018-05-10 09:32:48.499636	2018-05-10 09:32:48.499636	\N	1982-01-01	121	t
241	Andrew	Andy	D	\N	\N	t	f	2018-05-10 14:36:23.750491	2018-05-10 14:36:23.750491	\N	2015-12-27	122	t
242	Andrew	Andy	D	\N	\N	t	f	2018-05-10 15:16:44.668709	2018-05-10 15:16:44.668709	\N	2018-05-10	123	t
243	Wil	Mina	N	\N	\N	t	f	2018-05-15 13:00:47.841888	2018-05-15 13:00:47.841888	\N	2018-05-15	124	f
244	Wil	Mina	N	\N	\N	t	f	2018-05-15 16:36:28.809118	2018-05-15 16:36:28.809118	\N	1990-05-15	125	f
245	Amemo	Johnson	N	\N	\N	t	f	2018-05-18 16:02:18.704317	2018-05-18 16:02:18.704317	\N	2018-05-08	126	f
246	Yeboah	Padmore	D	\N	246	t	f	2018-06-05 21:10:47.178666	2018-06-05 21:45:42.46694	\N	1990-10-01	127	t
247	Yeboah	Elorm	C	\N	\N	t	f	2018-06-06 11:12:19.87249	2018-06-06 11:12:19.87249	\N	1991-11-01	128	\N
248	Ionic	Senior	D	\N	\N	t	f	2018-06-07 10:26:50.171961	2018-06-07 10:26:50.171961	\N	1983-06-07	129	t
\.


--
-- Name: person_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('person_infos_id_seq', 248, true);


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

COPY pre_appointments (id, provider_id, requester_id, requester_cat, beneficiary_name, appointment_type_id, proposed_date, proposed_time, complaint_desc, prev_medical_history, req_urgency, comment, user_id, active_status, del_status, created_at, updated_at, confirm_status, src, allergies, suburb_id, has_pd, pd_name, medication, duration, test_list, beneficiary_phone_number, pre_confirm_status) FROM stdin;
178	\N	193	S		HC	2018-05-08 18:03:00	\N	None	None	S	\N	\N	t	f	2018-05-08 18:03:03.312292	2018-06-06 13:58:42.336593	t	APP	None	2	\N	\N	None	\N	\N	\N	t
226	1	247	S		MA	2018-06-10 00:00:00	\N	Cough	none	S	\N	\N	t	f	2018-06-07 10:46:20.609068	2018-06-07 11:00:23.63733	t	APP		1	\N	\N	\N	\N	\N		\N
1	8	136	S		MA	2018-04-16 09:30:00	\N	<p>persistent headaches</p>	<p>diabetic</p>	E	\N	\N	t	f	2018-04-12 15:07:08.42265	2018-04-12 15:07:08.42265	f	WEB	<p>iron</p>	1	f			\N	\N	\N	f
2	2	136	T	Freda	MA	2018-04-16 10:00:00	\N	Headache	Migraine	E	\N	\N	t	f	2018-04-12 16:41:08.399716	2018-04-12 16:44:22.576802	t	APP	Iron	2	\N	\N	\N	\N	\N	\N	f
60	\N	146	\N	\N	VC	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:43:41.674844	2018-04-19 18:43:41.674844	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
224	\N	247	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-06-06 12:36:34.158991	2018-06-07 11:08:09.39778	t	APP	\N	1	t	Frank	\N	\N	\N	\N	\N
227	\N	247	S		PC	2018-06-08 23:09:00	\N	Want to make free night call with you	Missed someone	S	\N	\N	t	f	2018-06-07 11:10:46.67815	2018-06-07 12:14:30.555615	t	APP	Divided attention	\N	\N	\N	Free night calls, funny conversations	\N	\N		t
55	1	137	T	Adjoa	MA	2018-04-25 09:00:00	\N	Diarrhoea	Waist pain	S	\N	\N	t	f	2018-04-19 15:38:37.94788	2018-04-20 16:42:39.167713	t	APP		1	\N	\N	\N	\N	\N	\N	f
225	1	247	S		MA	2018-06-10 21:39:00	\N	Check up	None	S	\N	\N	t	f	2018-06-06 21:39:05.612688	2018-06-06 21:39:05.612688	f	APP		1	\N	\N	\N	\N	\N		\N
228	\N	247	T	Akos	PC	2018-06-11 12:53:00	\N	Checkup	None	E	\N	\N	t	f	2018-06-07 12:53:42.02007	2018-06-07 12:56:50.41031	f	APP		\N	\N	\N		\N	\N	0541840988	t
57	\N	146	\N	\N	PDDP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:39:07.32885	2018-04-19 19:29:03.505701	t	APP	\N	\N	\N	\N	Tramadol \nErgometrine\n	7	\N	\N	f
3	1	139	S		MA	2018-04-14 10:20:00	\N	<p>A headache</p>\r\n<p>Cold</p>\r\n<p>&nbsp;</p>	<p>Diabetic</p>	S	\N	\N	t	f	2018-04-13 10:21:26.359927	2018-04-13 10:21:26.359927	f	WEB	<p>Sausage</p>	2	f			\N	\N	\N	f
4	4	137	S		MA	\N	\N	Check up	None	S	\N	\N	t	f	2018-04-13 10:34:50.193067	2018-04-13 10:34:50.193067	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
5	4	139	S		MA	2018-04-17 12:00:00	\N	Body pains 	Diabetic	S	\N	\N	t	f	2018-04-13 10:36:19.641441	2018-04-13 10:36:19.641441	f	APP		1	\N	\N	\N	\N	\N	\N	f
8	\N	139	S		MD	\N	\N			S	\N	\N	t	f	2018-04-13 15:47:53.976648	2018-04-13 15:47:53.976648	f	WEB		2	f			\N	\N	\N	f
6	\N	139	S		MD	\N	\N	\N	Diabetic	S	\N	\N	t	f	2018-04-13 15:18:18.06515	2018-04-13 16:18:41.799686	t	APP	None	1	\N	\N	Paracetamol\nCloroquine\nFeroglobin	\N	\N	\N	f
9	\N	136	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-13 16:04:00.228968	2018-04-13 16:19:57.017317	t	APP	None	2	\N	\N	Lonart	\N	\N	\N	f
10	\N	136	S		MD	\N	\N			S	\N	\N	t	f	2018-04-13 16:10:24.833278	2018-04-13 16:20:52.819689	t	WEB	<p>none</p>	1	f			\N	\N	\N	f
11	\N	136	S		LA	2018-04-16 13:22:00	\N	\N	Headache	E	\N	\N	t	f	2018-04-13 16:22:35.279813	2018-04-13 16:25:30.180503	t	APP	None	1	\N	\N	\N	\N	Pregnancy test	\N	f
12	\N	136	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-04-13 16:26:14.124538	2018-04-13 17:09:25.672952	t	APP	\N	2	t	\N	\N	\N	\N	\N	f
15	\N	137	\N	\N	VC	2018-04-30 19:28:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-15 19:27:54.555682	2018-04-15 19:27:54.555682	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
16	\N	139	S		VC	2018-04-17 09:20:00	\N			S	\N	\N	t	f	2018-04-16 09:16:26.370608	2018-04-16 10:54:44.313273	t	WEB		\N	f			\N	\N	\N	f
17	\N	139	\N	\N	VC	2018-04-16 09:18:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-16 09:18:05.372878	2018-04-16 10:55:23.42028	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
18	\N	139	S		HC	2018-04-17 09:42:00	\N	<p>have fever and headach</p>\r\n<p>Also feeling cold</p>	<p>Dibetic</p>	S	\N	\N	t	f	2018-04-16 09:33:23.7488	2018-04-16 10:56:29.341463	t	WEB	<p>None</p>	2	f			\N	\N	\N	f
19	\N	139	S		LA	2018-04-17 10:00:00	\N			S	\N	\N	t	f	2018-04-16 10:02:23.798149	2018-04-16 10:56:47.773896	t	WEB		2	f			\N	\N	\N	f
14	\N	137	T	Akose	MD	\N	\N	\N	None	E	\N	\N	t	f	2018-04-14 15:48:52.73289	2018-04-16 11:57:33.598878	t	APP	None	1	\N	\N	Eye problem	\N	\N	\N	f
20	\N	137	S		PD	\N	\N		<p>fghjghjjhhg</p>	S	\N	\N	t	f	2018-04-16 12:07:11.521627	2018-04-16 12:07:11.521627	f	WEB		1	f			\N	\N	\N	f
21	\N	139	\N	\N	PD	\N	\N	\N	Diabetic	\N	\N	\N	t	f	2018-04-16 12:12:29.484277	2018-04-16 12:12:55.299381	t	APP	\N	1	t	Ago Nam	\N	\N	\N	\N	f
23	8	137	S		MA	2018-04-25 12:20:00	\N	<p>Nose ache</p>		E	\N	\N	t	f	2018-04-16 12:24:17.657788	2018-04-16 12:24:17.657788	f	WEB		1	f			\N	\N	\N	f
24	1	137	T	Bertha	MA	2018-05-17 12:32:00	\N	Eye problem	Chills	E	\N	\N	t	f	2018-04-16 12:25:24.190507	2018-04-16 12:25:24.190507	f	APP	Cold	1	\N	\N	\N	\N	\N	\N	f
25	\N	139	\N	\N	PC	2018-04-16 12:31:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-16 12:31:59.265538	2018-04-16 12:32:14.777962	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
26	\N	137	S		LA	2018-05-24 00:00:00	\N	\N	None	S	\N	\N	t	f	2018-04-16 12:36:07.384636	2018-04-16 12:36:07.384636	f	APP	Cold,  teeth burns	1	\N	\N	\N	\N	Urinary	\N	f
27	\N	137	S		LA	2018-04-18 12:33:00	\N		<p>none</p>	S	\N	\N	t	f	2018-04-16 12:36:46.360061	2018-04-16 12:36:46.360061	f	WEB		2	f			\N	\N	\N	f
13	\N	136	\N	\N	VC	2018-04-17 13:36:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:37:04.670923	2018-04-16 12:46:12.754471	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
28	\N	137	S		MD	\N	\N			E	\N	\N	t	f	2018-04-16 12:49:52.856846	2018-04-16 12:49:52.856846	f	WEB	<p>None</p>	2	f		<p>Para</p>\r\n<p>Efpac</p>\r\n<p>Herbal life</p>	\N	\N	\N	f
29	\N	137	S		MD	\N	\N	\N	None	E	\N	\N	t	f	2018-04-16 12:51:00.528325	2018-04-16 12:51:00.528325	f	APP	None	1	\N	\N	Borbor bitters	\N	\N	\N	f
30	2	137	T	Kojo	MA	2018-12-16 00:00:00	\N	Waist pain	None	S	\N	\N	t	f	2018-04-17 22:41:20.575326	2018-04-17 22:41:20.575326	f	APP	Okro	\N	\N	\N	\N	\N	\N	\N	f
31	\N	139	S		PC	2018-04-19 11:00:00	\N			S	\N	\N	t	f	2018-04-18 09:59:01.859461	2018-04-18 09:59:01.859461	f	WEB		\N	f			\N	\N	\N	f
32	\N	139	S		PC	2018-04-19 10:03:00	\N			S	\N	\N	t	f	2018-04-18 10:03:17.124561	2018-04-18 10:03:17.124561	f	WEB		\N	f			\N	\N	\N	f
33	\N	139	S		PDVC	2018-04-19 11:49:00	\N			S	\N	\N	t	f	2018-04-18 11:49:44.148587	2018-04-18 11:49:44.148587	f	WEB		\N	f			\N	\N	\N	f
34	\N	139	S		PDHC	2018-04-19 11:54:00	\N			S	\N	\N	t	f	2018-04-18 11:54:31.549391	2018-04-18 11:54:31.549391	f	WEB		\N	f			\N	\N	\N	f
35	\N	139	T	John	PDDP	\N	\N			S	\N	\N	t	f	2018-04-18 12:05:56.850955	2018-04-18 12:05:56.850955	f	WEB		\N	f		<p>Paracemol, cough mixture</p>	5	\N	\N	f
36	2	144	S		MA	2018-04-21 09:00:00	\N	<p>headaches</p>	<p>headache</p>	S	\N	\N	t	f	2018-04-18 16:04:03.915473	2018-04-18 16:30:37.860356	t	WEB	<p>none</p>	2	f			\N	\N	\N	f
41	\N	144	S		MD	\N	\N			S	\N	\N	t	f	2018-04-18 16:23:28.665974	2018-04-18 16:32:04.068477	t	WEB		1	f			\N	\N	\N	f
40	\N	144	T	Papa	HC	2018-04-26 08:20:00	\N			S	\N	\N	t	f	2018-04-18 16:20:44.978427	2018-04-18 16:33:16.265461	t	WEB		2	f			\N	\N	\N	f
39	\N	144	S		VC	2018-04-19 10:00:00	\N			E	\N	\N	t	f	2018-04-18 16:19:56.180418	2018-04-18 16:34:42.782814	t	WEB		\N	f			\N	\N	\N	f
38	\N	144	S		LA	2018-04-18 16:18:00	\N			S	\N	\N	t	f	2018-04-18 16:18:56.182755	2018-04-18 16:35:18.806568	t	WEB		2	f			\N	\N	\N	f
37	8	144	S		MA	2018-04-26 16:09:00	\N			S	\N	\N	t	f	2018-04-18 16:09:46.75572	2018-04-18 16:36:11.322369	t	WEB		1	f			\N	\N	\N	f
42	\N	144	S		PD	\N	\N			S	\N	\N	t	f	2018-04-18 16:45:16.424382	2018-04-18 16:45:16.424382	f	WEB		1	t	doctor Ab		\N	\N	\N	f
43	1	136	T	1234	MA	2018-04-25 16:52:00	\N	<p>123</p>	<p>123</p>	S	\N	\N	t	f	2018-04-18 16:52:40.675868	2018-04-18 16:52:40.675868	f	WEB	<p>123</p>	1	f			\N	\N	\N	f
44	1	146	S		MA	2018-04-22 12:29:00	\N	Headaches	Labetal	S	\N	\N	t	f	2018-04-18 22:29:48.592667	2018-04-18 22:39:54.258668	t	APP	None	1	\N	\N	\N	\N	\N	\N	f
45	\N	146	T	Kofi effah	MD	\N	\N	\N	None 	S	\N	\N	t	f	2018-04-18 22:43:02.937272	2018-04-18 22:48:02.278663	t	APP	None 	1	\N	\N	Paracetamol 	\N	\N	\N	f
47	\N	146	S		MD	\N	\N	\N	Diabetes 	E	\N	\N	t	f	2018-04-19 13:39:48.544188	2018-04-19 13:41:57.315002	t	APP	None	1	\N	\N	Halothane	\N	\N	\N	f
48	\N	146	S		LA	2018-07-19 17:44:00	\N	\N	Diabetes 	E	\N	\N	t	f	2018-04-19 13:44:26.954443	2018-04-19 13:47:37.736304	t	APP	Nil	1	\N	\N	\N	\N	Urine culture \nFull blood count	\N	f
46	\N	146	S		LA	2018-07-18 12:45:00	\N	\N	Diabetes 	S	\N	\N	t	f	2018-04-18 22:45:47.704028	2018-04-19 13:49:05.555251	t	APP	None 	1	\N	\N	\N	\N	Pelvic	\N	f
49	1	146	S		MA	2018-04-19 16:50:00	\N	Diabetes 	Diabetes	S	\N	\N	t	f	2018-04-19 13:50:59.628066	2018-04-19 13:50:59.628066	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
51	\N	146	\N	\N	PD	\N	\N	\N	Diabetes	\N	\N	\N	t	f	2018-04-19 13:53:46.330705	2018-04-19 14:02:01.522092	t	APP	\N	1	t	\N	\N	\N	\N	\N	f
50	1	146	S		MA	2018-04-19 16:50:00	\N	Diabetes 	Diabetes	S	\N	\N	t	f	2018-04-19 13:51:09.933986	2018-04-19 14:03:35.300104	t	APP	None	1	\N	\N	\N	\N	\N	\N	f
52	\N	150	S		VC	2018-04-19 18:15:00	\N			E	\N	\N	t	f	2018-04-19 15:15:25.296165	2018-04-19 15:15:25.296165	f	WEB		\N	f			\N	\N	\N	f
53	\N	150	S		VC	2018-04-19 18:19:00	\N			S	\N	\N	t	f	2018-04-19 15:20:55.705888	2018-04-19 15:20:55.705888	f	WEB		\N	f			\N	\N	\N	f
54	1	150	T	Gloria	MA	2018-04-19 18:27:00	\N	<p>early appointment</p>		S	\N	\N	t	f	2018-04-19 15:27:35.577922	2018-04-19 15:27:35.577922	f	WEB		1	f			\N	\N	\N	f
61	\N	146	\N	\N	VC	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:44:16.616285	2018-04-19 18:44:16.616285	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
56	\N	146	\N	\N	PC	2018-08-19 21:37:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:37:37.845037	2018-04-19 19:25:00.80045	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
63	1	137	T	Dankwah	MA	2018-04-19 00:00:00	\N	Stomach upset	None	E	\N	\N	t	f	2018-04-19 19:30:34.409069	2018-04-19 19:30:34.409069	f	APP	None	\N	\N	\N	\N	\N	\N	\N	f
58	\N	146	\N	\N	PDHC	2018-07-19 21:39:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:39:37.502717	2018-04-19 19:46:15.544437	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
59	\N	146	\N	\N	PDHC	2018-04-18 21:43:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:43:32.896127	2018-04-19 19:48:55.848783	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
64	\N	146	\N	\N	PDVC	2018-04-19 12:02:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 20:03:01.696819	2018-04-19 20:03:01.696819	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
66	1	156	S		MA	2018-04-22 10:53:00	\N	Broken leg	Migraine	S	\N	\N	t	f	2018-04-20 10:53:27.243007	2018-04-20 10:53:27.243007	f	APP	Calcium	1	\N	\N	\N	\N	\N	\N	f
69	\N	156	\N	\N	VC	2018-04-20 11:00:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-20 11:00:37.687158	2018-04-20 11:10:12.717898	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
65	8	136	S		MA	2018-04-21 10:34:00	\N	<p>diarrhoea</p>	<p>migraine</p>	S	\N	\N	t	f	2018-04-20 10:36:13.942623	2018-04-20 11:14:49.68883	t	WEB	<p>calcium</p>	1	f			\N	\N	\N	f
68	\N	156	S		LA	2018-04-20 00:59:00	\N	\N	Migraine	S	\N	\N	t	f	2018-04-20 10:59:48.512876	2018-04-20 11:37:13.473249	t	APP	Calcium	1	\N	\N	\N	\N	Malaria 	\N	f
67	\N	156	S		MD	\N	\N	\N	Migraine	S	\N	\N	t	f	2018-04-20 10:54:17.525141	2018-04-20 11:46:06.800645	t	APP	Iron	2	\N	\N	Para	\N	\N	\N	f
70	1	137	S		MA	2018-04-20 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-20 15:36:28.090052	2018-04-20 15:36:28.090052	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
7	\N	137	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 15:39:17.504395	2018-04-23 17:58:55.610557	t	APP	\N	1	\N	\N	\N	\N	\N	\N	f
22	\N	139	\N	\N	PDDP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-16 12:14:27.084389	2018-04-16 12:15:10.436936	t	APP	\N	\N	\N	\N	Paracetamol, zubes, feroglobin	5	\N	\N	f
71	\N	137	S		HC	2018-04-20 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-20 16:50:26.428397	2018-04-20 16:50:26.428397	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
72	\N	159	\N	\N	PD	\N	\N	\N	Diabetes	\N	\N	\N	t	f	2018-04-21 05:16:12.636272	2018-04-21 05:18:56.281571	t	APP	\N	2	t	Koku Apps	\N	\N	\N	\N	f
73	6	159	S		MA	2018-04-21 18:14:00	\N	Ghana	Togi	E	\N	\N	t	f	2018-04-21 06:14:37.728319	2018-04-21 06:14:37.728319	f	APP	Nonr	2	\N	\N	\N	\N	\N	\N	f
74	2	159	S		MA	2018-04-21 18:15:00	\N	Pisss	Naught	E	\N	\N	t	f	2018-04-21 06:15:27.98215	2018-04-21 06:15:27.98215	f	APP	Pls 	2	\N	\N	\N	\N	\N	\N	f
79	\N	159	S		HC	2018-04-21 09:20:00	\N	Pad	Trouble	E	\N	\N	t	f	2018-04-21 06:20:08.742451	2018-04-21 06:20:08.742451	f	APP	None	2	\N	\N	\N	\N	\N	\N	f
75	\N	159	S		MD	\N	\N	\N	Diabete	E	\N	\N	t	f	2018-04-21 06:17:03.353313	2018-04-21 06:27:31.692425	t	APP	Nana	2	\N	\N	Para	\N	\N	\N	f
76	\N	159	S		LA	2018-04-21 06:17:00	\N	\N	Diabets	E	\N	\N	t	f	2018-04-21 06:18:00.305644	2018-04-21 06:30:10.608007	t	APP	None	1	\N	\N	\N	\N	Hb	\N	f
77	\N	159	\N	\N	PC	2018-04-21 02:18:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-21 06:18:22.197866	2018-04-21 06:32:13.273496	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
78	\N	159	\N	\N	PDHC	2018-04-21 06:16:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-21 06:19:04.06063	2018-04-21 06:36:00.337745	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
80	\N	162	\N	\N	PD	\N	\N	\N	1 Previous Surgery \n	\N	\N	\N	t	f	2018-04-21 12:58:09.030619	2018-04-21 12:58:09.030619	f	APP	\N	2	t	\N	\N	\N	\N	\N	f
81	2	162	S		MA	2018-04-23 12:00:00	\N	Routine Check up\n	Nil	S	\N	\N	t	f	2018-04-21 12:59:59.910769	2018-04-21 12:59:59.910769	f	APP	None	2	\N	\N	\N	\N	\N	\N	f
82	\N	162	\N	\N	VC	2018-04-21 15:00:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-21 13:00:29.883675	2018-04-21 13:00:29.883675	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
83	\N	159	\N	\N	PC	2018-04-21 20:19:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-21 20:19:52.787736	2018-04-21 20:19:52.787736	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
84	\N	159	S		HC	2018-04-21 20:20:00	\N	Ndt	Rtin	S	\N	\N	t	f	2018-04-21 20:20:29.626403	2018-04-21 20:20:29.626403	f	APP	Nin	1	\N	\N	\N	\N	\N	\N	f
85	1	137	T	Mini	MA	2018-05-30 15:39:00	\N	Check up	None	S	\N	\N	t	f	2018-04-23 15:39:41.868282	2018-04-23 15:39:41.868282	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
86	2	137	S		MA	2018-04-23 00:00:00	\N	None	padmore123	S	\N	\N	t	f	2018-04-23 15:44:59.842424	2018-04-23 15:44:59.842424	f	APP	padmore123	2	\N	\N	\N	\N	\N	\N	f
87	6	137	S		MA	2018-04-23 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-23 15:53:08.255484	2018-04-23 15:53:08.255484	f	APP	None	2	\N	\N	\N	\N	\N	\N	f
88	3	137	S		MA	2018-04-23 15:58:00	\N	None	None	E	\N	\N	t	f	2018-04-23 15:58:36.698209	2018-04-23 15:58:36.698209	f	APP	None	2	\N	\N	\N	\N	\N	\N	f
89	3	137	S		MA	2018-04-23 00:00:00	\N	none	None	S	\N	\N	t	f	2018-04-23 16:07:49.175709	2018-04-23 16:07:49.175709	f	APP	none	2	\N	\N	\N	\N	\N	\N	f
90	6	137	S		MA	2018-04-23 00:00:00	\N	None	None	E	\N	\N	t	f	2018-04-23 16:38:00.687996	2018-04-23 16:38:00.687996	f	APP	None	2	\N	\N	\N	\N	\N	\N	f
92	\N	137	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-23 16:40:56.681799	2018-04-23 16:40:56.681799	f	APP	None	2	\N	\N	None	\N	\N	\N	f
93	\N	137	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-04-23 16:48:15.682819	2018-04-23 16:48:15.682819	f	APP	none	2	\N	\N	none	\N	\N	\N	f
94	\N	137	S		MD	\N	\N	\N	dfgdfhd	S	\N	\N	t	f	2018-04-23 16:50:25.622834	2018-04-23 16:50:25.622834	f	APP	fdfghfd	2	\N	\N	none	\N	\N	\N	f
95	3	137	S		MA	2018-04-23 17:06:00	\N	Check up	None	S	\N	\N	t	f	2018-04-23 17:06:23.825573	2018-04-23 17:06:23.825573	f	APP	None	2	\N	\N	\N	\N	\N	\N	f
98	\N	137	\N	\N	VC	2018-04-30 17:08:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-23 17:08:50.10843	2018-04-23 17:08:50.10843	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
100	\N	137	\N	\N	VC	2018-04-23 17:22:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-23 17:22:45.082931	2018-04-23 17:22:45.082931	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
99	\N	137	\N	\N	VC	2018-04-23 00:00:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-23 17:16:27.537649	2018-04-23 17:43:04.228999	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
97	\N	137	S		LA	2018-04-23 17:07:00	\N	\N	None	S	\N	\N	t	f	2018-04-23 17:07:59.908877	2018-04-23 17:52:54.008809	t	APP	None 	1	\N	\N	\N	\N	None	\N	f
101	\N	137	S		HC	2018-04-23 17:24:00	\N	None	None	S	\N	\N	t	f	2018-04-23 17:24:49.119267	2018-04-23 17:54:04.19971	t	APP	None	1	\N	\N	\N	\N	\N	\N	f
96	\N	137	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-23 17:07:04.119171	2018-04-23 17:56:00.823334	t	APP	None	2	\N	\N	Efpac	\N	\N	\N	f
91	8	137	S		MA	2018-04-23 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-23 16:40:03.067204	2018-04-23 17:57:05.364632	t	APP	None	1	\N	\N	\N	\N	\N	\N	f
102	8	155	S		MA	2018-04-23 21:25:00	\N	Hads	Mad	E	\N	\N	t	f	2018-04-23 21:25:43.168079	2018-04-23 21:25:43.168079	f	APP	Non	1	\N	\N	\N	\N	\N	\N	f
103	8	155	S		MA	2018-04-23 21:25:00	\N	Hads	Mad	E	\N	\N	t	f	2018-04-23 21:26:03.03637	2018-04-23 21:26:03.03637	f	APP	Non	1	\N	\N	\N	\N	\N	\N	f
104	\N	155	T	Kofo ghana	MD	\N	\N	\N	Diab	E	\N	\N	t	f	2018-04-23 21:36:48.121985	2018-04-23 21:36:48.121985	f	APP	Nil	2	\N	\N	Para	\N	\N	\N	f
105	\N	155	S		MD	\N	\N	\N	Duab	S	\N	\N	t	f	2018-04-23 21:47:04.157668	2018-04-23 22:20:12.782663	t	APP	Nik 	2	\N	\N	Tegretol	\N	\N	\N	f
106	\N	137	S		HC	2018-04-24 00:00:00	\N	Checkups	None	E	\N	\N	t	f	2018-04-24 19:05:03.810879	2018-04-24 19:05:03.810879	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
107	\N	137	T	Kwame	HC	2018-04-24 00:00:00	\N	Health	None	S	\N	\N	t	f	2018-04-24 19:11:22.363108	2018-04-24 19:11:22.363108	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
108	\N	137	S		HC	2018-04-24 00:00:00	\N	Checks	None	S	\N	\N	t	f	2018-04-24 19:24:20.136319	2018-04-24 19:24:20.136319	f	APP	None	1	\N	\N	Efpac	\N	\N	\N	f
109	1	137	S		MA	2018-04-24 19:25:00	\N	Noon e	None	S	\N	\N	t	f	2018-04-24 19:27:12.992752	2018-04-24 19:27:12.992752	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
110	\N	137	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-24 19:29:01.569166	2018-04-24 19:29:01.569166	f	APP	None	1	\N	\N	Efpac	\N	\N	\N	f
111	1	179	S		MA	2018-04-27 11:00:00	\N	Headache	None	S	\N	\N	t	f	2018-04-26 11:46:48.407294	2018-04-26 12:06:47.946087	t	APP	None	1	\N	\N	\N	\N	\N	\N	f
119	\N	137	\N	\N	VC	2018-04-26 12:31:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 12:31:42.966984	2018-04-26 12:31:42.966984	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
112	1	179	S		MA	2018-04-27 11:00:00	\N	Headache	None	S	\N	\N	f	f	2018-04-26 11:48:12.211171	2018-04-26 12:07:53.156588	t	APP	None	1	\N	\N	\N	\N	\N	\N	f
113	\N	179	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-26 11:52:26.553989	2018-04-26 12:09:27.999467	t	APP	None	1	\N	\N	Vitamin c	\N	\N	\N	f
114	\N	179	S		LA	2018-04-26 11:54:00	\N	\N	None	S	\N	\N	t	f	2018-04-26 11:54:24.072629	2018-04-26 12:10:20.100055	t	APP	None	1	\N	\N	\N	\N	Malaria	\N	f
115	\N	179	\N	\N	VC	2018-04-26 00:57:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 11:54:45.814376	2018-04-26 12:11:40.390884	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
116	\N	179	S		HC	2018-04-26 01:55:00	\N	Knee pains	None	S	\N	\N	t	f	2018-04-26 11:56:23.051029	2018-04-26 12:13:33.383626	t	APP	None	1	\N	\N	\N	\N	\N	\N	f
117	\N	179	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-04-26 11:56:54.503871	2018-04-26 12:20:50.348993	t	APP	\N	1	t	\N	\N	\N	\N	\N	f
118	\N	179	\N	\N	VC	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 12:23:29.380712	2018-04-26 12:23:29.380712	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
120	\N	179	\N	\N	PC	2018-04-26 12:34:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 12:34:55.885099	2018-04-26 12:34:55.885099	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
121	\N	137	\N	\N	VC	2018-04-26 12:36:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 12:36:28.208493	2018-04-26 12:36:28.208493	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
122	8	179	S		MA	2018-04-26 12:38:00	\N	Headache	None	S	\N	\N	t	f	2018-04-26 12:39:13.315989	2018-04-26 12:39:13.315989	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
123	\N	179	T	Nii	MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-26 12:40:44.706866	2018-04-26 12:40:44.706866	f	APP	None	1	\N	\N	Vitamin e	\N	\N	\N	f
124	\N	179	S		LA	2018-04-26 12:41:00	\N	\N	No	S	\N	\N	t	f	2018-04-26 12:41:38.667984	2018-04-26 12:41:38.667984	f	APP	No	2	\N	\N	\N	\N	Malaria	\N	f
125	\N	137	S		VC	2018-04-28 09:27:00	\N	Malaria	Chloroquine	S	\N	\N	t	f	2018-04-26 12:48:12.950947	2018-04-26 12:48:12.950947	f	APP	None	\N	\N	\N	None 	\N	\N	\N	f
126	\N	137	T	Mathan	VC	2018-04-26 13:02:00	\N	Running	None	S	\N	\N	t	f	2018-04-26 13:02:25.356645	2018-04-26 13:02:25.356645	f	APP	None	\N	\N	\N	None	\N	\N	\N	f
127	4	179	S		MA	2018-04-26 13:27:00	\N	Headache 	None	S	\N	\N	t	f	2018-04-26 13:27:29.388585	2018-04-26 13:27:29.388585	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
128	8	180	S		MA	2018-04-27 13:00:00	\N	Headache	None	S	\N	\N	t	f	2018-04-26 15:48:51.919094	2018-04-26 15:48:51.919094	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
129	\N	180	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 16:05:49.745008	2018-04-26 16:05:49.745008	f	APP	\N	1	\N	\N	\N	\N	\N	\N	f
130	\N	137	S		VC	2018-04-26 00:00:00	\N	Line	None	S	\N	\N	t	f	2018-04-26 16:11:44.277618	2018-04-26 16:11:44.277618	f	APP	None	\N	\N	\N	None	\N	\N	\N	f
131	\N	137	S		VC	2018-04-26 00:00:00	\N	Home	None	S	\N	\N	t	f	2018-04-26 16:26:35.212333	2018-04-26 16:26:35.212333	f	APP	None	\N	\N	\N	None	\N	\N	\N	f
132	\N	137	S		VC	2018-04-26 00:00:00	\N	Feed	None	S	\N	\N	t	f	2018-04-26 16:47:24.367109	2018-04-26 16:47:24.367109	f	APP	None	\N	\N	\N	None	\N	\N	\N	f
133	\N	137	S		PDVC	2018-04-26 16:55:00	\N	Checkups	None	S	\N	\N	t	f	2018-04-26 16:55:56.25055	2018-04-26 16:55:56.25055	f	APP		\N	\N	\N		\N	\N	\N	f
134	\N	137	T	Vinatieri	HC	2018-04-26 00:00:00	\N	Stroke	Waist	S	\N	\N	t	f	2018-04-26 17:23:53.076022	2018-04-26 17:23:53.076022	f	APP	Garlic	1	\N	\N	None	\N	\N	\N	f
135	\N	180	S		\N	2018-04-26 00:00:00	\N	Bottles	None	S	\N	\N	t	f	2018-04-26 17:37:36.782305	2018-04-26 17:37:36.782305	f	APP	None	1	\N	\N	None	\N	\N	\N	f
136	\N	180	T	Mart	\N	2018-04-26 00:00:00	\N	Checkups	None	S	\N	\N	t	f	2018-04-26 17:39:13.903562	2018-04-26 17:39:13.903562	f	APP		1	\N	\N		\N	\N	\N	f
137	\N	180	S		\N	2018-04-26 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-26 17:43:55.065439	2018-04-26 17:43:55.065439	f	APP		1	\N	\N		\N	\N	\N	f
139	\N	137	S		PDHC	2018-04-26 00:00:00	\N	Checkups	None	S	\N	\N	t	f	2018-04-26 17:52:41.924785	2018-04-26 17:52:41.924785	f	APP	Rice	2	\N	\N		\N	\N	\N	f
62	\N	146	\N	\N	PDDP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:58:21.998159	2018-04-19 18:58:21.998159	f	APP	\N	\N	\N	\N	Durolex\nFlagyl \n	30	\N	\N	f
141	\N	137	\N	\N	PDDP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 18:20:54.527939	2018-04-26 18:20:54.527939	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
142	\N	137	\N	\N	PDDP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 18:37:27.681672	2018-04-26 18:37:27.681672	f	APP	\N	\N	\N	\N		\N	\N	\N	f
143	\N	137	\N	\N	DP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-27 12:21:30.739442	2018-04-27 12:21:30.739442	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f
144	\N	137	S	\N	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-04-27 12:47:35.832314	2018-04-27 12:47:35.832314	f	APP	\N	\N	\N	\N		\N	\N	\N	f
146	\N	137	T	Ama	HC	2018-04-27 00:00:00	\N	Diarrhoea	None	E	\N	\N	t	f	2018-04-27 15:01:14.963691	2018-04-27 15:01:14.963691	f	APP	None	1	\N	\N		\N	\N	\N	f
147	\N	137	S		LA	2018-04-27 00:00:00	\N	\N	None	S	\N	\N	t	f	2018-04-27 17:47:17.59163	2018-04-27 17:47:17.59163	f	APP	None	1	\N	\N	\N	\N	Health	\N	f
148	1	193	S		MA	2018-05-02 12:15:00	\N			S	\N	\N	t	f	2018-04-30 12:15:46.848379	2018-04-30 12:15:46.848379	f	WEB		1	f			\N	\N	\N	f
149	\N	193	S		HC	2018-05-03 10:42:00	\N	<p>Wond dressing</p>		S	\N	\N	t	f	2018-05-02 10:42:29.52193	2018-05-02 12:08:21.680873	t	WEB		1	f			\N	\N	\N	f
151	\N	146	T	Kofi	MD	\N	\N	\N	Diabrsrs 	S	\N	\N	t	f	2018-05-02 18:59:49.609923	2018-05-02 18:59:49.609923	f	APP	Bonr 	1	\N	\N	Paracetamol	\N	\N	\N	f
152	\N	146	S		LA	2018-05-02 19:01:00	\N	\N	Diabetes 	E	\N	\N	t	f	2018-05-02 19:01:29.697781	2018-05-02 19:01:29.697781	f	APP	None 	1	\N	\N	\N	\N	Urine test 	\N	f
150	1	146	S		MA	2018-05-02 18:58:00	\N	Headache 	Diabetes 	E	\N	\N	t	f	2018-05-02 18:58:59.482277	2018-05-02 19:01:31.060329	t	APP	None	1	\N	\N	\N	\N	\N	\N	f
155	\N	146	S	\N	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-05-02 19:07:29.257627	2018-05-02 19:07:29.257627	f	APP	\N	\N	\N	\N		\N	\N	\N	f
153	\N	146	S		PDVC	2018-05-02 19:05:00	\N	Diarrhoea 	DB	E	\N	\N	t	f	2018-05-02 19:05:19.736085	2018-05-02 19:10:02.596875	t	APP	None	\N	\N	\N	Pain	\N	\N	\N	f
156	4	159	S		MA	2018-05-02 19:48:00	\N	Med 	Db	S	\N	\N	t	f	2018-05-02 19:48:13.033824	2018-05-02 19:48:13.033824	f	APP	Nkne 	1	\N	\N	\N	\N	\N	\N	f
157	\N	159	T	Kofi	MD	\N	\N	\N	Db	S	\N	\N	t	f	2018-05-02 19:48:43.920138	2018-05-02 19:48:43.920138	f	APP	None	1	\N	\N	Med 	\N	\N	\N	f
158	\N	159	S		LA	2018-05-02 19:49:00	\N	\N	None 	E	\N	\N	t	f	2018-05-02 19:49:34.760679	2018-05-02 19:49:34.760679	f	APP	Nome 	2	\N	\N	\N	\N	Urine 	\N	f
159	\N	159	S		LA	2018-05-02 19:52:00	\N	\N	Non 	E	\N	\N	t	f	2018-05-02 19:52:08.923852	2018-05-02 19:52:08.923852	f	APP	Non	2	\N	\N	\N	\N	Stool 	\N	f
161	\N	159	S		HC	2018-05-02 19:53:00	\N	Pla	No 	E	\N	\N	t	f	2018-05-02 19:53:50.361661	2018-05-02 19:53:50.361661	f	APP	Pat	2	\N	\N	Nin	\N	\N	\N	f
162	\N	159		\N	PDDP	\N	\N	\N	\N		\N	\N	t	f	2018-05-02 19:54:04.612297	2018-05-02 19:54:04.612297	f	APP	\N	\N	\N	\N		\N	\N	\N	f
163	\N	159	S	\N	PDDP	\N	\N	\N	\N		\N	\N	t	f	2018-05-02 19:54:19.93823	2018-05-02 19:54:19.93823	f	APP	\N	\N	\N	\N		\N	\N	\N	f
164	\N	159	S	\N	PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-05-02 19:54:43.008626	2018-05-02 19:54:43.008626	f	APP	\N	\N	\N	\N		\N	\N	\N	f
165	1	208	S		MA	2018-05-04 09:44:00	\N	None	None 	S	\N	\N	t	f	2018-05-04 09:44:41.248125	2018-05-04 09:44:41.248125	f	APP	None	1	\N	\N	\N	\N	\N	\N	f
166	\N	212	\N	\N	PD	\N	\N	\N	Diab	\N	\N	\N	t	f	2018-05-04 13:49:11.116662	2018-05-04 13:49:11.116662	f	APP	\N	1	t	\N	\N	\N	\N	\N	f
167	\N	216	\N	\N	PD	\N	\N	\N	Diabetic	\N	\N	\N	t	f	2018-05-04 14:27:18.625965	2018-05-04 14:44:02.70808	t	APP	\N	1	t	\N	\N	\N	\N	\N	f
168	\N	208	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-05-04 15:22:54.682639	2018-05-04 15:25:09.662591	t	APP	\N	1	t	\N	\N	\N	\N	\N	f
169	\N	229	S		PD	\N	\N			S	\N	\N	t	f	2018-05-05 14:27:41.448564	2018-05-05 14:31:52.724726	t	WEB		1	f			\N	\N	\N	f
189	\N	239	\N	\N	PD	\N	\N	\N	Diabetes 	\N	\N	\N	t	f	2018-05-10 02:35:27.674999	2018-05-10 02:58:42.503437	t	APP	\N	1	t	\N	\N	\N	\N	\N	f
172	9	136	S		PD	2018-05-09 23:22:00	\N			S		\N	t	f	2018-05-05 22:22:11.14515	2018-05-05 22:22:32.486942	t	PTL	\N	3	\N	\N	\N	\N	\N	\N	f
170	9	137	T	Padmore	PD	2018-05-08 23:08:00	\N			E		\N	t	f	2018-05-05 22:08:33.424613	2018-05-05 22:22:52.029652	t	PTL	\N	3	\N	\N	\N	\N	\N	\N	f
173	8	232	T	Claire	MA	2018-05-07 17:21:00	\N	None	None	S	\N	\N	t	f	2018-05-07 13:21:34.012588	2018-05-07 15:06:33.608736	t	APP	None	1	\N	\N	\N	\N	\N	\N	f
174	\N	232	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-05-07 13:24:42.714815	2018-05-07 15:08:08.524081	t	APP	None	2	\N	\N	Vitamin c	\N	\N	\N	f
175	\N	232	S		LA	2018-05-07 13:31:00	\N	\N	None	S	\N	\N	t	f	2018-05-07 13:25:34.223964	2018-05-07 15:09:15.816693	t	APP	None	1	\N	\N	\N	\N	Malaria	\N	f
177	\N	193	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-05-08 18:01:45.141195	2018-05-08 20:33:21.88265	t	APP	\N	1	t	\N	\N	\N	\N	\N	f
176	\N	232	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-05-07 15:22:08.059817	2018-05-08 20:33:45.355918	t	APP	\N	1	t	Ben	\N	\N	\N	\N	f
179	\N	234	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-05-09 09:27:48.535281	2018-05-09 09:38:38.786515	t	APP	\N	1	t	\N	\N	\N	\N	\N	f
180	\N	208	S	\N	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-05-09 14:10:27.926852	2018-05-09 14:10:27.926852	f	APP	\N	\N	\N	\N		\N	\N	\N	f
181	\N	137	S		PDHC	2018-05-09 14:21:00	\N	Home	None	S	\N	\N	t	f	2018-05-09 14:21:49.068022	2018-05-09 14:21:49.068022	f	APP	None	1	\N	\N	Top	\N	\N	\N	f
182	\N	237	\N	\N	PD	\N	\N	\N	Malaria 	\N	\N	\N	t	f	2018-05-09 15:28:05.27309	2018-05-09 15:47:40.864088	t	APP	\N	3	t	Yaw Adom	\N	\N	\N	\N	f
183	\N	237	S	\N	PDDP	\N	\N	\N	\N		\N	\N	t	f	2018-05-09 15:49:03.826813	2018-05-09 15:49:03.826813	f	APP	\N	\N	\N	\N		\N	\N	\N	f
184	9	237	S		PC	2018-05-12 16:53:00	\N			E		230	t	f	2018-05-09 15:52:40.663781	2018-05-09 15:54:30.685649	t	PTL	\N	\N	\N	\N	\N	\N	\N	\N	f
194	\N	239	T	Kofi baah	PDHC	2018-05-10 03:05:00	\N	Headaches 	Db	S	\N	\N	t	f	2018-05-10 03:06:00.822571	2018-05-10 03:07:33.853951	t	APP	Jon	1	\N	\N	Pata	\N	\N	\N	f
192	\N	239	S	\N	PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-05-10 03:03:58.496353	2018-05-10 03:12:18.513908	t	APP	\N	\N	\N	\N		\N	\N	\N	f
203	4	136	T	Yaa	MA	2018-05-10 11:15:00	\N			S	\N	\N	t	f	2018-05-10 11:16:11.637488	2018-05-10 11:16:11.637488	f	WEB		1	f			\N	\N	501234567	f
204	8	136	T	Nana	MA	2018-05-10 11:17:00	\N			S	\N	\N	t	f	2018-05-10 11:17:44.240737	2018-05-10 11:17:44.240737	f	WEB		1	f			\N	\N	0201234567	f
205	8	136	T	Nii	MA	2018-05-10 14:24:00	\N			S	\N	\N	t	f	2018-05-10 14:24:04.375556	2018-05-10 14:24:04.375556	f	WEB		2	f			\N	\N	0266009887	f
196	1	239	S		MA	2019-05-10 10:35:00	\N	Vbbbv	Hfds	E	\N	\N	t	f	2018-05-10 10:35:41.191027	2018-05-10 15:20:25.142886	t	APP	Nino	1	\N	\N	\N	\N	\N	\N	f
202	\N	239	S	\N	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-05-10 10:40:15.855817	2018-05-10 15:29:07.406633	t	APP	\N	\N	\N	\N		\N	\N	\N	f
201	\N	239	S		PDHC	2018-05-10 10:39:00	\N	Gtn	Accr	E	\N	\N	t	f	2018-05-10 10:39:29.637364	2018-05-10 15:30:45.532042	t	APP	Nono	2	\N	\N	Gtn	\N	\N	\N	f
200	\N	239	S		PDHC	2018-05-10 10:38:00	\N	Ghhy	Nuut	E	\N	\N	t	f	2018-05-10 10:38:21.582065	2018-05-10 15:31:22.761631	t	APP	Nono	1	\N	\N	Patpaddy 	\N	\N	\N	f
199	\N	239	S		PDVC	2018-05-10 10:38:00	\N	Gtttc	Hiion	E	\N	\N	t	f	2018-05-10 10:37:37.84642	2018-05-10 15:32:03.705883	t	APP	Nono	\N	\N	\N	Gtb	\N	\N	\N	f
198	\N	239	S	\N	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-05-10 10:37:03.108108	2018-05-10 15:34:01.686809	t	APP	\N	\N	\N	\N		\N	\N	\N	f
197	\N	239	S		VC	2018-05-10 22:36:00	\N	Jjkjd	Bhhyyr	E	\N	\N	t	f	2018-05-10 10:36:19.525655	2018-05-10 15:36:31.127473	t	APP	Nono	\N	\N	\N	Gttn	\N	\N	\N	f
195	\N	139	T	Padmore Paddy	VC	2018-05-11 10:06:00	\N			S	\N	\N	t	f	2018-05-10 10:06:47.587306	2018-05-10 15:38:50.161538	t	WEB		\N	f			\N	\N	248990122	f
191	\N	239	S		HC	2018-05-10 02:37:00	\N	Him	Gha	E	\N	\N	t	f	2018-05-10 02:37:11.25249	2018-05-10 15:40:03.516173	t	APP	Nin	1	\N	\N	Para	\N	\N	\N	f
190	\N	239	S		VC	2018-05-10 02:36:00	\N	Ghk	Gda	E	\N	\N	t	f	2018-05-10 02:36:15.429024	2018-05-10 15:41:25.63211	t	APP	Nib	\N	\N	\N	Hop	\N	\N	\N	f
188	\N	239	T	Hogg	LA	2018-05-10 02:34:00	\N	\N	Dib	S	\N	\N	t	f	2018-05-10 02:34:25.290004	2018-05-10 15:42:39.155909	t	APP	Nk 	1	\N	\N	\N	\N	Urine tes\nCbc\nMrsa	\N	f
187	\N	239	S		MD	\N	\N	\N	Iaasc	E	\N	\N	t	f	2018-05-10 02:32:48.398369	2018-05-10 15:47:24.960978	t	APP	Nibe	1	\N	\N	Hklo	\N	\N	\N	f
186	1	239	S		MA	2018-05-10 02:32:00	\N	Hoad	Gjisc	S	\N	\N	t	f	2018-05-10 02:32:18.863618	2018-05-10 15:47:56.483372	t	APP	Nlne	1	\N	\N	\N	\N	\N	\N	f
207	1	137	T	Essel	MA	2018-05-11 00:00:00	\N	None	No	S	\N	\N	t	f	2018-05-11 03:25:10.694441	2018-05-11 03:25:10.694441	f	APP		1	\N	\N	\N	\N	\N	\N	f
208	1	137	T	Kofi	MA	2018-06-11 00:00:00	\N	rfdsaf	fdsafasf	S	\N	\N	t	f	2018-05-11 03:28:10.130946	2018-05-11 03:28:10.130946	f	APP	fads	1	\N	\N	\N	\N	\N	\N	f
209	1	137	T	dad	MA	2018-05-11 00:00:00	\N	hgf	dfasf	E	\N	\N	t	f	2018-05-11 03:37:05.80313	2018-05-11 03:37:05.80313	f	APP	fads fa	1	\N	\N	\N	\N	\N	0541840988	f
210	\N	137	T	Sdfsfa	MD	\N	\N	\N	rear	S	\N	\N	t	f	2018-05-11 03:46:29.855575	2018-06-07 13:21:20.380496	f	APP	rear	1	\N	\N	ear	\N	\N	\N	t
206	\N	136	S		MD	\N	\N		<p>none</p>	S	\N	\N	t	f	2018-05-10 16:50:49.091546	2018-06-07 16:52:33.340181	t	WEB	<p>none</p>	1	f		<p>wormplex</p>	\N	\N		t
185	\N	146	T	Kobu2	HC	2018-08-01 08:00:00	\N	Medical 	Huddlt	E	\N	\N	t	f	2018-05-09 20:00:53.459606	2018-06-07 14:42:12.868517	t	APP	Assuming 	1	\N	\N	Pramed	\N	\N	\N	t
193	\N	239	S		PDVC	2018-05-10 03:04:00	\N	Doddy	Min	S	\N	\N	t	f	2018-05-10 03:04:42.431178	2018-06-10 19:46:55.341131	t	APP	Non	\N	\N	\N	Pata	\N	\N	\N	t
160	\N	159	S		VC	2018-05-02 19:53:00	\N	Consult	Db	E	\N	\N	t	f	2018-05-02 19:53:15.139822	2018-06-08 09:58:41.678047	t	APP	Non	\N	\N	\N	Pha	\N	\N	\N	t
171	9	137	T	Padmore	HC	2018-05-08 23:13:00	\N			E		\N	t	f	2018-05-05 22:13:13.971254	2018-06-07 16:54:12.9655	t	PTL	\N	3	\N	\N	\N	\N	\N	\N	t
140	\N	137	S		PDVC	2018-04-26 18:07:00	\N	Home	None	S	\N	\N	t	f	2018-04-26 18:08:08.952371	2018-06-10 20:23:46.097632	t	APP	None	\N	\N	\N	None	\N	\N	\N	t
145	\N	137	S		VC	2018-04-27 14:59:00	\N	None	None 	S	\N	\N	t	f	2018-04-27 14:59:44.246846	2018-06-07 16:54:49.197119	t	APP	None	\N	\N	\N	None	\N	\N	\N	t
154	\N	146	S		PDHC	2018-05-02 19:06:00	\N	Ha 	Pain	E	\N	\N	t	f	2018-05-02 19:06:51.641476	2018-06-10 20:23:49.984785	t	APP	Bine 	1	\N	\N	Para	\N	\N	\N	t
138	\N	137	S		HC	2018-04-26 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-26 17:49:20.958752	2018-06-10 20:23:20.508327	t	APP		1	\N	\N		\N	\N	\N	t
212	\N	137	T	Nath	LA	2018-05-11 00:00:00	\N	\N	fdaf	S	\N	\N	t	f	2018-05-11 04:10:36.519939	2018-05-11 04:10:36.519939	f	APP	far	1	\N	\N	\N	\N	fdaf	0541840988	f
213	\N	137	T	Jacob	VC	2018-05-11 04:23:00	\N	fads	fdsaf	S	\N	\N	t	f	2018-05-11 04:26:47.704367	2018-05-11 04:26:47.704367	f	APP	fdafa	\N	\N	\N		\N	\N	0541840988	f
214	\N	137	S		VC	2018-05-11 04:27:00	\N	Tooth ache	none	S	\N	\N	t	f	2018-05-11 04:27:39.446246	2018-05-11 04:27:39.446246	f	APP		\N	\N	\N		\N	\N		f
215	\N	137	T	Pogba	VC	2018-05-11 04:28:00	\N	rrrq	are	E	\N	\N	t	f	2018-05-11 04:28:50.36286	2018-05-11 04:28:50.36286	f	APP	gfdg	\N	\N	\N	gear	\N	\N	0541840988	f
217	\N	137	S		PC	2018-05-11 04:47:00	\N	Hair	fdsaf	S	\N	\N	t	f	2018-05-11 04:47:49.667306	2018-05-11 04:47:49.667306	f	APP	fads	\N	\N	\N		\N	\N		f
223	\N	239	T	\N	PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-05-12 06:10:44.099556	2018-06-05 21:34:36.12659	f	APP	\N	\N	\N	\N		\N	\N	\N	t
216	\N	137	T	Omar Sherif	HC	2018-05-11 00:00:00	\N	ghgjj	rear	S	\N	\N	t	f	2018-05-11 04:36:50.426934	2018-06-05 21:43:01.89286	f	APP	fsdaf	1	\N	\N	ret trqwfa 	\N	\N	0541840988	t
220	\N	137	T	Adwoa	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-05-11 06:36:50.496396	2018-06-05 21:44:51.395781	f	APP	\N	\N	\N	\N		\N	\N	0541840988	t
222	\N	239	S		PDHC	2018-05-12 06:08:00	\N	Ghan	Hooi	E	\N	\N	t	f	2018-05-12 06:08:10.429882	2018-06-05 22:02:20.793557	f	APP	Nuui	1	\N	\N	Ntf	\N	\N	\N	t
211	\N	137	T	Edgar	MD	\N	\N	\N	rrqewr	E	\N	\N	t	f	2018-05-11 03:47:20.393134	2018-06-06 15:19:41.492567	t	APP	 gfdgs	1	\N	\N	her	\N	\N	0541840988	t
219	\N	137	T	fdsafs	PDHC	2018-05-11 05:33:00	\N	fast	fast	E	\N	\N	t	f	2018-05-11 05:33:53.160265	2018-06-06 15:45:21.83392	t	APP	fsa	1	\N	\N	fdaf	\N	\N	0541840988	t
218	\N	137	T	Michael	PC	2018-05-11 04:51:00	\N	fa	fdsfs	E	\N	\N	t	f	2018-05-11 04:51:29.817718	2018-06-06 15:59:59.859756	t	APP	fdsaf	\N	\N	\N		\N	\N	0541840988	t
221	\N	239	T	Nans	PDVC	2018-05-12 06:07:00	\N	Think 	Thinl	S	\N	\N	t	f	2018-05-12 06:07:11.389334	2018-06-07 13:18:55.210795	f	APP	Non	\N	\N	\N	Noon	\N	\N	\N	t
\.


--
-- Name: pre_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('pre_appointments_id_seq', 228, true);


--
-- Data for Name: pre_confirmed_appointments; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY pre_confirmed_appointments (id, pre_appointment_id, doctor_id, nurse_id, user_id, active_status, del_status, created_at, updated_at, accepted_status, date_time, decline_status, closed) FROM stdin;
31	206	248	\N	135	t	f	2018-06-07 16:52:33.336631	2018-06-07 16:52:48.068695	t	2018-06-07 16:52:00	f	t
33	145	248	\N	135	t	f	2018-06-07 16:53:51.519501	2018-06-07 16:54:49.199667	t	2018-06-28 16:53:00	f	t
34	171	248	\N	135	t	f	2018-06-07 16:54:12.94086	2018-06-07 16:54:52.918546	t	2018-06-13 16:54:00	f	t
32	160	248	\N	135	t	f	2018-06-07 16:53:27.688658	2018-06-08 09:58:41.680444	t	2018-06-22 16:53:00	f	t
20	227	248	\N	135	t	f	2018-06-07 12:04:34.312935	2018-06-08 09:59:21.255638	t	2018-06-08 12:04:00	f	t
14	178	240	\N	36	t	f	2018-06-06 11:02:10.362613	2018-06-06 11:02:10.362613	f	2018-06-30 11:00:00	f	f
15	178	230	\N	36	t	f	2018-06-06 11:02:10.368288	2018-06-06 11:02:10.368288	f	2018-06-30 11:00:00	f	f
17	178	190	\N	36	t	f	2018-06-06 11:02:10.37629	2018-06-06 11:02:10.37629	f	2018-06-30 11:00:00	f	f
18	178	241	\N	36	t	f	2018-06-06 11:02:10.380215	2018-06-06 11:02:10.380215	f	2018-06-30 11:00:00	f	f
4	223	190	\N	36	t	f	2018-06-05 21:34:36.122965	2018-06-05 21:34:36.122965	f	2018-06-06 21:34:00	f	f
5	223	241	\N	36	t	f	2018-06-05 21:34:36.129418	2018-06-05 21:34:36.129418	f	2018-06-06 21:34:00	f	f
7	220	246	\N	135	t	f	2018-06-05 21:44:51.392334	2018-06-05 21:44:51.392334	f	2018-06-05 21:44:00	f	f
8	222	230	\N	36	t	f	2018-06-05 22:02:20.789838	2018-06-05 22:02:20.789838	f	2018-06-05 22:02:00	f	f
9	222	190	\N	36	t	f	2018-06-05 22:02:20.796411	2018-06-05 22:02:20.796411	f	2018-06-05 22:02:00	f	f
10	222	241	\N	36	t	f	2018-06-05 22:02:20.801089	2018-06-05 22:02:20.801089	f	2018-06-05 22:02:00	f	f
6	216	246	\N	135	t	f	2018-06-05 21:43:01.889954	2018-06-06 09:40:01.284568	f	2018-06-05 21:42:00	f	f
16	178	140	\N	36	t	f	2018-06-06 11:02:10.372295	2018-06-07 11:56:58.843763	f	2018-06-30 11:00:00	f	f
38	193	191	\N	135	t	f	2018-06-10 19:46:55.343963	2018-06-10 19:46:55.343963	f	2018-06-21 19:46:00	f	t
39	193	246	\N	135	t	f	2018-06-10 19:46:55.348232	2018-06-10 19:46:55.348232	f	2018-06-21 19:46:00	f	t
37	193	248	\N	135	t	f	2018-06-10 19:46:55.337157	2018-06-10 19:48:37.895541	t	2018-06-21 19:46:00	f	t
24	221	238	\N	135	t	f	2018-06-07 13:18:55.20732	2018-06-07 13:18:55.20732	f	2018-06-09 13:18:00	f	f
25	210	140	\N	135	t	f	2018-06-07 13:21:20.37706	2018-06-07 13:21:20.37706	f	2018-06-11 13:20:00	f	f
35	138	248	\N	135	t	f	2018-06-07 16:54:30.465434	2018-06-10 20:23:20.51048	t	2018-06-19 16:54:00	f	t
12	211	190	\N	36	t	f	2018-06-06 10:47:43.96541	2018-06-06 10:47:43.96541	f	2018-06-07 10:47:00	f	t
30	211	248	\N	135	t	f	2018-06-07 16:51:39.722261	2018-06-10 20:23:40.027866	t	2018-06-07 16:51:00	f	t
40	140	163	\N	135	t	f	2018-06-10 19:47:30.001367	2018-06-10 19:47:30.001367	f	2018-06-10 19:47:00	f	t
26	185	\N	245	36	t	f	2018-06-07 13:26:33.581402	2018-06-07 13:26:33.581402	f	2018-06-13 13:26:00	f	t
27	185	\N	211	36	t	f	2018-06-07 13:26:33.587665	2018-06-07 13:26:33.587665	f	2018-06-13 13:26:00	f	t
29	185	\N	243	36	t	f	2018-06-07 13:26:33.595997	2018-06-07 13:26:33.595997	f	2018-06-13 13:26:00	f	t
28	185	\N	192	36	t	f	2018-06-07 13:26:33.591845	2018-06-07 15:00:56.71197	t	2018-06-13 13:26:00	f	t
41	140	248	\N	135	t	f	2018-06-10 19:47:30.007554	2018-06-10 19:47:30.007554	f	2018-06-10 19:47:00	f	t
36	227	248	\N	135	t	f	2018-06-08 17:28:57.486299	2018-06-08 17:28:57.486299	f	2018-06-08 17:28:00	f	f
44	78	248	\N	135	t	f	2018-06-10 20:23:30.90156	2018-06-10 20:23:30.90156	f	2018-06-20 20:23:00	f	f
13	211	242	\N	36	t	f	2018-06-06 10:47:43.970094	2018-06-06 10:47:43.970094	f	2018-06-07 10:47:00	f	t
11	211	140	\N	36	t	f	2018-06-06 10:47:43.957914	2018-06-07 11:58:34.803335	f	2018-06-07 10:47:00	f	t
42	140	248	\N	135	t	f	2018-06-10 20:22:06.052968	2018-06-10 20:23:46.099668	t	2018-06-10 20:21:00	f	t
43	154	248	\N	135	t	f	2018-06-10 20:22:46.980456	2018-06-10 20:23:49.986748	t	2018-06-10 20:22:00	f	t
19	219	140	\N	36	t	f	2018-06-06 12:02:58.593087	2018-06-07 10:19:04.825399	f	2018-06-07 12:02:00	f	f
3	218	140	\N	36	t	f	2018-06-05 21:32:13.317669	2018-06-07 11:14:09.35456	f	2018-06-06 21:32:00	f	f
1	218	240	\N	36	t	f	2018-06-05 21:32:13.305616	2018-06-05 21:32:13.305616	f	2018-06-06 21:32:00	f	f
2	218	230	\N	36	t	f	2018-06-05 21:32:13.313156	2018-06-05 21:32:13.313156	f	2018-06-06 21:32:00	f	f
21	228	240	\N	135	t	f	2018-06-07 12:56:50.406544	2018-06-07 12:56:50.406544	f	2018-06-08 12:56:00	f	f
22	228	140	\N	135	t	f	2018-06-07 12:56:50.412964	2018-06-07 12:56:50.412964	f	2018-06-08 12:56:00	f	f
23	228	246	\N	135	t	f	2018-06-07 12:56:50.417029	2018-06-07 12:56:50.417029	f	2018-06-08 12:56:00	f	f
\.


--
-- Name: pre_confirmed_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('pre_confirmed_appointments_id_seq', 44, true);


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
9	Oyarifa General Hospital	Ogh	10		\N	149	t	f	2018-05-05 22:06:16.713326	2018-05-05 22:06:16.713326
\.


--
-- Name: provider_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('provider_masters_id_seq', 9, true);


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
3	Mobiles	Clemence	2018-05-15	4567878	210	\N	t	f	2018-05-04 12:36:12.86643	2018-05-04 17:44:34.663858	f
2	Paddy	Sweet	2018-05-09	0248001090	192	\N	t	f	2018-05-02 09:55:33.797983	2018-05-04 17:44:36.294123	f
1	Jonas	Mine	2018-01-01	0243112233	140	\N	t	f	2018-05-02 09:26:49.207588	2018-05-04 17:44:37.814482	f
4	Tim	Kojo	1993-06-01	0205869653	230	\N	t	f	2018-05-09 14:15:04.488036	2018-05-09 14:15:04.488036	f
5	Yeboah	Kofi	2017-09-04	0541840988	248	\N	t	f	2018-06-07 12:48:53.766882	2018-06-07 12:48:53.766882	f
6	Mensah	Adjoa	2000-06-08	0541840988	\N	\N	t	f	2018-06-08 05:55:25.400426	2018-06-08 05:55:25.400426	\N
7	Adjei	Frank	1993-06-08	0541840988	248	\N	t	f	2018-06-08 06:11:10.330194	2018-06-08 06:11:10.330194	\N
8	Essel	Kwasi	2000-12-08	0249737457	248	\N	t	f	2018-06-08 06:39:10.641505	2018-06-08 06:39:10.641505	\N
\.


--
-- Name: referals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('referals_id_seq', 8, true);


--
-- Data for Name: region_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY region_masters (id, region_state_name, comment, country_id, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	Volta		1	\N	36	t	f	2018-03-05 11:01:20.717709	2018-03-05 11:01:20.717709
2	Greater Accra		1	\N	83	t	f	2018-03-05 11:17:06.265971	2018-03-05 11:17:06.265971
3	Lagos		2	\N	83	t	f	2018-03-05 11:19:02.294644	2018-03-05 11:19:02.294644
4	South Africa		4	\N	149	t	f	2018-04-19 10:47:51.820186	2018-04-19 10:47:51.820186
5	Western Region		1	\N	135	t	f	2018-04-20 12:19:55.082822	2018-04-20 12:19:55.082822
\.


--
-- Name: region_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('region_masters_id_seq', 5, true);


--
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY registration (id, surname, other_names, mobile_number, password, status, telco, src, verified, email, username, user_type, surburb_id, user_id, user_uniq_code, dob, created_at, updated_at, specialty_id, specialty_duration, has_specialty, foreign_training, foreign_institution, professional_group_id, licence_number, foreign_licence_number, pd_sub, hospital_name) FROM stdin;
3	Quaye	Clara	0248029911                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	f	MTN	WEB	t	clara@gmail.com	mady	C	1	\N	123456789	2008-04-12	2018-04-17 22:02:00	2018-04-17 22:02:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	Tetteh	Andrew	0504899386                                        	c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646	t	VOD	APP	t	andymistic37@gmail.com 	niimistic 	C	\N	\N	1234567890	1989-01-01	2018-04-17 22:03:00	2018-04-17 22:03:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	Agonam	Davi	0243554422                                        	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	t	MTN	APP	t	davi@gmail.com	davi	C	\N	\N	pas12345	2001-01-01	2018-04-17 22:03:00	2018-04-17 22:03:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	Doctor	Doctor	0202233117                                        	f348d5628621f3d8f59c8cabda0f8eb0aa7e0514a90be7571020b1336f26c113	t	VOD	APP	f	doc@gmail.com	doctor	D	\N	\N	doctor123	1988-02-01	2018-04-17 22:03:00	2018-04-17 22:03:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	Ago	Nam	0243668890                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	ago@gmail.com	ago	D	1	36	\N	2014-03-30	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	Maddy	Cutie	0558029911                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	MTN	APP	f	Mady@gmail.com	maddy	D	\N	\N	123456789	1991-08-30	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	Kusimensah	Yaw	+233244444329                                     	6dccb5fa4402fe7f15fb887a20a7c4ddccfc17594c9777382da09931a17138a5	t	\N	WEB	t	ykusimensah@gmail.com	drkusmeister	D	2	145	\N	2028-02-19	2018-04-20 05:58:43.294476	2018-04-20 07:06:36.019548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	Appiah	Gloria	4444445                                           	bbd617ad5ab21eca0ed7d0895e76ae062bc99ddbf2ea0e3fc81123e5ee4ca7a6	t	\N	WEB	t	G@apl.com	gloria	C	2	145	\N	2018-04-02	2018-04-20 06:20:49.080923	2018-04-20 07:15:27.125352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	Appiah 	kobby2	546678                                            	92b7495bead46124bc6baa6616f19b9f7783e03c81595f33e01a2204713a6cf6	t	VOD	APP	f	K@aol.com 	kobby2	D	\N	\N	Passwordkobby2	1991-07-01	2018-04-20 07:24:51.872515	2018-04-20 07:24:51.872515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	Clara	Addae	0543901100                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	PTL	t	cl@yahool.com	claradoc	N	\N	36	\N	2018-04-20	2018-04-20 16:08:20.812554	2018-04-20 16:08:20.812554	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	Tetteh	Andy	0201234467                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	APP	t	Nii@gmail.com	nii	C	\N	135	\N	2001-01-01	2018-04-20 10:47:19.876099	2018-04-20 10:49:37.823634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	Jon	Sexton	0578001100                                        	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	t	TIG	WEB	f	john@gmail.com	jon	C	2	\N	pas12345	2018-04-19	2018-04-19 11:36:28.945754	2018-04-19 11:36:28.945754	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Yeboah	Padmore	0541840988                                        	d169aa18ee15483aef92fb71a3eed0031e8d74715652e213a85fc66965edbed7	t	MTN	APP	t	padmorey@gmail.com	paddy	C	\N	\N	padmore123	1992-12-16	2018-04-17 22:00:00	2018-04-17 22:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	Quaye	Akosua	0248021199                                        	555cf638ea8288ac324dafe31787122f31c8d8d5825c6fb52b654aa01233f2b3	t	MTN	APP	t	Clara@gmail.com	clara	C	\N	\N	claraclara	2000-01-01	2018-04-17 22:01:00	2018-04-17 22:01:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	Danso	Kwame	0241230000                                        	263a601c948f2cdcb7521365a8b83120096121a618938ef1291a8de02f3837b8	t	MTN	WEB	t	kwamedanso@gmail.com	kwamedanso	P	1	36	\N	2012-01-02	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	Amemawukpor	Kwame	0241889900                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	kwame@gmail.com	kwame	C	1	36	\N	1990-02-10	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	Bansah	Jerry	0266000350                                        	c946f701a3b98b8ec1e4ed93de689450acba912910c28a945d7593982a29fd79	t	AIR	WEB	t	jerry@gmail.com	jerry	C	2	135	\N	2016-06-05	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	Ocansey	Joni	444444r                                           	8ddc17508748f3a7d0e55516d63ca55f6732fd1908e6ad95e9d2dfa32be8239d	t	TIG	APP	t	kasakyi@hotmail.com 	joni1	C	\N	36	\N	1994-01-04	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	Atsra	Oscar	0265110098                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	PTL	t	oscar@gmail.com	oscar1	D	\N	\N	\N	2018-04-09	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	Addae	Freda	0549001123                                        	ecb93e1590e08c3f17be82b54932ae78926d606d57d2f680377b82d7d20b2dcf	t	MTN	PTL	t	freda@gmail.com	sweetness	N	\N	\N	\N	2018-04-18	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	Mensah	Clarence	0567445533                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	PTL	t	cle@hotmail.com	clarence	C	\N	36	\N	2018-04-19	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	Jason	Kofi	0200000000                                        	3c64d02e75dab84df045b1486db6ff8b3967715cd2e0ee333e4c6c79f8db7f7a	t	VOD	APP	f	json@gmail.com	jason	P	\N	\N	jason123	2001-01-01	2018-04-19 16:14:10.437348	2018-04-19 16:14:10.437348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	Adzah	Huj	0261111111                                        	05a3a662c87fecce26130eafef769697ea4f95d8c3249409512b7fe9bc39f45d	t	AIR	APP	f	Adzah@am.com	adzah	L	\N	\N	adzah123	2001-01-01	2018-04-19 18:43:10.827142	2018-04-19 18:43:10.827142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	Mac	Naa	027507907                                         	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	TIG	APP	t	Naa@gmail.com	naa	D	\N	135	\N	2001-01-01	2018-04-20 12:52:50.017535	2018-04-20 12:53:41.331842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	Doku	Mercy	99887766                                          	a8447567d3aa5c32a3f197d9156a34fbd820f9290e8cccdcc640422f7aa7e147	t	MTN	APP	f	K@aol.com 	patmercy	C	\N	\N	Passwordpatmercy	1986-12-01	2018-04-20 13:27:31.042164	2018-04-20 13:27:31.042164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	Oduro	Patemma	445567787                                         	b2036656b8afe1586f68af792d17100fadd2ed2367c925d58d3484e4761a4f8f	t	VOD	APP	t	g@gmail.com	patemma	C	\N	145	\N	1984-09-01	2018-04-21 05:30:54.828564	2018-04-21 05:43:48.305445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	Apps	Nursegloria	45666777                                          	356e20864cb22a75b64121a04606254f11da037cd533d48c6c8e855601be0c5b	t	VOD	APP	t	Gg@gmail.com	nursegloria	N	\N	145	\N	1988-12-01	2018-04-21 10:50:47.365937	2018-04-21 10:52:02.852579	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	Kusi	Yaw	0244574744                                        	625b9cf31e5744733d007297e01066a44e385d4c51ef78306ed4b38e7630e844	t	MTN	APP	t	ykusimensah@yahoo.com	papsicle	C	\N	145	\N	1988-01-28	2018-04-21 11:04:27.414424	2018-04-21 11:21:46.792824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	Essel	Kwaku	0200000001                                        	93aa8e032ac13dc4b3eaf50cbf465d2dbf17c4a55891f2698ebf5bdfae529be8	t	VOD	WEB	f	kwakuessel@gmail.com	kwakuessel	D	2	\N	kwakuessel	2012-01-02	2018-04-22 10:11:51.639003	2018-04-22 10:11:51.639003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	Mercy	Dooko	44445666                                          	f2880bb1ea28995bfa68716e8e9cd74d802b6e8b73638294f8386886e981a04d	t	VOD	APP	f	nm@gmail.com	nursemercy	N	\N	\N	Passwordnursemercy	1971-12-01	2018-04-23 07:30:50.542339	2018-04-23 07:30:50.542339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	Essel	Chale	0200000010                                        	cb9d7e942f9838817d3cc1ee507240eebe305dc6f1532cf92c1d28391bf67939	t	VOD	APP	t	Chale@gmail.com	chale	D	\N	135	\N	2001-01-01	2018-04-24 17:12:13.904016	2018-04-24 17:46:21.218986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	Morin	Nod	0200000006                                        	e5351a1b138656788e51c7dbf1baba4d0eb75bd110d1a8b498b63926b15faf4d	t	VOD	APP	f	Fd@gmail.com	may	C	\N	\N	may123	2001-01-01	2018-04-24 22:47:59.662127	2018-04-24 22:47:59.662127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	Bum	Moesha	0241000000                                        	45a00a3962438c5abdffe4ff1c0b3a1a11a9aec76777f7a3ee240d305fb6a721	t	MTN	APP	f	moes@gmail.com	moesha	C	\N	\N	moesha123	2001-01-10	2018-04-24 23:01:31.025366	2018-04-24 23:01:31.025366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	Mensah	Kwame	0246001190                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	ck@yahoo.com	ck	C	2	\N	pas123	2018-04-25	2018-04-25 11:11:26.222867	2018-04-25 11:11:26.222867	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	Mensah	Kwame	0246001191                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	ck@yahoo1.com	cky	C	2	\N	pas123	2018-04-25	2018-04-25 11:13:04.790677	2018-04-25 11:13:04.790677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	Mensah	Kwame	0246001196                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	cyk@yahoo1.com	ckye	C	2	\N	pas123	2018-04-25	2018-04-25 11:20:46.45085	2018-04-25 11:20:46.45085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	Mensah	Kwame	0246001110                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	cye@yahoo1.com	cke	C	2	\N	pas123	2018-04-25	2018-04-25 11:22:23.000575	2018-04-25 11:22:23.239416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	Agozi	Melody	0544110099                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	melody@gmail.com	melody	C	1	\N	pas123	2002-08-01	2018-04-25 11:38:25.565953	2018-04-25 11:38:25.770656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	Agozi	Melody	0544110090                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	melod1y@gmail.com	melodye	C	1	\N	pas123	2002-08-01	2018-04-25 11:39:23.121232	2018-04-25 11:39:23.369392	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	Agozi	Nora	0567990021                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	nora@gmail.com	nora	C	1	\N	pas123	2000-10-09	2018-04-25 12:11:53.786117	2018-04-25 12:11:54.042017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	Agozi	Yayra	0240901278                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	yayra@gmail.com	yayra	C	2	\N	pas123	2018-04-25	2018-04-25 12:33:33.35417	2018-04-25 12:33:33.593467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	Amoah	getty	0240000003                                        	cee71eaf4ebca669b3db4e655c75f7755f965e498541ac3a630bfecb8ee87ee0	t	MTN	APP	f	get@gmail.com	getty	C	\N	\N	getty123	2001-01-01	2018-04-25 12:49:11.677179	2018-04-25 12:49:11.677179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	Jimah	namak	0243000000                                        	b592dc6a2efc7a96111b7fd118e128d47f25f2b0a5c2719e43364431b5330c88	t	MTN	APP	f	namak@yahoo.com	namak	D	\N	\N	namak123	2000-01-01	2018-04-25 12:51:30.09944	2018-04-25 12:51:30.09944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	Agada	Hope	0547110090                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	hope@gmail.com	hpe	D	2	\N	pas123	2018-04-25	2018-04-25 14:09:01.093394	2018-04-25 14:09:01.093394	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	Chizzy	Baby	0567334423                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	chizzy@gmail.com	chizzy	D	2	\N	pas123	2018-04-01	2018-04-25 14:27:55.409072	2018-04-25 14:27:55.409072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	Agbo	Clem	0567889900                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	clem@yahot.com	clemsedem	D	1	\N	pas123	2018-04-25	2018-04-25 16:43:05.682418	2018-04-25 16:43:05.682418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	Agozi	Sedem	0567009900                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	asedem@gmail.com	asedem	D	1	\N	pas123	2018-04-25	2018-04-25 16:50:10.055669	2018-04-25 16:50:10.055669	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	John	Johnson	0549009890                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	jj@gmail.com	jj	D	1	\N	pas123	2018-04-26	2018-04-26 08:49:30.593406	2018-04-26 08:49:30.593406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	Bekui	Mawunya	0240990011                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	mawu@gmail.com	mawu	D	2	\N	pas123	2018-04-01	2018-04-26 08:52:16.751038	2018-04-26 08:52:16.751038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	Agbemabiese	Padmore	0564229984                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	padimore@gmail.com	padimore	D	2	\N	pas123	2018-04-26	2018-04-26 10:46:52.674762	2018-04-26 10:46:52.674762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	John	Kenny	0578229100                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	f	kenny@gmail.com	kenny	D	1	\N	pas123	2018-04-26	2018-04-26 11:07:47.562183	2018-04-26 11:07:47.562183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	Blaq	John	0548988722                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	blaq@yahool.com	blaq	D	1	\N	pas123	2018-04-26	2018-04-26 11:11:21.354629	2018-04-26 11:14:50.127571	\N		f	f		\N		\N	\N	\N
58	Nyedzi	Arnold	0243195788                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	arnold@gmail.com	arnold	D	1	\N	pas123	2018-04-26	2018-04-26 11:28:36.161629	2018-04-26 11:31:27.963892	4	5	f	f		2	RK456IP	\N	\N	\N
59	Ayeley	Naa	0203443235                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	APP	t	Naa@yahoo.com	naa1	C	\N	\N	12345678	2001-01-01	2018-04-26 11:37:58.736236	2018-04-26 11:37:58.736236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	Mbea	Nancy	0578990099                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	f	nancy@gmail.com	nancy	D	2	\N	pas123	2018-04-03	2018-04-26 12:47:28.783079	2018-04-26 15:18:23.186918	4	6	f	f		1	YTHjd33	\N	t	\N
61	Osei	Patricia	0540000001                                        	0414530a84a89ce3f1d693f0376570be8cc1177bee503027cbf15d4a79d9a9f5	t	MTN	APP	t	pat@gmail.com	pat	C	\N	\N	pat123	2001-01-01	2018-04-26 15:43:39.976461	2018-04-26 15:43:39.976461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	Mena	Mansah	0569001123                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	mena@gmail.com	mena	C	1	\N	pas123	2018-04-25	2018-04-27 09:57:17.286403	2018-04-27 09:57:17.286403	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
63	Mena	Mansah	0569001124                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	mansah@gmail.com	mensa	C	2	\N	pas123	2018-04-02	2018-04-27 10:01:18.758025	2018-04-27 10:01:18.758025	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
64	Mena	Mansah	0569001129                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	mans1ah@gmail.com	mensah	C	2	\N	pas123	2018-04-02	2018-04-27 10:02:55.708459	2018-04-27 10:02:55.708459	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
65	Mena	Mansah	0569001126                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	mans2ah@gmail.com	mensahs	C	2	\N	pas123	2018-04-02	2018-04-27 10:03:50.097291	2018-04-27 10:03:50.097291	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
66	Mena	Mansah	0569001160                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	mans4ah@gmail.com	mens	C	2	\N	pas123	2018-04-02	2018-04-27 10:04:47.598821	2018-04-27 10:04:47.9177	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
67	Donalds	Stev	0249001102                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	stev@gmail.com	stev	D	2	\N	pas123	2018-04-01	2018-04-27 10:09:13.396494	2018-04-27 17:37:22.654483	2	4	f	f		1	DKF75KF	\N	t	\N
68	Nyan	Tiery	0269012209                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	tiery@gmail.com	tiery	D	1	36	pas123	2018-04-01	2018-04-27 17:42:25.26288	2018-04-27 18:13:55.981907	1	5	t	t	British Medical Association	2	RK6879K	BR658JK	t	\N
69	Gbeku	Mawunya	0549013390                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	mawunya22@gmail.com	mawunya	D	2	36	pas123	2018-04-01	2018-04-27 18:15:56.864714	2018-04-27 18:17:27.133046	3	5	f	f		1	FGH45HJ	\N	t	\N
70	Asamoah	David	0578119903                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	t	david23@yahoo.com	davido	D	1	36	pas123	2018-04-27	2018-04-27 18:23:09.918964	2018-04-27 18:24:25.87474	3	6	f	f		1	HJ56KK	\N	t	\N
87	Paddy1	Paddy1	0541840900                                        	df4b0a3d762c150089f185b86b1bc89874cfee38c08c61db99dbd7dde57d61f8	t	MTN	APP	f	paddy1@gmail.com	paddy1	N	\N	\N	paddy1	2001-01-01	2018-05-02 20:51:13.159955	2018-05-02 20:51:13.159955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	Amoah	Matthew	0568910299                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	amoah@gmail.com	matthew	D	1	36	pas123	2018-04-27	2018-04-27 18:31:02.875588	2018-04-27 18:41:04.348223	1	2	f	f		1	HJ657KG	\N	f	\N
88	Paddy2	Paddy2	0540000987                                        	9a02247ddd864b9a04fd8a220e02a37bf375c8f47695e50e78ba8bd35c5ffbb9	t	MTN	APP	f	paddy2@gmail.com	paddy2	D	\N	\N	paddy2	2001-01-01	2018-05-02 20:52:13.471947	2018-05-02 20:52:13.471947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	Jonah	Joan	024399010                                         	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	joan@gmail.com	joan	D	1	36	pas123	2018-04-01	2018-04-30 09:05:54.548578	2018-04-30 09:47:34.377607	1	2	f	f		1	GH8847M	\N	f	\N
89	Araba	Yaa	0205869653                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	APP	t	freda@appsnmobilesolutions.com 	maame	C	\N	\N	12345678	1988-01-07	2018-05-04 09:33:53.084342	2018-05-04 09:33:53.084342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	Tetteh	Celestina	0249009890                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	celest@yahoo.com	celest	N	1	36	pas123	2018-04-01	2018-04-30 11:07:57.385891	2018-04-30 11:09:17.767145	4	2	f	f		1	NU34J	\N	f	\N
74	Yaa	Freda	0546778299                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	yaa2@hotmail.com	yaa	C	1	\N	pas123	2018-04-30	2018-04-30 11:44:33.000179	2018-04-30 11:44:33.203757	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
90	Winkles	Becky	44433333                                          	af7acf0251392b90198d89b9934c9a7f4a60d2b7765e2d673f08a3c48cb333c1	t	AIR	APP	f	B@gmail.com	nursebecky	N	\N	\N	Passwordnursebecky	2001-01-01	2018-05-04 12:21:26.13067	2018-05-04 12:21:26.13067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	Yaa	Freda	0271234567                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	t	yaaa@gmail.com	yaaa	D	1	135	pas123	2018-04-03	2018-04-30 11:49:20.177741	2018-04-30 12:26:48.501861	3	4	f	f		1	FGF5HJ	\N	f	\N
91	Winkles	August	55566666                                          	ca068749082aac43d67e55ad71962e320a398b0405baa18996492b4e756a88fd	t	UNKNOWN	WEB	t	a@gmail.com	nurseaugust	N	1	145	Passwordnurseaugust	2018-05-07	2018-05-04 12:29:55.418825	2018-05-04 12:33:27.890707	3	5	f	f		2	3356553767	\N	f	\N
92	Cloe	Hulda	0248109024                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	cloe@gmail.com	cloe	N	1	\N	pas123	2018-05-16	2018-05-04 12:59:51.405554	2018-05-04 13:00:59.878804	1	4	\N	\N	\N	2	j683334	\N	f	\N
93	Apps	Gloria	4456777778                                        	022d787db18783eec27669a3b950dbeb0e48f858567b9d9fcc866a0c601c6ee4	t	VOD	APP	t	G@gmail.com	patgloria	C	\N	\N	Passwordpatgloria	1992-01-01	2018-05-04 13:01:09.045297	2018-05-04 13:01:09.045297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
99	Paddydoc	Paddy	0541840000                                        	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	t	MTN	APP	f	portugal@gmail.com	paddydoc	D	1	\N	paddydoc123	2001-01-01	2018-05-04 17:57:13.393377	2018-05-04 19:49:32.38431	4	1 year	t	t	Fyn	2	Got t55	55tty77	\N	\N
95	Malik	Abdul	339909999                                         	17dffde774df0caff8b6997b37163d4dc671d0c2f844aea43929e980480f288e	t	TIG	APP	f	A@hmail.com	drabdul	D	\N	\N	Passworddrabdul	1993-01-01	2018-05-04 13:18:53.805997	2018-05-04 13:18:53.805997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	Good	Luck	0248190033                                        	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	t	MTN	APP	t	Good@yah.com	luck	C	\N	\N	pas12345	2001-01-01	2018-05-04 14:26:33.159909	2018-05-04 14:26:33.159909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	Cloe	Hulda	0245892009                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	cloe1@yahoo.com	clueh	D	2	36	pas123	2018-05-08	2018-05-04 13:03:19.82815	2018-05-04 15:20:32.442674	4	4	f	f		1	454656464	\N	f	\N
98	Chilax	Victor	55678899090                                       	a14e5f92c29592c7fd21e99e0a112d206cfdf4e74270e33957689840485f97cc	t	UNKNOWN	WEB	t	c@gmail.com	drchilax	D	1	145	Passworddrchilax	2018-04-29	2018-05-04 15:36:20.017453	2018-05-04 15:39:56.971629	2	7	t	t	ghana	1	7789000	6878090-	t	\N
96	Paddy	DOCTOR	0541840980                                        	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	t	MTN	APP	f	Paddoc@	paddydoctor	D	1	\N	paddydoc123	2001-01-01	2018-05-04 14:00:19.303599	2018-05-04 15:55:38.697188	3	2 years	t	t	Udhshs	1	Yeheh3	722hhe	\N	\N
101	Paddydoc	Paddydoc	0200000011                                        	47ee518e8ffc2a6940ed3c973d1801748fdfe05c23938494b38e351b87d0602a	t	VOD	WEB	f	paddydoc2@gmail.com	paddydocweb	D	1	\N	paddydoc23	2018-05-04	2018-05-04 21:35:52.955835	2018-05-04 21:41:15.303972	2	2	t	t	fdfq	1	rr32432	r45454	t	\N
100	paddydoc1	paddydoc1	0541840901                                        	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	t	MTN	APP	f	paddydoc1@gmail.com	paddydoc1	D	1	\N	paddydoc123	2001-01-01	2018-05-04 21:29:12.412613	2018-05-04 21:43:23.159413	4	3	t	t	fads fsdf	1	43234	23424	\N	\N
102	Paddydocc	Paddydocc	0200000100                                        	c6a9c46899f8e648ed1ff0f926bff782e0141e39dcea7ab882b0da525e5058ff	t	VOD	APP	t	paddydocc@gmail.com	paddydocc	D	1	36	paddydocc	2001-01-01	2018-05-04 21:48:10.108053	2018-05-04 23:45:15.640026	1	3	t	t	4324sfs	1	324rr32	fsdfdsf	\N	\N
104	Agozi	Zeal	0248109980                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	zealous@yahoo.com	zealous	N	1	36	pas123	2018-05-06	2018-05-05 12:22:14.760991	2018-05-05 12:24:44.846659	1	2	\N	\N	\N	1	hj76hj	\N	f	Nyaho Hospital
103	Agozi	Zeal	0269022431                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	zeal@gmail.com	zeal	D	2	36	pas123	2018-05-09	2018-05-05 12:01:30.502282	2018-05-05 12:03:59.639859	1	3	f	f		1	hj578jsk	\N	t	Pentecost Hospital
105	Paddydocd	Paddydocd	0241840988                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	fdsf@gmail.com	paddydocd	D	\N	\N	123456	2001-01-01	2018-05-05 13:34:27.230118	2018-05-05 13:34:27.230118	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
106	paddydoca	paddydoca	0541850993                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	paddydoca@gmail.com	paddydoca	D	1	\N	123456	2001-01-01	2018-05-05 13:50:48.089229	2018-05-05 13:51:51.989902	1	2	t	\N	fsddaf	1	5234c	32rfsdf	t	paddydoca clinic
107	clementina	clementina	0541012100                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	fasf@gmail.com	clementina	D	1	\N	123456	2001-01-01	2018-05-05 13:56:30.824123	2018-05-05 13:57:53.293381	2	2	t	\N	USA foreign regulator	1	asf45	EUS123434	t	clementina clinic
108	clementino	clementino	0201840988                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	VOD	APP	f	clementino@gmail.com	clementino	D	1	\N	123456	2001-01-01	2018-05-05 14:03:18.232871	2018-05-05 14:05:13.216779	2	23	t	\N	USA	1	E234324	UE324234	t	clementino clinic
109	Clementine	Clementine	0201021112                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	VOD	APP	t	clementine@gamil.com	clementine	D	1	36	123456	2001-01-01	2018-05-05 14:12:59.921431	2018-05-05 14:19:45.205696	2	2	t	t	RE32432	1	E4234	32432	t	clementine clinic
110	Ben	Fiifi	0201234567                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	WEB	t	ben@gmail.com	ben	C	2	\N	12345678	2016-11-27	2018-05-05 14:13:12.50429	2018-05-05 14:13:12.691115	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
127	Yeboah	Padmore	0249737027                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	padmorey@gmail.com	paddy3	D	1	\N	123456	1990-10-01	2018-06-05 21:10:47.077963	2018-06-05 21:17:02.370546	1	2	t	t	Eisten School	1	756757	8043242	t	Emmanuel Eye Clinic
111	Adom	Yaw	0264620508                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	AIR	APP	t	freda.addae92@gmail.com 	frank	D	1	149	123456789	1987-01-19	2018-05-05 21:26:36.446662	2018-05-05 21:46:16.614897	2	5	t	t	NY 	2	12345	98765	t	Oyarifa general hospital 
112	Mensah	Clara	0248110987                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	clacla@yahoo.com	clacla	C	3	\N	pas123	2018-05-06	2018-05-07 13:15:28.40337	2018-05-07 13:15:28.615655	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
113	Mady	Clare	0241233778                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	MTN	APP	t	Clare@gmail.com	clare	C	\N	\N	12345678	2001-01-01	2018-05-07 13:19:45.031967	2018-05-07 13:19:45.031967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
114	Budog	Momo	0249011980                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	momo@yall.om	mom	C	3	\N	pas123	2018-05-07	2018-05-07 13:32:22.686616	2018-05-07 13:32:22.888961	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
115	Padmore	Paddy	024679875544                                      	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	Paddy@gmail.com	paddy123	C	\N	\N	pas123	2001-01-01	2018-05-09 09:26:58.174643	2018-05-09 09:26:58.174643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
116	Clementina	Clementina	0541000000                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	Clem@gmail.com	clementine1	D	\N	\N	123456	1994-06-01	2018-05-09 09:33:37.916069	2018-05-09 09:33:37.916069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
117	Clementine2	Cle	0541200000                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	Hg@ymailm.com	clementine2	D	1	\N	123456	1985-01-01	2018-05-09 09:36:54.702478	2018-05-09 09:38:10.854621	2	2	t	t	Rttddfg	1	244433	443355	t	Beauty eye clinic 
118	Dadson	Samson	0556296012                                        	e24df920078c3dd4e7e8d2442f00e5c9ab2a231bb3918d65cc50906e49ecaef4	t	MTN	APP	t	freda.addae92@gmail.com 	kay	C	\N	\N	87654321	1990-01-01	2018-05-09 15:24:11.433451	2018-05-09 15:24:11.433451	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
119	New 	Paddy	444444                                            	ffff233db410e5acf113cff436edf4e8ec9d3d4284136219667294d674378e30	t	VOD	APP	f	P@gmail.com 	drpaddy	D	1	\N	Passworddrpaddy	1996-01-01	2018-05-10 00:54:48.823526	2018-05-10 01:27:59.565014	4	7yrs	t	t	Fmc	2	54368	67894	t	Korlebu
120	Newman 	Patpaddy	455778                                            	5f5d906024bedc60d3998a753fb800074f39a2c5fde6ac6b10239044084ad06d	t	MTN	APP	t	Pt@gmail.com 	patpaddy	C	\N	\N	Passwordpatpaddy	1996-05-01	2018-05-10 01:37:13.213418	2018-05-10 01:37:13.213418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
121	Ababio	Bansah	0266123456                                        	8a9bcf1e51e812d0af8465a8dbcc9f741064bf0af3b3d08e6b0246437c19f7fb	t	AIR	APP	f	ababio@gmail.com 	jerry1	D	\N	\N	987654321	1982-01-01	2018-05-10 09:32:48.497241	2018-05-10 09:32:48.497241	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
122	Andrew	Andy	0277234567                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	TIG	WEB	f	andy@yahoo.com	andy	D	3	\N	12345678	2015-12-27	2018-05-10 14:36:23.735939	2018-05-10 14:36:23.735939	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
123	Andrew	Andy	0277412356                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	TIG	WEB	f	andy1@yahoo.com	andrew	D	1	\N	12345678	2018-05-10	2018-05-10 15:16:44.653972	2018-05-10 15:17:43.386623	4	2	t	t		1			t	university of ghana
22	Apps	Koku	44444444                                          	2a53a7cb14c711408babca8a8444cbb1d7e81c5c744bcc7fc9f2f26403266450	t	VOD	APP	t	K@aol.com	drkoku	D	1	145	\N	1997-08-01	2018-04-20 07:52:23.669727	2018-05-14 18:53:37.545935	2	7	t	\N	\N	2	3455555	\N	\N	Mbu
125	Wil	Mina	0278945612                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	f	mina1@gmail.com	minaa	N	2	\N	pas123	1990-05-15	2018-05-15 16:36:28.774937	2018-05-15 16:36:35.556386	\N		\N	\N	\N	\N		\N	f	
124	Wil	Mina	027789456                                         	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	f	TIG	WEB	f	mina@gmail.com	mina	N	2	\N	pas123	2018-05-15	2018-05-15 13:00:47.826899	2018-05-18 12:30:09.990002	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
126	Amemo	Johnson	0249013344                                        	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	t	MTN	WEB	f	johnson@hotmail.com	johnson	N	1	\N	$Clem@200!	2018-05-08	2018-05-18 16:02:18.647664	2018-05-18 16:02:33.149553	\N		\N	\N	\N	\N		\N	f	
128	Yeboah	Elorm	0276624567                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	TIG	APP	t	padmorey@gmail.com	paddy4	C	\N	\N	123456	1991-11-01	2018-06-06 11:12:19.856195	2018-06-06 11:12:19.856195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
129	Ionic	Senior	0264680508                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	ionic@gmail.com	senior	D	3	158	pas123	1983-06-07	2018-06-07 10:26:50.075203	2018-06-07 10:30:40.9256	3	5	f	f		1	123456789	\N	t	legon
\.


--
-- Name: registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('registration_id_seq', 129, true);


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
1	Super Admin	2017-12-14 16:31:50.541952	2017-12-14 16:31:50.541952	9	\N	t	f
2	Customer Service	2018-05-31 11:49:26.639346	2018-05-31 11:49:26.639346	36		t	f
3	Nurse	2018-05-31 11:57:32.152148	2018-05-31 11:57:32.152148	36		t	f
4	Doctor	2018-05-31 11:57:50.398557	2018-05-31 11:57:50.398557	36		t	f
5	Patient	2018-05-31 11:58:07.720608	2018-05-31 11:58:07.720608	36		t	f
6	Laboratorist	2018-05-31 11:58:26.378812	2018-05-31 11:58:26.378812	36		t	f
7	Pharmacist	2018-05-31 11:58:42.134681	2018-05-31 11:58:42.134681	36		t	f
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
20180312095856
20180315091240
20180319092908
20180319154701
20180322101641
20180323135908
20180327104522
20180419112503
20180419114611
20180425143224
20180425161146
20180426115845
20180502102015
20180505114305
20180505115224
20180510095352
20180514124410
20180514130838
20180514160733
20180514172143
20180529095254
20180529100006
20180530151005
20180606162138
20180606170150
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
9	9	3	0277457312									\N	\N	t	f	2018-05-05 22:06:16.715206	2018-05-05 22:06:16.715206
\.


--
-- Name: service_prov_extra_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('service_prov_extra_infos_id_seq', 9, true);


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
10	Hospital		\N	149	t	f	2018-05-05 22:05:00.311306	2018-05-05 22:05:00.311306
\.


--
-- Name: service_prov_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('service_prov_types_id_seq', 10, true);


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
3	Oyarifa		1	\N	149	t	\N	2018-05-05 21:51:56.247561	2018-05-05 21:51:56.247561
4	Ga Mantsi		1	\N	149	t	\N	2018-05-07 09:17:59.357937	2018-05-07 09:17:59.357937
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
104		$2a$11$rHxKHbMDjpHW9ZDwEiAJP.QNl.tpt5t4H79VQzS4loRj1TmJN9aXK	\N	\N	\N	1	2018-05-04 13:09:28.639562	2018-05-04 13:09:28.639562	41.189.179.64	41.189.179.64	2018-04-20 07:55:53.374977	2018-05-04 13:09:28.641733	155	drkoku	t	\N	\N	\N	\N	\N	4
85		$2a$11$CWFtXdIICXkH./180ewYfugTH8Cx3OCHgZaCRXcBXCTx5JGGubDF.	\N	\N	\N	20	2018-05-10 16:48:50.822838	2018-05-10 14:20:25.634292	41.189.179.83	41.189.179.83	2018-04-12 12:57:44.355961	2018-05-10 16:48:50.824689	136	clara	t	\N	\N	\N	\N	\N	5
110		$2a$11$PS0FwCffpcW5r4BJ7sT4jeP66uAx2WHCiHJZL2rxGCaad4/oz0M0O	\N	\N	\N	0	\N	\N	\N	\N	2018-04-21 10:52:02.846436	2018-04-21 10:52:02.846436	161	nursegloria	t	\N	\N	\N	\N	\N	3
102		$2a$11$KGKflztFKp0b6qjQ.bWDXOhQD8izX0iTazL1JyAicXt..UPmOU01e	\N	\N	\N	0	\N	\N	\N	\N	2018-04-20 07:06:36.014079	2018-04-20 07:06:36.014079	153	drkusmeister	t	\N	\N	\N	\N	\N	4
87		$2a$11$GPIRE6tu3VJXKQDelyTje.ogPrNq2p48BanrUMO68b21dBGJi/mt2	\N	\N	\N	0	\N	\N	\N	\N	2018-04-12 13:21:38.581944	2018-04-12 13:21:38.581944	138	niimistic	t	\N	\N	\N	\N	\N	8
103		$2a$11$g3LyNkV0gfBEv.8OOVIWL.7lprOmkoKbsQi7JfpyJxNrHAKj5CCVq	\N	\N	\N	0	\N	\N	\N	\N	2018-04-20 07:15:27.120317	2018-04-20 07:15:27.120317	154	gloria	t	\N	\N	\N	\N	\N	5
96		$2a$11$GxCAVmx0KCL/iYpyczEBh.P7fD13hGXtFfrThQZLjtI9wRU7tsCNi	\N	\N	\N	0	\N	\N	\N	\N	2018-04-18 22:28:30.576631	2018-04-18 22:28:30.576631	147	oscar	t	\N	\N	\N	\N	\N	4
97		$2a$11$vNTvtpxR5UABLPbzigF/wua9jrirZ4DwpInIz4ltBLKQkLSrwRtFW	\N	\N	\N	0	\N	\N	\N	\N	2018-04-18 22:32:33.10333	2018-04-18 22:32:33.10333	148	oscar1	t	\N	\N	\N	\N	\N	4
111		$2a$11$1qfzFTdl70X/VTSR87XBL.0p5u6eV.xDEGoqgF7q7YC7Wj3yX042S	\N	\N	\N	0	\N	\N	\N	\N	2018-04-21 11:21:46.787855	2018-04-21 11:21:46.787855	162	papsicle	t	\N	\N	\N	\N	\N	5
121		ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	\N	\N	\N	0	\N	\N	\N	\N	2018-04-26 11:37:58.798983	2018-04-26 11:37:58.798983	179	naa1	t	\N	\N	\N	\N	\N	5
122		0414530a84a89ce3f1d693f0376570be8cc1177bee503027cbf15d4a79d9a9f5	\N	\N	\N	0	\N	\N	\N	\N	2018-04-26 15:43:40.0469	2018-04-26 15:43:40.0469	180	pat	t	\N	\N	\N	\N	\N	5
100		$2a$11$BrKoa.8Jj7qAYIUKfoxa4erU8N3XswM3ErSe6jFsjOn0GsZIfz9Fa	\N	\N	\N	0	\N	\N	\N	\N	2018-04-19 11:08:01.451376	2018-04-19 11:08:01.451376	151	kwamedanso	t	\N	\N	\N	\N	\N	8
92		$2a$11$s5naOnVhkkBXUADy8XbMP.gK3guPNizFca4cqeazwZ0Hz6aXg5wua	\N	\N	\N	1	2018-04-18 15:02:17.440467	2018-04-18 15:02:17.440467	41.189.179.122	41.189.179.122	2018-04-18 15:02:02.007135	2018-04-18 15:02:17.442309	143	kwame	t	\N	\N	\N	\N	\N	5
115		$2a$11$6aG9GVwYtucpMXq.b8Q9nuealdBOM1MHo6SSk65UR/OY46RG1tLsm	\N	\N	\N	2	2018-04-25 11:30:15.2183	2018-04-25 11:23:41.363519	41.189.179.65	41.189.179.65	2018-04-25 11:22:23.234533	2018-04-25 11:30:15.221665	173	cke	t	\N	\N	\N	\N	\N	5
101		$2a$11$u971HIatA6AKmU/nw694TeQXOCIeECQw1rRN0IaAKwekafhCmJ9z.	\N	\N	\N	0	\N	\N	\N	\N	2018-04-19 11:16:50.54463	2018-04-19 11:16:50.54463	152	clarence	t	\N	\N	\N	\N	\N	5
105		$2a$11$hcF.uLQkX77OMipk2Raw0.C6mVGrG2sL9hU/8W5kGjGQUqcBoq1WC	\N	\N	\N	1	2018-04-20 11:50:55.047542	2018-04-20 11:50:55.047542	41.189.179.124	41.189.179.124	2018-04-20 10:49:37.818047	2018-04-20 11:50:55.049688	156	nii	t	\N	\N	\N	\N	\N	8
116		$2a$11$Ht1o.qsmnfd03.oVDRLF.OZoRXSK.M4fthSNgnsOnqC/RyMfQXw1i	\N	\N	\N	0	\N	\N	\N	\N	2018-04-25 11:38:25.765793	2018-04-25 11:38:25.765793	174	melody	t	\N	\N	\N	\N	\N	5
90		$2a$11$cmTR3l5sQ8xLdCBw9dVcb.b1ky.bGDD5UWi/jBeos/Q0dBBmQ0ucK	\N	\N	\N	0	\N	\N	\N	\N	2018-04-13 17:06:54.568645	2018-04-13 17:06:54.568645	141	doctor	t	\N	\N	\N	\N	\N	4
91		$2a$11$AQIExieb8kgul3esmQuPruj.ThorxUSyw1lg7PVYNcGpkx3xaLt06	\N	\N	\N	0	\N	\N	\N	\N	2018-04-13 17:20:38.716438	2018-04-13 17:20:38.716438	142	maddy	t	\N	\N	\N	\N	\N	4
99		$2a$11$hWVCIxAkw.ZY0llm8s0u5.m/qqkols37YpjGik9IQbGXHFhLllA.y	\N	\N	\N	1	2018-04-19 15:12:46.777221	2018-04-19 15:12:46.777221	178.153.38.144	178.153.38.144	2018-04-19 11:04:05.03208	2018-04-19 15:12:46.779066	150	joni1	t	\N	\N	\N	\N	\N	5
112		$2a$11$J2uR17NctdKVkXSrLEqLd.shhp7fQWRR2ssaQRKGO/KPWv/LSrPP6	\N	\N	\N	1	2018-04-24 17:55:17.655752	2018-04-24 17:55:17.655752	41.189.179.88	41.189.179.88	2018-04-24 17:46:21.21344	2018-04-24 17:55:17.658138	163	chale	t	\N	\N	\N	\N	\N	4
117		$2a$11$wQ5v0s3cQhe9pxpuDQfv5e9pxg4BjXOPNvrPvhW4Qpfe9eTESytQ.	\N	\N	\N	0	\N	\N	\N	\N	2018-04-25 11:39:23.364593	2018-04-25 11:39:23.364593	175	melodye	t	\N	\N	\N	\N	\N	5
93		$2a$11$W0jt5TuOCvYut69Sh07sF.QqUSth5SO0BtxueBZJw1srNDGEM93uC	\N	\N	\N	2	2018-04-18 16:37:19.350979	2018-04-18 16:02:45.524436	41.189.179.81	41.189.179.122	2018-04-18 16:02:00.083306	2018-04-18 16:37:19.352907	144	jerry	t	\N	\N	\N	\N	\N	5
118		$2a$11$CSqZJuBCx5ogBLZZfL1QcOU6S7HrvNZ0vLOzn61vwbbzPVwRlK9YG	\N	\N	\N	1	2018-04-25 12:14:43.640772	2018-04-25 12:14:43.640772	41.189.179.65	41.189.179.65	2018-04-25 12:11:54.036881	2018-04-25 12:14:43.642686	176	nora	t	\N	\N	\N	\N	\N	5
113		e5351a1b138656788e51c7dbf1baba4d0eb75bd110d1a8b498b63926b15faf4d	\N	\N	\N	0	\N	\N	\N	\N	2018-04-24 22:47:59.731081	2018-04-24 22:47:59.731081	168	may	t	\N	\N	\N	\N	\N	5
114		45a00a3962438c5abdffe4ff1c0b3a1a11a9aec76777f7a3ee240d305fb6a721	\N	\N	\N	0	\N	\N	\N	\N	2018-04-24 23:01:31.03139	2018-04-24 23:01:31.03139	169	moesha	t	\N	\N	\N	\N	\N	5
109		$2a$11$Z3OECj71jfnntvCv6tQ.PeSphvV9vyJXuuGX2GXzcnham.656xeVK	\N	\N	\N	0	\N	\N	\N	\N	2018-04-21 05:43:48.299244	2018-04-21 05:43:48.299244	160	patemma	t	\N	\N	\N	\N	\N	5
119		$2a$11$xSHY6gyITKignwI188laT.L0px1NL5.E/LoOHJYiUUoLtLL3OBCFK	\N	\N	\N	1	2018-04-25 12:35:28.669464	2018-04-25 12:35:28.669464	41.189.179.65	41.189.179.65	2018-04-25 12:33:33.588727	2018-04-25 12:35:28.678995	177	yayra	t	\N	\N	\N	\N	\N	5
120		cee71eaf4ebca669b3db4e655c75f7755f965e498541ac3a630bfecb8ee87ee0	\N	\N	\N	0	\N	\N	\N	\N	2018-04-25 12:49:11.748757	2018-04-25 12:49:11.748757	178	getty	t	\N	\N	\N	\N	\N	5
106		$2a$11$1XpVPVors.VQc4vMdb52AOtIZRqR6AH28mAioxVkSq77rfZyPgNCC	\N	\N	\N	1	2018-04-25 15:03:23.03273	2018-04-25 15:03:23.03273	41.189.179.65	41.189.179.65	2018-04-20 12:53:41.326646	2018-04-25 15:03:23.034549	157	naa	t	\N	\N	\N	\N	\N	4
86		$2a$11$CG9nxirE5XinrIsl.LpnteFgouA0cQQYMFXHhvr14NhgCmsluFfQO	\N	\N	\N	25	2018-05-11 04:38:55.788069	2018-05-04 21:10:40.561638	41.66.255.212	41.66.255.221	2018-04-12 13:02:17.102533	2018-05-11 04:38:55.798388	137	paddy	t	\N	\N	\N	\N	\N	8
123		$2a$11$9VZ1NcTHblo.LRzaUviBaOH6tM8fV1PRiGPHVebXUuXbArjNMft.O	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 09:57:17.534564	2018-04-27 09:57:17.534564	181	mena	t	f	\N	\N	\N	\N	5
124		$2a$11$FCUfY5TDmjhAaYzE2NvNReKvvx4.Ye8Z75X8y/w/NTa0Pwx8LcRRG	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 10:01:18.987711	2018-04-27 10:01:18.987711	182	mensa	t	f	\N	\N	\N	\N	5
125		$2a$11$Cp0XPxfjZ2/l0gL41kQl4.Xr1GW.asifKZB8ZvWfvXFZvRSyVuqiC	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 10:02:55.945332	2018-04-27 10:02:55.945332	183	mensah	t	f	\N	\N	\N	\N	5
126		$2a$11$8J0ILD6.Rx/VFnjkb5/ShuFiTdcPurNSLF555qqZsqVs1s3EhmOQG	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 10:03:50.330892	2018-04-27 10:03:50.330892	184	mensahs	t	f	\N	\N	\N	\N	5
127		$2a$11$MxsHTRMkjxlc8g6e7P/6GOkFe9fhdHD1/J7x6Pc5x2MPRTBoD6fCi	\N	\N	\N	1	2018-04-27 10:05:30.881878	2018-04-27 10:05:30.881878	41.189.179.124	41.189.179.124	2018-04-27 10:04:47.915507	2018-04-27 10:05:30.884105	185	mens	t	f	\N	\N	\N	\N	5
134		$2a$11$6vHDISBctXHShVCDmZhLt.9rPA5CCbp2MOwENQQ2yb8wy5RfWNJxC	\N	\N	\N	18	2018-06-07 14:48:53.983725	2018-06-07 12:42:46.158198	154.160.14.138	154.160.14.138	2018-04-30 11:07:57.644385	2018-06-07 14:48:53.985832	192	celest	t	f	\N	\N	\N	\N	3
94		$2a$11$x5lNcwDLYySEg.JEEPkvv.SJcaIPFuQq.iMUTNn9QvazR9ik/Brpi	\N	\N	\N	13	2018-05-10 15:09:43.226372	2018-05-10 02:53:19.313621	37.211.248.153	37.211.176.249	2018-04-18 22:21:38.194205	2018-05-10 15:09:43.229295	145	kobby	t	\N	\N	\N	\N	\N	1
131		$2a$11$qeaRxBv77WalyJmZf4Or4uyzTcbTGXSWw5Zf0B8EFjbXahEOJnovS	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 18:23:10.168376	2018-04-27 18:24:25.877967	189	davido	t	f	\N	\N	\N	\N	4
128		$2a$11$/wqLXtwG/pJ1XI0X1aR2N.iGBHL2aECQEKXxy0RSlVJNEHdBbUl4G	\N	\N	\N	1	2018-04-27 17:46:43.814429	2018-04-27 17:46:43.814429	41.189.179.124	41.189.179.124	2018-04-27 10:09:13.636003	2018-04-27 17:46:43.817504	186	stev	t	f	\N	\N	\N	\N	4
129		$2a$11$8GHab5LEQZTMHxpDO1EtJOxerTNsdoW.Ve4TvcKBu65ybyVWkwFjK	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 17:42:25.45598	2018-04-27 18:13:55.985232	187	tiery	t	f	\N	\N	\N	\N	4
130		$2a$11$RU205jD7ILTwUG1VW/JSreQjhpgBN6URr5j7gDrB.Csv9BM3r6AIW	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 18:15:57.064	2018-04-27 18:17:27.137012	188	mawunya	t	f	\N	\N	\N	\N	4
132		$2a$11$xAJU9EItjh0hXQEMXKmHauimZ0.ScgUZHsRpTV7lJwALUvlciX6wu	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 18:31:03.06122	2018-04-27 18:41:04.351506	190	matthew	t	f	\N	\N	\N	\N	4
107		$2a$11$R.xsUQjbfpTaOQfc4WJti.c1jxbDdTT/YgblkuKRdpgo/7rg/wrSe	\N	\N	\N	11	2018-06-07 11:04:57.129092	2018-06-07 10:48:07.06209	154.160.14.138	154.160.14.138	2018-04-20 16:08:20.780149	2018-06-07 11:04:57.130939	158	claradoc	t	\N	\N	\N	\N	\N	1
136		$2a$11$HVqmPXjgs2/RP18e2p0KtuLo1GdacQAvkpde/p5HHMlnclQepdFMu	\N	\N	\N	3	2018-05-08 21:52:03.873546	2018-05-02 11:48:41.016479	41.66.255.172	41.189.179.106	2018-04-30 11:49:20.359862	2018-05-08 21:52:03.8754	194	yaaa	t	f	\N	\N	\N	\N	4
98		$2a$11$p/3HiwLBqVpwJKF1x3SxFOZzS.a/D.Kvl8kvZuWM3zwcfK.EgPKn2	\N	\N	\N	18	2018-05-10 09:44:23.601252	2018-05-09 15:53:45.570829	41.189.179.83	41.189.179.120	2018-04-19 09:57:47.271956	2018-05-10 09:44:23.603156	149	sweetness	t	\N	\N	\N	\N	\N	1
133		$2a$11$IgW.6TIVvAN4oPXzgF9/cOu7HCBKDP0WMK0XrIhKnUR4Ri19M/8TW	\N	\N	\N	1	2018-04-30 09:48:05.032575	2018-04-30 09:48:05.032575	41.189.179.101	41.189.179.101	2018-04-30 09:05:54.749035	2018-04-30 09:48:05.034826	191	joan	t	f	\N	\N	\N	\N	4
84		$2a$11$jUlQXLw63k1qPHwwqe.yIuZVKSj5WLwr6wRDJONCHpfoW1NYbAB8.	\N	\N	\N	38	2018-06-10 19:44:47.994607	2018-06-08 17:27:21.035206	41.66.255.227	154.160.14.167	2018-04-12 12:09:33.291711	2018-06-10 19:44:47.998185	135	andy	t	\N	\N	\N	\N	\N	2
6		$2a$11$g3m7AlKLlJuZfoDPt9joouLKcoJmIs3rgs4RtvHigWgvEbt8roq7u	\N	\N	\N	127	2018-06-07 13:21:24.043827	2018-06-06 23:47:34.597756	154.160.14.138	41.66.255.130	2018-01-05 11:52:52.858909	2018-06-07 13:21:24.047627	36	clem	t	\N	clem.jpg	image/jpeg	79054	2018-01-05 12:01:00.41165	1
89		$2a$11$2bi.2KQZM7JguIRFpgoyzegwTF.h3dsF1Wzj1FR2Nw5IjOJt3ghCy	\N	\N	\N	29	2018-06-08 09:21:40.033082	2018-06-07 15:03:44.822584	154.160.14.167	154.160.14.138	2018-04-13 11:21:53.246002	2018-06-08 09:21:40.037037	140	ago	t	\N	image11.jpg	image/jpeg	6181	2018-04-16 17:38:32.661708	4
135		$2a$11$d4GbkvDRUZLl3bbvC3MHvuBz88Vsm49z5trJ8fpoyfaGyImZLHA5e	\N	\N	\N	7	2018-05-02 12:54:27.223959	2018-05-02 12:31:42.429955	41.189.179.106	41.189.179.106	2018-04-30 11:44:33.20181	2018-05-02 12:54:27.225754	193	yaa	t	f	\N	\N	\N	\N	5
137		paddy1	\N	\N	\N	0	\N	\N	\N	\N	2018-05-02 20:51:13.229136	2018-05-02 20:51:13.229136	206	paddy1	f	f	\N	\N	\N	\N	3
138		paddy2	\N	\N	\N	0	\N	\N	\N	\N	2018-05-02 20:52:13.477871	2018-05-02 20:52:13.477871	207	paddy2	f	f	\N	\N	\N	\N	4
108		$2a$11$CY1rzKLdaDxeUlpYBCpUaeDoMe1LI1LHxbQILKMLcRYUxu27T7Bli	\N	\N	2018-05-04 15:41:30.241435	1	2018-05-04 15:41:30.244018	2018-05-04 15:41:30.244018	41.189.179.64	41.189.179.64	2018-04-21 05:08:01.105173	2018-05-04 15:41:30.245626	159	patmercy	t	\N	\N	\N	\N	\N	5
174		$2a$11$GzfeQ9B5wmSn8ZAw4FmO5.Ko/TYICw1zAvW73nWHjsAJ9sXhr0UYC	\N	\N	\N	0	\N	\N	\N	\N	2018-05-15 16:36:29.027342	2018-05-15 16:36:29.027342	244	minaa	f	f	\N	\N	\N	\N	3
171		$2a$10$LblTCy0g5nX71mFrcjASl..mD9c8rLm2COrWoUPp/NnweT7zlQ2d6	\N	\N	\N	0	\N	\N	\N	\N	2018-05-10 09:32:48.634666	2018-05-10 09:32:48.634666	240	jerry1	f	f	\N	\N	\N	\N	4
175		$2a$11$U1QzPiG2PrvIaTacZMzItesEvSORRq9kC2iiGfpmDkW3DbEYPbPqm	\N	\N	\N	0	\N	\N	\N	\N	2018-05-18 16:02:18.923133	2018-05-18 16:02:18.923133	245	johnson	f	f	\N	\N	\N	\N	3
88		$2a$11$KoQwoiHgsfCe3MPoCbtvkeGfEhLtEwN5v0PEEW5AEVTAsGEMsKsuG	\N	\N	\N	39	2018-05-31 11:59:49.769383	2018-05-10 11:33:39.715464	154.160.14.169	41.189.179.83	2018-04-12 13:25:40.535758	2018-05-31 11:59:49.771517	139	davi	t	\N	\N	\N	\N	\N	5
160		$2a$11$3ZpxSro7Bi80so1YsJxNPOnkCKa2Nqzbf4G0geX6vl2TwHieob09K	\N	\N	\N	4	2018-05-07 11:37:33.393388	2018-05-05 14:34:33.10062	41.189.179.71	154.160.16.18	2018-05-05 14:13:12.689247	2018-05-07 11:37:33.395371	229	ben	t	f	\N	\N	\N	\N	5
139		12345678	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 09:33:53.158865	2018-05-04 09:33:53.158865	208	maame	t	f	\N	\N	\N	\N	5
162		$2a$11$oqssaMJNraM1qmT58SZNbuuS1JZvdlTGHxg.tBAb7SIhCsrsDYXUm	\N	\N	\N	1	2018-05-07 13:15:40.870797	2018-05-07 13:15:40.870797	41.189.179.71	41.189.179.71	2018-05-07 13:15:28.613468	2018-05-07 13:15:40.872778	231	clacla	t	f	\N	\N	\N	\N	5
140		Passwordnursebecky	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 12:21:26.191993	2018-05-04 12:21:26.191993	209	nursebecky	f	f	\N	\N	\N	\N	3
164		$2a$11$dTJ43d9UCtY9sgGmi7Bjp.JAFgYPQ.RrpX89wGnwVApxNZN/yN.HG	\N	\N	\N	0	\N	\N	\N	\N	2018-05-07 13:32:22.886886	2018-05-07 13:32:22.886886	233	mom	t	f	\N	\N	\N	\N	5
163		$2a$10$XAGAN6yelHW64GTlsQN/AurbCGvxTsyXUAVtfZm9ilzwKqEEQ8GEK	\N	\N	\N	1	2018-05-07 15:19:05.830965	2018-05-07 15:19:05.830965	41.189.179.71	41.189.179.71	2018-05-07 13:19:45.169953	2018-05-07 15:19:05.834736	232	clare	t	f	\N	\N	\N	\N	5
142		$2a$11$N68McRsibweCIF8BAqVH5OnUmd0ZGPdeg7uL/HyfTFH01poWberjy	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 12:59:51.614209	2018-05-04 12:59:51.614209	211	cloe	f	f	\N	\N	\N	\N	3
143		Passwordpatgloria	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 13:01:09.051611	2018-05-04 13:01:09.051611	212	patgloria	t	f	\N	\N	\N	\N	5
145		Passworddrabdul	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 13:18:53.812241	2018-05-04 13:38:29.201865	214	drabdul	t	f	\N	\N	\N	\N	4
146		paddydoc123	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 14:00:19.309925	2018-05-04 14:00:19.309925	215	paddydoctor	f	f	\N	\N	\N	\N	4
147		pas12345	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 14:26:33.165926	2018-05-04 14:26:33.165926	216	luck	t	f	\N	\N	\N	\N	5
144		$2a$11$d33PnrP4bHxfrfmvmtQzvuRjFPdh9IxbrRdieboFVhp9zxR/UVyaC	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 13:03:20.014508	2018-05-04 15:20:32.445936	213	clueh	t	f	\N	\N	\N	\N	4
148		$2a$11$Va6vO5TI1l73ZFg8j5YPyeMBf/umsiNP/MxYSefhZD8eygnJa/Ui.	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 15:36:20.208595	2018-05-04 15:39:56.974585	217	drchilax	t	f	\N	\N	\N	\N	4
141		$2a$11$F/ewYdutUEtGLAkMhiCqJOPsrCrVfBkx1m62Gz2DvgjQh8.TsbQYm	\N	\N	\N	2	2018-05-04 15:40:34.684196	2018-05-04 12:33:56.479649	41.189.179.64	41.189.179.64	2018-05-04 12:29:55.612508	2018-05-04 15:40:34.68611	210	nurseaugust	t	f	\N	\N	\N	\N	3
176		$2a$10$RlMh97ycr1DFLanAkxYbOubiLNIvaxDJgTuTngYoS5luNtoYQ2TYG	\N	\N	\N	0	\N	\N	\N	\N	2018-06-05 21:10:47.345663	2018-06-05 21:35:17.945273	246	paddy3	t	f	\N	\N	\N	\N	4
149		$2a$10$dwz6CrQJi06uVg7ra/nr7ezxKbn6qg/CPZkO5ROV01CGfs/7uhLhK	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 17:57:13.546301	2018-05-04 17:57:13.546301	218	paddydoc	f	f	\N	\N	\N	\N	4
150		$2a$10$q3qtAb.cXc4yvHQ5S17sSO7PVdY7O.HsW8a/Jlo0QrwmbG2CAGaF.	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 21:29:12.568725	2018-05-04 21:29:12.568725	219	paddydoc1	f	f	\N	\N	\N	\N	4
151		$2a$11$kZvZ2MECP5.h8UuQv3qSrOHIK88JHsLxvUdFBdJCVip3/Hq87sXm.	\N	\N	\N	0	\N	\N	\N	\N	2018-05-04 21:35:53.146596	2018-05-04 21:35:53.146596	220	paddydocweb	f	f	\N	\N	\N	\N	4
165		$2a$10$J1xaBsOZ5Dgepw8bzvMY2eYXqN8CGnFcFoNvHllPPXAml4CZMCbXW	\N	\N	\N	0	\N	\N	\N	\N	2018-05-09 09:26:58.31948	2018-05-09 09:26:58.31948	234	paddy123	t	f	\N	\N	\N	\N	5
152		$2a$10$nL647V5rx2.biZwBSsu6Z.rs.1QZybAWuA.o2tQni5EjLSu5HFpUa	\N	\N	\N	1	2018-05-04 23:49:08.262414	2018-05-04 23:49:08.262414	41.66.255.75	41.66.255.75	2018-05-04 21:48:10.19761	2018-05-04 23:49:08.264481	221	paddydocc	t	f	\N	\N	\N	\N	4
166		$2a$10$/sUdVv4LLncAiXPN5DjBU.uA3J1tdk4TmsLGfVdooy6yHOX9kXzIu	\N	\N	\N	0	\N	\N	\N	\N	2018-05-09 09:33:38.006934	2018-05-09 09:33:38.006934	235	clementine1	f	f	\N	\N	\N	\N	4
172		$2a$11$ZQDa33K.7WcheMICPvPcsOg.a1tfrjgs4J20NwmLMi2U.E4nzjqAG	\N	\N	\N	0	\N	\N	\N	\N	2018-05-10 15:16:44.855244	2018-05-10 15:16:44.855244	242	andrew	f	f	\N	\N	\N	\N	4
167		$2a$10$RmfW8O5icxzi3UgPVuQRju2AnRtgAuiSjrVbfTahDScDFr7ivYP5i	\N	\N	\N	0	\N	\N	\N	\N	2018-05-09 09:36:54.794767	2018-05-09 09:36:54.794767	236	clementine2	f	f	\N	\N	\N	\N	4
154		$2a$11$AitgeFzOKCryNofS4/hZe.wrFue8SxZuRgS3zr1KSyZmqUko92coe	\N	\N	\N	1	2018-05-05 12:24:57.617177	2018-05-05 12:24:57.617177	41.189.179.79	41.189.179.79	2018-05-05 12:22:14.945937	2018-05-05 12:24:57.619006	223	zealous	t	f	\N	\N	\N	\N	3
155		$2a$10$.mO1ajPJSRe9.UzdwsgQn.8sxezEY/a4oYiLZYfGYAKt0e8lk8056	\N	\N	\N	0	\N	\N	\N	\N	2018-05-05 13:34:27.385494	2018-05-05 13:34:27.385494	224	paddydocd	f	f	\N	\N	\N	\N	4
156		$2a$10$SBWvtyYohKLBo9GKK00mF.NLbneSXNgNaIZyCbqSdrdpRGKmPqTsu	\N	\N	\N	0	\N	\N	\N	\N	2018-05-05 13:50:48.245559	2018-05-05 13:50:48.245559	225	paddydoca	f	f	\N	\N	\N	\N	4
157		$2a$10$UUNuassytJwReWpbYPZzc.7v4LHUWXAQd3U1MJ4KbfOm6njBfWc7i	\N	\N	\N	0	\N	\N	\N	\N	2018-05-05 13:56:30.91326	2018-05-05 13:56:30.91326	226	clementina	f	f	\N	\N	\N	\N	4
158		$2a$10$aRR/J8V0IwFzkWlFuwZKbeV28YDVCUAiCiAQgcxfUsx12X/ePmdhO	\N	\N	\N	0	\N	\N	\N	\N	2018-05-05 14:03:18.384266	2018-05-05 14:03:18.384266	227	clementino	f	f	\N	\N	\N	\N	4
177		$2a$10$BMmw3TsrqBfL0PO3EX6UUe8KGMbg8WcN/8VDQbgOK2jUAvEuWtX4i	\N	\N	\N	0	\N	\N	\N	\N	2018-06-06 11:12:20.011054	2018-06-06 11:12:20.011054	247	paddy4	t	f	\N	\N	\N	\N	5
169		$2a$10$UONghGLENphY8H90GKgP8eOLInkVMa3HSlrs9212xhhhxrDEIAXne	\N	\N	2018-05-10 15:49:05.681398	1	2018-05-10 15:49:05.684109	2018-05-10 15:49:05.684109	37.211.248.153	37.211.248.153	2018-05-10 00:54:48.913916	2018-05-10 15:49:05.685688	238	drpaddy	t	f	\N	\N	\N	\N	4
168		$2a$10$W1vdwTTsy9HcJ8x/XGWogeeoPea2Gk6W8OwkA5jpjSB6cLBeEr7zK	\N	\N	\N	0	\N	\N	\N	\N	2018-05-09 15:24:11.579775	2018-05-09 15:24:11.579775	237	kay	t	f	\N	\N	\N	\N	5
161		$2a$10$8t/4hEMx0vVpga9o0SUsa.31LWg8AltBxsBUVLDsraS2SxC0d0KLe	\N	\N	\N	4	2018-05-10 16:35:14.107859	2018-05-09 15:58:26.385281	41.189.179.83	41.189.179.120	2018-05-05 21:26:36.589382	2018-05-10 16:35:14.109896	230	frank	t	f	\N	\N	\N	\N	4
170		$2a$10$9gO0dTOb0W2FIxnYjwAlJOYSfo5HHvRp0P8g4HoTX.f1iyJAZ./3O	\N	\N	\N	0	\N	\N	\N	\N	2018-05-10 01:37:13.303315	2018-05-10 01:37:13.303315	239	patpaddy	t	f	\N	\N	\N	\N	5
153		$2a$11$FWTxFcNCzde347lGdAjxWOhLcJtVAtADit9Mw8fS0UNwC93Rfwe4q	\N	\N	\N	2	2018-06-07 12:41:18.949499	2018-05-05 12:20:35.345078	154.160.14.138	41.189.179.79	2018-05-05 12:01:30.705483	2018-06-07 12:41:18.953296	222	zeal	t	f	\N	\N	\N	\N	4
159		$2a$10$nn4Y0zapThqRZsQF9.VvI.mVgV7u5tiW4L4KrEKEX.m23m1ZytwD6	\N	\N	\N	4	2018-05-11 17:26:09.097153	2018-05-11 16:49:06.333632	41.189.179.85	41.189.179.85	2018-05-05 14:13:00.073626	2018-05-11 17:26:09.100021	228	clementine	t	f	\N	\N	\N	\N	4
173		$2a$11$OMw6dHqSTcXQ8wjbEQETd.6qMkhKZUfi2LGE5uCXNK.cQCdLH3tT2	\N	\N	\N	0	\N	\N	\N	\N	2018-05-15 13:00:48.036308	2018-05-15 13:00:48.036308	243	mina	f	f	\N	\N	\N	\N	3
178		$2a$11$2990lfnaydRtjXWgR.5r3u26rKyGpLp2lNjQSr3fw.giZLY6IUE86	\N	\N	\N	8	2018-06-08 14:47:52.076004	2018-06-08 09:49:04.218482	154.160.14.167	154.160.14.167	2018-06-07 10:26:50.368232	2018-06-08 14:47:52.079898	248	senior	t	f	\N	\N	\N	\N	4
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('users_id_seq', 178, true);


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
-- Name: decline_comments decline_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY decline_comments
    ADD CONSTRAINT decline_comments_pkey PRIMARY KEY (id);


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
-- Name: pre_confirmed_appointments pre_confirmed_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY pre_confirmed_appointments
    ADD CONSTRAINT pre_confirmed_appointments_pkey PRIMARY KEY (id);


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

