--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: affected_system_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.affected_system_masters (
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


ALTER TABLE public.affected_system_masters OWNER TO clemence;

--
-- Name: affected_system_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.affected_system_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.affected_system_masters_id_seq OWNER TO clemence;

--
-- Name: affected_system_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.affected_system_masters_id_seq OWNED BY public.affected_system_masters.id;


--
-- Name: allergies_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.allergies_masters (
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


ALTER TABLE public.allergies_masters OWNER TO clemence;

--
-- Name: allergies_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.allergies_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.allergies_masters_id_seq OWNER TO clemence;

--
-- Name: allergies_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.allergies_masters_id_seq OWNED BY public.allergies_masters.id;


--
-- Name: app_version_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.app_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_version_id_seq OWNER TO clemence;

--
-- Name: app_versions; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.app_versions (
    id integer DEFAULT nextval('public.app_version_id_seq'::regclass) NOT NULL,
    app_id text NOT NULL,
    app_version text NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    app_code text,
    platform text
);


ALTER TABLE public.app_versions OWNER TO clemence;

--
-- Name: appointment_types; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.appointment_types (
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


ALTER TABLE public.appointment_types OWNER TO clemence;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.appointment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointment_types_id_seq OWNER TO clemence;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.appointment_types_id_seq OWNED BY public.appointment_types.id;


--
-- Name: billing_info_bill_items; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.billing_info_bill_items (
    id integer NOT NULL,
    billing_info_id integer,
    item_id integer,
    item_price numeric(10,2),
    quantity integer DEFAULT 1,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.billing_info_bill_items OWNER TO clemence;

--
-- Name: billing_info_bill_items_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.billing_info_bill_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_info_bill_items_id_seq OWNER TO clemence;

--
-- Name: billing_info_bill_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.billing_info_bill_items_id_seq OWNED BY public.billing_info_bill_items.id;


--
-- Name: callback_statuses; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.callback_statuses (
    id integer NOT NULL,
    trans_status character varying,
    trans_id character varying,
    exttrid character varying,
    trans_msg character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.callback_statuses OWNER TO clemence;

--
-- Name: callback_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.callback_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callback_statuses_id_seq OWNER TO clemence;

--
-- Name: callback_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.callback_statuses_id_seq OWNED BY public.callback_statuses.id;


--
-- Name: city_town_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.city_town_masters (
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


ALTER TABLE public.city_town_masters OWNER TO clemence;

--
-- Name: city_town_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.city_town_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_town_masters_id_seq OWNER TO clemence;

--
-- Name: city_town_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.city_town_masters_id_seq OWNED BY public.city_town_masters.id;


--
-- Name: condition_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.condition_masters (
    id integer NOT NULL,
    condition_name character varying,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.condition_masters OWNER TO clemence;

--
-- Name: condition_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.condition_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.condition_masters_id_seq OWNER TO clemence;

--
-- Name: condition_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.condition_masters_id_seq OWNED BY public.condition_masters.id;


--
-- Name: confirmed_appointments; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.confirmed_appointments (
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
    nurse_id integer,
    paid boolean
);


ALTER TABLE public.confirmed_appointments OWNER TO clemence;

--
-- Name: confirmed_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.confirmed_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.confirmed_appointments_id_seq OWNER TO clemence;

--
-- Name: confirmed_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.confirmed_appointments_id_seq OWNED BY public.confirmed_appointments.id;


--
-- Name: confirmed_conditions; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.confirmed_conditions (
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


ALTER TABLE public.confirmed_conditions OWNER TO clemence;

--
-- Name: confirmed_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.confirmed_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.confirmed_conditions_id_seq OWNER TO clemence;

--
-- Name: confirmed_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.confirmed_conditions_id_seq OWNED BY public.confirmed_conditions.id;


--
-- Name: confirmed_personal_doctor_services; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.confirmed_personal_doctor_services (
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


ALTER TABLE public.confirmed_personal_doctor_services OWNER TO clemence;

--
-- Name: confirmed_personal_doctor_services_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.confirmed_personal_doctor_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.confirmed_personal_doctor_services_id_seq OWNER TO clemence;

--
-- Name: confirmed_personal_doctor_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.confirmed_personal_doctor_services_id_seq OWNED BY public.confirmed_personal_doctor_services.id;


--
-- Name: country_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.country_masters (
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


ALTER TABLE public.country_masters OWNER TO clemence;

--
-- Name: country_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.country_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_masters_id_seq OWNER TO clemence;

--
-- Name: country_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.country_masters_id_seq OWNED BY public.country_masters.id;


--
-- Name: decline_comments; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.decline_comments (
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


ALTER TABLE public.decline_comments OWNER TO clemence;

--
-- Name: decline_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.decline_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.decline_comments_id_seq OWNER TO clemence;

--
-- Name: decline_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.decline_comments_id_seq OWNED BY public.decline_comments.id;


--
-- Name: drug_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.drug_masters (
    id integer NOT NULL,
    drug_name character varying,
    drug_alias character varying,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.drug_masters OWNER TO clemence;

--
-- Name: drug_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.drug_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drug_masters_id_seq OWNER TO clemence;

--
-- Name: drug_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.drug_masters_id_seq OWNED BY public.drug_masters.id;


--
-- Name: drug_prices; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.drug_prices (
    id integer NOT NULL,
    drug_id integer,
    price numeric(10,2),
    unit_id integer,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.drug_prices OWNER TO clemence;

--
-- Name: drug_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.drug_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drug_prices_id_seq OWNER TO clemence;

--
-- Name: drug_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.drug_prices_id_seq OWNED BY public.drug_prices.id;


--
-- Name: engaged_user_services; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.engaged_user_services (
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


ALTER TABLE public.engaged_user_services OWNER TO clemence;

--
-- Name: engaged_user_services_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.engaged_user_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.engaged_user_services_id_seq OWNER TO clemence;

--
-- Name: engaged_user_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.engaged_user_services_id_seq OWNED BY public.engaged_user_services.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.events (
    id integer NOT NULL,
    title character varying,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO clemence;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO clemence;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: lab_detail_images; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.lab_detail_images (
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


ALTER TABLE public.lab_detail_images OWNER TO clemence;

--
-- Name: lab_detail_images_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.lab_detail_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lab_detail_images_id_seq OWNER TO clemence;

--
-- Name: lab_detail_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.lab_detail_images_id_seq OWNED BY public.lab_detail_images.id;


--
-- Name: lab_details; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.lab_details (
    id integer NOT NULL,
    pre_appointment_id integer,
    lab_service_id integer,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    confirmed_appt_id integer
);


ALTER TABLE public.lab_details OWNER TO clemence;

--
-- Name: lab_details_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.lab_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lab_details_id_seq OWNER TO clemence;

--
-- Name: lab_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.lab_details_id_seq OWNED BY public.lab_details.id;


--
-- Name: lab_images_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.lab_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lab_images_id_seq OWNER TO clemence;

--
-- Name: lab_images; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.lab_images (
    id integer DEFAULT nextval('public.lab_images_id_seq'::regclass) NOT NULL,
    pre_appointment_id integer NOT NULL,
    appointment_type_id character varying(20),
    requester_id integer,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    file_name character varying(255) NOT NULL
);


ALTER TABLE public.lab_images OWNER TO clemence;

--
-- Name: lab_services; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.lab_services (
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


ALTER TABLE public.lab_services OWNER TO clemence;

--
-- Name: lab_services_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.lab_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lab_services_id_seq OWNER TO clemence;

--
-- Name: lab_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.lab_services_id_seq OWNED BY public.lab_services.id;


--
-- Name: measure_units; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.measure_units (
    id integer NOT NULL,
    unit_desc character varying,
    unit_alias character varying,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.measure_units OWNER TO clemence;

--
-- Name: measure_units_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.measure_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measure_units_id_seq OWNER TO clemence;

--
-- Name: measure_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.measure_units_id_seq OWNED BY public.measure_units.id;


--
-- Name: medication_details; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.medication_details (
    id integer NOT NULL,
    confirmed_appt_id integer,
    drug_id integer,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.medication_details OWNER TO clemence;

--
-- Name: medication_details_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.medication_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medication_details_id_seq OWNER TO clemence;

--
-- Name: medication_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.medication_details_id_seq OWNED BY public.medication_details.id;


--
-- Name: password_table; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.password_table (
    id integer NOT NULL,
    password text NOT NULL,
    mobile_number text NOT NULL,
    created_at time without time zone,
    status boolean,
    username text,
    reset_token text
);


ALTER TABLE public.password_table OWNER TO clemence;

--
-- Name: password_table_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.password_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.password_table_id_seq OWNER TO clemence;

--
-- Name: password_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.password_table_id_seq OWNED BY public.password_table.id;


--
-- Name: patient_billing_infos; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.patient_billing_infos (
    id integer NOT NULL,
    appointment_id integer,
    approval_status boolean,
    approval_date timestamp without time zone,
    payment_status boolean,
    payment_date timestamp without time zone,
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.patient_billing_infos OWNER TO clemence;

--
-- Name: patient_billing_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.patient_billing_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_billing_infos_id_seq OWNER TO clemence;

--
-- Name: patient_billing_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.patient_billing_infos_id_seq OWNED BY public.patient_billing_infos.id;


--
-- Name: patient_med_records; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.patient_med_records (
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
    order_status boolean,
    medicine character varying,
    quantity integer,
    dosage character varying,
    frequency character varying,
    no_of_days integer
);


ALTER TABLE public.patient_med_records OWNER TO clemence;

--
-- Name: patient_med_records_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.patient_med_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_med_records_id_seq OWNER TO clemence;

--
-- Name: patient_med_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.patient_med_records_id_seq OWNED BY public.patient_med_records.id;


--
-- Name: payment_reqs; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.payment_reqs (
    id integer NOT NULL,
    billing_info_id integer,
    amount numeric(10,2),
    reference character varying,
    exttrid character varying,
    mobile_number character varying,
    nw character varying,
    callback_url text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    trans_type character varying
);


ALTER TABLE public.payment_reqs OWNER TO clemence;

--
-- Name: payment_reqs_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.payment_reqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_reqs_id_seq OWNER TO clemence;

--
-- Name: payment_reqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.payment_reqs_id_seq OWNED BY public.payment_reqs.id;


--
-- Name: pds_patient_prev_med_histories; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.pds_patient_prev_med_histories (
    id integer NOT NULL,
    confirmed_pds_id integer,
    prev_med_histry character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pds_patient_prev_med_histories OWNER TO clemence;

--
-- Name: pds_patient_prev_med_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.pds_patient_prev_med_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pds_patient_prev_med_histories_id_seq OWNER TO clemence;

--
-- Name: pds_patient_prev_med_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.pds_patient_prev_med_histories_id_seq OWNED BY public.pds_patient_prev_med_histories.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    subject_class character varying,
    action character varying,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO clemence;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO clemence;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: permissions_roles; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.permissions_roles (
    id integer NOT NULL,
    person_type_master_id integer,
    permission_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role_id integer
);


ALTER TABLE public.permissions_roles OWNER TO clemence;

--
-- Name: permissions_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.permissions_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_roles_id_seq OWNER TO clemence;

--
-- Name: permissions_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.permissions_roles_id_seq OWNED BY public.permissions_roles.id;


--
-- Name: person_contact_infos; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.person_contact_infos (
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


ALTER TABLE public.person_contact_infos OWNER TO clemence;

--
-- Name: person_contact_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.person_contact_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_contact_infos_id_seq OWNER TO clemence;

--
-- Name: person_contact_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.person_contact_infos_id_seq OWNED BY public.person_contact_infos.id;


--
-- Name: person_info_extras; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.person_info_extras (
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


ALTER TABLE public.person_info_extras OWNER TO clemence;

--
-- Name: person_info_extras_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.person_info_extras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_info_extras_id_seq OWNER TO clemence;

--
-- Name: person_info_extras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.person_info_extras_id_seq OWNED BY public.person_info_extras.id;


--
-- Name: person_infos; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.person_infos (
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


ALTER TABLE public.person_infos OWNER TO clemence;

--
-- Name: person_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.person_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_infos_id_seq OWNER TO clemence;

--
-- Name: person_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.person_infos_id_seq OWNED BY public.person_infos.id;


--
-- Name: person_type_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.person_type_masters (
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


ALTER TABLE public.person_type_masters OWNER TO clemence;

--
-- Name: person_type_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.person_type_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_type_masters_id_seq OWNER TO clemence;

--
-- Name: person_type_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.person_type_masters_id_seq OWNED BY public.person_type_masters.id;


--
-- Name: pre_appointments; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.pre_appointments (
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
    pre_confirm_status boolean,
    beneficiary_age integer,
    beneficiary_gender character varying,
    counter_view boolean
);


ALTER TABLE public.pre_appointments OWNER TO clemence;

--
-- Name: pre_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.pre_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pre_appointments_id_seq OWNER TO clemence;

--
-- Name: pre_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.pre_appointments_id_seq OWNED BY public.pre_appointments.id;


--
-- Name: pre_confirmed_appointments; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.pre_confirmed_appointments (
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
    closed boolean,
    patient_id integer
);


ALTER TABLE public.pre_confirmed_appointments OWNER TO clemence;

--
-- Name: pre_confirmed_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.pre_confirmed_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pre_confirmed_appointments_id_seq OWNER TO clemence;

--
-- Name: pre_confirmed_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.pre_confirmed_appointments_id_seq OWNED BY public.pre_confirmed_appointments.id;


--
-- Name: pre_payment_reqs; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.pre_payment_reqs (
    id integer NOT NULL,
    billing_info_id integer,
    amount numeric(10,2),
    reference character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pre_payment_reqs OWNER TO clemence;

--
-- Name: pre_payment_reqs_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.pre_payment_reqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pre_payment_reqs_id_seq OWNER TO clemence;

--
-- Name: pre_payment_reqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.pre_payment_reqs_id_seq OWNED BY public.pre_payment_reqs.id;


--
-- Name: profesional_groups; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.profesional_groups (
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


ALTER TABLE public.profesional_groups OWNER TO clemence;

--
-- Name: profesional_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.profesional_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesional_groups_id_seq OWNER TO clemence;

--
-- Name: profesional_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.profesional_groups_id_seq OWNED BY public.profesional_groups.id;


--
-- Name: provider_engaged_users; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.provider_engaged_users (
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


ALTER TABLE public.provider_engaged_users OWNER TO clemence;

--
-- Name: provider_engaged_users_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.provider_engaged_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provider_engaged_users_id_seq OWNER TO clemence;

--
-- Name: provider_engaged_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.provider_engaged_users_id_seq OWNED BY public.provider_engaged_users.id;


--
-- Name: provider_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.provider_masters (
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


ALTER TABLE public.provider_masters OWNER TO clemence;

--
-- Name: provider_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.provider_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provider_masters_id_seq OWNER TO clemence;

--
-- Name: provider_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.provider_masters_id_seq OWNED BY public.provider_masters.id;


--
-- Name: provider_services; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.provider_services (
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


ALTER TABLE public.provider_services OWNER TO clemence;

--
-- Name: provider_services_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.provider_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provider_services_id_seq OWNER TO clemence;

--
-- Name: provider_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.provider_services_id_seq OWNED BY public.provider_services.id;


--
-- Name: referals; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.referals (
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


ALTER TABLE public.referals OWNER TO clemence;

--
-- Name: referals_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.referals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.referals_id_seq OWNER TO clemence;

--
-- Name: referals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.referals_id_seq OWNED BY public.referals.id;


--
-- Name: region_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.region_masters (
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


ALTER TABLE public.region_masters OWNER TO clemence;

--
-- Name: region_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.region_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_masters_id_seq OWNER TO clemence;

--
-- Name: region_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.region_masters_id_seq OWNED BY public.region_masters.id;


--
-- Name: registration; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.registration (
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


ALTER TABLE public.registration OWNER TO clemence;

--
-- Name: registration_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_id_seq OWNER TO clemence;

--
-- Name: registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.registration_id_seq OWNED BY public.registration.id;


--
-- Name: request_categories; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.request_categories (
    id integer NOT NULL,
    category character varying,
    ref_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.request_categories OWNER TO clemence;

--
-- Name: request_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.request_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_categories_id_seq OWNER TO clemence;

--
-- Name: request_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.request_categories_id_seq OWNED BY public.request_categories.id;


--
-- Name: request_urgencies; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.request_urgencies (
    id integer NOT NULL,
    urgency character varying,
    ref_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.request_urgencies OWNER TO clemence;

--
-- Name: request_urgencies_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.request_urgencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_urgencies_id_seq OWNER TO clemence;

--
-- Name: request_urgencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.request_urgencies_id_seq OWNED BY public.request_urgencies.id;


--
-- Name: requester_allergies; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.requester_allergies (
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


ALTER TABLE public.requester_allergies OWNER TO clemence;

--
-- Name: requester_allergies_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.requester_allergies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requester_allergies_id_seq OWNER TO clemence;

--
-- Name: requester_allergies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.requester_allergies_id_seq OWNED BY public.requester_allergies.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id character varying,
    comment character varying,
    active_status boolean,
    del_status boolean
);


ALTER TABLE public.roles OWNER TO clemence;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO clemence;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO clemence;

--
-- Name: service_fee_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.service_fee_masters (
    id integer NOT NULL,
    appt_type_id character varying,
    service_id integer,
    req_urgency character varying,
    fee numeric(10,2),
    comment character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.service_fee_masters OWNER TO clemence;

--
-- Name: service_fee_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.service_fee_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_fee_masters_id_seq OWNER TO clemence;

--
-- Name: service_fee_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.service_fee_masters_id_seq OWNED BY public.service_fee_masters.id;


--
-- Name: service_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.service_masters (
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


ALTER TABLE public.service_masters OWNER TO clemence;

--
-- Name: service_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.service_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_masters_id_seq OWNER TO clemence;

--
-- Name: service_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.service_masters_id_seq OWNED BY public.service_masters.id;


--
-- Name: service_prov_extra_infos; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.service_prov_extra_infos (
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


ALTER TABLE public.service_prov_extra_infos OWNER TO clemence;

--
-- Name: service_prov_extra_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.service_prov_extra_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_prov_extra_infos_id_seq OWNER TO clemence;

--
-- Name: service_prov_extra_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.service_prov_extra_infos_id_seq OWNED BY public.service_prov_extra_infos.id;


--
-- Name: service_prov_types; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.service_prov_types (
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


ALTER TABLE public.service_prov_types OWNER TO clemence;

--
-- Name: service_prov_types_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.service_prov_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_prov_types_id_seq OWNER TO clemence;

--
-- Name: service_prov_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.service_prov_types_id_seq OWNED BY public.service_prov_types.id;


--
-- Name: specialty_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.specialty_masters (
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


ALTER TABLE public.specialty_masters OWNER TO clemence;

--
-- Name: specialty_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.specialty_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialty_masters_id_seq OWNER TO clemence;

--
-- Name: specialty_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.specialty_masters_id_seq OWNED BY public.specialty_masters.id;


--
-- Name: suburb_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.suburb_masters (
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


ALTER TABLE public.suburb_masters OWNER TO clemence;

--
-- Name: suburb_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.suburb_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suburb_masters_id_seq OWNER TO clemence;

--
-- Name: suburb_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.suburb_masters_id_seq OWNED BY public.suburb_masters.id;


--
-- Name: user_services; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.user_services (
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


ALTER TABLE public.user_services OWNER TO clemence;

--
-- Name: user_services_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.user_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_services_id_seq OWNER TO clemence;

--
-- Name: user_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.user_services_id_seq OWNED BY public.user_services.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE public.users (
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


ALTER TABLE public.users OWNER TO clemence;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO clemence;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: affected_system_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.affected_system_masters ALTER COLUMN id SET DEFAULT nextval('public.affected_system_masters_id_seq'::regclass);


--
-- Name: allergies_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.allergies_masters ALTER COLUMN id SET DEFAULT nextval('public.allergies_masters_id_seq'::regclass);


--
-- Name: appointment_types id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.appointment_types ALTER COLUMN id SET DEFAULT nextval('public.appointment_types_id_seq'::regclass);


--
-- Name: billing_info_bill_items id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.billing_info_bill_items ALTER COLUMN id SET DEFAULT nextval('public.billing_info_bill_items_id_seq'::regclass);


--
-- Name: callback_statuses id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.callback_statuses ALTER COLUMN id SET DEFAULT nextval('public.callback_statuses_id_seq'::regclass);


--
-- Name: city_town_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.city_town_masters ALTER COLUMN id SET DEFAULT nextval('public.city_town_masters_id_seq'::regclass);


--
-- Name: condition_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.condition_masters ALTER COLUMN id SET DEFAULT nextval('public.condition_masters_id_seq'::regclass);


--
-- Name: confirmed_appointments id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.confirmed_appointments ALTER COLUMN id SET DEFAULT nextval('public.confirmed_appointments_id_seq'::regclass);


--
-- Name: confirmed_conditions id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.confirmed_conditions ALTER COLUMN id SET DEFAULT nextval('public.confirmed_conditions_id_seq'::regclass);


--
-- Name: confirmed_personal_doctor_services id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.confirmed_personal_doctor_services ALTER COLUMN id SET DEFAULT nextval('public.confirmed_personal_doctor_services_id_seq'::regclass);


--
-- Name: country_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.country_masters ALTER COLUMN id SET DEFAULT nextval('public.country_masters_id_seq'::regclass);


--
-- Name: decline_comments id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.decline_comments ALTER COLUMN id SET DEFAULT nextval('public.decline_comments_id_seq'::regclass);


--
-- Name: drug_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.drug_masters ALTER COLUMN id SET DEFAULT nextval('public.drug_masters_id_seq'::regclass);


--
-- Name: drug_prices id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.drug_prices ALTER COLUMN id SET DEFAULT nextval('public.drug_prices_id_seq'::regclass);


--
-- Name: engaged_user_services id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.engaged_user_services ALTER COLUMN id SET DEFAULT nextval('public.engaged_user_services_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: lab_detail_images id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.lab_detail_images ALTER COLUMN id SET DEFAULT nextval('public.lab_detail_images_id_seq'::regclass);


--
-- Name: lab_details id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.lab_details ALTER COLUMN id SET DEFAULT nextval('public.lab_details_id_seq'::regclass);


--
-- Name: lab_services id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.lab_services ALTER COLUMN id SET DEFAULT nextval('public.lab_services_id_seq'::regclass);


--
-- Name: measure_units id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.measure_units ALTER COLUMN id SET DEFAULT nextval('public.measure_units_id_seq'::regclass);


--
-- Name: medication_details id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.medication_details ALTER COLUMN id SET DEFAULT nextval('public.medication_details_id_seq'::regclass);


--
-- Name: password_table id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.password_table ALTER COLUMN id SET DEFAULT nextval('public.password_table_id_seq'::regclass);


--
-- Name: patient_billing_infos id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.patient_billing_infos ALTER COLUMN id SET DEFAULT nextval('public.patient_billing_infos_id_seq'::regclass);


--
-- Name: patient_med_records id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.patient_med_records ALTER COLUMN id SET DEFAULT nextval('public.patient_med_records_id_seq'::regclass);


--
-- Name: payment_reqs id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.payment_reqs ALTER COLUMN id SET DEFAULT nextval('public.payment_reqs_id_seq'::regclass);


--
-- Name: pds_patient_prev_med_histories id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.pds_patient_prev_med_histories ALTER COLUMN id SET DEFAULT nextval('public.pds_patient_prev_med_histories_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: permissions_roles id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.permissions_roles ALTER COLUMN id SET DEFAULT nextval('public.permissions_roles_id_seq'::regclass);


--
-- Name: person_contact_infos id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.person_contact_infos ALTER COLUMN id SET DEFAULT nextval('public.person_contact_infos_id_seq'::regclass);


--
-- Name: person_info_extras id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.person_info_extras ALTER COLUMN id SET DEFAULT nextval('public.person_info_extras_id_seq'::regclass);


--
-- Name: person_infos id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.person_infos ALTER COLUMN id SET DEFAULT nextval('public.person_infos_id_seq'::regclass);


--
-- Name: person_type_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.person_type_masters ALTER COLUMN id SET DEFAULT nextval('public.person_type_masters_id_seq'::regclass);


--
-- Name: pre_appointments id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.pre_appointments ALTER COLUMN id SET DEFAULT nextval('public.pre_appointments_id_seq'::regclass);


--
-- Name: pre_confirmed_appointments id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.pre_confirmed_appointments ALTER COLUMN id SET DEFAULT nextval('public.pre_confirmed_appointments_id_seq'::regclass);


--
-- Name: pre_payment_reqs id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.pre_payment_reqs ALTER COLUMN id SET DEFAULT nextval('public.pre_payment_reqs_id_seq'::regclass);


--
-- Name: profesional_groups id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.profesional_groups ALTER COLUMN id SET DEFAULT nextval('public.profesional_groups_id_seq'::regclass);


--
-- Name: provider_engaged_users id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.provider_engaged_users ALTER COLUMN id SET DEFAULT nextval('public.provider_engaged_users_id_seq'::regclass);


--
-- Name: provider_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.provider_masters ALTER COLUMN id SET DEFAULT nextval('public.provider_masters_id_seq'::regclass);


--
-- Name: provider_services id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.provider_services ALTER COLUMN id SET DEFAULT nextval('public.provider_services_id_seq'::regclass);


--
-- Name: referals id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.referals ALTER COLUMN id SET DEFAULT nextval('public.referals_id_seq'::regclass);


--
-- Name: region_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.region_masters ALTER COLUMN id SET DEFAULT nextval('public.region_masters_id_seq'::regclass);


--
-- Name: registration id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.registration ALTER COLUMN id SET DEFAULT nextval('public.registration_id_seq'::regclass);


--
-- Name: request_categories id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.request_categories ALTER COLUMN id SET DEFAULT nextval('public.request_categories_id_seq'::regclass);


--
-- Name: request_urgencies id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.request_urgencies ALTER COLUMN id SET DEFAULT nextval('public.request_urgencies_id_seq'::regclass);


--
-- Name: requester_allergies id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.requester_allergies ALTER COLUMN id SET DEFAULT nextval('public.requester_allergies_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: service_fee_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.service_fee_masters ALTER COLUMN id SET DEFAULT nextval('public.service_fee_masters_id_seq'::regclass);


--
-- Name: service_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.service_masters ALTER COLUMN id SET DEFAULT nextval('public.service_masters_id_seq'::regclass);


--
-- Name: service_prov_extra_infos id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.service_prov_extra_infos ALTER COLUMN id SET DEFAULT nextval('public.service_prov_extra_infos_id_seq'::regclass);


--
-- Name: service_prov_types id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.service_prov_types ALTER COLUMN id SET DEFAULT nextval('public.service_prov_types_id_seq'::regclass);


--
-- Name: specialty_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.specialty_masters ALTER COLUMN id SET DEFAULT nextval('public.specialty_masters_id_seq'::regclass);


--
-- Name: suburb_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.suburb_masters ALTER COLUMN id SET DEFAULT nextval('public.suburb_masters_id_seq'::regclass);


--
-- Name: user_services id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.user_services ALTER COLUMN id SET DEFAULT nextval('public.user_services_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: affected_system_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.affected_system_masters (id, title, comment, user_id, entity_id, active_status, del_status, created_at, updated_at) FROM stdin;
\.


--
-- Name: affected_system_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.affected_system_masters_id_seq', 1, false);


--
-- Data for Name: allergies_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.allergies_masters (id, title, comment, user_id, entity, active_status, del_status, created_at, updated_at) FROM stdin;
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
11	Pollen		\N	\N	t	f	2018-09-05 15:01:39.03712	2018-09-05 15:01:39.03712
\.


--
-- Name: allergies_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.allergies_masters_id_seq', 11, true);


--
-- Name: app_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.app_version_id_seq', 8, true);


--
-- Data for Name: app_versions; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.app_versions (id, app_id, app_version, act_status, del_status, created_at, updated_at, app_code, platform) FROM stdin;
1	appsnmobilesolutions.com.ghinger	0.0.1	t	f	2018-08-20 15:26:08	2018-08-20 15:26:08	1	\N
2	appsnmobilesolutions.com.ghinger	0.0.1	t	f	2018-08-20 15:27:44	2018-08-20 15:27:44	1	\N
3	appsnmobilesolutions.com.ghinger	0.0.2	t	f	2018-08-20 15:29:18	2018-08-20 15:29:18	2	\N
4	appsnmobilesolutions.com.ghinger	0.0.2	t	f	2018-09-04 11:04:21	2018-09-04 11:04:21	2	IOS
5	appsnmobilesolutions.com.ghinger	0.0.6	t	f	2018-09-15 17:02:52	2018-09-15 17:02:52	6	IOS
6	appsnmobilesolutions.com.tertdriveng	0.0.1	t	f	2018-09-22 18:33:16	2018-09-22 18:33:16	1	android
7	appsnmobilesolutions.com.ghinger	0.0.1	t	f	2018-09-22 18:33:50	2018-09-22 18:33:50	1	android
8	appsnmobilesolutions.com.ghinger	0.0.6	t	f	2018-09-22 18:34:14	2018-09-22 18:34:14	6	android
\.


--
-- Data for Name: appointment_types; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.appointment_types (id, title, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, ref_id) FROM stdin;
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

SELECT pg_catalog.setval('public.appointment_types_id_seq', 11, true);


--
-- Data for Name: billing_info_bill_items; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.billing_info_bill_items (id, billing_info_id, item_id, item_price, quantity, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
33	23	5	120.00	3	\N	36	t	f	2018-11-14 12:41:49.570615	2018-11-14 12:41:49.570615
34	23	7	300.00	2	\N	36	t	f	2018-11-14 12:41:49.575034	2018-11-14 12:41:49.575034
35	23	6	36.75	3	\N	36	t	f	2018-11-14 12:41:49.579091	2018-11-14 12:41:49.579091
36	24	6	36.75	3	\N	36	t	f	2018-11-14 12:49:24.829832	2018-11-14 12:49:24.829832
37	24	5	80.00	2	\N	36	t	f	2018-11-14 12:49:24.834159	2018-11-14 12:49:24.834159
38	24	7	600.00	4	\N	36	t	f	2018-11-14 12:49:24.838311	2018-11-14 12:49:24.838311
39	25	5	40.00	1	\N	36	t	f	2018-11-14 12:54:57.617301	2018-11-14 12:54:57.617301
40	25	6	49.00	4	\N	36	t	f	2018-11-14 12:54:57.621921	2018-11-14 12:54:57.621921
41	26	5	160.00	4	\N	36	t	f	2018-11-14 13:01:47.05925	2018-11-14 13:01:47.05925
42	26	7	750.00	5	\N	36	t	f	2018-11-14 13:01:47.063796	2018-11-14 13:01:47.063796
43	26	6	36.75	3	\N	36	t	f	2018-11-14 13:01:47.068026	2018-11-14 13:01:47.068026
44	27	2	200.50	1	\N	36	t	f	2018-11-14 16:34:31.026136	2018-11-14 16:34:31.026136
45	27	10	55.09	1	\N	36	t	f	2018-11-14 16:34:31.03125	2018-11-14 16:34:31.03125
46	27	3	100.00	1	\N	36	t	f	2018-11-14 16:34:31.035827	2018-11-14 16:34:31.035827
47	28	2	200.50	1	\N	36	t	f	2018-11-14 16:38:06.03147	2018-11-14 16:38:06.03147
48	28	1	75.00	1	\N	36	t	f	2018-11-14 16:38:06.036282	2018-11-14 16:38:06.036282
49	28	10	55.09	1	\N	36	t	f	2018-11-14 16:38:06.04096	2018-11-14 16:38:06.04096
50	29	10	55.09	1	\N	36	t	f	2018-11-14 16:40:13.521222	2018-11-14 16:40:13.521222
51	29	1	75.00	1	\N	36	t	f	2018-11-14 16:40:13.525935	2018-11-14 16:40:13.525935
52	29	2	200.50	1	\N	36	t	f	2018-11-14 16:40:13.530473	2018-11-14 16:40:13.530473
53	29	3	100.00	1	\N	36	t	f	2018-11-14 16:40:13.535195	2018-11-14 16:40:13.535195
54	30	2	200.50	1	\N	36	t	f	2018-11-14 16:46:55.227101	2018-11-14 16:46:55.227101
55	30	10	55.09	1	\N	36	t	f	2018-11-14 16:46:55.231006	2018-11-14 16:46:55.231006
56	30	3	100.00	1	\N	36	t	f	2018-11-14 16:46:55.234878	2018-11-14 16:46:55.234878
57	31	2	200.50	1	\N	36	t	f	2018-11-14 16:57:53.742548	2018-11-14 16:57:53.742548
58	31	1	75.00	1	\N	36	t	f	2018-11-14 16:57:53.747519	2018-11-14 16:57:53.747519
59	31	10	55.09	1	\N	36	t	f	2018-11-14 16:57:53.752042	2018-11-14 16:57:53.752042
60	32	10	55.09	1	\N	36	t	f	2018-11-14 16:59:39.676794	2018-11-14 16:59:39.676794
61	32	3	100.00	1	\N	36	t	f	2018-11-14 16:59:39.681617	2018-11-14 16:59:39.681617
62	33	10	55.09	1	\N	36	t	f	2018-11-14 17:00:58.463778	2018-11-14 17:00:58.463778
63	33	2	200.50	1	\N	36	t	f	2018-11-14 17:00:58.468683	2018-11-14 17:00:58.468683
64	34	5	120.00	3	\N	36	t	f	2018-11-14 17:06:06.07703	2018-11-14 17:06:06.07703
65	34	7	300.00	2	\N	36	t	f	2018-11-14 17:06:06.081957	2018-11-14 17:06:06.081957
66	36	\N	50.00	1	\N	36	t	f	2018-11-15 09:46:28.333472	2018-11-15 09:46:28.333472
67	37	\N	50.00	1	\N	36	t	f	2018-11-15 09:46:28.34946	2018-11-15 09:46:28.34946
68	38	\N	50.00	1	\N	36	t	f	2018-11-15 09:46:28.364753	2018-11-15 09:46:28.364753
69	39	\N	50.00	1	\N	36	t	f	2018-11-15 09:46:28.379474	2018-11-15 09:46:28.379474
70	41	\N	100.00	1	\N	36	t	f	2018-11-15 10:28:13.134132	2018-11-15 10:28:13.134132
71	42	\N	100.00	1	\N	36	t	f	2018-11-15 10:28:13.150948	2018-11-15 10:28:13.150948
72	43	\N	500.55	1	\N	36	t	f	2018-11-15 10:54:09.19796	2018-11-15 10:54:09.19796
73	44	\N	500.55	1	\N	36	t	f	2018-11-15 10:54:09.213872	2018-11-15 10:54:09.213872
74	45	\N	150.00	1	\N	36	t	f	2018-11-15 10:55:06.6869	2018-11-15 10:55:06.6869
75	46	\N	150.00	1	\N	36	t	f	2018-11-15 10:55:06.70419	2018-11-15 10:55:06.70419
76	47	\N	120.00	1	\N	36	t	f	2018-11-15 10:55:34.142197	2018-11-15 10:55:34.142197
77	48	\N	120.00	1	\N	36	t	f	2018-11-15 10:55:34.167797	2018-11-15 10:55:34.167797
78	49	\N	135.00	1	\N	36	t	f	2018-11-15 10:55:58.430696	2018-11-15 10:55:58.430696
79	50	\N	135.00	1	\N	36	t	f	2018-11-15 10:55:58.444725	2018-11-15 10:55:58.444725
80	51	\N	0.00	1	\N	36	t	f	2018-11-15 17:46:57.018837	2018-11-15 17:46:57.018837
81	52	\N	0.00	1	\N	36	t	f	2018-11-15 17:48:41.844815	2018-11-15 17:48:41.844815
82	53	9	60.00	2	\N	158	t	f	2018-11-26 16:23:04.963133	2018-11-26 16:23:04.963133
83	53	10	4.00	2	\N	158	t	f	2018-11-26 16:23:04.983468	2018-11-26 16:23:04.983468
84	53	5	40.00	1	\N	158	t	f	2018-11-26 16:23:04.988131	2018-11-26 16:23:04.988131
85	54	\N	120.00	1	\N	158	t	f	2018-11-26 16:25:42.230306	2018-11-26 16:25:42.230306
86	55	9	30.00	1	\N	158	t	f	2018-11-26 16:27:05.136561	2018-11-26 16:27:05.136561
87	56	8	24.00	1	\N	158	t	f	2018-11-26 16:27:43.009807	2018-11-26 16:27:43.009807
88	57	\N	250.00	1	\N	158	t	f	2018-11-28 13:44:26.983524	2018-11-28 13:44:26.983524
89	58	\N	100.00	1	\N	158	t	f	2018-11-28 13:44:58.503902	2018-11-28 13:44:58.503902
90	59	\N	70.00	1	\N	158	t	f	2018-11-28 13:45:22.37662	2018-11-28 13:45:22.37662
91	60	\N	50.00	1	\N	158	t	f	2018-11-28 13:54:55.156521	2018-11-28 13:54:55.156521
92	61	\N	250.00	1	\N	158	t	f	2018-11-28 13:55:22.107691	2018-11-28 13:55:22.107691
93	62	\N	120.00	1	\N	158	t	f	2018-11-28 13:56:01.06858	2018-11-28 13:56:01.06858
94	63	\N	200.00	1	\N	158	t	f	2018-11-28 13:56:26.149529	2018-11-28 13:56:26.149529
95	64	\N	150.00	1	\N	158	t	f	2018-11-28 13:56:43.757322	2018-11-28 13:56:43.757322
96	65	\N	135.00	1	\N	158	t	f	2018-11-28 13:58:03.709218	2018-11-28 13:58:03.709218
97	66	\N	135.00	1	\N	158	t	f	2018-11-28 13:58:33.511523	2018-11-28 13:58:33.511523
98	67	\N	250.00	1	\N	158	t	f	2018-11-28 14:00:20.914808	2018-11-28 14:00:20.914808
99	68	2	20.00	1	\N	158	t	f	2018-11-28 14:01:16.171037	2018-11-28 14:01:16.171037
100	69	10	55.09	1	\N	158	t	f	2018-11-28 14:05:31.050974	2018-11-28 14:05:31.050974
101	70	2	200.50	1	\N	158	t	f	2018-11-28 14:07:21.054785	2018-11-28 14:07:21.054785
102	72	5	40.00	1	\N	158	t	f	2018-11-28 14:12:35.127397	2018-11-28 14:12:35.127397
103	73	10	2.00	1	\N	158	t	f	2018-11-28 14:13:43.44293	2018-11-28 14:13:43.44293
104	74	11	0.10	1	\N	158	t	f	2018-11-28 17:02:25.169878	2018-11-28 17:02:25.169878
105	75	2	200.50	1	\N	158	t	f	2018-11-28 17:34:55.984669	2018-11-28 17:34:55.984669
108	78	2	20.00	1	\N	158	t	f	2018-11-28 18:17:48.699008	2018-11-28 18:17:48.699008
109	79	\N	500.55	1	\N	145	t	f	2018-12-01 22:59:14.197096	2018-12-01 22:59:14.197096
110	80	\N	100.00	1	\N	145	t	f	2018-12-01 23:02:37.642382	2018-12-01 23:02:37.642382
111	81	\N	100.00	1	\N	145	t	f	2018-12-01 23:04:40.699701	2018-12-01 23:04:40.699701
112	82	\N	0.00	1	\N	145	t	f	2018-12-01 23:10:51.392312	2018-12-01 23:10:51.392312
113	83	2	200.50	1	\N	145	t	f	2018-12-01 23:13:26.142286	2018-12-01 23:13:26.142286
114	83	1	75.00	1	\N	145	t	f	2018-12-01 23:13:26.147581	2018-12-01 23:13:26.147581
115	83	1	75.00	1	\N	145	t	f	2018-12-01 23:13:26.15269	2018-12-01 23:13:26.15269
116	83	3	100.00	1	\N	145	t	f	2018-12-01 23:13:26.157465	2018-12-01 23:13:26.157465
117	84	\N	0.00	1	\N	145	t	f	2018-12-03 01:03:23.395574	2018-12-03 01:03:23.395574
118	85	11	0.40	4	\N	145	t	f	2018-12-03 01:53:16.558679	2018-12-03 01:53:16.558679
119	85	9	30.00	1	\N	145	t	f	2018-12-03 01:53:16.563909	2018-12-03 01:53:16.563909
120	85	7	150.00	1	\N	145	t	f	2018-12-03 01:53:16.568613	2018-12-03 01:53:16.568613
121	86	10	2.00	1	\N	158	t	f	2018-12-03 13:25:37.184858	2018-12-03 13:25:37.184858
122	94	2	200.50	1	\N	158	t	f	2018-12-03 13:30:15.039531	2018-12-03 13:30:15.039531
123	97	2	200.50	1	\N	158	t	f	2018-12-04 11:04:25.716908	2018-12-04 11:04:25.716908
124	98	\N	0.00	1	\N	158	t	f	2018-12-04 11:07:29.001405	2018-12-04 11:07:29.001405
125	99	\N	0.00	1	\N	158	t	f	2018-12-06 18:43:10.063877	2018-12-06 18:43:10.063877
126	100	2	10.00	1	\N	158	t	f	2018-12-06 18:43:54.570072	2018-12-06 18:43:54.570072
127	101	5	40.00	1	\N	158	t	f	2018-12-11 18:00:43.687089	2018-12-11 18:00:43.687089
128	102	\N	150.00	1	\N	158	t	f	2018-12-11 18:01:10.533315	2018-12-11 18:01:10.533315
129	103	\N	50.00	1	\N	158	t	f	2018-12-11 18:01:33.403711	2018-12-11 18:01:33.403711
130	104	10	55.09	1	\N	158	t	f	2018-12-11 18:02:17.387627	2018-12-11 18:02:17.387627
131	105	5	40.00	1	\N	158	t	f	2018-12-11 18:02:51.935513	2018-12-11 18:02:51.935513
132	106	\N	0.00	1	\N	158	t	f	2018-12-11 18:03:33.927348	2018-12-11 18:03:33.927348
133	107	\N	150.00	1	\N	158	t	f	2018-12-11 18:11:49.891473	2018-12-11 18:11:49.891473
134	108	\N	500.55	1	\N	158	t	f	2018-12-11 18:17:37.334774	2018-12-11 18:17:37.334774
135	109	\N	200.00	1	\N	158	t	f	2018-12-11 18:22:01.484332	2018-12-11 18:22:01.484332
136	110	\N	150.00	1	\N	158	t	f	2018-12-11 18:22:28.661087	2018-12-11 18:22:28.661087
137	111	\N	200.00	1	\N	158	t	f	2018-12-11 18:24:45.786475	2018-12-11 18:24:45.786475
138	112	\N	250.00	1	\N	158	t	f	2018-12-11 18:25:32.184074	2018-12-11 18:25:32.184074
139	113	\N	120.00	1	\N	158	t	f	2018-12-11 18:26:15.02844	2018-12-11 18:26:15.02844
140	114	\N	135.00	1	\N	158	t	f	2018-12-11 18:26:36.871446	2018-12-11 18:26:36.871446
141	115	\N	135.00	1	\N	158	t	f	2018-12-11 18:27:00.152353	2018-12-11 18:27:00.152353
142	116	\N	250.00	1	\N	158	t	f	2018-12-11 18:28:38.363284	2018-12-11 18:28:38.363284
143	117	\N	0.00	1	\N	158	t	f	2018-12-11 18:29:14.620337	2018-12-11 18:29:14.620337
144	118	2	10.00	1	\N	158	t	f	2018-12-13 10:31:17.453182	2018-12-13 10:31:17.453182
145	119	\N	0.00	1	\N	158	t	f	2018-12-13 11:15:34.405379	2018-12-13 11:15:34.405379
146	120	\N	0.00	1	\N	158	t	f	2018-12-13 11:16:09.881275	2018-12-13 11:16:09.881275
147	121	11	0.10	1	\N	158	t	f	2018-12-13 11:22:41.831298	2018-12-13 11:22:41.831298
148	122	11	0.10	1	\N	158	t	f	2018-12-13 11:23:31.694019	2018-12-13 11:23:31.694019
149	125	\N	50.00	1	\N	158	t	f	2018-12-13 11:55:14.045671	2018-12-13 11:55:14.045671
150	126	\N	70.00	1	\N	158	t	f	2018-12-13 11:55:46.027461	2018-12-13 11:55:46.027461
151	127	\N	100.00	1	\N	158	t	f	2018-12-13 11:58:33.087984	2018-12-13 11:58:33.087984
152	128	\N	150.00	1	\N	158	t	f	2018-12-13 11:58:54.024988	2018-12-13 11:58:54.024988
153	129	\N	250.00	1	\N	158	t	f	2018-12-13 12:05:47.600076	2018-12-13 12:05:47.600076
154	130	\N	500.55	1	\N	158	t	f	2018-12-13 12:06:10.987384	2018-12-13 12:06:10.987384
155	131	\N	350.00	1	\N	158	t	f	2018-12-13 12:09:38.379612	2018-12-13 12:09:38.379612
156	132	\N	350.00	1	\N	158	t	f	2018-12-13 12:10:34.985776	2018-12-13 12:10:34.985776
157	133	\N	200.00	1	\N	158	t	f	2018-12-13 12:11:57.501896	2018-12-13 12:11:57.501896
158	134	\N	150.00	1	\N	158	t	f	2018-12-13 12:14:03.19765	2018-12-13 12:14:03.19765
159	135	\N	120.00	1	\N	158	t	f	2018-12-13 12:15:47.494304	2018-12-13 12:15:47.494304
160	136	\N	250.00	1	\N	158	t	f	2018-12-13 12:16:50.311211	2018-12-13 12:16:50.311211
161	137	\N	350.00	1	\N	158	t	f	2018-12-13 12:34:15.148404	2018-12-13 12:34:15.148404
162	138	\N	350.00	1	\N	158	t	f	2018-12-13 12:34:48.939895	2018-12-13 12:34:48.939895
163	139	\N	0.10	1	\N	158	t	f	2018-12-13 12:37:23.012125	2018-12-13 12:37:23.012125
164	140	\N	0.00	1	\N	158	t	f	2018-12-13 14:23:07.121916	2018-12-13 14:23:07.121916
165	141	5	40.00	1	\N	158	t	f	2018-12-13 14:25:30.369854	2018-12-13 14:25:30.369854
166	142	\N	0.00	1	\N	158	t	f	2018-12-13 14:26:18.073031	2018-12-13 14:26:18.073031
167	143	\N	100.00	1	\N	158	t	f	2018-12-13 14:39:43.411883	2018-12-13 14:39:43.411883
168	144	\N	0.00	1	\N	145	t	f	2018-12-14 00:00:22.42674	2018-12-14 00:00:22.42674
169	145	\N	0.00	1	\N	145	t	f	2018-12-14 00:13:57.670274	2018-12-14 00:13:57.670274
170	146	\N	0.00	1	\N	145	t	f	2018-12-14 00:16:38.497587	2018-12-14 00:16:38.497587
171	147	10	4.00	2	\N	145	t	f	2018-12-14 00:27:20.545456	2018-12-14 00:27:20.545456
172	147	8	48.00	2	\N	145	t	f	2018-12-14 00:27:20.549893	2018-12-14 00:27:20.549893
173	147	6	24.50	2	\N	145	t	f	2018-12-14 00:27:20.553965	2018-12-14 00:27:20.553965
174	148	9	30.00	1	\N	145	t	f	2018-12-14 00:32:41.534989	2018-12-14 00:32:41.534989
175	148	10	2.00	1	\N	145	t	f	2018-12-14 00:32:41.540733	2018-12-14 00:32:41.540733
176	149	9	30.00	1	\N	145	t	f	2018-12-14 00:35:23.846946	2018-12-14 00:35:23.846946
177	150	1	75.00	1	\N	145	t	f	2018-12-14 09:30:53.042193	2018-12-14 09:30:53.042193
178	150	2	10.00	1	\N	145	t	f	2018-12-14 09:30:53.047665	2018-12-14 09:30:53.047665
179	151	10	55.09	1	\N	145	t	f	2018-12-14 09:32:56.89308	2018-12-14 09:32:56.89308
180	151	3	100.00	1	\N	145	t	f	2018-12-14 09:32:56.900708	2018-12-14 09:32:56.900708
181	152	\N	250.00	1	\N	145	t	f	2018-12-14 10:11:42.58869	2018-12-14 10:11:42.58869
182	153	\N	150.00	1	\N	145	t	f	2018-12-14 10:12:22.770446	2018-12-14 10:12:22.770446
183	154	\N	120.00	1	\N	145	t	f	2018-12-14 10:13:17.280536	2018-12-14 10:13:17.280536
184	155	\N	50.00	1	\N	145	t	f	2018-12-14 10:13:50.335363	2018-12-14 10:13:50.335363
185	156	\N	350.00	1	\N	145	t	f	2018-12-14 10:16:58.280307	2018-12-14 10:16:58.280307
186	157	10	55.09	1	\N	158	t	f	2018-12-14 12:14:36.678104	2018-12-14 12:14:36.678104
187	158	10	55.09	1	\N	158	t	f	2018-12-14 12:20:47.424256	2018-12-14 12:20:47.424256
188	159	3	100.00	1	\N	158	t	f	2018-12-14 16:44:59.548831	2018-12-14 16:44:59.548831
189	160	2	10.00	1	\N	158	t	f	2018-12-14 17:56:00.808235	2018-12-14 17:56:00.808235
190	161	10	55.09	1	\N	158	t	f	2018-12-14 17:56:43.689665	2018-12-14 17:56:43.689665
191	165	1	75.00	1	\N	158	t	f	2018-12-14 18:11:11.503844	2018-12-14 18:11:11.503844
192	199	\N	0.00	1	\N	145	t	f	2018-12-15 09:59:20.294931	2018-12-15 09:59:20.294931
193	200	5	40.00	1	\N	145	t	f	2018-12-15 10:05:56.206878	2018-12-15 10:05:56.206878
194	200	10	2.00	1	\N	145	t	f	2018-12-15 10:05:56.212279	2018-12-15 10:05:56.212279
195	201	5	40.00	1	\N	145	t	f	2018-12-15 10:06:49.568049	2018-12-15 10:06:49.568049
196	201	10	4.00	2	\N	145	t	f	2018-12-15 10:06:49.573114	2018-12-15 10:06:49.573114
197	215	3	100.00	1	\N	145	t	f	2018-12-15 10:39:47.146526	2018-12-15 10:39:47.146526
198	215	1	75.00	1	\N	145	t	f	2018-12-15 10:39:47.151607	2018-12-15 10:39:47.151607
199	215	2	10.00	1	\N	145	t	f	2018-12-15 10:39:47.156584	2018-12-15 10:39:47.156584
200	216	\N	250.00	1	\N	145	t	f	2018-12-15 10:53:03.021095	2018-12-15 10:53:03.021095
201	217	11	0.10	1	\N	158	t	f	2018-12-18 09:45:28.857374	2018-12-18 09:45:28.857374
202	218	\N	100.00	1	\N	145	t	f	2018-12-18 16:38:40.203714	2018-12-18 16:38:40.203714
203	219	5	40.00	1	\N	36	t	f	2018-12-19 11:33:41.068783	2018-12-19 11:33:41.068783
204	219	6	12.25	1	\N	36	t	f	2018-12-19 11:33:41.074088	2018-12-19 11:33:41.074088
205	220	\N	0.00	1	\N	36	t	f	2018-12-19 12:31:56.062381	2018-12-19 12:31:56.062381
206	221	\N	0.00	1	\N	36	t	f	2018-12-19 12:34:14.205839	2018-12-19 12:34:14.205839
207	223	\N	120.00	1	\N	36	t	f	2018-12-19 12:46:51.463976	2018-12-19 12:46:51.463976
208	224	\N	120.00	1	\N	36	t	f	2018-12-19 12:46:51.479222	2018-12-19 12:46:51.479222
209	226	\N	120.00	1	\N	36	t	f	2018-12-19 16:19:44.074678	2018-12-19 16:19:44.074678
210	227	\N	120.00	1	\N	36	t	f	2018-12-19 16:19:44.090179	2018-12-19 16:19:44.090179
211	228	\N	120.00	1	\N	36	t	f	2018-12-19 16:19:44.104876	2018-12-19 16:19:44.104876
212	229	\N	74.00	1	\N	36	t	f	2018-12-19 17:53:55.305625	2018-12-19 17:53:55.305625
213	230	\N	74.00	1	\N	36	t	f	2018-12-19 17:53:55.319593	2018-12-19 17:53:55.319593
214	231	\N	74.00	1	\N	36	t	f	2018-12-19 17:53:55.332974	2018-12-19 17:53:55.332974
215	232	\N	74.00	1	\N	36	t	f	2018-12-19 17:56:30.963084	2018-12-19 17:56:30.963084
216	233	\N	74.00	1	\N	36	t	f	2018-12-19 17:57:52.003483	2018-12-19 17:57:52.003483
217	234	\N	74.00	1	\N	36	t	f	2018-12-19 17:59:04.050182	2018-12-19 17:59:04.050182
218	235	\N	74.00	1	\N	36	t	f	2018-12-19 17:59:04.582585	2018-12-19 17:59:04.582585
219	236	\N	74.00	1	\N	36	t	f	2018-12-19 18:05:03.085365	2018-12-19 18:05:03.085365
220	237	\N	74.00	1	\N	36	t	f	2018-12-19 18:06:19.199179	2018-12-19 18:06:19.199179
221	238	\N	74.00	1	\N	36	t	f	2018-12-19 18:06:19.26079	2018-12-19 18:06:19.26079
222	239	\N	74.00	1	\N	36	t	f	2018-12-19 18:06:19.286934	2018-12-19 18:06:19.286934
223	240	\N	74.00	1	\N	36	t	f	2018-12-20 07:33:00.951474	2018-12-20 07:33:00.951474
224	241	\N	74.00	1	\N	36	t	f	2018-12-20 07:33:00.995651	2018-12-20 07:33:00.995651
225	242	\N	74.00	1	\N	36	t	f	2018-12-20 09:06:08.952196	2018-12-20 09:06:08.952196
226	243	\N	74.00	1	\N	36	t	f	2018-12-20 09:11:47.431529	2018-12-20 09:11:47.431529
227	244	\N	74.00	1	\N	36	t	f	2018-12-20 09:13:45.488501	2018-12-20 09:13:45.488501
228	245	\N	74.00	1	\N	36	t	f	2018-12-20 09:29:08.474194	2018-12-20 09:29:08.474194
229	246	\N	74.00	1	\N	36	t	f	2018-12-20 09:30:50.225189	2018-12-20 09:30:50.225189
230	247	\N	74.00	1	\N	36	t	f	2018-12-20 09:33:45.082948	2018-12-20 09:33:45.082948
231	248	\N	74.00	1	\N	36	t	f	2018-12-20 09:41:02.505363	2018-12-20 09:41:02.505363
232	249	\N	74.00	1	\N	36	t	f	2018-12-20 09:58:10.896524	2018-12-20 09:58:10.896524
233	250	\N	74.00	1	\N	36	t	f	2018-12-20 10:10:31.392694	2018-12-20 10:10:31.392694
234	251	\N	74.00	1	\N	36	t	f	2018-12-20 10:15:56.383815	2018-12-20 10:15:56.383815
235	252	\N	74.00	1	\N	36	t	f	2018-12-20 10:17:12.45593	2018-12-20 10:17:12.45593
236	253	\N	74.00	1	\N	36	t	f	2018-12-20 10:20:09.324318	2018-12-20 10:20:09.324318
237	254	\N	74.00	1	\N	36	t	f	2018-12-20 10:20:11.268664	2018-12-20 10:20:11.268664
238	255	\N	74.00	1	\N	36	t	f	2018-12-20 10:20:13.22607	2018-12-20 10:20:13.22607
239	256	\N	74.00	1	\N	36	t	f	2018-12-20 10:22:10.643459	2018-12-20 10:22:10.643459
240	257	\N	74.00	1	\N	36	t	f	2018-12-20 10:22:12.597484	2018-12-20 10:22:12.597484
241	258	\N	74.00	1	\N	36	t	f	2018-12-20 10:22:14.564229	2018-12-20 10:22:14.564229
242	259	\N	74.00	1	\N	36	t	f	2018-12-20 10:25:14.725846	2018-12-20 10:25:14.725846
243	260	\N	74.00	1	\N	36	t	f	2018-12-20 10:25:59.586559	2018-12-20 10:25:59.586559
244	261	10	2.00	1	\N	36	t	f	2018-12-20 10:27:51.894237	2018-12-20 10:27:51.894237
245	261	6	12.25	1	\N	36	t	f	2018-12-20 10:27:51.899083	2018-12-20 10:27:51.899083
246	262	\N	74.00	1	\N	36	t	f	2018-12-20 10:30:22.326588	2018-12-20 10:30:22.326588
247	263	\N	74.00	1	\N	36	t	f	2018-12-20 10:44:55.359996	2018-12-20 10:44:55.359996
248	264	\N	74.00	1	\N	36	t	f	2018-12-20 11:01:22.558181	2018-12-20 11:01:22.558181
249	265	\N	74.00	1	\N	36	t	f	2018-12-20 11:01:25.152501	2018-12-20 11:01:25.152501
250	266	\N	74.00	1	\N	36	t	f	2018-12-20 11:04:28.182628	2018-12-20 11:04:28.182628
251	267	\N	74.00	1	\N	36	t	f	2018-12-20 11:05:29.852679	2018-12-20 11:05:29.852679
252	268	\N	74.00	1	\N	36	t	f	2018-12-20 11:05:53.288629	2018-12-20 11:05:53.288629
253	269	\N	74.00	1	\N	36	t	f	2018-12-20 11:06:39.091606	2018-12-20 11:06:39.091606
254	270	\N	120.00	1	\N	36	t	f	2018-12-20 11:19:11.049031	2018-12-20 11:19:11.049031
255	271	\N	74.00	1	\N	36	t	f	2018-12-20 11:30:10.847139	2018-12-20 11:30:10.847139
256	272	\N	74.00	1	\N	36	t	f	2018-12-20 11:32:25.564283	2018-12-20 11:32:25.564283
257	273	\N	74.00	1	\N	36	t	f	2018-12-20 11:33:37.125616	2018-12-20 11:33:37.125616
258	274	\N	74.00	1	\N	36	t	f	2018-12-20 11:38:31.9407	2018-12-20 11:38:31.9407
259	275	\N	74.00	1	\N	36	t	f	2018-12-20 11:40:05.665927	2018-12-20 11:40:05.665927
260	276	\N	120.00	1	\N	36	t	f	2018-12-20 11:56:19.115845	2018-12-20 11:56:19.115845
261	277	\N	120.00	1	\N	36	t	f	2018-12-20 11:57:56.849251	2018-12-20 11:57:56.849251
262	278	\N	58.00	1	\N	36	t	f	2018-12-20 11:58:55.710877	2018-12-20 11:58:55.710877
263	279	\N	58.00	1	\N	36	t	f	2018-12-20 11:58:55.724631	2018-12-20 11:58:55.724631
264	280	\N	58.00	1	\N	36	t	f	2018-12-20 12:01:46.936447	2018-12-20 12:01:46.936447
265	281	\N	58.00	1	\N	36	t	f	2018-12-20 12:01:46.949817	2018-12-20 12:01:46.949817
266	282	5	40.00	1	\N	36	t	f	2018-12-20 12:33:09.936874	2018-12-20 12:33:09.936874
267	282	8	24.00	1	\N	36	t	f	2018-12-20 12:33:09.941564	2018-12-20 12:33:09.941564
268	282	11	0.10	1	\N	36	t	f	2018-12-20 12:33:09.945808	2018-12-20 12:33:09.945808
269	283	5	40.00	1	\N	36	t	f	2018-12-20 12:52:54.067583	2018-12-20 12:52:54.067583
270	283	6	24.50	2	\N	36	t	f	2018-12-20 12:52:54.076739	2018-12-20 12:52:54.076739
271	283	8	24.00	1	\N	36	t	f	2018-12-20 12:52:54.083485	2018-12-20 12:52:54.083485
272	283	10	2.00	1	\N	36	t	f	2018-12-20 12:52:54.088339	2018-12-20 12:52:54.088339
273	284	5	80.00	2	\N	36	t	f	2018-12-20 12:55:22.006521	2018-12-20 12:55:22.006521
274	284	6	49.00	4	\N	36	t	f	2018-12-20 12:55:22.010755	2018-12-20 12:55:22.010755
275	284	11	0.10	1	\N	36	t	f	2018-12-20 12:55:22.014795	2018-12-20 12:55:22.014795
276	285	9	30.00	1	\N	36	t	f	2018-12-20 15:15:04.638794	2018-12-20 15:15:04.638794
277	286	\N	74.00	1	\N	36	t	f	2018-12-20 15:18:02.033962	2018-12-20 15:18:02.033962
278	287	\N	74.00	1	\N	36	t	f	2018-12-20 15:18:02.056571	2018-12-20 15:18:02.056571
279	288	\N	74.00	1	\N	36	t	f	2018-12-20 15:24:25.903862	2018-12-20 15:24:25.903862
280	289	\N	74.00	1	\N	36	t	f	2018-12-20 15:29:48.787354	2018-12-20 15:29:48.787354
281	290	\N	74.00	1	\N	36	t	f	2018-12-20 15:29:48.803641	2018-12-20 15:29:48.803641
282	291	6	24.50	2	\N	36	t	f	2018-12-20 15:33:35.987186	2018-12-20 15:33:35.987186
283	291	7	600.00	4	\N	36	t	f	2018-12-20 15:33:35.991812	2018-12-20 15:33:35.991812
284	292	\N	74.00	1	\N	158	t	f	2018-12-20 17:29:19.588034	2018-12-20 17:29:19.588034
285	293	\N	74.00	1	\N	158	t	f	2018-12-20 17:30:24.689059	2018-12-20 17:30:24.689059
286	294	\N	74.00	1	\N	36	t	f	2018-12-20 17:33:24.902344	2018-12-20 17:33:24.902344
287	295	\N	74.00	1	\N	36	t	f	2018-12-20 17:35:03.523783	2018-12-20 17:35:03.523783
288	296	7	100.00	1	\N	36	t	f	2018-12-20 17:43:02.214393	2018-12-20 17:43:02.214393
289	297	7	100.00	1	\N	36	t	f	2018-12-20 17:45:36.499468	2018-12-20 17:45:36.499468
290	298	2	125.00	1	\N	36	t	f	2018-12-21 12:47:57.732851	2018-12-21 12:47:57.732851
291	298	7	100.00	1	\N	36	t	f	2018-12-21 12:47:57.737855	2018-12-21 12:47:57.737855
292	299	\N	74.00	1	\N	158	t	f	2018-12-21 17:56:17.753175	2018-12-21 17:56:17.753175
293	300	7	100.00	1	\N	158	t	f	2019-01-02 12:08:20.540206	2019-01-02 12:08:20.540206
294	301	7	100.00	1	\N	36	t	f	2019-01-02 12:19:15.16788	2019-01-02 12:19:15.16788
295	301	2	125.00	1	\N	36	t	f	2019-01-02 12:19:15.181298	2019-01-02 12:19:15.181298
296	302	11	0.20	2	\N	158	t	f	2019-01-02 14:26:10.736973	2019-01-02 14:26:10.736973
297	303	11	0.20	2	\N	158	t	f	2019-01-02 14:29:02.681983	2019-01-02 14:29:02.681983
298	303	10	2.00	1	\N	158	t	f	2019-01-02 14:29:02.686168	2019-01-02 14:29:02.686168
299	304	11	0.30	3	\N	158	t	f	2019-01-02 14:54:03.400924	2019-01-02 14:54:03.400924
300	305	14	0.10	1	\N	158	t	f	2019-01-02 15:27:34.03521	2019-01-02 15:27:34.03521
301	306	11	0.30	3	\N	158	t	f	2019-01-02 18:13:26.739793	2019-01-02 18:13:26.739793
302	307	11	0.30	3	\N	158	t	f	2019-01-02 18:13:35.00394	2019-01-02 18:13:35.00394
303	308	\N	0.00	1	\N	158	t	f	2019-01-02 18:17:24.76951	2019-01-02 18:17:24.76951
304	309	11	0.30	3	\N	158	t	f	2019-01-02 18:19:16.073329	2019-01-02 18:19:16.073329
305	310	11	0.30	3	\N	158	t	f	2019-01-03 11:02:07.550758	2019-01-03 11:02:07.550758
306	311	11	0.10	1	\N	158	t	f	2019-01-03 11:04:16.683979	2019-01-03 11:04:16.683979
307	312	7	0.10	1	\N	158	t	f	2019-01-03 11:07:57.233887	2019-01-03 11:07:57.233887
308	313	14	0.10	1	\N	158	t	f	2019-01-03 11:14:00.776452	2019-01-03 11:14:00.776452
309	314	\N	0.00	1	\N	145	t	f	2019-01-11 12:09:04.628881	2019-01-11 12:09:04.628881
310	315	9	30.00	1	\N	145	t	f	2019-01-11 12:11:06.018073	2019-01-11 12:11:06.018073
311	315	10	2.00	1	\N	145	t	f	2019-01-11 12:11:06.023044	2019-01-11 12:11:06.023044
312	316	9	30.00	1	\N	145	t	f	2019-01-11 12:11:10.812755	2019-01-11 12:11:10.812755
313	316	10	2.00	1	\N	145	t	f	2019-01-11 12:11:10.817556	2019-01-11 12:11:10.817556
314	317	10	2.00	1	\N	145	t	f	2019-01-11 12:15:02.108643	2019-01-11 12:15:02.108643
315	317	10	2.00	1	\N	145	t	f	2019-01-11 12:15:02.113106	2019-01-11 12:15:02.113106
316	318	10	2.00	1	\N	145	t	f	2019-01-11 12:15:07.708976	2019-01-11 12:15:07.708976
317	318	10	2.00	1	\N	145	t	f	2019-01-11 12:15:07.714236	2019-01-11 12:15:07.714236
318	319	\N	0.00	1	\N	145	t	f	2019-01-11 12:36:04.326129	2019-01-11 12:36:04.326129
319	320	\N	0.00	1	\N	145	t	f	2019-01-11 13:50:40.846412	2019-01-11 13:50:40.846412
320	321	\N	0.10	1	\N	36	t	f	2019-01-14 21:45:34.131877	2019-01-14 21:45:34.131877
321	322	\N	0.10	1	\N	36	t	f	2019-01-14 21:45:34.148845	2019-01-14 21:45:34.148845
322	323	\N	100.00	1	\N	36	t	f	2019-01-23 11:45:21.63946	2019-01-23 11:45:21.63946
323	324	\N	100.00	1	\N	36	t	f	2019-01-23 11:45:21.702299	2019-01-23 11:45:21.702299
324	325	\N	74.00	1	\N	36	t	f	2019-01-23 11:48:46.361134	2019-01-23 11:48:46.361134
325	326	\N	74.00	1	\N	36	t	f	2019-01-23 11:48:46.374969	2019-01-23 11:48:46.374969
326	327	\N	0.10	1	\N	36	t	f	2019-01-23 11:50:17.452098	2019-01-23 11:50:17.452098
327	328	\N	0.10	1	\N	36	t	f	2019-01-23 11:50:17.466344	2019-01-23 11:50:17.466344
328	329	\N	74.00	1	\N	36	t	f	2019-01-23 17:50:45.575422	2019-01-23 17:50:45.575422
329	330	\N	74.00	1	\N	36	t	f	2019-01-23 17:50:45.59823	2019-01-23 17:50:45.59823
330	331	\N	74.00	1	\N	36	t	f	2019-01-23 17:50:45.619038	2019-01-23 17:50:45.619038
331	332	\N	100.00	1	\N	36	t	f	2019-01-24 10:55:32.27873	2019-01-24 10:55:32.27873
332	333	\N	74.00	1	\N	36	t	f	2019-01-24 11:08:05.573073	2019-01-24 11:08:05.573073
333	334	\N	74.00	1	\N	36	t	f	2019-01-24 11:28:57.355581	2019-01-24 11:28:57.355581
334	335	\N	74.00	1	\N	36	t	f	2019-01-24 11:29:25.019985	2019-01-24 11:29:25.019985
335	336	\N	0.10	1	\N	36	t	f	2019-01-24 11:40:07.130627	2019-01-24 11:40:07.130627
336	337	\N	0.10	1	\N	36	t	f	2019-01-24 11:41:27.535341	2019-01-24 11:41:27.535341
337	338	\N	0.10	1	\N	158	t	f	2019-01-25 16:38:52.809811	2019-01-25 16:38:52.809811
338	339	\N	0.10	1	\N	158	t	f	2019-01-25 16:39:27.690735	2019-01-25 16:39:27.690735
339	340	\N	0.10	1	\N	158	t	f	2019-01-25 17:07:10.448051	2019-01-25 17:07:10.448051
340	341	\N	0.10	1	\N	158	t	f	2019-01-25 17:07:42.796754	2019-01-25 17:07:42.796754
341	342	\N	0.10	1	\N	158	t	f	2019-01-25 18:46:57.626831	2019-01-25 18:46:57.626831
342	343	\N	0.10	1	\N	158	t	f	2019-01-25 18:47:35.157089	2019-01-25 18:47:35.157089
343	344	\N	0.10	1	\N	158	t	f	2019-01-25 18:47:41.748807	2019-01-25 18:47:41.748807
344	345	\N	0.10	1	\N	158	t	f	2019-01-25 19:19:31.170256	2019-01-25 19:19:31.170256
345	346	\N	0.10	1	\N	158	t	f	2019-01-25 19:19:59.16078	2019-01-25 19:19:59.16078
346	347	\N	0.10	1	\N	145	t	f	2019-01-26 10:26:31.90186	2019-01-26 10:26:31.90186
347	348	\N	0.10	1	\N	145	t	f	2019-01-26 10:56:11.064367	2019-01-26 10:56:11.064367
348	349	\N	0.10	1	\N	158	t	f	2019-01-28 13:45:57.629567	2019-01-28 13:45:57.629567
349	350	\N	58.00	1	\N	158	t	f	2019-01-28 13:46:09.304539	2019-01-28 13:46:09.304539
350	351	\N	0.10	1	\N	158	t	f	2019-01-28 13:47:11.243479	2019-01-28 13:47:11.243479
351	352	\N	0.10	1	\N	158	t	f	2019-01-28 13:49:19.480756	2019-01-28 13:49:19.480756
352	353	\N	0.10	1	\N	158	t	f	2019-01-28 14:00:06.056469	2019-01-28 14:00:06.056469
353	354	\N	0.10	1	\N	158	t	f	2019-01-28 14:02:39.610142	2019-01-28 14:02:39.610142
354	355	\N	0.10	1	\N	158	t	f	2019-01-28 14:03:50.47185	2019-01-28 14:03:50.47185
355	356	\N	0.10	1	\N	158	t	f	2019-01-28 14:30:59.203278	2019-01-28 14:30:59.203278
356	357	\N	0.10	1	\N	158	t	f	2019-02-05 11:01:32.964808	2019-02-05 11:01:32.964808
357	358	\N	0.00	1	\N	158	t	f	2019-02-05 11:09:34.823492	2019-02-05 11:09:34.823492
358	359	\N	0.10	1	\N	158	t	f	2019-02-05 11:28:51.454951	2019-02-05 11:28:51.454951
359	362	\N	0.10	1	\N	158	t	f	2019-02-05 11:59:22.36539	2019-02-05 11:59:22.36539
360	363	\N	0.10	1	\N	158	t	f	2019-02-05 12:00:04.071296	2019-02-05 12:00:04.071296
361	370	2	0.10	1	\N	158	t	f	2019-02-05 12:00:54.736391	2019-02-05 12:00:54.736391
362	371	\N	0.10	1	\N	158	t	f	2019-02-05 12:01:59.3776	2019-02-05 12:01:59.3776
363	372	\N	58.00	1	\N	158	t	f	2019-02-05 12:04:39.395551	2019-02-05 12:04:39.395551
364	373	\N	58.00	1	\N	158	t	f	2019-02-05 12:05:48.381415	2019-02-05 12:05:48.381415
365	374	\N	120.00	1	\N	158	t	f	2019-02-05 12:06:21.940504	2019-02-05 12:06:21.940504
366	375	\N	0.10	1	\N	158	t	f	2019-02-05 12:27:18.558336	2019-02-05 12:27:18.558336
367	376	\N	70.00	1	\N	158	t	f	2019-02-05 12:27:53.720066	2019-02-05 12:27:53.720066
368	377	\N	0.10	1	\N	158	t	f	2019-02-05 12:29:32.106505	2019-02-05 12:29:32.106505
369	378	5	40.00	1	\N	158	t	f	2019-02-05 17:32:01.650811	2019-02-05 17:32:01.650811
370	379	5	40.00	1	\N	158	t	f	2019-02-05 17:42:47.55406	2019-02-05 17:42:47.55406
371	379	6	12.25	1	\N	158	t	f	2019-02-05 17:42:47.558937	2019-02-05 17:42:47.558937
372	380	5	40.00	1	\N	158	t	f	2019-02-05 17:42:55.308343	2019-02-05 17:42:55.308343
373	380	6	12.25	1	\N	158	t	f	2019-02-05 17:42:55.312277	2019-02-05 17:42:55.312277
374	381	14	0.10	1	\N	158	t	f	2019-02-05 17:45:00.553104	2019-02-05 17:45:00.553104
\.


--
-- Name: billing_info_bill_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.billing_info_bill_items_id_seq', 374, true);


--
-- Data for Name: callback_statuses; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.callback_statuses (id, trans_status, trans_id, exttrid, trans_msg, created_at, updated_at) FROM stdin;
1	001/529		152646737292	TARGET_AUTHORIZATION_ERROR	2018-11-28 10:56:30.117741	2018-11-28 10:56:30.117741
2	001/100		120886796487	Transaction couldn't be completed	2018-11-28 16:56:50.13269	2018-11-28 16:56:50.13269
3	001/100		074682182533	Transaction couldn't be completed	2018-11-28 17:09:15.689563	2018-11-28 17:09:15.689563
4	000/01	4807439953	314496783171	Successfully processed transaction.	2018-11-28 17:14:37.789869	2018-11-28 17:14:37.789869
5	001/529		197972674695	TARGET_AUTHORIZATION_ERROR	2018-11-30 16:05:24.67733	2018-11-30 16:05:24.67733
6	001/529		192715370677	TARGET_AUTHORIZATION_ERROR	2018-11-30 16:15:24.16217	2018-11-30 16:15:24.16217
7	001/529		092625793430	TARGET_AUTHORIZATION_ERROR	2018-11-30 16:30:14.219706	2018-11-30 16:30:14.219706
8	001/100		078766095098	Transaction couldn't be completed	2018-11-30 17:07:49.394047	2018-11-30 17:07:49.394047
9	001/2058	0000000000000000	294399576388	Voucher invalid.	2018-12-03 01:20:33.294254	2018-12-03 01:20:33.294254
10	001/100		239329749547	Transaction couldn't be completed	2018-12-03 13:41:07.011425	2018-12-03 13:41:07.011425
11	001/100		341053199749	Transaction couldn't be completed	2018-12-05 17:30:12.815094	2018-12-05 17:30:12.815094
12	001/100		503749593329	Transaction couldn't be completed	2018-12-05 17:30:27.940435	2018-12-05 17:30:27.940435
13	001/100		263239251123	Transaction couldn't be completed	2018-12-05 17:33:03.953089	2018-12-05 17:33:03.953089
14	001/529		488232157293	TARGET_AUTHORIZATION_ERROR	2018-12-06 17:55:59.862148	2018-12-06 17:55:59.862148
15	001/21VD		094804391084	Bill not paid...	2018-12-06 19:34:43.930975	2018-12-06 19:34:43.930975
16	001/529		424304973342	TARGET_AUTHORIZATION_ERROR	2018-12-11 14:57:53.948995	2018-12-11 14:57:53.948995
17	001/100		074551916534	Transaction couldn't be completed	2018-12-11 18:40:52.260315	2018-12-11 18:40:52.260315
18	000/01	4923401087	479432858447	Successfully processed transaction.	2018-12-13 12:24:38.04723	2018-12-13 12:24:38.04723
19	001/60019	MP181213.1433.D01683	303197616449	Dear Customer, you have insufficient funds. 5 successive invalid transfers will lock your wallet. Call 100 to locate an agent.	2018-12-13 14:33:49.314812	2018-12-13 14:33:49.314812
20	001/2058	0000000000000000	344251237312	Voucher invalid.	2018-12-14 12:22:37.948234	2018-12-14 12:22:37.948234
21	001/100		344779451233	Transaction couldn't be completed	2018-12-14 18:14:18.880832	2018-12-14 18:14:18.880832
22	001/ERROR	\N	173903833455	ERROR	2018-12-14 18:37:07.353496	2018-12-14 18:37:07.353496
23	001/ERROR	\N	074474535141	ERROR	2018-12-14 18:40:07.420679	2018-12-14 18:40:07.420679
24	001/ERROR	\N	212316405934	ERROR	2018-12-14 18:42:06.565641	2018-12-14 18:42:06.565641
25	001/515		300884669594	ACCOUNTHOLDER_WITH_FRI_NOT_FOUND	2018-12-15 06:55:44.470189	2018-12-15 06:55:44.470189
26	001/ERROR	\N	297029108901	ERROR	2018-12-15 07:30:07.918303	2018-12-15 07:30:07.918303
27	001/515		390565203494	ACCOUNTHOLDER_WITH_FRI_NOT_FOUND	2018-12-15 10:09:52.403949	2018-12-15 10:09:52.403949
28	001/529		415003866353	TARGET_AUTHORIZATION_ERROR	2018-12-15 10:45:59.941432	2018-12-15 10:45:59.941432
29	001/515		466224341119	ACCOUNTHOLDER_WITH_FRI_NOT_FOUND	2018-12-15 11:07:01.262681	2018-12-15 11:07:01.262681
30	001/2002	0000000274816226	387887442492	Receiver invalid.	2018-12-18 09:47:44.169091	2018-12-18 09:47:44.169091
31	000/0	0000000274820772	027183278070	The service request is processed successfully.	2018-12-18 10:02:06.257837	2018-12-18 10:02:06.257837
32	001/515		536811595604	ACCOUNTHOLDER_WITH_FRI_NOT_FOUND	2018-12-18 10:18:07.799457	2018-12-18 10:18:07.799457
33	001/515		506594000574	ACCOUNTHOLDER_WITH_FRI_NOT_FOUND	2018-12-22 10:32:06.330131	2018-12-22 10:32:06.330131
34	001/515		092417280740	ACCOUNTHOLDER_WITH_FRI_NOT_FOUND	2018-12-22 10:43:22.702782	2018-12-22 10:43:22.702782
35	001/122		251978628704	No record found	2018-12-23 20:37:05.408617	2018-12-23 20:37:05.408617
36	001/122		251671390879	No record found	2018-12-23 20:37:05.442657	2018-12-23 20:37:05.442657
37	001/529		481149967267	TARGET_AUTHORIZATION_ERROR	2019-01-02 13:12:59.132852	2019-01-02 13:12:59.132852
38	001/100		336166003241	Transaction couldn't be completed	2019-01-02 13:16:33.046445	2019-01-02 13:16:33.046445
39	000/200	MP190102.1457.C00632	544094707994	Success	2019-01-02 14:57:06.984952	2019-01-02 14:57:06.984952
40	000/0	0000000280106825	272203369851	The service request is processed successfully.	2019-01-02 15:29:32.445295	2019-01-02 15:29:32.445295
41	000/01	5051223771	560314362369	Successfully processed transaction.	2019-01-02 16:53:43.276199	2019-01-02 16:53:43.276199
42	001/100		116858163806	Transaction couldn't be completed	2019-01-02 17:02:56.840115	2019-01-02 17:02:56.840115
43	000/200	MP190102.1823.C02034	361299578385	Success	2019-01-02 18:22:54.612182	2019-01-02 18:22:54.612182
44	000/200	MP190103.1106.D06857	067696331377	Success	2019-01-03 11:06:33.82517	2019-01-03 11:06:33.82517
45	000/200	MP190124.1158.C01355	183775955632	Success	2019-01-24 11:57:58.80321	2019-01-24 11:57:58.80321
46	000/200	MP190124.1209.C01479	300848369083	Success	2019-01-24 12:08:43.732008	2019-01-24 12:08:43.732008
47	000/01	5173433749	570459156900	Successfully processed transaction.	2019-01-25 17:20:21.537828	2019-01-25 17:20:21.537828
48	000/01	5173480153	195403842955	Successfully processed transaction.	2019-01-25 17:26:23.665221	2019-01-25 17:26:23.665221
49	000/01	5174088626	264035977192	Successfully processed transaction.	2019-01-25 18:53:54.159483	2019-01-25 18:53:54.159483
50	000/01	5174347811	268657309351	Successfully processed transaction.	2019-01-25 19:30:49.079929	2019-01-25 19:30:49.079929
\.


--
-- Name: callback_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.callback_statuses_id_seq', 50, true);


--
-- Data for Name: city_town_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.city_town_masters (id, city_town_name, comment, region_id, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	Accra		2	\N	83	t	f	2018-03-05 11:21:02.925539	2018-03-05 11:21:02.925539
2	Cape Town		4	\N	149	t	f	2018-04-19 10:48:13.000302	2018-04-19 10:48:13.000302
3	Takoradi		5	\N	135	t	f	2018-04-20 12:20:32.448541	2018-04-20 12:20:32.448541
4	Sekondi		5	\N	158	t	f	2018-08-07 14:41:40.426346	2018-08-07 14:41:40.426346
5	Ho		1	\N	36	t	f	2018-08-16 09:40:16.825498	2018-08-16 09:40:16.825498
\.


--
-- Name: city_town_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.city_town_masters_id_seq', 5, true);


--
-- Data for Name: condition_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.condition_masters (id, condition_name, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
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

SELECT pg_catalog.setval('public.condition_masters_id_seq', 13, true);


--
-- Data for Name: confirmed_appointments; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.confirmed_appointments (id, pre_appointment_id, provider_id, complaint_desc, confirmed_date, confirmed_time, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, suburb_id, doctor_id, patient_id, attended_to, nurse_id, paid) FROM stdin;
6	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:27:00.662677	2018-04-13 16:27:00.662677	2	\N	136	\N	\N	\N
7	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:27:15.279525	2018-04-13 16:27:15.279525	2	\N	136	\N	\N	\N
8	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:27:23.84165	2018-04-13 16:27:23.84165	2	\N	136	\N	\N	\N
9	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:27:39.683034	2018-04-13 16:27:39.683034	2	\N	136	\N	\N	\N
10	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:31:08.401777	2018-04-13 16:31:08.401777	2	\N	136	\N	\N	\N
11	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:31:58.637838	2018-04-13 16:31:58.637838	2	\N	136	\N	\N	\N
12	7	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:32:14.543337	2018-04-13 16:32:14.543337	1	\N	137	\N	\N	\N
13	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:35:10.917303	2018-04-13 16:35:10.917303	2	\N	136	\N	\N	\N
14	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:59:01.055241	2018-04-13 16:59:01.055241	2	140	136	\N	\N	\N
15	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 17:06:55.552207	2018-04-13 17:06:55.552207	2	140	136	\N	\N	\N
16	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 17:08:39.989991	2018-04-13 17:08:39.989991	2	140	136	\N	\N	\N
17	12	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 17:09:25.657531	2018-04-13 17:09:25.657531	2	140	136	\N	\N	\N
20	18	\N	<p style="box-sizing: inherit; font-family: verdana, arial, helvetica, sans-serif; font-size: 13px; line-height: 18px; margin: 0px 0px 10px; background-color: #f1f1f1;">have fever and headache</p>\r\n<p style="box-sizing: inherit; font-family: verdana, arial, helvetica, sans-serif; font-size: 13px; line-height: 18px; margin: 0px 0px 10px; background-color: #f1f1f1;">Also feeling cold</p>	2018-04-17 10:55:00	\N		36	\N	t	f	2018-04-16 10:56:29.338994	2018-04-16 10:56:29.338994	2	140	139	f	\N	\N
23	21	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-16 12:12:55.283371	2018-04-16 12:12:55.283371	1	140	139	\N	\N	\N
24	22	\N		2018-04-17 12:15:00	\N		36	\N	t	f	2018-04-16 12:15:10.434808	2018-08-15 20:59:29.335698	\N	140	139	f	\N	\N
25	25	\N		2018-04-17 12:32:00	\N		36	\N	t	f	2018-04-16 12:32:14.775482	2018-04-16 12:32:14.781411	\N	140	139	f	\N	\N
18	16	\N		2018-04-17 10:54:00	\N		36	\N	t	f	2018-04-16 10:54:44.310448	2018-04-16 12:33:50.008946	\N	140	139	t	\N	\N
26	13	\N		2018-04-17 12:46:00	\N		36	\N	t	f	2018-04-16 12:46:12.752019	2018-04-16 12:46:12.752019	\N	140	136	f	\N	\N
28	41	8		2018-04-19 16:31:00	\N		135	\N	t	f	2018-04-18 16:32:04.065888	2018-04-18 16:32:04.065888	1	36	144	f	\N	\N
29	40	2		2018-04-30 16:32:00	\N		135	\N	t	f	2018-04-18 16:33:16.263039	2018-04-18 16:33:16.263039	1	135	144	f	\N	\N
30	39	8		2018-04-19 11:30:00	\N		135	\N	t	f	2018-04-18 16:34:42.780332	2018-04-18 16:34:42.780332	1	141	144	f	\N	\N
34	45	8	<p>ghn</p>	2018-04-25 06:46:00	\N		145	\N	t	f	2018-04-18 22:48:02.275589	2018-04-18 22:48:02.275589	1	145	146	f	\N	\N
35	47	8	<p>delicer at office&nbsp;</p>	2018-04-26 13:41:00	\N		145	\N	t	f	2018-04-19 13:41:57.311728	2018-04-19 13:41:57.311728	1	135	146	f	\N	\N
38	51	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 14:02:01.505264	2018-04-19 14:02:01.505264	1	140	146	\N	\N	\N
41	56	8		2018-04-19 22:24:00	\N		145	\N	t	f	2018-04-19 19:25:00.797386	2018-04-19 19:25:00.804381	1	140	146	f	\N	\N
42	57	8		2018-04-30 08:28:00	\N		145	\N	t	f	2018-04-19 19:29:03.503311	2018-04-19 19:29:03.509153	2	140	146	f	\N	\N
43	58	3		2018-04-24 22:35:00	\N		145	\N	t	f	2018-04-19 19:46:15.541947	2018-04-19 19:46:15.547946	1	140	146	f	\N	\N
44	59	4		2018-05-01 22:48:00	\N		145	\N	t	f	2018-04-19 19:48:55.846387	2018-04-19 19:48:55.852673	2	140	146	f	\N	\N
45	69	2		2018-04-28 12:06:00	\N		149	\N	t	f	2018-04-20 11:10:12.715118	2018-04-20 11:10:12.715118	\N	145	156	f	\N	\N
48	67	2		2018-04-20 11:43:00	\N		135	\N	t	f	2018-04-20 11:46:06.797852	2018-04-20 11:46:06.797852	2	140	156	f	\N	\N
50	72	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-21 05:18:56.264678	2018-04-21 05:18:56.264678	2	140	159	\N	\N	\N
51	75	8	<p>ghana</p>	2018-04-21 09:25:00	\N	<p>gahana&nbsp;</p>	145	\N	t	f	2018-04-21 06:27:31.68926	2018-04-21 06:27:31.68926	2	145	159	f	\N	\N
53	77	8	<p>gh</p>	2018-04-21 09:31:00	\N	<p>gh</p>	145	\N	t	f	2018-04-21 06:32:13.271139	2018-04-21 06:32:13.29185	2	140	159	f	\N	\N
54	78	8	<p>gh</p>	2018-04-21 09:35:00	\N	<p>gh</p>	145	\N	t	f	2018-04-21 06:36:00.334693	2018-04-21 06:36:00.342266	2	140	159	f	\N	\N
55	99	8	<p>Personal consultation</p>	2018-04-25 17:42:00	\N	<p>will see you</p>	135	\N	t	f	2018-04-23 17:43:04.226005	2018-04-23 17:43:04.226005	2	142	137	f	\N	\N
57	101	3	<p>Regular diet check ups</p>	2018-04-27 17:53:00	\N	<p>will be going</p>	135	\N	t	f	2018-04-23 17:54:04.197265	2018-04-23 17:54:04.197265	1	36	137	f	\N	\N
58	96	1	<p>Stomach upset</p>	2018-04-30 17:55:00	\N		135	\N	t	f	2018-04-23 17:56:00.820986	2018-04-23 17:56:00.820986	2	148	137	f	\N	\N
60	7	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-23 17:58:55.594922	2018-04-23 17:58:55.594922	1	140	137	\N	\N	\N
61	105	8		2018-05-08 01:19:00	\N		145	\N	t	f	2018-04-23 22:20:12.780013	2018-04-23 22:20:12.780013	2	153	155	f	\N	\N
64	113	8		2018-04-30 12:00:00	\N		135	\N	t	f	2018-04-26 12:09:27.99686	2018-04-26 12:09:27.99686	1	140	179	f	\N	\N
66	115	1		2018-04-26 12:11:00	\N		135	\N	t	f	2018-04-26 12:11:40.388429	2018-04-26 12:11:40.388429	2	140	179	f	\N	\N
67	116	5		2018-04-26 12:13:00	\N		135	\N	t	f	2018-04-26 12:13:33.381071	2018-04-26 12:13:33.381071	1	157	179	f	\N	\N
68	117	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 12:20:50.331833	2018-04-26 12:20:50.331833	1	140	179	\N	\N	\N
22	14	\N		\N	\N		36	\N	t	f	2018-04-16 11:57:33.596145	2018-06-07 17:20:59.675696	1	140	137	t	\N	\N
70	150	1		2018-05-02 22:01:00	\N		145	\N	t	f	2018-05-02 19:01:31.057118	2018-05-02 19:01:31.057118	1	\N	146	f	\N	\N
71	153	1		2018-05-02 22:09:00	\N		145	\N	t	f	2018-05-02 19:10:02.59445	2018-05-02 19:10:02.600692	1	140	146	f	\N	\N
72	167	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-04 14:34:17.667042	2018-05-04 14:34:17.667042	1	\N	216	\N	\N	\N
19	17	\N		2018-04-17 10:55:00	\N		36	\N	t	f	2018-04-16 10:55:23.41787	2018-06-08 16:21:44.46954	\N	140	139	t	\N	\N
1	2	2	<p>headache</p>	2018-04-16 10:00:00	\N		135	\N	t	f	2018-04-12 16:44:22.573949	2018-07-17 18:34:12.413667	2	\N	\N	t	\N	\N
2	6	\N		\N	\N		36	\N	t	f	2018-04-13 16:18:41.796987	2018-07-17 18:34:12.41558	1	\N	\N	t	\N	\N
3	9	\N	<p>drugs</p>	2018-04-16 16:19:00	\N	<p>yh</p>	135	\N	t	f	2018-04-13 16:19:57.014881	2018-07-17 18:34:12.417045	2	\N	\N	t	\N	\N
4	10	2	<p>drugs</p>	2018-04-16 16:20:00	\N	<p>ok</p>	135	\N	t	f	2018-04-13 16:20:52.816951	2018-07-17 18:34:12.418514	1	\N	\N	t	\N	\N
5	11	2		2018-04-16 10:24:00	\N		135	\N	t	f	2018-04-13 16:25:30.178286	2018-07-17 18:34:12.420051	1	\N	\N	t	\N	\N
21	19	\N		2018-04-16 10:56:00	\N		36	\N	t	f	2018-04-16 10:56:47.771407	2018-07-17 18:34:12.421496	2	\N	\N	t	\N	\N
27	36	2		2018-04-24 11:30:00	\N		135	\N	t	f	2018-04-18 16:30:37.857716	2018-07-17 18:34:12.422937	2	\N	\N	t	\N	\N
31	38	2		2018-04-19 16:35:00	\N		135	\N	t	f	2018-04-18 16:35:18.804256	2018-07-17 18:34:12.424398	2	\N	\N	t	\N	\N
32	37	7		2018-04-26 16:30:00	\N		135	\N	t	f	2018-04-18 16:36:11.319956	2018-07-17 18:34:12.425833	1	\N	\N	t	\N	\N
33	44	1	<p>wants to see dr mansah</p>	2018-04-20 01:40:00	\N		145	\N	t	f	2018-04-18 22:39:54.255696	2018-07-17 18:34:12.427246	1	\N	\N	t	\N	\N
36	48	8	<p>none&nbsp;</p>	2018-05-03 14:47:00	\N		145	\N	t	f	2018-04-19 13:47:37.733555	2018-07-17 18:34:12.428679	1	\N	\N	t	\N	\N
37	46	8		2018-04-30 16:49:00	\N	<p>repated called&nbsp;</p>	145	\N	t	f	2018-04-19 13:49:05.55278	2018-07-17 18:34:12.430105	1	\N	\N	t	\N	\N
39	50	1	<p>headaches</p>	2018-04-25 17:03:00	\N	<p>seeing dr nkansah</p>	145	\N	t	f	2018-04-19 14:03:35.297706	2018-07-17 18:34:12.431539	1	\N	\N	t	\N	\N
40	50	1	<p>headaches</p>	2018-04-25 17:03:00	\N	<p>seeing dr nkansah</p>	145	\N	t	f	2018-04-19 14:03:36.097094	2018-07-17 18:34:12.432981	1	\N	\N	t	\N	\N
46	65	2		2018-04-21 09:13:00	\N		149	\N	t	f	2018-04-20 11:14:49.68636	2018-07-17 18:34:12.434443	1	\N	\N	t	\N	\N
47	68	8		2018-04-20 11:37:00	\N		135	\N	t	f	2018-04-20 11:37:13.470645	2018-07-17 18:34:12.435894	1	\N	\N	t	\N	\N
52	76	8	<p>ghg</p>	2018-04-24 09:26:00	\N	<p>ghana</p>	145	\N	t	f	2018-04-21 06:30:10.605394	2018-07-17 18:34:12.438841	1	\N	\N	t	\N	\N
56	97	8		2018-05-04 17:52:00	\N		135	\N	t	f	2018-04-23 17:52:54.00627	2018-07-17 18:34:12.440264	1	\N	\N	t	\N	\N
59	91	8		2018-04-23 17:56:00	\N		135	\N	t	f	2018-04-23 17:57:05.362305	2018-07-17 18:34:12.441695	1	\N	\N	t	\N	\N
62	111	1		2018-04-27 10:00:00	\N		135	\N	t	f	2018-04-26 12:06:47.94315	2018-07-17 18:34:12.443122	1	\N	\N	t	\N	\N
63	112	2		2018-04-27 12:07:00	\N		135	\N	t	f	2018-04-26 12:07:53.153936	2018-07-17 18:34:12.444562	1	\N	\N	t	\N	\N
65	114	8		2018-04-26 12:10:00	\N		135	\N	t	f	2018-04-26 12:10:20.097911	2018-07-17 18:34:12.445988	1	\N	\N	t	\N	\N
73	167	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-04 14:34:20.726557	2018-05-04 14:34:20.726557	1	\N	216	\N	\N	\N
74	167	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-04 14:34:55.406941	2018-05-04 14:34:55.406941	1	\N	216	\N	\N	\N
75	167	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-04 14:44:02.678309	2018-05-04 14:44:02.678309	1	155	216	\N	\N	\N
76	168	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-04 15:25:09.647386	2018-05-04 15:25:09.647386	1	140	208	\N	\N	\N
77	169	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-05 14:31:52.709112	2018-05-05 14:31:52.709112	1	228	229	\N	\N	\N
78	171	9		2018-05-08 23:14:00	\N		149	\N	t	f	2018-05-05 22:14:06.915826	2018-05-05 22:14:06.915826	3	230	137	f	\N	\N
79	172	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-05 22:22:32.460186	2018-05-05 22:22:32.460186	3	230	136	\N	\N	\N
80	170	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-05 22:22:52.019321	2018-05-05 22:22:52.019321	3	230	137	\N	\N	\N
81	173	1		2018-05-08 10:05:00	\N		135	\N	t	f	2018-05-07 15:06:33.605349	2018-05-07 15:06:33.605349	1	\N	232	f	\N	\N
82	174	8		2018-05-08 15:07:00	\N		135	\N	t	f	2018-05-07 15:08:08.521602	2018-05-07 15:08:08.521602	1	228	232	f	\N	\N
83	175	3	<p>none</p>	2018-05-09 15:08:00	\N		135	\N	t	f	2018-05-07 15:09:15.814312	2018-05-07 15:09:15.814312	1	\N	232	f	\N	\N
84	175	3	<p>none</p>	2018-05-09 15:08:00	\N	<p>none</p>	135	\N	t	f	2018-05-07 15:09:41.592487	2018-05-07 15:09:41.592487	1	\N	232	f	\N	\N
85	177	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-08 20:33:21.86559	2018-05-08 20:33:21.86559	1	230	193	\N	\N	\N
86	176	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-08 20:33:45.346067	2018-05-08 20:33:45.346067	1	230	232	\N	\N	\N
87	179	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-09 09:38:38.777165	2018-05-09 09:38:38.777165	1	236	234	\N	\N	\N
88	182	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-09 15:47:40.853954	2018-05-09 15:47:40.853954	3	230	237	\N	\N	\N
89	184	9		2018-05-12 16:55:00	\N		149	\N	t	f	2018-05-09 15:54:30.682408	2018-05-09 15:54:30.689815	3	230	237	f	\N	\N
90	189	\N	\N	\N	\N	\N	\N	\N	t	f	2018-05-10 02:58:42.493652	2018-05-10 02:58:42.493652	1	238	239	\N	\N	\N
137	185	\N	Medical 	2018-06-13 13:26:00	\N	\N	\N	\N	t	f	2018-06-07 15:00:56.707692	2018-06-07 15:03:10.081156	1	\N	146	f	192	\N
92	193	\N		2018-05-22 06:10:00	\N		145	\N	t	f	2018-05-10 03:10:42.038315	2018-05-10 03:10:42.044121	1	238	239	f	\N	\N
93	192	1		2018-05-28 06:11:00	\N		145	\N	t	f	2018-05-10 03:12:18.511505	2018-05-10 03:12:18.511505	1	\N	239	f	\N	\N
91	194	1		2018-05-30 06:07:00	\N		145	\N	t	f	2018-05-10 03:07:33.851371	2018-05-10 15:12:44.334374	1	238	239	f	\N	\N
94	196	1		2018-05-10 18:20:00	\N		145	\N	t	f	2018-05-10 15:20:25.140373	2018-05-10 15:20:25.140373	1	\N	239	f	\N	\N
95	202	6		2018-05-28 18:24:00	\N		145	\N	t	f	2018-05-10 15:29:07.404314	2018-05-10 15:29:07.404314	1	\N	239	f	\N	\N
96	201	8		2018-05-10 18:30:00	\N		145	\N	t	f	2018-05-10 15:30:45.529508	2018-05-10 15:30:45.535818	1	238	239	f	\N	\N
97	200	1		2018-05-28 18:31:00	\N		145	\N	t	f	2018-05-10 15:31:22.7592	2018-05-10 15:31:22.765046	4	238	239	f	\N	\N
98	199	1		2018-05-21 18:31:00	\N		145	\N	t	f	2018-05-10 15:32:03.703366	2018-05-10 15:32:03.7094	1	238	239	f	\N	\N
99	198	1		2018-05-29 18:33:00	\N		145	\N	t	f	2018-05-10 15:34:01.684335	2018-05-10 15:34:01.684335	4	\N	239	f	\N	\N
100	197	\N		2018-05-17 18:36:00	\N		145	\N	t	f	2018-05-10 15:36:31.124925	2018-05-10 15:36:31.124925	4	\N	239	f	\N	\N
101	195	\N		2018-05-10 18:37:00	\N		145	\N	t	f	2018-05-10 15:38:50.159259	2018-05-10 15:38:50.159259	4	155	139	f	\N	\N
102	191	\N		2018-05-17 18:39:00	\N		145	\N	t	f	2018-05-10 15:40:03.513882	2018-05-10 15:40:03.513882	4	155	239	f	\N	\N
103	190	\N		2018-06-29 18:40:00	\N		145	\N	t	f	2018-05-10 15:41:25.630145	2018-05-10 15:41:25.630145	1	\N	239	f	\N	\N
104	188	\N	<p>wdfsfs</p>	2018-06-29 18:42:00	\N		145	\N	t	f	2018-05-10 15:42:39.153479	2018-05-10 15:42:39.153479	1	\N	239	f	\N	\N
105	187	\N		2018-05-24 18:44:00	\N		145	\N	t	f	2018-05-10 15:47:24.958618	2018-05-10 15:47:24.958618	1	\N	239	f	\N	\N
106	186	1		2018-05-31 18:47:00	\N		145	\N	t	f	2018-05-10 15:47:56.48111	2018-05-10 15:47:56.48111	4	\N	239	f	\N	\N
107	206	\N		2018-05-10 17:06:00	\N		135	\N	t	f	2018-05-10 17:06:45.467803	2018-05-10 17:06:45.467803	1	\N	136	f	\N	\N
108	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 13:58:42.193598	2018-06-06 13:58:42.193598	2	140	193	f	\N	\N
109	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 14:01:47.35414	2018-06-06 14:01:47.35414	2	140	193	f	\N	\N
110	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 14:03:01.688459	2018-06-06 14:03:01.688459	2	140	193	f	\N	\N
111	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:12:12.861485	2018-06-06 15:12:12.861485	2	140	193	f	\N	\N
112	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:16:27.399633	2018-06-06 15:16:27.399633	2	140	193	f	\N	\N
113	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:17:08.408162	2018-06-06 15:17:08.408162	2	140	193	f	\N	\N
114	211	\N	\N	2018-06-07 10:47:00	\N	\N	\N	\N	t	f	2018-06-06 15:19:41.489834	2018-06-06 15:19:41.489834	1	140	137	f	\N	\N
115	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:24:43.673816	2018-06-06 15:24:43.673816	2	140	193	f	\N	\N
116	211	\N	\N	2018-06-07 10:47:00	\N	\N	\N	\N	t	f	2018-06-06 15:25:46.880348	2018-06-06 15:25:46.880348	1	140	137	f	\N	\N
120	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 15:45:21.831477	2018-06-06 15:45:21.831477	1	140	137	f	\N	\N
121	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 15:57:50.464499	2018-06-06 15:57:50.464499	1	140	137	f	\N	\N
122	218	\N	fa	2018-06-06 21:32:00	\N	\N	\N	\N	t	f	2018-06-06 15:59:59.856901	2018-06-06 15:59:59.856901	\N	140	137	f	\N	\N
123	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 16:01:07.215318	2018-06-06 16:01:07.215318	1	140	137	f	\N	\N
124	218	\N	fa	2018-06-06 21:32:00	\N	\N	\N	\N	t	f	2018-06-06 16:01:44.827468	2018-06-06 16:01:44.827468	\N	140	137	f	\N	\N
125	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 16:02:14.793244	2018-06-06 16:02:14.793244	1	140	137	f	\N	\N
126	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 16:02:26.881008	2018-06-06 16:02:26.881008	1	140	137	f	\N	\N
127	218	\N	fa	2018-06-06 21:32:00	\N	\N	\N	\N	t	f	2018-06-06 16:08:48.282568	2018-06-06 16:08:48.282568	\N	140	137	f	\N	\N
129	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-06 16:17:17.502047	2018-06-06 16:17:17.502047	1	140	137	f	\N	\N
131	219	\N	fast	2018-06-07 12:02:00	\N	\N	\N	\N	t	f	2018-06-07 10:19:04.821304	2018-06-07 10:19:04.821304	1	140	137	f	\N	\N
133	224	\N	\N	\N	\N	\N	\N	\N	t	f	2018-06-07 11:08:09.34588	2018-06-07 11:08:09.34588	1	248	247	\N	\N	\N
135	185	\N	Medical 	2018-06-13 13:26:00	\N	\N	\N	\N	t	f	2018-06-07 14:42:12.865336	2018-06-07 14:42:12.865336	1	192	146	f	\N	\N
136	185	\N	Medical 	2018-06-13 13:26:00	\N	\N	\N	\N	t	f	2018-06-07 14:46:10.588214	2018-06-07 14:46:10.588214	1	192	146	f	\N	\N
128	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 16:13:05.379431	2018-06-08 17:13:26.131413	2	140	193	t	\N	\N
69	149	\N	<p>Wound&nbsp;dressing&nbsp;</p>	2018-05-03 12:08:00	\N		36	\N	t	f	2018-05-02 12:08:21.677971	2018-06-07 15:03:13.863519	1	\N	193	f	192	\N
139	145	\N	None	2018-06-28 16:53:00	\N	\N	\N	\N	t	f	2018-06-07 16:54:49.193239	2018-06-07 16:54:49.193239	\N	248	137	f	\N	\N
140	171	\N		2018-06-13 16:54:00	\N	\N	\N	\N	t	f	2018-06-07 16:54:52.914648	2018-06-07 16:54:52.914648	3	248	137	f	\N	\N
130	211	\N	\N	2018-06-07 10:47:00	\N	\N	\N	\N	t	f	2018-06-07 10:05:32.297543	2018-06-07 17:05:13.718783	1	140	137	t	\N	\N
119	211	\N	\N	2018-06-07 10:47:00	\N	\N	\N	\N	t	f	2018-06-06 15:33:12.693763	2018-06-08 09:29:15.515493	1	140	137	t	\N	\N
141	160	\N	Consult	2018-06-22 16:53:00	\N	\N	\N	\N	t	f	2018-06-08 09:58:41.67505	2018-06-08 09:58:41.67505	\N	248	159	f	\N	\N
118	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:32:57.970181	2018-06-08 17:16:48.961371	2	140	193	t	\N	\N
117	178	\N	None	2018-06-30 11:00:00	\N	\N	\N	\N	t	f	2018-06-06 15:28:20.332366	2018-06-08 17:20:54.720568	2	140	193	t	\N	\N
143	193	\N	Doddy	2018-06-21 19:46:00	\N	\N	\N	\N	t	f	2018-06-10 19:48:37.891825	2018-06-10 19:48:37.891825	\N	248	239	f	\N	\N
144	138	\N	None	2018-06-19 16:54:00	\N	\N	\N	\N	t	f	2018-06-10 20:23:20.505465	2018-06-10 20:23:20.505465	1	248	137	f	\N	\N
146	140	\N	Home	2018-06-10 20:21:00	\N	\N	\N	\N	t	f	2018-06-10 20:23:46.095019	2018-06-10 20:23:46.095019	\N	248	137	f	\N	\N
147	154	\N	Ha 	2018-06-10 20:22:00	\N	\N	\N	\N	t	f	2018-06-10 20:23:49.982393	2018-06-10 20:23:49.982393	1	248	146	f	\N	\N
148	214	\N	Tooth ache	2018-06-11 10:39:00	\N	\N	\N	\N	t	f	2018-06-13 12:53:34.135797	2018-06-13 12:53:34.135797	\N	248	137	f	\N	\N
149	148	1		2018-06-13 13:28:00	\N		135	\N	t	f	2018-06-13 13:28:43.622043	2018-06-13 13:28:43.622043	1	\N	193	f	\N	\N
150	230	\N	\N	\N	\N	\N	\N	\N	t	f	2018-06-14 13:08:41.75106	2018-06-14 13:08:41.75106	1	248	250	\N	\N	\N
151	178	\N	None	2018-06-13 17:46:00	\N	\N	\N	\N	t	f	2018-06-15 08:21:36.395467	2018-06-15 08:21:36.395467	2	248	193	f	\N	\N
134	227	\N	Want to make free night call with you	2018-06-08 12:04:00	\N	\N	\N	\N	t	f	2018-06-07 12:14:30.552396	2018-07-17 21:55:46.708244	\N	248	247	t	\N	\N
132	226	1		2018-06-08 11:00:00	\N		158	\N	t	f	2018-06-07 11:00:23.634516	2018-07-18 08:32:01.90961	1	\N	247	t	\N	\N
138	206	\N		2018-06-07 16:52:00	\N	\N	\N	\N	t	f	2018-06-07 16:52:48.06485	2018-08-08 12:03:37.52987	1	248	136	t	\N	\N
152	243	\N		2018-06-16 00:38:00	\N		135	\N	t	f	2018-06-16 00:38:55.438779	2018-06-16 00:38:55.438779	1	\N	254	f	\N	\N
153	243	\N		2018-06-16 00:38:00	\N		135	\N	t	f	2018-06-16 00:38:57.179223	2018-06-16 00:38:57.179223	1	\N	254	f	\N	\N
154	232	4		2018-06-16 00:43:00	\N		135	\N	t	f	2018-06-16 00:43:25.111658	2018-06-16 00:43:25.111658	1	\N	251	f	\N	\N
155	224	\N	\N	\N	\N	\N	\N	\N	t	f	2018-06-16 00:43:46.661735	2018-06-16 00:43:46.661735	1	248	247	\N	\N	\N
156	249	4	<p>HDCHE</p>	2018-06-29 19:48:00	\N	<p>wants ro see dr ocv</p>	145	\N	t	f	2018-06-19 17:00:12.220291	2018-06-19 17:00:12.220291	1	\N	256	f	\N	\N
157	250	\N		2018-07-07 20:14:00	\N	<p>hot day</p>	145	\N	t	f	2018-06-19 17:14:32.597472	2018-06-19 17:14:32.597472	1	\N	256	f	\N	\N
158	248	\N	\N	\N	\N	\N	\N	\N	t	f	2018-06-19 17:55:25.567799	2018-06-19 17:55:25.567799	1	238	256	\N	\N	\N
159	242	\N	None	2018-06-22 07:53:00	\N	\N	\N	\N	t	f	2018-06-20 08:24:01.013037	2018-06-20 08:24:01.013037	1	246	254	f	\N	\N
160	241	\N	Malaria	2018-06-20 07:54:00	\N	\N	\N	\N	t	f	2018-06-20 09:01:53.25839	2018-06-20 09:01:53.25839	\N	246	254	f	\N	\N
161	256	8	<p>hdaches&nbsp;</p>	2018-06-20 13:57:00	\N	<p>appointment for dr ocansey</p>	145	\N	t	f	2018-06-20 10:57:54.564742	2018-06-20 10:57:54.564742	1	\N	257	f	\N	\N
162	259	\N	\N	\N	\N	\N	\N	\N	t	f	2018-06-20 11:13:07.745011	2018-06-20 11:13:07.745011	1	258	257	\N	\N	\N
166	202	\N	\N	2018-06-29 00:42:00	\N	\N	\N	\N	t	f	2018-06-21 10:50:31.298723	2018-06-21 10:50:31.298723	\N	248	239	f	\N	\N
168	157	\N	\N	2018-06-21 10:53:00	\N	\N	\N	\N	t	f	2018-06-21 11:39:47.810278	2018-06-21 11:39:47.810278	1	248	159	f	\N	\N
169	254	\N	<p>head ups</p>	2018-06-29 16:17:00	\N	\N	\N	\N	t	f	2018-06-21 13:27:44.952135	2018-06-21 13:27:44.952135	1	\N	256	f	259	\N
170	253	\N	<p>headache of my brother&nbsp;</p>	2018-06-29 16:18:00	\N	\N	\N	\N	t	f	2018-06-21 13:32:50.17046	2018-06-21 13:32:50.17046	\N	258	256	f	\N	\N
171	255	\N	<p>irorp[p</p>\r\n<p>[]t</p>	2018-07-07 16:16:00	\N	\N	\N	\N	t	f	2018-06-21 13:32:53.448632	2018-06-21 13:32:53.448632	\N	258	256	f	\N	\N
174	247	\N	<p>diabetes review&nbsp;</p>	2018-06-27 16:18:00	\N	\N	\N	\N	t	f	2018-06-21 13:33:15.016792	2018-06-21 13:36:18.920033	1	258	256	t	\N	\N
172	257	\N	Diabetes review 	2018-06-22 12:56:00	\N	\N	\N	\N	t	f	2018-06-21 13:33:08.405075	2018-06-21 13:46:42.051795	\N	258	257	t	\N	\N
173	258	\N	Fanaticism	2018-06-22 13:00:00	\N	\N	\N	\N	t	f	2018-06-21 13:33:12.128911	2018-06-21 13:47:34.390528	1	258	257	t	\N	\N
176	104	\N	\N	2018-06-21 18:20:00	\N	\N	\N	\N	t	f	2018-06-22 09:43:36.879523	2018-06-22 09:43:36.879523	2	248	155	f	\N	\N
178	193	\N	Doddy	2018-06-27 18:20:00	\N	\N	\N	\N	t	f	2018-06-22 09:48:04.072173	2018-06-22 09:48:04.072173	\N	248	239	f	\N	\N
179	139	\N	Checkups	2018-06-21 18:19:00	\N	\N	\N	\N	t	f	2018-06-22 09:48:44.925286	2018-06-22 09:48:44.925286	2	248	137	f	\N	\N
180	131	\N	Home	2018-06-28 18:15:00	\N	\N	\N	\N	t	f	2018-06-22 10:23:11.7109	2018-06-22 10:23:11.7109	\N	248	137	f	\N	\N
181	262	4		2018-06-22 13:49:00	\N		145	\N	t	f	2018-06-22 10:49:27.571095	2018-06-22 10:49:27.571095	1	\N	261	f	\N	\N
183	220	\N	\N	2018-06-21 18:14:00	\N	\N	\N	\N	t	f	2018-06-24 16:41:04.437138	2018-06-24 16:41:04.437138	\N	248	137	f	\N	\N
185	126	\N	Running	2018-06-21 18:15:00	\N	\N	\N	\N	t	f	2018-06-26 10:29:07.231053	2018-06-26 10:29:07.231053	\N	248	137	f	\N	\N
186	223	\N	\N	2018-06-25 18:15:00	\N	\N	\N	\N	t	f	2018-06-26 10:31:45.503176	2018-06-26 10:31:45.503176	\N	248	239	f	\N	\N
145	211	\N	\N	2018-06-07 16:51:00	\N	\N	\N	\N	t	f	2018-06-10 20:23:40.024415	2018-06-26 11:11:03.68767	1	248	137	t	\N	\N
182	123	\N	\N	2018-06-21 18:17:00	\N	\N	\N	\N	t	f	2018-06-24 16:40:13.021995	2018-06-26 11:26:48.859584	1	248	179	t	\N	\N
187	275	4	<p>how&nbsp;</p>	2018-06-28 14:02:00	\N	<p>why</p>	145	\N	t	f	2018-06-28 11:03:12.256007	2018-06-28 11:03:12.256007	1	\N	257	f	\N	\N
188	276	\N	<p>stomach</p>	2018-06-28 14:05:00	\N	<p>wants it toay&nbsp;</p>	145	\N	t	f	2018-06-28 11:06:10.903394	2018-06-28 11:06:10.903394	1	\N	257	f	\N	\N
190	277	\N	<p>head</p>	2018-06-28 14:53:00	\N	<p>nil</p>	145	\N	t	f	2018-06-28 11:53:50.571085	2018-06-28 11:53:50.571085	2	\N	257	f	\N	\N
192	61	\N	\N	2018-07-02 22:26:00	\N	\N	\N	\N	t	f	2018-07-03 12:48:13.894848	2018-07-03 12:48:13.894848	\N	248	146	f	\N	\N
195	60	\N	\N	2018-07-04 13:04:00	\N	\N	\N	\N	t	f	2018-07-03 13:18:06.749517	2018-07-03 13:18:06.749517	\N	248	146	f	\N	\N
196	183	\N	\N	2018-07-03 10:29:00	\N	\N	\N	\N	t	f	2018-07-03 13:19:00.884896	2018-07-03 13:19:00.884896	\N	248	237	f	\N	\N
197	118	\N	\N	2018-07-25 13:03:00	\N	\N	\N	\N	t	f	2018-07-03 13:23:02.709773	2018-07-03 13:23:02.709773	\N	248	179	f	\N	\N
199	79	\N	Pad	2018-07-03 13:34:00	\N	\N	\N	\N	t	f	2018-07-03 18:51:04.154252	2018-07-03 18:51:04.154252	2	248	159	f	\N	\N
200	71	\N	None	2018-07-12 15:14:00	\N	\N	\N	\N	t	f	2018-07-15 15:36:56.941044	2018-07-15 15:36:56.941044	1	248	137	f	\N	\N
49	55	1	<p><span style="font-family: verdana, arial, helvetica, sans-serif; font-size: 13px; background-color: #f1f1f1;">Diarrhoea</span></p>	2018-04-21 16:42:00	\N		158	\N	t	f	2018-04-20 16:42:39.164944	2018-07-17 18:34:12.437346	1	\N	\N	t	\N	\N
142	227	\N	Want to make free night call with you	2018-06-08 12:04:00	\N	\N	\N	\N	t	f	2018-06-08 09:59:21.252423	2018-07-17 21:51:27.948883	\N	248	247	t	\N	\N
177	229	\N	Headache	2018-06-26 18:17:00	\N	\N	\N	\N	t	f	2018-06-22 09:47:11.720295	2018-07-18 14:21:45.358603	1	248	250	t	\N	\N
165	228	\N	Checkup	2018-06-16 00:40:00	\N	\N	\N	\N	t	f	2018-06-21 10:49:14.375439	2018-07-18 15:01:59.295346	\N	248	247	t	\N	\N
184	231	\N	\N	2018-06-22 18:14:00	\N	\N	\N	\N	t	f	2018-06-26 09:33:35.147255	2018-07-19 11:34:04.433088	\N	248	247	t	\N	\N
203	270	\N	tooth ache	2018-07-12 15:13:00	\N	\N	\N	\N	t	f	2018-07-18 14:43:04.060039	2018-07-19 11:48:16.807918	\N	248	247	t	\N	\N
193	265	\N	\N	2018-07-03 12:14:00	\N	\N	\N	\N	t	f	2018-07-03 12:59:25.656586	2018-07-19 12:09:29.150146	1	248	247	t	\N	\N
204	280	\N	None	2018-07-20 09:59:00	\N	\N	\N	\N	t	f	2018-07-20 10:41:21.150276	2018-07-20 10:41:21.150276	\N	248	250	f	\N	\N
205	285	8	<p>ases</p>	2018-07-22 20:41:00	\N	<p>AASs</p>	145	\N	t	f	2018-07-22 17:41:55.205838	2018-07-22 17:41:55.205838	1	\N	257	f	\N	\N
206	287	\N	<p>hi</p>	2018-07-22 20:46:00	\N	<p>hi&nbsp;</p>	145	\N	t	f	2018-07-22 17:50:39.490003	2018-07-22 17:50:39.490003	1	\N	257	f	\N	\N
210	167	\N	\N	\N	\N	\N	\N	\N	t	f	2018-07-22 22:13:35.835915	2018-07-22 22:13:35.835915	1	248	216	\N	\N	\N
211	179	\N	\N	\N	\N	\N	\N	\N	t	f	2018-07-22 22:31:43.028913	2018-07-22 22:31:43.028913	1	248	234	\N	\N	\N
212	179	\N	\N	\N	\N	\N	\N	\N	t	f	2018-07-22 22:31:45.155623	2018-07-22 22:31:45.155623	1	248	234	\N	\N	\N
214	301	\N	Nose bleed	2018-07-25 11:57:00	\N	\N	\N	\N	t	f	2018-07-23 12:00:53.126638	2018-07-23 12:00:53.126638	\N	258	257	f	\N	\N
215	260	\N	<p>see me in two weeks&nbsp;</p>	2018-07-24 11:30:00	\N	\N	\N	\N	t	f	2018-07-23 12:01:03.243813	2018-07-23 12:01:03.243813	1	258	257	f	\N	\N
216	274	\N	Tomy	2018-07-22 21:22:00	\N	\N	\N	\N	t	f	2018-07-23 12:02:19.112276	2018-07-23 12:02:19.112276	1	258	257	f	\N	\N
207	286	\N	\N	2018-07-22 20:55:00	\N	\N	\N	\N	t	f	2018-07-22 17:57:22.527951	2018-07-23 12:16:00.316528	\N	258	257	t	\N	\N
213	302	\N	Sick	2018-07-23 10:13:00	\N	\N	\N	\N	t	f	2018-07-23 10:16:26.698143	2018-07-23 12:16:51.097825	\N	248	247	t	\N	\N
220	272	\N	Dm	2018-06-28 14:00:00	\N	\N	\N	\N	t	f	2018-07-23 12:03:31.116231	2018-07-23 12:19:25.52609	\N	258	257	t	\N	\N
219	273	\N	Dm	2018-06-28 21:51:00	\N	\N	\N	\N	t	f	2018-07-23 12:03:22.238026	2018-07-23 12:23:05.305542	\N	258	257	t	\N	\N
221	332	\N	\N	\N	\N	\N	\N	\N	t	f	2018-07-23 17:52:18.52033	2018-07-23 17:52:18.52033	1	264	262	\N	\N	\N
222	325	\N	\N	2018-07-23 17:52:00	\N	\N	\N	\N	t	f	2018-07-24 11:20:02.828357	2018-07-24 11:20:02.828357	1	264	247	f	\N	\N
224	219	\N	fast	2018-07-25 17:59:00	\N	\N	\N	\N	t	f	2018-07-24 11:24:33.813407	2018-07-24 11:24:33.813407	1	264	137	f	\N	\N
225	192	\N	\N	2018-07-24 18:00:00	\N	\N	\N	\N	t	f	2018-07-24 11:24:49.965846	2018-07-24 11:24:49.965846	\N	264	239	f	\N	\N
226	194	\N	Headaches 	2018-07-26 18:00:00	\N	\N	\N	\N	t	f	2018-07-24 11:25:58.163907	2018-07-24 11:25:58.163907	1	264	239	f	\N	\N
223	322	\N	\N	2018-07-23 17:52:00	\N	\N	\N	\N	t	f	2018-07-24 11:20:20.107922	2018-08-07 16:12:40.795279	\N	264	247	t	\N	\N
194	94	\N	\N	2018-07-25 12:58:00	\N	\N	\N	\N	t	f	2018-07-03 13:08:56.184885	2018-08-07 16:54:25.121961	2	248	137	t	\N	\N
198	93	\N	\N	2018-07-04 14:46:00	\N	\N	\N	\N	t	f	2018-07-03 15:23:12.426028	2018-08-07 17:09:00.956773	2	248	137	t	\N	\N
208	98	\N	\N	2018-07-22 21:47:00	\N	\N	\N	\N	t	f	2018-07-22 22:00:24.274007	2018-08-07 17:28:34.437296	\N	248	137	t	\N	\N
202	28	\N		2018-07-12 15:13:00	\N	\N	\N	\N	t	f	2018-07-16 15:58:33.464187	2018-08-07 17:59:33.58798	2	248	137	t	\N	\N
201	15	\N	\N	2018-07-12 15:14:00	\N	\N	\N	\N	t	f	2018-07-16 12:40:44.739922	2018-08-07 18:02:12.473786	\N	248	137	t	\N	\N
167	234	\N	\N	2018-06-21 10:54:00	\N	\N	\N	\N	t	f	2018-06-21 10:56:40.220679	2018-08-08 20:35:45.859568	1	248	251	t	\N	\N
191	261	\N	<p>hi</p>	2018-06-29 14:52:00	\N	\N	\N	\N	t	f	2018-06-28 12:03:01.938375	2018-08-09 13:29:38.698524	1	258	257	t	\N	\N
175	246	\N	<p>haing headaches</p>	2018-06-29 16:19:00	\N	\N	\N	\N	t	f	2018-06-21 13:33:18.225801	2018-08-09 13:31:15.669057	\N	258	256	t	\N	\N
189	263	\N	Shes sick	2018-06-22 14:10:00	\N	\N	\N	\N	t	f	2018-06-28 11:30:47.455831	2018-08-09 15:16:19.542416	2	258	261	t	\N	\N
218	288	\N	Head	2018-07-22 20:44:00	\N	\N	\N	\N	t	f	2018-07-23 12:02:43.202852	2018-08-13 16:37:42.723962	\N	258	257	t	\N	\N
217	289	\N	Head	2018-07-22 20:59:00	\N	\N	\N	\N	t	f	2018-07-23 12:02:31.805443	2018-09-18 20:05:30.867764	\N	258	257	t	\N	\N
600	658	\N	\N	2018-11-22 08:33:00	\N	\N	\N	\N	t	f	2018-11-15 08:34:07.650329	2018-11-15 08:34:07.650329	\N	36	139	f	\N	\N
228	334	\N	Foine	2018-07-31 12:30:00	\N	\N	\N	\N	t	f	2018-07-24 12:24:33.11953	2018-07-24 12:24:33.11953	\N	264	262	f	\N	\N
231	140	\N	Home	2018-07-27 18:01:00	\N	\N	\N	\N	t	f	2018-07-24 12:26:25.97547	2018-07-24 12:26:25.97547	\N	264	137	f	\N	\N
230	336	\N	\N	2018-07-25 12:10:00	\N	\N	\N	\N	t	f	2018-07-24 12:24:55.304325	2018-07-24 12:29:56.675496	\N	264	262	t	\N	\N
232	337	1		2018-07-24 12:40:00	\N		158	\N	t	f	2018-07-24 12:41:03.445777	2018-07-24 12:41:03.445777	1	\N	262	f	\N	\N
233	312	\N	Headache	2018-07-24 12:42:00	\N	\N	\N	\N	t	f	2018-07-24 15:03:04.666659	2018-07-24 15:03:04.666659	\N	264	262	f	\N	\N
227	333	\N	Headache	2018-07-24 12:30:00	\N	\N	\N	\N	t	f	2018-07-24 12:24:06.956458	2018-07-24 15:31:26.192383	\N	264	262	t	\N	\N
234	339	4	<p>back pain</p>	2018-08-25 10:30:00	\N	<p>scan</p>	158	\N	t	f	2018-07-25 12:59:58.944683	2018-07-25 12:59:58.944683	1	\N	262	f	\N	\N
235	341	4	<p>pressure</p>	2018-09-07 11:00:00	\N		158	\N	t	f	2018-08-07 11:56:31.243158	2018-08-07 11:56:31.243158	1	\N	267	f	\N	\N
236	343	\N	<p>come</p>	2018-08-10 11:30:00	\N		158	\N	t	f	2018-08-07 12:05:26.558831	2018-08-07 12:05:26.558831	1	\N	267	f	\N	\N
237	344	\N	Headache	2018-08-07 12:06:00	\N	\N	\N	\N	t	f	2018-08-07 12:54:44.346287	2018-08-07 12:54:44.346287	\N	246	267	f	\N	\N
239	228	\N	Checkup	2018-07-24 22:30:00	\N	\N	\N	\N	t	f	2018-08-07 15:52:55.407137	2018-08-07 16:11:40.472235	\N	248	247	t	\N	\N
209	106	\N	Checkups	2018-07-22 21:51:00	\N	\N	\N	\N	t	f	2018-07-22 22:00:46.573719	2018-08-07 17:25:51.116476	1	248	137	t	\N	\N
238	319	\N	Home	2018-07-25 17:53:00	\N	\N	\N	\N	t	f	2018-08-07 15:47:42.517543	2018-08-07 18:02:57.409206	\N	248	257	t	\N	\N
240	349	\N	\N	\N	\N	\N	\N	\N	t	f	2018-08-07 23:02:29.016813	2018-08-07 23:02:29.016813	1	140	268	\N	\N	\N
241	350	\N		2018-08-08 12:45:00	\N	\N	\N	\N	t	f	2018-08-08 11:19:54.129645	2018-08-08 11:19:54.129645	\N	230	268	f	\N	\N
242	326	\N		2018-09-20 12:32:00	\N		158	\N	t	f	2018-08-08 11:31:04.768125	2018-08-08 11:31:04.768125	1	\N	247	f	\N	\N
243	346	\N		2018-09-03 12:37:00	\N		158	\N	t	f	2018-08-08 11:35:59.907423	2018-08-08 11:35:59.907423	3	\N	247	f	\N	\N
245	352	9	<p>LOVE</p>	2018-09-01 16:06:00	\N		158	\N	t	f	2018-08-08 15:05:47.002151	2018-08-08 15:05:47.002151	3	\N	272	f	\N	\N
246	351	\N	\N	\N	\N	\N	\N	\N	t	f	2018-08-08 15:07:11.857954	2018-08-08 15:07:11.857954	3	230	272	\N	\N	\N
248	357	9		2018-09-01 19:02:00	\N		158	\N	t	f	2018-08-08 18:01:10.532851	2018-08-08 18:01:10.532851	3	\N	272	f	\N	\N
250	347	\N	Headache	2018-09-05 20:10:00	\N	\N	\N	\N	t	f	2018-08-08 18:05:53.058797	2018-08-08 18:05:53.058797	\N	230	250	f	\N	\N
249	353	\N	Strong 	2018-08-30 16:30:00	\N	\N	\N	\N	t	f	2018-08-08 18:05:37.308892	2018-08-08 18:11:46.162469	\N	230	272	t	\N	\N
252	107	\N	Health	2018-07-23 21:52:00	\N	\N	\N	\N	t	f	2018-08-08 20:30:44.720158	2018-08-08 20:30:44.720158	1	248	137	f	\N	\N
251	358	\N	Spine 	2018-10-03 19:27:00	\N	\N	\N	\N	t	f	2018-08-08 18:29:15.337873	2018-08-09 09:17:45.035555	\N	230	272	t	\N	\N
253	362	\N		2018-08-09 11:40:00	\N		158	\N	t	f	2018-08-09 10:40:09.466005	2018-08-09 10:40:09.466005	3	\N	272	f	\N	\N
244	345	\N	Old age	2018-08-08 21:26:00	\N	\N	\N	\N	t	f	2018-08-08 12:07:41.571944	2018-08-09 10:53:12.189153	\N	230	267	t	\N	\N
254	363	\N	Pretty	2018-08-09 10:57:00	\N	\N	\N	\N	t	f	2018-08-09 10:59:35.686466	2018-08-09 10:59:35.686466	\N	230	272	f	\N	\N
255	359	\N	\N	2018-09-30 12:14:00	\N	\N	\N	\N	t	f	2018-08-09 11:16:50.67753	2018-08-09 11:16:50.67753	\N	230	272	f	\N	\N
256	368	\N	Stress	2018-08-29 12:25:00	\N	\N	\N	\N	t	f	2018-08-09 11:26:41.541254	2018-08-09 11:26:41.541254	\N	230	272	f	\N	\N
257	364	1		2018-08-10 11:44:00	\N		158	\N	t	f	2018-08-09 11:45:12.308015	2018-08-09 11:45:12.308015	1	\N	267	f	\N	\N
258	365	1		2018-08-09 11:49:00	\N		158	\N	t	f	2018-08-09 11:50:01.965412	2018-08-09 11:50:01.965412	1	\N	267	f	\N	\N
259	367	\N		2018-08-10 11:03:00	\N		158	\N	t	f	2018-08-09 12:03:58.506229	2018-08-09 12:03:58.506229	2	\N	267	f	\N	\N
260	370	\N	Nothing	2018-08-09 12:06:00	\N	\N	\N	\N	t	f	2018-08-09 12:12:02.76653	2018-08-09 12:12:02.76653	\N	230	267	f	\N	\N
261	369	\N	Acne	2018-08-09 12:05:00	\N	\N	\N	\N	t	f	2018-08-09 12:13:31.455381	2018-08-09 12:13:31.455381	\N	230	267	f	\N	\N
262	373	\N	\N	\N	\N	\N	\N	\N	t	f	2018-08-09 12:46:31.726521	2018-08-09 12:46:31.726521	1	230	276	\N	\N	\N
263	376	\N	Dead	2018-08-10 13:24:00	\N	\N	\N	\N	t	f	2018-08-09 13:25:12.139395	2018-08-09 13:25:12.139395	\N	258	276	f	\N	\N
264	377	\N	\N	2018-08-09 13:23:00	\N	\N	\N	\N	t	f	2018-08-09 13:25:22.920972	2018-08-09 13:33:11.801527	\N	258	276	t	\N	\N
265	379	\N	\N	2018-08-10 14:43:00	\N	\N	\N	\N	t	f	2018-08-09 13:43:05.489475	2018-08-09 13:43:05.489475	\N	258	276	f	\N	\N
267	384	\N	Headache	2018-08-09 17:46:00	\N	\N	\N	\N	t	f	2018-08-09 14:48:34.928007	2018-08-09 15:07:59.997694	\N	258	276	t	\N	\N
269	387	\N	Mm	2018-08-09 19:12:00	\N	\N	\N	\N	t	f	2018-08-09 16:18:21.004669	2018-08-09 16:18:21.004669	\N	258	276	f	\N	\N
272	386	\N	Yeet	2018-08-09 19:04:00	\N	\N	\N	\N	t	f	2018-08-09 16:19:06.422084	2018-08-09 16:22:34.329789	\N	258	276	t	\N	\N
271	390	\N	\N	2018-08-09 19:11:00	\N	\N	\N	\N	t	f	2018-08-09 16:18:50.076111	2018-08-09 16:23:03.417967	\N	258	276	t	\N	\N
270	388	\N	Sick	2018-08-09 19:15:00	\N	\N	\N	\N	t	f	2018-08-09 16:18:34.551589	2018-08-09 16:23:36.050298	\N	258	276	t	\N	\N
268	389	\N	Hshs	2018-08-28 19:16:00	\N	\N	\N	\N	t	f	2018-08-09 16:18:11.137104	2018-08-09 16:24:13.974689	\N	258	276	t	\N	\N
266	380	1	<p>sick</p>	2018-08-09 17:17:00	\N		145	\N	t	f	2018-08-09 14:20:06.827932	2018-08-09 16:28:27.558565	1	\N	276	t	\N	\N
273	166	\N	\N	\N	\N	\N	\N	\N	t	f	2018-08-09 19:25:21.914161	2018-08-09 19:25:21.914161	1	264	212	\N	\N	\N
274	397	\N	<p>djm djk d m jskdj dm kdj m</p>	2018-08-10 11:01:00	\N	\N	\N	\N	t	f	2018-08-10 11:54:24.498984	2018-08-10 11:54:24.498984	1	140	277	f	\N	\N
275	394	\N		2018-08-10 11:09:00	\N	\N	\N	\N	t	f	2018-08-10 11:54:53.058369	2018-08-10 11:54:53.058369	3	140	277	f	\N	\N
276	394	\N		2018-08-10 11:09:00	\N	\N	\N	\N	t	f	2018-08-10 12:16:54.894742	2018-08-10 12:16:54.894742	3	140	277	f	\N	\N
277	399	\N		2018-08-10 12:30:00	\N	\N	\N	\N	t	f	2018-08-10 12:33:26.7114	2018-08-10 12:33:26.7114	\N	140	277	f	\N	\N
278	400	\N		2018-08-10 12:31:00	\N	\N	\N	\N	t	f	2018-08-10 12:33:40.338275	2018-08-10 12:33:40.338275	\N	140	277	f	\N	\N
279	401	\N		2018-08-10 12:31:00	\N	\N	\N	\N	t	f	2018-08-10 12:33:47.592548	2018-08-10 12:33:47.592548	\N	140	277	f	\N	\N
281	370	\N	Nothing	2018-08-13 02:23:00	\N	\N	\N	\N	t	f	2018-08-13 02:24:54.586528	2018-08-13 02:24:54.586528	\N	264	267	f	\N	\N
280	398	\N		2018-08-11 12:28:00	\N	\N	\N	\N	t	f	2018-08-10 12:43:13.352833	2018-08-13 13:03:29.457156	\N	140	277	t	\N	\N
283	198	\N	\N	2018-07-23 22:29:00	\N	\N	\N	\N	t	f	2018-08-13 15:25:58.157057	2018-08-13 15:25:58.157057	\N	248	239	f	\N	\N
284	409	\N	\N	2018-08-13 17:00:00	\N	\N	\N	\N	t	f	2018-08-13 16:14:24.379998	2018-08-13 16:14:24.379998	1	279	278	f	\N	\N
285	411	\N		2018-08-13 17:33:00	\N	\N	\N	\N	t	f	2018-08-13 16:34:38.704287	2018-08-13 16:34:38.704287	1	140	281	f	\N	\N
287	415	\N		2018-08-16 11:54:00	\N	\N	\N	\N	t	f	2018-08-15 11:54:44.699518	2018-08-15 11:54:44.699518	\N	140	139	f	\N	\N
288	416	\N	Gh	2018-08-16 12:02:00	\N	\N	\N	\N	t	f	2018-08-15 12:02:46.582068	2018-08-15 12:02:46.582068	\N	140	139	f	\N	\N
291	442	\N		\N	\N		36	\N	t	f	2018-08-17 12:37:34.264887	2018-08-17 12:37:34.264887	1	\N	286	f	\N	\N
292	443	\N	<p>A headache</p>	2018-08-17 12:43:00	\N		36	\N	t	f	2018-08-17 12:44:40.897312	2018-08-17 12:44:40.897312	3	\N	286	f	\N	\N
293	446	\N	<p>Checkup</p>	2018-08-18 15:05:00	\N	\N	\N	\N	t	f	2018-08-17 15:20:22.796131	2018-08-17 15:20:22.796131	1	285	286	f	\N	\N
286	414	\N		2018-08-16 11:20:00	\N	\N	\N	\N	t	f	2018-08-15 11:21:24.876999	2018-08-15 18:08:10.009691	\N	140	139	f	\N	\N
289	396	\N	\N	2018-08-10 12:22:00	\N	\N	\N	\N	t	f	2018-08-16 18:17:44.855248	2018-08-16 18:17:44.855248	\N	140	272	f	\N	\N
290	441	9	<p><span style="font-family: verdana, arial, helvetica, sans-serif; font-size: 13px; background-color: #f1f1f1;">A headache,</span></p>\r\n<p><span style="font-family: verdana, arial, helvetica, sans-serif; font-size: 13px; background-color: #f1f1f1;">fever</span></p>	2018-08-21 00:00:00	\N	<p>This appointment for a beneficiary call Enam</p>	36	\N	t	f	2018-08-17 12:28:39.060242	2018-08-17 12:28:39.060242	3	\N	286	f	\N	\N
294	447	\N	\N	2018-08-18 17:03:00	\N	\N	\N	\N	t	f	2018-08-17 17:08:24.640016	2018-08-17 17:08:24.640016	1	285	286	f	\N	\N
295	449	\N	Headache	2018-08-18 17:54:00	\N	\N	\N	\N	t	f	2018-08-17 17:57:50.889536	2018-08-17 17:57:50.889536	\N	285	286	f	\N	\N
296	450	\N	Checkup	2018-08-18 18:03:00	\N	\N	\N	\N	t	f	2018-08-17 18:04:43.05559	2018-08-17 18:04:43.05559	\N	285	286	f	\N	\N
297	451	\N	Checkups	2018-08-18 18:07:00	\N	\N	\N	\N	t	f	2018-08-17 18:08:44.094975	2018-08-17 18:08:44.094975	1	285	286	f	\N	\N
298	321	\N	\N	2018-07-25 16:10:00	\N	\N	\N	\N	t	f	2018-08-19 21:09:09.97629	2018-08-19 21:09:09.97629	\N	264	247	f	\N	\N
299	320	\N	\N	2018-07-25 16:13:00	\N	\N	\N	\N	t	f	2018-08-19 21:21:14.363979	2018-08-19 21:21:14.363979	\N	264	247	f	\N	\N
300	444	\N	Hunger	2018-08-17 13:59:00	\N	\N	\N	\N	t	f	2018-08-19 21:21:26.53013	2018-08-19 21:21:26.53013	\N	264	286	f	\N	\N
301	292	\N	None	2018-08-20 21:36:00	\N	\N	\N	\N	t	f	2018-08-19 21:38:19.794326	2018-08-19 21:38:19.794326	\N	264	247	f	\N	\N
282	369	\N	Acne	2018-08-13 02:27:00	\N	\N	\N	\N	t	f	2018-08-13 02:28:39.182271	2018-09-17 11:05:29.441113	\N	264	267	t	\N	\N
229	335	\N	Free	2018-07-24 12:15:00	\N	\N	\N	\N	t	f	2018-07-24 12:24:43.898018	2018-09-19 12:03:58.474599	\N	264	262	t	\N	\N
302	311	\N	Headache	2018-08-21 21:41:00	\N	\N	\N	\N	t	f	2018-08-19 21:41:41.420665	2018-08-19 21:41:41.420665	\N	264	262	f	\N	\N
303	284	\N	noen	2018-08-22 21:43:00	\N	\N	\N	\N	t	f	2018-08-19 21:48:57.930881	2018-08-19 21:48:57.930881	\N	264	250	f	\N	\N
304	82	\N	\N	2018-08-20 21:59:00	\N	\N	\N	\N	t	f	2018-08-19 22:00:34.003079	2018-08-19 22:00:34.003079	\N	264	162	f	\N	\N
305	255	\N	<p>irorp[p</p>\r\n<p>[]t</p>	2018-07-25 16:11:00	\N	\N	\N	\N	t	f	2018-08-19 22:08:02.021718	2018-08-19 22:08:02.021718	\N	264	256	f	\N	\N
306	469	8	<p>headaches</p>	2018-08-20 17:04:00	\N		158	\N	t	f	2018-08-20 17:05:11.568207	2018-08-20 17:05:11.568207	1	\N	290	f	\N	\N
307	470	\N	<p>hhgfdjilijgf</p>	2018-08-20 17:07:00	\N		158	\N	t	f	2018-08-20 17:07:57.535559	2018-08-20 17:07:57.535559	1	\N	290	f	\N	\N
308	464	1		2018-08-22 16:15:00	\N		158	\N	t	f	2018-08-22 16:15:21.275746	2018-08-22 16:15:21.275746	1	\N	289	f	\N	\N
309	465	\N		2018-08-22 16:15:00	\N		158	\N	t	f	2018-08-22 16:17:09.540152	2018-08-22 16:17:09.540152	1	\N	289	f	\N	\N
310	466	\N		2018-08-23 16:18:00	\N		158	\N	t	f	2018-08-22 16:18:10.719249	2018-08-22 16:18:10.719249	1	\N	289	f	\N	\N
312	467	\N	Headache	2018-08-23 16:28:00	\N	\N	\N	\N	t	f	2018-08-22 16:42:59.177551	2018-08-22 17:02:45.237853	\N	291	289	t	\N	\N
311	468	\N	Old age	2018-08-22 16:29:00	\N	\N	\N	\N	t	f	2018-08-22 16:39:08.357324	2018-08-22 17:06:30.61031	1	291	289	t	\N	\N
313	474	\N	No	2018-08-23 17:22:00	\N	\N	\N	\N	t	f	2018-08-22 17:24:02.381988	2018-08-22 17:25:35.068119	1	291	289	t	\N	\N
314	429	\N	Gfdg	2018-08-24 14:32:00	\N	\N	\N	\N	t	f	2018-08-24 14:35:14.507917	2018-08-24 14:36:57.778941	3	248	247	t	\N	\N
315	427	\N	Ghgfd	2018-08-24 14:40:00	\N	\N	\N	\N	t	f	2018-08-24 14:41:43.077614	2018-08-24 14:41:43.077614	\N	248	247	f	\N	\N
247	356	\N	<p>nothing</p>	2018-08-09 17:01:00	\N	\N	\N	\N	t	f	2018-08-08 17:05:07.205725	2018-08-24 14:42:40.230438	\N	264	247	t	\N	\N
316	475	\N	\N	2018-08-28 10:45:00	\N	\N	\N	\N	t	f	2018-08-27 10:48:05.674159	2018-08-27 10:48:05.674159	1	298	289	f	\N	\N
317	475	\N	\N	2018-08-27 15:16:00	\N	\N	\N	\N	t	f	2018-08-27 15:19:07.283261	2018-08-27 15:19:07.283261	1	291	289	f	\N	\N
318	459	\N	\N	2018-08-27 11:09:00	\N	\N	\N	\N	t	f	2018-08-27 15:21:57.147093	2018-08-27 15:21:57.147093	\N	298	286	f	\N	\N
319	480	\N		2018-12-08 09:20:00	\N		158	\N	t	f	2018-09-05 15:47:18.106472	2018-09-05 15:47:18.106472	2	\N	300	f	\N	\N
320	485	3		2018-09-07 08:51:00	\N		158	\N	t	f	2018-09-07 16:51:53.321578	2018-09-07 16:51:53.321578	2	\N	302	f	\N	\N
321	479	3		2018-09-10 12:48:00	\N		158	\N	t	f	2018-09-10 11:48:16.643094	2018-09-10 11:48:16.643094	2	\N	300	f	\N	\N
322	489	1		2018-09-10 18:41:00	\N		158	\N	t	f	2018-09-10 13:41:59.747156	2018-09-10 13:41:59.747156	1	\N	304	f	\N	\N
323	490	\N		2018-09-10 17:43:00	\N		158	\N	t	f	2018-09-10 13:43:34.849155	2018-09-10 13:43:34.849155	1	\N	304	f	\N	\N
324	491	\N		2018-09-10 14:00:00	\N		158	\N	t	f	2018-09-10 13:44:51.096397	2018-09-10 13:44:51.096397	1	\N	304	f	\N	\N
327	492	\N	None	2018-09-10 15:51:00	\N	\N	\N	\N	t	f	2018-09-10 15:51:29.812244	2018-09-10 16:01:15.214376	\N	303	304	t	\N	\N
326	493	\N	None	2018-09-10 16:52:00	\N	\N	\N	\N	t	f	2018-09-10 15:50:49.821595	2018-09-10 16:03:24.947918	\N	303	304	t	\N	\N
325	494	\N	Good	2018-09-11 17:52:00	\N	\N	\N	\N	t	f	2018-09-10 15:50:05.9257	2018-09-10 16:03:57.660849	1	303	304	t	\N	\N
329	499	\N	\N	2018-09-11 18:23:00	\N	\N	\N	\N	t	f	2018-09-10 18:25:28.570043	2018-09-10 18:29:09.431544	\N	303	304	t	\N	\N
332	505	\N		2018-09-11 15:40:00	\N		158	\N	t	f	2018-09-11 14:40:41.044498	2018-09-11 14:40:41.044498	1	\N	306	f	\N	\N
333	503	\N		2018-09-11 15:42:00	\N		158	\N	t	f	2018-09-11 14:42:28.270396	2018-09-11 14:42:28.270396	1	\N	306	f	\N	\N
334	501	8		2018-09-11 15:43:00	\N		158	\N	t	f	2018-09-11 14:43:57.898656	2018-09-11 14:43:57.898656	1	\N	306	f	\N	\N
335	502	\N		2018-09-11 16:52:00	\N		158	\N	t	f	2018-09-11 15:54:14.123401	2018-09-11 15:54:14.123401	1	\N	306	f	\N	\N
336	504	\N	Stomach pains	2018-09-13 17:33:00	\N	\N	\N	\N	t	f	2018-09-13 18:06:19.142057	2018-09-13 18:06:19.142057	\N	308	306	f	\N	\N
337	454	\N	Fdasf	2018-09-13 15:36:00	\N	\N	\N	\N	t	f	2018-09-13 18:06:40.709123	2018-09-13 18:06:40.709123	3	308	286	f	\N	\N
338	515	\N	Paddy 4	2018-09-15 19:15:00	\N	\N	\N	\N	t	f	2018-09-15 19:38:49.434235	2018-09-15 19:38:49.434235	\N	298	289	f	\N	\N
339	514	\N	Paddy 4	2018-09-15 19:15:00	\N	\N	\N	\N	t	f	2018-09-15 19:42:40.446395	2018-09-15 19:42:40.446395	\N	298	289	f	\N	\N
340	512	\N	Ok	2018-09-15 19:30:00	\N	\N	\N	\N	t	f	2018-09-15 19:45:42.835585	2018-09-15 19:45:42.835585	\N	291	289	f	\N	\N
341	513	\N	Old age	2018-09-15 19:29:00	\N	\N	\N	\N	t	f	2018-09-15 19:46:01.908898	2018-09-15 19:46:01.908898	1	291	289	f	\N	\N
342	455	\N	Gfag	2018-08-19 21:35:00	\N	\N	\N	\N	t	f	2018-09-17 10:39:25.017126	2018-09-17 10:39:25.017126	\N	264	286	f	\N	\N
343	354	\N	Mental	2018-08-08 23:26:00	\N	\N	\N	\N	t	f	2018-09-17 10:39:45.168325	2018-09-17 10:39:45.168325	\N	264	234	f	\N	\N
344	528	\N	\N	2018-09-17 12:32:00	\N	\N	\N	\N	t	f	2018-09-17 12:40:53.817124	2018-09-17 12:40:53.817124	1	319	321	f	\N	\N
345	529	\N	Stress	2018-09-17 12:46:00	\N	\N	\N	\N	t	f	2018-09-17 12:50:30.296693	2018-09-17 12:50:30.296693	\N	319	321	f	\N	\N
346	477	\N	Hu	2018-08-28 15:39:00	\N	\N	\N	\N	t	f	2018-09-17 16:15:11.961498	2018-09-17 16:15:11.961498	\N	291	289	f	\N	\N
347	531	1	<p>severe headaches</p>	2018-09-17 18:08:00	\N		158	\N	t	f	2018-09-17 18:12:18.18927	2018-09-17 18:12:18.18927	1	\N	322	f	\N	\N
348	532	\N		2018-09-18 18:25:00	\N		158	\N	t	f	2018-09-17 18:26:19.4969	2018-09-17 18:26:19.4969	1	\N	322	f	\N	\N
349	533	\N		2018-09-18 18:27:00	\N		158	\N	t	f	2018-09-17 18:28:03.102134	2018-09-17 18:28:03.102134	1	\N	322	f	\N	\N
350	520	\N	<p>take paracetamol 5 times a day</p>	2018-09-30 19:28:00	\N	<p>take all the prescriptions</p>	158	\N	t	f	2018-09-17 18:29:41.339065	2018-09-17 18:29:41.339065	1	\N	272	f	\N	\N
352	534	\N	Headache	2018-09-18 18:28:00	\N	\N	\N	\N	t	f	2018-09-17 18:39:23.647319	2018-09-17 18:42:39.054406	\N	323	322	t	\N	\N
353	537	\N	Tired	2018-09-18 18:47:00	\N	\N	\N	\N	t	f	2018-09-17 18:50:33.043673	2018-09-17 18:52:19.752404	\N	323	322	t	\N	\N
351	535	\N	Medical problems	2018-09-18 18:29:00	\N	\N	\N	\N	t	f	2018-09-17 18:38:55.051567	2018-09-17 18:53:02.123228	1	323	322	t	\N	\N
354	536	\N	\N	2018-09-18 18:53:00	\N	\N	\N	\N	t	f	2018-09-17 18:58:17.535333	2018-09-17 18:58:17.535333	1	323	322	f	\N	\N
355	538	\N	Home	2018-09-19 08:07:00	\N	\N	\N	\N	t	f	2018-09-17 19:14:57.14764	2018-09-17 19:14:57.14764	\N	323	322	f	\N	\N
356	540	\N	Home	2018-09-18 19:08:00	\N	\N	\N	\N	t	f	2018-09-17 19:15:05.371077	2018-09-17 19:15:05.371077	\N	323	322	f	\N	\N
357	541	\N	Headache	2018-09-18 19:09:00	\N	\N	\N	\N	t	f	2018-09-17 19:15:14.800484	2018-09-17 19:15:14.800484	1	323	322	f	\N	\N
358	542	\N	\N	2018-09-18 19:10:00	\N	\N	\N	\N	t	f	2018-09-17 19:16:57.331581	2018-09-17 19:20:22.078196	\N	323	322	t	\N	\N
359	539	\N	Clemence is annoying	2018-10-01 20:04:00	\N	\N	\N	\N	t	f	2018-09-18 14:23:50.888711	2018-09-18 14:23:50.888711	\N	230	272	f	\N	\N
361	546	\N	No medical problem	2018-09-18 17:35:00	\N	\N	\N	\N	t	f	2018-09-18 17:42:16.498486	2018-09-18 17:42:16.498486	\N	323	322	f	\N	\N
362	548	\N	\N	2018-09-18 18:06:00	\N	\N	\N	\N	t	f	2018-09-18 18:33:36.001049	2018-09-18 18:34:55.577017	\N	323	322	t	\N	\N
363	556	\N	\N	2018-09-18 22:58:00	\N	\N	\N	\N	t	f	2018-09-18 20:01:00.622901	2018-09-18 20:01:00.622901	1	258	325	f	\N	\N
364	412	\N	Headach	2018-08-13 17:34:00	\N	\N	\N	\N	t	f	2018-09-18 20:01:12.624828	2018-09-18 20:05:08.337972	\N	258	257	t	\N	\N
365	553	1	<p>qeweeret</p>	2018-09-20 23:09:00	\N	<p>bgvhhj</p>	145	\N	t	f	2018-09-18 20:09:42.91332	2018-09-18 20:09:42.91332	1	\N	325	f	\N	\N
366	555	\N	<p>kjuhik</p>	2018-09-21 23:11:00	\N	<p>ujyi;</p>	145	\N	t	f	2018-09-18 20:11:18.756419	2018-09-18 20:11:18.756419	1	\N	325	f	\N	\N
368	558	\N	Wdk overdose 	2018-09-18 23:07:00	\N	\N	\N	\N	t	f	2018-09-18 20:12:12.532926	2018-09-18 20:19:05.922196	\N	258	325	t	\N	\N
367	557	\N	Weak knees 	2018-09-20 23:07:00	\N	\N	\N	\N	t	f	2018-09-18 20:12:04.418747	2018-09-18 20:20:34.37232	\N	258	325	t	\N	\N
369	554	\N	<p>zxcdfgb</p>	2018-09-20 23:24:00	\N	<p>s\\cdsgd</p>	145	\N	t	f	2018-09-18 20:24:37.165762	2018-09-18 20:24:37.165762	1	\N	325	f	\N	\N
370	570	\N	restless	2018-09-19 15:34:00	\N	\N	\N	\N	t	f	2018-09-19 15:36:18.038061	2018-09-19 15:38:19.505961	1	323	322	t	\N	\N
371	572	\N	fdafdsa	2018-09-19 17:32:00	\N	\N	\N	\N	t	f	2018-09-19 17:33:04.215333	2018-09-19 17:39:56.23315	1	323	322	t	\N	\N
372	547	\N	\N	2018-09-18 18:06:00	\N	\N	\N	\N	t	f	2018-09-19 19:04:13.339441	2018-09-19 19:36:18.942213	\N	323	322	t	\N	\N
373	580	\N	<p>feels weak</p>	2018-09-21 11:21:00	\N	<p>sugar level too</p>	158	\N	t	f	2018-09-20 11:22:14.779253	2018-09-20 11:22:14.779253	1	\N	322	f	\N	\N
374	579	\N	<p>fine</p>	2018-09-21 11:23:00	\N	<p>standard</p>	158	\N	t	f	2018-09-20 11:23:38.026392	2018-09-20 11:23:38.026392	1	\N	322	f	\N	\N
375	578	\N		2018-09-21 11:24:00	\N		158	\N	t	f	2018-09-20 11:24:27.018978	2018-09-20 11:24:27.018978	1	\N	322	f	\N	\N
376	577	\N	<p>detailed</p>	2018-09-21 11:24:00	\N	<p>comment</p>	158	\N	t	f	2018-09-20 11:25:04.342987	2018-09-20 11:25:04.342987	1	\N	322	f	\N	\N
377	576	4		2018-09-21 11:25:00	\N		158	\N	t	f	2018-09-20 11:25:39.901854	2018-09-20 11:25:39.901854	1	\N	322	f	\N	\N
378	575	8		2018-09-22 11:26:00	\N		158	\N	t	f	2018-09-20 11:26:15.260593	2018-09-20 11:26:15.260593	1	\N	322	f	\N	\N
379	581	\N	Swollen face	2018-09-21 11:21:00	\N	\N	\N	\N	t	f	2018-09-20 12:04:03.264436	2018-09-20 12:04:03.264436	\N	323	322	f	\N	\N
384	586	\N	None	2018-09-21 11:16:00	\N	\N	\N	\N	t	f	2018-09-20 12:16:18.907861	2018-09-20 12:16:18.907861	\N	323	322	f	\N	\N
385	588	\N	Tired	2018-09-21 11:15:00	\N	\N	\N	\N	t	f	2018-09-20 12:18:25.857795	2018-09-20 12:18:25.857795	\N	323	322	f	\N	\N
386	590	\N	None	2018-09-21 11:13:00	\N	\N	\N	\N	t	f	2018-09-20 12:24:21.415568	2018-09-20 12:24:21.415568	1	323	322	f	\N	\N
380	582	\N	Check up	2018-09-21 11:19:00	\N	\N	\N	\N	t	f	2018-09-20 12:04:20.140654	2018-09-20 12:31:10.763267	\N	323	322	t	\N	\N
382	584	\N	None	2018-09-21 11:18:00	\N	\N	\N	\N	t	f	2018-09-20 12:05:26.418456	2018-09-20 12:32:57.405663	1	323	322	t	\N	\N
383	585	\N	I want some enquiries	2018-09-27 11:17:00	\N	\N	\N	\N	t	f	2018-09-20 12:16:06.15237	2018-09-20 13:41:59.080648	\N	323	322	t	\N	\N
389	592	\N	\N	2018-09-21 10:46:00	\N	\N	\N	\N	t	f	2018-09-20 12:25:00.095273	2018-09-20 13:43:45.625345	\N	323	322	t	\N	\N
390	614	\N	Anencephaly	2018-09-26 09:00:00	\N	\N	\N	\N	t	f	2018-09-25 06:04:25.923023	2018-09-25 06:17:38.713797	\N	258	325	t	\N	\N
391	615	\N	Sick	2018-09-26 16:02:00	\N	\N	\N	\N	t	f	2018-09-25 06:04:37.386663	2018-09-25 06:25:50.939488	\N	258	325	t	\N	\N
392	616	\N	Ill	2018-09-27 09:06:00	\N	\N	\N	\N	t	f	2018-09-25 06:11:27.534379	2018-09-25 06:28:41.989709	1	258	325	t	\N	\N
393	617	\N	\N	2018-09-29 09:07:00	\N	\N	\N	\N	t	f	2018-09-25 06:11:53.674669	2018-09-25 06:30:56.446643	\N	258	325	t	\N	\N
388	593	\N	\N	2018-09-21 11:07:00	\N	\N	\N	\N	t	f	2018-09-20 12:24:49.356741	2018-09-25 09:20:43.032623	\N	323	322	t	\N	\N
394	621	\N	\N	2018-09-26 09:20:00	\N	\N	\N	\N	t	f	2018-09-25 09:23:26.758072	2018-09-25 09:29:31.844998	\N	230	272	t	\N	\N
387	591	\N	\N	2018-09-21 11:08:00	\N	\N	\N	\N	t	f	2018-09-20 12:24:38.298061	2018-09-25 09:32:10.979756	\N	323	322	t	\N	\N
396	622	\N	\N	2018-09-26 10:56:00	\N	\N	\N	\N	t	f	2018-09-25 10:03:10.995074	2018-09-25 10:12:41.624892	\N	230	272	t	\N	\N
397	600	\N		2018-09-26 10:14:00	\N		158	\N	t	f	2018-09-25 10:14:16.076935	2018-09-25 10:14:16.076935	1	\N	322	f	\N	\N
398	599	\N		2018-09-25 10:15:00	\N		158	\N	t	f	2018-09-25 10:15:16.55538	2018-09-25 10:15:16.55538	1	\N	322	f	\N	\N
399	598	8		2018-09-25 10:15:00	\N		158	\N	t	f	2018-09-25 10:16:06.039043	2018-09-25 10:16:06.039043	1	\N	322	f	\N	\N
400	573	1		2018-09-25 10:17:00	\N		158	\N	t	f	2018-09-25 10:17:31.309702	2018-09-25 10:17:31.309702	1	\N	322	f	\N	\N
395	478	\N	\N	2018-09-10 18:16:00	\N	\N	\N	\N	t	f	2018-09-25 09:24:05.675652	2018-09-25 10:50:36.107438	\N	230	272	t	\N	\N
401	566	\N	\N	2018-09-26 10:25:00	\N	\N	\N	\N	t	f	2018-09-25 10:54:10.248209	2018-09-25 10:55:13.195629	\N	323	322	t	\N	\N
402	623	1		2018-09-27 08:28:00	\N		158	\N	t	f	2018-09-27 08:28:51.369828	2018-09-27 08:28:51.369828	1	\N	272	f	\N	\N
403	624	\N		2018-09-28 08:36:00	\N		158	\N	t	f	2018-09-27 08:36:38.855222	2018-09-27 08:36:38.855222	1	\N	272	f	\N	\N
404	625	\N		2018-09-27 08:37:00	\N		158	\N	t	f	2018-09-27 08:37:11.870418	2018-09-27 08:37:11.870418	1	\N	272	f	\N	\N
405	632	\N	\N	2018-09-28 08:41:00	\N	\N	\N	\N	t	f	2018-09-27 16:03:09.485132	2018-09-27 16:03:09.485132	\N	230	272	f	\N	\N
406	631	\N	\N	2018-09-28 08:41:00	\N	\N	\N	\N	t	f	2018-09-27 16:03:28.620791	2018-09-27 16:03:28.620791	\N	230	272	f	\N	\N
407	629	\N	I am okay	2018-09-27 08:38:00	\N	\N	\N	\N	t	f	2018-09-27 16:03:44.354877	2018-09-27 16:03:44.354877	\N	230	272	f	\N	\N
408	628	\N	Too much sweet	2018-09-27 08:38:00	\N	\N	\N	\N	t	f	2018-09-27 16:04:00.046486	2018-09-27 16:04:00.046486	\N	230	272	f	\N	\N
409	521	\N	Headache	2018-09-30 19:49:00	\N	\N	\N	\N	t	f	2018-09-27 16:04:28.71643	2018-09-27 16:04:28.71643	\N	230	272	f	\N	\N
410	627	\N	Emotional	2018-09-28 08:37:00	\N	\N	\N	\N	t	f	2018-09-27 16:05:11.150533	2018-09-27 16:05:11.150533	1	230	272	f	\N	\N
411	626	\N	Irritating	2018-09-27 08:37:00	\N	\N	\N	\N	t	f	2018-09-27 16:05:29.575014	2018-09-27 16:05:29.575014	\N	230	272	f	\N	\N
412	634	\N		2018-09-28 16:15:00	\N		158	\N	t	f	2018-09-27 16:15:40.908401	2018-09-27 16:15:40.908401	1	\N	322	f	\N	\N
413	635	\N		2018-09-28 16:18:00	\N		158	\N	t	f	2018-09-27 16:18:41.77562	2018-09-27 16:18:41.77562	1	\N	272	f	\N	\N
414	636	\N		2018-09-30 16:26:00	\N		158	\N	t	f	2018-09-27 16:26:46.75748	2018-09-27 16:26:46.75748	1	\N	272	f	\N	\N
415	637	\N	<p>detailed&nbsp;</p>	2018-09-29 18:19:00	\N	<p>deliver to me only&nbsp;</p>	145	\N	t	f	2018-09-28 15:20:14.123458	2018-09-28 15:20:14.123458	1	\N	257	f	\N	\N
416	638	\N		2018-09-29 03:22:00	\N		145	\N	t	f	2018-09-28 15:22:41.388528	2018-09-28 15:22:41.388528	1	\N	257	f	\N	\N
417	639	\N		2018-09-28 18:24:00	\N		145	\N	t	f	2018-09-28 15:24:23.219821	2018-09-28 15:24:23.219821	1	\N	257	f	\N	\N
418	642	\N	Fddd	2018-09-28 18:29:00	\N	\N	\N	\N	t	f	2018-09-28 15:31:22.801078	2018-09-28 15:31:22.801078	\N	258	257	f	\N	\N
421	643	\N	Sdddd	2018-09-28 18:29:00	\N	\N	\N	\N	t	f	2018-09-28 15:32:36.184459	2018-09-30 12:20:27.758853	\N	258	257	t	\N	\N
419	640	\N	Headache 	2018-09-28 18:25:00	\N	\N	\N	\N	t	f	2018-09-28 15:31:55.995968	2018-09-30 12:20:54.258427	\N	258	257	t	\N	\N
420	641	\N	Hkkw 	2018-09-28 18:27:00	\N	\N	\N	\N	t	f	2018-09-28 15:32:19.069702	2018-09-30 12:21:27.940116	1	258	257	t	\N	\N
426	655	\N		2018-11-13 15:26:00	\N		36	\N	t	f	2018-11-12 15:26:55.15499	2018-11-12 15:26:55.15499	1	\N	139	f	\N	\N
381	583	\N	Pregnant 	2018-09-22 11:18:00	\N	\N	\N	\N	t	f	2018-09-20 12:04:48.392131	2018-10-10 21:11:15.441268	1	323	322	t	\N	\N
360	545	\N	Medical appointment	2018-09-18 17:35:00	\N	\N	\N	\N	t	f	2018-09-18 17:41:11.86641	2018-10-10 21:30:52.496181	1	323	322	t	\N	\N
422	604	\N	Hi	2018-09-25 10:08:00	\N	\N	\N	\N	t	f	2018-10-10 21:37:04.300643	2018-10-10 21:37:04.300643	\N	323	322	f	\N	\N
430	654	\N		2018-11-13 22:13:00	\N		36	\N	t	f	2018-11-12 22:13:50.537813	2018-11-12 22:13:50.537813	1	\N	322	f	\N	\N
431	653	\N		2018-11-13 22:27:00	\N		36	\N	t	f	2018-11-12 22:28:05.268587	2018-11-12 22:28:05.268587	1	\N	322	f	\N	\N
432	653	\N		2018-11-13 22:27:00	\N		36	\N	t	f	2018-11-12 22:28:33.412854	2018-11-12 22:28:33.412854	1	\N	322	f	\N	\N
433	653	\N		2018-11-13 22:27:00	\N		36	\N	t	f	2018-11-12 22:28:38.151361	2018-11-12 22:28:38.151361	1	\N	322	f	\N	\N
434	653	\N		2018-11-13 22:27:00	\N		36	\N	t	f	2018-11-12 22:28:48.257342	2018-11-12 22:28:48.257342	1	\N	322	f	\N	\N
435	646	\N		2018-11-13 22:28:00	\N		36	\N	t	f	2018-11-12 22:29:15.095	2018-11-12 22:29:15.095	1	\N	322	f	\N	\N
436	646	\N		2018-11-13 22:28:00	\N		36	\N	t	f	2018-11-12 22:29:48.008957	2018-11-12 22:29:48.008957	1	\N	322	f	\N	\N
437	649	\N		2018-11-15 22:40:00	\N		36	\N	t	f	2018-11-12 22:41:01.899515	2018-11-12 22:41:01.899515	1	\N	322	f	\N	\N
438	647	\N		2018-11-13 22:43:00	\N		36	\N	t	f	2018-11-12 22:44:32.305876	2018-11-12 22:44:32.305876	1	\N	322	f	\N	\N
439	652	\N		2018-11-13 22:54:00	\N		36	\N	t	f	2018-11-12 22:54:52.264554	2018-11-12 22:54:52.264554	1	\N	322	f	\N	\N
440	651	\N		2018-11-15 22:55:00	\N		36	\N	t	f	2018-11-12 22:56:13.734985	2018-11-12 22:56:13.734985	1	\N	322	f	\N	\N
441	650	\N		2018-11-13 22:57:00	\N		36	\N	t	f	2018-11-12 22:58:11.292638	2018-11-12 22:58:11.292638	1	\N	322	f	\N	\N
442	648	\N		2018-11-13 22:58:00	\N		36	\N	t	f	2018-11-12 22:59:18.193919	2018-11-12 22:59:18.193919	1	\N	322	f	\N	\N
443	645	\N		2018-11-13 22:59:00	\N		36	\N	t	f	2018-11-12 23:00:30.54183	2018-11-12 23:00:30.54183	1	\N	322	f	\N	\N
447	606	\N		2018-11-13 23:12:00	\N		36	\N	t	f	2018-11-12 23:13:00.967312	2018-11-12 23:13:00.967312	1	\N	257	f	\N	\N
448	544	\N		2018-11-13 23:17:00	\N		36	\N	t	f	2018-11-12 23:17:49.251585	2018-11-12 23:17:49.251585	1	\N	272	f	\N	\N
449	544	\N		2018-11-13 23:17:00	\N		36	\N	t	f	2018-11-12 23:18:09.904377	2018-11-12 23:18:09.904377	1	\N	272	f	\N	\N
450	527	\N		2018-11-13 23:20:00	\N		36	\N	t	f	2018-11-12 23:21:37.49398	2018-11-12 23:21:37.49398	1	\N	321	f	\N	\N
451	510	\N		2018-11-13 23:22:00	\N		36	\N	t	f	2018-11-12 23:23:13.314011	2018-11-12 23:23:13.314011	1	\N	289	f	\N	\N
452	484	\N		2018-11-13 23:24:00	\N		36	\N	t	f	2018-11-12 23:24:55.502437	2018-11-12 23:24:55.502437	1	\N	272	f	\N	\N
453	473	\N		2018-11-14 23:27:00	\N		36	\N	t	f	2018-11-12 23:27:34.243354	2018-11-12 23:27:34.243354	1	\N	290	f	\N	\N
454	461	\N		2018-11-13 23:30:00	\N		36	\N	t	f	2018-11-12 23:31:24.318727	2018-11-12 23:31:24.318727	1	\N	286	f	\N	\N
455	461	\N		2018-11-13 23:30:00	\N		36	\N	t	f	2018-11-12 23:32:20.985901	2018-11-12 23:32:20.985901	1	\N	286	f	\N	\N
456	461	\N		2018-11-13 23:30:00	\N		36	\N	t	f	2018-11-12 23:33:12.849273	2018-11-12 23:33:12.849273	1	\N	286	f	\N	\N
457	438	\N		2018-11-13 23:38:00	\N		36	\N	t	f	2018-11-12 23:38:51.289197	2018-11-12 23:38:51.289197	1	\N	247	f	\N	\N
458	436	\N		2018-11-14 23:42:00	\N		36	\N	t	f	2018-11-12 23:42:49.53729	2018-11-12 23:42:49.53729	1	\N	247	f	\N	\N
459	420	\N		2018-11-14 23:49:00	\N		36	\N	t	f	2018-11-12 23:56:16.521256	2018-11-12 23:56:16.521256	1	\N	284	f	\N	\N
460	410	\N		2018-11-14 00:02:00	\N		36	\N	t	f	2018-11-13 00:03:28.290406	2018-11-13 00:03:28.290406	1	\N	247	f	\N	\N
461	407	\N		2018-11-14 00:05:00	\N		36	\N	t	f	2018-11-13 00:06:07.443472	2018-11-13 00:06:07.443472	1	\N	278	f	\N	\N
462	405	\N		2018-11-14 00:09:00	\N		36	\N	t	f	2018-11-13 00:09:46.764932	2018-11-13 00:09:46.764932	1	\N	272	f	\N	\N
463	392	\N		2018-11-14 00:10:00	\N		36	\N	t	f	2018-11-13 00:11:37.74455	2018-11-13 00:11:37.74455	1	\N	276	f	\N	\N
464	382	\N		2018-11-14 00:12:00	\N		36	\N	t	f	2018-11-13 00:13:10.431629	2018-11-13 00:13:10.431629	1	\N	276	f	\N	\N
465	381	\N		2018-11-14 00:14:00	\N		36	\N	t	f	2018-11-13 00:14:45.321077	2018-11-13 00:14:45.321077	1	\N	276	f	\N	\N
466	366	\N		2018-11-14 00:18:00	\N		36	\N	t	f	2018-11-13 00:18:42.282685	2018-11-13 00:18:42.282685	1	\N	267	f	\N	\N
467	342	\N		2018-11-13 00:26:00	\N		36	\N	t	f	2018-11-13 00:27:37.079543	2018-11-13 00:27:37.079543	1	\N	267	f	\N	\N
468	340	\N		2018-11-14 00:31:00	\N		36	\N	t	f	2018-11-13 00:31:48.566979	2018-11-13 00:31:48.566979	1	\N	262	f	\N	\N
469	324	\N		2018-11-14 00:34:00	\N		36	\N	t	f	2018-11-13 00:34:59.101271	2018-11-13 00:34:59.101271	1	\N	247	f	\N	\N
470	323	\N		2018-11-14 00:35:00	\N		36	\N	t	f	2018-11-13 00:35:50.277382	2018-11-13 00:35:50.277382	1	\N	247	f	\N	\N
471	317	\N		2018-11-15 00:36:00	\N		36	\N	t	f	2018-11-13 00:37:03.985327	2018-11-13 00:37:03.985327	1	\N	257	f	\N	\N
472	309	\N		2018-11-14 00:38:00	\N		36	\N	t	f	2018-11-13 00:39:18.725695	2018-11-13 00:39:18.725695	1	\N	262	f	\N	\N
473	307	\N		2018-11-14 00:40:00	\N		36	\N	t	f	2018-11-13 00:40:51.343369	2018-11-13 00:40:51.343369	1	\N	262	f	\N	\N
474	306	\N		2018-11-14 00:43:00	\N		36	\N	t	f	2018-11-13 00:43:48.527644	2018-11-13 00:43:48.527644	1	\N	262	f	\N	\N
475	291	\N		2018-11-14 00:44:00	\N		36	\N	t	f	2018-11-13 00:45:26.379053	2018-11-13 00:45:26.379053	1	\N	251	f	\N	\N
476	252	\N		2018-11-14 00:45:00	\N		36	\N	t	f	2018-11-13 00:46:21.845983	2018-11-13 00:46:21.845983	1	\N	139	f	\N	\N
477	239	\N		2018-11-14 00:46:00	\N		36	\N	t	f	2018-11-13 00:47:06.927595	2018-11-13 00:47:06.927595	1	\N	254	f	\N	\N
478	151	\N		2018-11-14 00:47:00	\N		36	\N	t	f	2018-11-13 00:47:55.627699	2018-11-13 00:47:55.627699	1	\N	146	f	\N	\N
479	110	\N		2018-11-14 00:49:00	\N		36	\N	t	f	2018-11-13 00:49:49.137687	2018-11-13 00:49:49.137687	1	\N	137	f	\N	\N
480	92	\N		2018-11-13 00:50:00	\N		36	\N	t	f	2018-11-13 00:50:55.473318	2018-11-13 00:50:55.473318	1	\N	137	f	\N	\N
481	29	\N		2018-11-14 00:51:00	\N		36	\N	t	f	2018-11-13 00:52:30.038045	2018-11-13 00:52:30.038045	1	\N	137	f	\N	\N
482	8	\N		2018-11-14 00:55:00	\N		36	\N	t	f	2018-11-13 00:56:06.925748	2018-11-13 00:56:06.925748	1	\N	139	f	\N	\N
483	660	\N		2018-11-14 01:00:00	\N		36	\N	t	f	2018-11-13 01:00:47.295593	2018-11-13 01:00:47.295593	1	\N	139	f	\N	\N
484	661	\N		2018-11-14 01:02:00	\N		36	\N	t	f	2018-11-13 01:02:36.958192	2018-11-13 01:02:36.958192	1	\N	139	f	\N	\N
485	662	\N		2018-11-14 01:12:00	\N		36	\N	t	f	2018-11-13 01:13:05.498266	2018-11-13 01:13:05.498266	1	\N	139	f	\N	\N
486	663	\N		2018-11-14 01:20:00	\N		36	\N	t	f	2018-11-13 01:20:49.015651	2018-11-13 01:20:49.015651	1	\N	139	f	\N	\N
487	664	\N		2018-11-13 01:21:00	\N		36	\N	t	f	2018-11-13 01:21:53.22036	2018-11-13 01:21:53.22036	1	\N	139	f	\N	\N
488	666	\N		2018-11-13 01:25:00	\N		36	\N	t	f	2018-11-13 01:26:11.127544	2018-11-13 01:26:11.127544	1	\N	139	f	\N	\N
489	665	\N		2018-11-14 01:26:00	\N		36	\N	t	f	2018-11-13 01:26:59.144186	2018-11-13 01:26:59.144186	1	\N	139	f	\N	\N
490	668	\N		2018-11-14 01:29:00	\N		36	\N	t	f	2018-11-13 01:30:11.897716	2018-11-13 01:30:11.897716	1	\N	139	f	\N	\N
491	667	\N		2018-11-14 01:30:00	\N		36	\N	t	f	2018-11-13 01:31:12.726699	2018-11-13 01:31:12.726699	1	\N	139	f	\N	\N
492	670	\N		2018-11-15 01:36:00	\N		36	\N	t	f	2018-11-13 01:36:56.808305	2018-11-13 01:36:56.808305	1	\N	139	f	\N	\N
493	669	\N		2018-11-14 01:38:00	\N		36	\N	t	f	2018-11-13 01:39:15.566106	2018-11-13 01:39:15.566106	1	\N	139	f	\N	\N
494	671	\N		2018-11-14 01:40:00	\N		36	\N	t	f	2018-11-13 01:40:56.634742	2018-11-13 01:40:56.634742	1	\N	139	f	\N	\N
495	672	\N		2018-11-14 01:45:00	\N		36	\N	t	f	2018-11-13 01:45:42.884378	2018-11-13 01:45:42.884378	1	\N	139	f	\N	\N
496	673	\N		2018-11-14 01:49:00	\N		36	\N	t	f	2018-11-13 01:49:59.25662	2018-11-13 01:49:59.25662	1	\N	139	f	\N	\N
497	675	\N		2018-11-14 07:33:00	\N		36	\N	t	f	2018-11-13 07:33:59.277309	2018-11-13 07:33:59.277309	1	\N	139	f	\N	\N
498	674	\N		2018-11-14 07:34:00	\N		36	\N	t	f	2018-11-13 07:35:30.884468	2018-11-13 07:35:30.884468	1	\N	139	f	\N	\N
499	676	\N		2018-11-14 07:43:00	\N		36	\N	t	f	2018-11-13 07:43:41.229033	2018-11-13 07:43:41.229033	1	\N	139	f	\N	\N
500	677	\N		2018-11-14 07:46:00	\N		36	\N	t	f	2018-11-13 07:46:58.023397	2018-11-13 07:46:58.023397	1	\N	139	f	\N	\N
501	678	\N		2018-11-14 07:48:00	\N		36	\N	t	f	2018-11-13 07:49:12.380445	2018-11-13 07:49:12.380445	1	\N	139	f	\N	\N
502	680	\N		2018-11-14 07:52:00	\N		36	\N	t	f	2018-11-13 07:53:18.649349	2018-11-13 07:53:18.649349	1	\N	139	f	\N	\N
503	679	\N		2018-11-13 07:55:00	\N		36	\N	t	f	2018-11-13 07:56:25.960602	2018-11-13 07:56:25.960602	1	\N	139	f	\N	\N
504	681	\N		2018-11-15 07:59:00	\N		36	\N	t	f	2018-11-13 07:59:46.380897	2018-11-13 07:59:46.380897	1	\N	139	f	\N	\N
505	682	\N		2018-11-14 08:01:00	\N		36	\N	t	f	2018-11-13 08:02:17.551243	2018-11-13 08:02:17.551243	1	\N	139	f	\N	\N
556	683	\N		2018-11-14 14:46:00	\N		36	\N	t	f	2018-11-13 14:47:35.220773	2018-11-13 14:47:35.220773	1	\N	139	f	\N	\N
568	656	\N		2018-11-14 17:12:00	\N		36	\N	t	f	2018-11-13 17:12:39.046197	2018-11-13 17:12:39.046197	1	\N	139	f	\N	\N
579	684	\N		2018-11-15 12:37:00	\N		36	\N	t	f	2018-11-14 12:41:30.445131	2018-11-14 12:41:30.445131	1	\N	139	f	\N	\N
580	685	\N		2018-11-15 12:48:00	\N		36	\N	t	f	2018-11-14 12:48:46.045967	2018-11-14 12:48:46.045967	1	\N	139	f	\N	\N
581	686	\N		2018-11-15 12:53:00	\N		36	\N	t	f	2018-11-14 12:54:31.133444	2018-11-14 12:54:31.133444	1	\N	139	f	\N	\N
582	687	\N		2018-11-15 13:00:00	\N		36	\N	t	f	2018-11-14 13:01:29.620866	2018-11-14 13:01:29.620866	1	\N	139	f	\N	\N
583	620	\N		2018-11-15 15:34:00	\N		36	\N	t	f	2018-11-14 15:35:19.536687	2018-11-14 15:35:19.536687	1	\N	325	f	\N	\N
584	620	\N		2018-11-15 15:34:00	\N		36	\N	t	f	2018-11-14 15:36:45.958753	2018-11-14 15:36:45.958753	1	\N	325	f	\N	\N
585	619	\N		2018-11-15 15:43:00	\N		36	\N	t	f	2018-11-14 15:44:44.010296	2018-11-14 15:44:44.010296	1	\N	325	f	\N	\N
586	486	\N		2018-11-15 15:47:00	\N		36	\N	t	f	2018-11-14 15:48:18.822416	2018-11-14 15:48:18.822416	1	\N	234	f	\N	\N
587	511	\N		2018-11-15 16:33:00	\N		36	\N	t	f	2018-11-14 16:34:15.255325	2018-11-14 16:34:15.255325	1	\N	289	f	\N	\N
588	463	\N		2018-11-16 16:37:00	\N		36	\N	t	f	2018-11-14 16:37:45.050292	2018-11-14 16:37:45.050292	1	\N	286	f	\N	\N
589	440	\N		2018-11-15 16:39:00	\N		36	\N	t	f	2018-11-14 16:39:56.761673	2018-11-14 16:39:56.761673	1	\N	247	f	\N	\N
590	439	\N		2018-11-15 16:46:00	\N		36	\N	t	f	2018-11-14 16:46:43.067145	2018-11-14 16:46:43.067145	1	\N	247	f	\N	\N
591	421	\N		2018-11-15 16:56:00	\N		36	\N	t	f	2018-11-14 16:57:32.598539	2018-11-14 16:57:32.598539	1	\N	247	f	\N	\N
592	408	\N		2018-11-15 16:58:00	\N		36	\N	t	f	2018-11-14 16:59:31.322631	2018-11-14 16:59:31.322631	1	\N	278	f	\N	\N
593	393	\N		2018-11-15 17:00:00	\N		36	\N	t	f	2018-11-14 17:00:50.260014	2018-11-14 17:00:50.260014	1	\N	276	f	\N	\N
594	688	\N		2018-11-15 17:02:00	\N		36	\N	t	f	2018-11-14 17:03:26.277517	2018-11-14 17:03:26.277517	1	\N	139	f	\N	\N
595	688	\N		2018-11-15 17:05:00	\N		36	\N	t	f	2018-11-14 17:05:52.679556	2018-11-14 17:05:52.679556	1	\N	139	f	\N	\N
596	445	\N	Headache	2018-08-17 13:22:00	\N	\N	\N	\N	t	f	2018-11-14 17:31:19.978296	2018-11-14 17:31:19.978296	1	140	286	f	\N	\N
597	659	\N	\N	2018-11-23 08:19:00	\N	\N	\N	\N	t	f	2018-11-15 08:20:22.44167	2018-11-15 08:20:22.44167	\N	36	139	f	\N	\N
598	659	\N	\N	2018-11-23 08:19:00	\N	\N	\N	\N	t	f	2018-11-15 08:20:22.450206	2018-11-15 08:20:22.450206	\N	36	139	f	\N	\N
599	658	\N	\N	2018-11-22 08:33:00	\N	\N	\N	\N	t	f	2018-11-15 08:34:07.643372	2018-11-15 08:34:07.643372	\N	36	139	f	\N	\N
601	658	\N	\N	2018-11-22 08:33:00	\N	\N	\N	\N	t	f	2018-11-15 08:34:07.657156	2018-11-15 08:34:07.657156	\N	36	139	f	\N	\N
602	657	\N	\N	2018-11-21 08:35:00	\N	\N	\N	\N	t	f	2018-11-15 08:36:11.849276	2018-11-15 08:36:11.849276	\N	36	139	f	\N	\N
603	657	\N	\N	2018-11-21 08:35:00	\N	\N	\N	\N	t	f	2018-11-15 08:36:11.855974	2018-11-15 08:36:11.855974	\N	36	139	f	\N	\N
604	607	\N	Headaches 	2018-11-21 09:42:00	\N	\N	\N	\N	t	f	2018-11-15 09:43:13.773267	2018-11-15 09:43:13.773267	\N	36	257	f	\N	\N
605	607	\N	Headaches 	2018-11-21 09:43:00	\N	\N	\N	\N	t	f	2018-11-15 09:44:45.323446	2018-11-15 09:44:45.323446	\N	36	257	f	\N	\N
606	607	\N	Headaches 	2018-11-29 09:45:00	\N	\N	\N	\N	t	f	2018-11-15 09:46:28.311562	2018-11-15 09:46:28.311562	\N	36	257	f	\N	\N
607	607	\N	Headaches 	2018-11-29 09:45:00	\N	\N	\N	\N	t	f	2018-11-15 09:46:28.341662	2018-11-15 09:46:28.341662	\N	36	257	f	\N	\N
608	607	\N	Headaches 	2018-11-29 09:45:00	\N	\N	\N	\N	t	f	2018-11-15 09:46:28.357161	2018-11-15 09:46:28.357161	\N	36	257	f	\N	\N
609	607	\N	Headaches 	2018-11-29 09:45:00	\N	\N	\N	\N	t	f	2018-11-15 09:46:28.372016	2018-11-15 09:46:28.372016	\N	36	257	f	\N	\N
610	602	\N	Dhhg	2018-11-20 09:51:00	\N	\N	\N	\N	t	f	2018-11-15 09:51:47.637924	2018-11-15 09:51:47.637924	1	36	322	f	\N	\N
611	602	\N	Dhhg	2018-11-29 10:27:00	\N	\N	\N	\N	t	f	2018-11-15 10:28:13.080211	2018-11-15 10:28:13.080211	1	36	322	f	\N	\N
612	602	\N	Dhhg	2018-11-29 10:27:00	\N	\N	\N	\N	t	f	2018-11-15 10:28:13.142789	2018-11-15 10:28:13.142789	1	36	322	f	\N	\N
613	608	\N	Drinking 	2018-11-16 10:53:00	\N	\N	\N	\N	t	f	2018-11-15 10:54:09.176769	2018-11-15 10:54:09.176769	\N	36	257	f	\N	\N
614	608	\N	Drinking 	2018-11-16 10:53:00	\N	\N	\N	\N	t	f	2018-11-15 10:54:09.206064	2018-11-15 10:54:09.206064	\N	36	257	f	\N	\N
615	594	\N	Running stomach	2018-11-15 10:54:00	\N	\N	\N	\N	t	f	2018-11-15 10:55:06.676521	2018-11-15 10:55:06.676521	1	36	289	f	\N	\N
616	594	\N	Running stomach	2018-11-15 10:54:00	\N	\N	\N	\N	t	f	2018-11-15 10:55:06.69551	2018-11-15 10:55:06.69551	1	36	289	f	\N	\N
617	659	\N	\N	2018-11-21 10:55:00	\N	\N	\N	\N	t	f	2018-11-15 10:55:34.132715	2018-11-15 10:55:34.132715	\N	36	139	f	\N	\N
618	659	\N	\N	2018-11-21 10:55:00	\N	\N	\N	\N	t	f	2018-11-15 10:55:34.159815	2018-11-15 10:55:34.159815	\N	36	139	f	\N	\N
619	610	\N	Tia	2018-11-19 10:55:00	\N	\N	\N	\N	t	f	2018-11-15 10:55:58.423312	2018-11-15 10:55:58.423312	\N	36	257	f	\N	\N
620	610	\N	Tia	2018-11-19 10:55:00	\N	\N	\N	\N	t	f	2018-11-15 10:55:58.437986	2018-11-15 10:55:58.437986	\N	36	257	f	\N	\N
621	644	5		2018-11-23 17:23:00	\N		36	\N	t	f	2018-11-15 17:23:56.992596	2018-11-15 17:23:56.992596	3	\N	322	f	\N	\N
622	633	1		2018-11-16 17:46:00	\N		36	\N	t	f	2018-11-15 17:46:56.970916	2018-11-15 17:46:56.970916	1	\N	272	f	\N	\N
623	618	1		2018-11-28 17:48:00	\N		36	\N	t	f	2018-11-15 17:48:41.835053	2018-11-15 17:48:41.846752	1	\N	325	f	\N	f
625	704	\N		2018-11-26 16:25:00	\N	\N	\N	\N	t	f	2018-11-26 16:25:42.213812	2018-11-26 16:25:42.213812	\N	158	322	f	\N	\N
626	697	\N		2018-11-27 16:26:00	\N		158	\N	t	f	2018-11-26 16:26:57.169272	2018-11-26 16:26:57.169272	1	\N	322	f	\N	\N
627	693	\N		2018-11-26 16:27:00	\N		158	\N	t	f	2018-11-26 16:27:36.115358	2018-11-26 16:27:36.115358	1	\N	322	f	\N	\N
656	742	3		2018-12-19 04:03:00	\N		145	\N	t	f	2018-12-03 01:03:23.385502	2018-12-03 01:03:23.397605	1	\N	329	f	\N	f
657	743	\N		2018-12-14 04:39:00	\N		145	\N	t	f	2018-12-03 01:50:03.525462	2018-12-03 01:50:03.525462	1	\N	257	f	\N	\N
658	745	\N		2018-12-25 13:23:00	\N		158	\N	t	f	2018-12-03 13:23:53.118457	2018-12-03 13:23:53.118457	1	\N	322	f	\N	\N
659	744	\N		2018-12-25 13:26:00	\N		158	\N	t	f	2018-12-03 13:26:31.479674	2018-12-03 13:26:31.479674	3	\N	257	f	\N	\N
660	698	\N		2018-12-03 13:29:00	\N		158	\N	t	f	2018-12-03 13:30:08.400412	2018-12-03 13:30:08.400412	1	\N	322	f	\N	\N
661	371	\N		2018-12-26 11:01:00	\N		158	\N	t	f	2018-12-04 11:03:12.048896	2018-12-04 11:03:12.048896	3	\N	267	f	\N	\N
624	599	\N		2018-11-26 16:22:00	\N		158	\N	t	f	2018-11-26 16:22:17.326479	2018-11-26 16:22:17.326479	1	\N	322	f	\N	\N
628	725	\N	None	2018-11-29 13:44:00	\N	\N	\N	\N	t	f	2018-11-28 13:44:26.773523	2018-11-28 13:44:26.773523	\N	158	322	f	\N	\N
629	734	\N	Non	2018-11-29 13:44:00	\N	\N	\N	\N	t	f	2018-11-28 13:44:58.495113	2018-11-28 13:44:58.495113	1	158	322	f	\N	\N
630	733	\N	Hj	2018-11-29 13:45:00	\N	\N	\N	\N	t	f	2018-11-28 13:45:22.368027	2018-11-28 13:45:22.368027	\N	158	322	f	\N	\N
631	732	\N	No	2018-11-28 13:54:00	\N	\N	\N	\N	t	f	2018-11-28 13:54:55.149201	2018-11-28 13:54:55.149201	\N	158	322	f	\N	\N
632	731	\N		2018-11-29 13:55:00	\N	\N	\N	\N	t	f	2018-11-28 13:55:22.098985	2018-11-28 13:55:22.098985	\N	158	322	f	\N	\N
633	730	\N		2018-11-29 13:55:00	\N	\N	\N	\N	t	f	2018-11-28 13:56:01.060015	2018-11-28 13:56:01.060015	\N	158	322	f	\N	\N
634	729	\N	None	2018-11-29 13:55:00	\N	\N	\N	\N	t	f	2018-11-28 13:56:26.140457	2018-11-28 13:56:26.140457	1	158	322	f	\N	\N
635	728	\N	Non	2018-11-29 13:56:00	\N	\N	\N	\N	t	f	2018-11-28 13:56:43.748457	2018-11-28 13:56:43.748457	1	158	322	f	\N	\N
637	726	\N	No	2018-11-29 13:58:00	\N	\N	\N	\N	t	f	2018-11-28 13:58:33.503082	2018-11-28 13:58:33.503082	\N	158	322	f	\N	\N
638	724	\N	None	2018-11-28 13:59:00	\N	\N	\N	\N	t	f	2018-11-28 14:00:20.906723	2018-11-28 14:00:20.906723	\N	158	322	f	\N	\N
639	723	\N		2018-11-29 14:00:00	\N		158	\N	t	f	2018-11-28 14:01:02.216924	2018-11-28 14:01:02.216924	1	\N	322	f	\N	\N
640	722	\N		2018-11-29 14:03:00	\N		158	\N	t	f	2018-11-28 14:03:25.481049	2018-11-28 14:03:25.481049	1	\N	322	f	\N	\N
641	721	\N		2018-11-29 14:07:00	\N		158	\N	t	f	2018-11-28 14:07:12.162426	2018-11-28 14:07:12.162426	1	\N	322	f	\N	\N
642	720	\N		2018-11-29 14:12:00	\N		158	\N	t	f	2018-11-28 14:12:14.929118	2018-11-28 14:12:14.929118	1	\N	322	f	\N	\N
643	719	\N		2018-11-29 14:13:00	\N		158	\N	t	f	2018-11-28 14:13:39.335337	2018-11-28 14:13:39.335337	1	\N	322	f	\N	\N
645	706	\N	<p><span style="font-family: Verdana, sans-serif; font-size: 15px; background-color: #f9f9f9;">Stomach problems</span></p>	2018-11-28 17:34:00	\N		158	\N	t	f	2018-11-28 17:34:35.739952	2018-11-28 17:34:35.739952	1	\N	322	f	\N	\N
646	383	\N	<p><span style="font-family: Verdana, sans-serif; font-size: 15px; background-color: #f9f9f9;">Diabets</span></p>	2018-11-28 18:16:00	\N		158	\N	t	f	2018-11-28 18:16:38.131937	2018-11-28 18:16:38.131937	1	\N	276	f	\N	\N
647	607	\N	Headaches 	2018-11-29 09:45:00	\N	\N	\N	\N	t	f	2018-11-29 11:42:23.736899	2018-11-29 11:46:36.561557	\N	258	257	t	\N	\N
649	608	\N	Drinking 	2018-11-16 10:53:00	\N	\N	\N	\N	t	f	2018-11-29 11:45:20.004415	2018-11-29 11:51:53.975279	\N	258	257	t	\N	\N
648	610	\N	Tia	2018-11-19 10:55:00	\N	\N	\N	\N	t	f	2018-11-29 11:44:41.871692	2018-11-29 11:59:29.490496	\N	258	257	t	\N	\N
650	741	\N	Ghana 	2018-12-11 01:58:00	\N	\N	\N	\N	t	f	2018-12-01 22:59:13.970493	2018-12-01 22:59:13.970493	\N	145	257	f	\N	\N
651	740	\N	Diab	2018-12-18 02:02:00	\N	\N	\N	\N	t	f	2018-12-01 23:02:37.633355	2018-12-01 23:02:37.633355	1	145	257	f	\N	\N
652	736	\N	Diabetes 	2018-12-17 01:52:00	\N	\N	\N	\N	t	f	2018-12-01 23:04:40.690026	2018-12-01 23:04:40.690026	1	145	257	f	\N	\N
653	739	\N		\N	\N		145	\N	t	f	2018-12-01 23:06:17.763765	2018-12-01 23:06:17.763765	1	\N	257	f	\N	\N
654	738	3		2018-12-19 02:10:00	\N		145	\N	t	f	2018-12-01 23:10:51.381839	2018-12-01 23:10:51.394357	1	\N	257	f	\N	f
655	737	\N		2018-12-02 15:11:00	\N		145	\N	t	f	2018-12-01 23:12:23.379	2018-12-01 23:12:23.379	1	\N	257	f	\N	\N
662	717	2		2018-12-31 11:08:00	\N		158	\N	t	f	2018-12-04 11:07:28.992501	2018-12-04 11:07:29.003253	2	\N	322	f	\N	f
663	732	\N	No	2018-11-28 13:54:00	\N	\N	\N	\N	t	f	2018-12-06 18:04:41.417135	2018-12-06 18:04:41.417135	\N	323	322	f	\N	\N
664	734	\N	Non	2018-11-29 13:44:00	\N	\N	\N	\N	t	f	2018-12-06 18:05:48.456026	2018-12-06 18:05:48.456026	1	323	322	f	\N	\N
665	746	1		2018-12-07 18:43:00	\N		158	\N	t	f	2018-12-06 18:43:09.959929	2018-12-06 18:43:10.086634	1	\N	322	f	\N	f
666	750	\N		2018-12-07 18:43:00	\N		158	\N	t	f	2018-12-06 18:43:44.422343	2018-12-06 18:43:44.422343	1	\N	322	f	\N	\N
667	602	\N	Dhhg	2018-09-25 10:10:00	\N	\N	\N	\N	t	f	2018-12-06 18:48:24.733577	2018-12-06 18:48:24.733577	1	323	322	f	\N	\N
668	765	\N		2018-12-12 18:00:00	\N		158	\N	t	f	2018-12-11 18:00:38.466049	2018-12-11 18:00:38.466049	1	\N	322	f	\N	\N
669	769	\N	None	2018-12-12 18:00:00	\N	\N	\N	\N	t	f	2018-12-11 18:01:10.517822	2018-12-11 18:01:10.517822	1	158	322	f	\N	\N
671	767	\N		2018-12-12 18:01:00	\N		158	\N	t	f	2018-12-11 18:01:57.211202	2018-12-11 18:01:57.211202	1	\N	322	f	\N	\N
672	766	\N		2018-12-12 18:02:00	\N		158	\N	t	f	2018-12-11 18:02:47.01508	2018-12-11 18:02:47.01508	1	\N	322	f	\N	\N
673	764	1		2018-12-11 18:03:00	\N		158	\N	t	f	2018-12-11 18:03:33.917037	2018-12-11 18:03:33.929473	1	\N	322	f	\N	f
674	770	\N	No	2018-12-12 18:10:00	\N	\N	\N	\N	t	f	2018-12-11 18:11:49.882863	2018-12-11 18:11:49.882863	1	158	322	f	\N	\N
675	772	\N	None	2018-12-12 18:16:00	\N	\N	\N	\N	t	f	2018-12-11 18:17:37.327779	2018-12-11 18:17:37.327779	\N	158	322	f	\N	\N
636	727	\N	No	2018-11-29 13:57:00	\N	\N	\N	\N	t	f	2018-11-28 13:58:03.700674	2019-01-25 15:33:47.014444	\N	323	322	f	\N	\N
644	735	\N		2019-02-05 12:02:00	\N		158	\N	t	f	2018-11-28 17:02:09.602946	2018-11-28 17:02:09.602946	1	\N	322	f	\N	t
677	775	\N	None	2018-12-12 18:22:00	\N	\N	\N	\N	t	f	2018-12-11 18:22:28.58488	2018-12-11 18:22:28.58488	1	158	322	f	\N	\N
678	777	\N	No	2018-12-11 18:23:00	\N	\N	\N	\N	t	f	2018-12-11 18:24:45.777587	2018-12-11 18:24:45.777587	1	158	322	f	\N	\N
679	779	\N	\N	2018-12-12 18:25:00	\N	\N	\N	\N	t	f	2018-12-11 18:25:32.175441	2018-12-11 18:25:32.175441	\N	158	322	f	\N	\N
683	770	\N	No	2018-12-12 18:10:00	\N	\N	\N	\N	t	f	2018-12-11 18:27:10.506101	2018-12-11 18:27:10.506101	1	323	322	f	\N	\N
684	771	\N	No	2018-12-12 18:28:00	\N	\N	\N	\N	t	f	2018-12-11 18:28:38.356174	2018-12-11 18:28:38.356174	\N	158	322	f	\N	\N
685	763	1		2018-12-12 18:29:00	\N		158	\N	t	f	2018-12-11 18:29:14.610365	2018-12-11 18:29:14.622385	1	\N	322	f	\N	f
686	762	\N		2018-12-31 10:31:00	\N		158	\N	t	f	2018-12-13 10:31:07.006356	2018-12-13 10:31:07.006356	1	\N	322	f	\N	\N
687	780	10		2018-12-14 11:15:00	\N		158	\N	t	f	2018-12-13 11:15:34.394835	2018-12-13 11:15:34.407568	1	\N	322	f	\N	f
688	781	4		2018-12-14 11:16:00	\N		158	\N	t	f	2018-12-13 11:16:09.871221	2018-12-13 11:16:09.883325	1	\N	322	f	\N	f
691	784	\N		2018-12-14 11:33:00	\N		158	\N	t	f	2018-12-13 11:34:05.067499	2018-12-13 11:34:05.067499	1	\N	322	f	\N	\N
692	785	\N		2018-12-14 11:46:00	\N		158	\N	t	f	2018-12-13 11:47:10.09952	2018-12-13 11:47:10.09952	1	\N	322	f	\N	\N
693	786	\N	Please	2018-12-14 11:55:00	\N	\N	\N	\N	t	f	2018-12-13 11:55:14.002564	2018-12-13 11:55:14.002564	\N	158	322	f	\N	\N
695	788	\N	Please	2018-12-21 11:58:00	\N	\N	\N	\N	t	f	2018-12-13 11:58:33.079121	2018-12-13 11:58:33.079121	1	158	322	f	\N	\N
696	789	\N	The	2018-12-22 11:58:00	\N	\N	\N	\N	t	f	2018-12-13 11:58:54.015832	2018-12-13 11:58:54.015832	1	158	322	f	\N	\N
697	790	\N	Please	2018-12-14 12:05:00	\N	\N	\N	\N	t	f	2018-12-13 12:05:47.591205	2018-12-13 12:05:47.591205	\N	158	322	f	\N	\N
699	793	\N	Lol	2018-12-14 12:09:00	\N	\N	\N	\N	t	f	2018-12-13 12:09:38.37073	2018-12-13 12:09:38.37073	\N	158	322	f	\N	\N
700	792	\N	Please	2018-12-14 12:10:00	\N	\N	\N	\N	t	f	2018-12-13 12:10:34.976896	2018-12-13 12:10:34.976896	\N	158	322	f	\N	\N
701	794	\N	No	2018-12-14 12:11:00	\N	\N	\N	\N	t	f	2018-12-13 12:11:57.473782	2018-12-13 12:11:57.473782	1	158	322	f	\N	\N
703	796	\N	\N	2018-12-14 12:15:00	\N	\N	\N	\N	t	f	2018-12-13 12:15:47.487061	2018-12-13 12:15:47.487061	\N	158	322	f	\N	\N
704	797	\N	\N	2018-12-14 12:16:00	\N	\N	\N	\N	t	f	2018-12-13 12:16:50.303826	2018-12-13 12:16:50.303826	\N	158	322	f	\N	\N
702	795	\N	No	2018-12-14 12:13:00	\N	\N	\N	\N	t	f	2018-12-13 12:14:03.190199	2019-02-05 11:41:46.093974	1	323	322	f	\N	\N
705	793	\N	Lol	2018-12-14 12:34:00	\N	\N	\N	\N	t	f	2018-12-13 12:34:15.107855	2018-12-13 12:34:15.107855	\N	158	322	f	\N	\N
706	792	\N	Please	2018-12-14 12:34:00	\N	\N	\N	\N	t	f	2018-12-13 12:34:48.931328	2018-12-13 12:34:48.931328	\N	158	322	f	\N	\N
708	789	\N	The	2018-12-22 11:58:00	\N	\N	\N	\N	t	f	2018-12-13 12:40:14.414138	2018-12-13 12:40:14.414138	1	323	322	f	\N	\N
709	799	9		2018-12-31 14:23:00	\N		158	\N	t	f	2018-12-13 14:23:07.110846	2018-12-13 14:23:07.12387	1	\N	330	f	\N	f
710	800	\N		2018-12-31 14:25:00	\N		158	\N	t	f	2018-12-13 14:25:19.902039	2018-12-13 14:25:19.902039	3	\N	330	f	\N	\N
711	804	\N	\N	2018-12-31 14:26:00	\N	\N	\N	\N	t	f	2018-12-13 14:26:18.066409	2018-12-13 14:26:18.066409	1	158	330	f	\N	f
712	804	\N	\N	2018-12-31 14:26:00	\N	\N	\N	\N	t	f	2018-12-13 14:28:54.553393	2018-12-13 14:28:54.553393	1	230	330	f	\N	\N
713	803	\N	Sleeping 	2018-12-31 14:40:00	\N	\N	\N	\N	t	f	2018-12-13 14:39:43.404392	2018-12-13 14:39:43.404392	1	158	330	f	\N	\N
714	803	\N	Sleeping 	2018-12-31 14:40:00	\N	\N	\N	\N	t	f	2018-12-13 17:45:36.926246	2018-12-13 17:45:36.926246	1	230	330	f	\N	\N
715	805	3		2019-01-02 07:00:00	\N		145	\N	t	f	2018-12-14 00:00:22.34327	2018-12-14 00:00:22.442089	1	\N	257	f	\N	f
716	809	3		2018-12-26 02:13:00	\N		145	\N	t	f	2018-12-14 00:13:57.617852	2018-12-14 00:13:57.672549	1	\N	257	f	\N	f
717	810	8		2018-12-26 03:16:00	\N		145	\N	t	f	2018-12-14 00:16:38.488523	2018-12-14 00:16:38.49944	1	\N	257	f	\N	f
718	811	\N	<p>paracet</p>	2018-12-26 03:24:00	\N		145	\N	t	f	2018-12-14 00:26:33.148039	2018-12-14 00:26:33.148039	1	\N	257	f	\N	\N
719	812	\N		2018-12-20 23:27:00	\N		145	\N	t	f	2018-12-14 00:32:17.730739	2018-12-14 00:32:17.730739	1	\N	257	f	\N	\N
720	813	\N		2018-12-21 03:34:00	\N		145	\N	t	f	2018-12-14 00:35:13.174655	2018-12-14 00:35:13.174655	1	\N	257	f	\N	\N
721	814	\N		2018-12-14 12:29:00	\N		145	\N	t	f	2018-12-14 09:29:53.709196	2018-12-14 09:29:53.709196	1	\N	257	f	\N	\N
722	815	\N		2018-12-14 12:32:00	\N		145	\N	t	f	2018-12-14 09:32:38.58563	2018-12-14 09:32:38.58563	1	\N	257	f	\N	\N
723	817	\N	Diabetes 	2018-12-14 13:11:00	\N	\N	\N	\N	t	f	2018-12-14 10:11:42.579254	2018-12-14 10:11:42.579254	\N	145	257	f	\N	\N
724	824	\N	 	2018-12-14 13:12:00	\N	\N	\N	\N	t	f	2018-12-14 10:12:22.761492	2018-12-14 10:12:22.761492	1	145	257	f	\N	\N
725	825	\N	\N	2018-12-14 13:12:00	\N	\N	\N	\N	t	f	2018-12-14 10:13:17.271846	2018-12-14 10:13:17.271846	\N	145	257	f	\N	\N
726	826	\N	Diabetes 	2018-12-21 13:13:00	\N	\N	\N	\N	t	f	2018-12-14 10:13:50.32838	2018-12-14 10:13:50.32838	\N	145	257	f	\N	\N
727	819	\N	Diabetes 	2018-12-14 13:16:00	\N	\N	\N	\N	t	f	2018-12-14 10:16:58.270652	2018-12-14 10:16:58.270652	\N	145	257	f	\N	\N
728	826	\N	Diabetes 	2018-12-21 13:13:00	\N	\N	\N	\N	t	f	2018-12-14 10:20:57.075638	2018-12-14 10:20:57.075638	\N	258	257	f	\N	\N
729	736	\N	Diabetes 	2018-12-17 01:52:00	\N	\N	\N	\N	t	f	2018-12-14 10:21:25.545823	2018-12-14 10:21:25.545823	1	258	257	f	\N	\N
730	740	\N	Diab	2018-12-18 02:02:00	\N	\N	\N	\N	t	f	2018-12-14 10:21:47.943649	2018-12-14 10:21:47.943649	1	258	257	f	\N	\N
731	819	\N	Diabetes 	2018-12-14 13:16:00	\N	\N	\N	\N	t	f	2018-12-14 10:22:16.546766	2018-12-14 10:22:16.546766	\N	258	257	f	\N	\N
732	825	\N	\N	2018-12-14 13:12:00	\N	\N	\N	\N	t	f	2018-12-14 10:24:19.637555	2018-12-14 10:24:19.637555	\N	258	257	f	\N	\N
733	824	\N	 	2018-12-14 13:12:00	\N	\N	\N	\N	t	f	2018-12-14 10:24:39.024536	2018-12-14 10:24:39.024536	1	258	257	f	\N	\N
734	817	\N	Diabetes 	2018-12-14 13:11:00	\N	\N	\N	\N	t	f	2018-12-14 10:25:04.079318	2018-12-14 10:25:04.079318	\N	258	257	f	\N	\N
735	741	\N	Ghana 	2018-12-11 01:58:00	\N	\N	\N	\N	t	f	2018-12-14 10:25:22.997515	2018-12-14 10:25:22.997515	\N	258	257	f	\N	\N
736	827	\N		2018-12-15 12:14:00	\N		158	\N	t	f	2018-12-14 12:14:31.3278	2018-12-14 12:14:31.3278	1	\N	322	f	\N	\N
737	828	\N		2018-12-15 12:20:00	\N		158	\N	t	f	2018-12-14 12:20:41.174083	2018-12-14 12:20:41.174083	1	\N	322	f	\N	\N
738	316	\N		2018-12-15 16:44:00	\N		158	\N	t	f	2018-12-14 16:44:53.810488	2018-12-14 16:44:53.810488	1	\N	257	f	\N	\N
739	829	\N		2018-12-24 17:55:00	\N		158	\N	t	f	2018-12-14 17:55:53.277615	2018-12-14 17:55:53.277615	1	\N	257	f	\N	\N
740	830	\N		2018-12-25 17:57:00	\N		158	\N	t	f	2018-12-14 17:56:39.171591	2018-12-14 17:56:39.171591	1	\N	257	f	\N	\N
741	833	\N		2018-12-26 17:58:00	\N		158	\N	t	f	2018-12-14 17:57:32.304653	2018-12-14 17:57:32.304653	1	\N	257	f	\N	\N
742	830	\N		2018-12-17 18:10:00	\N		158	\N	t	f	2018-12-14 18:11:06.427799	2018-12-14 18:11:06.427799	1	\N	257	f	\N	\N
743	833	\N		2018-12-15 18:11:00	\N		158	\N	t	f	2018-12-14 18:12:02.335523	2018-12-14 18:12:02.335523	1	\N	257	f	\N	\N
744	833	\N		2018-12-15 18:13:00	\N		158	\N	t	f	2018-12-14 18:13:18.136282	2018-12-14 18:13:18.136282	1	\N	257	f	\N	\N
745	833	\N		2018-12-14 18:14:00	\N		158	\N	t	f	2018-12-14 18:15:08.779074	2018-12-14 18:15:08.779074	1	\N	257	f	\N	\N
746	834	11		2018-12-15 12:59:00	\N		145	\N	t	f	2018-12-15 09:59:20.285254	2018-12-15 09:59:20.302586	1	\N	257	f	\N	f
747	835	\N		2018-12-15 13:04:00	\N		145	\N	t	f	2018-12-15 10:05:11.14088	2018-12-15 10:05:11.14088	1	\N	257	f	\N	\N
748	836	\N		2018-12-15 13:31:00	\N		145	\N	t	f	2018-12-15 10:32:14.431519	2018-12-15 10:32:14.431519	1	\N	257	f	\N	\N
749	844	\N		2018-12-15 13:39:00	\N		145	\N	t	f	2018-12-15 10:39:21.304957	2018-12-15 10:39:21.304957	1	\N	257	f	\N	\N
750	837	\N	Headaches 	2018-12-15 13:52:00	\N	\N	\N	\N	t	f	2018-12-15 10:53:03.010363	2018-12-15 10:53:03.010363	\N	145	257	f	\N	\N
751	837	\N	Headaches 	2018-12-15 13:52:00	\N	\N	\N	\N	t	f	2018-12-15 10:57:40.28554	2018-12-15 10:57:40.28554	\N	258	257	f	\N	\N
752	848	\N		2018-12-25 09:45:00	\N		158	\N	t	f	2018-12-18 09:45:15.708475	2018-12-18 09:45:15.708475	1	\N	330	f	\N	t
753	850	\N	Nad	2018-12-18 19:38:00	\N	\N	\N	\N	t	f	2018-12-18 16:38:40.142433	2018-12-18 16:38:40.142433	1	145	257	f	\N	\N
754	850	\N	Nad	2018-12-18 19:38:00	\N	\N	\N	\N	t	f	2018-12-18 16:39:41.978177	2018-12-18 16:39:41.978177	1	258	257	f	\N	\N
694	787	\N	Please	2018-12-14 11:55:00	\N	\N	\N	\N	t	f	2018-12-13 11:55:46.019298	2019-01-25 15:37:24.904395	\N	323	322	f	\N	\N
707	798	\N	Stomach	2018-12-14 12:37:00	\N	\N	\N	\N	t	f	2018-12-13 12:37:23.004904	2019-01-25 15:39:11.44744	\N	323	322	f	\N	\N
680	778	\N	\N	2018-12-12 18:25:00	\N	\N	\N	\N	t	f	2018-12-11 18:26:15.021468	2019-01-25 15:41:08.948315	\N	323	322	f	\N	\N
690	783	\N		2019-02-05 12:02:00	\N		158	\N	t	f	2018-12-13 11:23:15.89474	2018-12-13 11:23:15.89474	1	\N	322	f	\N	t
698	791	\N	No	2018-12-14 12:06:00	\N	\N	\N	\N	t	f	2018-12-13 12:06:10.969501	2019-02-05 11:42:40.147096	\N	323	322	f	\N	\N
682	773	\N	Gh	2018-12-12 18:26:00	\N	\N	\N	\N	t	f	2018-12-11 18:27:00.145143	2019-02-05 12:14:35.875184	\N	323	322	f	\N	\N
681	774	\N	One	2018-12-12 18:26:00	\N	\N	\N	\N	t	f	2018-12-11 18:26:36.863028	2019-02-05 12:15:19.660534	\N	323	322	f	\N	\N
755	845	\N		2018-12-27 11:32:00	\N		36	\N	t	f	2018-12-19 11:32:45.012981	2018-12-19 11:32:45.012981	1	\N	257	f	\N	\N
756	849	1	<p>Diabetes</p>	2018-12-27 12:31:00	\N		36	\N	t	f	2018-12-19 12:31:55.958266	2018-12-19 12:31:56.064941	1	\N	257	f	\N	f
757	806	5	<p>Fever, headache</p>	2018-12-21 12:33:00	\N		36	\N	t	f	2018-12-19 12:34:14.196888	2018-12-19 12:34:14.207556	3	\N	331	f	\N	f
758	847	\N	Tff	2018-12-20 12:41:00	\N		36	\N	t	f	2018-12-19 12:42:03.65455	2018-12-19 12:45:16.752509	\N	36	331	f	\N	\N
761	846	\N	Hhggg	2018-12-20 15:30:00	\N	\N	\N	\N	t	f	2018-12-19 15:30:44.334766	2018-12-19 15:30:44.334766	3	36	331	f	\N	\N
762	821	\N	Headache	2018-12-26 16:19:00	\N	\N	\N	\N	t	f	2018-12-19 16:19:44.039622	2018-12-19 16:19:44.039622	\N	36	331	f	\N	\N
763	821	\N	Headache	2018-12-26 16:19:00	\N	\N	\N	\N	t	f	2018-12-19 16:19:44.082571	2018-12-19 16:19:44.082571	\N	36	331	f	\N	\N
764	821	\N	Headache	2018-12-26 16:19:00	\N	\N	\N	\N	t	f	2018-12-19 16:19:44.097478	2018-12-19 16:19:44.097478	\N	36	331	f	\N	\N
765	348	\N		2018-12-28 17:53:00	\N	\N	\N	\N	t	f	2018-12-19 17:53:55.277156	2018-12-19 17:53:55.277156	2	36	139	f	\N	\N
766	348	\N		2018-12-28 17:53:00	\N	\N	\N	\N	t	f	2018-12-19 17:53:55.312739	2018-12-19 17:53:55.312739	2	36	139	f	\N	\N
767	348	\N		2018-12-28 17:53:00	\N	\N	\N	\N	t	f	2018-12-19 17:53:55.326285	2018-12-19 17:53:55.326285	2	36	139	f	\N	\N
768	348	\N		2018-12-25 17:55:00	\N	\N	\N	\N	t	f	2018-12-19 17:56:30.932898	2018-12-19 17:56:30.932898	2	36	139	f	\N	\N
769	348	\N		2018-12-27 17:57:00	\N	\N	\N	\N	t	f	2018-12-19 17:57:51.993677	2018-12-19 17:57:51.993677	2	36	139	f	\N	\N
770	251	\N		2018-12-20 17:58:00	\N	\N	\N	\N	t	f	2018-12-19 17:59:04.041782	2018-12-19 17:59:04.041782	1	36	139	f	\N	\N
771	251	\N		2018-12-20 17:58:00	\N	\N	\N	\N	t	f	2018-12-19 17:59:04.575764	2018-12-19 17:59:04.575764	1	36	139	f	\N	\N
772	348	\N		2018-12-25 18:04:00	\N	\N	\N	\N	t	f	2018-12-19 18:05:03.075635	2018-12-19 18:05:03.075635	2	36	139	f	\N	\N
773	348	\N		2018-12-27 18:05:00	\N	\N	\N	\N	t	f	2018-12-19 18:06:19.189921	2018-12-19 18:06:19.189921	2	36	139	f	\N	\N
774	348	\N		2018-12-27 18:05:00	\N	\N	\N	\N	t	f	2018-12-19 18:06:19.253161	2018-12-19 18:06:19.253161	2	36	139	f	\N	\N
775	348	\N		2018-12-27 18:05:00	\N	\N	\N	\N	t	f	2018-12-19 18:06:19.27977	2018-12-19 18:06:19.27977	2	36	139	f	\N	\N
776	348	\N		2018-12-27 07:32:00	\N	\N	\N	\N	t	f	2018-12-20 07:33:00.943255	2018-12-20 07:33:00.943255	2	36	139	f	\N	\N
777	348	\N		2018-12-27 07:32:00	\N	\N	\N	\N	t	f	2018-12-20 07:33:00.987928	2018-12-20 07:33:00.987928	2	36	139	f	\N	\N
778	348	\N		2018-12-27 09:05:00	\N	\N	\N	\N	t	f	2018-12-20 09:06:08.919552	2018-12-20 09:06:08.919552	2	36	139	f	\N	\N
779	348	\N		2018-12-26 09:11:00	\N	\N	\N	\N	t	f	2018-12-20 09:11:47.377306	2018-12-20 09:11:47.377306	2	36	139	f	\N	\N
780	348	\N		2018-12-26 09:13:00	\N	\N	\N	\N	t	f	2018-12-20 09:13:45.45801	2018-12-20 09:13:45.45801	2	36	139	f	\N	\N
781	348	\N		2018-12-21 09:28:00	\N	\N	\N	\N	t	f	2018-12-20 09:29:08.438474	2018-12-20 09:29:08.438474	2	36	139	f	\N	\N
782	348	\N		2018-12-26 09:30:00	\N	\N	\N	\N	t	f	2018-12-20 09:30:50.216996	2018-12-20 09:30:50.216996	2	36	139	f	\N	\N
783	348	\N		2018-12-31 09:33:00	\N	\N	\N	\N	t	f	2018-12-20 09:33:45.052029	2018-12-20 09:33:45.052029	2	36	139	f	\N	\N
784	348	\N		2018-12-26 09:40:00	\N	\N	\N	\N	t	f	2018-12-20 09:41:02.495945	2018-12-20 09:41:02.495945	2	36	139	f	\N	\N
785	348	\N		2018-12-27 09:57:00	\N	\N	\N	\N	t	f	2018-12-20 09:58:10.889498	2018-12-20 09:58:10.889498	2	36	139	f	\N	\N
786	696	\N	Hggy	2018-12-25 10:10:00	\N	\N	\N	\N	t	f	2018-12-20 10:10:31.384349	2018-12-20 10:10:31.384349	1	36	322	f	\N	\N
787	348	\N		2018-12-25 10:15:00	\N	\N	\N	\N	t	f	2018-12-20 10:15:56.353394	2018-12-20 10:15:56.353394	2	36	139	f	\N	\N
788	348	\N		2019-01-01 10:16:00	\N	\N	\N	\N	t	f	2018-12-20 10:17:12.446413	2018-12-20 10:17:12.446413	2	36	139	f	\N	\N
789	348	\N		2018-12-31 10:19:00	\N	\N	\N	\N	t	f	2018-12-20 10:20:09.314597	2018-12-20 10:20:09.314597	2	36	139	f	\N	\N
790	348	\N		2018-12-31 10:19:00	\N	\N	\N	\N	t	f	2018-12-20 10:20:11.261626	2018-12-20 10:20:11.261626	2	36	139	f	\N	\N
791	348	\N		2018-12-31 10:19:00	\N	\N	\N	\N	t	f	2018-12-20 10:20:13.218953	2018-12-20 10:20:13.218953	2	36	139	f	\N	\N
792	348	\N		2019-01-03 10:21:00	\N	\N	\N	\N	t	f	2018-12-20 10:22:10.633876	2018-12-20 10:22:10.633876	2	36	139	f	\N	\N
793	348	\N		2019-01-03 10:21:00	\N	\N	\N	\N	t	f	2018-12-20 10:22:12.590449	2018-12-20 10:22:12.590449	2	36	139	f	\N	\N
794	348	\N		2019-01-03 10:21:00	\N	\N	\N	\N	t	f	2018-12-20 10:22:14.54593	2018-12-20 10:22:14.54593	2	36	139	f	\N	\N
795	348	\N		2018-12-25 10:24:00	\N	\N	\N	\N	t	f	2018-12-20 10:25:14.716603	2018-12-20 10:25:14.716603	2	36	139	f	\N	\N
796	348	\N		2018-12-25 10:25:00	\N	\N	\N	\N	t	f	2018-12-20 10:25:59.57732	2018-12-20 10:25:59.57732	2	36	139	f	\N	\N
797	688	\N		2019-01-02 10:26:00	\N		36	\N	t	f	2018-12-20 10:27:08.787066	2018-12-20 10:27:08.787066	1	\N	139	f	\N	\N
798	348	\N		2018-12-26 10:30:00	\N	\N	\N	\N	t	f	2018-12-20 10:30:22.317521	2018-12-20 10:30:22.317521	2	36	139	f	\N	\N
799	348	\N		2018-12-26 10:44:00	\N	\N	\N	\N	t	f	2018-12-20 10:44:55.350481	2018-12-20 10:44:55.350481	2	36	139	f	\N	\N
800	348	\N		2018-12-27 03:01:00	\N	\N	\N	\N	t	f	2018-12-20 11:01:22.550578	2018-12-20 11:01:22.550578	2	36	139	f	\N	\N
801	348	\N		2018-12-27 03:01:00	\N	\N	\N	\N	t	f	2018-12-20 11:01:25.1336	2018-12-20 11:01:25.1336	2	36	139	f	\N	\N
802	348	\N		2019-01-02 03:04:00	\N	\N	\N	\N	t	f	2018-12-20 11:04:28.17305	2018-12-20 11:04:28.17305	2	36	139	f	\N	\N
803	348	\N		2019-01-02 03:04:00	\N	\N	\N	\N	t	f	2018-12-20 11:05:29.844932	2018-12-20 11:05:29.844932	2	36	139	f	\N	\N
804	348	\N		2019-01-02 03:05:00	\N	\N	\N	\N	t	f	2018-12-20 11:05:53.281059	2018-12-20 11:05:53.281059	2	36	139	f	\N	\N
805	348	\N		2019-01-02 03:05:00	\N	\N	\N	\N	t	f	2018-12-20 11:06:39.08403	2018-12-20 11:06:39.08403	2	36	139	f	\N	\N
806	822	\N	Headache	2018-12-27 03:19:00	\N	\N	\N	\N	t	f	2018-12-20 11:19:11.039857	2018-12-20 11:19:11.039857	\N	36	331	f	\N	\N
807	348	\N		2019-01-01 11:29:00	\N	\N	\N	\N	t	f	2018-12-20 11:30:10.838515	2018-12-20 11:30:10.838515	2	36	139	f	\N	\N
808	348	\N		2018-12-25 11:32:00	\N	\N	\N	\N	t	f	2018-12-20 11:32:25.556131	2018-12-20 11:32:25.556131	2	36	139	f	\N	\N
809	348	\N		2018-12-27 11:33:00	\N	\N	\N	\N	t	f	2018-12-20 11:33:37.11714	2018-12-20 11:33:37.11714	2	36	139	f	\N	\N
810	348	\N		2018-12-25 11:38:00	\N	\N	\N	\N	t	f	2018-12-20 11:38:31.93088	2018-12-20 11:38:31.93088	2	36	139	f	\N	\N
811	348	\N		2018-12-25 11:39:00	\N	\N	\N	\N	t	f	2018-12-20 11:40:05.655113	2018-12-20 11:40:05.655113	2	36	139	f	\N	\N
812	195	\N		2019-01-03 11:56:00	\N	\N	\N	\N	t	f	2018-12-20 11:56:19.106635	2018-12-20 11:56:19.106635	\N	36	139	f	\N	\N
813	195	\N		2019-01-03 11:56:00	\N	\N	\N	\N	t	f	2018-12-20 11:57:56.841178	2018-12-20 11:57:56.841178	\N	36	139	f	\N	\N
814	32	\N		2019-01-02 11:58:00	\N	\N	\N	\N	t	f	2018-12-20 11:58:55.702192	2018-12-20 11:58:55.702192	\N	36	139	f	\N	\N
815	32	\N		2019-01-02 11:58:00	\N	\N	\N	\N	t	f	2018-12-20 11:58:55.717765	2018-12-20 11:58:55.717765	\N	36	139	f	\N	\N
816	32	\N		2019-01-02 12:01:00	\N	\N	\N	\N	t	f	2018-12-20 12:01:46.92857	2018-12-20 12:01:46.92857	\N	36	139	f	\N	\N
817	32	\N		2019-01-02 12:01:00	\N	\N	\N	\N	t	f	2018-12-20 12:01:46.943163	2018-12-20 12:01:46.943163	\N	36	139	f	\N	\N
818	656	\N		2018-12-26 12:32:00	\N		36	\N	t	f	2018-12-20 12:32:45.346722	2018-12-20 12:32:45.346722	2	\N	139	f	\N	\N
819	682	\N		2018-12-25 12:51:00	\N		36	\N	t	f	2018-12-20 12:52:21.634936	2018-12-20 12:52:21.634936	1	\N	139	f	\N	\N
820	682	\N		2018-12-24 12:54:00	\N		36	\N	t	f	2018-12-20 12:54:57.823649	2018-12-20 12:54:57.823649	1	\N	139	f	\N	\N
821	663	\N		2019-01-01 15:14:00	\N		36	\N	t	f	2018-12-20 15:14:53.985603	2018-12-20 15:14:53.985603	5	\N	139	f	\N	\N
822	348	\N		2018-12-26 15:17:00	\N	\N	\N	\N	t	f	2018-12-20 15:18:02.023016	2018-12-20 15:18:02.023016	2	36	139	f	\N	\N
823	348	\N		2018-12-26 15:17:00	\N	\N	\N	\N	t	f	2018-12-20 15:18:02.045312	2018-12-20 15:18:02.045312	2	36	139	f	\N	\N
824	348	\N		2018-12-24 15:24:00	\N	\N	\N	\N	t	f	2018-12-20 15:24:25.894485	2018-12-20 15:24:25.894485	2	36	139	f	\N	\N
825	348	\N		2019-01-01 15:29:00	\N	\N	\N	\N	t	f	2018-12-20 15:29:48.77759	2018-12-20 15:29:48.77759	2	36	139	f	\N	\N
826	348	\N		2019-01-01 15:29:00	\N	\N	\N	\N	t	f	2018-12-20 15:29:48.795445	2018-12-20 15:29:48.795445	2	36	139	f	\N	\N
827	680	\N		2018-12-25 15:33:00	\N		36	\N	t	f	2018-12-20 15:33:20.690669	2018-12-20 15:33:20.690669	2	\N	139	f	\N	\N
828	852	\N	Head	2018-12-25 17:30:00	\N	\N	\N	\N	t	f	2018-12-20 17:29:19.577429	2018-12-20 17:29:19.577429	1	158	330	f	\N	\N
829	852	\N	Head	2018-12-25 17:30:00	\N	\N	\N	\N	t	f	2018-12-20 17:30:24.680459	2018-12-20 17:30:24.680459	1	158	330	f	\N	\N
830	843	\N	Headaches	2018-12-25 17:33:00	\N	\N	\N	\N	t	f	2018-12-20 17:33:24.893999	2018-12-20 17:33:24.893999	1	36	257	f	\N	\N
831	842	\N	Headaches	2018-12-26 17:34:00	\N	\N	\N	\N	t	f	2018-12-20 17:35:03.514605	2018-12-20 17:35:03.514605	1	36	257	f	\N	\N
832	851	\N		2018-12-25 17:42:00	\N		36	\N	t	f	2018-12-20 17:42:50.245545	2018-12-20 17:42:50.245545	1	\N	330	f	\N	\N
833	808	\N		2018-12-25 12:47:00	\N		36	\N	t	f	2018-12-21 12:47:39.830227	2018-12-21 12:47:39.830227	3	\N	331	f	\N	\N
834	857	\N	Love	2018-12-24 17:57:00	\N	\N	\N	\N	t	f	2018-12-21 17:56:17.742532	2018-12-21 17:56:17.742532	1	158	330	f	\N	\N
835	882	\N	<p>Just testing</p>	2019-01-02 12:07:00	\N	<p>Just testing</p>	158	\N	t	f	2019-01-02 12:08:04.606451	2019-01-02 12:08:04.606451	1	\N	322	f	\N	\N
836	883	\N	<p>hjhyj</p>	2019-01-03 12:16:00	\N	<p>hjjj</p>	36	\N	t	f	2019-01-02 12:16:49.161647	2019-01-02 12:16:49.161647	1	\N	322	f	\N	\N
837	884	\N		2019-01-03 14:25:00	\N		158	\N	t	f	2019-01-02 14:25:01.926297	2019-01-02 14:25:01.926297	1	\N	322	f	\N	\N
838	881	\N		2019-01-04 14:29:00	\N		158	\N	t	f	2019-01-02 14:28:11.000017	2019-01-02 14:28:11.000017	1	\N	322	f	\N	\N
839	885	\N		2019-01-05 14:54:00	\N		158	\N	t	f	2019-01-02 14:53:51.25409	2019-01-02 14:53:51.25409	1	\N	322	f	\N	t
840	886	\N		2019-01-05 15:26:00	\N		158	\N	t	f	2019-01-02 15:25:45.267541	2019-01-02 15:25:45.267541	1	\N	330	f	\N	t
841	887	\N		2019-01-05 18:12:00	\N		158	\N	t	f	2019-01-02 18:11:40.550471	2019-01-02 18:11:40.550471	1	\N	330	f	\N	\N
842	880	9		2019-01-10 18:18:00	\N		158	\N	t	f	2019-01-02 18:17:24.760659	2019-01-02 18:17:24.771355	1	\N	322	f	\N	f
843	888	\N		2019-01-10 18:19:00	\N		158	\N	t	f	2019-01-02 18:19:06.109154	2019-01-02 18:19:06.109154	1	\N	330	f	\N	t
845	891	\N		2019-01-13 11:04:00	\N		158	\N	t	f	2019-01-03 11:04:05.439308	2019-01-03 11:04:05.439308	1	\N	330	f	\N	\N
846	892	\N		2019-01-04 11:08:00	\N		158	\N	t	f	2019-01-03 11:07:36.951378	2019-01-03 11:07:36.951378	1	\N	330	f	\N	\N
847	894	\N		2019-01-04 11:14:00	\N		158	\N	t	f	2019-01-03 11:13:53.106765	2019-01-03 11:13:53.106765	1	\N	330	f	\N	\N
848	909	10		2019-01-31 15:08:00	\N		145	\N	t	f	2019-01-11 12:09:04.603161	2019-01-11 12:09:04.631305	1	\N	257	f	\N	f
849	870	\N		2019-01-18 15:10:00	\N		145	\N	t	f	2019-01-11 12:10:43.857813	2019-01-11 12:10:43.857813	1	\N	257	f	\N	\N
850	899	\N		2019-01-16 15:12:00	\N		145	\N	t	f	2019-01-11 12:12:31.419146	2019-01-11 12:12:31.419146	4	\N	338	f	\N	\N
851	860	10		2019-01-11 15:35:00	\N		145	\N	t	f	2019-01-11 12:36:04.3156	2019-01-11 12:36:04.328276	1	\N	257	f	\N	f
852	914	\N		2019-01-18 16:28:00	\N		145	\N	t	f	2019-01-11 13:28:58.025019	2019-01-11 13:28:58.025019	1	\N	257	f	\N	\N
853	912	10		2019-01-11 16:49:00	\N		145	\N	t	f	2019-01-11 13:50:40.821897	2019-01-11 13:50:40.84855	1	\N	257	f	\N	f
854	840	\N	\N	2019-01-15 21:45:00	\N	\N	\N	\N	t	f	2019-01-14 21:45:34.121784	2019-01-14 21:45:34.121784	\N	36	257	f	\N	\N
855	840	\N	\N	2019-01-15 21:45:00	\N	\N	\N	\N	t	f	2019-01-14 21:45:34.140678	2019-01-14 21:45:34.140678	\N	36	257	f	\N	\N
856	788	\N	Please	2019-01-16 11:39:00	\N	\N	\N	\N	t	f	2019-01-15 12:37:04.039336	2019-01-15 12:37:04.039336	1	\N	322	f	\N	\N
857	920	\N	Pooing	2019-01-24 11:45:00	\N	\N	\N	\N	t	f	2019-01-23 11:45:21.608395	2019-01-23 11:45:21.608395	2	36	322	f	\N	\N
858	920	\N	Pooing	2019-01-24 11:45:00	\N	\N	\N	\N	t	f	2019-01-23 11:45:21.695444	2019-01-23 11:45:21.695444	2	36	322	f	\N	\N
859	919	\N	Farting saaaaa	2019-01-24 11:48:00	\N	\N	\N	\N	t	f	2019-01-23 11:48:46.353999	2019-01-23 11:48:46.353999	1	36	322	f	\N	\N
860	919	\N	Farting saaaaa	2019-01-24 11:48:00	\N	\N	\N	\N	t	f	2019-01-23 11:48:46.368096	2019-01-23 11:48:46.368096	1	36	322	f	\N	\N
861	918	\N	\N	2019-01-24 11:49:00	\N	\N	\N	\N	t	f	2019-01-23 11:50:17.444561	2019-01-23 11:50:17.444561	\N	36	257	f	\N	\N
862	918	\N	\N	2019-01-24 11:49:00	\N	\N	\N	\N	t	f	2019-01-23 11:50:17.459191	2019-01-23 11:50:17.459191	\N	36	257	f	\N	\N
863	918	\N	\N	2019-01-24 11:49:00	\N	\N	\N	\N	t	f	2019-01-23 12:34:11.603462	2019-01-23 12:34:11.603462	\N	323	257	f	\N	\N
864	793	\N	Lol	2018-12-14 12:09:00	\N	\N	\N	\N	t	f	2019-01-23 15:14:23.863091	2019-01-23 15:14:23.863091	\N	323	322	f	\N	\N
865	792	\N	Please	2018-12-14 12:34:00	\N	\N	\N	\N	t	f	2019-01-23 15:29:34.848771	2019-01-23 15:29:34.848771	\N	323	322	f	\N	\N
866	797	\N	\N	2018-12-14 12:16:00	\N	\N	\N	\N	t	f	2019-01-23 15:30:21.647703	2019-01-23 15:30:21.647703	\N	323	322	f	\N	\N
867	904	\N	Cold	2019-01-23 16:46:00	\N	\N	\N	\N	t	f	2019-01-23 17:00:16.674314	2019-01-23 17:00:16.674314	3	\N	342	f	\N	\N
868	921	\N	headache	2019-01-24 17:50:00	\N	\N	\N	\N	t	f	2019-01-23 17:50:45.511646	2019-01-23 17:50:45.511646	1	36	322	f	\N	\N
869	921	\N	headache	2019-01-24 17:50:00	\N	\N	\N	\N	t	f	2019-01-23 17:50:45.588137	2019-01-23 17:50:45.588137	1	36	322	f	\N	\N
870	921	\N	headache	2019-01-24 17:50:00	\N	\N	\N	\N	t	f	2019-01-23 17:50:45.608205	2019-01-23 17:50:45.608205	1	36	322	f	\N	\N
871	917	\N	Nkk	2019-01-25 10:55:00	\N	\N	\N	\N	t	f	2019-01-24 10:55:32.269633	2019-01-24 10:55:32.269633	1	\N	257	f	\N	\N
874	931	\N	Hi	2019-01-25 11:29:00	\N	\N	\N	\N	t	f	2019-01-24 11:29:25.010527	2019-01-24 11:29:55.561222	2	\N	322	f	349	\N
901	946	\N		2019-02-28 12:03:00	\N		158	\N	t	f	2019-02-05 11:02:44.237468	2019-02-05 11:02:44.237468	1	\N	322	f	\N	\N
872	922	\N	checkup	2019-01-25 11:07:00	\N	\N	\N	\N	t	f	2019-01-24 11:08:05.565886	2019-01-24 12:00:09.385368	1	\N	322	f	349	\N
876	929	\N	Standard	2019-01-31 11:41:00	\N	\N	\N	\N	t	f	2019-01-24 11:41:27.526546	2019-01-24 12:20:15.915322	2	\N	322	t	349	t
873	932	\N	Hi	2019-01-25 11:28:00	\N	\N	\N	\N	t	f	2019-01-24 11:28:57.346606	2019-01-24 13:03:56.595928	2	\N	322	f	349	\N
759	831	\N	None	2018-12-20 12:46:00	\N	\N	\N	\N	t	f	2018-12-19 12:46:51.455644	2019-01-24 17:51:02.152165	\N	323	322	f	\N	\N
760	831	\N	None	2018-12-20 12:46:00	\N	\N	\N	\N	t	f	2018-12-19 12:46:51.471591	2019-01-24 17:51:02.162403	\N	323	322	f	\N	\N
670	768	\N	No	2018-12-12 18:01:00	\N	\N	\N	\N	t	f	2018-12-11 18:01:33.394845	2019-01-24 18:21:27.815845	\N	323	322	f	\N	\N
877	928	\N	Mi	2019-01-31 17:39:00	\N	\N	\N	\N	t	f	2019-01-25 16:38:52.559115	2019-01-25 16:38:52.559115	1	\N	322	f	\N	\N
878	927	\N	Sleepy	2019-01-29 17:40:00	\N	\N	\N	\N	t	f	2019-01-25 16:39:27.682652	2019-01-25 16:47:11.817522	1	\N	322	f	354	\N
890	925	\N	Hi	2019-01-31 14:48:00	\N	\N	\N	\N	t	f	2019-01-28 13:47:11.235405	2019-01-28 13:48:32.30336	1	\N	322	f	356	\N
880	933	\N	No	2019-01-28 17:07:00	\N	\N	\N	\N	t	f	2019-01-25 17:07:42.788438	2019-01-25 17:29:21.391396	1	\N	322	t	354	t
891	925	\N	Hi	2019-01-29 13:48:00	\N	\N	\N	\N	t	f	2019-01-28 13:49:19.472096	2019-01-28 13:49:19.472096	1	\N	322	f	\N	\N
883	935	\N	No	2019-01-28 18:47:00	\N	\N	\N	\N	t	f	2019-01-25 18:47:41.721789	2019-01-25 18:49:09.872815	1	\N	322	f	354	\N
888	926	\N	Please	2019-01-30 14:46:00	\N	\N	\N	\N	t	f	2019-01-28 13:45:57.621546	2019-01-28 13:50:38.562575	1	\N	322	f	356	\N
882	935	\N	No	2019-01-28 18:47:00	\N	\N	\N	\N	t	f	2019-01-25 18:47:35.150052	2019-01-25 18:59:06.526477	1	\N	322	t	354	t
881	936	\N	Hi	2019-01-26 18:46:00	\N	\N	\N	\N	t	f	2019-01-25 18:46:57.617467	2019-01-25 18:59:48.787268	1	\N	322	f	354	\N
884	938	\N	Hi	2019-01-26 19:19:00	\N	\N	\N	\N	t	f	2019-01-25 19:19:31.162086	2019-01-25 19:19:31.162086	1	\N	322	f	\N	\N
885	937	\N	Hu	2019-01-28 19:19:00	\N	\N	\N	\N	t	f	2019-01-25 19:19:59.152802	2019-01-28 13:57:15.822386	1	\N	322	t	354	t
898	942	\N	Test	2019-01-29 14:30:00	\N	\N	\N	\N	t	f	2019-01-28 14:30:59.195332	2019-01-28 14:30:59.195332	1	\N	322	f	\N	\N
886	939	\N	Wound dressing 	2019-01-31 13:23:00	\N	\N	\N	\N	t	f	2019-01-26 10:26:31.893544	2019-01-26 10:28:19.381898	1	\N	257	f	335	\N
887	940	\N	Din	2019-01-30 13:56:00	\N	\N	\N	\N	t	f	2019-01-26 10:56:11.055783	2019-01-26 10:57:27.168237	1	\N	257	f	335	\N
889	941	\N	<p>none</p>	2019-01-29 13:45:00	\N	\N	\N	\N	t	f	2019-01-28 13:46:09.296291	2019-01-28 13:46:09.296291	\N	\N	322	f	\N	\N
892	923	\N	Hi	2019-01-29 13:59:00	\N	\N	\N	\N	t	f	2019-01-28 14:00:06.048036	2019-01-28 14:00:06.048036	1	\N	322	f	\N	\N
893	923	\N	Hi	2019-01-29 13:59:00	\N	\N	\N	\N	t	f	2019-01-28 14:01:40.778986	2019-01-28 14:01:40.778986	1	\N	322	f	357	\N
894	924	\N	Hi	2019-01-30 14:02:00	\N	\N	\N	\N	t	f	2019-01-28 14:02:39.601958	2019-01-28 14:02:39.601958	2	\N	322	f	\N	\N
895	924	\N	Hi	2019-01-30 14:02:00	\N	\N	\N	\N	t	f	2019-01-28 14:03:04.063024	2019-01-28 14:03:04.063024	2	\N	322	f	357	\N
896	872	\N	Tesr	2019-01-29 14:03:00	\N	\N	\N	\N	t	f	2019-01-28 14:03:50.463824	2019-01-28 14:03:50.463824	3	\N	331	f	\N	\N
897	872	\N	Tesr	2019-01-29 14:03:00	\N	\N	\N	\N	t	f	2019-01-28 14:08:03.058506	2019-01-28 14:08:03.058506	3	\N	331	f	357	\N
899	942	\N	Test	2019-01-29 14:30:00	\N	\N	\N	\N	t	f	2019-01-28 14:31:22.266788	2019-01-28 14:31:22.266788	1	\N	322	f	357	\N
676	776	\N	No	2018-12-11 18:21:00	\N	\N	\N	\N	t	f	2018-12-11 18:22:01.477271	2019-02-04 15:26:31.453811	1	323	322	f	\N	\N
689	782	\N		2019-02-05 12:02:00	\N		158	\N	t	f	2018-12-13 11:22:35.654589	2018-12-13 11:22:35.654589	1	\N	322	f	\N	t
844	890	\N		2019-02-05 12:02:00	\N		158	\N	t	f	2019-01-03 11:01:52.847558	2019-01-03 11:01:52.847558	1	\N	330	f	\N	t
875	930	\N	Hi	2019-02-05 12:02:00	\N	\N	\N	\N	t	f	2019-01-24 11:40:07.112235	2019-01-24 11:40:07.112235	2	\N	322	f	\N	t
879	934	\N	No	2019-02-05 12:02:00	\N	\N	\N	\N	t	f	2019-01-25 17:07:10.440759	2019-01-25 17:07:10.440759	1	\N	322	f	\N	t
902	945	2		2019-02-28 12:10:00	\N		158	\N	t	f	2019-02-05 11:09:34.814241	2019-02-05 11:09:34.825319	1	\N	322	f	\N	f
900	944	\N	Final testing	2019-02-28 12:00:00	\N	\N	\N	\N	t	f	2019-02-05 11:01:32.855807	2019-02-05 11:29:41.645115	1	\N	322	f	356	\N
904	913	\N		2019-02-28 12:41:00	\N		158	\N	t	f	2019-02-05 11:40:35.534483	2019-02-05 11:40:35.534483	1	\N	257	f	\N	\N
903	950	\N	Testing mic	2019-02-08 12:20:00	\N	\N	\N	\N	t	f	2019-02-05 11:28:51.447066	2019-02-05 11:29:28.072664	1	\N	322	f	356	\N
907	947	\N		2019-02-05 12:20:00	\N		158	\N	t	f	2019-02-05 12:00:49.03034	2019-02-05 12:00:49.03034	1	\N	322	f	\N	\N
908	955	\N	\N	2019-02-05 12:15:00	\N	\N	\N	\N	t	f	2019-02-05 12:01:59.36886	2019-02-05 12:04:22.542793	\N	323	322	f	\N	\N
911	948	\N	Current medical	2019-02-05 12:15:00	\N	\N	\N	\N	t	f	2019-02-05 12:06:21.932371	2019-02-05 12:12:40.482055	\N	323	322	f	\N	\N
910	951	\N	Pls	2019-02-05 12:15:00	\N	\N	\N	\N	t	f	2019-02-05 12:05:48.37376	2019-02-05 12:13:31.702675	\N	323	322	f	\N	\N
909	952	\N	Please	2019-02-05 12:20:00	\N	\N	\N	\N	t	f	2019-02-05 12:04:39.387087	2019-02-05 12:14:11.312316	\N	323	322	f	\N	\N
912	954	\N	\N	2019-02-05 12:45:00	\N	\N	\N	\N	t	f	2019-02-05 12:27:18.549912	2019-02-05 12:27:18.549912	\N	\N	322	f	\N	\N
913	957	\N	Hi	2019-02-05 12:45:00	\N	\N	\N	\N	t	f	2019-02-05 12:27:53.711875	2019-02-05 12:27:53.711875	1	\N	322	f	\N	\N
914	956	\N	Hello	2019-02-05 12:45:00	\N	\N	\N	\N	t	f	2019-02-05 12:29:32.098348	2019-02-05 12:29:32.098348	\N	\N	322	f	\N	\N
915	958	\N	<p>complaint</p>	2019-02-05 17:31:00	\N	<p>remark</p>	158	\N	t	f	2019-02-05 17:31:43.413464	2019-02-05 17:31:43.413464	1	\N	322	f	\N	\N
916	906	\N		2019-02-06 17:42:00	\N		158	\N	t	f	2019-02-05 17:42:27.697513	2019-02-05 17:42:27.697513	2	\N	342	f	\N	\N
917	959	\N		2019-02-06 17:44:00	\N		158	\N	t	f	2019-02-05 17:44:54.211767	2019-02-05 17:44:54.211767	1	\N	322	f	\N	\N
905	953	\N	Hi	2019-02-08 12:20:00	\N	\N	\N	\N	t	f	2019-02-05 11:59:22.356124	2019-02-05 12:11:15.263037	1	\N	322	f	354	\N
906	949	\N	\nMedical problems	2019-02-08 12:20:00	\N	\N	\N	\N	t	f	2019-02-05 12:00:03.996882	2019-02-05 12:10:54.619701	1	\N	322	f	354	\N
\.


--
-- Name: confirmed_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.confirmed_appointments_id_seq', 917, true);


--
-- Data for Name: confirmed_conditions; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.confirmed_conditions (id, confirmed_appointment_id, condition_id, allergy_id, comment, user_id, entity, active_status, del_status, created_at, updated_at) FROM stdin;
\.


--
-- Name: confirmed_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.confirmed_conditions_id_seq', 1, false);


--
-- Data for Name: confirmed_personal_doctor_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.confirmed_personal_doctor_services (id, doctor_id, patient_id, comment, entity_id, user_id, active_status, del_status, created_at, updated_at, pre_appointment_id, suburb_id, appointment_type_id, confirmed_appointment_id) FROM stdin;
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
36	248	250		\N	\N	t	f	2018-06-14 13:08:41.75679	2018-06-14 13:08:41.75679	230	1	PD	150
37	248	247		\N	\N	t	f	2018-06-16 00:43:46.667161	2018-06-16 00:43:46.667161	224	1	PD	155
38	238	256	agreed	\N	\N	t	f	2018-06-19 17:55:25.573655	2018-06-19 17:55:25.573655	248	1	PD	158
39	258	257	see him	\N	\N	t	f	2018-06-20 11:13:07.750607	2018-06-20 11:13:07.750607	259	1	PD	162
40	248	216	New patient	\N	\N	t	f	2018-07-22 22:13:35.841715	2018-07-22 22:13:35.841715	167	1	PD	210
41	248	234	new patient again	\N	\N	t	f	2018-07-22 22:31:43.034041	2018-07-22 22:31:43.034041	179	1	PD	211
42	248	234	new patient again	\N	\N	t	f	2018-07-22 22:31:45.160747	2018-07-22 22:31:45.160747	179	1	PD	212
43	264	262	Personal Doctor	\N	\N	t	f	2018-07-23 17:52:18.526226	2018-07-23 17:52:18.526226	332	1	PD	221
44	140	268		\N	\N	t	f	2018-08-07 23:02:29.022611	2018-08-07 23:02:29.022611	349	1	PD	240
45	230	272		\N	\N	t	f	2018-08-08 15:07:11.863949	2018-08-08 15:07:11.863949	351	3	PD	246
46	258	276		\N	\N	t	f	2018-08-09 12:46:31.731823	2018-08-09 13:02:51.177587	373	1	PD	262
47	264	212	New patient	\N	\N	t	f	2018-08-09 19:25:21.920479	2018-08-09 19:25:21.920479	166	1	PD	273
48	140	277		\N	\N	t	f	2018-08-10 12:16:54.898226	2018-08-10 14:34:31.182327	394	3	PD	\N
49	140	281	\N	\N	\N	t	f	2018-08-13 16:34:38.70754	2018-08-13 16:34:38.70754	411	1	PD	\N
50	285	286	\N	\N	\N	t	f	2018-08-17 15:20:22.798226	2018-08-17 15:20:22.798226	446	1	HC	\N
51	285	286	\N	\N	\N	t	f	2018-08-17 17:08:24.641997	2018-08-17 17:08:24.641997	447	1	PD	\N
52	285	286	\N	\N	\N	t	f	2018-08-17 17:57:50.89161	2018-08-17 17:57:50.89161	449	\N	PC	\N
53	285	286	\N	\N	\N	t	f	2018-08-17 18:04:43.057678	2018-08-17 18:04:43.057678	450	\N	PDVC	\N
54	285	286	\N	\N	\N	t	f	2018-08-17 18:08:44.097052	2018-08-17 18:08:44.097052	451	1	PDHC	\N
55	264	247	\N	\N	\N	t	f	2018-08-19 21:09:09.978344	2018-08-19 21:09:09.978344	321	\N	MD	\N
56	264	247	\N	\N	\N	t	f	2018-08-19 21:21:14.365972	2018-08-19 21:21:14.365972	320	\N	MD	\N
57	264	286	\N	\N	\N	t	f	2018-08-19 21:21:26.532151	2018-08-19 21:21:26.532151	444	\N	VC	\N
58	264	247	\N	\N	\N	t	f	2018-08-19 21:38:19.796314	2018-08-19 21:38:19.796314	292	\N	HC	\N
59	264	262	\N	\N	\N	t	f	2018-08-19 21:41:41.422693	2018-08-19 21:41:41.422693	311	\N	VC	\N
60	264	250	\N	\N	\N	t	f	2018-08-19 21:48:57.932955	2018-08-19 21:48:57.932955	284	\N	HC	\N
61	264	162	\N	\N	\N	t	f	2018-08-19 22:00:34.005061	2018-08-19 22:00:34.005061	82	\N	VC	\N
62	264	256	\N	\N	\N	t	f	2018-08-19 22:08:02.023741	2018-08-19 22:08:02.023741	255	\N	PDVC	\N
63	291	289	\N	\N	\N	t	f	2018-08-22 16:39:08.359241	2018-08-22 16:39:08.359241	468	1	HC	\N
64	291	289	\N	\N	\N	t	f	2018-08-22 16:42:59.179563	2018-08-22 16:42:59.179563	467	\N	VC	\N
65	291	289	\N	\N	\N	t	f	2018-08-22 17:24:02.38398	2018-08-22 17:24:02.38398	474	1	HC	\N
66	248	247	\N	\N	\N	t	f	2018-08-24 14:35:14.509922	2018-08-24 14:35:14.509922	429	3	PDHC	\N
67	248	247	\N	\N	\N	t	f	2018-08-24 14:41:43.079595	2018-08-24 14:41:43.079595	427	\N	PDVC	\N
68	298	289	\N	\N	\N	t	f	2018-08-27 10:48:05.676212	2018-08-27 10:48:05.676212	475	1	PD	\N
69	291	289	\N	\N	\N	t	f	2018-08-27 15:19:07.285255	2018-08-27 15:19:07.285255	475	1	PD	\N
70	298	286	\N	\N	\N	t	f	2018-08-27 15:21:57.149061	2018-08-27 15:21:57.149061	459	\N	PDDP	\N
71	303	304	\N	\N	\N	t	f	2018-09-10 15:50:05.927696	2018-09-10 15:50:05.927696	494	1	HC	\N
72	303	304	\N	\N	\N	t	f	2018-09-10 15:50:49.823605	2018-09-10 15:50:49.823605	493	\N	VC	\N
73	303	304	\N	\N	\N	t	f	2018-09-10 15:51:29.814237	2018-09-10 15:51:29.814237	492	\N	VC	\N
74	303	304	\N	\N	\N	t	f	2018-09-10 16:10:03.369311	2018-09-10 16:10:03.369311	495	1	PD	\N
75	303	304	\N	\N	\N	t	f	2018-09-10 18:25:28.572006	2018-09-10 18:25:28.572006	499	\N	PDDP	\N
76	303	304	\N	\N	\N	t	f	2018-09-10 18:30:48.085859	2018-09-10 18:30:48.085859	498	1	PDHC	\N
77	303	304	\N	\N	\N	t	f	2018-09-10 18:31:51.589991	2018-09-10 18:31:51.589991	496	\N	PC	\N
78	308	306	\N	\N	\N	t	f	2018-09-13 18:06:19.144109	2018-09-13 18:06:19.144109	504	\N	VC	\N
79	308	286	\N	\N	\N	t	f	2018-09-13 18:06:40.711209	2018-09-13 18:06:40.711209	454	3	PDHC	\N
80	298	289	\N	\N	\N	t	f	2018-09-15 19:38:49.436305	2018-09-15 19:38:49.436305	515	\N	PC	\N
81	298	289	\N	\N	\N	t	f	2018-09-15 19:42:40.448383	2018-09-15 19:42:40.448383	514	\N	PC	\N
82	291	289	\N	\N	\N	t	f	2018-09-15 19:45:42.837606	2018-09-15 19:45:42.837606	512	\N	VC	\N
83	291	289	\N	\N	\N	t	f	2018-09-15 19:46:01.910957	2018-09-15 19:46:01.910957	513	1	HC	\N
84	264	286	\N	\N	\N	t	f	2018-09-17 10:39:25.019214	2018-09-17 10:39:25.019214	455	\N	PC	\N
85	264	234	\N	\N	\N	t	f	2018-09-17 10:39:45.170416	2018-09-17 10:39:45.170416	354	\N	PC	\N
86	319	321	\N	\N	\N	t	f	2018-09-17 12:40:53.819081	2018-09-17 12:40:53.819081	528	1	PD	\N
87	319	321	\N	\N	\N	t	f	2018-09-17 12:50:30.29868	2018-09-17 12:50:30.29868	529	\N	PC	\N
88	323	322	\N	\N	\N	t	f	2018-09-17 18:38:55.053671	2018-09-17 18:38:55.053671	535	1	HC	\N
89	323	322	\N	\N	\N	t	f	2018-09-17 18:39:23.649342	2018-09-17 18:39:23.649342	534	\N	VC	\N
90	323	322	\N	\N	\N	t	f	2018-09-17 18:50:33.045744	2018-09-17 18:50:33.045744	537	\N	VC	\N
91	323	322	\N	\N	\N	t	f	2018-09-17 18:58:17.537425	2018-09-17 18:58:17.537425	536	1	PD	\N
92	323	322	\N	\N	\N	t	f	2018-09-17 19:14:57.149705	2018-09-17 19:14:57.149705	538	\N	PC	\N
93	323	322	\N	\N	\N	t	f	2018-09-17 19:15:05.373056	2018-09-17 19:15:05.373056	540	\N	PDVC	\N
94	323	322	\N	\N	\N	t	f	2018-09-17 19:15:14.802498	2018-09-17 19:15:14.802498	541	1	PDHC	\N
95	323	322	\N	\N	\N	t	f	2018-09-17 19:16:57.333622	2018-09-17 19:16:57.333622	542	\N	PDDP	\N
96	230	272	\N	\N	\N	t	f	2018-09-18 14:23:50.890715	2018-09-18 14:23:50.890715	539	\N	PDVC	\N
97	323	322	\N	\N	\N	t	f	2018-09-18 17:41:11.86841	2018-09-18 17:41:11.86841	545	1	HC	\N
98	323	322	\N	\N	\N	t	f	2018-09-18 17:42:16.500437	2018-09-18 17:42:16.500437	546	\N	PC	\N
99	323	322	\N	\N	\N	t	f	2018-09-18 18:33:36.003021	2018-09-18 18:33:36.003021	548	\N	PDDP	\N
100	258	325	\N	\N	\N	t	f	2018-09-18 20:01:00.624946	2018-09-18 20:01:00.624946	556	1	PD	\N
101	258	257	\N	\N	\N	t	f	2018-09-18 20:01:12.626786	2018-09-18 20:01:12.626786	412	\N	PC	\N
102	258	325	\N	\N	\N	t	f	2018-09-18 20:12:04.420731	2018-09-18 20:12:04.420731	557	\N	PC	\N
103	258	325	\N	\N	\N	t	f	2018-09-18 20:12:12.534991	2018-09-18 20:12:12.534991	558	\N	PDVC	\N
104	323	322	\N	\N	\N	t	f	2018-09-19 15:36:18.04011	2018-09-19 15:36:18.04011	570	1	HC	\N
105	323	322	\N	\N	\N	t	f	2018-09-19 17:33:04.217394	2018-09-19 17:33:04.217394	572	1	PDHC	\N
106	323	322	\N	\N	\N	t	f	2018-09-19 19:04:13.341479	2018-09-19 19:04:13.341479	547	\N	PDDP	\N
107	323	322	\N	\N	\N	t	f	2018-09-20 12:04:03.266424	2018-09-20 12:04:03.266424	581	\N	VC	\N
108	323	322	\N	\N	\N	t	f	2018-09-20 12:04:20.1427	2018-09-20 12:04:20.1427	582	\N	VC	\N
109	323	322	\N	\N	\N	t	f	2018-09-20 12:04:48.39423	2018-09-20 12:04:48.39423	583	1	HC	\N
110	323	322	\N	\N	\N	t	f	2018-09-20 12:05:26.42051	2018-09-20 12:05:26.42051	584	1	HC	\N
111	323	322	\N	\N	\N	t	f	2018-09-20 12:16:06.1544	2018-09-20 12:16:06.1544	585	\N	PC	\N
112	323	322	\N	\N	\N	t	f	2018-09-20 12:16:18.909929	2018-09-20 12:16:18.909929	586	\N	PC	\N
113	323	322	\N	\N	\N	t	f	2018-09-20 12:18:25.859783	2018-09-20 12:18:25.859783	588	\N	PDVC	\N
114	323	322	\N	\N	\N	t	f	2018-09-20 12:24:21.417659	2018-09-20 12:24:21.417659	590	1	PDHC	\N
115	323	322	\N	\N	\N	t	f	2018-09-20 12:24:38.300054	2018-09-20 12:24:38.300054	591	\N	PDDP	\N
116	323	322	\N	\N	\N	t	f	2018-09-20 12:24:49.358706	2018-09-20 12:24:49.358706	593	\N	PDDP	\N
117	323	322	\N	\N	\N	t	f	2018-09-20 12:25:00.097204	2018-09-20 12:25:00.097204	592	\N	PDDP	\N
118	258	325	\N	\N	\N	t	f	2018-09-25 06:04:26.058453	2018-09-25 06:04:26.058453	614	\N	PC	\N
119	258	325	\N	\N	\N	t	f	2018-09-25 06:04:37.388744	2018-09-25 06:04:37.388744	615	\N	PDVC	\N
120	258	325	\N	\N	\N	t	f	2018-09-25 06:11:27.536472	2018-09-25 06:11:27.536472	616	1	PDHC	\N
121	258	325	\N	\N	\N	t	f	2018-09-25 06:11:53.67662	2018-09-25 06:11:53.67662	617	\N	PDDP	\N
122	230	272	\N	\N	\N	t	f	2018-09-25 09:23:26.760051	2018-09-25 09:23:26.760051	621	\N	PDDP	\N
123	230	272	\N	\N	\N	t	f	2018-09-25 09:24:05.677784	2018-09-25 09:24:05.677784	478	\N	PDDP	\N
124	230	272	\N	\N	\N	t	f	2018-09-25 10:03:10.997099	2018-09-25 10:03:10.997099	622	\N	PDDP	\N
125	323	322	\N	\N	\N	t	f	2018-09-25 10:54:10.25014	2018-09-25 10:54:10.25014	566	\N	PDDP	\N
126	230	272	\N	\N	\N	t	f	2018-09-27 16:03:09.529357	2018-09-27 16:03:09.529357	632	\N	PDDP	\N
127	230	272	\N	\N	\N	t	f	2018-09-27 16:03:28.622828	2018-09-27 16:03:28.622828	631	\N	PDDP	\N
128	230	272	\N	\N	\N	t	f	2018-09-27 16:03:44.356946	2018-09-27 16:03:44.356946	629	\N	PDVC	\N
129	230	272	\N	\N	\N	t	f	2018-09-27 16:04:00.048727	2018-09-27 16:04:00.048727	628	\N	PC	\N
130	230	272	\N	\N	\N	t	f	2018-09-27 16:04:28.71845	2018-09-27 16:04:28.71845	521	\N	PC	\N
131	230	272	\N	\N	\N	t	f	2018-09-27 16:05:11.1527	2018-09-27 16:05:11.1527	627	1	HC	\N
132	230	272	\N	\N	\N	t	f	2018-09-27 16:05:29.577251	2018-09-27 16:05:29.577251	626	\N	VC	\N
133	258	257	\N	\N	\N	t	f	2018-09-28 15:31:22.80311	2018-09-28 15:31:22.80311	642	\N	PC	\N
134	258	257	\N	\N	\N	t	f	2018-09-28 15:31:55.998097	2018-09-28 15:31:55.998097	640	\N	VC	\N
135	258	257	\N	\N	\N	t	f	2018-09-28 15:32:19.071846	2018-09-28 15:32:19.071846	641	1	HC	\N
136	258	257	\N	\N	\N	t	f	2018-09-28 15:32:36.186612	2018-09-28 15:32:36.186612	643	\N	VC	\N
137	323	322	\N	\N	\N	t	f	2018-10-10 21:37:04.302764	2018-10-10 21:37:04.302764	604	\N	PDVC	\N
138	258	257	\N	\N	\N	t	f	2018-11-29 11:42:23.738962	2018-11-29 11:42:23.738962	607	\N	VC	\N
139	258	257	\N	\N	\N	t	f	2018-11-29 11:44:41.873834	2018-11-29 11:44:41.873834	610	\N	PDVC	\N
140	258	257	\N	\N	\N	t	f	2018-11-29 11:45:20.006775	2018-11-29 11:45:20.006775	608	\N	PC	\N
141	323	322	\N	\N	\N	t	f	2018-12-06 18:04:41.419405	2018-12-06 18:04:41.419405	732	\N	VC	\N
142	323	322	\N	\N	\N	t	f	2018-12-06 18:05:48.458052	2018-12-06 18:05:48.458052	734	1	HC	\N
143	323	322	\N	\N	\N	t	f	2018-12-06 18:48:24.735778	2018-12-06 18:48:24.735778	602	1	HC	\N
144	323	322	\N	\N	\N	t	f	2018-12-11 18:27:10.50816	2018-12-11 18:27:10.50816	770	1	HC	\N
145	323	322	\N	\N	\N	t	f	2018-12-13 12:40:14.416397	2018-12-13 12:40:14.416397	789	1	HC	\N
146	230	330	\N	\N	\N	t	f	2018-12-13 14:28:54.556873	2018-12-13 14:28:54.556873	804	1	PD	\N
147	258	257	\N	\N	\N	t	f	2018-12-14 10:20:57.077703	2018-12-14 10:20:57.077703	826	\N	VC	\N
148	258	257	\N	\N	\N	t	f	2018-12-14 10:21:25.547914	2018-12-14 10:21:25.547914	736	1	HC	\N
149	258	257	\N	\N	\N	t	f	2018-12-14 10:21:47.945718	2018-12-14 10:21:47.945718	740	1	HC	\N
150	258	257	\N	\N	\N	t	f	2018-12-14 10:22:16.548738	2018-12-14 10:22:16.548738	819	\N	PDVC	\N
151	258	257	\N	\N	\N	t	f	2018-12-14 10:24:19.639567	2018-12-14 10:24:19.639567	825	\N	PDDP	\N
152	258	257	\N	\N	\N	t	f	2018-12-14 10:24:39.026714	2018-12-14 10:24:39.026714	824	1	PDHC	\N
153	258	257	\N	\N	\N	t	f	2018-12-14 10:25:04.081373	2018-12-14 10:25:04.081373	817	\N	PC	\N
154	258	257	\N	\N	\N	t	f	2018-12-14 10:25:22.999557	2018-12-14 10:25:22.999557	741	\N	PC	\N
155	258	257	\N	\N	\N	t	f	2018-12-15 10:57:40.287609	2018-12-15 10:57:40.287609	837	\N	PC	\N
156	258	257	\N	\N	\N	t	f	2018-12-18 16:39:41.980228	2018-12-18 16:39:41.980228	850	1	HC	\N
158	323	257	\N	\N	\N	t	f	2019-01-23 12:34:11.60553	2019-01-23 12:34:11.60553	918	\N	PDDP	\N
159	323	322	\N	\N	\N	t	f	2019-01-23 15:14:23.865348	2019-01-23 15:14:23.865348	793	\N	PDVC	\N
160	323	322	\N	\N	\N	t	f	2019-01-23 15:29:34.850942	2019-01-23 15:29:34.850942	792	\N	PDVC	\N
161	323	322	\N	\N	\N	t	f	2019-01-23 15:30:21.649837	2019-01-23 15:30:21.649837	797	\N	PDDP	\N
163	323	322	\N	\N	\N	t	f	2019-01-24 11:04:32.792521	2019-01-24 11:04:32.792521	769	1	HC	\N
164	323	322	\N	\N	\N	t	f	2019-01-24 11:04:51.714535	2019-01-24 11:04:51.714535	794	1	PDHC	\N
165	323	322	\N	\N	\N	t	f	2019-01-24 17:51:02.110111	2019-01-24 17:51:02.110111	831	\N	VC	\N
166	323	322	\N	\N	\N	t	f	2019-01-24 18:21:27.78323	2019-01-24 18:21:27.78323	768	\N	VC	\N
167	323	322	\N	\N	\N	t	f	2019-01-25 15:33:46.988499	2019-01-25 15:33:46.988499	727	\N	PDVC	\N
168	323	322	\N	\N	\N	t	f	2019-01-25 15:37:24.87872	2019-01-25 15:37:24.87872	787	\N	VC	\N
169	323	322	\N	\N	\N	t	f	2019-01-25 15:39:11.421901	2019-01-25 15:39:11.421901	798	\N	PDVC	\N
170	323	322	\N	\N	\N	t	f	2019-01-25 15:41:08.922609	2019-01-25 15:41:08.922609	778	\N	PDDP	\N
171	323	322	\N	\N	\N	t	f	2019-02-04 15:26:31.428037	2019-02-04 15:26:31.428037	776	1	PDHC	\N
172	323	322	\N	\N	\N	t	f	2019-02-05 11:41:45.977866	2019-02-05 11:41:45.977866	795	1	PDHC	\N
173	323	322	\N	\N	\N	t	f	2019-02-05 11:42:40.120944	2019-02-05 11:42:40.120944	791	\N	PC	\N
174	323	322	\N	\N	\N	t	f	2019-02-05 12:04:22.517136	2019-02-05 12:04:22.517136	955	\N	PDDP	\N
175	323	322	\N	\N	\N	t	f	2019-02-05 12:12:40.45612	2019-02-05 12:12:40.45612	948	\N	VC	\N
176	323	322	\N	\N	\N	t	f	2019-02-05 12:13:31.676921	2019-02-05 12:13:31.676921	951	\N	PC	\N
177	323	322	\N	\N	\N	t	f	2019-02-05 12:14:11.286805	2019-02-05 12:14:11.286805	952	\N	PC	\N
178	323	322	\N	\N	\N	t	f	2019-02-05 12:14:35.849005	2019-02-05 12:14:35.849005	773	\N	PDVC	\N
179	323	322	\N	\N	\N	t	f	2019-02-05 12:15:19.634711	2019-02-05 12:15:19.634711	774	\N	PDVC	\N
\.


--
-- Name: confirmed_personal_doctor_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.confirmed_personal_doctor_services_id_seq', 179, true);


--
-- Data for Name: country_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.country_masters (id, country_name, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	Ghana		\N	36	t	\N	2018-03-05 11:00:17.224621	2018-03-05 11:00:17.224621
2	Nigeria		\N	84	t	\N	2018-03-05 11:01:11.584752	2018-03-05 11:01:11.584752
3	Togo		\N	84	t	\N	2018-03-05 11:01:44.630775	2018-03-05 11:01:44.630775
4	South Africa		\N	83	t	\N	2018-03-05 11:02:59.566294	2018-03-05 11:02:59.566294
5	Liberia		\N	145	t	\N	2018-08-07 14:41:09.012116	2019-01-07 22:21:50.472756
\.


--
-- Name: country_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.country_masters_id_seq', 5, true);


--
-- Data for Name: decline_comments; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.decline_comments (id, pre_confirmed_appointment_id, available_date, comment, active_status, del_status, created_at, updated_at, doctor_id, nurse_id) FROM stdin;
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
21	59	2018-06-25 16:26:00	Have a birthday	t	f	2018-06-13 16:26:39.307751	2018-06-13 16:26:39.307751	248	\N
22	45	\N	\N	\N	\N	2018-06-13 17:11:59.570182	2018-06-13 17:11:59.570182	\N	\N
23	48	2018-06-17 00:00:00	Busy	t	f	2018-06-13 17:35:19.605079	2018-06-13 17:35:19.605079	248	\N
24	65	2018-10-13 00:00:00	Booked	t	f	2018-06-13 19:05:19.874507	2018-06-13 19:05:19.874507	248	\N
25	75	2018-06-16 00:00:00	Booked	t	f	2018-06-16 11:49:09.455679	2018-06-16 11:49:09.455679	252	\N
26	94	2018-06-16 00:00:00	🤷🏽‍♀️	t	f	2018-06-16 11:52:42.108178	2018-06-16 11:52:42.108178	252	\N
27	102	2018-06-20 00:00:00	Busy	t	f	2018-06-20 01:08:22.418521	2018-06-20 01:08:22.418521	248	\N
28	111	2018-06-20 08:27:00	Busy	t	f	2018-06-20 08:28:06.44291	2018-06-20 08:28:06.44291	246	\N
29	115	2018-06-22 00:00:00	Resting	t	f	2018-06-20 09:29:10.272853	2018-06-20 09:29:10.272853	248	\N
30	134	2018-06-24 00:00:00	Going for a meeting	t	f	2018-06-21 11:08:47.549377	2018-06-21 11:08:47.549377	248	\N
31	132	2018-06-28 00:00:00	Hello	t	f	2018-06-21 11:13:40.437943	2018-06-21 11:13:40.437943	248	\N
32	128	2018-06-24 00:00:00		t	f	2018-06-21 11:16:23.744568	2018-06-21 11:16:23.744568	248	\N
33	168	2018-06-22 00:00:00	Because i dont want to 🤷🏽‍♀️	t	f	2018-06-22 09:45:50.166384	2018-06-22 09:45:50.166384	248	\N
34	190	2018-07-11 00:00:00	Nothing	t	f	2018-07-03 12:39:04.307769	2018-07-03 12:39:04.307769	248	\N
35	189	2018-07-27 00:00:00	no reason	t	f	2018-07-03 12:48:41.561688	2018-07-03 12:48:41.561688	248	\N
36	191	2018-07-12 00:00:00	Fdsfa	t	f	2018-07-03 12:50:04.732663	2018-07-03 12:50:04.732663	248	\N
37	186	2018-07-05 00:00:00	Rewre	t	f	2018-07-03 12:52:53.381139	2018-07-03 12:52:53.381139	248	\N
38	195	2018-07-03 00:00:00	Huh	t	f	2018-07-03 13:19:29.396408	2018-07-03 13:19:29.396408	248	\N
39	199	2018-07-16 00:00:00	Tired	t	f	2018-07-16 12:44:15.910977	2018-07-16 12:44:15.910977	248	\N
40	207	2018-12-20 00:00:00	I dont like video calls 🙄	t	f	2018-07-20 10:40:52.301323	2018-07-20 10:40:52.301323	248	\N
41	242	2018-08-24 00:00:00	Off	t	f	2018-07-24 11:20:59.514597	2018-07-24 11:20:59.514597	264	\N
42	249	2018-12-24 00:00:00		t	f	2018-07-24 11:25:08.199857	2018-07-24 11:25:08.199857	264	\N
43	248	2018-07-29 00:00:00		t	f	2018-07-24 12:25:33.148302	2018-07-24 12:25:33.148302	264	\N
44	232	2018-10-07 00:00:00		t	f	2018-08-07 15:48:02.529992	2018-08-07 15:48:02.529992	248	\N
45	218	2018-11-07 00:00:00	I dont want to	t	f	2018-08-07 15:53:43.985673	2018-08-07 15:53:43.985673	248	\N
46	304	2018-10-09 00:00:00	Unavailable	t	f	2018-08-09 13:25:56.018434	2018-08-09 13:25:56.018434	258	\N
47	146	2018-08-17 18:17:00	won t be available 	t	f	2018-08-16 18:18:06.654795	2018-08-16 18:18:06.654795	140	\N
48	261	2018-08-19 00:00:00		t	f	2018-08-19 21:21:38.907643	2018-08-19 21:21:38.907643	264	\N
49	387	2018-08-22 00:00:00	None	t	f	2018-08-22 16:41:05.670349	2018-08-22 16:41:05.670349	248	\N
50	406	2018-11-10 00:00:00	None	t	f	2018-09-10 18:31:30.101067	2018-09-10 18:31:30.101067	303	\N
51	398	2018-12-15 00:00:00	Dont gerrit	t	f	2018-09-15 19:39:48.78188	2018-09-15 19:39:48.78188	298	\N
52	412	2018-11-15 00:00:00	Empty	t	f	2018-09-15 19:41:56.907313	2018-09-15 19:41:56.907313	298	\N
53	437	2018-12-18 00:00:00	On official duty in Canada	t	f	2018-09-18 14:25:01.059688	2018-09-18 14:25:01.059688	230	\N
54	458	2018-10-22 00:00:00	Busy schedule 	t	f	2018-09-20 12:17:49.172054	2018-09-20 12:17:49.172054	323	\N
55	456	2018-09-20 00:00:00		t	f	2018-09-20 12:22:11.35261	2018-09-20 12:22:11.35261	323	\N
56	313	2018-09-30 00:00:00	Short vacation	t	f	2018-09-27 16:06:34.056595	2018-09-27 16:06:34.056595	230	\N
57	300	2018-12-30 00:00:00	On strike	t	f	2018-09-27 16:07:36.256291	2018-09-27 16:07:36.256291	230	\N
58	544	2019-01-26 00:00:00	Ione	t	f	2019-01-24 18:21:57.819098	2019-01-24 18:21:57.819098	323	\N
59	477	2019-01-29 00:00:00	Hhh	t	f	2019-01-24 18:25:55.696975	2019-01-24 18:25:55.696975	323	\N
60	517	2019-01-27 00:00:00	None	t	f	2019-01-25 15:34:44.15898	2019-01-25 15:34:44.15898	323	\N
61	520	2019-01-25 00:00:00	None	t	f	2019-01-25 15:37:56.167478	2019-01-25 15:37:56.167478	323	\N
62	554	2019-02-25 00:00:00	No	t	f	2019-01-25 15:40:30.577883	2019-01-25 15:40:30.577883	323	\N
63	670	2019-01-25 00:00:00	No	t	f	2019-01-25 16:48:06.112128	2019-01-25 16:48:06.112128	354	\N
64	672	2019-01-25 00:00:00	Th	t	f	2019-01-25 17:09:56.220831	2019-01-25 17:09:56.220831	354	\N
65	672	2019-01-25 00:00:00	Th	t	f	2019-01-25 17:10:23.730773	2019-01-25 17:10:23.730773	354	\N
66	676	2019-12-25 00:00:00		t	f	2019-01-25 18:48:46.451828	2019-01-25 18:48:46.451828	354	\N
\.


--
-- Name: decline_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.decline_comments_id_seq', 66, true);


--
-- Data for Name: drug_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.drug_masters (id, drug_name, drug_alias, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
5	Feroglobin			36	t	f	2018-11-08 10:29:35.233443	2018-11-08 10:29:35.233443
6	Tramadol	Tramol		36	t	f	2018-11-08 10:35:58.724637	2018-11-08 10:35:58.724637
7	Pakum			36	t	f	2018-11-13 14:55:34.584968	2018-11-13 14:55:34.584968
9	coartem			158	t	f	2018-11-15 14:01:27.477533	2018-11-15 14:01:27.477533
10	Colodium	Havid		158	t	f	2018-11-16 09:31:51.14268	2018-11-16 09:31:51.14268
8	The drug			158	t	f	2018-11-14 10:08:37.788124	2018-11-16 14:27:21.373533
11	vitamin c			158	t	f	2018-11-28 16:58:52.49352	2018-11-28 16:58:52.49352
\.


--
-- Name: drug_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.drug_masters_id_seq', 11, true);


--
-- Data for Name: drug_prices; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.drug_prices (id, drug_id, price, unit_id, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
2	5	40.00	1		36	t	f	2018-11-08 10:29:35.235028	2018-11-08 10:29:35.235028
3	6	12.25	2		36	t	f	2018-11-08 10:35:58.726093	2018-11-08 10:35:58.726093
4	7	150.00	2		36	t	f	2018-11-13 14:55:34.58693	2018-11-13 14:55:34.58693
6	9	30.00	3		158	t	f	2018-11-15 14:01:27.479146	2018-11-15 14:01:27.479146
7	10	2.00	3		158	t	f	2018-11-16 09:31:51.145245	2018-11-16 09:31:51.145245
5	8	24.00	2		158	t	f	2018-11-14 10:08:37.789837	2018-11-16 14:27:21.375789
8	11	0.10	3		158	t	f	2018-11-28 16:58:52.651682	2018-11-28 16:58:52.651682
\.


--
-- Name: drug_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.drug_prices_id_seq', 8, true);


--
-- Data for Name: engaged_user_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.engaged_user_services (id, person_id, user_service_id, comment, entity_id, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	34	1	\N	\N	9	t	f	2018-01-03 10:26:18.05969	2018-01-03 10:26:18.05969
2	34	3	\N	\N	9	t	f	2018-01-03 10:26:18.114846	2018-01-03 10:26:18.114846
3	32	2	\N	\N	29	t	f	2018-01-04 15:41:47.22091	2018-01-04 15:41:47.22091
4	32	3	\N	\N	29	t	f	2018-01-04 15:41:47.256207	2018-01-04 15:41:47.256207
\.


--
-- Name: engaged_user_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.engaged_user_services_id_seq', 4, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.events (id, title, start_date, end_date, created_at, updated_at) FROM stdin;
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Data for Name: lab_detail_images; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.lab_detail_images (id, pre_appointment_id, lab_detail_id, comment, user_id, active_status, del_status, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
1	19	\N	\N	\N	\N	\N	2018-04-16 10:02:23.800187	2018-04-16 10:02:23.800187	voting1.png	image/png	264268	2018-04-16 10:02:23.299645
2	42	\N	\N	\N	\N	\N	2018-10-15 12:44:43.821553	2018-10-15 12:44:43.821553	1539607472435.jpg	\N	\N	\N
3	42	\N	\N	\N	\N	\N	2018-10-15 12:52:55.453085	2018-10-15 12:52:55.453085	1539607472435.jpg	\N	\N	\N
4	42	\N	\N	\N	\N	\N	2018-10-15 12:54:13.72981	2018-10-15 12:54:13.72981	1539608044719.jpg	\N	\N	\N
\.


--
-- Name: lab_detail_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.lab_detail_images_id_seq', 4, true);


--
-- Data for Name: lab_details; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.lab_details (id, pre_appointment_id, lab_service_id, comment, user_id, active_status, del_status, created_at, updated_at, confirmed_appt_id) FROM stdin;
17	\N	2		\N	t	f	2018-11-14 15:35:19.541945	2018-11-14 15:35:19.541945	583
18	\N	10		\N	t	f	2018-11-14 15:35:19.544308	2018-11-14 15:35:19.544308	583
19	\N	2		\N	t	f	2018-11-14 15:36:45.962584	2018-11-14 15:36:45.962584	584
20	\N	10		\N	t	f	2018-11-14 15:36:45.96453	2018-11-14 15:36:45.96453	584
21	\N	2		\N	t	f	2018-11-14 15:48:18.827884	2018-11-14 15:48:18.827884	586
22	\N	10		\N	t	f	2018-11-14 15:48:18.830057	2018-11-14 15:48:18.830057	586
23	\N	3		\N	t	f	2018-11-14 15:48:18.83198	2018-11-14 15:48:18.83198	586
24	\N	1		\N	t	f	2018-11-14 15:48:18.833874	2018-11-14 15:48:18.833874	586
25	\N	2		\N	t	f	2018-11-14 16:34:15.259621	2018-11-14 16:34:15.259621	587
26	\N	10		\N	t	f	2018-11-14 16:34:15.261305	2018-11-14 16:34:15.261305	587
27	\N	3		\N	t	f	2018-11-14 16:34:15.26291	2018-11-14 16:34:15.26291	587
28	\N	2		\N	t	f	2018-11-14 16:37:45.055377	2018-11-14 16:37:45.055377	588
29	\N	10		\N	t	f	2018-11-14 16:37:45.057468	2018-11-14 16:37:45.057468	588
30	\N	1		\N	t	f	2018-11-14 16:37:45.059407	2018-11-14 16:37:45.059407	588
31	\N	2		\N	t	f	2018-11-14 16:39:56.771805	2018-11-14 16:39:56.771805	589
32	\N	10		\N	t	f	2018-11-14 16:39:56.773838	2018-11-14 16:39:56.773838	589
33	\N	3		\N	t	f	2018-11-14 16:39:56.775696	2018-11-14 16:39:56.775696	589
34	\N	1		\N	t	f	2018-11-14 16:39:56.777582	2018-11-14 16:39:56.777582	589
35	\N	2		\N	t	f	2018-11-14 16:46:43.072373	2018-11-14 16:46:43.072373	590
36	\N	10		\N	t	f	2018-11-14 16:46:43.074408	2018-11-14 16:46:43.074408	590
37	\N	3		\N	t	f	2018-11-14 16:46:43.076324	2018-11-14 16:46:43.076324	590
38	\N	2		\N	t	f	2018-11-14 16:57:32.603531	2018-11-14 16:57:32.603531	591
39	\N	10		\N	t	f	2018-11-14 16:57:32.605504	2018-11-14 16:57:32.605504	591
40	\N	1		\N	t	f	2018-11-14 16:57:32.607387	2018-11-14 16:57:32.607387	591
41	\N	10		\N	t	f	2018-11-14 16:59:31.32764	2018-11-14 16:59:31.32764	592
42	\N	3		\N	t	f	2018-11-14 16:59:31.329639	2018-11-14 16:59:31.329639	592
43	\N	2		\N	t	f	2018-11-14 17:00:50.264306	2018-11-14 17:00:50.264306	593
44	\N	10		\N	t	f	2018-11-14 17:00:50.266046	2018-11-14 17:00:50.266046	593
45	\N	2		\N	t	f	2018-11-28 14:01:02.222584	2018-11-28 14:01:02.222584	639
46	\N	10		\N	t	f	2018-11-28 14:03:25.486388	2018-11-28 14:03:25.486388	640
47	\N	2		\N	t	f	2018-11-28 14:07:12.167409	2018-11-28 14:07:12.167409	641
48	\N	2		\N	t	f	2018-11-28 17:34:35.749567	2018-11-28 17:34:35.749567	645
49	\N	2		\N	t	f	2018-11-28 18:16:38.136991	2018-11-28 18:16:38.136991	646
50	\N	2		\N	t	f	2018-12-01 23:12:23.384571	2018-12-01 23:12:23.384571	655
51	\N	10		\N	t	f	2018-12-01 23:12:23.386958	2018-12-01 23:12:23.386958	655
52	\N	3		\N	t	f	2018-12-01 23:12:23.388954	2018-12-01 23:12:23.388954	655
53	\N	1		\N	t	f	2018-12-01 23:12:23.390907	2018-12-01 23:12:23.390907	655
54	\N	2		\N	t	f	2018-12-01 23:12:23.392856	2018-12-01 23:12:23.392856	655
55	\N	2		\N	t	f	2018-12-01 23:12:23.394676	2018-12-01 23:12:23.394676	655
56	\N	10		\N	t	f	2018-12-03 13:26:31.484754	2018-12-03 13:26:31.484754	659
57	\N	2		\N	t	f	2018-12-03 13:30:08.405547	2018-12-03 13:30:08.405547	660
58	\N	2		\N	t	f	2018-12-04 11:03:12.082627	2018-12-04 11:03:12.082627	661
59	\N	2		\N	t	f	2018-12-06 18:43:44.426966	2018-12-06 18:43:44.426966	666
60	\N	10		\N	t	f	2018-12-11 18:01:57.216287	2018-12-11 18:01:57.216287	671
61	\N	2		\N	t	f	2018-12-13 10:31:07.019442	2018-12-13 10:31:07.019442	686
62	\N	10		\N	t	f	2018-12-14 09:32:38.591306	2018-12-14 09:32:38.591306	722
63	\N	3		\N	t	f	2018-12-14 09:32:38.593821	2018-12-14 09:32:38.593821	722
64	\N	10		\N	t	f	2018-12-14 12:14:31.332136	2018-12-14 12:14:31.332136	736
65	\N	10		\N	t	f	2018-12-14 12:20:41.178605	2018-12-14 12:20:41.178605	737
66	\N	3		\N	t	f	2018-12-14 16:44:53.815994	2018-12-14 16:44:53.815994	738
67	\N	2		\N	t	f	2018-12-14 17:55:53.297931	2018-12-14 17:55:53.297931	739
68	\N	10		\N	t	f	2018-12-14 17:56:39.176065	2018-12-14 17:56:39.176065	740
69	\N	1		\N	t	f	2018-12-14 17:57:32.310182	2018-12-14 17:57:32.310182	741
70	\N	1		\N	t	f	2018-12-14 18:11:06.432125	2018-12-14 18:11:06.432125	742
71	\N	10		\N	t	f	2018-12-14 18:12:02.339875	2018-12-14 18:12:02.339875	743
72	\N	3		\N	t	f	2018-12-14 18:13:18.139932	2018-12-14 18:13:18.139932	744
73	\N	2		\N	t	f	2018-12-14 18:15:08.782851	2018-12-14 18:15:08.782851	745
74	\N	10		\N	t	f	2018-12-15 10:32:14.437015	2018-12-15 10:32:14.437015	748
75	\N	3		\N	t	f	2018-12-15 10:32:14.439112	2018-12-15 10:32:14.439112	748
76	\N	3		\N	t	f	2018-12-15 10:39:21.322603	2018-12-15 10:39:21.322603	749
77	\N	1		\N	t	f	2018-12-15 10:39:21.324552	2018-12-15 10:39:21.324552	749
78	\N	2		\N	t	f	2018-12-15 10:39:21.326377	2018-12-15 10:39:21.326377	749
79	\N	7		\N	t	f	2018-12-20 17:42:50.250398	2018-12-20 17:42:50.250398	832
80	\N	7		\N	t	f	2018-12-21 12:47:39.839842	2018-12-21 12:47:39.839842	833
81	\N	2		\N	t	f	2018-12-21 12:47:39.842131	2018-12-21 12:47:39.842131	833
82	\N	7		\N	t	f	2019-01-02 12:08:04.629147	2019-01-02 12:08:04.629147	835
83	\N	7		\N	t	f	2019-01-02 12:16:49.167664	2019-01-02 12:16:49.167664	836
84	\N	2		\N	t	f	2019-01-02 12:16:49.169917	2019-01-02 12:16:49.169917	836
85	\N	14		\N	t	f	2019-01-02 15:25:45.308108	2019-01-02 15:25:45.308108	840
86	\N	7		\N	t	f	2019-01-03 11:07:36.95651	2019-01-03 11:07:36.95651	846
87	\N	14		\N	t	f	2019-01-03 11:13:53.112034	2019-01-03 11:13:53.112034	847
88	896	10		\N	t	f	2019-01-08 10:32:02.65845	2019-01-08 10:32:02.65845	\N
89	896	13		\N	t	f	2019-01-08 10:32:02.66116	2019-01-08 10:32:02.66116	\N
90	898	2		\N	t	f	2019-01-08 11:14:59.366129	2019-01-08 11:14:59.366129	\N
91	898	13		\N	t	f	2019-01-08 11:14:59.368634	2019-01-08 11:14:59.368634	\N
92	898	12		\N	t	f	2019-01-08 11:14:59.370622	2019-01-08 11:14:59.370622	\N
93	898	9		\N	t	f	2019-01-08 11:14:59.372637	2019-01-08 11:14:59.372637	\N
94	\N	14		\N	t	f	2019-01-11 13:28:58.030152	2019-01-11 13:28:58.030152	852
95	\N	2		\N	t	f	2019-01-11 13:28:58.032507	2019-01-11 13:28:58.032507	852
96	\N	7		\N	t	f	2019-01-11 13:28:58.034392	2019-01-11 13:28:58.034392	852
97	\N	2		\N	t	f	2019-02-05 12:00:49.035797	2019-02-05 12:00:49.035797	907
98	\N	14		\N	t	f	2019-02-05 17:44:54.21706	2019-02-05 17:44:54.21706	917
\.


--
-- Name: lab_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.lab_details_id_seq', 98, true);


--
-- Data for Name: lab_images; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.lab_images (id, pre_appointment_id, appointment_type_id, requester_id, act_status, del_status, created_at, updated_at, file_name) FROM stdin;
1	2	MD	322	t	f	2018-10-15 13:00:55	2018-10-15 13:00:55	MD21539609017347.jpg
2	646	MD	322	t	f	2018-10-15 15:04:00	2018-10-15 15:04:00	MD6461539615821737.jpg
3	649	MD	322	t	f	2018-10-15 16:27:04	2018-10-15 16:27:04	MD6491539620816169.jpg
4	654	MD	322	t	f	2018-10-15 17:07:19	2018-10-15 17:07:19	MD6541539622930148.jpg
5	0	LA	322	t	f	2018-12-10 12:04:47	2018-12-10 12:04:47	LA001544443475339.jpg
6	752	MD	322	t	f	2018-12-10 12:16:01	2018-12-10 12:16:01	MD7521544444140014.jpg
7	753	MD	322	t	f	2018-12-10 12:24:27	2018-12-10 12:24:27	MD7531544444648644.jpg
8	754	MD	322	t	f	2018-12-10 12:29:19	2018-12-10 12:29:19	MD7541544444948967.jpg
13	760	LA	322	t	f	2018-12-10 18:28:31	2018-12-10 18:28:31	LA7601544466482567.jpg
14	762	LA	322	t	f	2018-12-11 11:14:47	2018-12-11 11:14:47	LA7621544526875956.jpg
15	765	MD	322	t	f	2018-12-11 17:39:00	2018-12-11 17:39:00	MD7651544549911989.jpg
16	766	MD	322	t	f	2018-12-11 17:42:44	2018-12-11 17:42:44	MD7661544550144339.jpg
17	782	MD	322	t	f	2018-12-13 11:18:12	2018-12-13 11:18:12	MD7821544699865795.jpg
18	783	MD	322	t	f	2018-12-13 11:21:39	2018-12-13 11:21:39	MD7831544699981147.jpg
19	800	MD	330	t	f	2018-12-13 13:32:24	2018-12-13 13:32:24	MD8001544707889463.jpg
20	801	LA	330	t	f	2018-12-13 13:38:09	2018-12-13 13:38:09	LA8011544708259709.jpg
21	808	LA	331	t	f	2018-12-13 19:23:13	2018-12-13 19:23:13	LA8081544728950241.jpg
22	812	MD	257	t	f	2018-12-14 00:23:43	2018-12-14 00:23:43	MD8121544746980054.jpg
23	813	MD	257	t	f	2018-12-14 00:32:06	2018-12-14 00:32:06	MD8131544747445222.jpg
24	815	LA	257	t	f	2018-12-14 08:19:30	2018-12-14 08:19:30	LA8151544775511191.jpg
25	827	LA	322	t	f	2018-12-14 12:14:04	2018-12-14 12:14:04	LA8271544789608143.jpg
26	828	LA	322	t	f	2018-12-14 12:18:28	2018-12-14 12:18:28	LA8281544789845359.jpg
27	833	LA	257	t	f	2018-12-14 17:48:36	2018-12-14 17:48:36	LA8331544809647373.jpg
28	848	MD	330	t	f	2018-12-18 09:44:23	2018-12-18 09:44:23	MD8481545126238518.jpg
29	856	MD	333	t	f	2018-12-21 14:15:23	2018-12-21 14:15:23	MD8561545401676279.jpg
30	868	MD	331	t	f	2018-12-22 11:48:16	2018-12-22 11:48:16	MD8681545479280065.jpg
31	869	LA	331	t	f	2018-12-22 11:57:43	2018-12-22 11:57:43	LA8691545479526159.jpg
32	882	LA	322	t	f	2019-01-02 10:22:54	2019-01-02 10:22:54	LA8821546424531603.jpg
33	886	LA	330	t	f	2019-01-02 15:10:30	2019-01-02 15:10:30	LA8861546441793084.jpg
34	905	LA	342	t	f	2019-01-11 09:25:41	2019-01-11 09:25:41	LA9051547198715876.jpg
35	914	LA	257	t	f	2019-01-11 13:27:24	2019-01-11 13:27:24	LA9141547213193875.jpg
36	946	MD	322	t	f	2019-02-05 10:59:29	2019-02-05 10:59:29	MD9461549364152428.jpg
37	947	LA	322	t	f	2019-02-05 11:08:12	2019-02-05 11:08:12	LA9471549364739442.jpg
38	958	MD	322	t	f	2019-02-05 17:23:23	2019-02-05 17:23:23	MD9581549387357965.jpg
\.


--
-- Name: lab_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.lab_images_id_seq', 38, true);


--
-- Data for Name: lab_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.lab_services (id, title, price, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
10	Bypass Test	0.1			t	f	2018-04-23 12:07:21.755176	2018-12-13 11:37:45.681214
2	Full Blood Count + Film Comment	0.1			t	f	2017-11-15 11:55:55.540885	2018-12-13 11:39:20.944882
13	Hiv Test	0.1			t	f	2018-11-16 11:18:30.733912	2018-12-13 11:40:18.370838
12	Hepatitis B Test	0.1			t	f	2018-11-15 09:58:19.581256	2018-12-13 11:40:39.23777
9	Pelvic	0.1			t	f	2018-03-05 15:25:10.391686	2018-12-13 11:41:51.6517
1	Full Blood Count	0.1			t	f	2017-11-15 10:52:13.354649	2018-12-13 11:43:12.148471
8	Tissue	0.1			t	f	2017-11-21 16:55:56.32745	2018-12-13 11:43:31.68794
7	Blood Group + Rhes D Ag	0.1			t	f	2017-11-15 19:12:23.571102	2018-12-13 11:43:49.702368
6	Hb Electrophoresis	0.1			t	f	2017-11-15 19:12:01.81811	2018-12-13 11:44:46.921558
5	Sickling Test	0.1			t	f	2017-11-15 19:11:03.492861	2018-12-13 11:45:06.240493
4	Esr	0.1			t	f	2017-11-15 19:10:45.780751	2018-12-13 11:45:33.813842
3	Haemoglobin	0.1			t	f	2017-11-15 19:10:29.833879	2018-12-13 11:46:04.445105
11	Pregnancy Test	0.2			t	f	2018-11-14 17:49:43.369489	2018-12-18 09:53:38.573322
14	Tricklez	0.1			t	f	2019-01-02 15:14:22.156692	2019-01-02 15:14:22.156692
\.


--
-- Name: lab_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.lab_services_id_seq', 14, true);


--
-- Data for Name: measure_units; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.measure_units (id, unit_desc, unit_alias, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	First unit			36	t	f	2018-11-07 15:42:44.83046	2018-11-07 16:11:44.532188
2	Second Unit			36	t	f	2018-11-07 16:11:57.901843	2018-11-07 16:11:57.901843
3	ml			158	t	f	2018-11-15 14:00:38.231224	2018-11-15 14:00:38.231224
\.


--
-- Name: measure_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.measure_units_id_seq', 3, true);


--
-- Data for Name: medication_details; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.medication_details (id, confirmed_appt_id, drug_id, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
3	429	5		\N	t	f	2018-11-12 17:58:48.132306	2018-11-12 17:58:48.132306
4	429	6		\N	t	f	2018-11-12 17:58:48.134465	2018-11-12 17:58:48.134465
5	430	5		\N	t	f	2018-11-12 22:13:50.54517	2018-11-12 22:13:50.54517
6	430	6		\N	t	f	2018-11-12 22:13:50.548283	2018-11-12 22:13:50.548283
7	431	5		\N	t	f	2018-11-12 22:28:05.273089	2018-11-12 22:28:05.273089
8	431	6		\N	t	f	2018-11-12 22:28:05.27485	2018-11-12 22:28:05.27485
9	432	5		\N	t	f	2018-11-12 22:28:33.416678	2018-11-12 22:28:33.416678
10	432	6		\N	t	f	2018-11-12 22:28:33.418686	2018-11-12 22:28:33.418686
11	433	5		\N	t	f	2018-11-12 22:28:38.155025	2018-11-12 22:28:38.155025
12	433	6		\N	t	f	2018-11-12 22:28:38.157071	2018-11-12 22:28:38.157071
13	434	5		\N	t	f	2018-11-12 22:28:48.261343	2018-11-12 22:28:48.261343
14	434	6		\N	t	f	2018-11-12 22:28:48.263451	2018-11-12 22:28:48.263451
15	435	5		\N	t	f	2018-11-12 22:29:15.099932	2018-11-12 22:29:15.099932
16	436	5		\N	t	f	2018-11-12 22:29:48.01229	2018-11-12 22:29:48.01229
17	437	5		\N	t	f	2018-11-12 22:41:01.904535	2018-11-12 22:41:01.904535
18	437	6		\N	t	f	2018-11-12 22:41:01.906571	2018-11-12 22:41:01.906571
19	438	5		\N	t	f	2018-11-12 22:44:32.310833	2018-11-12 22:44:32.310833
20	438	6		\N	t	f	2018-11-12 22:44:32.312868	2018-11-12 22:44:32.312868
21	439	5		\N	t	f	2018-11-12 22:54:52.269802	2018-11-12 22:54:52.269802
22	439	6		\N	t	f	2018-11-12 22:54:52.273204	2018-11-12 22:54:52.273204
23	440	5		\N	t	f	2018-11-12 22:56:13.73991	2018-11-12 22:56:13.73991
24	440	6		\N	t	f	2018-11-12 22:56:13.74196	2018-11-12 22:56:13.74196
25	441	5		\N	t	f	2018-11-12 22:58:11.297522	2018-11-12 22:58:11.297522
26	441	6		\N	t	f	2018-11-12 22:58:11.29945	2018-11-12 22:58:11.29945
27	442	5		\N	t	f	2018-11-12 22:59:18.198701	2018-11-12 22:59:18.198701
28	442	6		\N	t	f	2018-11-12 22:59:18.200676	2018-11-12 22:59:18.200676
29	443	5		\N	t	f	2018-11-12 23:00:30.546964	2018-11-12 23:00:30.546964
30	443	6		\N	t	f	2018-11-12 23:00:30.54902	2018-11-12 23:00:30.54902
31	444	5		\N	t	f	2018-11-12 23:01:27.277465	2018-11-12 23:01:27.277465
32	444	6		\N	t	f	2018-11-12 23:01:27.279489	2018-11-12 23:01:27.279489
33	445	5		\N	t	f	2018-11-12 23:02:24.428013	2018-11-12 23:02:24.428013
34	445	6		\N	t	f	2018-11-12 23:02:24.430048	2018-11-12 23:02:24.430048
35	447	5		\N	t	f	2018-11-12 23:13:00.972201	2018-11-12 23:13:00.972201
36	447	6		\N	t	f	2018-11-12 23:13:00.974302	2018-11-12 23:13:00.974302
37	448	5		\N	t	f	2018-11-12 23:17:49.256084	2018-11-12 23:17:49.256084
38	448	6		\N	t	f	2018-11-12 23:17:49.257928	2018-11-12 23:17:49.257928
39	449	5		\N	t	f	2018-11-12 23:18:09.908141	2018-11-12 23:18:09.908141
40	449	6		\N	t	f	2018-11-12 23:18:09.910169	2018-11-12 23:18:09.910169
41	450	5		\N	t	f	2018-11-12 23:21:37.499136	2018-11-12 23:21:37.499136
42	450	6		\N	t	f	2018-11-12 23:21:37.501236	2018-11-12 23:21:37.501236
43	451	5		\N	t	f	2018-11-12 23:23:13.318835	2018-11-12 23:23:13.318835
44	451	6		\N	t	f	2018-11-12 23:23:13.320888	2018-11-12 23:23:13.320888
45	452	5		\N	t	f	2018-11-12 23:24:55.507372	2018-11-12 23:24:55.507372
46	452	6		\N	t	f	2018-11-12 23:24:55.509406	2018-11-12 23:24:55.509406
47	453	5		\N	t	f	2018-11-12 23:27:34.248285	2018-11-12 23:27:34.248285
48	453	6		\N	t	f	2018-11-12 23:27:34.250429	2018-11-12 23:27:34.250429
49	454	5		\N	t	f	2018-11-12 23:31:24.323138	2018-11-12 23:31:24.323138
50	454	6		\N	t	f	2018-11-12 23:31:24.324919	2018-11-12 23:31:24.324919
51	455	5		\N	t	f	2018-11-12 23:32:20.989084	2018-11-12 23:32:20.989084
52	455	6		\N	t	f	2018-11-12 23:32:20.990854	2018-11-12 23:32:20.990854
53	456	5		\N	t	f	2018-11-12 23:33:12.927877	2018-11-12 23:33:12.927877
54	456	6		\N	t	f	2018-11-12 23:33:12.930063	2018-11-12 23:33:12.930063
55	457	5		\N	t	f	2018-11-12 23:38:51.293404	2018-11-12 23:38:51.293404
56	457	6		\N	t	f	2018-11-12 23:38:51.295196	2018-11-12 23:38:51.295196
57	458	5		\N	t	f	2018-11-12 23:42:49.541604	2018-11-12 23:42:49.541604
58	458	6		\N	t	f	2018-11-12 23:42:49.543439	2018-11-12 23:42:49.543439
59	459	5		\N	t	f	2018-11-12 23:56:16.525596	2018-11-12 23:56:16.525596
60	459	6		\N	t	f	2018-11-12 23:56:16.527379	2018-11-12 23:56:16.527379
61	460	5		\N	t	f	2018-11-13 00:03:28.294782	2018-11-13 00:03:28.294782
62	460	6		\N	t	f	2018-11-13 00:03:28.296644	2018-11-13 00:03:28.296644
63	461	5		\N	t	f	2018-11-13 00:06:07.44824	2018-11-13 00:06:07.44824
64	461	6		\N	t	f	2018-11-13 00:06:07.450355	2018-11-13 00:06:07.450355
65	462	5		\N	t	f	2018-11-13 00:09:46.769857	2018-11-13 00:09:46.769857
66	462	6		\N	t	f	2018-11-13 00:09:46.771905	2018-11-13 00:09:46.771905
67	463	5		\N	t	f	2018-11-13 00:11:37.749108	2018-11-13 00:11:37.749108
68	463	6		\N	t	f	2018-11-13 00:11:37.751007	2018-11-13 00:11:37.751007
69	464	5		\N	t	f	2018-11-13 00:13:10.436077	2018-11-13 00:13:10.436077
70	464	6		\N	t	f	2018-11-13 00:13:10.437854	2018-11-13 00:13:10.437854
71	465	5		\N	t	f	2018-11-13 00:14:45.325281	2018-11-13 00:14:45.325281
72	465	6		\N	t	f	2018-11-13 00:14:45.327029	2018-11-13 00:14:45.327029
73	466	5		\N	t	f	2018-11-13 00:18:42.288173	2018-11-13 00:18:42.288173
74	466	6		\N	t	f	2018-11-13 00:18:42.290369	2018-11-13 00:18:42.290369
75	467	5		\N	t	f	2018-11-13 00:27:37.084117	2018-11-13 00:27:37.084117
76	467	6		\N	t	f	2018-11-13 00:27:37.08604	2018-11-13 00:27:37.08604
77	468	5		\N	t	f	2018-11-13 00:31:48.57174	2018-11-13 00:31:48.57174
78	468	6		\N	t	f	2018-11-13 00:31:48.573746	2018-11-13 00:31:48.573746
79	469	5		\N	t	f	2018-11-13 00:34:59.105611	2018-11-13 00:34:59.105611
80	469	6		\N	t	f	2018-11-13 00:34:59.107407	2018-11-13 00:34:59.107407
81	470	5		\N	t	f	2018-11-13 00:35:50.281512	2018-11-13 00:35:50.281512
82	470	6		\N	t	f	2018-11-13 00:35:50.283254	2018-11-13 00:35:50.283254
83	471	5		\N	t	f	2018-11-13 00:37:03.990267	2018-11-13 00:37:03.990267
84	471	6		\N	t	f	2018-11-13 00:37:03.992315	2018-11-13 00:37:03.992315
85	472	5		\N	t	f	2018-11-13 00:39:18.730588	2018-11-13 00:39:18.730588
86	472	6		\N	t	f	2018-11-13 00:39:18.732639	2018-11-13 00:39:18.732639
87	473	5		\N	t	f	2018-11-13 00:40:51.348136	2018-11-13 00:40:51.348136
88	473	6		\N	t	f	2018-11-13 00:40:51.350325	2018-11-13 00:40:51.350325
89	474	5		\N	t	f	2018-11-13 00:43:48.532728	2018-11-13 00:43:48.532728
90	474	6		\N	t	f	2018-11-13 00:43:48.534815	2018-11-13 00:43:48.534815
91	475	5		\N	t	f	2018-11-13 00:45:26.384014	2018-11-13 00:45:26.384014
92	475	6		\N	t	f	2018-11-13 00:45:26.386091	2018-11-13 00:45:26.386091
93	476	5		\N	t	f	2018-11-13 00:46:21.850837	2018-11-13 00:46:21.850837
94	476	6		\N	t	f	2018-11-13 00:46:21.852951	2018-11-13 00:46:21.852951
95	477	5		\N	t	f	2018-11-13 00:47:06.932567	2018-11-13 00:47:06.932567
96	477	6		\N	t	f	2018-11-13 00:47:06.934598	2018-11-13 00:47:06.934598
97	478	5		\N	t	f	2018-11-13 00:47:55.632637	2018-11-13 00:47:55.632637
98	478	6		\N	t	f	2018-11-13 00:47:55.634586	2018-11-13 00:47:55.634586
99	479	5		\N	t	f	2018-11-13 00:49:49.142603	2018-11-13 00:49:49.142603
100	479	6		\N	t	f	2018-11-13 00:49:49.144943	2018-11-13 00:49:49.144943
101	480	6		\N	t	f	2018-11-13 00:50:55.477948	2018-11-13 00:50:55.477948
102	481	5		\N	t	f	2018-11-13 00:52:30.04293	2018-11-13 00:52:30.04293
103	481	6		\N	t	f	2018-11-13 00:52:30.045016	2018-11-13 00:52:30.045016
104	482	5		\N	t	f	2018-11-13 00:56:06.930641	2018-11-13 00:56:06.930641
105	482	6		\N	t	f	2018-11-13 00:56:06.932663	2018-11-13 00:56:06.932663
106	483	5		\N	t	f	2018-11-13 01:00:47.300435	2018-11-13 01:00:47.300435
107	483	6		\N	t	f	2018-11-13 01:00:47.302481	2018-11-13 01:00:47.302481
108	484	5		\N	t	f	2018-11-13 01:02:36.962986	2018-11-13 01:02:36.962986
109	485	5		\N	t	f	2018-11-13 01:13:05.503298	2018-11-13 01:13:05.503298
110	485	6		\N	t	f	2018-11-13 01:13:05.505483	2018-11-13 01:13:05.505483
111	486	5		\N	t	f	2018-11-13 01:20:49.020653	2018-11-13 01:20:49.020653
112	486	6		\N	t	f	2018-11-13 01:20:49.022722	2018-11-13 01:20:49.022722
113	487	5		\N	t	f	2018-11-13 01:21:53.225307	2018-11-13 01:21:53.225307
114	487	6		\N	t	f	2018-11-13 01:21:53.227353	2018-11-13 01:21:53.227353
115	488	5		\N	t	f	2018-11-13 01:26:11.132501	2018-11-13 01:26:11.132501
116	488	6		\N	t	f	2018-11-13 01:26:11.134565	2018-11-13 01:26:11.134565
117	489	5		\N	t	f	2018-11-13 01:26:59.149467	2018-11-13 01:26:59.149467
118	489	6		\N	t	f	2018-11-13 01:26:59.151653	2018-11-13 01:26:59.151653
119	490	5		\N	t	f	2018-11-13 01:30:11.902588	2018-11-13 01:30:11.902588
120	490	6		\N	t	f	2018-11-13 01:30:11.904645	2018-11-13 01:30:11.904645
121	491	5		\N	t	f	2018-11-13 01:31:12.731549	2018-11-13 01:31:12.731549
122	491	6		\N	t	f	2018-11-13 01:31:12.733588	2018-11-13 01:31:12.733588
123	492	5		\N	t	f	2018-11-13 01:36:56.813218	2018-11-13 01:36:56.813218
124	492	6		\N	t	f	2018-11-13 01:36:56.815546	2018-11-13 01:36:56.815546
125	493	5		\N	t	f	2018-11-13 01:39:15.57105	2018-11-13 01:39:15.57105
126	493	6		\N	t	f	2018-11-13 01:39:15.573088	2018-11-13 01:39:15.573088
127	494	5		\N	t	f	2018-11-13 01:40:56.639663	2018-11-13 01:40:56.639663
128	494	6		\N	t	f	2018-11-13 01:40:56.641753	2018-11-13 01:40:56.641753
129	495	5		\N	t	f	2018-11-13 01:45:42.88959	2018-11-13 01:45:42.88959
130	495	6		\N	t	f	2018-11-13 01:45:42.891742	2018-11-13 01:45:42.891742
131	496	5		\N	t	f	2018-11-13 01:49:59.261353	2018-11-13 01:49:59.261353
132	496	6		\N	t	f	2018-11-13 01:49:59.263407	2018-11-13 01:49:59.263407
133	497	5		\N	t	f	2018-11-13 07:33:59.282307	2018-11-13 07:33:59.282307
134	497	6		\N	t	f	2018-11-13 07:33:59.284451	2018-11-13 07:33:59.284451
135	498	5		\N	t	f	2018-11-13 07:35:30.889357	2018-11-13 07:35:30.889357
136	498	6		\N	t	f	2018-11-13 07:35:30.891383	2018-11-13 07:35:30.891383
137	499	5		\N	t	f	2018-11-13 07:43:41.233928	2018-11-13 07:43:41.233928
138	499	6		\N	t	f	2018-11-13 07:43:41.236094	2018-11-13 07:43:41.236094
139	500	5		\N	t	f	2018-11-13 07:46:58.028316	2018-11-13 07:46:58.028316
140	500	6		\N	t	f	2018-11-13 07:46:58.030303	2018-11-13 07:46:58.030303
141	501	5		\N	t	f	2018-11-13 07:49:12.385245	2018-11-13 07:49:12.385245
142	501	6		\N	t	f	2018-11-13 07:49:12.387328	2018-11-13 07:49:12.387328
143	502	5		\N	t	f	2018-11-13 07:53:18.654277	2018-11-13 07:53:18.654277
144	502	6		\N	t	f	2018-11-13 07:53:18.656305	2018-11-13 07:53:18.656305
145	503	5		\N	t	f	2018-11-13 07:56:25.964689	2018-11-13 07:56:25.964689
146	503	6		\N	t	f	2018-11-13 07:56:25.966437	2018-11-13 07:56:25.966437
147	504	5		\N	t	f	2018-11-13 07:59:46.385295	2018-11-13 07:59:46.385295
148	504	6		\N	t	f	2018-11-13 07:59:46.386999	2018-11-13 07:59:46.386999
149	505	5		\N	t	f	2018-11-13 08:02:17.555671	2018-11-13 08:02:17.555671
150	505	6		\N	t	f	2018-11-13 08:02:17.557514	2018-11-13 08:02:17.557514
151	506	5		\N	t	f	2018-11-13 08:13:13.841252	2018-11-13 08:13:13.841252
152	506	6		\N	t	f	2018-11-13 08:13:13.843001	2018-11-13 08:13:13.843001
153	507	5		\N	t	f	2018-11-13 08:14:20.959542	2018-11-13 08:14:20.959542
154	507	6		\N	t	f	2018-11-13 08:14:20.961246	2018-11-13 08:14:20.961246
155	508	5		\N	t	f	2018-11-13 08:23:26.057036	2018-11-13 08:23:26.057036
156	508	6		\N	t	f	2018-11-13 08:23:26.059111	2018-11-13 08:23:26.059111
157	509	5		\N	t	f	2018-11-13 08:24:56.79343	2018-11-13 08:24:56.79343
158	509	6		\N	t	f	2018-11-13 08:24:56.795387	2018-11-13 08:24:56.795387
159	510	5		\N	t	f	2018-11-13 08:25:48.242098	2018-11-13 08:25:48.242098
160	510	6		\N	t	f	2018-11-13 08:25:48.244235	2018-11-13 08:25:48.244235
161	511	5		\N	t	f	2018-11-13 08:26:35.459682	2018-11-13 08:26:35.459682
162	511	6		\N	t	f	2018-11-13 08:26:35.461495	2018-11-13 08:26:35.461495
163	512	5		\N	t	f	2018-11-13 08:30:51.759251	2018-11-13 08:30:51.759251
164	512	6		\N	t	f	2018-11-13 08:30:51.761276	2018-11-13 08:30:51.761276
165	513	5		\N	t	f	2018-11-13 08:33:18.683891	2018-11-13 08:33:18.683891
166	513	6		\N	t	f	2018-11-13 08:33:18.68602	2018-11-13 08:33:18.68602
167	514	5		\N	t	f	2018-11-13 08:35:15.936946	2018-11-13 08:35:15.936946
168	514	6		\N	t	f	2018-11-13 08:35:15.939035	2018-11-13 08:35:15.939035
169	515	5		\N	t	f	2018-11-13 08:37:16.754712	2018-11-13 08:37:16.754712
170	515	6		\N	t	f	2018-11-13 08:37:16.756786	2018-11-13 08:37:16.756786
171	516	5		\N	t	f	2018-11-13 08:43:41.383917	2018-11-13 08:43:41.383917
172	516	6		\N	t	f	2018-11-13 08:43:41.38609	2018-11-13 08:43:41.38609
173	517	5		\N	t	f	2018-11-13 08:55:28.244946	2018-11-13 08:55:28.244946
174	517	6		\N	t	f	2018-11-13 08:55:28.247007	2018-11-13 08:55:28.247007
175	518	5		\N	t	f	2018-11-13 08:58:41.98575	2018-11-13 08:58:41.98575
176	518	6		\N	t	f	2018-11-13 08:58:41.987842	2018-11-13 08:58:41.987842
177	519	5		\N	t	f	2018-11-13 09:04:53.283092	2018-11-13 09:04:53.283092
178	519	6		\N	t	f	2018-11-13 09:04:53.284941	2018-11-13 09:04:53.284941
179	520	5		\N	t	f	2018-11-13 09:08:30.168449	2018-11-13 09:08:30.168449
180	520	6		\N	t	f	2018-11-13 09:08:30.170235	2018-11-13 09:08:30.170235
181	521	5		\N	t	f	2018-11-13 09:11:18.3099	2018-11-13 09:11:18.3099
182	521	6		\N	t	f	2018-11-13 09:11:18.311918	2018-11-13 09:11:18.311918
183	522	5		\N	t	f	2018-11-13 09:12:54.624106	2018-11-13 09:12:54.624106
184	522	6		\N	t	f	2018-11-13 09:12:54.626159	2018-11-13 09:12:54.626159
185	523	5		\N	t	f	2018-11-13 09:14:49.597733	2018-11-13 09:14:49.597733
186	523	6		\N	t	f	2018-11-13 09:14:49.599871	2018-11-13 09:14:49.599871
187	524	5		\N	t	f	2018-11-13 09:51:17.695735	2018-11-13 09:51:17.695735
188	524	6		\N	t	f	2018-11-13 09:51:17.698152	2018-11-13 09:51:17.698152
189	525	5		\N	t	f	2018-11-13 09:53:38.337221	2018-11-13 09:53:38.337221
190	525	6		\N	t	f	2018-11-13 09:53:38.339352	2018-11-13 09:53:38.339352
191	526	5		\N	t	f	2018-11-13 09:55:58.020683	2018-11-13 09:55:58.020683
192	526	6		\N	t	f	2018-11-13 09:55:58.022713	2018-11-13 09:55:58.022713
193	527	5		\N	t	f	2018-11-13 10:32:49.667006	2018-11-13 10:32:49.667006
194	527	6		\N	t	f	2018-11-13 10:32:49.669238	2018-11-13 10:32:49.669238
195	528	5		\N	t	f	2018-11-13 10:36:42.446348	2018-11-13 10:36:42.446348
196	528	6		\N	t	f	2018-11-13 10:36:42.448434	2018-11-13 10:36:42.448434
197	529	5		\N	t	f	2018-11-13 10:46:53.509851	2018-11-13 10:46:53.509851
198	529	6		\N	t	f	2018-11-13 10:46:53.51194	2018-11-13 10:46:53.51194
199	530	5		\N	t	f	2018-11-13 10:48:12.814091	2018-11-13 10:48:12.814091
200	530	6		\N	t	f	2018-11-13 10:48:12.816186	2018-11-13 10:48:12.816186
201	531	5		\N	t	f	2018-11-13 10:52:52.445153	2018-11-13 10:52:52.445153
202	531	6		\N	t	f	2018-11-13 10:52:52.447184	2018-11-13 10:52:52.447184
203	532	5		\N	t	f	2018-11-13 10:53:58.091223	2018-11-13 10:53:58.091223
204	532	6		\N	t	f	2018-11-13 10:53:58.093235	2018-11-13 10:53:58.093235
205	533	5		\N	t	f	2018-11-13 11:10:29.065758	2018-11-13 11:10:29.065758
206	533	6		\N	t	f	2018-11-13 11:10:29.067799	2018-11-13 11:10:29.067799
207	534	5		\N	t	f	2018-11-13 11:13:08.882253	2018-11-13 11:13:08.882253
208	534	6		\N	t	f	2018-11-13 11:13:08.884494	2018-11-13 11:13:08.884494
209	535	5		\N	t	f	2018-11-13 11:15:34.619489	2018-11-13 11:15:34.619489
210	535	6		\N	t	f	2018-11-13 11:15:34.621484	2018-11-13 11:15:34.621484
211	536	5		\N	t	f	2018-11-13 11:17:45.124701	2018-11-13 11:17:45.124701
212	536	6		\N	t	f	2018-11-13 11:17:45.126571	2018-11-13 11:17:45.126571
213	537	5		\N	t	f	2018-11-13 11:19:26.512318	2018-11-13 11:19:26.512318
214	537	6		\N	t	f	2018-11-13 11:19:26.514185	2018-11-13 11:19:26.514185
215	538	5		\N	t	f	2018-11-13 11:21:13.68573	2018-11-13 11:21:13.68573
216	538	6		\N	t	f	2018-11-13 11:21:13.687794	2018-11-13 11:21:13.687794
217	539	5		\N	t	f	2018-11-13 11:31:10.092705	2018-11-13 11:31:10.092705
218	539	6		\N	t	f	2018-11-13 11:31:10.094549	2018-11-13 11:31:10.094549
219	540	5		\N	t	f	2018-11-13 11:35:04.733672	2018-11-13 11:35:04.733672
220	540	6		\N	t	f	2018-11-13 11:35:04.735772	2018-11-13 11:35:04.735772
221	541	5		\N	t	f	2018-11-13 11:50:42.73681	2018-11-13 11:50:42.73681
222	541	6		\N	t	f	2018-11-13 11:50:42.738887	2018-11-13 11:50:42.738887
223	542	5		\N	t	f	2018-11-13 11:56:43.538847	2018-11-13 11:56:43.538847
224	542	6		\N	t	f	2018-11-13 11:56:43.540987	2018-11-13 11:56:43.540987
225	543	5		\N	t	f	2018-11-13 11:58:03.48041	2018-11-13 11:58:03.48041
226	543	6		\N	t	f	2018-11-13 11:58:03.482524	2018-11-13 11:58:03.482524
227	544	5		\N	t	f	2018-11-13 12:05:57.731325	2018-11-13 12:05:57.731325
228	544	6		\N	t	f	2018-11-13 12:05:57.733398	2018-11-13 12:05:57.733398
229	545	5		\N	t	f	2018-11-13 12:07:42.114995	2018-11-13 12:07:42.114995
230	545	6		\N	t	f	2018-11-13 12:07:42.116987	2018-11-13 12:07:42.116987
231	546	5		\N	t	f	2018-11-13 12:11:16.781342	2018-11-13 12:11:16.781342
232	546	6		\N	t	f	2018-11-13 12:11:16.783533	2018-11-13 12:11:16.783533
233	547	5		\N	t	f	2018-11-13 12:25:57.847905	2018-11-13 12:25:57.847905
234	547	6		\N	t	f	2018-11-13 12:25:57.84961	2018-11-13 12:25:57.84961
235	548	5		\N	t	f	2018-11-13 12:31:30.911794	2018-11-13 12:31:30.911794
236	548	6		\N	t	f	2018-11-13 12:31:30.913545	2018-11-13 12:31:30.913545
237	549	5		\N	t	f	2018-11-13 12:37:13.759249	2018-11-13 12:37:13.759249
238	549	6		\N	t	f	2018-11-13 12:37:13.761016	2018-11-13 12:37:13.761016
239	550	5		\N	t	f	2018-11-13 12:39:45.004405	2018-11-13 12:39:45.004405
240	550	6		\N	t	f	2018-11-13 12:39:45.006526	2018-11-13 12:39:45.006526
241	551	5		\N	t	f	2018-11-13 12:54:54.746108	2018-11-13 12:54:54.746108
242	551	6		\N	t	f	2018-11-13 12:54:54.74838	2018-11-13 12:54:54.74838
243	552	5		\N	t	f	2018-11-13 12:56:10.161989	2018-11-13 12:56:10.161989
244	552	6		\N	t	f	2018-11-13 12:56:10.163887	2018-11-13 12:56:10.163887
245	553	5		\N	t	f	2018-11-13 13:00:30.766465	2018-11-13 13:00:30.766465
246	553	6		\N	t	f	2018-11-13 13:00:30.768271	2018-11-13 13:00:30.768271
247	554	5		\N	t	f	2018-11-13 13:02:54.520585	2018-11-13 13:02:54.520585
248	554	6		\N	t	f	2018-11-13 13:02:54.522303	2018-11-13 13:02:54.522303
249	555	5		\N	t	f	2018-11-13 13:13:54.163367	2018-11-13 13:13:54.163367
250	555	6		\N	t	f	2018-11-13 13:13:54.165913	2018-11-13 13:13:54.165913
251	556	5		\N	t	f	2018-11-13 14:47:35.225447	2018-11-13 14:47:35.225447
252	556	6		\N	t	f	2018-11-13 14:47:35.227228	2018-11-13 14:47:35.227228
253	557	5		\N	t	f	2018-11-13 14:49:19.436252	2018-11-13 14:49:19.436252
254	557	6		\N	t	f	2018-11-13 14:49:19.438294	2018-11-13 14:49:19.438294
255	558	5		\N	t	f	2018-11-13 14:51:07.698057	2018-11-13 14:51:07.698057
256	558	6		\N	t	f	2018-11-13 14:51:07.700091	2018-11-13 14:51:07.700091
257	559	5		\N	t	f	2018-11-13 14:52:40.397075	2018-11-13 14:52:40.397075
258	559	6		\N	t	f	2018-11-13 14:52:40.398857	2018-11-13 14:52:40.398857
259	560	5		\N	t	f	2018-11-13 14:53:48.229919	2018-11-13 14:53:48.229919
260	560	6		\N	t	f	2018-11-13 14:53:48.232015	2018-11-13 14:53:48.232015
261	561	5		\N	t	f	2018-11-13 14:56:07.502608	2018-11-13 14:56:07.502608
262	561	6		\N	t	f	2018-11-13 14:56:07.504694	2018-11-13 14:56:07.504694
263	561	7		\N	t	f	2018-11-13 14:56:07.506553	2018-11-13 14:56:07.506553
264	562	5		\N	t	f	2018-11-13 14:58:26.872968	2018-11-13 14:58:26.872968
265	562	6		\N	t	f	2018-11-13 14:58:26.875291	2018-11-13 14:58:26.875291
266	562	7		\N	t	f	2018-11-13 14:58:26.877184	2018-11-13 14:58:26.877184
267	563	5		\N	t	f	2018-11-13 15:00:17.617575	2018-11-13 15:00:17.617575
268	563	6		\N	t	f	2018-11-13 15:00:17.619664	2018-11-13 15:00:17.619664
269	563	7		\N	t	f	2018-11-13 15:00:17.621455	2018-11-13 15:00:17.621455
270	564	5		\N	t	f	2018-11-13 15:06:04.657316	2018-11-13 15:06:04.657316
271	564	6		\N	t	f	2018-11-13 15:06:04.659417	2018-11-13 15:06:04.659417
272	564	7		\N	t	f	2018-11-13 15:06:04.661353	2018-11-13 15:06:04.661353
273	565	5		\N	t	f	2018-11-13 15:08:18.95315	2018-11-13 15:08:18.95315
274	565	6		\N	t	f	2018-11-13 15:08:18.955171	2018-11-13 15:08:18.955171
275	565	7		\N	t	f	2018-11-13 15:08:18.957075	2018-11-13 15:08:18.957075
276	566	5		\N	t	f	2018-11-13 15:17:17.669202	2018-11-13 15:17:17.669202
277	566	6		\N	t	f	2018-11-13 15:17:17.671311	2018-11-13 15:17:17.671311
278	566	7		\N	t	f	2018-11-13 15:17:17.673295	2018-11-13 15:17:17.673295
279	567	5		\N	t	f	2018-11-13 17:02:26.293176	2018-11-13 17:02:26.293176
280	567	6		\N	t	f	2018-11-13 17:02:26.295028	2018-11-13 17:02:26.295028
281	567	7		\N	t	f	2018-11-13 17:02:26.296707	2018-11-13 17:02:26.296707
282	568	5		\N	t	f	2018-11-13 17:12:39.051626	2018-11-13 17:12:39.051626
283	568	7		\N	t	f	2018-11-13 17:12:39.053795	2018-11-13 17:12:39.053795
284	569	5		\N	t	f	2018-11-14 09:49:25.79559	2018-11-14 09:49:25.79559
285	569	6		\N	t	f	2018-11-14 09:49:25.797663	2018-11-14 09:49:25.797663
286	569	7		\N	t	f	2018-11-14 09:49:25.799565	2018-11-14 09:49:25.799565
287	570	5		\N	t	f	2018-11-14 09:57:58.315675	2018-11-14 09:57:58.315675
288	570	6		\N	t	f	2018-11-14 09:57:58.317781	2018-11-14 09:57:58.317781
289	570	7		\N	t	f	2018-11-14 09:57:58.319686	2018-11-14 09:57:58.319686
290	571	5		\N	t	f	2018-11-14 10:07:57.439934	2018-11-14 10:07:57.439934
291	571	6		\N	t	f	2018-11-14 10:07:57.44205	2018-11-14 10:07:57.44205
292	571	7		\N	t	f	2018-11-14 10:07:57.443982	2018-11-14 10:07:57.443982
293	572	5		\N	t	f	2018-11-14 10:18:59.00268	2018-11-14 10:18:59.00268
294	572	6		\N	t	f	2018-11-14 10:18:59.004833	2018-11-14 10:18:59.004833
295	572	7		\N	t	f	2018-11-14 10:18:59.006763	2018-11-14 10:18:59.006763
296	572	8		\N	t	f	2018-11-14 10:18:59.008682	2018-11-14 10:18:59.008682
297	573	5		\N	t	f	2018-11-14 10:33:08.015044	2018-11-14 10:33:08.015044
298	573	6		\N	t	f	2018-11-14 10:33:08.017086	2018-11-14 10:33:08.017086
299	573	7		\N	t	f	2018-11-14 10:33:08.018978	2018-11-14 10:33:08.018978
300	574	5		\N	t	f	2018-11-14 10:43:26.491465	2018-11-14 10:43:26.491465
301	574	6		\N	t	f	2018-11-14 10:43:26.49329	2018-11-14 10:43:26.49329
302	574	7		\N	t	f	2018-11-14 10:43:26.494926	2018-11-14 10:43:26.494926
303	575	5		\N	t	f	2018-11-14 10:44:31.791572	2018-11-14 10:44:31.791572
304	575	6		\N	t	f	2018-11-14 10:44:31.793576	2018-11-14 10:44:31.793576
305	575	7		\N	t	f	2018-11-14 10:44:31.795413	2018-11-14 10:44:31.795413
306	576	5		\N	t	f	2018-11-14 11:01:48.341245	2018-11-14 11:01:48.341245
307	576	6		\N	t	f	2018-11-14 11:01:48.343269	2018-11-14 11:01:48.343269
308	576	7		\N	t	f	2018-11-14 11:01:48.345148	2018-11-14 11:01:48.345148
309	577	5		\N	t	f	2018-11-14 12:27:51.368288	2018-11-14 12:27:51.368288
310	577	6		\N	t	f	2018-11-14 12:27:51.370377	2018-11-14 12:27:51.370377
311	577	7		\N	t	f	2018-11-14 12:27:51.372308	2018-11-14 12:27:51.372308
312	578	5		\N	t	f	2018-11-14 12:31:26.699548	2018-11-14 12:31:26.699548
313	578	6		\N	t	f	2018-11-14 12:31:26.701678	2018-11-14 12:31:26.701678
314	578	7		\N	t	f	2018-11-14 12:31:26.703562	2018-11-14 12:31:26.703562
315	579	5		\N	t	f	2018-11-14 12:41:30.449626	2018-11-14 12:41:30.449626
316	579	6		\N	t	f	2018-11-14 12:41:30.45148	2018-11-14 12:41:30.45148
317	579	7		\N	t	f	2018-11-14 12:41:30.453155	2018-11-14 12:41:30.453155
318	580	5		\N	t	f	2018-11-14 12:48:46.051174	2018-11-14 12:48:46.051174
319	580	6		\N	t	f	2018-11-14 12:48:46.053335	2018-11-14 12:48:46.053335
320	580	7		\N	t	f	2018-11-14 12:48:46.055245	2018-11-14 12:48:46.055245
321	581	5		\N	t	f	2018-11-14 12:54:31.138452	2018-11-14 12:54:31.138452
322	581	6		\N	t	f	2018-11-14 12:54:31.140542	2018-11-14 12:54:31.140542
323	582	5		\N	t	f	2018-11-14 13:01:29.625758	2018-11-14 13:01:29.625758
324	582	6		\N	t	f	2018-11-14 13:01:29.627834	2018-11-14 13:01:29.627834
325	582	7		\N	t	f	2018-11-14 13:01:29.62977	2018-11-14 13:01:29.62977
326	594	5		\N	t	f	2018-11-14 17:03:26.282576	2018-11-14 17:03:26.282576
327	594	7		\N	t	f	2018-11-14 17:03:26.284647	2018-11-14 17:03:26.284647
328	595	5		\N	t	f	2018-11-14 17:05:52.684389	2018-11-14 17:05:52.684389
329	595	7		\N	t	f	2018-11-14 17:05:52.686437	2018-11-14 17:05:52.686437
330	624	5		\N	t	f	2018-11-26 16:22:17.492108	2018-11-26 16:22:17.492108
331	624	10		\N	t	f	2018-11-26 16:22:17.502244	2018-11-26 16:22:17.502244
332	626	9		\N	t	f	2018-11-26 16:26:57.174822	2018-11-26 16:26:57.174822
333	627	8		\N	t	f	2018-11-26 16:27:36.121547	2018-11-26 16:27:36.121547
334	642	5		\N	t	f	2018-11-28 14:12:14.934502	2018-11-28 14:12:14.934502
335	643	10		\N	t	f	2018-11-28 14:13:39.340523	2018-11-28 14:13:39.340523
336	644	11		\N	t	f	2018-11-28 17:02:09.608664	2018-11-28 17:02:09.608664
337	653	9		\N	t	f	2018-12-01 23:06:17.769214	2018-12-01 23:06:17.769214
338	653	10		\N	t	f	2018-12-01 23:06:17.771551	2018-12-01 23:06:17.771551
339	653	8		\N	t	f	2018-12-01 23:06:17.773424	2018-12-01 23:06:17.773424
340	653	11		\N	t	f	2018-12-01 23:06:17.775303	2018-12-01 23:06:17.775303
341	658	10		\N	t	f	2018-12-03 13:23:53.12438	2018-12-03 13:23:53.12438
342	668	5		\N	t	f	2018-12-11 18:00:38.47214	2018-12-11 18:00:38.47214
343	672	5		\N	t	f	2018-12-11 18:02:47.02064	2018-12-11 18:02:47.02064
344	689	11		\N	t	f	2018-12-13 11:22:35.659229	2018-12-13 11:22:35.659229
345	690	11		\N	t	f	2018-12-13 11:23:15.898936	2018-12-13 11:23:15.898936
346	710	5		\N	t	f	2018-12-13 14:25:19.907018	2018-12-13 14:25:19.907018
347	718	10		\N	t	f	2018-12-14 00:26:33.152664	2018-12-14 00:26:33.152664
348	718	8		\N	t	f	2018-12-14 00:26:33.154752	2018-12-14 00:26:33.154752
349	752	11		\N	t	f	2018-12-18 09:45:15.714725	2018-12-18 09:45:15.714725
350	755	5		\N	t	f	2018-12-19 11:32:45.019417	2018-12-19 11:32:45.019417
351	755	6		\N	t	f	2018-12-19 11:32:45.0218	2018-12-19 11:32:45.0218
352	797	5		\N	t	f	2018-12-20 10:27:08.791076	2018-12-20 10:27:08.791076
353	797	6		\N	t	f	2018-12-20 10:27:08.793418	2018-12-20 10:27:08.793418
354	818	5		\N	t	f	2018-12-20 12:32:45.351955	2018-12-20 12:32:45.351955
355	818	8		\N	t	f	2018-12-20 12:32:45.354252	2018-12-20 12:32:45.354252
356	818	11		\N	t	f	2018-12-20 12:32:45.356343	2018-12-20 12:32:45.356343
357	819	5		\N	t	f	2018-12-20 12:52:21.638902	2018-12-20 12:52:21.638902
358	819	6		\N	t	f	2018-12-20 12:52:21.641067	2018-12-20 12:52:21.641067
359	819	10		\N	t	f	2018-12-20 12:52:21.643014	2018-12-20 12:52:21.643014
360	819	8		\N	t	f	2018-12-20 12:52:21.644957	2018-12-20 12:52:21.644957
361	820	5		\N	t	f	2018-12-20 12:54:57.827572	2018-12-20 12:54:57.827572
362	820	6		\N	t	f	2018-12-20 12:54:57.829586	2018-12-20 12:54:57.829586
363	820	11		\N	t	f	2018-12-20 12:54:57.831476	2018-12-20 12:54:57.831476
364	821	6		\N	t	f	2018-12-20 15:14:53.99082	2018-12-20 15:14:53.99082
365	821	11		\N	t	f	2018-12-20 15:14:53.993147	2018-12-20 15:14:53.993147
366	827	6		\N	t	f	2018-12-20 15:33:20.694521	2018-12-20 15:33:20.694521
367	827	7		\N	t	f	2018-12-20 15:33:20.696549	2018-12-20 15:33:20.696549
368	837	10		\N	t	f	2019-01-02 14:25:01.939621	2019-01-02 14:25:01.939621
369	837	11		\N	t	f	2019-01-02 14:25:01.964071	2019-01-02 14:25:01.964071
370	838	10		\N	t	f	2019-01-02 14:28:11.005019	2019-01-02 14:28:11.005019
371	838	11		\N	t	f	2019-01-02 14:28:11.007119	2019-01-02 14:28:11.007119
372	839	11		\N	t	f	2019-01-02 14:53:51.259464	2019-01-02 14:53:51.259464
373	841	11		\N	t	f	2019-01-02 18:11:40.555587	2019-01-02 18:11:40.555587
374	843	11		\N	t	f	2019-01-02 18:19:06.113982	2019-01-02 18:19:06.113982
375	844	11		\N	t	f	2019-01-03 11:01:52.852589	2019-01-03 11:01:52.852589
376	845	11		\N	t	f	2019-01-03 11:04:05.444193	2019-01-03 11:04:05.444193
377	850	5		\N	t	f	2019-01-11 12:12:31.44314	2019-01-11 12:12:31.44314
378	850	9		\N	t	f	2019-01-11 12:12:31.458858	2019-01-11 12:12:31.458858
379	850	10		\N	t	f	2019-01-11 12:12:31.460871	2019-01-11 12:12:31.460871
380	850	8		\N	t	f	2019-01-11 12:12:31.462888	2019-01-11 12:12:31.462888
381	850	11		\N	t	f	2019-01-11 12:12:31.464914	2019-01-11 12:12:31.464914
382	901	5		\N	t	f	2019-02-05 11:02:44.24224	2019-02-05 11:02:44.24224
383	901	6		\N	t	f	2019-02-05 11:02:44.258921	2019-02-05 11:02:44.258921
384	901	10		\N	t	f	2019-02-05 11:02:44.260532	2019-02-05 11:02:44.260532
385	904	11		\N	t	f	2019-02-05 11:40:35.539658	2019-02-05 11:40:35.539658
386	915	5		\N	t	f	2019-02-05 17:31:43.418712	2019-02-05 17:31:43.418712
387	916	5		\N	t	f	2019-02-05 17:42:27.703653	2019-02-05 17:42:27.703653
388	916	6		\N	t	f	2019-02-05 17:42:27.705968	2019-02-05 17:42:27.705968
\.


--
-- Name: medication_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.medication_details_id_seq', 388, true);


--
-- Data for Name: password_table; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.password_table (id, password, mobile_number, created_at, status, username, reset_token) FROM stdin;
120	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	024679875544	09:26:58.321914	t	paddy123	\N
124	ffff233db410e5acf113cff436edf4e8ec9d3d4284136219667294d674378e30	444444	00:54:48.916172	t	drpaddy	\N
127	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0277234567	14:36:23.745325	t	andy	\N
128	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0277412356	15:16:44.663477	t	andrew	\N
131	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	0249013344	16:02:18.660184	t	johnson	\N
132	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0249737027	21:10:47.35314	t	paddy3	\N
134	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0264680508	10:26:50.166799	t	senior	\N
137	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0244160414	10:02:05.703739	t	cpatient	\N
141	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0279454223	16:43:15.700837	t	silas	\N
145	2c7f3c096da374065d6b10242ddc0c0c52a7712a34679d5e5f59cf54cfcaff75	33344444	10:33:04.603837	t	rebecca	\N
147	bd36fef422668fcb69ad9e5547c9b52a27d581d61b695ffb131d71b18a49a06b	943498446	10:39:55.203802	t	sam	\N
149	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0241990807	15:21:55.950241	t	deeshaft	\N
152	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	0267889899	17:46:32.813333	t	assurance	\N
230	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0002000010	13:42:49.792417	t	pnurse3	\N
151	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0235667189	17:28:12.593832	t	monday	\N
154	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	0246718898	22:58:39.142275	t	duga	\N
156	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0000000001	10:47:34.932733	t	nipa	\N
158	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0205869653	14:40:47.302914	t	jerry2	\N
160	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	0231990090	12:19:36.206463	t	mirabel	\N
161	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0302502275	12:33:41.010871	t	claranurse	\N
163	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243542211	10:24:25.087614	t	new	\N
165	b8d59deb6d09e1e5ca59ca4bb8319d8fa8bd1e669bc8dac50ab53c19811b8547	44444555	14:53:25.658991	t	kusmeister	\N
167	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	85395738925	16:30:52.729515	t	free	\N
169	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0254631978	09:38:56.141195	t	friday	\N
171	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243556632	11:57:34.835271	t	myname	\N
173	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0236498200	15:39:08.876526	t	yourname	\N
175	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0248021199	15:06:02.108761	t	clarapatient	\N
177	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0203443235	15:56:44.870539	t	claradoctor	\N
232	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0203443235	16:22:02.682746	t	nursenaa	\N
179	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0544828369	16:20:17.385225	t	drnana	d40535ac09aac0ef32f8a23b8bb8e04bc2e8f9d6b0981fa98a16d0382f558d83
181	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0244160414	16:56:09.19913	t	claradoctor1	\N
183	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541099988	12:23:18.169008	t	paddydoc3	\N
185	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0506075223	11:23:03.6533	t	claradoctor2	\N
187	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243619780	10:25:43.626119	t	jojo	\N
189	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0264620508	12:55:47.190284	t	madydoctor	\N
191	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0245369807	09:16:47.852338	t	akua	\N
193	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0582000000	11:39:31.790512	t	padpatient	\N
195	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	02341232134	18:28:56.80013	t	padpatientt	\N
196	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	05413209888	18:32:31.860014	t	paddocc	\N
198	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	09874632432	11:16:33.043582	t	paddoctor1	\N
200	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0201356665	18:14:55.501336	t	madypatient1	\N
202	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0998693200	10:26:47.787992	t	mypaddy	\N
204	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	641654264	12:22:24.836088	t	youpatient	\N
206	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0263566774	17:48:21.098944	t	naamaame	\N
208	3331f66d3e17ea07a635da77e06d82cb88fcc74a15a3012a42b9b4948386628a	539326102	19:33:24.884759	t	adoma	\N
210	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	Naa	18:40:49.907272	t	naa122	\N
10	f348d5628621f3d8f59c8cabda0f8eb0aa7e0514a90be7571020b1336f26c113	00320000	15:56:05.555954	t	doctor	\N
213	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0556745326	19:11:37.220537	t	pj	\N
216	40e8ba120cafa2380c1a3da860ed43fa4bc667865217ff755566606ca7e63eb2	0261904987	11:47:25.09056	t	calebh	\N
220	46d17de670e7538b2fa95f4f5061b997082f17dfaaa3c6f33964a9df1270bfa7	090967758765	10:23:53.489495	t	nanapoland	\N
222	39e4837fb1bccdede34f783e82877cba56df503504a985a936163f31e9e01399	0546747905	14:33:29.826908	t	fiifi	\N
224	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0233651122	09:18:59.106076	t	testuser	\N
226	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0244123412	10:01:32.454027	t	testdoc	\N
228	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	00000011	10:27:19.802441	t	nnurse1	\N
234	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0205869653	19:34:39.743286	t	drs	\N
121	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541000000	09:33:38.00911	t	clementine1	\N
122	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541200000	09:36:54.796703	t	clementine2	\N
125	5f5d906024bedc60d3998a753fb800074f39a2c5fde6ac6b10239044084ad06d	455778	01:37:13.305435	t	patpaddy	\N
129	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	027789456	13:00:47.836593	t	mina	\N
133	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0276624567	11:12:20.013384	t	paddy4	\N
135	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0249737020	21:39:22.11705	t	pnurse	\N
138	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0244615890	10:04:27.104677	t	cdoctor	\N
142	836fff1d12aa49e02c8dc58540d7ff8ad925d72b061406f7e9d4d0c6ac0a8e30	74793530	15:47:54.478845	t	jonijoni	\N
146	b8cacfe93b1d528968b96af549cc85a9e277abdb269f906e39c7888cd99dd1f5	555586666	15:33:07.707261	t	kenedy	\N
148	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0506075223	10:50:38.619604	t	cpatient1	\N
150	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0264620508	17:00:01.864005	t	senior1	\N
155	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0000000000	10:43:37.2946	t	anka	\N
157	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0200000001	12:27:28.683635	t	paddy6	\N
159	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0203443235	17:08:32.530504	t	paddynurse	\N
162	8a6eeebd0db62b649ac76f9cbc40adbbb93b7b634aece7e738907c9491a34a14	1234567970	12:42:31.164345	t	samuelapp	\N
190	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0201463899	13:08:58.503283	t	madypatient	\N
192	924592b9b103f14f833faafb67f480691f01988aa457c0061769f58cd47311bc	0542369180	10:04:44.976993	t	aku	\N
194	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0200000190	11:43:33.097034	t	paddoctor	\N
197	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	0234119069	09:35:12.976993	t	leave	\N
199	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	09876531523	11:22:04.030053	t	paddoctor2	\N
201	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0242567754	18:16:24.314412	t	madydoctor1	\N
203	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	09043214342	12:10:58.312983	t	youpaddy	\N
207	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	09876545678	18:49:52.175493	t	youyo	\N
153	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	300	14:42:44.527393	t	paddypatient	37bb3ec91d1e74588e49fd449960a7c9a59e7f21ffeeae8ec607a33df820c34d
2	d169aa18ee15483aef92fb71a3eed0031e8d74715652e213a85fc66965edbed7	300	12:51:56.696992	t	paddy	\N
164	225cdbb68e0df9a0b8f5c582ece76a36f82ec706bf6afec19440db7b55e9b0a3	444444888	14:05:18.079191	t	sophidom	\N
166	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	0234889902	15:20:07.512784	t	clems	\N
168	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0245113328	08:40:16.868552	t	thursday	\N
170	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	058466539	10:14:23.667829	t	sat	\N
211	2f5735e8918b4384d63597e5afc9fff41f095d1908487868aa5304de19625e11	0272704910	06:26:23.167477	t	caleb	\N
223	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	0555762244	14:46:44.121226	t	dela	5cbcdc58b3d4a16e57158a5988d24d221a38f412faf2ae60a4162d13edad09c5
205	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0248021199	17:44:51.992387	t	maamenaa	56632b41c72527c1783c8d3e6abf8494d78289d06264aa39f675dd4685d20145
172	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0540000000	12:21:01.78643	t	paddy7	\N
174	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0000000110	18:15:21.180109	t	newdoc	\N
176	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0247523760	15:44:01.530925	t	sarah	\N
178	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541840000	16:19:55.260849	t	paddoc	\N
212	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0246149530	10:54:36.814192	t	kofi	\N
180	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0543692511	16:50:00.188998	t	nana	\N
182	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541800000	12:06:56.303661	t	paddydoc2	\N
184	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0201000010	13:12:20.592973	t	paddydoc4	\N
186	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0245325698	15:20:11.597319	t	greg	\N
188	15d283140e2e1021aacec3e370bc99235b59d6a31bab3b6ee86e1f56b78e060a	0504899386	16:10:01.64521	t	andymistic	\N
214	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0202233117	12:19:44.695367	t	paddy9	\N
225	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0244562233	09:59:15.167289	t	testnurse	\N
215	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243579781	13:57:16.112548	t	tricklez	\N
209	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	00320000	13:10:14.312657	t	elorm	8b75ec30ea0d0fedcfce5224ef7733db7dbc574a1806aa664014eb6350f5a00c
217	2ab425f1c4e3f382848f53e78c2f1fb14b0c79cabddd45d748933190fe9c7c48	0208910765	05:25:42.432243	t	gnurse	\N
218	8bf15a5b4e93bb7c0183e7a2d60f4cfe893d8350e212bd8f94bb9b51c35326a3	1234567	22:54:28.985632	t	adminqa	\N
219	90cc33a41b541af2c1964e3e10a46088cbdedf63031efaa35d588a698c91193f	0209210765	22:56:03.236702	t	samuel	\N
221	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0727630122	10:51:39.951075	t	demoqa	\N
227	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0541840988	09:55:45.551802	t	pnurse1	\N
229	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0022001002	13:37:13.498595	t	pnurse2	\N
231	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0222000010	13:46:02.416357	t	pnurse4	\N
233	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0205869653	19:05:56.241124	t	dr	\N
235	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	050489938	13:28:07.104226	t	naanurse	\N
1	03b6a8383bf6bf35253263ed02584d098ed48e570c1f31d5cb9aec883e556918	0245667787	12:09:33.299315	t	andy	\N
3	555cf638ea8288ac324dafe31787122f31c8d8d5825c6fb52b654aa01233f2b3	0248021199	12:53:09.452441	t	clara	\N
4	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0248029911	12:54:03.715402	t	mady	\N
5	555cf638ea8288ac324dafe31787122f31c8d8d5825c6fb52b654aa01233f2b3	0248021199                                        	12:57:44.365379	t	clara	\N
7	c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646	0504899386 	13:15:29.872133	t	niimistic 	\N
8	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	0243554422	13:17:28.456807	t	davi	\N
9	c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646	0504899386                                        	13:21:38.591076	t	niimistic 	\N
11	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243668890	11:20:57.685419	t	ago	\N
12	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243668890                                        	11:21:53.25613	t	ago	\N
13	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0558029911	17:19:25.649761	t	maddy	\N
14	263a601c948f2cdcb7521365a8b83120096121a618938ef1291a8de02f3837b8	0241230000	11:45:29.697408	t	kwamedanso	\N
15	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0241889900	15:01:12.411274	t	kwame	\N
16	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0241889900                                        	15:02:02.017119	t	kwame	\N
17	c946f701a3b98b8ec1e4ed93de689450acba912910c28a945d7593982a29fd79	0266000350	15:57:26.025248	t	jerry	\N
18	c946f701a3b98b8ec1e4ed93de689450acba912910c28a945d7593982a29fd79	0266000350                                        	16:02:00.092793	t	jerry	\N
19	8ddc17508748f3a7d0e55516d63ca55f6732fd1908e6ad95e9d2dfa32be8239d	444444r	20:38:04.403802	t	joni1	\N
20	f13620bae6ddbf35650f1add7ef56a720a73198cec3944fb01731ca72bd98389	0245667790	22:21:38.201863	t	kobby	\N
21	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0265110090	22:28:30.578733	t	oscar	\N
22	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0265110098	22:32:33.110436	t	oscar1	\N
23	ecb93e1590e08c3f17be82b54932ae78926d606d57d2f680377b82d7d20b2dcf	0549001123	09:57:47.279279	t	sweetness	\N
24	8ddc17508748f3a7d0e55516d63ca55f6732fd1908e6ad95e9d2dfa32be8239d	444444r                                           	11:04:05.041474	t	joni1	\N
25	263a601c948f2cdcb7521365a8b83120096121a618938ef1291a8de02f3837b8	0241230000                                        	11:08:01.460786	t	kwamedanso	\N
26	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0567445533	11:16:50.560324	t	clarence	\N
27	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	0578001100	11:36:28.955232	t	jon	\N
28	3c64d02e75dab84df045b1486db6ff8b3967715cd2e0ee333e4c6c79f8db7f7a	0200000000	16:14:10.44749	t	jason	\N
29	05a3a662c87fecce26130eafef769697ea4f95d8c3249409512b7fe9bc39f45d	0261111111	18:43:10.833188	t	adzah	\N
30	6dccb5fa4402fe7f15fb887a20a7c4ddccfc17594c9777382da09931a17138a5	+233244444329	05:58:43.303923	t	drkusmeister	\N
31	bbd617ad5ab21eca0ed7d0895e76ae062bc99ddbf2ea0e3fc81123e5ee4ca7a6	4444445	06:20:49.083729	t	gloria	\N
32	6dccb5fa4402fe7f15fb887a20a7c4ddccfc17594c9777382da09931a17138a5	+233244444329                                     	07:06:36.024795	t	drkusmeister	\N
33	bbd617ad5ab21eca0ed7d0895e76ae062bc99ddbf2ea0e3fc81123e5ee4ca7a6	4444445                                           	07:15:27.1304	t	gloria	\N
34	92b7495bead46124bc6baa6616f19b9f7783e03c81595f33e01a2204713a6cf6	546678	07:24:51.874679	t	kobby2	\N
35	2a53a7cb14c711408babca8a8444cbb1d7e81c5c744bcc7fc9f2f26403266450	44444444	07:52:23.672204	t	drkoku	\N
36	2a53a7cb14c711408babca8a8444cbb1d7e81c5c744bcc7fc9f2f26403266450	44444444                                          	07:55:53.384864	t	drkoku	\N
37	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0201234467	10:47:19.887957	t	nii	\N
38	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0201234467                                        	10:49:37.834693	t	nii	\N
39	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	027507907	12:52:50.020152	t	naa	\N
40	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	027507907                                         	12:53:41.341669	t	naa	\N
41	a8447567d3aa5c32a3f197d9156a34fbd820f9290e8cccdcc640422f7aa7e147	99887766	13:27:31.044665	t	patmercy	\N
42	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0543901100	16:08:20.788268	t	claradoc	\N
43	b2036656b8afe1586f68af792d17100fadd2ed2367c925d58d3484e4761a4f8f	445567787	05:30:54.831328	t	patemma	\N
44	b2036656b8afe1586f68af792d17100fadd2ed2367c925d58d3484e4761a4f8f	445567787                                         	05:43:48.315829	t	patemma	\N
45	356e20864cb22a75b64121a04606254f11da037cd533d48c6c8e855601be0c5b	45666777	10:50:47.375914	t	nursegloria	\N
46	356e20864cb22a75b64121a04606254f11da037cd533d48c6c8e855601be0c5b	45666777                                          	10:52:02.863341	t	nursegloria	\N
47	625b9cf31e5744733d007297e01066a44e385d4c51ef78306ed4b38e7630e844	0244574744	11:04:27.417142	t	papsicle	\N
48	625b9cf31e5744733d007297e01066a44e385d4c51ef78306ed4b38e7630e844	0244574744                                        	11:21:46.797892	t	papsicle	\N
49	93aa8e032ac13dc4b3eaf50cbf465d2dbf17c4a55891f2698ebf5bdfae529be8	0200000001	10:11:51.649693	t	kwakuessel	\N
50	f2880bb1ea28995bfa68716e8e9cd74d802b6e8b73638294f8386886e981a04d	44445666	07:30:50.545616	t	nursemercy	\N
51	cb9d7e942f9838817d3cc1ee507240eebe305dc6f1532cf92c1d28391bf67939	0200000010	17:12:13.914362	t	chale	\N
52	cb9d7e942f9838817d3cc1ee507240eebe305dc6f1532cf92c1d28391bf67939	0200000010                                        	17:46:21.229243	t	chale	\N
53	e5351a1b138656788e51c7dbf1baba4d0eb75bd110d1a8b498b63926b15faf4d	0200000006	22:47:59.740226	t	may	\N
54	45a00a3962438c5abdffe4ff1c0b3a1a11a9aec76777f7a3ee240d305fb6a721	0241000000	23:01:31.033547	t	moesha	\N
55	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0246001190	11:11:26.233019	t	ck	\N
56	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0246001191	11:13:04.799271	t	cky	\N
57	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0246001196	11:20:46.459751	t	ckye	\N
58	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0246001110	11:22:23.007113	t	cke	\N
59	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0544110099	11:38:25.57502	t	melody	\N
60	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0544110090	11:39:23.12805	t	melodye	\N
61	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0567990021	12:11:53.795576	t	nora	\N
62	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0240901278	12:33:33.36311	t	yayra	\N
63	cee71eaf4ebca669b3db4e655c75f7755f965e498541ac3a630bfecb8ee87ee0	0240000003	12:49:11.757894	t	getty	\N
6	d169aa18ee15483aef92fb71a3eed0031e8d74715652e213a85fc66965edbed7	300	13:02:17.111951	t	paddy	\N
64	b592dc6a2efc7a96111b7fd118e128d47f25f2b0a5c2719e43364431b5330c88	0243000000	12:51:30.10172	t	namak	\N
65	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0547110090	14:09:01.112727	t	hpe	\N
66	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0567334423	14:27:55.411342	t	chizzy	\N
67	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0567889900	16:43:05.69208	t	clemsedem	\N
68	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0567009900	16:50:10.058555	t	asedem	\N
69	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0549009890	08:49:30.601037	t	jj	\N
70	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0240990011	08:52:16.759811	t	mawu	\N
71	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0564229984	10:46:52.681989	t	padimore	\N
72	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0578229100	11:07:47.570925	t	kenny	\N
73	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0548988722	11:11:21.363682	t	blaq	\N
74	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0243195788	11:28:36.170261	t	arnold	\N
75	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0203443235	11:37:58.801313	t	naa1	\N
76	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0578990099	12:47:28.793278	t	nancy	\N
77	0414530a84a89ce3f1d693f0376570be8cc1177bee503027cbf15d4a79d9a9f5	0540000001	15:43:40.0559	t	pat	\N
78	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0569001123	09:57:17.295617	t	mena	\N
79	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0569001124	10:01:18.765422	t	mensa	\N
80	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0569001129	10:02:55.715426	t	mensah	\N
81	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0569001126	10:03:50.103856	t	mensahs	\N
82	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0569001160	10:04:47.611194	t	mens	\N
83	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0249001102	10:09:13.403833	t	stev	\N
84	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0269012209	17:42:25.271118	t	tiery	\N
85	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0549013390	18:15:56.873811	t	mawunya	\N
86	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0578119903	18:23:09.927861	t	davido	\N
87	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0568910299	18:31:02.878495	t	matthew	\N
88	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	024399010	09:05:54.557964	t	joan	\N
89	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0249009890	11:07:57.396129	t	celest	\N
90	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0546778299	11:44:33.009097	t	yaa	\N
91	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0271234567	11:49:20.180029	t	yaaa	\N
92	df4b0a3d762c150089f185b86b1bc89874cfee38c08c61db99dbd7dde57d61f8	0541840900	20:51:13.238287	t	paddy1	\N
93	9a02247ddd864b9a04fd8a220e02a37bf375c8f47695e50e78ba8bd35c5ffbb9	0540000987	20:52:13.480061	t	paddy2	\N
94	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0205869653	09:33:53.16873	t	maame	\N
95	af7acf0251392b90198d89b9934c9a7f4a60d2b7765e2d673f08a3c48cb333c1	44433333	12:21:26.19443	t	nursebecky	\N
96	ca068749082aac43d67e55ad71962e320a398b0405baa18996492b4e756a88fd	55566666	12:29:55.428859	t	nurseaugust	\N
97	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0248109024	12:59:51.414948	t	cloe	\N
98	022d787db18783eec27669a3b950dbeb0e48f858567b9d9fcc866a0c601c6ee4	4456777778	13:01:09.053816	t	patgloria	\N
99	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0245892009	13:03:19.831251	t	clueh	\N
100	17dffde774df0caff8b6997b37163d4dc671d0c2f844aea43929e980480f288e	339909999	13:18:53.814511	t	drabdul	\N
101	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	0541840980	14:00:19.312336	t	paddydoctor	\N
102	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	0248190033	14:26:33.168184	t	luck	\N
103	a14e5f92c29592c7fd21e99e0a112d206cfdf4e74270e33957689840485f97cc	55678899090	15:36:20.026259	t	drchilax	\N
104	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	0541840000	17:57:13.555589	t	paddydoc	\N
105	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	0541840901	21:29:12.577806	t	paddydoc1	\N
106	47ee518e8ffc2a6940ed3c973d1801748fdfe05c23938494b38e351b87d0602a	0200000011	21:35:52.964303	t	paddydocweb	\N
107	c6a9c46899f8e648ed1ff0f926bff782e0141e39dcea7ab882b0da525e5058ff	0200000100	21:48:10.199636	t	paddydocc	\N
108	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0269022431	12:01:30.511662	t	zeal	\N
109	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0248109980	12:22:14.763874	t	zealous	\N
110	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0241840988	13:34:27.394542	t	paddydocd	\N
111	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541850993	13:50:48.247698	t	paddydoca	\N
112	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0541012100	13:56:30.915203	t	clementina	\N
113	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0201840988	14:03:18.393564	t	clementino	\N
114	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	0201021112	14:13:00.082994	t	clementine	\N
115	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0201234567	14:13:12.507269	t	ben	\N
116	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0264620508	21:26:36.591725	t	frank	\N
117	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0248110987	13:15:28.412609	t	clacla	\N
118	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0241233778	13:19:45.172036	t	clare	\N
119	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0249011980	13:32:22.695953	t	mom	\N
123	e24df920078c3dd4e7e8d2442f00e5c9ab2a231bb3918d65cc50906e49ecaef4	0556296012	15:24:11.581937	t	kay	\N
126	8a9bcf1e51e812d0af8465a8dbcc9f741064bf0af3b3d08e6b0246437c19f7fb	0266123456	09:32:48.636931	t	jerry1	\N
130	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	0278945612	16:36:28.784814	t	minaa	\N
136	932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef	0209433806	12:55:04.153916	t	dee	\N
139	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	0205869653	12:23:26.949681	t	freda	\N
140	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	0247915505	12:36:11.492247	t	samson	\N
143	10d2f04f8cabca069e9be72143f1ff0f93992d91d7a7e4dfb82dfe8dbe04ea26	55555577777	10:23:50.742712	t	nyants	\N
144	f0b7f71ec4da1c026c372cc862501f23ebd9dafc0256252815a3f6066722395c	88888844444	10:27:57.298661	t	dranas	\N
\.


--
-- Name: password_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.password_table_id_seq', 235, true);


--
-- Data for Name: patient_billing_infos; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.patient_billing_infos (id, appointment_id, approval_status, approval_date, payment_status, payment_date, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
199	746	t	2018-12-15 09:59:20.289999	t	2018-12-15 09:59:20.290002	\N	145	t	f	2018-12-15 09:59:20.290698	2018-12-15 09:59:20.290698
55	626	t	2019-01-02 13:11:11.829708	f	\N	\N	158	t	f	2018-11-26 16:27:05.120235	2019-01-02 13:11:11.829708
94	660	f	2019-01-25 20:26:13.570907	f	\N	\N	158	t	f	2018-12-03 13:30:15.033848	2019-01-25 20:26:13.570907
128	696	f	2019-01-25 20:59:21.794119	f	\N	\N	158	t	f	2018-12-13 11:58:54.018589	2019-01-25 20:59:21.794119
101	668	f	2019-01-25 21:15:33.525902	f	\N	\N	158	t	f	2018-12-11 18:00:43.678517	2019-01-25 21:15:33.525902
23	579	\N	\N	f	\N	\N	36	t	f	2018-11-14 12:41:49.564769	2018-11-14 12:41:49.564769
24	580	\N	\N	f	\N	\N	36	t	f	2018-11-14 12:49:24.823855	2018-11-14 12:49:24.823855
25	581	\N	\N	f	\N	\N	36	t	f	2018-11-14 12:54:57.612172	2018-11-14 12:54:57.612172
26	582	\N	\N	f	\N	\N	36	t	f	2018-11-14 13:01:47.054334	2018-11-14 13:01:47.054334
27	587	\N	\N	f	\N	\N	36	t	f	2018-11-14 16:34:31.019365	2018-11-14 16:34:31.019365
28	588	\N	\N	f	\N	\N	36	t	f	2018-11-14 16:38:06.02472	2018-11-14 16:38:06.02472
29	589	\N	\N	f	\N	\N	36	t	f	2018-11-14 16:40:13.514864	2018-11-14 16:40:13.514864
30	590	\N	\N	f	\N	\N	36	t	f	2018-11-14 16:46:55.222796	2018-11-14 16:46:55.222796
31	591	\N	\N	f	\N	\N	36	t	f	2018-11-14 16:57:53.73707	2018-11-14 16:57:53.73707
32	592	\N	\N	f	\N	\N	36	t	f	2018-11-14 16:59:39.671305	2018-11-14 16:59:39.671305
33	593	\N	\N	f	\N	\N	36	t	f	2018-11-14 17:00:58.458133	2018-11-14 17:00:58.458133
34	595	\N	\N	f	\N	\N	36	t	f	2018-11-14 17:06:06.071106	2018-11-14 17:06:06.071106
35	605	\N	\N	f	\N	\N	36	t	f	2018-11-15 09:44:45.325734	2018-11-15 09:44:45.325734
36	606	\N	\N	f	\N	\N	36	t	f	2018-11-15 09:46:28.314227	2018-11-15 09:46:28.314227
37	607	\N	\N	f	\N	\N	36	t	f	2018-11-15 09:46:28.3441	2018-11-15 09:46:28.3441
38	608	\N	\N	f	\N	\N	36	t	f	2018-11-15 09:46:28.3595	2018-11-15 09:46:28.3595
40	610	\N	\N	f	\N	\N	36	t	f	2018-11-15 09:51:47.640751	2018-11-15 09:51:47.640751
41	611	\N	\N	f	\N	\N	36	t	f	2018-11-15 10:28:13.100824	2018-11-15 10:28:13.100824
42	612	\N	\N	f	\N	\N	36	t	f	2018-11-15 10:28:13.145267	2018-11-15 10:28:13.145267
43	613	\N	\N	f	\N	\N	36	t	f	2018-11-15 10:54:09.179659	2018-11-15 10:54:09.179659
44	614	\N	\N	f	\N	\N	36	t	f	2018-11-15 10:54:09.208524	2018-11-15 10:54:09.208524
45	615	\N	\N	f	\N	\N	36	t	f	2018-11-15 10:55:06.680326	2018-11-15 10:55:06.680326
46	616	\N	\N	f	\N	\N	36	t	f	2018-11-15 10:55:06.698143	2018-11-15 10:55:06.698143
47	617	\N	\N	f	\N	\N	36	t	f	2018-11-15 10:55:34.135923	2018-11-15 10:55:34.135923
48	618	\N	\N	f	\N	\N	36	t	f	2018-11-15 10:55:34.162303	2018-11-15 10:55:34.162303
49	619	\N	\N	f	\N	\N	36	t	f	2018-11-15 10:55:58.425614	2018-11-15 10:55:58.425614
51	622	t	2018-11-15 17:46:56.9747	t	2018-11-15 17:46:56.974702	\N	36	t	f	2018-11-15 17:46:56.975505	2018-11-15 17:46:56.975505
52	623	t	2018-11-15 17:48:41.839341	t	2018-11-15 17:48:41.839343	\N	36	t	f	2018-11-15 17:48:41.840185	2018-11-15 17:48:41.840185
54	625	\N	\N	f	\N	\N	158	t	f	2018-11-26 16:25:42.216747	2018-11-26 16:25:42.216747
56	627	\N	\N	f	\N	\N	158	t	f	2018-11-26 16:27:43.00136	2018-11-26 16:27:43.00136
74	644	t	2018-11-28 17:04:11.032774	t	2018-11-28 17:14:37	\N	158	t	f	2018-11-28 17:02:25.162842	2018-11-28 17:04:11.032774
75	645	\N	\N	f	\N	\N	158	t	f	2018-11-28 17:34:55.978118	2018-11-28 17:34:55.978118
78	646	\N	\N	f	\N	\N	158	t	f	2018-11-28 18:17:48.694469	2018-11-28 18:17:48.694469
68	639	t	2018-11-30 16:14:28.886847	f	\N	\N	158	t	f	2018-11-28 14:01:16.16285	2018-11-30 16:14:28.886847
39	609	t	2018-12-01 13:17:06.380701	f	\N	\N	36	t	f	2018-11-15 09:46:28.374309	2018-12-01 13:17:06.380701
80	651	\N	\N	f	\N	\N	145	t	f	2018-12-01 23:02:37.63627	2018-12-01 23:02:37.63627
81	652	\N	\N	f	\N	\N	145	t	f	2018-12-01 23:04:40.693024	2018-12-01 23:04:40.693024
82	654	t	2018-12-01 23:10:51.386587	t	2018-12-01 23:10:51.386589	\N	145	t	f	2018-12-01 23:10:51.387463	2018-12-01 23:10:51.387463
84	656	t	2018-12-03 01:03:23.390132	t	2018-12-03 01:03:23.390134	\N	145	t	f	2018-12-03 01:03:23.391	2018-12-03 01:03:23.391
79	650	t	2018-12-03 01:06:38.888945	f	\N	\N	145	t	f	2018-12-01 22:59:14.069959	2018-12-03 01:06:38.888945
50	620	t	2018-12-03 01:10:43.194334	f	\N	\N	36	t	f	2018-11-15 10:55:58.440119	2018-12-03 01:10:43.194334
83	655	t	2018-12-03 01:35:22.836513	f	\N	\N	145	t	f	2018-12-01 23:13:26.135963	2018-12-03 01:35:22.836513
53	624	t	2018-11-28 10:49:40.108799	f	\N	\N	158	t	f	2018-11-26 16:23:04.95059	2018-11-28 10:49:40.108799
58	629	\N	\N	f	\N	\N	158	t	f	2018-11-28 13:44:58.498021	2018-11-28 13:44:58.498021
59	630	\N	\N	f	\N	\N	158	t	f	2018-11-28 13:45:22.370649	2018-11-28 13:45:22.370649
60	631	\N	\N	f	\N	\N	158	t	f	2018-11-28 13:54:55.151477	2018-11-28 13:54:55.151477
61	632	\N	\N	f	\N	\N	158	t	f	2018-11-28 13:55:22.101736	2018-11-28 13:55:22.101736
62	633	\N	\N	f	\N	\N	158	t	f	2018-11-28 13:56:01.06264	2018-11-28 13:56:01.06264
63	634	\N	\N	f	\N	\N	158	t	f	2018-11-28 13:56:26.143295	2018-11-28 13:56:26.143295
64	635	\N	\N	f	\N	\N	158	t	f	2018-11-28 13:56:43.751346	2018-11-28 13:56:43.751346
65	636	\N	\N	f	\N	\N	158	t	f	2018-11-28 13:58:03.703475	2018-11-28 13:58:03.703475
66	637	\N	\N	f	\N	\N	158	t	f	2018-11-28 13:58:33.50573	2018-11-28 13:58:33.50573
67	638	\N	\N	f	\N	\N	158	t	f	2018-11-28 14:00:20.909273	2018-11-28 14:00:20.909273
70	641	\N	\N	f	\N	\N	158	t	f	2018-11-28 14:07:21.048673	2018-11-28 14:07:21.048673
72	642	t	2018-11-28 16:51:08.198035	f	\N	\N	158	t	f	2018-11-28 14:12:35.122508	2018-11-28 16:51:08.198035
86	658	t	2018-12-03 13:35:12.782759	f	\N	\N	158	t	f	2018-12-03 13:25:37.176585	2018-12-03 13:35:12.782759
97	661	\N	\N	f	\N	\N	158	t	f	2018-12-04 11:04:25.712365	2018-12-04 11:04:25.712365
98	662	t	2018-12-04 11:07:28.996368	t	2018-12-04 11:07:28.99637	\N	158	t	f	2018-12-04 11:07:28.997088	2018-12-04 11:07:28.997088
73	643	t	2018-12-05 14:16:38.712311	f	\N	\N	158	t	f	2018-11-28 14:13:43.437379	2018-12-05 14:16:38.712311
69	640	t	2018-12-06 14:45:22.159231	f	\N	\N	158	t	f	2018-11-28 14:05:31.045155	2018-12-06 14:45:22.159231
57	628	t	2018-12-06 17:55:25.173029	f	\N	\N	158	t	f	2018-11-28 13:44:26.860745	2018-12-06 17:55:25.173029
99	665	t	2018-12-06 18:43:09.998859	t	2018-12-06 18:43:09.998861	\N	158	t	f	2018-12-06 18:43:10.026894	2018-12-06 18:43:10.026894
100	666	\N	\N	f	\N	\N	158	t	f	2018-12-06 18:43:54.565118	2018-12-06 18:43:54.565118
102	669	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:01:10.520639	2018-12-11 18:01:10.520639
103	670	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:01:33.397678	2018-12-11 18:01:33.397678
106	673	t	2018-12-11 18:03:33.92154	t	2018-12-11 18:03:33.921542	\N	158	t	f	2018-12-11 18:03:33.922413	2018-12-11 18:03:33.922413
107	674	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:11:49.885567	2018-12-11 18:11:49.885567
108	675	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:17:37.329974	2018-12-11 18:17:37.329974
109	676	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:22:01.479493	2018-12-11 18:22:01.479493
110	677	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:22:28.648051	2018-12-11 18:22:28.648051
111	678	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:24:45.780374	2018-12-11 18:24:45.780374
112	679	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:25:32.178284	2018-12-11 18:25:32.178284
113	680	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:26:15.023631	2018-12-11 18:26:15.023631
114	681	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:26:36.865767	2018-12-11 18:26:36.865767
115	682	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:27:00.147446	2018-12-11 18:27:00.147446
116	684	\N	\N	f	\N	\N	158	t	f	2018-12-11 18:28:38.358417	2018-12-11 18:28:38.358417
117	685	t	2018-12-11 18:29:14.614841	t	2018-12-11 18:29:14.614842	\N	158	t	f	2018-12-11 18:29:14.615671	2018-12-11 18:29:14.615671
105	672	t	2018-12-11 18:35:10.593884	f	\N	\N	158	t	f	2018-12-11 18:02:51.929835	2018-12-11 18:35:10.593884
104	671	t	2018-12-11 18:36:33.921708	f	\N	\N	158	t	f	2018-12-11 18:02:17.381592	2018-12-11 18:36:33.921708
118	686	\N	\N	f	\N	\N	158	t	f	2018-12-13 10:31:17.415749	2018-12-13 10:31:17.415749
119	687	t	2018-12-13 11:15:34.399572	t	2018-12-13 11:15:34.399574	\N	158	t	f	2018-12-13 11:15:34.40041	2018-12-13 11:15:34.40041
120	688	t	2018-12-13 11:16:09.875646	t	2018-12-13 11:16:09.875646	\N	158	t	f	2018-12-13 11:16:09.876465	2018-12-13 11:16:09.876465
125	693	\N	\N	f	\N	\N	158	t	f	2018-12-13 11:55:14.01721	2018-12-13 11:55:14.01721
127	695	\N	\N	f	\N	\N	158	t	f	2018-12-13 11:58:33.082038	2018-12-13 11:58:33.082038
129	697	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:05:47.593957	2018-12-13 12:05:47.593957
130	698	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:06:10.972099	2018-12-13 12:06:10.972099
131	699	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:09:38.373521	2018-12-13 12:09:38.373521
132	700	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:10:34.979731	2018-12-13 12:10:34.979731
126	694	t	2018-12-13 12:30:40.920489	f	\N	\N	158	t	f	2018-12-13 11:55:46.021829	2018-12-13 12:30:40.920489
85	657	t	2018-12-13 18:42:37.945617	f	\N	\N	145	t	f	2018-12-03 01:53:16.552514	2018-12-13 18:42:37.945617
133	701	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:11:57.476639	2018-12-13 12:11:57.476639
134	702	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:14:03.192532	2018-12-13 12:14:03.192532
135	703	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:15:47.489408	2018-12-13 12:15:47.489408
136	704	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:16:50.306135	2018-12-13 12:16:50.306135
122	690	t	2018-12-13 12:23:27.023304	t	2018-12-13 12:24:38	\N	158	t	f	2018-12-13 11:23:31.68966	2018-12-13 12:23:27.023304
137	705	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:34:15.120134	2018-12-13 12:34:15.120134
138	706	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:34:48.933952	2018-12-13 12:34:48.933952
139	707	\N	\N	f	\N	\N	158	t	f	2018-12-13 12:37:23.00714	2018-12-13 12:37:23.00714
140	709	t	2018-12-13 14:23:07.115855	t	2018-12-13 14:23:07.115857	\N	158	t	f	2018-12-13 14:23:07.116631	2018-12-13 14:23:07.116631
142	711	t	2018-12-13 14:26:18.064111	t	2018-12-13 14:26:18.064113	\N	158	t	f	2018-12-13 14:26:18.068884	2018-12-13 14:26:18.068884
141	710	t	2018-12-13 14:32:05.513535	f	\N	\N	158	t	f	2018-12-13 14:25:30.364163	2018-12-13 14:32:05.513535
143	713	\N	\N	f	\N	\N	158	t	f	2018-12-13 14:39:43.406857	2018-12-13 14:39:43.406857
144	715	t	2018-12-14 00:00:22.361038	t	2018-12-14 00:00:22.36104	\N	145	t	f	2018-12-14 00:00:22.383764	2018-12-14 00:00:22.383764
145	716	t	2018-12-14 00:13:57.622869	t	2018-12-14 00:13:57.622871	\N	145	t	f	2018-12-14 00:13:57.651595	2018-12-14 00:13:57.651595
146	717	t	2018-12-14 00:16:38.492509	t	2018-12-14 00:16:38.492511	\N	145	t	f	2018-12-14 00:16:38.493306	2018-12-14 00:16:38.493306
147	718	\N	\N	f	\N	\N	145	t	f	2018-12-14 00:27:20.540445	2018-12-14 00:27:20.540445
148	719	\N	\N	f	\N	\N	145	t	f	2018-12-14 00:32:41.52886	2018-12-14 00:32:41.52886
151	722	\N	\N	f	\N	\N	145	t	f	2018-12-14 09:32:56.884609	2018-12-14 09:32:56.884609
150	721	t	2018-12-14 09:34:18.831605	f	\N	\N	145	t	f	2018-12-14 09:30:53.033043	2018-12-14 09:34:18.831605
152	723	\N	\N	f	\N	\N	145	t	f	2018-12-14 10:11:42.582287	2018-12-14 10:11:42.582287
153	724	\N	\N	f	\N	\N	145	t	f	2018-12-14 10:12:22.764444	2018-12-14 10:12:22.764444
154	725	\N	\N	f	\N	\N	145	t	f	2018-12-14 10:13:17.274649	2018-12-14 10:13:17.274649
155	726	\N	\N	f	\N	\N	145	t	f	2018-12-14 10:13:50.330547	2018-12-14 10:13:50.330547
156	727	\N	\N	f	\N	\N	145	t	f	2018-12-14 10:16:58.27363	2018-12-14 10:16:58.27363
157	736	t	2018-12-14 12:15:40.908649	f	\N	\N	158	t	f	2018-12-14 12:14:36.673319	2018-12-14 12:15:40.908649
158	737	t	2018-12-14 12:21:36.099163	f	\N	\N	158	t	f	2018-12-14 12:20:47.418345	2018-12-14 12:21:36.099163
159	738	\N	\N	f	\N	\N	158	t	f	2018-12-14 16:44:59.543082	2018-12-14 16:44:59.543082
160	739	\N	\N	f	\N	\N	158	t	f	2018-12-14 17:56:00.800916	2018-12-14 17:56:00.800916
149	720	t	2018-12-15 06:55:07.56186	f	\N	\N	145	t	f	2018-12-14 00:35:23.840939	2018-12-15 06:55:07.56186
165	742	t	2018-12-15 07:15:07.225911	f	\N	\N	158	t	f	2018-12-14 18:11:11.497931	2018-12-15 07:15:07.225911
201	747	\N	\N	f	\N	\N	145	t	f	2018-12-15 10:06:49.562335	2018-12-15 10:06:49.562335
161	740	t	2018-12-14 18:02:46.467736	f	\N	\N	158	t	f	2018-12-14 17:56:43.68481	2018-12-14 18:02:46.467736
200	747	t	2018-12-15 10:07:35.937543	f	\N	\N	145	t	f	2018-12-15 10:05:56.200582	2018-12-15 10:07:35.937543
215	749	t	2018-12-15 10:45:09.649694	f	\N	\N	145	t	f	2018-12-15 10:39:47.140981	2018-12-15 10:45:09.649694
216	750	t	2018-12-15 11:06:10.626632	f	\N	\N	145	t	f	2018-12-15 10:53:03.013832	2018-12-15 11:06:10.626632
255	791	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:20:13.221155	2018-12-20 10:20:13.221155
217	752	t	2018-12-18 09:47:10.661494	t	2018-12-18 10:02:06	\N	158	t	f	2018-12-18 09:45:28.850419	2018-12-18 09:47:10.661494
218	753	\N	\N	f	\N	\N	145	t	f	2018-12-18 16:38:40.163566	2018-12-18 16:38:40.163566
220	756	t	2018-12-19 12:31:55.982877	t	2018-12-19 12:31:55.982879	\N	36	t	f	2018-12-19 12:31:56.004338	2018-12-19 12:31:56.004338
221	757	t	2018-12-19 12:34:14.200698	t	2018-12-19 12:34:14.2007	\N	36	t	f	2018-12-19 12:34:14.201442	2018-12-19 12:34:14.201442
222	758	\N	\N	f	\N	\N	36	t	f	2018-12-19 12:42:03.656917	2018-12-19 12:42:03.656917
224	760	\N	\N	f	\N	\N	36	t	f	2018-12-19 12:46:51.473949	2018-12-19 12:46:51.473949
225	761	\N	\N	f	\N	\N	36	t	f	2018-12-19 15:30:44.435657	2018-12-19 15:30:44.435657
226	762	\N	\N	f	\N	\N	36	t	f	2018-12-19 16:19:44.056287	2018-12-19 16:19:44.056287
227	763	\N	\N	f	\N	\N	36	t	f	2018-12-19 16:19:44.084959	2018-12-19 16:19:44.084959
228	764	\N	\N	f	\N	\N	36	t	f	2018-12-19 16:19:44.099763	2018-12-19 16:19:44.099763
229	765	\N	\N	f	\N	\N	36	t	f	2018-12-19 17:53:55.289962	2018-12-19 17:53:55.289962
230	766	\N	\N	f	\N	\N	36	t	f	2018-12-19 17:53:55.314887	2018-12-19 17:53:55.314887
231	767	\N	\N	f	\N	\N	36	t	f	2018-12-19 17:53:55.328358	2018-12-19 17:53:55.328358
232	768	\N	\N	f	\N	\N	36	t	f	2018-12-19 17:56:30.935905	2018-12-19 17:56:30.935905
233	769	\N	\N	f	\N	\N	36	t	f	2018-12-19 17:57:51.996328	2018-12-19 17:57:51.996328
234	770	\N	\N	f	\N	\N	36	t	f	2018-12-19 17:59:04.044424	2018-12-19 17:59:04.044424
235	771	\N	\N	f	\N	\N	36	t	f	2018-12-19 17:59:04.577926	2018-12-19 17:59:04.577926
236	772	\N	\N	f	\N	\N	36	t	f	2018-12-19 18:05:03.078625	2018-12-19 18:05:03.078625
237	773	\N	\N	f	\N	\N	36	t	f	2018-12-19 18:06:19.192508	2018-12-19 18:06:19.192508
238	774	\N	\N	f	\N	\N	36	t	f	2018-12-19 18:06:19.255527	2018-12-19 18:06:19.255527
239	775	\N	\N	f	\N	\N	36	t	f	2018-12-19 18:06:19.282028	2018-12-19 18:06:19.282028
240	776	\N	\N	f	\N	\N	36	t	f	2018-12-20 07:33:00.945858	2018-12-20 07:33:00.945858
241	777	\N	\N	f	\N	\N	36	t	f	2018-12-20 07:33:00.990361	2018-12-20 07:33:00.990361
242	778	\N	\N	f	\N	\N	36	t	f	2018-12-20 09:06:08.935099	2018-12-20 09:06:08.935099
243	779	\N	\N	f	\N	\N	36	t	f	2018-12-20 09:11:47.395885	2018-12-20 09:11:47.395885
244	780	\N	\N	f	\N	\N	36	t	f	2018-12-20 09:13:45.471683	2018-12-20 09:13:45.471683
245	781	\N	\N	f	\N	\N	36	t	f	2018-12-20 09:29:08.454652	2018-12-20 09:29:08.454652
246	782	\N	\N	f	\N	\N	36	t	f	2018-12-20 09:30:50.219217	2018-12-20 09:30:50.219217
247	783	\N	\N	f	\N	\N	36	t	f	2018-12-20 09:33:45.065665	2018-12-20 09:33:45.065665
248	784	\N	\N	f	\N	\N	36	t	f	2018-12-20 09:41:02.498576	2018-12-20 09:41:02.498576
249	785	\N	\N	f	\N	\N	36	t	f	2018-12-20 09:58:10.891694	2018-12-20 09:58:10.891694
250	786	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:10:31.387055	2018-12-20 10:10:31.387055
251	787	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:15:56.366939	2018-12-20 10:15:56.366939
252	788	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:17:12.449064	2018-12-20 10:17:12.449064
253	789	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:20:09.317347	2018-12-20 10:20:09.317347
254	790	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:20:11.263814	2018-12-20 10:20:11.263814
256	792	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:22:10.636612	2018-12-20 10:22:10.636612
257	793	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:22:12.592636	2018-12-20 10:22:12.592636
258	794	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:22:14.548125	2018-12-20 10:22:14.548125
259	795	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:25:14.719196	2018-12-20 10:25:14.719196
260	796	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:25:59.580002	2018-12-20 10:25:59.580002
261	797	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:27:51.88882	2018-12-20 10:27:51.88882
262	798	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:30:22.320073	2018-12-20 10:30:22.320073
263	799	\N	\N	f	\N	\N	36	t	f	2018-12-20 10:44:55.353217	2018-12-20 10:44:55.353217
264	800	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:01:22.552957	2018-12-20 11:01:22.552957
265	801	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:01:25.146034	2018-12-20 11:01:25.146034
266	802	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:04:28.175651	2018-12-20 11:04:28.175651
267	803	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:05:29.847383	2018-12-20 11:05:29.847383
268	804	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:05:53.283182	2018-12-20 11:05:53.283182
269	805	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:06:39.086466	2018-12-20 11:06:39.086466
270	806	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:19:11.042638	2018-12-20 11:19:11.042638
271	807	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:30:10.841329	2018-12-20 11:30:10.841329
272	808	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:32:25.558721	2018-12-20 11:32:25.558721
273	809	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:33:37.119812	2018-12-20 11:33:37.119812
274	810	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:38:31.933714	2018-12-20 11:38:31.933714
275	811	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:40:05.658234	2018-12-20 11:40:05.658234
276	812	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:56:19.10894	2018-12-20 11:56:19.10894
277	813	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:57:56.843351	2018-12-20 11:57:56.843351
278	814	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:58:55.704618	2018-12-20 11:58:55.704618
279	815	\N	\N	f	\N	\N	36	t	f	2018-12-20 11:58:55.719905	2018-12-20 11:58:55.719905
280	816	\N	\N	f	\N	\N	36	t	f	2018-12-20 12:01:46.930765	2018-12-20 12:01:46.930765
281	817	\N	\N	f	\N	\N	36	t	f	2018-12-20 12:01:46.945239	2018-12-20 12:01:46.945239
282	818	\N	\N	f	\N	\N	36	t	f	2018-12-20 12:33:09.930864	2018-12-20 12:33:09.930864
223	759	t	2019-02-05 12:08:51.463056	f	\N	\N	36	t	f	2018-12-19 12:46:51.458248	2019-02-05 12:08:51.463056
283	819	\N	\N	f	\N	\N	36	t	f	2018-12-20 12:52:54.061501	2018-12-20 12:52:54.061501
284	820	\N	\N	f	\N	\N	36	t	f	2018-12-20 12:55:22.000811	2018-12-20 12:55:22.000811
285	821	\N	\N	f	\N	\N	36	t	f	2018-12-20 15:15:04.630279	2018-12-20 15:15:04.630279
286	822	\N	\N	f	\N	\N	36	t	f	2018-12-20 15:18:02.02665	2018-12-20 15:18:02.02665
287	823	\N	\N	f	\N	\N	36	t	f	2018-12-20 15:18:02.048412	2018-12-20 15:18:02.048412
288	824	\N	\N	f	\N	\N	36	t	f	2018-12-20 15:24:25.897178	2018-12-20 15:24:25.897178
289	825	\N	\N	f	\N	\N	36	t	f	2018-12-20 15:29:48.780345	2018-12-20 15:29:48.780345
290	826	\N	\N	f	\N	\N	36	t	f	2018-12-20 15:29:48.797869	2018-12-20 15:29:48.797869
291	827	\N	\N	f	\N	\N	36	t	f	2018-12-20 15:33:35.981106	2018-12-20 15:33:35.981106
292	828	\N	\N	f	\N	\N	158	t	f	2018-12-20 17:29:19.580227	2018-12-20 17:29:19.580227
293	829	\N	\N	f	\N	\N	158	t	f	2018-12-20 17:30:24.683281	2018-12-20 17:30:24.683281
294	830	\N	\N	f	\N	\N	36	t	f	2018-12-20 17:33:24.896678	2018-12-20 17:33:24.896678
295	831	\N	\N	f	\N	\N	36	t	f	2018-12-20 17:35:03.5173	2018-12-20 17:35:03.5173
296	832	\N	\N	f	\N	\N	36	t	f	2018-12-20 17:43:02.209237	2018-12-20 17:43:02.209237
297	832	\N	\N	f	\N	\N	36	t	f	2018-12-20 17:45:36.49478	2018-12-20 17:45:36.49478
298	833	t	2018-12-21 19:24:02.4648	f	\N	\N	36	t	f	2018-12-21 12:47:57.72651	2018-12-21 19:24:02.4648
219	755	t	2018-12-22 10:31:09.702347	f	\N	\N	36	t	f	2018-12-19 11:33:41.060217	2018-12-22 10:31:09.702347
299	834	t	2018-12-22 11:10:00.656999	f	\N	\N	158	t	f	2018-12-21 17:56:17.745722	2018-12-22 11:10:00.656999
300	835	\N	\N	f	\N	\N	158	t	f	2019-01-02 12:08:20.534622	2019-01-02 12:08:20.534622
301	836	t	2019-01-02 13:12:25.166239	f	\N	\N	36	t	f	2019-01-02 12:19:15.162942	2019-01-02 13:12:25.166239
302	837	\N	\N	f	\N	\N	158	t	f	2019-01-02 14:26:10.731289	2019-01-02 14:26:10.731289
303	838	t	2019-01-02 14:41:07.687593	f	\N	\N	158	t	f	2019-01-02 14:29:02.677502	2019-01-02 14:41:07.687593
343	882	t	2019-01-25 18:50:42.886886	t	2019-01-25 18:53:54	\N	158	t	f	2019-01-25 18:47:35.152219	2019-01-25 18:50:42.886886
304	839	t	2019-01-02 14:55:02.58079	t	2019-01-02 14:57:07	\N	158	t	f	2019-01-02 14:54:03.39585	2019-01-02 14:55:02.58079
334	873	t	2019-01-25 18:54:32.328429	f	\N	\N	36	t	f	2019-01-24 11:28:57.349411	2019-01-25 18:54:32.328429
305	840	t	2019-01-02 15:28:38.169292	t	2019-01-02 15:29:32	\N	158	t	f	2019-01-02 15:27:34.029925	2019-01-02 15:28:38.169292
121	689	t	2018-12-14 12:11:10.725096	t	2019-01-02 16:53:43	\N	158	t	f	2018-12-13 11:22:41.807354	2018-12-14 12:11:10.725096
306	841	\N	\N	f	\N	\N	158	t	f	2019-01-02 18:13:26.734689	2019-01-02 18:13:26.734689
307	841	\N	\N	f	\N	\N	158	t	f	2019-01-02 18:13:34.953794	2019-01-02 18:13:34.953794
308	842	t	2019-01-02 18:17:24.764582	t	2019-01-02 18:17:24.764584	\N	158	t	f	2019-01-02 18:17:24.765361	2019-01-02 18:17:24.765361
345	884	\N	\N	f	\N	\N	158	t	f	2019-01-25 19:19:31.164613	2019-01-25 19:19:31.164613
309	843	t	2019-01-02 18:21:33.834944	t	2019-01-02 18:22:54	\N	158	t	f	2019-01-02 18:19:16.069138	2019-01-02 18:21:33.834944
311	845	\N	\N	f	\N	\N	158	t	f	2019-01-03 11:04:16.678971	2019-01-03 11:04:16.678971
310	844	t	2019-01-03 11:04:54.955931	t	2019-01-03 11:06:33	\N	158	t	f	2019-01-03 11:02:07.546679	2019-01-03 11:04:54.955931
312	846	\N	\N	f	\N	\N	158	t	f	2019-01-03 11:07:57.228827	2019-01-03 11:07:57.228827
313	847	\N	\N	f	\N	\N	158	t	f	2019-01-03 11:14:00.770693	2019-01-03 11:14:00.770693
314	848	t	2019-01-11 12:09:04.616969	t	2019-01-11 12:09:04.616971	\N	145	t	f	2019-01-11 12:09:04.617925	2019-01-11 12:09:04.617925
315	849	\N	\N	f	\N	\N	145	t	f	2019-01-11 12:11:06.011077	2019-01-11 12:11:06.011077
316	849	\N	\N	f	\N	\N	145	t	f	2019-01-11 12:11:10.769393	2019-01-11 12:11:10.769393
317	850	\N	\N	f	\N	\N	145	t	f	2019-01-11 12:15:02.103712	2019-01-11 12:15:02.103712
318	850	\N	\N	f	\N	\N	145	t	f	2019-01-11 12:15:07.701952	2019-01-11 12:15:07.701952
319	851	t	2019-01-11 12:36:04.320418	t	2019-01-11 12:36:04.32042	\N	145	t	f	2019-01-11 12:36:04.321276	2019-01-11 12:36:04.321276
320	853	t	2019-01-11 13:50:40.840624	t	2019-01-11 13:50:40.840626	\N	145	t	f	2019-01-11 13:50:40.841522	2019-01-11 13:50:40.841522
321	854	\N	\N	f	\N	\N	36	t	f	2019-01-14 21:45:34.124585	2019-01-14 21:45:34.124585
322	855	\N	\N	f	\N	\N	36	t	f	2019-01-14 21:45:34.143142	2019-01-14 21:45:34.143142
323	857	\N	\N	f	\N	\N	36	t	f	2019-01-23 11:45:21.620032	2019-01-23 11:45:21.620032
324	858	\N	\N	f	\N	\N	36	t	f	2019-01-23 11:45:21.697574	2019-01-23 11:45:21.697574
325	859	\N	\N	f	\N	\N	36	t	f	2019-01-23 11:48:46.356221	2019-01-23 11:48:46.356221
327	861	\N	\N	f	\N	\N	36	t	f	2019-01-23 11:50:17.44693	2019-01-23 11:50:17.44693
328	862	\N	\N	f	\N	\N	36	t	f	2019-01-23 11:50:17.461387	2019-01-23 11:50:17.461387
329	868	\N	\N	f	\N	\N	36	t	f	2019-01-23 17:50:45.561548	2019-01-23 17:50:45.561548
330	869	\N	\N	f	\N	\N	36	t	f	2019-01-23 17:50:45.591688	2019-01-23 17:50:45.591688
331	870	\N	\N	f	\N	\N	36	t	f	2019-01-23 17:50:45.611688	2019-01-23 17:50:45.611688
332	871	\N	\N	f	\N	\N	36	t	f	2019-01-24 10:55:32.272333	2019-01-24 10:55:32.272333
333	872	\N	\N	f	\N	\N	36	t	f	2019-01-24 11:08:05.56809	2019-01-24 11:08:05.56809
336	875	t	2019-01-24 11:42:44.637843	t	2019-01-24 11:57:58	\N	36	t	f	2019-01-24 11:40:07.12421	2019-01-24 11:42:44.637843
346	885	t	2019-01-25 19:28:50.180867	t	2019-01-25 19:30:49	\N	158	t	f	2019-01-25 19:19:59.155306	2019-01-25 19:28:50.180867
337	876	t	2019-01-24 12:07:49.117067	t	2019-01-24 12:08:43	\N	36	t	f	2019-01-24 11:41:27.529347	2019-01-24 12:07:49.117067
338	877	\N	\N	f	\N	\N	158	t	f	2019-01-25 16:38:52.804275	2019-01-25 16:38:52.804275
339	878	\N	\N	f	\N	\N	158	t	f	2019-01-25 16:39:27.685186	2019-01-25 16:39:27.685186
335	874	t	2019-01-25 16:57:45.334088	f	\N	\N	36	t	f	2019-01-24 11:29:25.013444	2019-01-25 16:57:45.334088
326	860	f	2019-01-25 20:05:09.574609	f	\N	\N	36	t	f	2019-01-23 11:48:46.370254	2019-01-25 20:05:09.574609
347	886	\N	\N	f	\N	\N	145	t	f	2019-01-26 10:26:31.896177	2019-01-26 10:26:31.896177
348	887	\N	\N	f	\N	\N	145	t	f	2019-01-26 10:56:11.058404	2019-01-26 10:56:11.058404
340	879	t	2019-01-25 17:17:46.634266	t	2019-01-25 17:20:21	\N	158	t	f	2019-01-25 17:07:10.443074	2019-01-25 17:17:46.634266
341	880	t	2019-01-25 17:12:24.82381	t	2019-01-25 17:26:23	\N	158	t	f	2019-01-25 17:07:42.791049	2019-01-25 17:12:24.82381
344	883	\N	\N	f	\N	\N	158	t	f	2019-01-25 18:47:41.733648	2019-01-25 18:47:41.733648
349	888	\N	\N	f	\N	\N	158	t	f	2019-01-28 13:45:57.624117	2019-01-28 13:45:57.624117
342	881	t	2019-01-25 18:52:53.88237	f	\N	\N	158	t	f	2019-01-25 18:46:57.620423	2019-01-25 18:52:53.88237
350	889	\N	\N	f	\N	\N	158	t	f	2019-01-28 13:46:09.299015	2019-01-28 13:46:09.299015
351	890	\N	\N	f	\N	\N	158	t	f	2019-01-28 13:47:11.237931	2019-01-28 13:47:11.237931
352	891	\N	\N	f	\N	\N	158	t	f	2019-01-28 13:49:19.474847	2019-01-28 13:49:19.474847
353	892	\N	\N	f	\N	\N	158	t	f	2019-01-28 14:00:06.050661	2019-01-28 14:00:06.050661
354	894	\N	\N	f	\N	\N	158	t	f	2019-01-28 14:02:39.604542	2019-01-28 14:02:39.604542
355	896	\N	\N	f	\N	\N	158	t	f	2019-01-28 14:03:50.466323	2019-01-28 14:03:50.466323
356	898	\N	\N	f	\N	\N	158	t	f	2019-01-28 14:30:59.197821	2019-01-28 14:30:59.197821
357	900	\N	\N	f	\N	\N	158	t	f	2019-02-05 11:01:32.913375	2019-02-05 11:01:32.913375
358	902	t	2019-02-05 11:09:34.818538	t	2019-02-05 11:09:34.81854	\N	158	t	f	2019-02-05 11:09:34.819271	2019-02-05 11:09:34.819271
359	903	\N	\N	f	\N	\N	158	t	f	2019-02-05 11:28:51.449759	2019-02-05 11:28:51.449759
362	905	\N	\N	f	\N	\N	158	t	f	2019-02-05 11:59:22.359024	2019-02-05 11:59:22.359024
363	906	\N	\N	f	\N	\N	158	t	f	2019-02-05 12:00:04.066311	2019-02-05 12:00:04.066311
370	907	\N	\N	f	\N	\N	158	t	f	2019-02-05 12:00:54.731125	2019-02-05 12:00:54.731125
371	908	\N	\N	f	\N	\N	158	t	f	2019-02-05 12:01:59.371557	2019-02-05 12:01:59.371557
372	909	\N	\N	f	\N	\N	158	t	f	2019-02-05 12:04:39.389857	2019-02-05 12:04:39.389857
373	910	\N	\N	f	\N	\N	158	t	f	2019-02-05 12:05:48.376175	2019-02-05 12:05:48.376175
374	911	\N	\N	f	\N	\N	158	t	f	2019-02-05 12:06:21.934951	2019-02-05 12:06:21.934951
375	912	\N	\N	f	\N	\N	158	t	f	2019-02-05 12:27:18.552501	2019-02-05 12:27:18.552501
376	913	\N	\N	f	\N	\N	158	t	f	2019-02-05 12:27:53.71448	2019-02-05 12:27:53.71448
377	914	\N	\N	f	\N	\N	158	t	f	2019-02-05 12:29:32.100892	2019-02-05 12:29:32.100892
378	915	\N	\N	f	\N	\N	158	t	f	2019-02-05 17:32:01.645387	2019-02-05 17:32:01.645387
379	916	\N	\N	f	\N	\N	158	t	f	2019-02-05 17:42:47.546393	2019-02-05 17:42:47.546393
380	916	\N	\N	f	\N	\N	158	t	f	2019-02-05 17:42:55.304045	2019-02-05 17:42:55.304045
381	917	\N	\N	f	\N	\N	158	t	f	2019-02-05 17:45:00.547833	2019-02-05 17:45:00.547833
\.


--
-- Name: patient_billing_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.patient_billing_infos_id_seq', 381, true);


--
-- Data for Name: patient_med_records; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.patient_med_records (id, confirmed_appt_id, patient_id, doctor_id, clinical_complaints, clinical_examinations, working_diagnosis, investigation_rquired, treatments, follow_up_plan, created_at, updated_at, active_status, del_status, order_status, medicine, quantity, dosage, frequency, no_of_days) FROM stdin;
1	18	139	140	<p>Headache</p>	<p>Maleria test</p>	<p>Maleria</p>		<p>Give a box of ACT</p>		2018-04-16 12:33:50.004025	2018-04-16 12:33:50.004025	t	f	f	\N	\N	\N	\N	\N
2	130	137	140	<p>df djflk j</p>	<p>&nbsp;dklfjdkjf d</p>	<p>k djlfk jd</p>	<p>dlkfj kdjf</p>	<p>df kljd;kjf</p>\r\n<p>a lsdjf kjd</p>\r\n<p>d klfjdkl;fj kd</p>	<p>kdjfl;k jdkf j;dkj</p>\r\n<p>sdkj ;lksadf</p>\r\n<p>d kldj;f ds</p>\r\n<p>&nbsp;</p>	2018-06-07 17:05:13.624581	2018-06-07 17:05:13.624581	t	f	f	\N	\N	\N	\N	\N
3	130	137	140	<p>df dklfj kdj kdj kj</p>	<p>kjlk; jdkafk</p>	<p>jkdljf; dsjfk</p>	<p>kj;fdlkj</p>	<p>dklfj; k</p>\r\n<p>lsjd kfjads</p>\r\n<p>sdlkfj ak</p>	<p>kdlf;dj;</p>\r\n<p>lsdjkfj d</p>\r\n<p>&nbsp;</p>	2018-06-07 17:15:35.699592	2018-06-07 17:15:35.699592	t	f	f	\N	\N	\N	\N	\N
4	22	137	140	<p>ouu iiu dsfj</p>	<p>&nbsp;kdlfj;a</p>	<p>&nbsp;d;lfaj</p>		<p>dfldkfj df</p>	<p>kdjf;l kjdf</p>	2018-06-07 17:20:59.668458	2018-06-07 17:20:59.668458	t	f	f	\N	\N	\N	\N	\N
5	119	137	140	<p>dfkdj kfja f;ld jf;&nbsp;</p>	<p>kdlfjdfals kj</p>	<p>kjlfj d;lkfj&nbsp;</p>	<p>ljdf;kdjk dj&nbsp;</p>			2018-06-08 09:29:15.507651	2018-06-08 09:29:15.507651	t	f	f	\N	\N	\N	\N	\N
6	19	139	140	<p>kjfdjfk&nbsp;</p>	<p>j lkkjdfk jk j</p>	<p>kdkfj&nbsp;</p>	<p>df djlfkj kaj</p>	<p>&nbsp;djlfk jdk&nbsp;</p>	<p>kdjlf;k jdkfl&nbsp;</p>	2018-06-08 16:21:44.461768	2018-06-08 16:21:44.461768	t	f	f	\N	\N	\N	\N	\N
7	128	193	140	<p>ejfjdfkj</p>	<p>&nbsp;klj kdj;f; sa</p>	<p>&nbsp;jdk;ja fkdjfk</p>	<p>&nbsp;dlkj fkdjf&nbsp;</p>	<p>df jdlkfj&nbsp;</p>		2018-06-08 17:13:26.123057	2018-06-08 17:13:26.123057	t	f	f	\N	\N	\N	\N	\N
8	118	193	140	<p>df jdkl jka j</p>	<p>&nbsp;kjdlkj dk j;</p>	<p>&nbsp;j;dkflaj&nbsp;</p>	<p>&nbsp;k jdlk;jf d;jf&nbsp;</p>	<p>&nbsp;kdlf jdk&nbsp;</p>	<p>&nbsp;kjdlk;jf k;d&nbsp;</p>	2018-06-08 17:16:48.954206	2018-06-08 17:16:48.954206	t	f	f	\N	\N	\N	\N	\N
9	117	193	140	<p>df kdlf jdsl; jd jad</p>	<p>&nbsp;fkd;lfj kdfja</p>	<p>&nbsp;jd;lkj fkdsaj&nbsp;</p>	<p>&nbsp;kljd;fkjf d</p>			2018-06-08 17:20:54.713131	2018-06-08 17:20:54.713131	t	f	f	\N	\N	\N	\N	\N
10	174	256	258	<p>ngngvhs\\gduasaskh</p>	<p>ghfwedheok'</p>	<p>hghawffdhsogl</p>	<p>h\\sbsjdsfg</p>	<p>vsjdn</p>	<p>yes 2 wks&nbsp;</p>	2018-06-21 13:36:18.912143	2018-06-21 13:36:18.912143	t	f	f	\N	\N	\N	\N	\N
11	172	257	258							2018-06-21 13:46:42.045882	2018-06-21 13:46:42.045882	t	f	f	\N	\N	\N	\N	\N
12	173	257	258	<p>hi</p>	<p>hi</p>	<p>hi</p>	<p>hi</p>	<p>hi</p>	<p>hi</p>	2018-06-21 13:47:34.385664	2018-06-21 13:47:34.385664	t	f	f	\N	\N	\N	\N	\N
13	145	137	248	<p>sleepless night</p>	<p>catarrh test</p>	<p>liquid rob</p>	<p>see Tim</p>	<p>Prince says banging</p>	<p>call her at midnight&nbsp;</p>	2018-06-26 11:11:03.679612	2018-06-26 11:11:03.679612	t	f	f	\N	\N	\N	\N	\N
14	182	179	248	<p>Holy Spirit</p>	<p>amen</p>	<p>halleluyah</p>	<p>pray</p>	<p>pray</p>	<p>trust and obey</p>	2018-06-26 11:26:48.852536	2018-06-26 11:26:48.852536	t	f	f	\N	\N	\N	\N	\N
15	\N	\N	248	none	none	none	none	none	none	2018-07-17 18:34:12.384605	2018-07-17 18:34:12.384605	\N	\N	\N	\N	\N	\N	\N	\N
16	\N	\N	248	none	none	none	none	none	follow up	2018-07-17 18:46:06.477038	2018-07-17 18:46:06.477038	\N	\N	\N	\N	\N	\N	\N	\N
17	\N	247	\N	none	none	none	none	none	follow	2018-07-17 21:51:27.921071	2018-07-17 21:51:27.921071	\N	\N	\N	\N	\N	\N	\N	\N
18	\N	247	\N	noen	none	none	none	none	none	2018-07-17 21:55:46.679611	2018-07-17 21:55:46.679611	\N	\N	\N	\N	\N	\N	\N	\N
19	\N	247	\N	none	none	none	none	none	none	2018-07-18 08:32:01.882041	2018-07-18 08:32:01.882041	\N	\N	\N	\N	\N	\N	\N	\N
20	\N	250	\N	Headache	No malaria parasites	Rest	Scan	Para	Come back in 2wks	2018-07-18 14:21:45.330386	2018-07-18 14:21:45.330386	\N	\N	\N	\N	\N	\N	\N	\N
21	165	247	248	<p>stomach ache</p>	<p>ulcer</p>	<p>para</p>	<p>testing</p>	<p>rice</p>	<p>see me in a wk's time</p>	2018-07-18 15:01:59.289877	2018-07-18 15:01:59.289877	t	f	f	\N	\N	\N	\N	\N
22	\N	247	248	something new	stress	sleep	no investigation	paracetamol	sleep ooooo sleep	2018-07-19 11:34:04.404955	2018-07-19 11:34:04.404955	\N	\N	\N	\N	\N	\N	\N	\N
23	\N	247	248	sdfdsfdf	sdfsdf	sdfsdf	asdasdsd	asdasdsd	asdassdsa	2018-07-19 11:48:16.779752	2018-07-19 11:48:16.779752	\N	\N	\N	\N	\N	\N	\N	\N
24	193	247	248	heartache	no findings	clinic	none	none	none	2018-07-19 12:09:29.121691	2018-07-19 12:09:29.121691	\N	\N	\N	\N	\N	\N	\N	\N
25	207	257	258	Docto	Gklglfll	Gfklfllf	Irine	Para	2 weeks 	2018-07-23 12:16:00.205515	2018-07-23 12:16:00.205515	\N	\N	\N	\N	\N	\N	\N	\N
26	213	247	248	Ni	Hi	Ho	Bj	Vj	Ch	2018-07-23 12:16:51.068212	2018-07-23 12:16:51.068212	\N	\N	\N	\N	\N	\N	\N	\N
27	220	257	258	Headache 	Over ohike 	Uti 	Inv	Para 	2 week	2018-07-23 12:19:25.497016	2018-07-23 12:19:25.497016	\N	\N	\N	\N	\N	\N	\N	\N
28	219	257	258	Ok hi	Wow	Workkf 	Uss	Para	2 wks 	2018-07-23 12:23:05.276745	2018-07-23 12:23:05.276745	\N	\N	\N	\N	\N	\N	\N	\N
29	230	262	264	Good	Fine	Sleep	None	Fanta	Call	2018-07-24 12:29:56.646741	2018-07-24 12:29:56.646741	\N	\N	\N	\N	\N	\N	\N	\N
30	227	262	264	<p>migraine</p>	<p>test</p>	<p>sleep</p>	<p>more test</p>	<p>para</p>	<p>para</p>	2018-07-24 15:31:26.18607	2018-07-24 15:31:26.18607	t	f	f	\N	\N	\N	\N	\N
31	239	247	248	Ok	Ok	Ok	Ok	Ok	Ok	2018-08-07 16:11:40.442646	2018-08-07 16:11:40.442646	\N	\N	\N	\N	\N	\N	\N	\N
32	223	247	248	Alright	Ok	Ok	Ok	Ok	Ok	2018-08-07 16:12:40.765165	2018-08-07 16:12:40.765165	\N	\N	\N	\N	\N	\N	\N	\N
33	194	137	248	headache	headache	rest	none	rest	rest	2018-08-07 16:54:25.092132	2018-08-07 16:54:25.092132	\N	\N	\N	\N	\N	\N	\N	\N
34	145	137	248	none	none	none	none	none	none	2018-08-07 16:54:59.777609	2018-08-07 16:54:59.777609	\N	\N	\N	\N	\N	\N	\N	\N
35	193	247	248	none	none	none	onoe	none	none	2018-08-07 16:56:15.071428	2018-08-07 16:56:15.071428	\N	\N	\N	\N	\N	\N	\N	\N
36	198	137	248	me	me	me	me	me	me	2018-08-07 17:09:00.927053	2018-08-07 17:09:00.927053	\N	\N	\N	\N	\N	\N	\N	\N
37	209	137	248	none	none	none	none	none	fdsaf	2018-08-07 17:25:51.087586	2018-08-07 17:25:51.087586	\N	\N	\N	\N	\N	\N	\N	\N
38	208	137	248	no	no	no	no	no	no	2018-08-07 17:28:34.408307	2018-08-07 17:28:34.408307	\N	\N	\N	\N	\N	\N	\N	\N
39	202	137	248	Headache	Migraine	Sleep	Rest	Rest	Next week	2018-08-07 17:59:33.559105	2018-08-07 17:59:33.559105	\N	\N	\N	\N	\N	\N	\N	\N
40	201	137	248	A	B	C	D	E	F	2018-08-07 18:02:12.44472	2018-08-07 18:02:12.44472	\N	\N	\N	\N	\N	\N	\N	\N
41	238	257	248	A	B	C	D	E	F	2018-08-07 18:02:57.380024	2018-08-07 18:02:57.380024	\N	\N	\N	\N	\N	\N	\N	\N
42	138	136	230	None 	None	None	X ray	X ray	Next week	2018-08-08 12:03:37.499665	2018-08-08 12:03:37.499665	\N	\N	\N	\N	\N	\N	\N	\N
43	249	272	230	<p>none</p>	<p>rest</p>	<p>rest enough</p>			<p>rest</p>	2018-08-08 18:11:46.15583	2018-08-08 18:11:46.15583	t	f	f	\N	\N	\N	\N	\N
44	167	251	248	This and this and that	Dont know	As usual sleep	Lab	Dont know saf	Book an appointment next week	2018-08-08 20:35:45.830789	2018-08-08 20:35:45.830789	\N	\N	\N	\N	\N	\N	\N	\N
45	251	272	230	<p>hope&nbsp;</p>	<p>hope</p>	<p>hope</p>	<p>hope</p>	<p>hope</p>	<p>hope</p>	2018-08-09 09:17:45.029702	2018-08-09 09:17:45.029702	t	f	f	\N	\N	\N	\N	\N
46	244	267	230	Okay	Okay	Okay	Okay	Okay	Okay	2018-08-09 10:53:12.159302	2018-08-09 10:53:12.159302	\N	\N	\N	\N	\N	\N	\N	\N
47	191	257	258	Headaches 	Headache 	Hdch	Ct scan	Pmal	2 wks 	2018-08-09 13:29:38.669003	2018-08-09 13:29:38.669003	\N	\N	\N	\N	\N	\N	\N	\N
48	175	256	258	Diarrhoea 	Ibd	Ibd	Uss	Imodium	2 wks	2018-08-09 13:31:15.64002	2018-08-09 13:31:15.64002	\N	\N	\N	\N	\N	\N	\N	\N
49	264	276	258	Sick	High BP	Htn	Renal fn test 	Aldomet 	2wks	2018-08-09 13:33:11.772671	2018-08-09 13:33:11.772671	\N	\N	\N	\N	\N	\N	\N	\N
50	267	276	258	Infection toe 	Poorly healed toe \n	Dm	Bss	Antibiotic 	Video consult  2 wks 	2018-08-09 15:07:59.96898	2018-08-09 15:07:59.96898	\N	\N	\N	\N	\N	\N	\N	\N
51	267	276	258	Infection toe 	Poorly healed toe \n	Dm	Bss	Antibiotic 	Video consult  2 wks 	2018-08-09 15:08:28.769265	2018-08-09 15:08:28.769265	\N	\N	\N	\N	\N	\N	\N	\N
52	189	261	258	Good	Bwtter 	Db	Svvbb	Abt	 Discharge 	2018-08-09 15:16:19.513227	2018-08-09 15:16:19.513227	\N	\N	\N	\N	\N	\N	\N	\N
53	272	276	258	Dgg	Sddd	Dhhhk	Irine	Pmol	2wks	2018-08-09 16:22:34.30021	2018-08-09 16:22:34.30021	\N	\N	\N	\N	\N	\N	\N	\N
54	271	276	258	Gh	Ui	U	Tu	Tu	Tu	2018-08-09 16:23:03.38911	2018-08-09 16:23:03.38911	\N	\N	\N	\N	\N	\N	\N	\N
55	270	276	258	Dr	Dr	Hh	Thj	Der	Ghan	2018-08-09 16:23:36.020975	2018-08-09 16:23:36.020975	\N	\N	\N	\N	\N	\N	\N	\N
56	268	276	258	Fg	Fg	Fg	Fg	Fg	2wk	2018-08-09 16:24:13.945464	2018-08-09 16:24:13.945464	\N	\N	\N	\N	\N	\N	\N	\N
57	266	276	258	Ch	Fg	H	Gh	Rt	2w	2018-08-09 16:28:27.52903	2018-08-09 16:28:27.52903	\N	\N	\N	\N	\N	\N	\N	\N
58	280	277	140	\N	\N	\N	\N	\N	\N	2018-08-13 13:03:29.451278	2018-08-13 13:03:29.451278	t	f	f	\N	\N	\N	\N	\N
59	218	257	258	Fgi	Dhdfjc	Xhcj	B 	Xhcjc	2 weekd	2018-08-13 16:37:42.693128	2018-08-13 16:37:42.693128	\N	\N	\N	\N	\N	\N	\N	\N
64	286	139	140	\N	\N	\N	\N	\N	\N	2018-08-15 17:27:16.475578	2018-08-15 17:27:16.475578	t	f	f	["11111111111", "2222222222222"]	\N	["1111111111", "2222222222222"]	["1111111111111", "22222222"]	\N
66	286	139	140	\N	\N	\N	\N	\N	\N	2018-08-15 18:08:10.004229	2018-08-15 18:08:10.004229	t	f	f	["dfkajkja", "kdjfk", "jjjj"]	\N	["kjkafj", "ksjdf", "jjjj"]	["kdjfkaj", "kdjfkaj", "jjj"]	\N
68	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.398755	2018-08-15 18:43:04.398755	t	f	\N	\N	\N	\N	\N	\N
69	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.401049	2018-08-15 18:43:04.401049	t	f	\N	\N	\N	\N	\N	\N
70	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.402808	2018-08-15 18:43:04.402808	t	f	\N	\N	\N	\N	\N	\N
71	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.404476	2018-08-15 18:43:04.404476	t	f	\N	\N	\N	\N	\N	\N
72	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.406161	2018-08-15 18:43:04.406161	t	f	\N	\N	\N	\N	\N	\N
73	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.40783	2018-08-15 18:43:04.40783	t	f	\N	\N	\N	\N	\N	\N
74	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.409476	2018-08-15 18:43:04.409476	t	f	\N	\N	\N	\N	\N	\N
75	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.411119	2018-08-15 18:43:04.411119	t	f	\N	\N	\N	\N	\N	\N
76	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.412784	2018-08-15 18:43:04.412784	t	f	\N	\N	\N	\N	\N	\N
77	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.414438	2018-08-15 18:43:04.414438	t	f	\N	\N	\N	\N	\N	\N
78	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.416099	2018-08-15 18:43:04.416099	t	f	\N	\N	\N	\N	\N	\N
79	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.417747	2018-08-15 18:43:04.417747	t	f	\N	\N	\N	\N	\N	\N
80	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-08-15 18:43:04.41939	2018-08-15 18:43:04.41939	t	f	\N	\N	\N	\N	\N	\N
86	312	289	291	Hi	Low	Hello	Yello	Okay	Ok	2018-08-22 17:02:45.208887	2018-08-22 17:02:45.208887	\N	\N	\N	\N	\N	\N	\N	\N
87	311	289	291	Ok	Ok	Ok	Ok	Ok	Ok	2018-08-22 17:06:30.579646	2018-08-22 17:06:30.579646	\N	\N	\N	\N	\N	\N	\N	\N
88	313	289	291	Hi	Hi	Hi	Hi	Hi	Hi	2018-08-22 17:25:35.038413	2018-08-22 17:25:35.038413	\N	\N	\N	\N	\N	\N	\N	\N
89	314	247	248	Ok	fine	none	none	none	none	2018-08-24 14:36:57.75007	2018-08-24 14:36:57.75007	\N	\N	\N	\N	\N	\N	\N	\N
90	247	247	248	He looks ok.	Needs rest	Rest	none	none	none	2018-08-24 14:42:40.201655	2018-08-24 14:42:40.201655	\N	\N	\N	\N	\N	\N	\N	\N
91	327	304	303	I am very fine	Everything is fine	Fine is everything	Investigations required 	What other treatment	Come back in 2 weeks time	2018-09-10 16:01:15.184525	2018-09-10 16:01:15.184525	\N	\N	\N	\N	\N	\N	\N	\N
92	326	304	303	Clinical records	Findings ben	I am tired	Nothing	Sleep	You are fine	2018-09-10 16:03:24.918147	2018-09-10 16:03:24.918147	\N	\N	\N	\N	\N	\N	\N	\N
93	325	304	303	Boom	Bang	Bang	Boom	Bang	Bang	2018-09-10 16:03:57.632078	2018-09-10 16:03:57.632078	\N	\N	\N	\N	\N	\N	\N	\N
94	329	304	303	My name is	I have forgotten	Do i know?	Nothing	Eat well	Come back	2018-09-10 18:29:09.402293	2018-09-10 18:29:09.402293	\N	\N	\N	\N	\N	\N	\N	\N
95	330	304	303	Hi	Hi	Hi	Hi	Hi	Hi	2018-09-10 18:34:20.824246	2018-09-10 18:34:20.824246	\N	\N	\N	\N	\N	\N	\N	\N
96	331	304	303	Abc	Def	Ghi	Jkl	Mno	Pqr	2018-09-10 18:34:50.693712	2018-09-10 18:34:50.693712	\N	\N	\N	\N	\N	\N	\N	\N
97	331	304	303	Stu	Vwx	Yz	Thats my abcd	Hope i did well	Yaaay	2018-09-10 18:35:46.917345	2018-09-10 18:35:46.917345	\N	\N	\N	\N	\N	\N	\N	\N
98	282	267	264	Sfhl	Hsfai	Fdsahk	Hfkah hp	 Ojfdas 	Hflasf	2018-09-17 11:05:29.411927	2018-09-17 11:05:29.411927	\N	\N	\N	\N	\N	\N	\N	\N
99	352	322	323	Migraine 	Needs to visit a facility	Working fine	More rest	Para	Come back in 7 days	2018-09-17 18:42:39.025339	2018-09-17 18:42:39.025339	\N	\N	\N	\N	\N	\N	\N	\N
100	353	322	323	Sorry	Sorry	Sorry	Sorry	It is well	Sleep	2018-09-17 18:52:19.72341	2018-09-17 18:52:19.72341	\N	\N	\N	\N	\N	\N	\N	\N
101	351	322	323	Alright	Will be there	Ok	none	Eat healthy 	Come back later	2018-09-17 18:53:02.093677	2018-09-17 18:53:02.093677	\N	\N	\N	\N	\N	\N	\N	\N
102	358	322	323	Ok	Ok	Ok	Ok	Ok	Kn	2018-09-17 19:20:22.048421	2018-09-17 19:20:22.048421	\N	\N	\N	\N	\N	\N	\N	\N
103	362	322	323	done	noe	none	none	none	rest	2018-09-18 18:34:55.547146	2018-09-18 18:34:55.547146	\N	\N	\N	\N	\N	\N	\N	\N
104	364	257	258	Djjdkdkd	Namdmmd	 Nmm	 Nmm	 Nmmk	2 wks 	2018-09-18 20:05:08.309357	2018-09-18 20:05:08.309357	\N	\N	\N	\N	\N	\N	\N	\N
105	217	257	258	Sdnnnssn	Mdnm	Ijjn	 Nbmm	 Nmn	3 wks 	2018-09-18 20:05:30.838379	2018-09-18 20:05:30.838379	\N	\N	\N	\N	\N	\N	\N	\N
106	368	325	258	Headaches 	Have nwn habifnf 	Hpt	Urike test , fbc	Adomet 	2 wks 	2018-09-18 20:19:05.892655	2018-09-18 20:19:05.892655	\N	\N	\N	\N	\N	\N	\N	\N
107	367	325	258	Diarrhoes 	Cholera 	Colera	Stool test 	Iv fluids 	3wk	2018-09-18 20:20:34.342208	2018-09-18 20:20:34.342208	\N	\N	\N	\N	\N	\N	\N	\N
108	367	325	258	Seeeek	Kslll	Njkkl	Bjkkl	Jkll	2 wka 	2018-09-18 20:21:05.408815	2018-09-18 20:21:05.408815	\N	\N	\N	\N	\N	\N	\N	\N
109	229	262	264	hello	none	none	none	none	none	2018-09-19 12:03:58.444255	2018-09-19 12:03:58.444255	\N	\N	\N	\N	\N	\N	\N	\N
110	370	322	323	Stress	has stress	sleep	call	rest	call	2018-09-19 15:38:19.475513	2018-09-19 15:38:19.475513	\N	\N	\N	\N	\N	\N	\N	\N
111	371	322	323	none	none	none	none	none	noen	2018-09-19 17:39:56.203341	2018-09-19 17:39:56.203341	\N	\N	\N	\N	\N	\N	\N	\N
112	380	322	323	Fine	Fine	Fine	Fine	Fine	Fine	2018-09-20 12:31:10.733634	2018-09-20 12:31:10.733634	\N	\N	\N	\N	\N	\N	\N	\N
113	382	322	323	Okay	Okay	Okay	Okay	Okay	Okay	2018-09-20 12:32:57.375137	2018-09-20 12:32:57.375137	\N	\N	\N	\N	\N	\N	\N	\N
114	383	322	323	Ok	Okay	Alright	Ok	Ok	Ok	2018-09-20 13:41:59.051108	2018-09-20 13:41:59.051108	\N	\N	\N	\N	\N	\N	\N	\N
115	390	325	258	Bug head 	Bp low 	Anencephaly	Cbc	Paracetamol 	2week 	2018-09-25 06:17:38.542641	2018-09-25 06:17:38.542641	\N	\N	\N	\N	\N	\N	\N	\N
116	391	325	258	Hwadcount	Bp - 120, / 60 temp 34	Drowning 	Urine re	Cepshalixwn 	1 week 	2018-09-25 06:25:50.910102	2018-09-25 06:25:50.910102	\N	\N	\N	\N	\N	\N	\N	\N
117	392	325	258	Home vote 	Fjdkld	Dkdkkkd	Knee	Roopl	Dnsklsks	2018-09-25 06:28:41.958969	2018-09-25 06:28:41.958969	\N	\N	\N	\N	\N	\N	\N	\N
118	421	257	258	Hjjj	Nkkkk	Bjhjj	Bmnnm	Bnnn	1 wks 	2018-09-30 12:20:27.434342	2018-09-30 12:20:27.434342	\N	\N	\N	\N	\N	\N	\N	\N
119	419	257	258	De	Ddd	Ddd	Dxx	Dxxx	Ffff	2018-09-30 12:20:54.22788	2018-09-30 12:20:54.22788	\N	\N	\N	\N	\N	\N	\N	\N
120	420	257	258	Sssss	Dxxx	Xxxx	Fffff	Fffff	Fffff	2018-09-30 12:21:27.907743	2018-09-30 12:21:27.907743	\N	\N	\N	\N	\N	\N	\N	\N
124	381	322	323	Headache	Headache	Rest	none	Paracetamol	Call	2018-10-10 21:11:15.411045	2018-10-10 21:11:15.411045	\N	\N	\N	\N	\N	\N	\N	\N
126	360	322	323	Tiredness and stress	Tiredness and stress	rest	sleep	More Sleep	sleep	2018-10-10 21:30:52.465229	2018-10-10 21:30:52.465229	\N	\N	\N	\N	\N	\N	\N	\N
127	647	257	258	Shsjssj	Ssnskdnsm	Sendsnj	Sndndn	Dndndj	Enjkjj	2018-11-29 11:46:36.459739	2018-11-29 11:46:36.459739	\N	\N	\N	\N	\N	\N	\N	\N
128	649	257	258	Dkdkdk	Ddnf	Dndmdkfkddnmfkfk	Dndfkk	Djjdjfkfk	Dhjdkfkfk	2018-11-29 11:51:53.94465	2018-11-29 11:51:53.94465	\N	\N	\N	\N	\N	\N	\N	\N
129	648	257	258	Skdkkdk	Hsndjjd	Djdjjddkdjdkd	Ernnrrkk	Rjejrk	Djjjjkf	2018-11-29 11:59:29.459885	2018-11-29 11:59:29.459885	\N	\N	\N	\N	\N	\N	\N	\N
130	876	322	349	Checkup	doesn't rest.	rest	none	none	none	2019-01-24 12:20:15.764711	2019-01-24 12:20:15.764711	\N	\N	\N	\N	\N	\N	\N	\N
131	880	322	354	Okay	Okay	Okay	None	No	No	2019-01-25 17:29:21.360698	2019-01-25 17:29:21.360698	\N	\N	\N	\N	\N	\N	\N	\N
132	882	322	354	Hu	Hi	Hi	Hi	Hi	Hi	2019-01-25 18:59:06.495501	2019-01-25 18:59:06.495501	\N	\N	\N	\N	\N	\N	\N	\N
133	885	322	354	Hi	Hi	Hi	Hi	Hi	Hi	2019-01-28 13:57:15.791984	2019-01-28 13:57:15.791984	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: patient_med_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.patient_med_records_id_seq', 133, true);


--
-- Data for Name: payment_reqs; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.payment_reqs (id, billing_info_id, amount, reference, exttrid, mobile_number, nw, callback_url, created_at, updated_at, trans_type) FROM stdin;
1	53	104.00	GHINGER-MEDICATION	152646737292	541840988	MTN	http://10.105.85.78:6099/callback_resp	2018-11-28 10:56:15.317861	2018-11-28 10:56:15.317861	DR
2	72	40.00	GHINGER-MEDICATION	120886796487	248021199	MTN	http://10.105.85.78:6099/callback_resp	2018-11-28 16:52:12.140936	2018-11-28 16:52:12.140936	DR
3	74	0.10	GHINGER-MEDICATION	074682182533	56296012.	MTN	http://10.105.85.78:6099/callback_resp	2018-11-28 17:09:07.520576	2018-11-28 17:09:07.520576	DR
4	74	0.10	GHINGER-MEDICATION	314496783171	556296012	MTN	http://10.105.85.78:6099/callback_resp	2018-11-28 17:13:31.502625	2018-11-28 17:13:31.502625	DR
5	72	40.00	GHINGER-MEDICATION	197972674695	247523760	MTN	http://10.105.85.78:6099/callback_resp	2018-11-30 16:05:19.849777	2018-11-30 16:05:19.849777	DR
6	68	20.00	GHINGER-LAB	192715370677	247523760	MTN	http://10.105.85.78:6099/callback_resp	2018-11-30 16:15:19.323865	2018-11-30 16:15:19.323865	DR
7	68	20.00	GHINGER-LAB	092625793430	247523760	MTN	http://10.105.85.78:6099/callback_resp	2018-11-30 16:30:09.31476	2018-11-30 16:30:09.31476	DR
8	72	40.00	GHINGER-MEDICATION	078766095098	248021199	MTN	http://10.105.85.78:6099/callback_resp	2018-11-30 17:03:07.928074	2018-11-30 17:03:07.928074	DR
9	39	50.00	GHINGER-VIDEO_CONSULT	401928957598	f	MTN	http://10.105.85.78:6099/callback_resp	2018-12-01 13:17:40.245985	2018-12-01 13:17:40.245985	DR
10	79	500.55	GHINGER-PHONE_CONSULT	231363590838	f	MTN	http://10.105.85.78:6099/callback_resp	2018-12-03 01:07:23.191858	2018-12-03 01:07:23.191858	DR
11	50	135.00	GHINGER-PD_VIDEO_CONSULT	294399576388	400000993	VOD	http://10.105.85.78:6099/callback_resp	2018-12-03 01:20:29.492889	2018-12-03 01:20:29.492889	DR
12	83	450.50	GHINGER-LAB	276869008876	f	MTN	http://10.105.85.78:6099/callback_resp	2018-12-03 01:36:27.739092	2018-12-03 01:36:27.739092	DR
13	86	2.00	GHINGER-MEDICATION	239329749547	248021199	MTN	http://10.105.85.78:6099/callback_resp	2018-12-03 13:36:23.984475	2018-12-03 13:36:23.984475	DR
14	86	2.00	GHINGER-MEDICATION	341053199749	541840988	MTN	http://10.105.85.78:6099/callback_resp	2018-12-05 17:25:34.15774	2018-12-05 17:25:34.15774	DR
15	86	2.00	GHINGER-MEDICATION	503749593329	541840988	MTN	http://10.105.85.78:6099/callback_resp	2018-12-05 17:25:50.426122	2018-12-05 17:25:50.426122	DR
16	86	2.00	GHINGER-MEDICATION	263239251123	541840988	MTN	http://10.105.85.78:6099/callback_resp	2018-12-05 17:28:26.376339	2018-12-05 17:28:26.376339	DR
17	69	55.09	GHINGER-LAB	094804391084	541840988	MTN	http://10.105.85.78:6099/callback_resp	2018-12-06 14:46:09.53209	2018-12-06 14:46:09.53209	DR
18	57	250.00	GHINGER-PHONE_CONSULT	488232157293	541840988	MTN	http://10.105.85.78:6099/callback_resp	2018-12-06 17:55:48.875685	2018-12-06 17:55:48.875685	DR
19	68	20.00	GHINGER-LAB	424304973342	541840988	MTN	http://10.105.85.78:6099/callback_resp	2018-12-11 14:57:42.485984	2018-12-11 14:57:42.485984	DR
20	105	40.00	GHINGER-MEDICATION	074551916534	248021199	MTN	http://10.105.85.78:6099/callback_resp	2018-12-11 18:36:07.508368	2018-12-11 18:36:07.508368	DR
21	122	0.10	GHINGER-MEDICATION	479432858447	248021199	MTN	http://10.105.85.78:6099/callback_resp	2018-12-13 12:23:48.027867	2018-12-13 12:23:48.027867	DR
22	141	40.00	GHINGER-MEDICATION	303197616449	264620508	AIR	http://10.105.85.78:6099/callback_resp	2018-12-13 14:33:30.371683	2018-12-13 14:33:30.371683	DR
23	158	55.09	GHINGER-LAB	344251237312	205869653	VOD	http://10.105.85.78:6099/callback_resp	2018-12-14 12:22:34.476318	2018-12-14 12:22:34.476318	DR
24	161	55.09	GHINGER-LAB	173903833455	209210765	TIG	http://10.105.85.78:6099/callback_resp	2018-12-14 18:03:17.442801	2018-12-14 18:03:17.442801	DR
25	161	55.09	GHINGER-LAB	074474535141	209219233	TIG	http://10.105.85.78:6099/callback_resp	2018-12-14 18:06:07.499067	2018-12-14 18:06:07.499067	DR
26	161	55.09	GHINGER-LAB	212316405934	243569287	TIG	http://10.105.85.78:6099/callback_resp	2018-12-14 18:08:21.287118	2018-12-14 18:08:21.287118	DR
27	161	55.09	GHINGER-LAB	344779451233	243568822	MTN	http://10.105.85.78:6099/callback_resp	2018-12-14 18:09:34.529499	2018-12-14 18:09:34.529499	DR
28	149	30.00	GHINGER-MEDICATION	300884669594	208210765	MTN	http://10.105.85.78:6099/callback_resp	2018-12-15 06:55:30.141441	2018-12-15 06:55:30.141441	DR
29	149	30.00	GHINGER-MEDICATION	297029108901	207619765	TIG	http://10.105.85.78:6099/callback_resp	2018-12-15 06:56:29.754318	2018-12-15 06:56:29.754318	DR
30	165	75.00	GHINGER-LAB	246731930956	209432876	AIR	http://10.105.85.78:6099/callback_resp	2018-12-15 07:15:24.724313	2018-12-15 07:15:24.724313	DR
31	200	42.00	GHINGER-MEDICATION	390565203494	209210765	MTN	http://10.105.85.78:6099/callback_resp	2018-12-15 10:09:39.108236	2018-12-15 10:09:39.108236	DR
32	215	185.00	GHINGER-LAB	415003866353	244987432	MTN	http://10.105.85.78:6099/callback_resp	2018-12-15 10:45:41.552386	2018-12-15 10:45:41.552386	DR
33	216	250.00	GHINGER-PHONE_CONSULT	466224341119	209876432	MTN	http://10.105.85.78:6099/callback_resp	2018-12-15 11:06:46.674147	2018-12-15 11:06:46.674147	DR
34	217	0.10	GHINGER-MEDICATION	387887442492	205868653	VOD	http://10.105.85.78:6099/callback_resp	2018-12-18 09:47:38.843619	2018-12-18 09:47:38.843619	DR
35	217	0.10	GHINGER-MEDICATION	027183278070	205869653	VOD	http://10.105.85.78:6099/callback_resp	2018-12-18 10:02:02.769222	2018-12-18 10:02:02.769222	DR
36	216	250.00	GHINGER-PHONE_CONSULT	536811595604	209210765	MTN	http://10.105.85.78:6099/callback_resp	2018-12-18 10:17:53.734568	2018-12-18 10:17:53.734568	DR
37	298	225.00	GHINGER-LAB	251671390879	266163879	AIR	http://10.105.85.78:6099/callback_resp	2018-12-21 19:25:25.221188	2018-12-21 19:25:25.221188	DR
38	219	52.25	GHINGER-MEDICATION	506594000574	209543975	MTN	http://10.105.85.78:6099/callback_resp	2018-12-22 10:31:50.711769	2018-12-22 10:31:50.711769	DR
39	219	52.25	GHINGER-MEDICATION	251978628704	209432987	AIR	http://10.105.85.78:6099/callback_resp	2018-12-22 10:32:25.251193	2018-12-22 10:32:25.251193	DR
40	215	185.00	GHINGER-LAB	092417280740	209321580	MTN	http://10.105.85.78:6099/callback_resp	2018-12-22 10:43:09.293408	2018-12-22 10:43:09.293408	DR
41	55	30.00	GHINGER-MEDICATION	336166003241	541840988	MTN	http://10.105.85.78:6099/callback_resp	2019-01-02 13:11:33.670528	2019-01-02 13:11:33.670528	DR
42	301	225.00	GHINGER-LAB	481149967267	541840988	MTN	http://10.105.85.78:6099/callback_resp	2019-01-02 13:12:48.166647	2019-01-02 13:12:48.166647	DR
43	304	0.30	GHINGER-MEDICATION	544094707994	264620508	AIR	http://10.105.85.78:6099/callback_resp	2019-01-02 14:56:54.462583	2019-01-02 14:56:54.462583	DR
44	305	0.10	GHINGER-LAB	272203369851	205869653	VOD	http://10.105.85.78:6099/callback_resp	2019-01-02 15:29:27.271559	2019-01-02 15:29:27.271559	DR
45	121	0.10	GHINGER-MEDICATION	560314362369	541840988	MTN	http://10.105.85.78:6099/callback_resp	2019-01-02 16:51:56.083064	2019-01-02 16:51:56.083064	DR
46	105	40.00	GHINGER-MEDICATION	116858163806	541840988	MTN	http://10.105.85.78:6099/callback_resp	2019-01-02 16:58:11.74054	2019-01-02 16:58:11.74054	DR
47	309	0.30	GHINGER-MEDICATION	361299578385	264620508	AIR	http://10.105.85.78:6099/callback_resp	2019-01-02 18:22:36.180697	2019-01-02 18:22:36.180697	DR
48	310	0.30	GHINGER-MEDICATION	067696331377	264620508	AIR	http://10.105.85.78:6099/callback_resp	2019-01-03 11:06:06.820801	2019-01-03 11:06:06.820801	DR
49	336	0.10	GHINGER-HOMECARE	183775955632	264620508	AIR	http://10.105.85.78:6099/callback_resp	2019-01-24 11:57:18.434244	2019-01-24 11:57:18.434244	DR
50	337	0.10	GHINGER-HOMECARE	300848369083	264620508	AIR	http://10.105.85.78:6099/callback_resp	2019-01-24 12:08:30.136956	2019-01-24 12:08:30.136956	DR
51	340	0.10	GHINGER-HOMECARE	570459156900	556296012	MTN	http://10.105.85.78:6099/callback_resp	2019-01-25 17:18:57.099537	2019-01-25 17:18:57.099537	DR
52	341	0.10	GHINGER-HOMECARE	195403842955	556296012	MTN	http://10.105.85.78:6099/callback_resp	2019-01-25 17:25:19.592362	2019-01-25 17:25:19.592362	DR
53	343	0.10	GHINGER-HOMECARE	264035977192	556296012	MTN	http://10.105.85.78:6099/callback_resp	2019-01-25 18:51:26.455515	2019-01-25 18:51:26.455515	DR
54	346	0.10	GHINGER-HOMECARE	268657309351	556296012	MTN	http://10.105.85.78:6099/callback_resp	2019-01-25 19:29:26.920404	2019-01-25 19:29:26.920404	DR
\.


--
-- Name: payment_reqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.payment_reqs_id_seq', 54, true);


--
-- Data for Name: pds_patient_prev_med_histories; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.pds_patient_prev_med_histories (id, confirmed_pds_id, prev_med_histry, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
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
21	36	None	158	t	f	2018-06-14 13:08:41.765424	2018-06-14 13:08:41.765424
22	37	None	135	t	f	2018-06-16 00:43:46.675686	2018-06-16 00:43:46.675686
23	38	<p>HTN</p>	145	t	f	2018-06-19 17:55:25.576183	2018-06-19 17:55:25.576183
24	39	Diabetic 	145	t	f	2018-06-20 11:13:07.759022	2018-06-20 11:13:07.759022
25	40	Diabetic	135	t	f	2018-07-22 22:13:35.921463	2018-07-22 22:13:35.921463
26	41	None	135	t	f	2018-07-22 22:31:43.0362	2018-07-22 22:31:43.0362
27	42	None	135	t	f	2018-07-22 22:31:45.162842	2018-07-22 22:31:45.162842
28	43	None	158	t	f	2018-07-23 17:52:18.535492	2018-07-23 17:52:18.535492
29	44		36	t	f	2018-08-07 23:02:29.025208	2018-08-07 23:02:29.025208
30	45	Love	158	t	f	2018-08-08 15:07:11.872358	2018-08-08 15:07:11.872358
31	46	Diabetes	158	t	f	2018-08-09 12:46:31.739642	2018-08-09 12:46:31.739642
32	47	Diab	158	t	f	2018-08-09 19:25:21.929431	2018-08-09 19:25:21.929431
\.


--
-- Name: pds_patient_prev_med_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.pds_patient_prev_med_histories_id_seq', 32, true);


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.permissions (id, subject_class, action, name, description, created_at, updated_at) FROM stdin;
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
640	DrugMaster	update	create and update	\N	2018-12-19 11:40:44.586718	2018-12-19 11:40:44.586718
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
580	MeasureUnit	manage	manage	\N	2018-12-19 11:40:43.94458	2018-12-19 11:40:43.94458
581	MeasureUnit	create	create and update	\N	2018-12-19 11:40:44.05135	2018-12-19 11:40:44.05135
582	MeasureUnit	index	list	\N	2018-12-19 11:40:44.053639	2018-12-19 11:40:44.053639
583	MeasureUnit	update	create and update	\N	2018-12-19 11:40:44.055861	2018-12-19 11:40:44.055861
584	MeasureUnit	show	show	\N	2018-12-19 11:40:44.058796	2018-12-19 11:40:44.058796
585	MeasureUnit	destroy	delete	\N	2018-12-19 11:40:44.061643	2018-12-19 11:40:44.061643
586	MeasureUnit	all_unit_excel	all_unit_excel	\N	2018-12-19 11:40:44.063849	2018-12-19 11:40:44.063849
587	MeasureUnit	enable_unit	enable_unit	\N	2018-12-19 11:40:44.065957	2018-12-19 11:40:44.065957
588	MeasureUnit	disable_unit	disable_unit	\N	2018-12-19 11:40:44.068097	2018-12-19 11:40:44.068097
589	MeasureUnit	warning	warning	\N	2018-12-19 11:40:44.070274	2018-12-19 11:40:44.070274
590	MeasureUnit	info	info	\N	2018-12-19 11:40:44.072383	2018-12-19 11:40:44.072383
591	MeasureUnit	success	success	\N	2018-12-19 11:40:44.074473	2018-12-19 11:40:44.074473
592	MeasureUnit	danger	danger	\N	2018-12-19 11:40:44.076569	2018-12-19 11:40:44.076569
593	BillingInfoBillItem	manage	manage	\N	2018-12-19 11:40:44.184456	2018-12-19 11:40:44.184456
594	BillingInfoBillItem	create	create and update	\N	2018-12-19 11:40:44.189176	2018-12-19 11:40:44.189176
595	BillingInfoBillItem	index	list	\N	2018-12-19 11:40:44.191324	2018-12-19 11:40:44.191324
596	BillingInfoBillItem	update	create and update	\N	2018-12-19 11:40:44.193443	2018-12-19 11:40:44.193443
597	BillingInfoBillItem	show	show	\N	2018-12-19 11:40:44.196233	2018-12-19 11:40:44.196233
598	BillingInfoBillItem	destroy	delete	\N	2018-12-19 11:40:44.198999	2018-12-19 11:40:44.198999
599	BillingInfoBillItem	warning	warning	\N	2018-12-19 11:40:44.201052	2018-12-19 11:40:44.201052
600	BillingInfoBillItem	info	info	\N	2018-12-19 11:40:44.203093	2018-12-19 11:40:44.203093
601	BillingInfoBillItem	success	success	\N	2018-12-19 11:40:44.205153	2018-12-19 11:40:44.205153
602	BillingInfoBillItem	danger	danger	\N	2018-12-19 11:40:44.207202	2018-12-19 11:40:44.207202
603	Referal	processed_index	processed_index	\N	2018-12-19 11:40:44.427505	2018-12-19 11:40:44.427505
604	Referal	update_processed_status	update_processed_status	\N	2018-12-19 11:40:44.431778	2018-12-19 11:40:44.431778
605	PreConfirmedAppointment	manage	manage	\N	2018-12-19 11:40:44.441861	2018-12-19 11:40:44.441861
606	PreConfirmedAppointment	create	create and update	\N	2018-12-19 11:40:44.446483	2018-12-19 11:40:44.446483
607	PreConfirmedAppointment	index	list	\N	2018-12-19 11:40:44.448531	2018-12-19 11:40:44.448531
608	PreConfirmedAppointment	update	create and update	\N	2018-12-19 11:40:44.45058	2018-12-19 11:40:44.45058
609	PreConfirmedAppointment	show	show	\N	2018-12-19 11:40:44.453369	2018-12-19 11:40:44.453369
610	PreConfirmedAppointment	destroy	delete	\N	2018-12-19 11:40:44.456081	2018-12-19 11:40:44.456081
611	PreConfirmedAppointment	pre_confirmed_appointment_details	pre_confirmed_appointment_details	\N	2018-12-19 11:40:44.458141	2018-12-19 11:40:44.458141
612	PreConfirmedAppointment	doctor_awaiting_appointments	doctor_awaiting_appointments	\N	2018-12-19 11:40:44.460159	2018-12-19 11:40:44.460159
613	PreConfirmedAppointment	doctor_accept_gen_appt	doctor_accept_gen_appt	\N	2018-12-19 11:40:44.462284	2018-12-19 11:40:44.462284
614	PreConfirmedAppointment	doctor_accept_pds_appt	doctor_accept_pds_appt	\N	2018-12-19 11:40:44.464492	2018-12-19 11:40:44.464492
615	PreConfirmedAppointment	doctor_decline_gen_appt	doctor_decline_gen_appt	\N	2018-12-19 11:40:44.466685	2018-12-19 11:40:44.466685
616	PreConfirmedAppointment	doctor_decline_pds_appt	doctor_decline_pds_appt	\N	2018-12-19 11:40:44.468753	2018-12-19 11:40:44.468753
617	PreConfirmedAppointment	create_gen_decline_comment	create_gen_decline_comment	\N	2018-12-19 11:40:44.470891	2018-12-19 11:40:44.470891
618	PreConfirmedAppointment	create_pds_decline_comment	create_pds_decline_comment	\N	2018-12-19 11:40:44.477427	2018-12-19 11:40:44.477427
619	PreConfirmedAppointment	decline_note	decline_note	\N	2018-12-19 11:40:44.47949	2018-12-19 11:40:44.47949
620	PreConfirmedAppointment	find_doc_nurse	find_doc_nurse	\N	2018-12-19 11:40:44.481566	2018-12-19 11:40:44.481566
621	PreConfirmedAppointment	enable_pre_confirmed_appointment	enable_pre_confirmed_appointment	\N	2018-12-19 11:40:44.483596	2018-12-19 11:40:44.483596
622	PreConfirmedAppointment	disable_pre_confirmed_appointment	disable_pre_confirmed_appointment	\N	2018-12-19 11:40:44.485679	2018-12-19 11:40:44.485679
623	PreConfirmedAppointment	warning	warning	\N	2018-12-19 11:40:44.487686	2018-12-19 11:40:44.487686
624	PreConfirmedAppointment	info	info	\N	2018-12-19 11:40:44.489652	2018-12-19 11:40:44.489652
625	PreConfirmedAppointment	success	success	\N	2018-12-19 11:40:44.491581	2018-12-19 11:40:44.491581
626	PreConfirmedAppointment	danger	danger	\N	2018-12-19 11:40:44.493575	2018-12-19 11:40:44.493575
627	DeclineComment	manage	manage	\N	2018-12-19 11:40:44.534799	2018-12-19 11:40:44.534799
628	DeclineComment	create	create and update	\N	2018-12-19 11:40:44.539417	2018-12-19 11:40:44.539417
629	DeclineComment	index	list	\N	2018-12-19 11:40:44.541622	2018-12-19 11:40:44.541622
630	DeclineComment	update	create and update	\N	2018-12-19 11:40:44.543805	2018-12-19 11:40:44.543805
631	DeclineComment	show	show	\N	2018-12-19 11:40:44.546656	2018-12-19 11:40:44.546656
632	DeclineComment	destroy	delete	\N	2018-12-19 11:40:44.549504	2018-12-19 11:40:44.549504
633	DeclineComment	warning	warning	\N	2018-12-19 11:40:44.5516	2018-12-19 11:40:44.5516
634	DeclineComment	info	info	\N	2018-12-19 11:40:44.553662	2018-12-19 11:40:44.553662
635	DeclineComment	success	success	\N	2018-12-19 11:40:44.555665	2018-12-19 11:40:44.555665
636	DeclineComment	danger	danger	\N	2018-12-19 11:40:44.557672	2018-12-19 11:40:44.557672
637	DrugMaster	manage	manage	\N	2018-12-19 11:40:44.578113	2018-12-19 11:40:44.578113
638	DrugMaster	create	create and update	\N	2018-12-19 11:40:44.582613	2018-12-19 11:40:44.582613
639	DrugMaster	index	list	\N	2018-12-19 11:40:44.584719	2018-12-19 11:40:44.584719
641	DrugMaster	show	show	\N	2018-12-19 11:40:44.589858	2018-12-19 11:40:44.589858
642	DrugMaster	destroy	delete	\N	2018-12-19 11:40:44.592638	2018-12-19 11:40:44.592638
643	DrugMaster	all_drug_excel	all_drug_excel	\N	2018-12-19 11:40:44.594695	2018-12-19 11:40:44.594695
644	DrugMaster	enable_drug	enable_drug	\N	2018-12-19 11:40:44.596696	2018-12-19 11:40:44.596696
645	DrugMaster	disable_drug	disable_drug	\N	2018-12-19 11:40:44.598697	2018-12-19 11:40:44.598697
646	DrugMaster	warning	warning	\N	2018-12-19 11:40:44.600686	2018-12-19 11:40:44.600686
647	DrugMaster	info	info	\N	2018-12-19 11:40:44.602622	2018-12-19 11:40:44.602622
648	DrugMaster	success	success	\N	2018-12-19 11:40:44.604678	2018-12-19 11:40:44.604678
649	DrugMaster	danger	danger	\N	2018-12-19 11:40:44.60673	2018-12-19 11:40:44.60673
650	DrugPrice	manage	manage	\N	2018-12-19 11:40:44.610578	2018-12-19 11:40:44.610578
651	DrugPrice	create	create and update	\N	2018-12-19 11:40:44.614887	2018-12-19 11:40:44.614887
652	DrugPrice	index	list	\N	2018-12-19 11:40:44.616943	2018-12-19 11:40:44.616943
653	DrugPrice	update	create and update	\N	2018-12-19 11:40:44.619039	2018-12-19 11:40:44.619039
654	DrugPrice	show	show	\N	2018-12-19 11:40:44.621775	2018-12-19 11:40:44.621775
655	DrugPrice	destroy	delete	\N	2018-12-19 11:40:44.62448	2018-12-19 11:40:44.62448
656	DrugPrice	warning	warning	\N	2018-12-19 11:40:44.626517	2018-12-19 11:40:44.626517
657	DrugPrice	info	info	\N	2018-12-19 11:40:44.628548	2018-12-19 11:40:44.628548
658	DrugPrice	success	success	\N	2018-12-19 11:40:44.630594	2018-12-19 11:40:44.630594
659	DrugPrice	danger	danger	\N	2018-12-19 11:40:44.632645	2018-12-19 11:40:44.632645
660	ConfirmedAppointment	doctor_general_appointments	doctor_general_appointments	\N	2018-12-19 11:40:44.707434	2018-12-19 11:40:44.707434
661	ConfirmedAppointment	doctor_pds_appointments	doctor_pds_appointments	\N	2018-12-19 11:40:44.70973	2018-12-19 11:40:44.70973
662	PatientBillingInfo	manage	manage	\N	2018-12-19 11:40:44.718808	2018-12-19 11:40:44.718808
663	PatientBillingInfo	create	create and update	\N	2018-12-19 11:40:44.723527	2018-12-19 11:40:44.723527
664	PatientBillingInfo	index	list	\N	2018-12-19 11:40:44.7257	2018-12-19 11:40:44.7257
665	PatientBillingInfo	update	create and update	\N	2018-12-19 11:40:44.727772	2018-12-19 11:40:44.727772
666	PatientBillingInfo	show	show	\N	2018-12-19 11:40:44.730614	2018-12-19 11:40:44.730614
667	PatientBillingInfo	destroy	delete	\N	2018-12-19 11:40:44.733436	2018-12-19 11:40:44.733436
668	PatientBillingInfo	bill_info	bill_info	\N	2018-12-19 11:40:44.735539	2018-12-19 11:40:44.735539
669	PatientBillingInfo	warning	warning	\N	2018-12-19 11:40:44.737637	2018-12-19 11:40:44.737637
670	PatientBillingInfo	info	info	\N	2018-12-19 11:40:44.739726	2018-12-19 11:40:44.739726
671	PatientBillingInfo	success	success	\N	2018-12-19 11:40:44.741846	2018-12-19 11:40:44.741846
672	PatientBillingInfo	danger	danger	\N	2018-12-19 11:40:44.743948	2018-12-19 11:40:44.743948
673	PatientMedRecord	view_patient_med_record	view_patient_med_record	\N	2018-12-19 11:40:44.85774	2018-12-19 11:40:44.85774
674	PatientMedRecord	attend_to_patient_med_record	attend_to_patient_med_record	\N	2018-12-19 11:40:44.860004	2018-12-19 11:40:44.860004
675	PatientMedRecord	create_patient_med_record	create_patient_med_record	\N	2018-12-19 11:40:44.862043	2018-12-19 11:40:44.862043
676	ServiceFeeMaster	manage	manage	\N	2018-12-19 11:40:44.90551	2018-12-19 11:40:44.90551
677	ServiceFeeMaster	create	create and update	\N	2018-12-19 11:40:44.910024	2018-12-19 11:40:44.910024
678	ServiceFeeMaster	index	list	\N	2018-12-19 11:40:44.912139	2018-12-19 11:40:44.912139
679	ServiceFeeMaster	update	create and update	\N	2018-12-19 11:40:44.914195	2018-12-19 11:40:44.914195
680	ServiceFeeMaster	show	show	\N	2018-12-19 11:40:44.916922	2018-12-19 11:40:44.916922
681	ServiceFeeMaster	destroy	delete	\N	2018-12-19 11:40:44.919735	2018-12-19 11:40:44.919735
682	ServiceFeeMaster	all_price_excel	all_price_excel	\N	2018-12-19 11:40:44.921787	2018-12-19 11:40:44.921787
683	ServiceFeeMaster	enable_price	enable_price	\N	2018-12-19 11:40:44.923816	2018-12-19 11:40:44.923816
684	ServiceFeeMaster	disable_price	disable_price	\N	2018-12-19 11:40:44.925927	2018-12-19 11:40:44.925927
685	ServiceFeeMaster	warning	warning	\N	2018-12-19 11:40:44.928053	2018-12-19 11:40:44.928053
686	ServiceFeeMaster	info	info	\N	2018-12-19 11:40:44.930189	2018-12-19 11:40:44.930189
687	ServiceFeeMaster	success	success	\N	2018-12-19 11:40:44.932289	2018-12-19 11:40:44.932289
688	ServiceFeeMaster	danger	danger	\N	2018-12-19 11:40:44.934378	2018-12-19 11:40:44.934378
689	MedicationDetail	manage	manage	\N	2018-12-19 11:40:44.937854	2018-12-19 11:40:44.937854
690	MedicationDetail	create	create and update	\N	2018-12-19 11:40:44.942385	2018-12-19 11:40:44.942385
691	MedicationDetail	index	list	\N	2018-12-19 11:40:44.944498	2018-12-19 11:40:44.944498
692	MedicationDetail	update	create and update	\N	2018-12-19 11:40:44.946648	2018-12-19 11:40:44.946648
693	MedicationDetail	show	show	\N	2018-12-19 11:40:44.949469	2018-12-19 11:40:44.949469
694	MedicationDetail	destroy	delete	\N	2018-12-19 11:40:44.952273	2018-12-19 11:40:44.952273
695	MedicationDetail	find_med_details	find_med_details	\N	2018-12-19 11:40:44.954398	2018-12-19 11:40:44.954398
696	MedicationDetail	warning	warning	\N	2018-12-19 11:40:44.95653	2018-12-19 11:40:44.95653
697	MedicationDetail	info	info	\N	2018-12-19 11:40:44.958634	2018-12-19 11:40:44.958634
698	MedicationDetail	success	success	\N	2018-12-19 11:40:44.960689	2018-12-19 11:40:44.960689
699	MedicationDetail	danger	danger	\N	2018-12-19 11:40:44.9627	2018-12-19 11:40:44.9627
700	PrePaymentReq	manage	manage	\N	2018-12-19 11:40:44.977643	2018-12-19 11:40:44.977643
701	PrePaymentReq	create	create and update	\N	2018-12-19 11:40:44.982233	2018-12-19 11:40:44.982233
702	PrePaymentReq	index	list	\N	2018-12-19 11:40:44.984403	2018-12-19 11:40:44.984403
703	PrePaymentReq	update	create and update	\N	2018-12-19 11:40:44.986501	2018-12-19 11:40:44.986501
704	PrePaymentReq	show	show	\N	2018-12-19 11:40:44.989299	2018-12-19 11:40:44.989299
705	PrePaymentReq	destroy	delete	\N	2018-12-19 11:40:44.992026	2018-12-19 11:40:44.992026
706	PrePaymentReq	warning	warning	\N	2018-12-19 11:40:44.994163	2018-12-19 11:40:44.994163
707	PrePaymentReq	info	info	\N	2018-12-19 11:40:44.996247	2018-12-19 11:40:44.996247
708	PrePaymentReq	success	success	\N	2018-12-19 11:40:44.998406	2018-12-19 11:40:44.998406
709	PrePaymentReq	danger	danger	\N	2018-12-19 11:40:45.000663	2018-12-19 11:40:45.000663
710	PaymentReq	manage	manage	\N	2018-12-19 11:40:45.005894	2018-12-19 11:40:45.005894
711	PaymentReq	create	create and update	\N	2018-12-19 11:40:45.01454	2018-12-19 11:40:45.01454
712	PaymentReq	index	list	\N	2018-12-19 11:40:45.016648	2018-12-19 11:40:45.016648
713	PaymentReq	update	create and update	\N	2018-12-19 11:40:45.018733	2018-12-19 11:40:45.018733
714	PaymentReq	show	show	\N	2018-12-19 11:40:45.021448	2018-12-19 11:40:45.021448
715	PaymentReq	destroy	delete	\N	2018-12-19 11:40:45.024103	2018-12-19 11:40:45.024103
716	PaymentReq	warning	warning	\N	2018-12-19 11:40:45.026151	2018-12-19 11:40:45.026151
717	PaymentReq	info	info	\N	2018-12-19 11:40:45.02823	2018-12-19 11:40:45.02823
718	PaymentReq	success	success	\N	2018-12-19 11:40:45.030292	2018-12-19 11:40:45.030292
719	PaymentReq	danger	danger	\N	2018-12-19 11:40:45.032309	2018-12-19 11:40:45.032309
720	CallbackStatus	manage	manage	\N	2018-12-19 11:40:45.043719	2018-12-19 11:40:45.043719
721	CallbackStatus	create	create and update	\N	2018-12-19 11:40:45.048184	2018-12-19 11:40:45.048184
722	CallbackStatus	index	list	\N	2018-12-19 11:40:45.050325	2018-12-19 11:40:45.050325
723	CallbackStatus	update	create and update	\N	2018-12-19 11:40:45.052417	2018-12-19 11:40:45.052417
724	CallbackStatus	show	show	\N	2018-12-19 11:40:45.055165	2018-12-19 11:40:45.055165
725	CallbackStatus	destroy	delete	\N	2018-12-19 11:40:45.057888	2018-12-19 11:40:45.057888
726	CallbackStatus	warning	warning	\N	2018-12-19 11:40:45.059884	2018-12-19 11:40:45.059884
727	CallbackStatus	info	info	\N	2018-12-19 11:40:45.061929	2018-12-19 11:40:45.061929
728	CallbackStatus	success	success	\N	2018-12-19 11:40:45.064006	2018-12-19 11:40:45.064006
729	CallbackStatus	danger	danger	\N	2018-12-19 11:40:45.066122	2018-12-19 11:40:45.066122
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.permissions_id_seq', 729, true);


--
-- Data for Name: permissions_roles; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.permissions_roles (id, person_type_master_id, permission_id, created_at, updated_at, role_id) FROM stdin;
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

SELECT pg_catalog.setval('public.permissions_roles_id_seq', 4051, true);


--
-- Data for Name: person_contact_infos; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.person_contact_infos (id, person_id, contact_number, email, postal_address, location_address, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, suburb_id) FROM stdin;
297	299	0506075223	voda@gmail.com	\N	\N	\N	\N	\N	t	f	2018-09-04 11:23:03.52027	2018-09-04 11:26:01.011374	1
301	303	0264620508	co_excutie@yahoo.com				158	\N	t	f	2018-09-10 12:55:47.05652	2018-09-10 13:51:02.784343	1
305	307	0582000000	saf@gdsa.com	\N	\N	\N	\N	\N	t	f	2018-09-13 11:39:31.657674	2018-09-13 11:39:31.657674	1
134	135	0245667787	andy@gmail.com				36	\N	t	f	2018-04-12 12:09:33.290206	2018-04-12 12:09:33.290206	1
135	136	0248021199                                        	Clara@gmail.com				36	\N	t	f	2018-04-12 12:57:44.354646	2018-04-12 13:07:10.548494	1
137	138	0504899386                                        	andymistic37@gmail.com				36	\N	t	f	2018-04-12 13:21:38.580682	2018-04-12 13:21:38.580682	1
141	142	0558029911                                        	Mady@gmail.com	uo	uiop	u	135	\N	t	f	2018-04-13 17:20:38.714928	2018-04-13 17:20:38.714928	1
145	146	444444r                                           	kasakyi@hotmail.com 		ghananacademy 		145	\N	t	f	2018-04-18 22:27:18.962887	2018-04-18 22:27:18.962887	1
146	147	0265110090	oscar@gmail.com				36	\N	t	f	2018-04-18 22:28:30.575299	2018-04-18 22:28:30.575299	1
147	148	0265110098	oscar@gmail.com				36	\N	t	f	2018-04-18 22:32:33.101946	2018-04-18 22:32:33.101946	1
152	153	+233244444329                                     	ykusimensah@gmail.com			not 	145	\N	t	f	2018-04-20 07:06:36.012514	2018-04-20 07:06:36.012514	1
153	154	4444445                                           	G@apl.com				145	\N	t	f	2018-04-20 07:15:27.118947	2018-04-20 07:15:27.118947	1
154	155	44444444                                          	K@aol.com				145	\N	t	f	2018-04-20 07:55:53.373578	2018-04-20 07:55:53.373578	1
159	160	445567787                                         	g@gmail.com				145	\N	t	f	2018-04-21 05:43:48.286777	2018-04-21 05:43:48.286777	1
157	158	0543901100	cl@yahool.com				158	\N	t	f	2018-04-20 16:08:20.778676	2018-04-23 12:17:39.40606	1
162	163	0200000010                                        	Chale@gmail.com				135	\N	t	f	2018-04-24 17:46:21.211942	2018-04-24 17:46:21.211942	1
295	297	0541099988	pad3doc3@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-26 12:23:18.038922	2018-08-26 12:51:27.338225	1
173	174	0544110099	melody@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:38:25.594547	2018-04-25 11:38:25.594547	1
174	175	0544110090	melod1y@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:39:23.168851	2018-04-25 11:39:23.168851	1
180	181	0569001123	mena@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 09:57:17.332955	2018-04-27 09:57:17.332955	1
186	187	0269012209	tiery@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 17:42:25.280864	2018-04-27 17:42:25.280864	1
314	316	09876531523	ag@gdsa.com				36	\N	t	f	2018-09-14 11:22:03.904071	2018-09-17 12:04:11.962768	1
318	320	09043214342	dae@fdsa.com			\N	158	\N	t	f	2018-09-17 12:10:58.18464	2018-09-17 12:15:07.971416	1
190	191	024399010	joan@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-30 09:05:54.576527	2018-04-30 09:05:54.576527	1
322	324	09876545678	fdsat@gds.com	\N	\N	\N	\N	\N	t	f	2018-09-18 18:49:52.041654	2018-09-18 18:49:52.041654	1
140	141	0000000000	doc@gmail.com				135	\N	t	f	2018-04-13 17:06:54.567189	2018-04-13 17:06:54.567189	1
136	137	11110	pad@g.com				36	\N	t	f	2018-04-12 13:02:17.101252	2018-04-12 13:07:26.652698	1
266	267	11110	pad@g.com	\N	\N	\N	\N	\N	t	f	2018-08-06 14:42:44.395404	2018-08-26 12:19:28.262828	1
334	336	1234567	bbbb@b.com			\N	145	\N	t	f	2019-01-07 22:54:29.029517	2019-01-07 23:00:00.907957	4
335	337	0209210765	sam@gmail.com			\N	145	\N	t	f	2019-01-07 22:56:03.247044	2019-01-08 10:07:33.7719	1
339	341	0555762244	dela@gmail.com	\N	\N	\N	\N	\N	t	f	2019-01-09 14:46:38.288282	2019-01-09 14:46:38.288282	2
343	345	0233456234	testpharm@gmail.com	\N	\N	\N	\N	\N	t	f	2019-01-11 10:13:01.847299	2019-01-11 10:13:01.847299	\N
347	349	0541840988	padmorey@gmail.com			\N	158	\N	t	f	2019-01-15 09:55:45.400146	2019-01-15 10:22:10.787499	\N
349	351	0022001002	fdsa@afdsa.com	\N	\N	\N	\N	\N	t	f	2019-01-24 13:37:13.340921	2019-01-24 13:37:13.340921	\N
331	333	0243579781	claraaass@d.com	\N	\N	\N	\N	\N	t	f	2018-12-21 13:57:09.895823	2018-12-21 13:57:09.895823	1
352	354	0203443235	clara@appsnmobilesolutions.com			\N	158	\N	t	f	2019-01-25 16:22:02.475852	2019-01-25 16:37:02.875656	1
298	300	0245325698	greg34@gmail.com	\N	\N	\N	\N	\N	t	f	2018-09-05 15:20:11.463483	2018-09-05 15:20:11.463483	1
263	264	0264620500	pady@yahoo.com				158	\N	t	f	2018-07-23 17:00:01.735636	2018-07-23 17:20:08.205381	1
221	222	0269022431	zeal@gmail.com				222	\N	t	f	2018-05-05 12:01:30.532403	2018-05-05 12:21:06.660026	1
222	223	0248109980	zealous@yahoo.com				223	\N	t	f	2018-05-05 12:22:14.773575	2018-05-05 12:25:07.157471	1
244	245	0249013344	johnson@hotmail.com	\N	\N	\N	\N	\N	t	f	2018-05-18 16:02:18.720646	2018-05-18 16:02:18.720646	1
302	304	0201463899	mady1@gmail.com	\N	\N	\N	\N	\N	t	f	2018-09-10 13:08:58.370295	2018-09-10 13:08:58.370295	1
245	246	0249737027	padmorey@gmail.com				246	\N	t	f	2018-06-05 21:10:47.200072	2018-06-05 21:45:42.468623	1
144	145	0245667790	kobby@gmail.com				145	\N	t	f	2018-04-18 22:21:38.192679	2018-06-19 18:02:56.713451	1
256	257	55555577777	nyam@gmail.com	\N	\N	\N	\N	\N	t	f	2018-06-20 10:23:50.76189	2018-06-20 10:23:50.76189	1
257	258	88888844444	anas@gmail.com				145	\N	t	f	2018-06-20 10:27:57.308996	2018-06-20 11:04:54.06518	1
258	259	33344444	reb@hotmail.com				145	\N	t	f	2018-06-20 10:33:04.612492	2018-06-20 11:05:25.630827	1
270	271	0200000001	padmorey@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-08 12:27:28.551521	2018-08-08 12:27:28.551521	1
275	277	0243542211	newpatient@gmail.com				36	\N	t	f	2018-08-10 10:24:25.128248	2018-08-10 15:22:23.131625	1
277	279	44444555	ykusimensah@yahoo.com				158	\N	t	f	2018-08-13 14:53:25.526867	2018-08-13 15:55:03.42455	1
279	281	85395738925	free@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-13 16:30:52.74803	2018-08-13 16:30:52.74803	1
273	275	0302502275	akosua1@gmail.com				275	\N	t	f	2018-08-09 12:33:41.020977	2018-08-24 14:57:58.815715	1
169	170	0246001190	ck@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:11:26.249701	2018-08-26 12:19:28.230762	1
276	278	444444888	soph@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-13 14:05:17.947711	2018-08-13 14:05:17.947711	1
142	143	0241889900                                        	kwame@gmail.com				36	\N	t	f	2018-04-18 15:02:02.0056	2018-04-18 15:02:02.0056	1
143	144	0266000350                                        	jerry@gmail.com				135	\N	t	f	2018-04-18 16:02:00.081965	2018-04-18 16:02:00.081965	1
148	149	0549001123	freda@gmail.com				36	\N	t	f	2018-04-19 09:57:47.270403	2018-04-19 09:57:47.270403	1
149	150	444444r                                           	kasakyi@hotmail.com				36	\N	t	f	2018-04-19 11:04:05.030736	2018-04-19 11:04:05.030736	1
150	151	0241230000                                        	kwamedanso@gmail.com				36	\N	t	f	2018-04-19 11:08:01.450101	2018-04-19 11:08:01.450101	1
151	152	0567445533	cle@hotmail.com				36	\N	t	f	2018-04-19 11:16:50.543224	2018-04-19 11:16:50.543224	1
306	308	0200000190	pfasda@fasfs.com				158	\N	t	f	2018-09-13 11:43:32.963661	2018-09-13 17:32:13.644681	3
155	156	0201234467                                        	Nii@gmail.com				135	\N	t	f	2018-04-20 10:49:37.816556	2018-04-20 10:49:37.816556	1
158	159	99887766                                          	K@aol.com 				145	\N	t	f	2018-04-21 05:08:01.103735	2018-04-21 05:08:01.103735	1
160	161	45666777                                          	Gg@gmail.com				145	\N	t	f	2018-04-21 10:52:02.844911	2018-04-21 10:52:02.844911	1
161	162	0244574744                                        	ykusimensah@yahoo.com				145	\N	t	f	2018-04-21 11:21:46.786531	2018-04-21 11:21:46.786531	1
296	298	0201000010	paddy4doc4@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-26 13:12:20.460444	2018-08-26 13:13:52.10912	1
175	176	0567990021	nora@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-25 12:11:53.834665	2018-04-25 12:11:53.834665	1
156	157	027507907                                         	Naa@gmail.com				158	\N	t	f	2018-04-20 12:53:41.325344	2018-04-25 15:01:48.700992	1
188	189	0578119903	david23@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-04-27 18:23:09.975581	2018-04-27 18:23:09.975581	1
189	190	0568910299	amoah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 18:31:02.888718	2018-04-27 18:31:02.888718	1
36	36	0243554455	clemsedem@gmail.com				36	\N	t	f	2018-01-05 11:52:52.852373	2018-02-08 16:10:55.339339	1
206	207	0540000987	paddy2@gmail.com				36	\N	t	f	2018-05-02 20:52:13.475304	2018-05-03 17:14:41.634867	1
315	317	0201356665	madyy@gmail.com				158	\N	t	f	2018-09-15 18:14:55.370426	2018-09-15 18:44:58.044782	1
319	321	641654264	dfsa@oas.com	\N	\N	\N	\N	\N	t	f	2018-09-17 12:22:24.703067	2018-09-17 12:22:24.703067	1
323	325	539326102	nyamekyeapp@gmail.com	\N	\N	\N	\N	\N	t	f	2018-09-18 19:33:24.751304	2018-09-18 19:33:24.751304	2
325	327	0000000000	padmorey@gmail.com	\N	\N	\N	\N	\N	t	f	2018-11-30 13:10:10.531229	2018-11-30 13:10:10.531229	1
328	330	0246149530	freda.addae92@gmail.com	\N	\N	\N	\N	\N	t	f	2018-12-13 10:54:33.192082	2018-12-13 10:54:33.192082	1
332	334	0261904987	lehoff2008@hotmail.com	\N	\N	\N	\N	\N	t	f	2018-12-24 11:47:19.02589	2018-12-24 11:47:19.02589	2
336	338	090967758765	nana@gmail.com	\N	\N	\N	\N	\N	t	f	2019-01-08 10:23:53.501039	2019-01-08 10:23:53.501039	1
340	342	0233651122	test@gmail.com	\N	\N	\N	\N	\N	t	f	2019-01-11 09:18:52.227725	2019-01-11 09:18:52.227725	2
344	346	0233566424	hf@gmail.vom	\N	\N	\N	\N	\N	t	f	2019-01-11 10:15:12.467889	2019-01-11 10:15:12.467889	\N
348	350	00000011	nnurse@nu.com	\N	\N	\N	\N	\N	t	f	2019-01-15 10:27:19.657058	2019-01-15 10:27:19.657058	\N
350	352	0002000010	fgdaf@gf.com	\N	\N	\N	\N	\N	t	f	2019-01-24 13:42:49.666556	2019-01-24 13:42:49.666556	\N
353	355	0002200000	araba@freda.com	\N	\N	\N	\N	\N	t	f	2019-01-25 19:05:56.115787	2019-01-25 19:07:00.164911	3
299	301	0243619780	joj@gmail.com	\N	\N	\N	\N	\N	t	f	2018-09-06 10:25:43.493117	2018-09-06 10:27:17.94025	4
303	305	0245369807	gregf@gmail.com	\N	\N	\N	\N	\N	t	f	2018-09-11 09:16:47.722233	2018-09-11 09:16:47.722233	\N
307	309	02341232134	da@gasd.com	\N	\N	\N	\N	\N	t	f	2018-09-13 18:28:56.81082	2018-09-13 18:28:56.81082	1
308	310	05413209888	fda@fdsaf.com				36	\N	t	f	2018-09-13 18:32:31.870091	2018-09-14 07:45:37.823051	1
316	318	0242567754	maddyg@gmail.com				158	\N	t	f	2018-09-15 18:16:24.189103	2018-09-15 18:44:49.241679	1
326	328	Naa	Naa@gmail.com	\N	\N	\N	\N	\N	t	f	2018-11-30 18:40:48.25219	2018-11-30 18:40:48.25219	1
329	331	0556745326	pauljonesyiv@outlook.com	\N	\N	\N	\N	\N	t	f	2018-12-13 19:11:33.578215	2018-12-13 19:11:33.578215	\N
138	139	0248152204                                    	clemsedem@gmail.com		Madina Estate		36	\N	t	f	2018-04-12 13:25:40.534404	2018-12-20 11:17:49.808695	1
337	339	0727630122	bigyawson@gmail.com				339	\N	t	f	2019-01-08 10:51:39.977654	2019-01-08 10:56:35.020645	6
333	335	0208910765	g@mail.com			\N	145	\N	t	f	2019-01-01 05:25:42.297442	2019-01-11 09:50:33.715	\N
341	343	0244562233	nirse@gmail.com	\N	\N	\N	\N	\N	t	f	2019-01-11 09:59:15.039545	2019-01-11 09:59:15.039545	\N
345	347	0233653863	ff@gmail.com	\N	\N	\N	\N	\N	t	f	2019-01-11 10:17:05.471347	2019-01-11 10:17:05.471347	\N
351	353	0222000010	gdsa@a.com			\N	158	\N	t	f	2019-01-24 13:46:02.291015	2019-01-25 16:38:07.778687	1
354	356	0205869653	freda@appsnmobilesolutions.com			\N	158	\N	t	f	2019-01-25 19:34:39.617705	2019-01-25 19:36:51.240799	\N
320	322	0202144474	padmorey@gmail.com				322	\N	t	f	2018-09-17 17:44:51.859217	2019-01-28 13:20:58.052081	1
192	193	0546778299	yaa2@hotmail.com	\N	\N	\N	\N	\N	t	f	2018-04-30 11:44:33.029901	2018-04-30 11:44:33.029901	1
193	194	0271234567	yaaa@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-30 11:49:20.188533	2018-04-30 11:49:20.188533	1
191	192	0249009891	celest@yahoo.com		Danfa		192	\N	t	f	2018-04-30 11:07:57.46246	2018-05-04 12:01:34.423128	1
209	210	55566666	a@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 12:29:55.439644	2018-05-04 12:29:55.439644	1
210	211	0248109024	cloe@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 12:59:51.441611	2018-05-04 12:59:51.441611	1
216	217	55678899090	c@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 15:36:20.036272	2018-05-04 15:36:20.036272	1
219	220	0200000011	paddydoc2@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 21:35:52.974295	2018-05-04 21:35:52.974295	1
139	140	0243668890                                        	ago@gmail.com		 No. AN458 Accra New Town		140	\N	t	f	2018-04-13 11:21:53.244463	2018-05-04 11:28:40.715027	1
241	242	0277412356	andy1@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-05-10 15:16:44.682308	2018-05-10 15:16:44.682308	1
248	249	0249737020	padmore_y@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-06-13 21:39:22.127685	2018-06-13 21:39:22.127685	1
255	256	74793530	kasakyi@hotmail.com	\N	\N	\N	\N	\N	t	f	2018-06-19 15:47:54.489422	2018-06-19 15:47:54.489422	1
229	230	0264620500	freda.addae92@gmail.com				36	\N	t	f	2018-05-05 21:26:36.470457	2018-05-07 10:31:19.958414	1
264	265	0235667189	monday@gmail.com				158	\N	t	f	2018-07-23 17:28:12.283668	2018-07-23 17:28:12.283668	1
281	283	0254631978	friday@fri.com	\N	\N	\N	\N	\N	t	f	2018-08-16 09:38:56.011249	2018-08-16 09:38:56.011249	1
283	285	0243556632	myname@gmail.com				36	\N	t	f	2018-08-17 11:57:34.705521	2018-08-17 15:04:30.097603	1
287	289	0248021199	madyquaye1@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-20 15:06:01.97533	2018-08-20 15:06:01.97533	1
288	290	0247523760	ponkrtiah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-20 15:44:01.400668	2018-08-20 15:44:01.400668	1
291	293	0544828369	sarah@gmail.com				36	\N	t	f	2018-08-20 16:20:17.252185	2018-08-20 17:38:19.440022	1
247	248	0264680508	ionic@gmail.com				158	\N	t	f	2018-06-07 10:26:50.177331	2018-08-22 16:27:56.506207	1
170	171	0246001191	ck@yahoo1.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:13:04.834639	2018-08-26 12:19:28.231898	1
171	172	0246001196	cyk@yahoo1.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:20:46.496867	2018-08-26 12:19:28.232959	1
172	173	0246001110	cye@yahoo1.com	\N	\N	\N	\N	\N	t	f	2018-04-25 11:22:23.038313	2018-08-26 12:19:28.23393	1
177	178	0240000003	get@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-25 12:49:11.709877	2018-08-26 12:19:28.235598	1
179	180	0540000001	pat@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-26 15:43:40.007073	2018-08-26 12:19:28.236646	1
181	182	0569001124	mansah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 10:01:18.797927	2018-08-26 12:19:28.23799	1
182	183	0569001129	mans1ah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 10:02:55.747815	2018-08-26 12:19:28.238971	1
183	184	0569001126	mans2ah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 10:03:50.135322	2018-08-26 12:19:28.239952	1
225	226	0541012100	fasf@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-05 13:56:30.827561	2018-08-26 12:19:28.242294	1
227	228	0201021112	clementine@gamil.com	\N	\N	\N	\N	\N	t	f	2018-05-05 14:12:59.951906	2018-08-26 12:19:28.243263	1
228	229	0201234567	ben@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-05 14:13:12.517253	2018-08-26 12:19:28.244247	1
230	231	0248110987	clacla@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-05-07 13:15:28.434093	2018-08-26 12:19:28.245213	1
232	233	0249011980	momo@yall.om	\N	\N	\N	\N	\N	t	f	2018-05-07 13:32:22.714483	2018-08-26 12:19:28.246177	1
212	213	0245892009	cloe1@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-05-04 13:03:19.841582	2018-08-26 12:19:28.248774	1
218	219	0541840901	paddydoc1@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 21:29:12.452144	2018-08-26 12:19:28.250114	1
224	225	0541850993	paddydoca@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-05 13:50:48.12485	2018-08-26 12:19:28.251463	1
234	235	0541000000	Clem@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-09 09:33:37.920252	2018-08-26 12:19:28.252432	1
235	236	0541200000	Hg@ymailm.com	\N	\N	\N	\N	\N	t	f	2018-05-09 09:36:54.706269	2018-08-26 12:19:28.25339	1
237	238	444444	P@gmail.com 	\N	\N	\N	\N	\N	t	f	2018-05-10 00:54:48.827362	2018-08-26 12:19:28.254352	1
239	240	0266123456	ababio@gmail.com 	\N	\N	\N	\N	\N	t	f	2018-05-10 09:32:48.517198	2018-08-26 12:19:28.255337	1
242	243	027789456	mina@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-15 13:00:47.855727	2018-08-26 12:19:28.256292	1
249	250	0209433806	dajoshaft@gmail.com	\N	\N	\N	\N	\N	t	f	2018-06-14 12:55:04.027647	2018-08-26 12:19:28.257609	1
251	252	0244615890	naa@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-06-15 10:04:26.980514	2018-08-26 12:19:28.258592	1
254	255	0279454223	silas@gmail.com	\N	\N	\N	\N	\N	t	f	2018-06-18 16:43:15.579834	2018-08-26 12:19:28.259563	1
260	261	943498446	kasakyi@hota	\N	\N	\N	\N	\N	t	f	2018-06-22 10:39:55.073575	2018-08-26 12:19:28.26089	1
261	262	0506075223	maame@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-07-23 10:50:38.455714	2018-08-26 12:19:28.261858	1
268	269	0000000000	padmorey@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-08 10:43:37.165968	2018-08-26 12:19:28.263798	1
272	274	0231990090	mirabel@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-09 12:19:36.217998	2018-08-26 12:19:28.265136	1
167	168	0200000006	Fd@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-24 22:47:59.694816	2018-08-26 12:19:28.266844	1
168	169	0241000000	moes@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-24 23:01:31.028807	2018-08-26 12:19:28.267797	1
176	177	0240901278	yayra@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-25 12:33:33.400312	2018-08-26 12:19:28.269166	1
184	185	0569001160	mans4ah@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 10:04:47.688401	2018-08-26 12:19:28.27015	1
185	186	0249001102	stev@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 10:09:13.438069	2018-08-26 12:19:28.271119	1
187	188	0549013390	mawunya22@gmail.com	\N	\N	\N	\N	\N	t	f	2018-04-27 18:15:56.884151	2018-08-26 12:19:28.272089	1
205	206	0541840900	paddy1@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-02 20:51:13.190771	2018-08-26 12:19:28.273767	1
208	209	44433333	B@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 12:21:26.152066	2018-08-26 12:19:28.274741	1
211	212	4456777778	G@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 13:01:09.048849	2018-08-26 12:19:28.27572	1
213	214	339909999	A@hmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 13:18:53.809534	2018-08-26 12:19:28.276738	1
214	215	0541840980	Paddoc@	\N	\N	\N	\N	\N	t	f	2018-05-04 14:00:19.307165	2018-08-26 12:19:28.27773	1
215	216	0248190033	Good@yah.com	\N	\N	\N	\N	\N	t	f	2018-05-04 14:26:33.163304	2018-08-26 12:19:28.278702	1
217	218	0541840000	portugal@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 17:57:13.425084	2018-08-26 12:19:28.279735	1
220	221	0200000100	paddydocc@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-04 21:48:10.111495	2018-08-26 12:19:28.280728	1
223	224	0241840988	fdsf@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-05 13:34:27.265904	2018-08-26 12:19:28.281738	1
226	227	0201840988	clementino@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-05 14:03:18.263671	2018-08-26 12:19:28.282725	1
278	280	0234889902	clems@hotmal.com	\N	\N	\N	\N	\N	t	f	2018-08-13 15:20:07.522277	2018-08-26 12:19:28.283726	1
231	232	0241233778	Clare@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-07 13:19:45.052281	2018-08-26 12:19:28.284711	1
233	234	024679875544	Paddy@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-09 09:26:58.196586	2018-08-26 12:19:28.285688	1
236	237	0556296012	freda.addae92@gmail.com 	\N	\N	\N	\N	\N	t	f	2018-05-09 15:24:11.461145	2018-08-26 12:19:28.286664	1
238	239	455778	Pt@gmail.com 	\N	\N	\N	\N	\N	t	f	2018-05-10 01:37:13.217043	2018-08-26 12:19:28.287649	1
240	241	0277234567	andy@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-05-10 14:36:23.755832	2018-08-26 12:19:28.288649	1
243	244	0278945612	mina1@gmail.com	\N	\N	\N	\N	\N	t	f	2018-05-15 16:36:28.824753	2018-08-26 12:19:28.289961	1
246	247	0276624567	padmorey@gmail.com	\N	\N	\N	\N	\N	t	f	2018-06-06 11:12:19.889898	2018-08-26 12:19:28.290958	1
250	251	0244160414	mady@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-06-15 10:02:05.574103	2018-08-26 12:19:28.29227	1
253	254	0247915505	samson@appsnmobilesolutions.com	\N	\N	\N	\N	\N	t	f	2018-06-15 12:36:11.402204	2018-08-26 12:19:28.294196	1
259	260	555586666	ky@gmail.com	\N	\N	\N	\N	\N	t	f	2018-06-21 15:33:07.577623	2018-08-26 12:19:28.295497	1
262	263	0241990807	dadjoshaft@gmail.com	\N	\N	\N	\N	\N	t	f	2018-07-23 15:21:55.818767	2018-08-26 12:19:28.296438	1
265	266	0267889899	assurance@gmail.ao	\N	\N	\N	\N	\N	t	f	2018-07-23 17:46:32.823817	2018-08-26 12:19:28.297406	1
267	268	0246718898	duga@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-07 22:58:39.152958	2018-08-26 12:19:28.298361	1
269	270	0000000001	padmorey@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-08 10:47:34.803672	2018-08-26 12:19:28.299334	1
274	276	1234567970	sappiah004@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-09 12:42:31.034843	2018-08-26 12:19:28.301283	1
280	282	0245113328	thursdaytest@test.com	\N	\N	\N	\N	\N	t	f	2018-08-16 08:40:16.734489	2018-08-26 12:19:28.302261	1
282	284	058466539	sat@sat.com	\N	\N	\N	\N	\N	t	f	2018-08-16 10:14:23.537791	2018-08-26 12:19:28.303601	1
289	291	0003000000	madyquaye1@icloud.com				158	\N	t	f	2018-08-20 15:56:44.737445	2018-08-22 16:25:25.028736	1
271	272	0011110000	jerry1@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-08 14:40:47.174227	2018-08-26 12:19:28.300313	1
284	286	0540000000	padmorey1@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-17 12:21:01.656123	2018-08-26 12:19:28.30459	1
285	287	0236498200	yrname@g.cim	\N	\N	\N	\N	\N	t	f	2018-08-17 15:39:08.743212	2018-08-26 12:19:28.305701	1
286	288	0000000110	dsaf@gasd.com	\N	\N	\N	\N	\N	t	f	2018-08-17 18:15:21.047184	2018-08-26 12:19:28.306676	1
178	179	0203440000	Naa@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-04-26 11:37:58.761392	2018-08-26 12:19:28.308358	1
290	292	0541840000	padm@gm.com	\N	\N	\N	\N	\N	t	f	2018-08-20 16:19:55.130519	2018-08-26 12:19:28.30932	1
292	294	0543692511	dre@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-20 16:50:00.055359	2018-08-26 12:19:28.310296	1
294	296	0541800000	dddoc2@gmail.com	\N	\N	\N	\N	\N	t	f	2018-08-26 12:06:56.169771	2018-08-26 12:19:28.312282	1
300	302	0504899386	andymistic37@gmail.com	\N	\N	\N	\N	\N	t	f	2018-09-07 16:10:01.512326	2018-09-07 16:10:01.512326	2
293	295	0244160414	co_excutie1@yahoo.com	\N	\N	\N	\N	\N	t	f	2018-08-20 16:56:09.065542	2018-08-26 12:19:28.311293	1
304	306	0542369180	fremag@gmail.com	\N	\N	\N	\N	\N	t	f	2018-09-11 10:04:44.845099	2018-09-11 10:04:44.845099	1
309	311	0234119069	leave@hotmail.com	\N	\N	\N	\N	\N	t	f	2018-09-14 09:35:13.011274	2018-09-14 09:35:13.011274	1
313	315	09874632432	fa@ijksa.com	\N	\N	\N	\N	\N	t	f	2018-09-14 11:16:32.915332	2018-09-14 11:18:03.411821	1
317	319	0998693200	fdsia@fja.com				36	\N	t	f	2018-09-17 10:26:47.659177	2018-09-17 11:34:48.54282	1
327	329	0272704910	lehoff2g8@gmail.com	\N	\N	\N	\N	\N	t	f	2018-12-01 06:26:19.924718	2018-12-01 06:26:19.924718	2
330	332	0202233117	padmorey@gmail.com	\N	\N	\N	\N	\N	t	f	2018-12-17 12:19:41.010079	2018-12-17 12:19:41.010079	1
321	323	0202233117	padmorey@gmail.com			\N	158	\N	t	f	2018-09-17 17:48:20.972774	2018-09-17 18:07:27.226112	1
338	340	0546747905	fii@gmail.com	\N	\N	\N	\N	\N	t	f	2019-01-09 14:33:23.484724	2019-01-09 14:33:23.484724	4
342	344	0244123412	ga@gmail.com	\N	\N	\N	\N	\N	t	f	2019-01-11 10:01:32.327653	2019-01-11 10:01:32.327653	\N
346	348	0244564123	hgg@gmm.com	\N	\N	\N	\N	\N	t	f	2019-01-11 10:19:22.741499	2019-01-11 10:19:22.741499	\N
207	208	0011110000	feds@d.com	\N	\N	\N	\N	\N	t	f	2018-05-04 09:33:53.121033	2018-08-26 12:19:28.247122	1
252	253	0011110000	feds@d.com	\N	\N	\N	\N	\N	t	f	2018-06-15 12:23:26.821093	2018-08-26 12:19:28.29322	1
355	357	050489938	co_excutie16@yahoo.com			\N	158	\N	t	f	2019-01-28 13:28:07.115401	2019-01-28 13:34:04.346839	1
\.


--
-- Name: person_contact_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.person_contact_infos_id_seq', 355, true);


--
-- Data for Name: person_info_extras; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.person_info_extras (id, person_id, specialty_id, specialty_duration, has_specialty, forign_training, foreign_institution_desc, profession_group_id, licence_number, comment, user_id, entity_id, active_status, del_status, created_at, updated_at, foreign_licence_number, hospital_name) FROM stdin;
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
29	249	4	-2	f	f		1	4342314		\N	\N	t	f	2018-06-14 06:47:38.505619	2018-06-14 06:47:38.505619	\N	37 Hospital
30	252	4	3	f	f		1	Doctorla		\N	\N	t	f	2018-06-15 10:10:11.73419	2018-06-15 10:10:11.73419	\N	University of ghana
31	258	3	4	t	t	Rcog	1	1234567	<p>kjabbfdklsjfliskjf</p>	\N	\N	t	f	2018-06-20 10:36:48.450875	2018-06-20 10:36:48.450875	123345455	honda 
32	259	3	8	f	f		1	12345	<p>no</p>	\N	\N	t	f	2018-06-20 10:41:04.792191	2018-06-20 10:41:04.792191	\N	honda
33	264	2	3	f	f		1	Ab123	<p>Doctor passed the necessary checks</p>	\N	\N	t	f	2018-07-23 17:14:55.099529	2018-07-23 17:14:55.099529	\N	Nyaho clinic
34	265	2	3	f	f		1	78ytghjjh		\N	\N	t	f	2018-07-23 17:28:46.973885	2018-07-23 17:28:46.973885	\N	
35	264	2	3	f	f		1	Ab123	<p>All checks completed</p>	\N	\N	t	f	2018-07-23 17:51:40.306289	2018-07-23 17:51:40.306289	\N	Nyaho clinic
36	266	3	3	f	f		1	dfg4556		\N	\N	t	f	2018-08-07 17:13:04.130219	2018-08-07 17:13:04.130219	\N	
37	264	4	10	f	f		1	1234567		\N	\N	t	f	2018-08-08 11:09:35.079139	2018-08-08 11:09:35.079139	\N	Legon Hospital
38	264	4	5	f	f		1	12345678		\N	\N	t	f	2018-08-08 11:11:45.380696	2018-08-08 11:11:45.380696	\N	legon hospital
39	275	2	3	f	f		1	12345	<p>all correct</p>	\N	\N	t	f	2018-08-09 16:48:43.496672	2018-08-09 16:48:43.496672	\N	nyaho
40	279	4	3	t	t		1	56603033		\N	\N	t	f	2018-08-13 15:48:27.767049	2018-08-13 15:48:27.767049		korle Bu
41	285	4	3	f	f		2	455ghh		\N	\N	t	f	2018-08-17 12:03:34.089191	2018-08-17 12:03:34.089191	\N	Korle Bu
42	293	4	3	f	f		1	n124678	<p>fine</p>	\N	\N	t	f	2018-08-20 16:58:25.610971	2018-08-20 16:58:25.610971	\N	university of ghana
43	291	4	3	f	f		1	n124678		\N	\N	t	f	2018-08-20 17:01:49.565849	2018-08-20 17:01:49.565849	\N	university of ghana
44	298	4	2	t	t	Emeria Medical Center	2	E3242		\N	\N	t	f	2018-08-27 10:43:33.335617	2018-08-27 10:43:33.335617	E223211	37 Hospital
45	299	4	10	f	f		1	doc123		\N	\N	t	f	2018-09-04 11:27:51.290789	2018-09-04 11:27:51.290789	\N	oyarifa
46	299	4	10	f	f		1	doc123		\N	\N	t	f	2018-09-04 11:28:46.68737	2018-09-04 11:28:46.68737	\N	oyarifa
47	299	4	10	f	f		1	doc123		\N	\N	t	f	2018-09-04 11:30:02.581191	2018-09-04 11:30:02.581191	\N	oyarifa
48	280	2	1	f	f		1	dg609		\N	\N	t	f	2018-09-04 11:31:05.395248	2018-09-04 11:31:05.395248	\N	legon
49	299	4	10	f	f		1	hgvw4324		\N	\N	t	f	2018-09-04 13:14:14.393279	2018-09-04 13:14:14.393279	\N	oyarifa
50	298	4	12	f	f		1	hkj114		\N	\N	t	f	2018-09-04 13:15:00.068867	2018-09-04 13:15:00.068867	\N	hgyedfd
51	292	3	2	f	f		1	v zd45		\N	\N	t	f	2018-09-04 13:15:48.183983	2018-09-04 13:15:48.183983	\N	tgr
52	299	1	3	f	f		1	12365788	<p>hardworking and positive</p>	\N	\N	t	f	2018-09-05 11:27:40.089412	2018-09-05 11:27:40.089412	\N	12349980
53	301	4	5	f	f		1	GH267		\N	\N	t	f	2018-09-06 10:34:29.183404	2018-09-06 10:34:29.183404	\N	Kole Bu
54	298	3	7	t	t	Emeria Medical Center	1	E3242	<p>positive about his work</p>	\N	\N	t	f	2018-09-10 09:41:06.754023	2018-09-10 09:41:06.754023	E223221	37 Hospital
55	303	4	3	f	f		1	gh2287690		\N	\N	t	f	2018-09-10 13:02:08.925656	2018-09-10 13:02:08.925656	\N	legon
56	308	4	2	t	f		1	8767ew0	<p>fdsa</p>	\N	\N	t	f	2018-09-13 11:46:19.304736	2018-09-13 11:46:19.304736		Emmanuel Clinic
57	310	4	2	t	f		1	33242s	<p>passed</p>	\N	\N	t	f	2018-09-13 18:34:11.445122	2018-09-13 18:34:11.445122		Emmanuel Hospital
58	311	3	3	f	f		1	HGJ453		36	\N	t	f	2018-09-14 09:40:07.730299	2018-09-14 09:40:07.730299	\N	Alpha Hospital
59	315	4	2	f	f		1	65452tgr		158	\N	t	f	2018-09-14 11:20:48.659717	2018-09-14 11:20:48.659717	\N	Kontact Eye Hospital
60	316	4	2	t	f		1	T4423	<p>Registered</p>	158	\N	t	f	2018-09-14 11:24:11.045621	2018-09-14 11:24:11.045621		Kontact2 Hospital
61	318	4	5	f	f		1	Gn245	<p>done</p>	158	\N	t	f	2018-09-15 18:44:04.939771	2018-09-15 18:44:04.939771	\N	Legon
62	318	3	4	f	f		1	Gn245		36	\N	t	f	2018-09-16 11:12:02.900362	2018-09-16 11:12:02.900362	\N	legon
63	318	3	4	f	f		1	Gn245		36	\N	t	f	2018-09-16 11:13:55.304802	2018-09-16 11:13:55.304802	\N	legon
64	318	3	3	f	f		1	dfdsafsd		36	\N	t	f	2018-09-16 11:32:16.478476	2018-09-16 11:32:16.478476	\N	legon
65	318	4	3	f	f		1	Gn245		36	\N	t	f	2018-09-16 11:34:48.280545	2018-09-16 11:34:48.280545	\N	Legon
66	318	4	3	f	f		1	dff34		36	\N	t	f	2018-09-16 11:39:22.969113	2018-09-16 11:39:22.969113	\N	legon
67	318	4	4	f	f		1	df		36	\N	t	f	2018-09-16 11:44:05.794402	2018-09-16 11:44:05.794402	\N	legon
68	318	4	34	f	f		1	sdf		36	\N	t	f	2018-09-16 11:45:17.59298	2018-09-16 11:45:17.59298	\N	legon
69	318	4	4	f	f		1	sdf		36	\N	t	f	2018-09-16 11:47:47.194685	2018-09-16 11:47:47.194685	\N	legon
70	318	4	4	f	f		1	GH45		36	\N	t	f	2018-09-16 11:51:35.168464	2018-09-16 11:51:35.168464	\N	Legon
71	318	4	2	f	f		1	2		36	\N	t	f	2018-09-17 09:24:11.731851	2018-09-17 09:24:11.731851	\N	Legon
72	318	4	2	f	f		1	hg7		36	\N	t	f	2018-09-17 09:40:52.19611	2018-09-17 09:40:52.19611	\N	Legon
73	318	4	2	f	f		1	hg7		36	\N	t	f	2018-09-17 09:44:03.260305	2018-09-17 09:44:03.260305	\N	Legon
74	318	4	2	f	f		1	hg7		36	\N	t	f	2018-09-17 09:44:09.750009	2018-09-17 09:44:09.750009	\N	Legon
75	318	4	1	f	f		1	fg		36	\N	t	f	2018-09-17 10:12:15.047978	2018-09-17 10:12:15.047978	\N	legon
76	318	4	1	f	f		1	fg		36	\N	t	f	2018-09-17 10:14:18.771816	2018-09-17 10:14:18.771816	\N	legon
77	318	4	1	f	f		1	fg		36	\N	t	f	2018-09-17 10:14:19.254764	2018-09-17 10:14:19.254764	\N	legon
78	318	4	2	f	f		1	e34		36	\N	t	f	2018-09-17 10:16:49.090236	2018-09-17 10:16:49.090236	\N	legon
79	318	4	2	f	f		1	df3		36	\N	t	f	2018-09-17 10:19:14.389803	2018-09-17 10:19:14.389803	\N	legon
80	318	4	2	f	f		1	df3		36	\N	t	f	2018-09-17 10:21:56.001611	2018-09-17 10:21:56.001611	\N	legon
81	316	4	2	f	f		1	H43		36	\N	t	f	2018-09-17 10:25:50.477841	2018-09-17 10:25:50.477841	\N	Legon
82	316	4	2	f	f		1	32434		36	\N	t	f	2018-09-17 10:28:39.184484	2018-09-17 10:28:39.184484	\N	
83	316	4	2	f	f		1	32434		36	\N	t	f	2018-09-17 10:29:26.720601	2018-09-17 10:29:26.720601	\N	
84	318	4	2	f	f		1	HG23		36	\N	t	f	2018-09-17 10:40:21.386663	2018-09-17 10:40:21.386663	\N	Legon
85	318	4	2	f	f		1	sG53		36	\N	t	f	2018-09-17 10:53:22.093101	2018-09-17 10:53:22.093101	\N	legon
86	318	4	2	f	f		1	sG53		36	\N	t	f	2018-09-17 10:55:23.422288	2018-09-17 10:55:23.422288	\N	legon
87	318	4	2	f	f		1	sG53		36	\N	t	f	2018-09-17 11:00:52.820377	2018-09-17 11:00:52.820377	\N	legon
88	318	4	2	f	f		1	sG53		36	\N	t	f	2018-09-17 11:01:25.5176	2018-09-17 11:01:25.5176	\N	legon
89	319	4	3	t	f		1	T32421		36	\N	t	f	2018-09-17 11:06:02.742541	2018-09-17 11:06:02.742541		M paddy
90	316	4	2	f	f		1	GH454		36	\N	t	f	2018-09-17 12:01:20.831737	2018-09-17 12:01:20.831737	\N	Legon
91	316	4	2	f	f		1	GH454		36	\N	t	f	2018-09-17 12:04:11.931496	2018-09-17 12:04:11.931496	\N	Legon
92	320	4	2	t	f		1	Y324132		158	\N	t	f	2018-09-17 12:15:07.943724	2018-09-17 12:15:07.943724		Eunica Hospital
93	323	4	5	f	f		1	gh23344		158	\N	t	f	2018-09-17 18:07:27.1972	2018-09-17 18:07:27.1972	\N	legon
94	336	4	5	f	f		1	cccccccccccccccc	<p><img src="users/sign_in" alt="" /></p>	145	\N	t	f	2019-01-07 23:00:00.872889	2019-01-07 23:00:00.872889	\N	sddfggggggghg
95	337	4	67	f	f		1	3928766		145	\N	t	f	2019-01-08 10:07:33.751386	2019-01-08 10:07:33.751386	\N	KBu
96	335	4	5	f	f		1	jkhl'k'		145	\N	t	f	2019-01-11 09:50:33.696398	2019-01-11 09:50:33.696398	\N	hgf
97	349	4	2	f	f		1	gn25555		158	\N	t	f	2019-01-15 10:22:10.747134	2019-01-15 10:22:10.747134	\N	oyarifa
98	354	4	5	f	f		1	1234567		158	\N	t	f	2019-01-25 16:37:02.580729	2019-01-25 16:37:02.580729	\N	Korle Bu Teaching Hospital
99	353	1	3	f	f		1	12345678		158	\N	t	f	2019-01-25 16:38:07.762423	2019-01-25 16:38:07.762423	\N	MotherLove Hospital
100	356	1	3	f	f		1	123456		158	\N	t	f	2019-01-25 19:36:51.221133	2019-01-25 19:36:51.221133	\N	Ridge Hospital
101	357	4	2	f	f		1	hd3222		158	\N	t	f	2019-01-28 13:34:04.329901	2019-01-28 13:34:04.329901	\N	university of ghana
\.


--
-- Name: person_info_extras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.person_info_extras_id_seq', 101, true);


--
-- Data for Name: person_infos; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.person_infos (id, surname, other_names, person_type_id, entity_id, user_id, active_status, del_status, created_at, updated_at, full_name, dob, reg_id, pd_sub) FROM stdin;
135	Tetteh	Andrew	D	\N	36	t	f	2018-04-12 12:09:33.288697	2018-04-12 12:09:33.288697	\N	2017-01-01	\N	f
136	Quaye	Akosua	C	\N	36	t	f	2018-04-12 12:57:44.353239	2018-04-12 13:07:10.547046	\N	2000-01-01	2	f
137	Yeboah	Padmore	C	\N	36	t	f	2018-04-12 13:02:17.099953	2018-04-12 13:07:26.651243	\N	1992-12-16	1	f
138	Tetteh	Andrew	C	\N	36	t	f	2018-04-12 13:21:38.579398	2018-04-12 13:21:38.579398	\N	1989-01-01	4	f
141	Doctor	Doctor	D	\N	135	t	f	2018-04-13 17:06:54.565655	2018-04-13 17:06:54.565655	\N	1988-02-01	6	f
142	Maddy	Cutie	D	\N	135	t	f	2018-04-13 17:20:38.713288	2018-04-13 17:20:38.713288	\N	1991-08-30	8	f
140	Ago	Nam	D	\N	140	t	f	2018-04-13 11:21:53.242922	2018-04-16 17:38:32.732256	\N	2014-03-30	7	t
143	Amemawukpor	Kwame	C	\N	36	t	f	2018-04-18 15:02:02.004039	2018-04-18 15:02:02.004039	\N	1990-02-10	10	f
144	Bansah	Jerry	C	\N	135	t	f	2018-04-18 16:02:00.080623	2018-04-18 16:02:00.080623	\N	2016-06-05	11	f
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
145	Appiah	Kobby	D	\N	145	t	f	2018-04-18 22:21:38.191034	2018-06-19 18:02:56.712157	\N	2018-01-14	\N	t
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
139	Agonam	Davi	C	\N	36	t	f	2018-04-12 13:25:40.532757	2018-12-19 16:23:42.117585	\N	2001-01-01	5	f
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
249	Yeboah	George	N	\N	\N	t	f	2018-06-13 21:39:22.122283	2018-06-13 21:39:22.122283	\N	1985-01-30	130	f
250	Shaft Asante	Dora	C	\N	\N	t	f	2018-06-14 12:55:04.011798	2018-06-14 12:55:04.011798	\N	1993-04-05	131	\N
251	Ayeley	Naa	C	\N	\N	t	f	2018-06-15 10:02:05.55421	2018-06-15 10:02:05.55421	\N	1992-08-30	132	\N
252	Ayeley	Naa	D	\N	\N	t	f	2018-06-15 10:04:26.961564	2018-06-15 10:04:26.961564	\N	1983-12-25	133	t
253	Araba	Aba	D	\N	\N	t	f	2018-06-15 12:23:26.804685	2018-06-15 12:23:26.804685	\N	1994-08-16	134	t
254	Kwesi	Kay	C	\N	\N	t	f	2018-06-15 12:36:11.400719	2018-06-15 12:36:11.400719	\N	1993-01-01	135	\N
255	Lawer	Nii	D	\N	\N	t	f	2018-06-18 16:43:15.554591	2018-06-18 16:43:15.554591	\N	1996-01-01	136	t
256	Ocansey	John	C	\N	\N	t	f	2018-06-19 15:47:54.484089	2018-06-19 15:47:54.484089	\N	2018-06-03	137	f
257	Nyantekyi	Kofi	C	\N	\N	t	f	2018-06-20 10:23:50.748094	2018-06-20 10:23:50.748094	\N	2011-10-11	138	f
258	Dranas	Dranas	D	\N	145	t	f	2018-06-20 10:27:57.303732	2018-06-20 11:04:54.063664	\N	2005-01-09	139	t
259	Akufs	Rebecca	N	\N	145	t	f	2018-06-20 10:33:04.608134	2018-06-20 11:05:25.62944	\N	2004-02-11	140	f
260	agyas	kenedy	C	\N	\N	t	f	2018-06-21 15:33:07.563061	2018-06-21 15:33:07.563061	\N	1957-01-01	141	\N
261	Appiah1	Oh	C	\N	\N	t	f	2018-06-22 10:39:55.059057	2018-06-22 10:39:55.059057	\N	2001-01-01	142	\N
262	Quaye	Maame	C	\N	\N	t	f	2018-07-23 10:50:38.409772	2018-07-23 10:50:38.409772	\N	1990-07-23	143	\N
263	Shaft Asante	Dora	D	\N	\N	t	f	2018-07-23 15:21:55.803489	2018-07-23 15:21:55.803489	\N	1993-04-06	144	\N
264	Paddy	Morey	D	\N	158	t	f	2018-07-23 17:00:01.7183	2018-07-23 17:20:08.203557	\N	1988-07-11	145	t
265	Paddy	Monday	D	\N	158	t	f	2018-07-23 17:28:12.282036	2018-07-23 17:28:12.282036	\N	2018-07-08	\N	t
266	Assurance	Rich	D	\N	\N	t	f	2018-07-23 17:46:32.8184	2018-07-23 17:46:32.8184	\N	2018-07-09	147	t
267	Paddy	More	C	\N	\N	t	f	2018-08-06 14:42:44.380465	2018-08-06 14:42:44.380465	\N	1998-08-06	148	\N
268	Duga	Newoavor	C	\N	\N	t	f	2018-08-07 22:58:39.147546	2018-08-07 22:58:39.147546	\N	2018-07-30	149	f
269	Anka	Appiah	C	\N	\N	t	f	2018-08-08 10:43:37.148594	2018-08-08 10:43:37.148594	\N	2000-08-08	150	\N
270	Nipa	Kofi	C	\N	\N	t	f	2018-08-08 10:47:34.785944	2018-08-08 10:47:34.785944	\N	2005-08-08	151	\N
271	Pa	Yonmu	C	\N	\N	t	f	2018-08-08 12:27:28.536767	2018-08-08 12:27:28.536767	\N	2006-08-08	152	\N
272	Bansah	Kwame	C	\N	\N	t	f	2018-08-08 14:40:47.156686	2018-08-08 14:40:47.156686	\N	1994-08-08	153	\N
273	Tandoh	Akosua	N	\N	\N	t	f	2018-08-08 17:08:32.535481	2018-08-08 17:08:32.535481	\N	1985-08-08	154	f
274	Mirabel	Agozi	N	\N	\N	t	f	2018-08-09 12:19:36.212177	2018-08-09 12:19:36.212177	\N	2018-07-29	155	f
276	Appiah	Sam	C	\N	\N	t	f	2018-08-09 12:42:31.016989	2018-08-09 12:42:31.016989	\N	1993-08-09	157	\N
277	New	Patient	C	\N	36	t	f	2018-08-10 10:24:25.112705	2018-08-10 15:22:23.129622	\N	2014-12-01	158	f
278	Dominica 	Sophia 	C	\N	\N	t	f	2018-08-13 14:05:17.930517	2018-08-13 14:05:17.930517	\N	1986-06-13	159	\N
280	Clem	Clem	D	\N	\N	t	f	2018-08-13 15:20:07.517434	2018-08-13 15:20:07.517434	\N	2018-07-30	161	t
279	Kusi-Mensah	Yaw	D	\N	158	t	f	2018-08-13 14:53:25.51228	2018-08-13 15:55:03.422939	\N	1993-08-12	160	t
281	Free	Free	C	\N	\N	t	f	2018-08-13 16:30:52.734789	2018-08-13 16:30:52.734789	\N	2018-08-13	162	f
282	Thursday	Test	C	\N	\N	t	f	2018-08-16 08:40:16.719165	2018-08-16 08:40:16.719165	\N	2007-01-09	163	\N
283	Friday	Test	C	\N	\N	t	f	2018-08-16 09:38:55.993624	2018-08-16 09:38:55.993624	\N	1999-08-04	164	\N
284	Sat	Sat	C	\N	\N	t	f	2018-08-16 10:14:23.52032	2018-08-16 10:14:23.52032	\N	1985-08-02	165	\N
286	Yeboah	George Elorm	C	\N	\N	t	f	2018-08-17 12:21:01.638447	2018-08-17 12:21:01.638447	\N	1990-08-17	167	\N
285	Name	My	D	\N	36	t	f	2018-08-17 11:57:34.688155	2018-08-17 15:04:30.096091	\N	1995-08-01	166	t
287	Your	Name	C	\N	\N	t	f	2018-08-17 15:39:08.728501	2018-08-17 15:39:08.728501	\N	2018-08-17	168	\N
288	Ne	Doc	D	\N	\N	t	f	2018-08-17 18:15:21.032472	2018-08-17 18:15:21.032472	\N	1994-08-17	169	t
289	Clara	Patient	C	\N	\N	t	f	2018-08-20 15:06:01.958781	2018-08-20 15:06:01.958781	\N	1992-08-30	170	\N
290	Awuah	Nana	C	\N	\N	t	f	2018-08-20 15:44:01.383244	2018-08-20 15:44:01.383244	\N	1993-10-30	171	\N
292	Doc	Pad	D	\N	\N	t	f	2018-08-20 16:19:55.113102	2018-08-20 16:19:55.113102	\N	1990-08-20	173	t
294	Dre	Ric	D	\N	\N	t	f	2018-08-20 16:50:00.040581	2018-08-20 16:50:00.040581	\N	1987-03-20	175	t
295	Clara	Doctor1	D	\N	\N	t	f	2018-08-20 16:56:09.050581	2018-08-20 16:56:09.050581	\N	1992-08-30	176	t
293	Sarah	Awuah	D	\N	36	t	f	2018-08-20 16:20:17.235435	2018-08-20 17:38:19.438258	\N	1987-10-20	174	t
291	Clara	Doctor	D	\N	158	t	f	2018-08-20 15:56:44.720814	2018-08-22 16:25:25.026954	\N	1992-08-30	172	f
248	Ionic	Senior	D	\N	158	t	f	2018-06-07 10:26:50.171961	2018-08-22 16:27:56.504654	\N	1983-06-07	129	t
275	Tandoh	Akosua	N	\N	275	t	f	2018-08-09 12:33:41.015862	2018-08-24 14:57:58.814047	\N	1992-07-19	156	f
296	Paddy	Doc	D	\N	\N	t	f	2018-08-26 12:06:56.15293	2018-08-26 12:06:56.15293	\N	1993-08-26	177	t
297	Paddy3	Doc3	D	\N	\N	t	f	2018-08-26 12:23:18.02144	2018-08-26 12:23:18.02144	\N	1992-08-26	178	\N
298	Paddy4	Doc4	D	\N	\N	t	f	2018-08-26 13:12:20.443897	2018-08-26 13:12:20.443897	\N	1995-08-26	179	t
299	Clara	Doctor2	D	\N	\N	t	f	2018-09-04 11:23:03.50381	2018-09-04 11:23:03.50381	\N	1983-09-04	180	t
300	Rich	Terty	C	\N	\N	t	f	2018-09-05 15:20:11.446567	2018-09-05 15:20:11.446567	\N	1984-09-05	181	\N
301	Dede	Yeye	D	\N	\N	t	f	2018-09-06 10:25:43.478421	2018-09-06 10:25:43.478421	\N	1973-12-01	182	t
302	Tetteh	Andrew	C	\N	\N	t	f	2018-09-07 16:10:01.495828	2018-09-07 16:10:01.495828	\N	1991-09-07	183	\N
304	Mady	Patient	C	\N	\N	t	f	2018-09-10 13:08:58.355658	2018-09-10 13:08:58.355658	\N	1990-09-10	185	\N
303	Mady	Doctor	D	\N	158	t	f	2018-09-10 12:55:47.041475	2018-09-10 13:51:02.782744	\N	1984-01-17	184	t
305	Frema	Greg	N	\N	\N	t	f	2018-09-11 09:16:47.704342	2018-09-11 09:16:47.704342	\N	1984-09-11	186	\N
306	Frema	Greg	C	\N	\N	t	f	2018-09-11 10:04:44.829494	2018-09-11 10:04:44.829494	\N	1992-04-11	187	\N
307	Pad	Azalekor	C	\N	\N	t	f	2018-09-13 11:39:31.642893	2018-09-13 11:39:31.642893	\N	1986-09-13	188	\N
308	Essel	Pad	D	\N	158	t	f	2018-09-13 11:43:32.946943	2018-09-13 17:32:13.643162	\N	1986-09-13	189	t
309	Lampo	Isaac	C	\N	\N	t	f	2018-09-13 18:28:56.805432	2018-09-13 18:28:56.805432	\N	1999-12-27	190	f
310	Yousa	James	D	\N	36	t	f	2018-09-13 18:32:31.864991	2018-09-14 07:45:37.821619	\N	1999-12-27	191	t
311	Leave	Leaves	D	\N	\N	t	f	2018-09-14 09:35:12.983175	2018-09-14 09:35:12.983175	\N	2018-08-27	192	t
315	Padd	Doc	D	\N	\N	t	f	2018-09-14 11:16:32.900724	2018-09-14 11:16:32.900724	\N	1995-09-14	196	t
318	Maddy	Doctor1	D	\N	158	t	f	2018-09-15 18:16:24.172525	2018-09-15 18:44:49.240081	\N	1978-09-15	199	t
317	Maddy	Patient1	C	\N	158	t	f	2018-09-15 18:14:55.353389	2018-09-15 18:44:58.0429	\N	1985-09-15	198	f
319	My	Paddy	D	\N	36	t	f	2018-09-17 10:26:47.64338	2018-09-17 11:34:48.54137	\N	1990-09-17	200	t
316	Kwad	Kwad	D	\N	36	t	f	2018-09-14 11:22:03.887349	2018-09-17 12:04:11.958582	\N	1990-09-14	197	t
320	You	Paddy	D	\N	158	t	f	2018-09-17 12:10:58.169933	2018-09-17 12:15:07.967799	\N	1987-09-17	201	t
321	Patient	You	C	\N	\N	t	f	2018-09-17 12:22:24.6884	2018-09-17 12:22:24.6884	\N	1994-09-17	202	\N
323	Naa	Maame	D	\N	158	t	f	2018-09-17 17:48:20.958052	2018-09-17 18:07:27.222399	\N	1980-09-17	204	t
324	Yo	Yo	C	\N	\N	t	f	2018-09-18 18:49:52.026519	2018-09-18 18:49:52.026519	\N	1994-09-18	205	\N
325	Appiah-sakyi	Nana	C	\N	\N	t	f	2018-09-18 19:33:24.733782	2018-09-18 19:33:24.733782	\N	1997-07-14	206	\N
327	Yeboah	Elorm kwaku	C	\N	\N	t	f	2018-11-30 13:10:10.436775	2018-11-30 13:10:10.436775	\N	2006-11-30	208	\N
328	Naa	Naa	C	\N	\N	t	f	2018-11-30 18:40:48.236737	2018-11-30 18:40:48.236737	\N	1997-11-30	209	\N
329	Hoffmann	Caleb	C	\N	\N	t	f	2018-12-01 06:26:19.9093	2018-12-01 06:26:19.9093	\N	1992-05-27	210	\N
330	Addo	Kofi	C	\N	\N	t	f	2018-12-13 10:54:33.167506	2018-12-13 10:54:33.167506	\N	1995-12-13	211	\N
331	Jones	Paul	C	\N	\N	t	f	2018-12-13 19:11:33.562758	2018-12-13 19:11:33.562758	\N	1976-12-13	212	\N
332	El	Parddie	C	\N	\N	t	f	2018-12-17 12:19:40.992839	2018-12-17 12:19:40.992839	\N	1992-12-16	213	\N
333	Trick	Lez	C	\N	\N	t	f	2018-12-21 13:57:09.8516	2018-12-21 13:57:09.8516	\N	1990-12-21	214	\N
334	Hoffmann	Caleb	C	\N	\N	t	f	2018-12-24 11:47:18.994343	2018-12-24 11:47:18.994343	\N	1992-05-27	215	\N
336	Demo	Mike	P	\N	145	t	f	2019-01-07 22:54:28.995769	2019-01-07 23:00:00.903819	\N	2019-01-07	217	f
337	Samuel	Apps	N	\N	145	t	f	2019-01-07 22:56:03.241696	2019-01-08 10:07:33.767772	\N	2017-10-17	218	f
338	Nanapoland	Nanapoland	C	\N	\N	t	f	2019-01-08 10:23:53.495181	2019-01-08 10:23:53.495181	\N	2006-03-09	219	f
339	Admin	Adminqa	P	\N	339	t	f	2019-01-08 10:51:39.956574	2019-01-08 11:13:07.231735	\N	2017-07-18	220	f
340	Yamson	Enesrt	C	\N	\N	t	f	2019-01-09 14:33:23.459733	2019-01-09 14:33:23.459733	\N	2019-01-09	221	\N
341	Dela	Dela	C	\N	\N	t	f	2019-01-09 14:46:38.270401	2019-01-09 14:46:38.270401	\N	2019-01-09	222	\N
342	Testuser	Testuser	C	\N	\N	t	f	2019-01-11 09:18:52.212293	2019-01-11 09:18:52.212293	\N	2019-01-11	223	\N
335	Apps	Gloria	N	\N	145	t	f	2019-01-01 05:25:42.281524	2019-01-11 09:50:33.710842	\N	1951-12-04	216	\N
343	Testnurse	Testnurse	N	\N	\N	t	f	2019-01-11 09:59:15.023857	2019-01-11 09:59:15.023857	\N	2019-01-11	224	\N
344	Testdox	Testsox	D	\N	\N	t	f	2019-01-11 10:01:32.312062	2019-01-11 10:01:32.312062	\N	2019-01-11	225	t
345	Testpharm	Testpham	P	\N	\N	t	f	2019-01-11 10:13:01.831947	2019-01-11 10:13:01.831947	\N	2019-01-11	226	\N
346	Testphif	Teatvbhg	P	\N	\N	t	f	2019-01-11 10:15:12.45249	2019-01-11 10:15:12.45249	\N	2019-01-11	227	\N
347	Testnhh	Tesrbvg	P	\N	\N	t	f	2019-01-11 10:17:05.455019	2019-01-11 10:17:05.455019	\N	2019-01-11	228	\N
348	Lablab	Lablab	L	\N	\N	t	f	2019-01-11 10:19:22.726364	2019-01-11 10:19:22.726364	\N	2019-01-11	229	\N
349	Pad	Nursee	N	\N	158	t	f	2019-01-15 09:55:45.359567	2019-01-15 10:22:10.781195	\N	1995-01-15	230	\N
350	Nnurse	Newma	N	\N	\N	t	f	2019-01-15 10:27:19.640713	2019-01-15 10:27:19.640713	\N	1982-12-23	231	\N
351	Yebb	Nurse2	N	\N	\N	t	f	2019-01-24 13:37:13.307568	2019-01-24 13:37:13.307568	\N	1973-01-24	232	\N
352	Peepy	Nurse	N	\N	\N	t	f	2019-01-24 13:42:49.651362	2019-01-24 13:42:49.651362	\N	1983-01-24	233	\N
354	Nurse	Naa	N	\N	158	t	f	2019-01-25 16:22:02.458047	2019-01-25 16:37:02.871626	\N	1992-07-19	235	\N
353	Peepp	Nurse4	N	\N	158	t	f	2019-01-24 13:46:02.275779	2019-01-25 16:38:07.774991	\N	1972-11-18	234	\N
355	Araba	Freda	N	\N	\N	t	f	2019-01-25 19:05:56.098606	2019-01-25 19:05:56.098606	\N	1994-03-22	236	\N
356	Araba	Maame	N	\N	158	t	f	2019-01-25 19:34:39.602465	2019-01-25 19:36:51.23667	\N	1997-01-17	237	\N
322	Maame	Naa	C	\N	322	t	f	2018-09-17 17:44:51.844269	2019-01-28 13:20:58.050244	\N	1991-09-17	203	\N
357	Maame	Nurse	N	\N	158	t	f	2019-01-28 13:28:07.109928	2019-01-28 13:34:04.342946	\N	2019-06-07	238	f
\.


--
-- Name: person_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.person_infos_id_seq', 357, true);


--
-- Data for Name: person_type_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.person_type_masters (id, user_type_title, comment, entity, user_id, active_status, del_status, created_at, updated_at, ref_id) FROM stdin;
5	Patient		\N	\N	t	f	2017-11-03 10:21:38.829768	2017-11-11 21:27:13.590284	C
4	Laboratorist		\N	\N	t	f	2017-11-03 10:18:30.666444	2017-11-11 21:27:22.118388	L
3	Pharmacist		\N	\N	t	f	2017-11-03 10:11:50.305588	2017-11-11 21:27:30.88799	P
2	Nurse		\N	\N	t	f	2017-11-03 10:10:10.009859	2017-11-11 21:27:40.149662	N
1	Doctor		\N	\N	t	f	2017-11-03 09:51:40.20957	2017-11-11 21:27:47.779049	D
\.


--
-- Name: person_type_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.person_type_masters_id_seq', 8, true);


--
-- Data for Name: pre_appointments; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.pre_appointments (id, provider_id, requester_id, requester_cat, beneficiary_name, appointment_type_id, proposed_date, proposed_time, complaint_desc, prev_medical_history, req_urgency, comment, user_id, active_status, del_status, created_at, updated_at, confirm_status, src, allergies, suburb_id, has_pd, pd_name, medication, duration, test_list, beneficiary_phone_number, pre_confirm_status, beneficiary_age, beneficiary_gender, counter_view) FROM stdin;
460	7	286	S		MA	2018-08-21 00:00:00	\N	None	None	S	\N	\N	t	f	2018-08-19 22:28:56.574445	2018-08-19 23:46:45.165568	f	APP	None	3	\N	\N	\N	\N			f	\N		t
468	\N	289	T	Granny	HC	2018-08-20 15:35:00	\N	Old age	Hi	E	\N	\N	t	f	2018-08-20 15:35:23.132223	2018-08-22 17:16:21.981557	t	APP	Hello	1	\N	\N	Hello	\N		023469975	t	\N	\N	t
226	1	247	S		MA	2018-06-10 00:00:00	\N	Cough	none	S	\N	\N	t	f	2018-06-07 10:46:20.609068	2018-08-24 12:56:13.458129	t	APP		1	\N	\N	\N	\N	\N		\N	\N	\N	t
231	\N	247	S		PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-06-15 06:17:49.086026	2018-08-24 12:56:28.972317	t	APP	\N	\N	\N	\N		\N	\N		t	\N	\N	t
482	\N	300	S		HC	2018-11-07 10:00:00	\N	Waist pains	Body pains	S	\N	\N	t	f	2018-09-05 16:11:54.699368	2018-09-05 16:11:54.699368	f	APP	Pollen	2	\N	\N	Aboki balm 	\N			f	\N		\N
614	\N	325	T	Sam	PC	2018-11-25 04:00:00	\N	Anencephaly	Adhd	E	\N	\N	t	f	2018-09-25 05:54:51.508514	2018-09-25 06:04:26.083924	t	APP	Nuts \nAir \nGrains\nRice\nOther children	\N	\N	\N	Paracetamol	\N	\N	30283160	t	17	M	\N
490	\N	304	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-09-10 13:20:11.836667	2018-09-10 15:31:35.179573	t	APP	None	1	\N	\N	Coartem	\N	\N		f	\N		t
735	0	322	S		MD	\N	\N		Hshsj	S	\N	\N	t	f	2018-11-28 17:01:04.077257	2019-02-05 17:54:57.423589	t	APP	Hsjs	1	\N	\N	None	\N			f	\N	\N	t
599	\N	322	S		MD	\N	\N	\N	Dont remember	S	\N	\N	t	f	2018-09-22 21:14:20.447668	2019-02-05 17:53:06.744231	t	APP	None	1	\N	\N	Para	\N	\N		f	\N		t
506	\N	247	T	Ernest	VC	2018-09-11 13:57:00	\N	Headache	none	S	\N	\N	t	f	2018-09-11 12:56:46.084878	2018-09-11 12:56:46.084878	f	APP	none	\N	\N	\N	rooter herbal mixture	\N	\N		f	25	M	\N
567	\N	322	T	fdsa	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-09-19 15:08:10.931839	2018-09-25 10:24:09.983627	f	APP	\N	\N	\N	\N	gfdgdsgd	3	\N	0987635423	t	12	M	\N
514	\N	289	S		PC	2018-09-20 19:08:00	\N	Paddy 4	Doc4	S	\N	\N	t	f	2018-09-15 19:02:19.416855	2018-09-15 19:42:40.449739	t	APP	None	\N	\N	\N	Para	\N	\N		t	\N		\N
522	\N	272	S		PC	2018-09-21 22:48:00	\N	Headache	Pains 	S	\N	\N	t	f	2018-09-17 10:46:33.903109	2018-09-17 10:46:33.903109	f	APP	None	\N	\N	\N	None 	\N	\N		f	\N		\N
530	\N	321	S		PC	2018-09-17 12:51:00	\N	Dfsaf	Gafdsa	S	\N	\N	t	f	2018-09-17 12:48:52.783012	2018-09-17 12:50:15.088815	f	APP	Gads	\N	\N	\N	Gfad	\N	\N		t	\N		\N
538	\N	322	T	Yaw	PC	2018-09-17 09:59:00	\N	Home	Tured	E	\N	\N	t	f	2018-09-17 19:00:04.342386	2018-09-17 19:14:57.151119	t	APP	To	\N	\N	\N	Home	\N	\N	023667876	t	25	F	\N
543	\N	272	T	Ama Abebrese	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-09-18 14:16:37.093625	2018-09-18 14:17:59.582109	f	APP	\N	\N	\N	\N	Anaemia 	5	\N	0205869653	t	\N	\N	\N
551	\N	322	T	Naa	PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-09-18 19:26:08.732641	2018-09-18 19:26:08.732641	f	APP	\N	\N	\N	\N	Para	20	\N	0203443235	f	32	F	\N
559	\N	325	S		PDHC	2018-09-18 20:22:00	\N	Sirrhosn	List 	S	Dor ot 	258	t	f	2018-09-18 20:22:50.532999	2018-09-18 20:22:50.532999	f	APP	Nka 	1	\N	\N	\N	\N			f	\N	\N	\N
574	\N	272	T	Andrew	PDHC	2018-09-26 23:33:00	\N	Broken heart	None	E	\N	\N	t	f	2018-09-19 18:28:49.839332	2018-09-19 18:28:49.839332	f	APP	Broken heart	1	\N	\N	None	\N		0244124578	f	27	M	\N
623	1	272	S		MA	2018-09-27 08:25:00	\N	Bathing 	Bathing 	S	\N	\N	t	f	2018-09-27 08:21:59.162996	2018-09-27 08:37:59.628216	t	APP	Bathing 	1	\N	\N	\N	\N			f	\N		t
773	\N	322	S		PDVC	2018-12-11 18:15:00	\N	Gh	Po	S	\N	\N	t	f	2018-12-11 18:15:12.69116	2019-02-05 18:08:25.261576	t	APP	Or	\N	\N	\N	Why	\N	\N		t	\N		t
795	\N	322	S		PDHC	2018-12-13 12:12:00	\N	No	On	S	\N	\N	t	f	2018-12-13 12:12:42.150899	2019-02-05 18:10:54.072635	t	APP	No	1	\N	\N	No	\N			t	\N		t
582	\N	322	T	Mommie	VC	2018-09-20 08:54:00	\N	Check up	None	E	\N	\N	t	f	2018-09-20 08:54:04.638039	2019-02-05 18:06:54.315341	t	APP	None	\N	\N	\N	None	\N	\N	0203877386	t	26	F	t
637	\N	257	S		MD	\N	\N	\N	Diabetes 	S	\N	\N	t	f	2018-09-28 12:21:41.944493	2018-09-28 15:39:09.981562	t	APP	 Nka	1	\N	\N	Para	\N	\N		f	\N		t
742	3	329	S		MA	2018-12-04 15:30:00	\N	Personal	None	E	\N	\N	t	f	2018-12-02 23:10:57.498159	2018-12-03 01:03:23.388361	t	APP	None	2	\N	\N		\N			f	\N	\N	\N
719	0	322	S		MD	\N	\N		None	S	\N	\N	t	f	2018-11-28 12:48:56.200593	2018-12-04 17:37:20.336766	t	APP	None	1	\N	\N	None	\N			f	\N	\N	t
749	\N	322	T	Naa	MD	\N	\N	\N	No	S	\N	\N	t	f	2018-12-06 18:30:12.348986	2018-12-06 18:30:12.348986	f	APP	No	1	\N	\N	Hi	\N	\N	8208622333	f	54	F	\N
757	\N	322	S		LA	2018-12-10 17:58:00	\N	\N	Gfgy	S	\N	\N	t	f	2018-12-10 18:09:49.940245	2018-12-10 18:09:49.940245	f	APP	Ytuu	1	\N	\N	\N	\N			f	\N		\N
606	\N	257	S		MD	\N	\N	\N	Diabetes 	E	\N	\N	t	f	2018-09-24 20:21:40.610923	2018-11-12 23:13:00.969892	t	APP	Not know 	1	\N	\N	Para	\N	\N		f	\N		\N
665	\N	139	S		MD	\N	\N	\N	Vh	S	\N	\N	t	f	2018-11-13 01:24:37.056139	2018-11-13 01:26:59.147008	t	APP	Gh	1	\N	\N	Tje	\N	\N		f	\N		\N
498	\N	304	S		PDHC	2018-09-10 22:59:00	\N	Tummy	No	S	\N	\N	t	f	2018-09-10 17:59:34.308516	2018-09-10 18:39:37.102196	f	APP	No	1	\N	\N	No	\N			t	\N		t
676	\N	139	S		MD	\N	\N	\N	Heh	S	\N	\N	t	f	2018-11-13 07:43:08.201006	2018-11-13 07:43:41.231691	t	APP	Heh	1	\N	\N	Tje	\N	\N		f	\N		\N
824	\N	257	T	Kofi	PDHC	2018-12-18 08:53:00	\N	 	Diabetes 	S	\N	\N	t	f	2018-12-14 08:53:08.760215	2018-12-14 10:24:39.028098	t	APP	Non	1	\N	\N	Paracetamol 	\N		852369	t	45	M	\N
598	8	322	T	Naa	MA	2018-09-22 01:40:00	\N	No medical problem	Previous medical 	E	\N	\N	t	f	2018-09-22 13:40:12.111981	2019-02-05 17:52:34.680002	t	APP	Allergies	1	\N	\N	\N	\N		0203555336	f	23	F	t
765	\N	322	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-12-11 17:38:49.797686	2018-12-11 18:37:37.761162	t	APP	None	1	\N	\N	Hi	\N	\N		f	\N		t
803	\N	330	S		HC	2018-12-16 15:46:00	\N	Sleeping 	None	S	\N	\N	t	f	2018-12-13 13:43:28.380031	2018-12-13 17:45:36.937802	t	APP	None	1	\N	\N	Colosium	\N			t	\N		\N
656	\N	139	S		MD	\N	\N	\N	Fgg	S	\N	\N	t	f	2018-11-12 15:45:45.823862	2018-11-13 17:12:39.049134	t	APP		1	\N	\N	Paracetamol	\N	\N		f	\N		\N
685	\N	139	S		MD	\N	\N	\N	Thev	S	\N	\N	t	f	2018-11-14 12:46:25.630267	2018-11-14 12:48:46.048637	t	APP		1	\N	\N	The man 	\N	\N		f	\N		\N
590	\N	322	T	Mommie	PDHC	2018-09-20 09:32:00	\N	None	None	E	\N	\N	t	f	2018-09-20 09:32:12.690432	2019-02-05 18:09:54.576317	t	APP	None	1	\N	\N	None	\N		0248473920	t	40	F	t
633	1	272	T	Jude	MA	2018-09-27 10:10:00	\N	Noted	Noted	E	\N	\N	t	f	2018-09-27 10:10:48.362552	2018-11-15 17:46:56.973191	t	APP	Noted 	1	\N	\N	\N	\N		0279454112	f	26	M	\N
644	5	322	S		MA	2018-10-12 18:43:00	\N	fdsajk	fdsakj	S	\N	\N	t	f	2018-10-10 18:43:24.611544	2018-11-20 19:04:51.007809	t	APP	fisdak	3	\N	\N	\N	\N			f	\N		t
692	1	322	S		MA	2018-11-22 22:57:00	\N	New gh	None	S	\N	\N	t	f	2018-11-22 20:58:59.448899	2018-11-22 20:58:59.448899	f	APP		1	\N	\N	\N	\N			f	\N		\N
700	\N	322	S		PC	2018-11-23 11:38:00	\N	Fdsaf	Gda	S	\N	\N	t	f	2018-11-23 11:38:34.438367	2018-11-23 11:38:34.438367	f	APP	Gdas	\N	\N	\N		\N			f	\N		\N
710	0	289	T	Naa	HC	2018-11-23 15:30:00	\N	None	None	E	\N	\N	t	f	2018-11-23 18:36:05.615545	2018-11-23 18:36:05.615545	f	APP	None	1	\N	\N	None	\N		0208622333	f	25	1	\N
727	\N	322	T	Naa	PDVC	2018-11-28 15:30:00	\N	No	No	S	\N	\N	t	f	2018-11-28 12:59:09.06068	2019-02-05 18:08:30.188961	t	APP	No	\N	\N	\N	Non	\N		027555589	t	18	M	t
781	4	322	T	Dora	MA	2019-01-13 11:15:00	\N	Please	List	E	\N	\N	t	f	2018-12-13 11:15:14.737202	2018-12-13 12:17:20.860035	t	APP	Allergies	1	\N	\N	\N	\N		0205832563	f	22	F	t
817	\N	257	S		PC	2018-12-20 08:28:00	\N	Diabetes 	Diabetes 	S	\N	\N	t	f	2018-12-14 08:25:05.779941	2018-12-14 10:25:04.082722	t	APP	None 	\N	\N	\N	Paracetamol 	\N	\N		t	\N		\N
810	8	257	S		MA	2018-12-23 01:24:00	\N	Ghb	Diabetes 	S	\N	\N	t	f	2018-12-14 00:15:23.216542	2018-12-14 00:17:50.691092	t	APP	None 	1	\N	\N	\N	\N			f	\N		t
844	\N	257	S		LA	2018-12-15 10:38:00	\N	\N	Diab	S	\N	\N	t	f	2018-12-15 10:38:04.930823	2018-12-15 10:39:21.320191	t	APP	Non	1	\N	\N	\N	\N	Urine 		f	\N		\N
830	\N	257	S		LA	2018-12-17 17:37:00	\N	\N	Diabetes 	S	\N	\N	t	f	2018-12-14 17:37:59.553933	2018-12-14 17:56:39.173964	t	APP	None 	1	\N	\N	\N	\N	Urine		f	\N		\N
837	\N	257	S		PC	2018-12-15 07:42:00	\N	Headaches 	Diab	S	\N	\N	t	f	2018-12-15 07:42:19.894396	2018-12-15 10:57:40.374867	t	APP	Non	\N	\N	\N	Para	\N	\N		t	\N		\N
238	1	254	S		MA	2018-06-15 12:38:00	\N	Health	Heath	S	\N	\N	t	f	2018-06-15 12:38:29.819441	2018-06-15 12:38:29.819441	f	APP	None	1	\N	\N	\N	\N	\N		f	\N	\N	f
244	1	251	T	Yaw	MA	2018-06-18 10:53:00	\N	Ill	Ill	S	\N	\N	t	f	2018-06-18 10:52:01.70434	2018-06-18 10:52:01.70434	f	APP	Ill	1	\N	\N	\N	\N	\N	0266123456	f	\N	\N	f
857	\N	330	S		HC	2018-12-23 17:56:00	\N	Love	None	S	\N	\N	t	f	2018-12-21 17:54:04.623851	2018-12-21 17:56:17.73717	f	APP	None	1	\N	\N	Nope	\N			t	\N		\N
864	\N	257	S		PC	2018-12-22 10:46:00	\N	Diab	Pmil\nDian\nAssim\nProb	S	\N	\N	t	f	2018-12-22 10:46:55.489689	2018-12-22 10:46:55.489689	f	APP	Two non	\N	\N	\N	Pmol\nPml\nPmml\nPmoool\n	\N	\N		f	\N		\N
871	\N	331	S		VC	2018-12-22 11:58:00	\N	Test	Test	S	\N	\N	t	f	2018-12-22 11:59:04.205226	2018-12-22 11:59:04.205226	f	APP	Test	\N	\N	\N	Test	\N	\N		f	\N		\N
878	\N	322	S		VC	2018-12-28 12:29:00	\N	Non	Non\n	S	\N	\N	t	f	2018-12-28 12:29:29.010728	2018-12-28 12:29:29.010728	f	APP	No	\N	\N	\N	Nom	\N	\N		f	\N		\N
884	\N	322	S		MD	\N	\N	\N	Cough and catarrh	S	\N	\N	t	f	2019-01-02 14:23:36.64623	2019-01-02 14:31:17.755975	t	APP	Nill	1	\N	\N	None 	\N	\N		f	\N		t
897	\N	338	T	kofi 	PD	\N	\N			S	\N	\N	t	f	2019-01-08 10:41:46.978739	2019-01-08 10:41:46.978739	f	WEB		4	t	dranas		\N	\N	-36	f	\N	\N	\N
890	\N	330	S		MD	\N	\N	\N	Benelyn	S	\N	\N	t	f	2019-01-03 11:00:07.070087	2019-01-03 11:02:52.60007	t	APP	Benelyn	1	\N	\N	None	\N	\N		f	\N		t
903	\N	342	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2019-01-11 09:21:20.635558	2019-01-11 09:21:20.635558	f	APP	\N	3	t		\N	\N	\N	\N	f	\N	\N	\N
907	5	342	S		MA	2019-01-11 09:28:00	\N	Headache	Cold	S	\N	\N	t	f	2019-01-11 09:28:17.815619	2019-01-11 09:28:17.815619	f	APP	Dust	3	\N	\N	\N	\N			f	\N		\N
441	9	286	T	Enam	MA	2018-08-21 00:00:00	\N	Headache 	None	S	\N	\N	t	f	2018-08-17 12:24:06.778942	2018-08-19 23:54:51.560577	t	APP	None	3	\N	\N	\N	\N			f	15	F	t
469	8	290	S		MA	2018-09-21 09:20:00	\N	Headaches	Back pains	S	\N	\N	t	f	2018-08-20 15:49:54.617028	2018-08-20 17:12:54.239405	t	APP	Pollen,dust	1	\N	\N	\N	\N			f	\N		t
322	\N	247	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-07-23 12:55:16.798259	2018-08-24 15:14:24.79227	t	APP	none	\N	\N	\N	none	\N	\N		f	\N	\N	t
483	\N	300	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-09-05 16:18:09.214523	2018-09-05 16:18:09.214523	f	APP	\N	2	t	Doc padmore	\N	\N	\N	\N	f	\N	\N	\N
491	\N	304	S		LA	2018-09-10 16:20:00	\N	\N	None	S	\N	\N	t	f	2018-09-10 13:23:27.934175	2018-09-10 15:31:47.610035	t	APP	None	1	\N	\N	\N	\N	Blood count		f	\N		t
728	0	322	S		PDHC	2018-11-28 15:30:00	\N	Non	None	S	\N	\N	t	f	2018-11-28 13:01:24.744657	2018-11-28 13:56:43.743411	f	APP	None	1	\N	\N	None	\N			t	\N	\N	\N
750	\N	322	S		LA	2018-12-06 18:34:00	\N	\N	None	S	\N	\N	t	f	2018-12-06 18:35:31.948739	2019-02-05 17:57:42.940564	t	APP	Nome	1	\N	\N	\N	\N	Hi		f	\N		t
499	\N	304	S		PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-09-10 18:01:14.134815	2018-09-10 18:40:00.214273	t	APP	\N	\N	\N	\N	Coartem	14	\N		t	\N	\N	t
507	\N	307	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-09-13 18:14:02.13491	2018-09-13 18:14:02.13491	f	APP	\N	1	t		\N	\N	\N	\N	f	\N	\N	\N
616	\N	325	T	Sam	PDHC	2018-12-30 18:11:00	\N	Ill	None	E	\N	\N	t	f	2018-09-25 06:05:18.004556	2018-09-25 06:28:58.940076	t	APP	All	1	\N	\N	Everything help me	\N		699073279	t	17	M	t
515	\N	289	S		PC	2018-09-20 19:08:00	\N	Paddy 4	Doc4	S	\N	\N	t	f	2018-09-15 19:02:39.124677	2018-09-15 19:38:49.437711	t	APP	None	\N	\N	\N	Para	\N	\N		t	\N		\N
523	\N	272	S		PC	2018-09-21 22:48:00	\N	Headache	Pains 	S	\N	\N	t	f	2018-09-17 10:48:00.886311	2018-09-17 12:44:05.228808	f	APP	None	\N	\N	\N	None 	\N	\N		t	\N		\N
383	\N	276	S		LA	2018-08-09 14:26:00	\N	\N	Diabets	E	\N	\N	t	f	2018-08-09 14:27:09.548074	2018-11-28 18:16:38.134624	t	APP	Dabetes	1	\N	\N	\N	\N	Facw\nFwst\n\nFace\nFeet\nAhoes		f	\N	\N	f
531	1	322	T	Me	MA	2018-09-18 17:53:00	\N	Stomach aches	Headaches	S	\N	\N	t	f	2018-09-17 17:53:36.618315	2018-09-17 18:31:53.32089	t	APP	Ion	1	\N	\N	\N	\N		0248643246	f	30	F	t
568	\N	322	S		PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-09-19 15:20:21.986093	2018-09-25 10:25:02.568337	f	APP	\N	\N	\N	\N	Money	9	\N		t	\N		\N
539	\N	272	S		PDVC	2018-12-25 12:00:00	\N	Clemence is annoying	Clemence is stubborn 	E	\N	\N	t	f	2018-09-17 19:00:41.389574	2018-09-18 14:23:50.892284	t	APP	Clemence is very annoying 	\N	\N	\N	Clemence 	\N	\N		t	\N		\N
552	\N	322	S		PC	2018-09-20 19:29:00	\N	Farting	None	S	\N	\N	t	f	2018-09-18 19:27:33.528782	2018-09-18 19:27:33.528782	f	APP	None	\N	\N	\N	None	\N	\N		f	\N		\N
560	\N	272	S		PDHC	2018-09-25 09:33:00	\N	Feverish	None	S	\N	\N	t	f	2018-09-19 08:33:57.352883	2018-09-19 08:33:57.352883	f	APP	None	1	\N	\N	Paracetamol	\N			f	\N		\N
624	\N	272	T	Clara	MD	\N	\N	\N	Dancer	S	\N	\N	t	f	2018-09-27 08:23:53.151949	2018-09-27 08:36:38.857739	t	APP	Dancer	1	\N	\N	Dancer	\N	\N	0279454773	f	21	F	\N
583	\N	322	S		HC	2018-09-20 08:59:00	\N	Pregnant 	None	S	\N	\N	t	f	2018-09-20 08:59:39.615433	2019-02-05 18:17:35.887158	t	APP	None	1	\N	\N	None	\N			t	\N		t
607	\N	257	S		VC	2018-09-24 20:33:00	\N	Headaches 	Diabetee 	S	\N	\N	t	f	2018-09-24 20:33:54.608283	2018-11-29 11:42:23.79102	t	APP	Nka	\N	\N	\N	Nifep	\N	\N		t	\N		\N
638	\N	257	T	Kofi mensak	MD	\N	\N	\N	Headache 	S	\N	\N	t	f	2018-09-28 12:27:22.661627	2018-09-28 15:39:06.771308	t	APP	Nka	1	\N	\N	Paracetamol 	\N	\N	756238	f	45	M	t
634	\N	322	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-09-27 16:14:28.149092	2018-10-15 12:28:21.859463	t	APP	None	1	\N	\N	Para	\N	\N		f	\N		t
600	\N	322	T	Naa	LA	2018-09-24 09:30:00	\N	\N	None	E	\N	\N	t	f	2018-09-22 21:28:27.507872	2018-10-24 10:37:01.259976	t	APP	None	1	\N	\N	\N	\N	Blood count	0542344456	f	32	F	t
693	1	322	S		MD	2018-11-22 21:06:00	\N	Medication trial	Prev med host 1	S	\N	\N	t	f	2018-11-22 21:06:50.169587	2019-02-05 17:54:44.37391	t	APP	Allergy1	1	\N	\N	\N	\N			f	\N		t
544	\N	272	S		MD	\N	\N	\N	Headache, body pains	S	\N	\N	t	f	2018-09-18 14:22:10.74781	2018-11-12 23:17:49.253974	t	APP	Headache for days now 	1	\N	\N	Malaria	\N	\N		f	\N		\N
666	\N	139	S		MD	\N	\N	\N	Vsh	S	\N	\N	t	f	2018-11-13 01:25:22.515063	2018-11-13 01:26:11.130161	t	APP	Gdj	1	\N	\N	Tjd	\N	\N		f	\N		\N
677	\N	139	S		MD	\N	\N	\N	Fhc	S	\N	\N	t	f	2018-11-13 07:46:39.634916	2018-11-13 07:46:58.02605	t	APP	Rhf	1	\N	\N	The	\N	\N		f	\N		\N
686	\N	139	S		MD	\N	\N	\N	Vzbxb	E	\N	\N	t	f	2018-11-14 12:47:47.04836	2018-11-14 12:54:31.136154	t	APP		1	\N	\N	Hsjj	\N	\N		f	\N		\N
657	\N	139	S		PDDP	\N	\N	\N	None\n  	S	\N	\N	t	f	2018-11-12 16:13:32.869834	2018-11-15 08:36:11.844255	f	APP		\N	\N	\N	Tramadol, cloroquine 	5	\N		t	5	M	\N
575	8	322	T	Ayeley	MA	2018-09-20 08:44:00	\N	Eye 	Pressure	E	\N	\N	t	f	2018-09-20 08:44:52.926553	2018-12-13 12:26:34.520009	t	APP	Dust	1	\N	\N	\N	\N		0203443235	f	26	F	t
701	\N	322	S		PDVC	2018-11-23 11:55:00	\N	Gdsa	Gdasga	S	\N	\N	t	f	2018-11-23 11:55:58.914042	2018-11-23 11:55:58.914042	f	APP	Hrwada	\N	\N	\N	Gda	\N			f	\N		\N
711	\N	289	S		PC	2018-11-23 15:30:00	\N	None	None	S	\N	\N	t	f	2018-11-23 18:37:09.905502	2018-11-23 18:37:09.905502	f	APP	None	\N	\N	\N	None	\N			f	\N		\N
720	0	322	T	Maa	MD	\N	\N		None	E	\N	\N	t	f	2018-11-28 12:50:29.435443	2019-02-05 17:54:53.573134	t	APP	None	1	\N	\N	None	\N		0202434566	f	10	F	t
743	0	257	S		MD	\N	\N		Diabetes 	S	\N	\N	t	f	2018-12-03 01:35:05.774052	2018-12-03 01:50:03.528191	t	APP	None	2	\N	\N	Paracetamol, trimptk.	\N			f	\N	\N	\N
831	\N	322	S		VC	2018-12-14 17:42:00	\N	None	None	S	\N	\N	t	f	2018-12-14 17:42:54.847922	2019-02-05 18:05:56.893794	t	APP	None	\N	\N	\N	None	\N	\N		t	\N		t
758	\N	322	S		LA	2018-12-10 17:58:00	\N	\N	Gfgy	S	\N	\N	t	f	2018-12-10 18:13:00.121946	2018-12-10 18:13:00.121946	f	APP	Ytuu	1	\N	\N	\N	\N			f	\N		\N
645	\N	322	S		MD	\N	\N	\N	ijhs gfdagd	S	\N	\N	t	f	2018-10-15 15:03:13.22577	2019-02-05 17:53:10.37006	t	APP	gheagad	1	\N	\N	gdsafsda	\N	\N		f	\N		t
766	\N	322	T	Nii	MD	\N	\N	\N	No	E	\N	\N	t	f	2018-12-11 17:42:36.52032	2018-12-11 18:31:04.807286	t	APP	No	1	\N	\N		\N	\N	0208622333	f	29	M	t
796	\N	322	S		PDDP	\N	\N	\N	Provide	S	\N	\N	t	f	2018-12-13 12:14:29.471035	2018-12-13 12:15:47.483078	f	APP	Us	\N	\N	\N	List	14	\N		t	\N		\N
780	1	322	S		MA	2018-12-13 11:04:00	\N	Please	List	S	\N	\N	t	f	2018-12-13 11:03:37.174633	2018-12-13 12:25:32.368497	t	APP	Allergies	1	\N	\N	\N	\N			f	\N		t
838	\N	257	S		PDVC	2018-12-15 07:42:00	\N	Headaches 	Diab	S	\N	\N	t	f	2018-12-15 07:43:07.141388	2018-12-15 07:43:07.141388	f	APP	None	\N	\N	\N	Para	\N	\N		f	\N		\N
804	\N	330	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-12-13 13:57:35.827193	2018-12-13 14:28:54.642715	t	APP	\N	1	t	Dr. Frank	\N	\N	\N	\N	t	\N	\N	\N
811	\N	257	S		MD	\N	\N	\N	Diabetes	S	\N	\N	t	f	2018-12-14 00:21:29.646207	2018-12-14 00:26:33.150514	t	APP	None 	1	\N	\N	Paracet	\N	\N		f	\N		\N
818	\N	331	S		MD	\N	\N	\N	Feeling lazy. Can i just upload my folder ?	S	\N	\N	t	f	2018-12-14 08:26:28.131852	2018-12-14 08:26:28.131852	f	APP	None	2	\N	\N	Para	\N	\N		f	\N		\N
825	\N	257	S		PDDP	\N	\N	\N	Diabetes 	S	\N	\N	t	f	2018-12-14 09:20:04.509981	2018-12-14 10:24:19.640932	t	APP	None 	\N	\N	\N	Paracetamol 	7	\N		t	\N		\N
845	\N	257	S		MD	\N	\N	\N	Diabetes \nHypertensiokn\nDinanestl\nRenal \nbike	S	\N	\N	t	f	2018-12-15 19:06:23.276417	2018-12-19 11:32:45.016578	t	APP	Nome 	1	\N	\N	Pracrt\nPoblem\nDiabox\nBeeco	\N	\N		f	\N		\N
774	\N	322	T	None	PDVC	2018-12-11 18:16:00	\N	One	Non	S	\N	\N	t	f	2018-12-11 18:17:02.812152	2019-02-05 18:08:20.579487	t	APP	Nw	\N	\N	\N	Noi	\N	\N	0256243484	t	23	F	t
245	\N	251	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-06-18 10:53:09.357441	2018-06-18 10:53:09.357441	f	APP	\N	1	t	Dr Frank	\N	\N	\N	\N	f	\N	\N	f
376	\N	276	T	Yeet	PDHC	2018-08-09 13:17:00	\N	Dead	Death	E	\N	\N	t	f	2018-08-09 13:18:26.593903	2018-08-09 13:25:12.141502	t	APP	Nuts	\N	\N	\N	Cozart	\N			t	\N	\N	f
851	\N	330	S		LA	2018-12-24 17:15:00	\N	\N	None	S	\N	\N	t	f	2018-12-20 17:13:49.122271	2018-12-20 17:42:50.247992	t	APP	None	1	\N	\N	\N	\N	Love		f	\N		\N
178	\N	193	S		HC	2018-05-08 18:03:00	\N	None	None	S	\N	\N	t	f	2018-05-08 18:03:03.312292	2018-06-06 13:58:42.336593	t	APP	None	2	\N	\N	None	\N	\N	\N	f	\N	\N	f
161	\N	159	S		HC	2018-05-02 19:53:00	\N	Pla	No 	E	\N	\N	t	f	2018-05-02 19:53:50.361661	2018-06-20 01:03:39.168493	t	APP	Pat	2	\N	\N	Nin	\N	\N	\N	f	\N	\N	f
166	\N	212	\N	\N	PD	\N	\N	\N	Diab	\N	\N	\N	t	f	2018-05-04 13:49:11.116662	2018-08-09 19:25:21.931795	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
858	5	331	S		MA	2019-11-21 19:23:00	\N	Very bad	Headache	S	\N	\N	t	f	2018-12-21 19:23:25.380486	2018-12-21 19:23:25.380486	f	APP	Dust	3	\N	\N	\N	\N			f	\N		\N
865	\N	257	T	Koci	PDVC	2018-12-22 10:48:00	\N	Diab 	Pmol\nPmli\nMilll\n	S	\N	\N	t	f	2018-12-22 10:49:03.160305	2018-12-22 10:49:03.160305	f	APP	Nin	\N	\N	\N	Time \nTii\nTrill\nTotol	\N	\N		f	4569258	M	\N
879	\N	322	S		MD	\N	\N	\N	Ni	S	\N	\N	t	f	2018-12-28 12:31:58.327975	2018-12-28 12:31:58.327975	f	APP	No	1	\N	\N	Mo	\N	\N		f	\N		\N
885	\N	322	S		MD	\N	\N	\N	Love	S	\N	\N	t	f	2019-01-02 14:51:19.957723	2019-01-02 14:54:46.969715	t	APP	Pain	1	\N	\N	Headache	\N	\N		f	\N		t
891	\N	330	T	Nii	MD	\N	\N	\N	Nou	E	\N	\N	t	f	2019-01-03 11:01:47.813702	2019-01-03 11:04:05.442002	t	APP	None	1	\N	\N	Para	\N	\N	0208622333	f	12	M	\N
898	\N	339	S		LA	2019-01-08 11:14:00	\N		<p>gnfngfnfg</p>	S	\N	\N	t	f	2019-01-08 11:14:59.361997	2019-01-08 11:14:59.361997	f	WEB	<p>nfgngfngfngfngfngfngfng</p>	3	f			\N	\N		f	\N	\N	\N
787	\N	322	T	Ni	VC	2018-12-13 11:49:00	\N	Please	Lost	E	\N	\N	t	f	2018-12-13 11:49:41.871619	2019-02-05 18:06:00.503227	t	APP	Allergies	\N	\N	\N	List	\N	\N	0205869653	t	21	F	t
591	\N	322	S		PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-09-20 10:33:37.94935	2019-02-05 18:13:25.892573	t	APP	\N	\N	\N	\N	Para	\N	\N		t	\N		t
872	\N	331	S		HC	2018-12-22 12:01:00	\N	Tesr	Test	S	\N	\N	t	f	2018-12-22 12:01:05.773804	2019-01-28 14:08:03.061407	t	APP	Test	3	\N	\N	Test	\N			t	\N		\N
326	\N	247	S		LA	2018-07-23 13:03:00	\N	\N	none	S	\N	\N	t	f	2018-07-23 13:37:01.450685	2018-08-20 00:02:42.570791	t	APP	none	\N	\N	\N	\N	\N	none		f	\N	\N	t
277	\N	257	S		LA	2018-06-28 11:14:00	\N	\N	Dm	E	\N	\N	t	f	2018-06-28 11:14:31.068394	2018-09-24 20:21:58.927077	t	APP	None 	2	\N	\N	\N	\N	Urine test 		f	\N	\N	t
470	\N	290	S		MD	\N	\N	\N	Serious headaches	S	\N	\N	t	f	2018-08-20 15:53:26.158086	2018-08-20 17:13:31.725511	t	APP	Dust and pollen	1	\N	\N	Panadol	\N	\N		f	\N		t
476	4	289	S		MA	2018-08-28 15:23:00	\N	Medical problems	Previous	S	\N	\N	t	f	2018-08-27 15:23:55.38412	2018-08-27 15:23:55.38412	f	APP	Allergies	1	\N	\N	\N	\N			f	\N		\N
357	5	272	T	Andrew T	MA	2018-08-31 12:59:00	\N	Singing 	Singjng	E	\N	\N	t	f	2018-08-08 17:59:07.684651	2018-09-06 12:28:48.77065	t	APP	Singing	3	\N	\N	\N	\N	\N	0504899386	f	\N	\N	t
553	8	325	S		MA	2018-12-25 18:50:00	\N	Weak-kneed	Weak elbows	E	\N	\N	t	f	2018-09-18 19:42:39.118871	2018-09-25 05:46:01.690023	t	APP	N/a	1	\N	\N	\N	\N			f	\N		t
492	\N	304	S		VC	2018-09-10 17:26:00	\N	None	None	S	\N	\N	t	f	2018-09-10 13:27:08.980571	2018-09-10 16:32:30.829738	t	APP	None	\N	\N	\N	None	\N	\N		t	\N		t
500	\N	304	S		MA	2018-10-10 08:38:00	\N	Ha	La	E	Oh	303	t	f	2018-09-10 18:38:33.969509	2018-09-10 18:38:33.969509	f	APP	Lo	\N	\N	\N	\N	\N			f	\N	\N	\N
508	\N	309	S		PD	\N	\N			S	\N	\N	t	f	2018-09-13 18:30:06.736154	2018-09-13 18:30:06.736154	f	WEB		1	f			\N	\N		f	\N	\N	\N
516	\N	289	S		PDVC	2018-11-15 07:06:00	\N	Out of ideas	Idk	E	\N	\N	t	f	2018-09-15 19:06:46.428653	2018-09-15 19:15:31.53962	f	APP	None	\N	\N	\N	Forgotten	\N	\N		t	\N		\N
524	\N	272	S		PC	2018-09-21 22:48:00	\N	Headache	Pains 	S	\N	\N	t	f	2018-09-17 10:48:10.076107	2018-09-17 12:15:53.292357	f	APP	None	\N	\N	\N	None 	\N	\N		t	\N		\N
532	\N	322	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-09-17 17:55:11.954827	2018-09-17 18:32:12.68578	t	APP	Ion	1	\N	\N	Paracetamol	\N	\N		f	\N		t
712	\N	289	S		PDVC	2018-11-23 15:30:00	\N	None	None	S	\N	\N	t	f	2018-11-23 21:42:10.942913	2018-11-23 21:42:10.942913	f	APP	None	\N	\N	\N	None	\N			f	\N		\N
540	\N	322	S		PDVC	2018-09-20 07:00:00	\N	Home	Home	S	\N	\N	t	f	2018-09-17 19:00:54.377093	2018-09-17 19:18:44.759509	t	APP	Home	\N	\N	\N	Para	\N	\N		t	\N		t
617	\N	325	T	Sam	PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-09-25 06:07:02.373867	2018-09-25 06:28:41.95291	t	APP	\N	\N	\N	\N	Allll	\N	\N	268006543	t	18	M	t
601	\N	322	T	Hi	VC	2018-09-24 09:30:00	\N	Nkh	Bhb	E	\N	\N	t	f	2018-09-22 21:33:17.782248	2018-09-25 10:12:59.31491	f	APP	Bbb	\N	\N	\N	Vvv	\N	\N	0575554444	t	64	M	\N
561	\N	322	S		PDHC	2018-09-22 09:38:00	\N	Medical	Appointment	S	\N	\N	t	f	2018-09-19 09:38:53.481328	2018-09-19 09:38:53.481328	f	APP	Home care	1	\N	\N	Para	\N			f	\N		\N
545	\N	322	T	Naa	HC	2018-09-19 07:29:00	\N	Medical appointment	Captain planet	S	\N	\N	t	f	2018-09-18 17:30:08.475357	2018-09-19 15:28:22.789508	t	APP	No allergies	1	\N	\N	Para	\N		0203443235	t	30	F	t
569	\N	322	T	Paddy	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-09-19 15:21:29.048855	2018-09-25 10:19:57.0484	f	APP	\N	\N	\N	\N	Sleep	3	\N	0541876489	t	30	M	\N
729	0	322	T	Ama	PDHC	2018-12-28 07:30:00	\N	None	None	E	\N	\N	t	f	2018-11-28 13:22:57.93137	2018-11-28 13:56:26.135432	f	APP	None	1	\N	\N	None	\N		0541277822	t	16	F	\N
625	\N	272	T	Jerry 	LA	2018-09-27 08:25:00	\N	\N	Stress	S	\N	\N	t	f	2018-09-27 08:25:15.441473	2018-09-27 08:37:11.873267	t	APP	Stress	1	\N	\N	\N	\N	Stress	0205869653	f	28	M	\N
635	\N	272	T	Padmore	MD	\N	\N	\N	Vitamin c	S	\N	\N	t	f	2018-09-27 16:18:02.264088	2018-09-27 16:18:41.778021	t	APP	Vitamin c	1	\N	\N	Vitamin c	\N	\N	0279454771	f	26	M	\N
797	\N	322	T	No	PDDP	\N	\N	\N	List	E	\N	\N	t	f	2018-12-13 12:15:16.281195	2019-02-05 18:11:41.549979	t	APP	List	\N	\N	\N	List	5	\N	0548247981	t	23	M	t
639	\N	257	S		LA	2018-09-28 12:32:00	\N	\N	Dm	E	\N	\N	t	f	2018-09-28 12:33:00.057242	2018-09-28 15:39:37.124638	t	APP	Nka	1	\N	\N	\N	\N	Tests for diabetes 		f	\N		t
782	\N	322	S		MD	\N	\N	\N	Please	S	\N	\N	t	f	2018-12-13 11:18:03.007575	2019-02-05 17:55:58.288379	t	APP	Let	1	\N	\N	Hi	\N	\N		f	\N		t
239	\N	254	S		MD	\N	\N	\N	Ok	S	\N	\N	t	f	2018-06-15 12:41:38.70183	2018-11-13 00:47:06.930232	t	APP	None	1	\N	\N	None	\N	\N		t	\N	\N	f
667	\N	139	S		MD	\N	\N	\N	Hrhh	S	\N	\N	t	f	2018-11-13 01:29:02.226838	2018-11-13 01:31:12.7292	t	APP	Rhh	1	\N	\N	Thhev	\N	\N		f	\N		\N
678	\N	139	S		MD	\N	\N	\N	dhb	S	\N	\N	t	f	2018-11-13 07:48:44.203282	2018-11-13 07:49:12.382994	t	APP		1	\N	\N	Tje	\N	\N		f	\N		\N
687	\N	139	T	SM	MD	\N	\N	\N	Tjen	S	\N	\N	t	f	2018-11-14 13:01:01.146989	2018-11-14 13:01:29.623488	t	APP		1	\N	\N	Theb	\N	\N	0245118823	f	23	M	\N
658	\N	139	S		PDDP	\N	\N	\N	None	S	\N	\N	t	f	2018-11-12 16:16:03.470096	2018-11-15 08:34:07.639363	f	APP	None	\N	\N	\N	Mara	5	\N		t	\N		\N
694	1	322	S		MA	2018-11-22 22:45:00	\N	Med1		S	\N	\N	t	f	2018-11-22 22:45:23.044565	2018-11-22 22:45:23.044565	f	APP	Allerg	1	\N	\N		\N			f	\N		\N
702	0	322	S		PDHC	2018-11-23 12:25:00	\N	Yugihjklj	Erdfghj	S	\N	\N	t	f	2018-11-23 12:25:42.25138	2018-11-23 12:25:42.25138	f	APP		1	\N	\N		\N			f	\N		\N
592	\N	322	T	Mommie	PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-09-20 10:34:23.961645	2018-11-23 13:07:34.445749	t	APP	\N	\N	\N	\N	Para	1	\N	0293467766	t	25	F	t
608	\N	257	S		PC	2018-09-24 20:39:00	\N	Drinking 	Bo	E	\N	\N	t	f	2018-09-24 20:39:57.074557	2018-11-29 11:45:20.00816	t	APP	Nka	\N	\N	\N	Nife	\N	\N		t	\N		\N
832	\N	322	S		LA	2018-12-14 17:47:00	\N	\N	None	S	\N	\N	t	f	2018-12-14 17:45:27.047794	2018-12-14 17:45:27.047794	f	APP	None	1	\N	\N	\N	\N	None		f	\N		\N
744	0	257	S		LA	2018-12-03 19:30:00	\N		Db	E	\N	\N	t	f	2018-12-03 01:44:58.208975	2018-12-03 13:26:31.482291	t	APP	No 	2	\N	\N		\N	Urine 		f	\N	\N	\N
751	\N	322	S		MD	\N	\N	\N	Iyty h h	S	\N	\N	t	f	2018-12-10 12:12:19.323005	2018-12-10 12:12:19.323005	f	APP	Ju TRD fg	1	\N	\N	Hhg	\N	\N		f	\N		\N
759	\N	322	S		LA	2018-12-10 17:58:00	\N	\N	Gfgy	S	\N	\N	t	f	2018-12-10 18:20:54.946354	2018-12-10 18:20:54.946354	f	APP	Ytuu	1	\N	\N	\N	\N			f	\N		\N
812	\N	257	T	Kofi	MD	\N	\N	\N	Diabetes 	S	\N	\N	t	f	2018-12-14 00:23:34.890568	2018-12-14 00:32:17.733514	t	APP	None 	1	\N	\N		\N	\N	546321	f	45	M	\N
775	\N	322	S		PDHC	2018-12-11 18:19:00	\N	None	None	S	\N	\N	t	f	2018-12-11 18:19:47.080012	2018-12-11 18:22:28.578599	f	APP	None	1	\N	\N	No	\N			t	\N		\N
767	\N	322	S		LA	2018-12-11 17:43:00	\N	\N	No	S	\N	\N	t	f	2018-12-11 17:45:07.55418	2018-12-11 18:38:46.751292	t	APP	No	1	\N	\N	\N	\N	No		f	\N		t
721	0	322	S		LA	2015-11-28 15:30:00	\N		None	S	\N	\N	t	f	2018-11-28 12:52:19.898727	2019-02-05 18:05:14.152503	t	APP	None	1	\N	\N		\N	Malaria		f	\N	\N	t
646	\N	322	S		MD	\N	\N	\N	ijhs gfdagd	S	\N	\N	t	f	2018-10-15 15:03:57.393015	2019-02-05 17:53:12.34025	t	APP	gheagad	1	\N	\N	gfdhfd	\N	\N		f	\N		t
576	4	322	S		MA	2018-09-21 08:46:00	\N	Eye hurts	Fine	E	\N	\N	t	f	2018-09-20 08:46:23.439478	2018-12-13 12:26:38.570322	t	APP	I dont know	1	\N	\N	\N	\N			f	\N		t
584	\N	322	T	Me	HC	2018-09-20 09:02:00	\N	None	None	E	\N	\N	t	f	2018-09-20 09:02:26.113049	2019-02-05 18:29:36.855067	t	APP	None	1	\N	\N	None	\N		0302504667	t	30	M	t
805	1	257	S		MA	2018-12-13 12:41:00	\N	Head	Htn	S	\N	\N	t	f	2018-12-13 18:42:05.336538	2018-12-14 00:18:05.613752	t	APP	None	1	\N	\N	\N	\N			f	\N		t
839	\N	257	S		PDHC	2018-12-15 07:45:00	\N	Headaches	Diab	S	\N	\N	t	f	2018-12-15 07:46:07.199335	2018-12-15 07:46:07.199335	f	APP	Non	1	\N	\N	Para	\N			f	\N		\N
826	\N	257	S		VC	2018-12-14 09:21:00	\N	Diabetes 	Diabetes 	S	\N	\N	t	f	2018-12-14 09:21:14.864505	2018-12-14 10:20:57.079095	t	APP	None 	\N	\N	\N	Paracetamol 	\N	\N		t	\N		\N
736	\N	257	S		HC	2018-11-29 07:51:00	\N	Diabetes 	Meds	S	\N	\N	t	f	2018-11-29 07:52:33.535345	2018-12-14 10:21:25.549268	t	APP	Nonne	1	\N	\N	Meds	\N			t	\N		\N
225	1	247	S		MA	2018-06-10 21:39:00	\N	Check up	None	S	\N	\N	t	f	2018-06-06 21:39:05.612688	2018-06-06 21:39:05.612688	f	APP		1	\N	\N	\N	\N	\N		\N	\N	\N	f
819	\N	257	S		PDVC	2018-12-18 08:26:00	\N	Diabetes 	Diabetes 	E	\N	\N	t	f	2018-12-14 08:27:26.354397	2018-12-14 10:22:16.550092	t	APP	None 	\N	\N	\N	Paracetamol 	\N	\N		t	\N		\N
157	\N	159	T	Kofi	MD	\N	\N	\N	Db	S	\N	\N	t	f	2018-05-02 19:48:43.920138	2018-06-21 11:39:47.812287	t	APP	None	1	\N	\N	Med 	\N	\N	\N	f	\N	\N	f
264	1	247	T	Kwaku	MA	2018-06-27 17:25:00	\N	stomach ache	none	S	\N	\N	t	f	2018-06-24 17:25:48.254455	2018-06-24 17:25:48.254455	f	APP		1	\N	\N	\N	\N	\N	0541840988	f	\N	\N	f
268	\N	247	S		HC	2018-06-29 18:16:00	\N	Tiredness	none	S	\N	\N	t	f	2018-06-24 18:16:53.622809	2018-07-03 12:19:24.951814	f	APP	none	1	\N	\N	none	\N	\N		t	\N	\N	f
60	\N	146	\N	\N	VC	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:43:41.674844	2018-07-03 13:18:06.751452	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
281	9	250	S		PC	2018-07-17 15:51:00	\N	<p>Back ache</p>	<p>Back ache</p>	S	<p>none</p>	248	t	f	2018-07-17 15:51:49.287173	2018-07-17 15:51:49.287173	f	PTL	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
846	\N	331	S		HC	2018-12-15 19:32:00	\N	Hhggg	Ggggg	S	\N	\N	t	f	2018-12-15 19:32:54.597609	2018-12-19 15:30:44.327862	f	APP	Ffff	3	\N	\N	Ggggg	\N			t	\N		\N
852	\N	330	S		HC	2018-12-24 17:30:00	\N	Head	None	S	\N	\N	t	f	2018-12-20 17:27:53.368761	2018-12-20 17:29:19.572374	f	APP	None	1	\N	\N	None	\N			t	\N		\N
859	\N	331	S		VC	2019-05-21 19:26:00	\N	Bad	Headache	S	\N	\N	t	f	2018-12-21 19:26:30.92744	2018-12-21 19:26:30.92744	f	APP	Dust	\N	\N	\N	Para	\N	\N		f	\N		\N
866	\N	330	S		HC	2018-12-26 11:09:00	\N	Hi	None	S	\N	\N	t	f	2018-12-22 11:09:39.364627	2018-12-22 11:09:39.364627	f	APP	None	1	\N	\N	Ok	\N			f	\N		\N
873	6	334	S		MA	2018-12-25 06:50:00	\N	Coughing	Nothing	S	\N	\N	t	f	2018-12-25 06:50:46.027615	2018-12-25 06:50:46.027615	f	APP	None	2	\N	\N	\N	\N			f	\N		\N
892	\N	330	S		LA	2019-01-03 11:02:00	\N	\N	Hi	E	\N	\N	t	f	2019-01-03 11:04:42.288909	2019-01-03 11:07:36.954065	t	APP	List	1	\N	\N	\N	\N	Malaria		f	\N		\N
789	\N	322	T	Jerry	HC	2018-12-13 23:59:00	\N	The	The	E	\N	\N	t	f	2018-12-13 11:57:55.83417	2019-02-05 18:28:18.096868	t	APP	The	1	\N	\N	He	\N		0266000350	t	35	M	t
471	\N	290	S		VC	2018-09-21 08:30:00	\N	Headache	Headaches	S	\N	\N	t	f	2018-08-20 15:58:08.528406	2018-08-20 15:58:08.528406	f	APP	Dust	\N	\N	\N	Panadol	\N	\N		f	\N		\N
609	\N	257	S		PDVC	2018-09-24 20:40:00	\N	Pana	Med	E	\N	\N	t	f	2018-09-24 20:40:35.253501	2018-09-24 20:40:35.253501	f	APP	Mka	\N	\N	\N	Para	\N	\N		f	\N		\N
554	\N	325	S		MD	\N	\N	\N	N/a broken tooth	E	\N	\N	t	f	2018-09-18 19:45:25.412951	2018-09-25 05:45:38.814236	t	APP	N/a	1	\N	\N	Paracetamol	\N	\N		f	\N		t
493	\N	304	S		VC	2018-09-10 15:31:00	\N	None	None	S	\N	\N	t	f	2018-09-10 13:33:54.534623	2018-09-10 16:32:14.298546	t	APP	None	\N	\N	\N	None	\N	\N		t	\N		t
501	8	306	S		MA	2018-11-11 08:05:00	\N	Stomach pains	Stomach pains	E	\N	\N	t	f	2018-09-11 10:07:55.649899	2018-09-11 15:16:58.941612	t	APP	Onion and pollen	1	\N	\N	\N	\N			f	\N		t
509	1	289	S		MA	2018-09-16 13:59:00	\N	Hungry	Food	S	\N	\N	t	f	2018-09-15 18:56:35.028324	2018-09-15 18:56:35.028324	f	APP	Nothing	1	\N	\N	\N	\N			f	\N		\N
517	\N	289	S		PDHC	2018-09-18 07:08:00	\N	Home	Care	S	\N	\N	t	f	2018-09-15 19:08:42.606574	2018-09-15 19:14:39.95405	f	APP	Book	1	\N	\N	None	\N			t	\N		\N
525	\N	272	S		PC	2018-09-21 10:52:00	\N	Emotions	None	S	\N	\N	t	f	2018-09-17 10:49:56.32744	2018-09-17 12:07:17.90119	f	APP	None	\N	\N	\N	None 	\N	\N		t	\N		\N
477	\N	289	S		PC	2018-08-28 15:42:00	\N	Hu	Ha	S	\N	\N	t	f	2018-08-27 15:47:27.963863	2018-09-17 16:15:11.964042	t	APP	Hc	\N	\N	\N	Hi	\N	\N		t	\N		\N
533	\N	322	S		LA	2018-09-18 07:57:00	\N	\N	Nothing	E	\N	\N	t	f	2018-09-17 17:57:24.286493	2018-09-17 18:32:24.26512	t	APP	Milk	1	\N	\N	\N	\N	Malaria		f	\N		t
737	\N	257	S		LA	2018-11-29 23:52:00	\N	Dfmdm	Jfkkfdlkflk	S	Llll	258	t	f	2018-11-29 11:53:32.396347	2018-12-01 23:12:23.381973	t	APP	Ml	\N	\N	\N	\N	\N			f	\N		\N
626	\N	272	T	Clemence	VC	2018-09-27 08:26:00	\N	Irritating	Irritating	E	\N	\N	t	f	2018-09-27 08:26:59.896135	2018-09-27 16:05:29.57869	t	APP	Irritating 	\N	\N	\N	Irritating 	\N	\N	0279454723	t	26	M	\N
541	\N	322	T	Clem	PDHC	2018-09-18 07:03:00	\N	Headache	None	E	\N	\N	t	f	2018-09-17 19:04:02.747747	2018-09-17 19:19:16.860559	t	APP	Ion	1	\N	\N	None	\N		023567888	t	34	M	t
546	\N	322	S		PC	2018-10-18 07:32:00	\N	No medical problem	I dont remember	S	\N	\N	t	f	2018-09-18 17:32:20.540536	2018-09-18 17:42:16.501811	t	APP	No allergies	\N	\N	\N	Testing	\N	\N		t	\N		\N
562	\N	322	S		PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-09-19 11:14:35.24962	2018-09-19 11:14:35.24962	f	APP	\N	\N	\N	\N	Sleep	14	\N		f	\N		\N
881	\N	322	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2019-01-02 10:04:28.066828	2019-02-05 17:56:07.380812	t	APP	none	1	\N	\N	para	\N	\N		f	\N		t
636	\N	272	T	Clara Mady	MD	\N	\N	\N	Vitamin 	S	\N	\N	t	f	2018-09-27 16:24:08.841065	2018-09-27 16:29:41.750455	t	APP	Calcium vitamin	1	\N	\N	Calcium c	\N	\N	0279457123	f	21	F	t
570	\N	322	T	Kwaku	HC	2018-09-19 00:00:00	\N	restless	none	S	\N	\N	t	f	2018-09-19 15:31:38.557275	2018-09-19 15:39:53.37103	t	APP	none	1	\N	\N	none	\N		098764324	t	29	M	t
752	\N	322	S		MD	\N	\N	\N	Gfgyh	S	\N	\N	t	f	2018-12-10 12:15:57.250906	2018-12-10 12:15:57.250906	f	APP	Ytfgh	1	\N	\N		\N	\N		f	\N		\N
585	\N	322	S		PC	2018-09-20 09:14:00	\N	I want some enquiries	None	S	\N	\N	t	f	2018-09-20 09:14:25.082122	2018-09-20 12:16:06.155722	t	APP	None	\N	\N	\N	No e	\N	\N		t	\N		\N
760	\N	322	S		LA	2018-12-10 18:28:00	\N	\N	Jgftt	S	\N	\N	t	f	2018-12-10 18:28:27.598056	2018-12-10 18:28:27.598056	f	APP	Utgg	1	\N	\N	\N	\N			f	\N		\N
640	\N	257	T	Kofi mensah	VC	2018-09-28 12:53:00	\N	Headache 	Dm	S	\N	\N	t	f	2018-09-28 12:53:59.640382	2018-09-28 15:40:30.165494	t	APP	Nka	\N	\N	\N	Para	\N	\N	455445555	t	45	M	t
577	\N	322	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-09-20 08:48:05.315789	2018-10-24 10:42:16.283859	t	APP	Dont know	1	\N	\N	Eye drops	\N	\N		f	\N		t
745	0	322	S		MD	\N	\N		None	S	\N	\N	t	f	2018-12-03 13:18:41.550293	2019-02-05 17:54:59.81425	t	APP	None	2	\N	\N	Paracetamol	\N			f	\N	\N	t
484	\N	272	S		MD	\N	\N	\N	Headaches	S	\N	\N	t	f	2018-09-06 12:32:05.202257	2018-11-12 23:24:55.505101	t	APP	Onion	2	\N	\N	Panadol 	\N	\N		f	\N		\N
668	\N	139	S		MD	\N	\N	\N	Hdh	S	\N	\N	t	f	2018-11-13 01:29:51.079537	2018-11-13 01:30:11.900319	t	APP	Hdb	1	\N	\N	Gr	\N	\N		f	\N		\N
679	\N	139	S		MD	\N	\N	\N	Gdhh	S	\N	\N	t	f	2018-11-13 07:51:56.344545	2018-11-13 07:56:25.962804	t	APP		1	\N	\N	Tjeg	\N	\N		f	\N		\N
463	\N	286	S		LA	2018-08-20 00:35:00	\N	\N	None	S	\N	\N	t	f	2018-08-20 09:35:46.147752	2018-11-14 16:37:45.052976	t	APP	None	1	\N	\N	\N	\N	Urine		f	\N		\N
440	\N	247	T	Kofi Adjei	LA	2018-10-17 00:57:00	\N	\N	None	E	\N	\N	t	f	2018-08-17 10:58:24.137027	2018-11-14 16:39:56.76428	t	APP	None	1	\N	\N	\N	\N	Malaria	0541840988	f	21	M	f
408	\N	278	T	Madam	LA	2018-08-13 18:21:00	\N	\N	BP	E	\N	\N	t	f	2018-08-13 14:21:26.407696	2018-11-14 16:59:31.325295	t	APP	Nka 	1	\N	\N	\N	\N	Urine RE\nMPs	444445566	f	\N	\N	f
659	\N	139	T	Nat	PDDP	\N	\N	\N	Headache	S	\N	\N	t	f	2018-11-12 16:17:59.744457	2018-11-15 08:20:22.434121	f	APP	None	\N	\N	\N	Para	6	\N	0202233117	t	19	M	\N
618	\N	325	S		MA	2018-09-25 06:19:00	\N	Anceph	P	S		258	t	f	2018-09-25 06:19:44.940517	2018-11-15 17:48:41.837616	t	APP		\N	\N	\N	\N	\N			f	\N		\N
695	\N	322	S		VC	2018-11-22 22:56:00	\N	Not		S	\N	\N	t	f	2018-11-22 22:57:50.162306	2018-11-22 22:57:50.162306	f	APP		\N	\N	\N		\N			f	\N		\N
703	\N	322	S		PDDP	\N	\N		Gdsaf	S	\N	\N	t	f	2018-11-23 12:54:27.793216	2018-11-23 12:54:27.793216	f	APP	Gasdaf	\N	\N	\N		\N			f	\N		\N
593	\N	322	T	Maa	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-09-20 10:56:19.833157	2018-11-23 13:07:32.308005	t	APP	\N	\N	\N	\N	Paracetamol	2	\N	023664332	t	36	F	t
713	0	289	S		PDHC	2018-11-23 15:30:00	\N	None\n	None	S	\N	\N	t	f	2018-11-23 21:46:44.224788	2018-11-23 21:46:44.224788	f	APP	None\n	1	\N	\N	None	\N			f	\N		\N
730	\N	322	S		PDDP	\N	\N		No	S	\N	\N	t	f	2018-11-28 13:24:17.498626	2018-11-28 13:56:01.055254	f	APP	None	\N	\N	\N	No	\N			t	\N	\N	\N
768	\N	322	S		VC	2018-12-11 17:50:00	\N	No	No	S	\N	\N	t	f	2018-12-11 17:50:54.896892	2019-02-05 18:06:12.674767	t	APP	No	\N	\N	\N	No	\N	\N		t	\N		t
776	\N	322	T	No	PDHC	2018-12-11 18:21:00	\N	No	No	E	\N	\N	t	f	2018-12-11 18:21:05.730224	2019-02-05 18:10:31.344796	t	APP	Jo	1	\N	\N	No	\N		0277455395	t	21	M	t
880	1	322	S		MA	2019-01-02 10:02:00	\N	fdsafs	dafdsfafdsasda	S	\N	\N	t	f	2019-01-02 10:03:02.182471	2019-02-05 17:51:39.996989	t	APP	gads	1	\N	\N	\N	\N			f	\N		t
867	3	331	T	Dummy test	MA	2019-12-22 11:44:00	\N	Fever	Headache	E	\N	\N	t	f	2018-12-22 11:45:02.608547	2018-12-22 11:45:02.608547	f	APP	Dust	2	\N	\N	\N	\N		0256123464	f	35	M	\N
790	\N	322	S		PC	2018-12-13 11:59:00	\N	Please	Lost	S	\N	\N	t	f	2018-12-13 11:59:18.801461	2018-12-13 12:05:47.586099	f	APP	List	\N	\N	\N	List	\N	\N		t	\N		\N
783	\N	322	T	Mommie	MD	\N	\N	\N	Your	E	\N	\N	t	f	2018-12-13 11:21:31.01134	2018-12-13 12:23:34.710292	t	APP	No	1	\N	\N		\N	\N	0205869653	f	26	F	t
602	\N	322	T	Gh	HC	2018-10-22 09:39:00	\N	Dhhg	 Vv	S	\N	\N	t	f	2018-09-22 21:40:57.852343	2019-02-05 18:17:49.795563	t	APP	Cvbb	1	\N	\N	Ccv	\N		5665433445	t	55	F	t
813	\N	257	S		MD	\N	\N	\N	Diabetes 	S	\N	\N	t	f	2018-12-14 00:32:01.86107	2018-12-14 00:35:13.177528	t	APP	None 	1	\N	\N		\N	\N		f	\N		\N
820	\N	331	S		LA	2018-12-14 08:28:00	\N	\N	Headache	S	\N	\N	t	f	2018-12-14 08:30:52.063766	2018-12-14 08:30:52.063766	f	APP	Dust	3	\N	\N	\N	\N	Urine		f	\N		\N
741	\N	257	S		PC	2018-12-01 19:30:00	\N	Ghana 	Med	E	\N	\N	t	f	2018-12-01 13:28:31.185318	2018-12-14 10:25:23.000928	t	APP	Nka	\N	\N	\N	Med	\N			t	\N	\N	\N
833	\N	257	S		LA	2018-12-14 20:47:00	\N	\N	Diabetes 	E	\N	\N	t	f	2018-12-14 17:48:31.907662	2018-12-14 18:00:25.274511	t	APP	None 	1	\N	\N	\N	\N			f	\N		t
874	\N	334	S		MD	\N	\N	\N	None	E	\N	\N	t	f	2018-12-25 06:52:44.495507	2018-12-25 06:52:44.495507	f	APP	None	2	\N	\N	Para	\N	\N		f	\N		\N
230	\N	250	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-06-14 12:57:16.318439	2018-06-14 13:08:41.767709	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
847	\N	331	S		VC	2018-12-15 19:33:00	\N	Tff	Ffff	S	\N	\N	t	f	2018-12-15 19:33:17.959974	2018-12-19 12:42:03.650218	f	APP	CCff	\N	\N	\N	Cc	\N	\N		t	\N		\N
853	1	333	S		MA	2018-12-21 14:02:00	\N	Hi	Hi	S	\N	\N	t	f	2018-12-21 14:03:01.474948	2018-12-21 14:03:01.474948	f	APP	Hi	1	\N	\N	\N	\N			f	\N		\N
806	5	331	S		MA	2018-12-13 19:17:00	\N	Fever	Uknown	S	\N	\N	t	f	2018-12-13 19:17:35.296489	2018-12-21 19:18:13.529878	t	APP	Unknown	3	\N	\N	\N	\N			f	\N		t
798	\N	322	S		PDVC	2018-12-13 12:36:00	\N	Stomach	None	S	\N	\N	t	f	2018-12-13 12:36:33.265993	2019-02-05 18:08:05.165465	t	APP	None	\N	\N	\N	Stomach medicine	\N	\N		t	\N		t
886	\N	330	S		LA	2019-01-03 03:10:00	\N	\N	Like	S	\N	\N	t	f	2019-01-02 15:10:18.029907	2019-01-02 15:25:45.28316	t	APP	Okay	1	\N	\N	\N	\N	Pelvis		f	\N		\N
888	\N	330	S		MD	\N	\N	\N	Good	S	\N	\N	t	f	2019-01-02 18:16:34.050796	2019-01-02 18:19:06.111743	t	APP	Good	1	\N	\N	Great	\N	\N		f	\N		\N
893	\N	330	S		PC	2019-01-03 11:11:00	\N	Please	List	S	\N	\N	t	f	2019-01-03 11:11:31.688487	2019-01-03 11:11:31.688487	f	APP	Allergies	\N	\N	\N	Lis	\N	\N		f	\N		\N
900	\N	330	S		MD	\N	\N	\N	Hello	S	\N	\N	t	f	2019-01-08 18:56:05.184438	2019-01-08 18:56:05.184438	f	APP	Testing	1	\N	\N	Hi	\N	\N		f	\N		\N
908	\N	342	S		VC	2019-01-11 09:30:00	\N	Headache	Cold, malaria	S	\N	\N	t	f	2019-01-11 09:30:37.952964	2019-01-11 09:30:37.952964	f	APP	Cold water	\N	\N	\N	Para	\N	\N		f	\N		\N
899	\N	338	S		MD	\N	\N		<p>wer</p>	S	\N	\N	t	f	2019-01-08 11:34:27.93066	2019-01-11 12:12:31.421999	t	WEB		4	f			\N	\N		f	\N	\N	\N
840	\N	257	S		PDDP	\N	\N	\N	Diab	S	\N	\N	t	f	2018-12-15 07:47:19.954332	2019-01-14 21:45:34.116946	f	APP	Non	\N	\N	\N	Para	7	\N		t	\N		\N
904	\N	342	S		HC	2019-01-11 09:23:00	\N	Cold	None	S	\N	\N	t	f	2019-01-11 09:23:07.285312	2019-01-23 17:00:16.677816	t	APP	Dust	3	\N	\N	Para	\N			t	\N		\N
647	\N	322	S		MD	\N	\N	\N	rfsaa	S	\N	\N	t	f	2018-10-15 16:06:24.797556	2019-02-05 17:53:54.743982	t	APP	hfags	1	\N	\N	hfas	\N	\N		f	\N		t
472	\N	290	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-08-20 16:04:31.664506	2018-08-20 16:04:31.664506	f	APP	\N	1	t	Dr. Seth	\N	\N	\N	\N	f	\N	\N	\N
464	1	289	T	Priscilla	MA	2018-08-20 15:17:00	\N	Headaches	None	S	\N	\N	t	f	2018-08-20 15:17:12.362429	2018-08-22 17:08:03.286115	t	APP	None	1	\N	\N	\N	\N		0243489948	f	25	F	t
753	\N	322	S		MD	\N	\N	\N	Ijhtt	S	\N	\N	t	f	2018-12-10 12:24:23.319938	2018-12-10 12:24:23.319938	f	APP	Gfyyjj	1	\N	\N		\N	\N		f	\N		\N
485	3	302	S		MA	2018-12-16 16:22:00	\N	Headache	None	S	\N	\N	t	f	2018-09-07 16:22:38.151996	2018-09-07 16:51:53.324884	t	APP	None	2	\N	\N	\N	\N			f	\N		\N
555	\N	325	S		LA	2018-12-24 19:47:00	\N	\N	Vroken feet	E	\N	\N	t	f	2018-09-18 19:47:21.63602	2018-09-25 05:45:51.133868	t	APP	N/a 	1	\N	\N	\N	\N	Fbc 		f	\N		t
494	\N	304	S		HC	2018-09-11 14:37:00	\N	Good	Good	S	\N	\N	t	f	2018-09-10 13:38:04.294693	2018-09-10 16:32:48.216306	t	APP	None	1	\N	\N	None	\N			t	\N		t
502	\N	306	S		MD	\N	\N	\N	Serious stomach pains\n\n\n	E	\N	\N	t	f	2018-09-11 10:11:50.063939	2018-09-11 15:54:14.126105	t	APP	Onion and pollen	1	\N	\N	Stomach reliever	\N	\N		f	\N		\N
518	\N	289	S		PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-09-15 19:11:53.66271	2018-09-15 19:14:25.502902	f	APP	\N	\N	\N	\N	Food	12356	\N		t	\N	\N	\N
526	1	321	S		MA	2018-09-21 12:25:00	\N	Headache	None	S	\N	\N	t	f	2018-09-17 12:26:01.49636	2018-09-17 12:26:01.49636	f	APP	None	1	\N	\N	\N	\N			f	\N		\N
478	\N	272	S		PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-08-27 17:14:02.19382	2018-09-25 09:24:05.679189	t	APP	\N	\N	\N	\N	Love	10	\N		t	\N	\N	\N
603	\N	322	T	Fii	PC	2018-09-22 21:44:00	\N	None	Mone	E	\N	\N	t	f	2018-09-22 21:44:46.144544	2018-09-25 10:08:53.698974	f	APP	Mihg	\N	\N	\N	Fff	\N	\N		t	12	M	\N
534	\N	322	S		VC	2018-09-19 05:58:00	\N	Headache	I dont know	S	\N	\N	t	f	2018-09-17 17:58:57.091116	2018-09-17 18:49:28.380851	t	APP	Ion	\N	\N	\N	Para	\N	\N		t	\N		t
761	\N	322	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-12-11 11:13:07.420079	2018-12-11 11:13:07.420079	f	APP	None	1	\N	\N	Yttyh	\N	\N		f	\N		\N
542	\N	322	T	Andy	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-09-17 19:06:54.874482	2018-09-17 19:19:09.460045	t	APP	\N	\N	\N	\N	Para	8	\N	024094449	t	\N	\N	t
627	\N	272	S		HC	2018-09-27 08:29:00	\N	Emotional	Love	S	\N	\N	t	f	2018-09-27 08:29:33.225671	2018-09-27 16:05:11.154176	t	APP	Love 	1	\N	\N	Love medicine	\N			t	\N		\N
563	\N	322	S		PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-09-19 11:45:43.089865	2018-09-19 11:45:43.089865	f	APP	\N	\N	\N	\N	Money	123363	\N		f	\N		\N
571	\N	272	T	Felicia	PDHC	2018-09-22 16:26:00	\N	Fever	None	S	\N	\N	t	f	2018-09-19 16:24:24.191936	2018-09-19 16:24:24.191936	f	APP	None	1	\N	\N	None	\N		0277457214	f	25	F	\N
547	\N	322	T	Clara	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-09-18 17:59:55.505546	2018-09-20 10:46:11.684295	t	APP	\N	\N	\N	\N	Chloroquine	51	\N	098765434	t	\N	\N	t
791	\N	322	T	Name	PC	2018-12-13 12:00:00	\N	No	No	E	\N	\N	t	f	2018-12-13 12:00:27.525757	2019-02-05 11:42:40.123123	t	APP	No	\N	\N	\N	No	\N	\N	0302805669	t	44	F	\N
648	\N	322	S		MD	\N	\N	\N	gdasfda	S	\N	\N	t	f	2018-10-15 16:26:34.126223	2019-02-05 17:53:59.229129	t	APP	teqwr	1	\N	\N	gdas sdfa	\N	\N		f	\N		t
586	\N	322	T	Mama	PC	2018-09-20 09:22:00	\N	None	None	E	\N	\N	t	f	2018-09-20 09:22:25.933218	2018-09-20 12:16:18.911306	t	APP	None	\N	\N	\N	None	\N	\N	0248294778	t	60	F	\N
641	\N	257	S		HC	2018-09-28 13:38:00	\N	Hkkw 	Skkksk	S	\N	\N	t	f	2018-09-28 13:38:40.560803	2018-09-28 15:40:47.744781	t	APP	Nka 	1	\N	\N	Hot	\N			t	\N		t
651	\N	322	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-10-15 16:37:22.576827	2019-02-05 17:54:04.638483	t	APP	None	1	\N	\N		\N	\N		f	\N		t
510	\N	289	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-09-15 18:57:34.71314	2018-11-12 23:23:13.316595	t	APP	None	1	\N	\N	Food	\N	\N		f	\N		\N
669	\N	139	S		MD	\N	\N	\N	Thd	S	\N	\N	t	f	2018-11-13 01:35:14.44243	2018-11-13 01:39:15.568741	t	APP	Tjev	1	\N	\N	Tje	\N	\N		f	\N		\N
680	\N	139	S		MD	\N	\N	\N	Gehh	S	\N	\N	t	f	2018-11-13 07:52:40.758362	2018-11-13 07:53:18.651996	t	APP		1	\N	\N	Tje	\N	\N		f	\N		\N
619	\N	325	S		LA	2018-09-25 06:21:00	\N	Head	Med 	S	Review 2 wks 	258	t	f	2018-09-25 06:23:22.905388	2018-11-14 15:44:44.013336	t	APP	Nka	\N	\N	\N	\N	\N			f	\N		\N
777	\N	322	T	Hi	PDHC	2018-12-11 18:23:00	\N	No	No	E	\N	\N	t	f	2018-12-11 18:23:09.816016	2018-12-11 18:24:45.772529	f	APP	No	1	\N	\N	No	\N		024808225	t	53	M	\N
688	\N	139	S		MD	\N	\N	\N	Jdnnd	S	\N	\N	t	f	2018-11-14 17:02:35.165577	2018-11-14 17:05:52.682135	t	APP		1	\N	\N	The	\N	\N		f	\N		\N
594	\N	289	S		PDHC	2018-09-22 10:58:00	\N	Running stomach	Running nose	S	\N	\N	t	f	2018-09-20 10:58:50.733741	2018-11-15 10:55:06.662406	f	APP	None	1	\N	\N	None 	\N			t	\N		\N
723	0	322	T	Nii	LA	2018-11-28 15:30:00	\N		None	E	\N	\N	t	f	2018-11-28 12:55:24.034854	2019-02-05 17:57:42.968497	t	APP	Bi	1	\N	\N		\N	Blood counts	0234566777	f	21	M	t
704	\N	322	S		PDDP	\N	\N		Gsa	S	\N	\N	t	f	2018-11-23 12:54:58.312192	2018-11-26 16:25:42.208654	f	APP	Gadsdf	\N	\N	\N	Para	\N			t	\N		\N
714	\N	322	S		PDDP	\N	\N		Kgiooy	S	\N	\N	t	f	2018-11-28 11:40:50.060498	2018-11-28 11:40:50.060498	f	APP	Jgyi	\N	\N	\N	Jhuyf	\N			f	\N		\N
731	\N	322	T	Bona	PDDP	\N	\N		Go	E	\N	\N	t	f	2018-11-28 13:25:29.463919	2018-11-28 13:55:22.094118	f	APP	No	\N	\N	\N	No	\N		024993838	t	16	F	\N
769	\N	322	S		HC	2018-12-11 17:58:00	\N	None	None	E	\N	\N	t	f	2018-12-11 17:58:36.22461	2019-02-05 18:18:13.890865	t	APP	None	1	\N	\N	None	\N			t	\N		t
610	\N	257	S		PDVC	2018-09-24 20:41:00	\N	Tia	Dm	S	\N	\N	t	f	2018-09-24 20:41:12.120885	2018-11-29 11:44:41.875227	t	APP	Nka	\N	\N	\N	Bifr	\N	\N		t	\N		\N
738	3	257	S		MA	2018-12-01 21:30:00	\N	Diabetes 	Kskksl	S	\N	\N	t	f	2018-12-01 13:10:40.92306	2018-12-01 23:10:51.38483	t	APP	Nka	2	\N	\N		\N			f	\N	\N	\N
371	\N	267	S		LA	2018-08-09 12:01:00	\N	\N	None	S	\N	\N	t	f	2018-08-09 12:01:50.450797	2018-12-04 11:03:12.07412	t	APP	None	2	\N	\N	\N	\N	Blood count		f	\N	\N	f
717	1	322	S		MA	2018-11-29 15:30:00	\N	None	None	S	\N	\N	t	f	2018-11-28 12:46:34.833117	2019-02-05 17:52:08.352182	t	APP	None	1	\N	\N		\N			f	\N	\N	t
868	\N	331	S		MD	\N	\N	\N	Para	S	\N	\N	t	f	2018-12-22 11:48:12.541934	2018-12-22 11:48:12.541934	f	APP	Dust	3	\N	\N	Para	\N	\N		f	\N		\N
799	1	330	S		MA	2018-12-25 00:00:00	\N	Monthly checkup	None	S	\N	\N	t	f	2018-12-13 13:30:00.014891	2018-12-13 14:30:52.374076	t	APP	None	1	\N	\N	\N	\N			f	\N		t
807	\N	331	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-12-13 19:20:58.72325	2018-12-13 19:20:58.72325	f	APP	\N	3	t		\N	\N	\N	\N	f	\N	\N	\N
814	\N	257	S		LA	2018-12-18 08:14:00	\N	\N	Diabetes 	S	\N	\N	t	f	2018-12-14 08:15:03.532321	2018-12-14 09:29:53.712547	t	APP	None 	1	\N	\N	\N	\N	Urine 		f	\N		\N
887	\N	330	S		MD	\N	\N	\N	Nill	S	\N	\N	t	f	2019-01-02 18:10:36.142947	2019-01-02 18:11:40.553131	t	APP	Nill	1	\N	\N	Alright	\N	\N		f	\N		\N
841	\N	257	S		VC	2018-12-15 07:48:00	\N	Headqches 	Diab	S	\N	\N	t	f	2018-12-15 07:48:05.914285	2018-12-15 07:48:05.914285	f	APP	Nin	\N	\N	\N	Para	\N	\N		f	\N		\N
834	11	257	S		MA	2018-12-15 06:54:00	\N	Diabesrs 	Diarhh	S	\N	\N	t	f	2018-12-15 06:54:21.87234	2018-12-15 10:00:11.797422	t	APP	Nine	1	\N	\N	\N	\N			f	\N		t
875	\N	334	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-12-25 06:54:10.243644	2018-12-25 06:54:10.243644	f	APP	\N	2	t	Caleb	\N	\N	\N	\N	f	\N	\N	\N
848	\N	330	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-12-18 09:44:06.887706	2018-12-18 09:46:03.976743	t	APP	None	1	\N	\N	Hope	\N	\N		f	\N		t
68	\N	156	S		LA	2018-04-20 00:59:00	\N	\N	Migraine	S	\N	\N	t	f	2018-04-20 10:59:48.512876	2018-04-20 11:37:13.473249	t	APP	Calcium	1	\N	\N	\N	\N	Malaria 	\N	f	\N	\N	f
821	\N	331	S		VC	2018-12-14 08:33:00	\N	Headache	None	S	\N	\N	t	f	2018-12-14 08:33:59.811484	2018-12-19 16:19:44.034046	f	APP	Dust	\N	\N	\N	Para	\N	\N		t	\N		\N
696	0	322	S		HC	2018-11-22 00:00:00	\N	Hggy	Gdgyu	S	\N	\N	t	f	2018-11-22 23:28:53.658523	2018-12-20 10:10:31.379312	f	APP		1	\N	\N	Hyggyjjj	\N			t	\N		\N
854	1	333	T	Naa	MA	2018-12-21 00:00:00	\N	Hi	Hi	E	\N	\N	t	f	2018-12-21 14:07:06.636408	2018-12-21 14:07:06.636408	f	APP	Hi	1	\N	\N	\N	\N		028554269	f	2	F	\N
861	\N	257	T	Kio	MD	\N	\N	\N	Self	S	\N	\N	t	f	2018-12-22 10:38:26.288776	2018-12-22 10:38:26.288776	f	APP	Klm	1	\N	\N	Pmol	\N	\N	9632580	f	65	M	\N
827	\N	322	S		LA	2018-12-25 12:18:00	\N	\N	Malaria	S	\N	\N	t	f	2018-12-14 12:14:01.324138	2019-01-02 10:40:46.520049	t	APP	None	1	\N	\N	\N	\N	Urine		f	\N		t
784	\N	322	S		LA	2019-01-13 11:29:00	\N	\N	Please	S	\N	\N	t	f	2018-12-13 11:29:20.558114	2019-02-05 17:56:55.108728	t	APP	Allegies	1	\N	\N	\N	\N	List		f	\N		t
894	\N	330	S		LA	2019-01-10 11:12:00	\N	\N	Pain	S	\N	\N	t	f	2019-01-03 11:12:47.945126	2019-01-03 11:13:53.109505	t	APP	Pain	1	\N	\N	\N	\N	Love 		f	\N		\N
901	11	334	S		MA	2019-04-08 22:12:00	\N	None	None	S	\N	\N	t	f	2019-01-08 20:12:53.816643	2019-01-08 20:12:53.816643	f	APP	None	1	\N	\N	\N	\N			f	\N		\N
905	\N	342	S		LA	2019-01-11 09:24:00	\N	\N	None	S	\N	\N	t	f	2019-01-11 09:25:27.549904	2019-01-11 09:25:27.549904	f	APP	Dust	3	\N	\N	\N	\N	Urine		f	\N		\N
909	1	257	S		MA	2019-01-11 09:49:00	\N	Hda	Med	E	\N	\N	t	f	2019-01-11 09:49:09.580207	2019-01-11 12:09:04.614938	t	APP	 O 	1	\N	\N	\N	\N			f	\N		\N
914	\N	257	S		LA	2019-01-11 13:26:00	\N	\N	Pml	S	\N	\N	t	f	2019-01-11 13:27:09.542846	2019-01-11 13:28:58.027611	t	APP	 Non	1	\N	\N	\N	\N	Fbc		f	\N		\N
916	\N	257	S		PDVC	2019-01-11 13:37:00	\N	Nkk	Nkk	E	\N	\N	t	f	2019-01-11 13:37:34.653238	2019-01-11 13:37:34.653238	f	APP	Nkknkkk	\N	\N	\N	Mkkk	\N	\N		f	\N		\N
911	\N	257	S		PDVC	2019-01-11 12:27:00	\N	Nhs	Diabetic 	S	\N	\N	t	f	2019-01-11 12:22:47.903557	2019-01-23 16:54:59.693974	f	APP	Non	\N	\N	\N	Pmol	\N	\N		t	\N		\N
578	\N	322	T	Ayeley	MD	\N	\N	\N	None	E	\N	\N	t	f	2018-09-20 08:49:09.039315	2019-02-05 17:53:04.210914	t	APP	Drug	1	\N	\N	Par	\N	\N	0204288283	f	26	F	t
652	\N	322	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-10-15 16:40:13.943013	2019-02-05 17:54:06.724977	t	APP	None	1	\N	\N		\N	\N		f	\N		t
882	\N	322	S		LA	2019-01-02 10:22:00	\N	\N	None	S	\N	\N	t	f	2019-01-02 10:22:48.632544	2019-02-05 17:56:36.536648	t	APP	None	1	\N	\N	\N	\N	Urine		f	\N		t
611	\N	257	S		PDHC	2018-09-24 20:43:00	\N	Mard	Htn	E	\N	\N	t	f	2018-09-24 20:43:08.74604	2018-09-24 20:43:08.74604	f	APP	Nka	1	\N	\N	Para	\N			f	\N		\N
465	\N	289	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-08-20 15:22:59.156423	2018-08-22 17:13:54.821434	t	APP	None	1	\N	\N	Vitamin c	\N	\N		f	\N		t
479	3	300	S		MA	2018-12-08 09:20:00	\N	Headache	None	S	\N	\N	t	f	2018-09-05 15:25:46.109982	2018-09-10 11:48:16.64601	t	APP	Pollen, onion	2	\N	\N	\N	\N			f	\N		\N
762	\N	322	S		LA	2018-12-11 11:14:00	\N	\N	None	S	\N	\N	t	f	2018-12-11 11:14:42.65135	2019-02-05 17:57:00.995166	t	APP	None	1	\N	\N	\N	\N			f	\N		t
503	\N	306	S		LA	2018-11-09 08:00:00	\N	\N	Serious stomach pains	E	\N	\N	t	f	2018-09-11 10:14:46.128852	2018-09-11 15:14:09.547586	t	APP	Onion and pollen	1	\N	\N	\N	\N	Blood and urine		f	\N		t
487	\N	234	S		PC	2019-08-28 18:48:00	\N	<p>Dizziness</p>	<p>Headaches</p>	S	\N	\N	t	f	2018-09-07 18:16:25.622504	2018-09-13 17:35:03.144789	f	WEB		\N	f			\N	\N		t	\N	\N	\N
519	1	272	S		MA	2018-09-23 00:40:00	\N	Haven't been able to sleep for two weeks now. Thanks	Unable to sleep	S	\N	\N	t	f	2018-09-17 10:37:24.851065	2018-09-17 10:37:24.851065	f	APP	Unable to sleep 	1	\N	\N	\N	\N			f	\N		\N
724	\N	322	S		PC	2018-11-28 03:30:00	\N	None	Jone	S	\N	\N	t	f	2018-11-28 12:56:04.621347	2018-11-28 14:00:20.902075	f	APP	None	\N	\N	\N	None	\N			t	\N	\N	\N
628	\N	272	T	Francis	PC	2018-09-27 08:31:00	\N	Too much sweet	Too much sweet	E	\N	\N	t	f	2018-09-27 08:31:10.915032	2018-09-27 16:04:00.050142	t	APP	Too nuch sweet	\N	\N	\N	Too much sweet 	\N	\N	0244123445	t	27	M	\N
548	\N	322	T	jhujg	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-09-18 18:05:28.791633	2018-09-18 18:35:52.581232	t	APP	\N	\N	\N	\N	trgdfs5	5	\N	098765432	t	13	M	t
556	\N	325	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-09-18 19:49:10.933019	2018-09-18 20:01:00.626361	t	APP	\N	1	t	Dr dranas	\N	\N	\N	\N	t	\N	\N	\N
564	\N	272	S		PDHC	2018-09-22 11:58:00	\N	Stress	None 	S	\N	\N	t	f	2018-09-19 11:59:00.705041	2018-09-19 11:59:00.705041	f	APP	None	1	\N	\N	None	\N			f	\N		\N
535	\N	322	S		HC	2018-09-19 06:01:00	\N	Medical problems	Medical	E	\N	\N	t	f	2018-09-17 18:02:04.30509	2018-09-19 15:39:40.810971	t	APP	Allergies	1	\N	\N	Para	\N			t	\N		t
642	\N	257	S		PC	2018-09-28 13:42:00	\N	Fddd	Sssss	S	\N	\N	t	f	2018-09-28 13:42:14.313191	2018-09-28 15:31:22.902066	t	APP	Nka	\N	\N	\N	Fdd	\N	\N		t	\N		\N
778	\N	322	S		PDDP	\N	\N	\N	No	S	\N	\N	t	f	2018-12-11 18:23:44.97159	2019-02-05 18:12:03.632679	t	APP	No	\N	\N	\N	Parq	2	\N		t	\N		t
572	\N	322	T	ytrfd	PDHC	2018-09-19 00:00:00	\N	fdafdsa	fdsafgsa	S	\N	\N	t	f	2018-09-19 17:29:36.778417	2018-09-19 17:40:37.742824	t	APP	uifokdsa	1	\N	\N	fdaga	\N		98752352	t	63	M	t
595	\N	289	T	Percy B	PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-09-20 11:02:34.63966	2018-09-20 11:02:34.63966	f	APP	\N	\N	\N	\N	Yo geng	10	\N	0244741235	f	40	M	\N
587	\N	322	S		PDVC	2018-09-20 09:23:00	\N	Problem	Previous	S	\N	\N	t	f	2018-09-20 09:23:42.859233	2018-09-20 11:15:58.381609	f	APP	Allergies	\N	\N	\N	List	\N	\N		t	\N		\N
732	\N	322	S		VC	2018-11-28 03:30:00	\N	No	No	S	\N	\N	t	f	2018-11-28 13:26:44.492998	2019-02-05 18:06:25.73186	t	APP	No	\N	\N	\N	Jo	\N			t	\N	\N	t
275	4	257	S		MA	2018-06-28 08:38:00	\N	DM	Htn	E	\N	\N	t	f	2018-06-28 08:38:18.475953	2018-09-24 20:20:20.190861	t	APP	None	1	\N	\N	\N	\N	\N		f	\N	\N	t
697	0	322	S		MD	\N	\N		Jone	S	\N	\N	t	f	2018-11-22 23:50:17.822365	2019-02-05 17:54:48.797634	t	APP		1	\N	\N	Para	\N			f	\N		t
527	\N	321	T	Ernest	MD	\N	\N	\N	None	S	\N	\N	t	f	2018-09-17 12:27:25.308867	2018-11-12 23:21:37.496621	t	APP	Noe	1	\N	\N	Para, efpac	\N	\N	124543234	f	25	M	\N
473	\N	290	S		MD	\N	\N	\N	Headaches	S	\N	\N	t	f	2018-08-20 16:09:13.600955	2018-11-12 23:27:34.245989	t	APP	Dust	1	\N	\N	Panadol	\N	\N		f	\N		\N
461	\N	286	S		MD	\N	\N	\N	None	E	\N	\N	t	f	2018-08-19 22:30:27.511617	2018-11-12 23:31:24.321051	t	APP	None	3	\N	\N	Para	\N	\N		f	\N		f
436	\N	247	T	Kofi	MD	\N	\N	\N	None	S	\N	\N	t	f	2018-08-17 10:05:03.164154	2018-11-12 23:42:49.539584	t	APP	None	1	\N	\N	Para	\N	\N		f	12	\N	f
323	\N	247	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-07-23 13:03:01.934443	2018-11-13 00:35:50.279553	t	APP	none	\N	\N	\N	none	\N	\N		t	\N	\N	f
307	\N	262	T	Paddy	MD	\N	\N	\N	None	E	\N	\N	t	f	2018-07-23 11:01:34.795563	2018-11-13 00:40:51.345911	t	APP	None	\N	\N	\N	Para	\N	\N	0245681628	f	\N	\N	f
661	\N	139	S		MD	\N	\N	\N	Hh	S	\N	\N	t	f	2018-11-13 01:02:10.988213	2018-11-13 01:02:36.960732	t	APP	Hd\n	1	\N	\N	The ma gjd\nDhdjk	\N	\N		f	\N		\N
662	\N	139	S		MD	\N	\N	\N	Gj	S	\N	\N	t	f	2018-11-13 01:04:52.001485	2018-11-13 01:13:05.500959	t	APP	Tj	1	\N	\N	Th	\N	\N		f	\N		\N
663	\N	139	S		MD	\N	\N	\N	Then	S	\N	\N	t	f	2018-11-13 01:19:21.275973	2018-11-13 01:20:49.018321	t	APP	Theb	1	\N	\N	The	\N	\N		f	\N		\N
670	\N	139	S		MD	\N	\N	\N	Gshd	S	\N	\N	t	f	2018-11-13 01:36:29.03416	2018-11-13 01:36:56.810908	t	APP	Hdt	1	\N	\N	The	\N	\N		f	\N		\N
672	\N	139	S		MD	\N	\N	\N	The	S	\N	\N	t	f	2018-11-13 01:45:12.273437	2018-11-13 01:45:42.887111	t	APP	The	1	\N	\N	The	\N	\N		f	\N		\N
673	\N	139	S		MD	\N	\N	\N	Geh	S	\N	\N	t	f	2018-11-13 01:49:35.10596	2018-11-13 01:49:59.259112	t	APP	Tje	1	\N	\N	Tje	\N	\N		f	\N		\N
674	\N	139	S		MD	\N	\N	\N	Hsh	S	\N	\N	t	f	2018-11-13 07:32:08.290974	2018-11-13 07:35:30.887115	t	APP	Heh	1	\N	\N	Thg	\N	\N		f	\N		\N
495	\N	304	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-09-10 15:37:05.892379	2018-09-10 16:10:03.370716	f	APP	\N	1	t	Mady doctor	\N	\N	\N	\N	t	\N	\N	\N
681	\N	139	S		MD	\N	\N	\N	Heh	S	\N	\N	t	f	2018-11-13 07:59:27.175134	2018-11-13 07:59:46.383337	t	APP		1	\N	\N	Yje	\N	\N		f	\N		\N
739	0	257	T	Kofi	MD	\N	\N		Ass	S	\N	\N	t	f	2018-12-01 13:13:11.620613	2018-12-01 23:06:17.766591	t	APP	Nka	1	\N	\N	Kwkek	\N		444444	f	56	M	\N
604	\N	322	T	Jj	PDVC	2018-09-22 21:46:00	\N	Hi	Hhg	E	\N	\N	t	f	2018-09-22 21:50:16.64606	2019-02-05 18:08:54.021196	t	APP	Hbb	\N	\N	\N	Ghh	\N	\N		t	6	F	t
754	\N	322	S		MD	\N	\N	\N	Uohcf	S	\N	\N	t	f	2018-12-10 12:29:14.692638	2018-12-10 12:29:14.692638	f	APP	Ydthb	1	\N	\N		\N	\N		f	\N		\N
649	\N	322	S		MD	\N	\N	\N	gdasfda	S	\N	\N	t	f	2018-10-15 16:27:01.686258	2019-02-05 17:54:01.140509	t	APP	teqwr	1	\N	\N		\N	\N		f	\N		t
683	\N	139	S		MD	\N	\N	\N	The	S	\N	\N	t	f	2018-11-13 08:12:56.103766	2018-11-13 14:47:35.223305	t	APP		1	\N	\N	The	\N	\N		f	\N		\N
620	\N	325	S		LA	2018-09-25 06:27:00	\N	Uri	Med	S	On atbs	258	t	f	2018-09-25 06:27:13.645552	2018-11-14 15:35:19.539496	t	APP	Nka	\N	\N	\N	\N	\N			f	\N		\N
486	\N	234	S		LA	2020-09-07 18:10:00	\N		<p>headaches</p>	E	\N	\N	t	f	2018-09-07 17:11:21.359117	2018-11-14 15:48:18.82537	t	WEB	<p>pollen</p>	2	f			\N	\N		f	\N	\N	\N
511	\N	289	S		LA	2018-12-15 13:58:00	\N	\N	None	E	\N	\N	t	f	2018-09-15 18:59:03.872656	2018-11-14 16:34:15.257613	t	APP	None	1	\N	\N	\N	\N	Malaria		f	\N		\N
689	\N	289	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-11-15 18:05:45.61814	2018-11-15 18:05:45.61814	f	APP	None	1	\N	\N	Coartem	\N	\N		f	\N		\N
705	7	322	S		MA	2018-11-23 09:45:00	\N	Stomach pains	Bloated stomach	S	\N	\N	t	f	2018-11-23 17:20:00.994863	2018-11-23 17:20:00.994863	f	APP	Pollen	3	\N	\N		\N			f	\N		\N
785	\N	322	T	Naa	LA	2018-12-15 15:31:00	\N	\N	No	E	\N	\N	t	f	2018-12-13 11:32:10.407629	2019-02-05 17:56:50.662105	t	APP	No	1	\N	\N	\N	\N	Lab		f	5	F	t
715	\N	322	T	Jhui	PDDP	\N	\N		Kiytj	S	\N	\N	t	f	2018-11-28 11:53:37.093602	2018-11-28 11:53:37.093602	f	APP	Kuu	\N	\N	\N	Yyuu	\N		0202233117	f	14	M	\N
579	\N	322	S		LA	2018-09-20 08:50:00	\N	\N	None	S	\N	\N	t	f	2018-09-20 08:50:37.71999	2019-02-05 18:05:27.583361	t	APP	Dont know 	1	\N	\N	\N	\N	Sugar level		f	\N		t
770	\N	322	T	Nii	HC	2018-12-11 18:05:00	\N	No	No	E	\N	\N	t	f	2018-12-11 18:05:18.416737	2019-02-05 18:18:25.879123	t	APP	No	1	\N	\N	No	\N		250862333	t	53	M	t
746	1	322	S		MA	2018-12-06 18:22:00	\N	None	None	E	\N	\N	t	f	2018-12-06 18:22:30.879984	2018-12-13 12:25:39.963055	t	APP	None	1	\N	\N	\N	\N			f	\N		t
800	\N	330	S		MD	\N	\N	\N	Love	S	\N	\N	t	f	2018-12-13 13:32:20.987504	2018-12-13 14:31:15.689921	t	APP	None	1	\N	\N	Advil	\N	\N		f	\N		t
815	\N	257	S		LA	2018-12-31 00:18:00	\N	\N	Diabetes 	S	\N	\N	t	f	2018-12-14 08:19:00.070774	2018-12-14 09:37:27.737631	t	APP	None 	1	\N	\N	\N	\N			f	\N		t
141	\N	137	\N	\N	PDDP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 18:20:54.527939	2018-04-26 18:20:54.527939	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
835	\N	257	S		MD	\N	\N	\N	Diab	S	\N	\N	t	f	2018-12-15 07:05:32.740055	2018-12-15 10:05:11.143637	t	APP	Non	1	\N	\N	Para	\N	\N		f	\N		\N
849	1	257	T	Freddie	MA	2018-12-21 00:15:00	\N	Diabetes 	Hrn	S	\N	\N	t	f	2018-12-18 10:15:56.499953	2018-12-19 12:31:55.980966	t	APP	None	1	\N	\N	\N	\N		0099999	f	64	M	\N
822	\N	331	S		VC	2018-12-14 08:33:00	\N	Headache	None	S	\N	\N	t	f	2018-12-14 08:34:07.236761	2018-12-20 11:19:11.033834	f	APP	Dust	\N	\N	\N	Para	\N	\N		t	\N		\N
842	\N	257	S		HC	2018-12-15 08:35:00	\N	Headaches	Diab	S	\N	\N	t	f	2018-12-15 08:35:13.264159	2018-12-20 17:35:03.508768	f	APP	Non	1	\N	\N	Para	\N			t	\N		\N
808	\N	331	S		LA	2018-12-13 19:23:00	\N	\N	None	S	\N	\N	t	f	2018-12-13 19:23:10.530076	2018-12-21 12:47:39.83687	t	APP	None	3	\N	\N	\N	\N	Urine		f	\N		\N
855	1	333	T	Hi	MA	2018-12-21 14:11:00	\N	Current	Bh	S	\N	\N	t	f	2018-12-21 14:12:17.417539	2018-12-21 14:12:17.417539	f	APP	Hh	1	\N	\N	\N	\N		028552548	f	52	M	\N
862	1	257	S		MA	2018-12-22 10:41:00	\N	Head	Head 	E	\N	\N	t	f	2018-12-22 10:41:57.040456	2018-12-22 10:41:57.040456	f	APP	Non 	1	\N	\N	\N	\N			f	\N		\N
869	\N	331	S		LA	2018-12-22 11:52:00	\N	\N	Tesr	S	\N	\N	t	f	2018-12-22 11:52:46.402733	2018-12-22 11:52:46.402733	f	APP	Test\nTest\nTest	3	\N	\N	\N	\N	Urine		f	\N		\N
876	\N	334	S		LA	2018-12-25 09:56:00	\N	\N	None	E	\N	\N	t	f	2018-12-25 06:56:56.061308	2018-12-25 06:56:56.061308	f	APP	None	2	\N	\N	\N	\N	None		f	\N		\N
828	\N	322	S		LA	2018-12-24 12:23:00	\N	\N	Testing	S	\N	\N	t	f	2018-12-14 12:18:25.67461	2019-01-02 10:33:45.785369	t	APP	None	1	\N	\N	\N	\N	Bypass		f	\N		t
895	8	334	S		MA	2019-02-07 19:44:00	\N	No idea	No idea	E	\N	\N	t	f	2019-01-07 14:45:03.527418	2019-01-07 14:45:03.527418	f	APP	None	1	\N	\N	\N	\N			f	\N		\N
612	\N	257	S		PDHC	2018-09-24 20:44:00	\N	Sm	Nka	S	\N	\N	t	f	2018-09-24 20:44:13.684641	2018-09-24 20:44:13.684641	f	APP	Noa	1	\N	\N	Para	\N			f	\N		\N
466	\N	289	S		LA	2018-08-20 15:29:00	\N	\N	None	E	\N	\N	t	f	2018-08-20 15:30:36.708683	2018-08-22 17:14:06.612442	t	APP	None	1	\N	\N	\N	\N	Malaria		f	\N		t
779	\N	322	T	Naa	PDDP	\N	\N	\N	No	E	\N	\N	t	f	2018-12-11 18:24:36.439302	2018-12-11 18:25:32.170638	f	APP	No	\N	\N	\N	Vit c	25	\N	0242458933	t	25	F	\N
474	\N	289	S		HC	2018-08-23 09:30:00	\N	No	No	S	\N	\N	t	f	2018-08-22 17:20:38.512321	2018-08-22 17:26:06.13464	t	APP	No	1	\N	\N	No	\N			t	\N	\N	t
621	\N	272	S		PDDP	\N	\N	\N	Coughing since morning	S	\N	\N	t	f	2018-09-25 09:13:53.699931	2018-09-25 09:23:26.761412	t	APP	Stress	\N	\N	\N	Paracetamol,procold	\N	\N		t	\N		\N
480	\N	300	S		LA	2018-12-08 09:20:00	\N	\N	Headaches	S	\N	\N	t	f	2018-09-05 15:38:52.60433	2018-09-05 15:56:05.174507	t	APP	Pollen, onion	2	\N	\N	\N	\N	Blood test		f	\N		t
488	\N	302	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-09-07 18:22:19.036624	2018-09-07 18:22:19.036624	f	APP	\N	2	t	Freda Addae	\N	\N	\N	\N	f	\N	\N	\N
605	\N	322	T	Hu	PDHC	2018-09-22 09:58:00	\N	Hijg	Cccf	E	\N	\N	t	f	2018-09-22 21:54:21.358211	2018-09-25 10:07:40.033155	f	APP	Fffvb	1	\N	\N	 Bccd	\N		024976533	t	23	F	\N
771	\N	322	S		PC	2018-12-11 18:12:00	\N	No	No	S	\N	\N	t	f	2018-12-11 18:12:15.171193	2018-12-11 18:28:38.352209	f	APP	No	\N	\N	\N	No	\N	\N		t	\N		\N
504	\N	306	S		VC	2018-11-15 10:05:00	\N	Stomach pains	Stomach pains	E	\N	\N	t	f	2018-09-11 10:23:22.274375	2018-09-13 18:06:19.145566	t	APP	Onion and pollen	\N	\N	\N	Magacid	\N	\N		t	\N		\N
512	\N	289	S		VC	2018-11-15 23:59:00	\N	Ok	Ok	E	\N	\N	t	f	2018-09-15 18:59:50.988193	2018-09-15 19:45:42.83899	t	APP	Ok	\N	\N	\N	Ok	\N	\N		t	\N		\N
877	\N	332	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-12-28 11:44:31.460031	2018-12-28 11:44:31.460031	f	APP	\N	1	t		\N	\N	\N	\N	f	\N	\N	\N
528	\N	321	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-09-17 12:32:15.473549	2018-09-17 12:40:53.820442	t	APP	\N	1	t		\N	\N	\N	\N	t	\N	\N	\N
520	\N	272	T	Yawa	MD	\N	\N	\N	Went to the hospital last week	S	\N	\N	t	f	2018-09-17 10:44:10.715604	2018-09-17 18:29:41.341338	t	APP	None	1	\N	\N	Paracetamol,vitamin c,procold	\N	\N	0279454771	f	25	F	\N
629	\N	272	S		PDVC	2018-09-27 08:32:00	\N	I am okay	None	S	\N	\N	t	f	2018-09-27 08:32:25.509415	2018-09-27 16:03:44.358362	t	APP	None	\N	\N	\N	None	\N	\N		t	\N		\N
536	\N	322	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-09-17 18:31:36.467637	2018-09-17 18:58:17.538871	t	APP	\N	1	t	Naa maame	\N	\N	\N	\N	t	\N	\N	\N
549	\N	322	S		PC	2018-09-18 18:48:00	\N	headache	none	S	\N	\N	t	f	2018-09-18 18:48:09.055583	2018-09-18 18:48:09.055583	f	APP	none	\N	\N	\N	rest	\N	\N		f	\N		\N
557	\N	325	S		PC	2018-12-24 20:04:00	\N	Weak knees 	Weak elbows 	E	\N	\N	t	f	2018-09-18 20:04:09.315735	2018-09-18 20:12:04.422128	t	APP	N/a 	\N	\N	\N	Paracetamol	\N	\N		t	\N		\N
565	\N	272	T	Jerry Ababio	PDHC	2018-12-25 09:00:00	\N	Cant pick calls	None	S	\N	\N	t	f	2018-09-19 12:02:38.198705	2018-09-19 12:02:38.198705	f	APP	None	1	\N	\N	None	\N		0279454771	f	29	M	\N
596	\N	289	T	Ama Abrafi	PC	2018-09-20 11:14:00	\N	Catarrh 	Catarrh 	S	\N	\N	t	f	2018-09-20 11:09:21.514804	2018-09-20 11:09:21.514804	f	APP	None	\N	\N	\N	Cold	\N	\N	027454125	f	24	F	\N
793	\N	322	T	Kwesi	PDVC	2018-12-14 12:07:00	\N	Lol	I dont know	E	\N	\N	t	f	2018-12-13 12:07:44.031638	2019-02-05 18:08:09.693533	t	APP	No	\N	\N	\N	Lost	\N	\N		t	14	M	t
786	\N	322	S		VC	2018-12-13 11:33:00	\N	Please	List	S	\N	\N	t	f	2018-12-13 11:47:46.615622	2018-12-13 11:55:13.929073	f	APP	List	\N	\N	\N	List	\N	\N		t	\N		\N
588	\N	322	T	Jude	PDVC	2018-09-22 11:24:00	\N	Tired	Dont know what to say	E	\N	\N	t	f	2018-09-20 09:24:50.030724	2018-09-21 04:46:21.176796	t	APP	None	\N	\N	\N	None	\N	\N	0243174778	t	30	M	t
643	\N	257	S		VC	2018-09-28 15:27:00	\N	Sdddd	Sdffff	S	\N	\N	t	f	2018-09-28 15:27:21.782888	2018-09-28 15:40:11.609827	t	APP	Sdddd	\N	\N	\N	Edddf	\N	\N		t	\N		t
883	\N	322	S		LA	2019-01-02 12:15:00	\N	\N	None	S	\N	\N	t	f	2019-01-02 12:15:15.959853	2019-02-05 17:56:34.492078	t	APP	None	1	\N	\N	\N	\N	Urine		f	\N		t
660	\N	139	S		MD	\N	\N	\N	Tramol	E	\N	\N	t	f	2018-11-13 00:59:53.876067	2018-11-13 01:00:47.298173	t	APP	None	1	\N	\N	Paracetamol, Tramol	\N	\N		f	\N		\N
671	\N	139	S		MD	\N	\N	\N	Hsh	S	\N	\N	t	f	2018-11-13 01:40:22.416091	2018-11-13 01:40:56.637384	t	APP	Geg	1	\N	\N	Tje	\N	\N		f	\N		\N
496	\N	304	S		PC	2018-09-11 10:30:00	\N	Hi	Hello	S	\N	\N	t	f	2018-09-10 17:51:21.713625	2018-09-10 18:31:51.591384	f	APP	Hello	\N	\N	\N	None	\N	\N		t	\N		\N
682	\N	139	S		MD	\N	\N	\N	Hdhdbdh	S	\N	\N	t	f	2018-11-13 08:01:54.947911	2018-11-13 08:02:17.55351	t	APP		1	\N	\N	Yhebb	\N	\N		f	\N		\N
716	0	322	S		PDHC	2018-11-29 15:30:00	\N	Headache 	None	S	\N	\N	t	f	2018-11-28 11:59:18.378774	2018-11-28 11:59:18.378774	f	APP	None	1	\N	\N	None	\N			f	\N	\N	\N
725	\N	322	T	Noo	PC	2018-11-28 15:30:00	\N	None	Jo	S	\N	\N	t	f	2018-11-28 12:57:15.992113	2018-11-28 13:44:26.766358	f	APP	No	\N	\N	\N	None	\N		0248775444	t	32	F	\N
733	\N	322	T	Hi	VC	2018-11-28 15:30:00	\N	Hj	Cv	E	\N	\N	t	f	2018-11-28 13:28:07.177516	2018-11-28 13:45:22.363141	f	APP	Cb	\N	\N	\N	Fhh	\N		0988766655	t	34	F	\N
698	0	322	S		LA	2018-11-23 00:19:00	\N		Gyy	S	\N	\N	t	f	2018-11-23 00:19:39.399331	2019-02-05 18:05:16.107641	t	APP	Guihh	1	\N	\N		\N	Ggh		f	\N		t
836	\N	257	T	Kofi	LA	2018-12-15 07:21:00	\N	\N	Diab	E	\N	\N	t	f	2018-12-15 07:22:01.049697	2018-12-15 10:34:38.311505	t	APP	None	1	\N	\N	\N	\N	Urine	87665421	f	45	M	t
580	\N	322	S		LA	2018-09-25 08:51:00	\N	\N	None	E	\N	\N	t	f	2018-09-20 08:51:54.020837	2019-02-05 18:05:20.825322	t	APP	None	1	\N	\N	\N	\N	Blood count		f	\N		t
747	4	322	T	Naa	MA	2018-12-06 18:24:00	\N	None	None	S	\N	\N	t	f	2018-12-06 18:24:37.222943	2018-12-06 18:24:37.222943	f	APP		1	\N	\N	\N	\N		0248021111	f	24	F	\N
755	\N	322	S		LA	2018-12-10 17:57:00	\N	\N	Ffdgh	S	\N	\N	t	f	2018-12-10 17:58:04.835764	2018-12-10 17:58:04.835764	f	APP	Ytthu	1	\N	\N	\N	\N	Hftyy		f	\N		\N
917	\N	257	T	Kofi 	PDHC	2019-01-11 13:39:00	\N	Nkk	Nkkk	E	\N	\N	t	f	2019-01-11 13:39:09.753407	2019-01-24 10:55:32.264465	f	APP	Nkkk	1	\N	\N	Nkk	\N		998899033	t	54	M	\N
763	1	322	S		MA	2018-12-11 17:34:00	\N	None	None	S	\N	\N	t	f	2018-12-11 17:34:43.067853	2018-12-13 12:23:48.015853	t	APP	None	1	\N	\N	\N	\N			f	\N		t
573	\N	322	T	hgdffs	MA	2018-09-19 17:52:00	\N	gfdsg	gfsg	S	ghfdsg	323	t	f	2018-09-19 17:52:35.993547	2018-12-13 12:26:32.628631	t	APP	gfdg	\N	\N	\N	\N	\N		67525642	f	21	M	t
801	\N	330	S		LA	2018-12-25 13:37:00	\N	\N	None	S	\N	\N	t	f	2018-12-13 13:38:00.297268	2018-12-13 13:38:00.297268	f	APP	None	1	\N	\N	\N	\N	Spiine		f	\N		\N
809	1	257	S		MA	2018-12-18 03:12:00	\N	Hhh	Diabetes 	E	\N	\N	t	f	2018-12-14 00:12:13.384774	2018-12-14 00:17:56.520236	t	APP	None 	1	\N	\N	\N	\N			f	\N		t
816	7	331	S		MA	2019-09-14 08:21:00	\N	Cold	I dont remember	E	\N	\N	t	f	2018-12-14 08:24:06.698902	2018-12-14 08:24:06.698902	f	APP	None	3	\N	\N	\N	\N			f	\N		\N
823	\N	331	S		HC	2018-12-14 08:36:00	\N	Headache	Malaria	S	\N	\N	t	f	2018-12-14 08:36:16.867311	2018-12-14 08:36:16.867311	f	APP	Dust	3	\N	\N	Para	\N			f	\N		\N
740	0	257	T	Kofi	HC	2018-12-04 21:30:00	\N	Diab	Diabetic 	S	\N	\N	t	f	2018-12-01 13:15:22.006665	2018-12-14 10:21:47.947091	t	APP	Nka	1	\N	\N	Med	\N		0932	t	4690	F	\N
829	\N	257	S		LA	2018-12-17 17:37:00	\N	\N	Diabetes 	S	\N	\N	t	f	2018-12-14 17:37:34.48965	2018-12-14 17:55:53.295266	t	APP	None 	1	\N	\N	\N	\N	Urine		f	\N		\N
889	1	330	S		MA	2019-01-03 10:58:00	\N	Hello	Hi	S	\N	\N	t	f	2019-01-03 10:59:04.077663	2019-01-03 10:59:04.077663	f	APP	Hey	1	\N	\N	\N	\N			f	\N		\N
850	\N	257	S		HC	2018-12-18 16:29:00	\N	Nad	Diab	S	\N	\N	t	f	2018-12-18 16:29:26.039891	2018-12-18 16:41:50.122252	t	APP	Non	1	\N	\N	Pmol	\N			t	\N		t
843	\N	257	S		HC	2018-12-15 08:43:00	\N	Headaches	Diab	S	\N	\N	t	f	2018-12-15 08:43:31.241615	2018-12-20 17:33:24.889234	f	APP	Non	1	\N	\N	Para	\N			t	\N		\N
856	\N	333	S		MD	\N	\N	\N	Hi	E	\N	\N	t	f	2018-12-21 14:15:18.764379	2018-12-21 14:15:18.764379	f	APP	Hi	1	\N	\N	Hi	\N	\N		f	\N		\N
863	\N	257	S		LA	2018-12-22 10:44:00	\N	\N	Diab	S	\N	\N	t	f	2018-12-22 10:44:45.125061	2018-12-22 10:44:45.125061	f	APP	None 	1	\N	\N	\N	\N	Urine\n		f	\N		\N
896	\N	338	S		LA	2019-01-08 13:29:00	\N			S	\N	\N	t	f	2019-01-08 10:32:02.58901	2019-01-08 10:32:02.58901	f	WEB	<p>l'\\';'</p>	4	f			\N	\N		f	\N	\N	\N
902	\N	342	S		VC	2019-01-11 09:19:00	\N	Cold	Headache	S	\N	\N	t	f	2019-01-11 09:19:51.91651	2019-01-11 09:19:51.91651	f	APP	Dust	\N	\N	\N	Para	\N	\N		f	\N		\N
910	\N	330	S		VC	2019-01-12 09:58:00	\N	Ok	Test	S	\N	\N	t	f	2019-01-11 09:56:24.402675	2019-01-11 09:56:24.402675	f	APP	Test 1	\N	\N	\N	Nine	\N	\N		f	\N		\N
870	\N	257	S		MD	\N	\N	\N	Head	S	\N	\N	t	f	2018-12-22 11:53:31.999546	2019-01-11 12:10:43.860864	t	APP	Non	1	\N	\N	Head	\N	\N		f	\N		\N
860	1	257	S		MA	2018-12-22 10:29:00	\N	Head	Head	S	\N	\N	t	f	2018-12-22 10:29:28.526052	2019-01-11 12:36:04.318584	t	APP	Non	1	\N	\N	\N	\N			f	\N		\N
912	8	257	S		MA	2019-01-11 13:22:00	\N	Fhh	Mmmns	S	\N	\N	t	f	2019-01-11 13:22:56.097843	2019-01-11 13:50:40.838735	t	APP	Bbsnn	1	\N	\N	\N	\N			f	\N		\N
918	\N	257	S		PDDP	\N	\N	\N	Nkk	E	\N	\N	t	f	2019-01-11 13:41:40.736632	2019-01-23 12:34:11.681857	t	APP	Nkk	\N	\N	\N	Nkk	69	\N		t	\N		\N
913	\N	257	S		MD	\N	\N	\N	Dbf	S	\N	\N	t	f	2019-01-11 13:23:52.252782	2019-02-05 11:40:35.537201	t	APP	No	1	\N	\N	Pmol	\N	\N		f	\N		\N
906	\N	342	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2019-01-11 09:26:42.395844	2019-02-05 17:42:27.700866	t	APP	Dust	3	\N	\N	Para	\N	\N		f	\N		\N
650	\N	322	S		MD	\N	\N	\N	gdasfda	S	\N	\N	t	f	2018-10-15 16:28:21.006461	2019-02-05 17:54:04.611388	t	APP	teqwr	1	\N	\N	hfdsgds	\N	\N		f	\N		t
706	0	322	S		LA	2018-11-23 22:30:00	\N		Stomach problems	S	\N	\N	t	f	2018-11-23 17:38:55.437651	2019-02-05 18:05:14.183736	t	APP	Apple	1	\N	\N		\N	Blood test		f	\N		t
290	1	251	S		MA	2018-07-22 17:27:00	\N	Headache	None	S	\N	\N	t	f	2018-07-22 17:27:38.996917	2018-07-22 17:27:38.996917	f	APP	None	\N	\N	\N	\N	\N	\N		f	\N	\N	f
198	\N	239	S	\N	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-05-10 10:37:03.108108	2018-07-22 22:29:24.973289	t	APP	\N	\N	\N	\N		\N	\N	\N	t	\N	\N	f
299	\N	247	S		PC	2018-07-23 22:53:00	\N	none	none	S	\N	\N	t	f	2018-07-22 22:59:28.330166	2018-07-22 22:59:28.330166	f	APP	none	\N	\N	\N	none	\N	\N		f	\N	\N	f
304	1	262	S		MA	2018-07-24 10:00:00	\N	Back pain	None	S	\N	\N	t	f	2018-07-23 10:54:22.523515	2018-07-23 10:54:22.523515	f	APP	None	\N	\N	\N	\N	\N	\N		f	\N	\N	f
314	4	247	S		MA	2018-07-23 00:00:00	\N	none	none	S	\N	\N	t	f	2018-07-23 11:26:12.300409	2018-07-23 11:26:12.300409	f	APP	none	\N	\N	\N	\N	\N	\N		f	\N	\N	f
272	\N	257	S		PC	2018-06-28 00:21:00	\N	Dm	Htn	E	\N	\N	t	f	2018-06-28 08:21:46.734712	2018-07-23 12:03:31.118362	t	APP	None	\N	\N	\N	Para	\N	\N		t	\N	\N	f
1	8	136	S		MA	2018-04-16 09:30:00	\N	<p>persistent headaches</p>	<p>diabetic</p>	E	\N	\N	t	f	2018-04-12 15:07:08.42265	2018-04-12 15:07:08.42265	f	WEB	<p>iron</p>	1	f			\N	\N	\N	f	\N	\N	f
380	1	276	S		MA	2018-08-09 14:13:00	\N	Sicm	Si k	E	\N	\N	t	f	2018-08-09 14:13:39.730205	2018-08-09 14:20:06.830305	t	APP	Nuts	1	\N	\N	\N	\N			f	\N	\N	f
333	\N	262	S		PC	2018-07-24 00:56:00	\N	Headache	None	S	\N	\N	t	f	2018-07-24 11:57:35.401827	2018-07-24 12:24:07.038755	t	APP	None	\N	\N	\N	Para	\N	\N		t	\N	\N	f
343	\N	267	S		LA	2018-08-10 11:30:00	\N	\N	None	E	\N	\N	t	f	2018-08-07 11:37:38.346525	2018-08-07 12:05:26.56147	t	APP	None	1	\N	\N	\N	\N	Malaria		f	\N	\N	f
348	\N	139	S		HC	2018-08-08 21:42:00	\N			S	\N	\N	t	f	2018-08-07 21:42:53.599361	2018-08-07 21:45:00.618065	f	WEB		2	f			\N	\N		t	\N	\N	f
349	\N	268	S		PD	\N	\N			S	\N	\N	t	f	2018-08-07 23:00:51.837772	2018-08-07 23:02:29.027451	t	WEB		1	t	Ago Nam		\N	\N		f	\N	\N	f
338	\N	262	S		PDDP	\N	\N			S	\N	\N	t	f	2018-07-24 15:13:38.598538	2018-08-08 11:29:20.980484	f	WEB		\N	f		<p>vitamin c</p>	\N	\N		t	\N	\N	f
261	8	257	S		VC	2018-07-07 16:58:00	\N	<p>hi</p>	<p>hi</p>	S	<p>hi</p>	258	t	f	2018-06-21 13:57:59.804069	2018-09-24 20:37:13.868196	t	PTL	\N	1	\N	\N	\N	\N	\N	\N	t	\N	\N	t
294	\N	251	T	Grandma	HC	2018-07-22 10:43:00	\N	Old age	Menopause	S	\N	\N	t	f	2018-07-22 22:44:07.497192	2018-08-08 12:37:04.53457	f	APP	Alot	\N	\N	\N	Alot	\N	\N	0244184775	t	\N	\N	f
385	\N	276	T	Maame Yaa	HC	2018-08-09 14:46:00	\N	Sleepy	None	E	\N	\N	t	f	2018-08-09 14:46:55.120516	2018-08-09 14:53:45.976132	f	APP	Sugar	\N	\N	\N	None	\N		0302502257	t	\N	\N	f
373	\N	276	\N	\N	PD	\N	\N	\N	Diabetes	\N	\N	\N	t	f	2018-08-09 12:43:58.139049	2018-08-09 12:46:31.741668	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
387	\N	276	T	Brother	PDVC	2018-08-09 16:03:00	\N	Mm	Bad	E	\N	\N	t	f	2018-08-09 16:03:49.870595	2018-08-09 16:18:21.006784	t	APP	Nuts	\N	\N	\N	Nuts	\N	\N	12	t	\N	\N	f
398	\N	277	S		PDDP	\N	\N			S	\N	\N	t	f	2018-08-10 12:27:25.501288	2018-08-10 12:43:13.35565	t	WEB		\N	f		<p>fd fg sddf f</p>\r\n<p>&nbsp;f gfg f</p>\r\n<p>&nbsp;gfg fg</p>\r\n<p>&nbsp;fg fg</p>	123	\N		t	\N	\N	f
406	1	278	S		MA	2018-08-14 16:10:00	\N	Headaches	Diabetes	S	\N	\N	t	f	2018-08-13 14:10:24.511548	2018-08-13 14:10:24.511548	f	APP	Nka	1	\N	\N	\N	\N			f	\N	\N	f
413	\N	257	S		PDVC	2018-08-13 20:35:00	\N	Headach	Dm	E	\N	\N	t	f	2018-08-13 16:35:13.342442	2018-08-13 16:35:13.342442	f	APP	Nka	\N	\N	\N	Para	\N	\N		f	\N	\N	f
418	\N	283	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-08-16 09:49:51.344734	2018-08-16 09:49:51.344734	f	APP	\N	3	t	\N	\N	\N	\N	\N	f	\N	\N	f
423	\N	247	T	Randy	PDHC	2018-08-24 00:00:00	\N	Fgh	Fdsaf	S	\N	\N	t	f	2018-08-16 18:37:05.307863	2018-08-16 18:37:05.307863	f	APP	Fdsa	3	\N	\N	Gfdg	\N		0541840988	f	\N	\N	f
430	\N	247	S		PDHC	2018-08-16 00:00:00	\N	Gfdgs	Gfsdg	S	\N	\N	t	f	2018-08-16 19:36:18.562505	2018-08-16 19:36:18.562505	f	APP	Gfss	1	\N	\N	Tgfds	\N			f	\N	\N	f
433	\N	247	S		PDVC	2018-08-21 19:43:00	\N	Gfdgs	Gds	S	\N	\N	t	f	2018-08-16 19:43:06.234742	2018-08-16 19:43:06.234742	f	APP	 Fdsgfd	\N	\N	\N	Gfdsg	\N	\N		f	\N	\N	f
442	\N	286	S		MD	\N	\N	\N	Headache	S	\N	\N	t	f	2018-08-17 12:32:55.014481	2018-08-17 12:37:34.267786	t	APP	Beans	1	\N	\N	Paracetamol\nEfpac	\N	\N		f	\N		f
448	\N	287	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-08-17 15:40:02.166592	2018-08-17 15:40:02.166592	f	APP	\N	1	t		\N	\N	\N	\N	f	\N	\N	f
457	\N	286	S		PDVC	2018-10-18 12:24:00	\N	Checkup	None	S	\N	\N	t	f	2018-08-18 18:24:19.256913	2018-08-18 18:24:19.256913	f	APP		\N	\N	\N		\N	\N		f	\N		f
284	6	250	S		HC	2018-07-17 00:00:00	\N	noen	none	S	none	248	t	f	2018-07-17 18:28:47.332815	2018-08-19 21:48:57.934315	t	APP	\N	\N	\N	\N	\N	\N	\N		t	\N	\N	f
2	2	136	T	Freda	MA	2018-04-16 10:00:00	\N	Headache	Migraine	E	\N	\N	t	f	2018-04-12 16:41:08.399716	2018-04-12 16:44:22.576802	t	APP	Iron	2	\N	\N	\N	\N	\N	\N	f	\N	\N	f
82	\N	162	\N	\N	VC	2018-04-21 15:00:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-21 13:00:29.883675	2018-08-19 22:00:34.006418	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	f
462	\N	286	S		VC	2018-08-22 22:35:00	\N	Headache	None	S	\N	\N	t	f	2018-08-19 22:35:16.053933	2018-08-19 22:35:16.053933	f	APP	None	\N	\N	\N	None	\N	\N		f	\N		f
224	\N	247	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-06-06 12:36:34.158991	2018-06-07 11:08:09.39778	t	APP	\N	1	t	Frank	\N	\N	\N	\N	\N	\N	\N	f
278	\N	247	S		LA	2018-06-30 00:00:00	\N	\N	Headache	E	\N	\N	t	f	2018-06-28 11:23:31.606338	2018-06-28 11:23:31.606338	f	APP	None	1	\N	\N	\N	\N	Laterine test		f	\N	\N	f
240	\N	254	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-06-15 12:46:32.753278	2018-06-15 12:46:32.753278	f	APP	\N	1	t	Dr. Frank	\N	\N	\N	\N	f	\N	\N	f
265	\N	247	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-06-24 17:44:32.788009	2018-07-03 12:59:25.658593	t	APP	none	1	\N	\N	Paracetamol	\N	\N		t	\N	\N	f
269	\N	247	S		PC	2018-06-29 12:01:00	\N	teeth burns	none	S	\N	\N	t	f	2018-06-25 12:01:52.451805	2018-07-03 14:56:51.484241	f	APP	none	\N	\N	\N	none	\N	\N		t	\N	\N	f
249	4	256	S		MA	2018-07-05 18:59:00	\N	<p>Headaches</p>	<p>GDM</p>	E	\N	\N	t	f	2018-06-19 16:00:12.93431	2018-06-19 17:00:12.223099	t	WEB	<p>none</p>	1	f			\N	\N		f	\N	\N	f
282	9	250	S		PC	2018-07-17 00:00:00	\N	headache	none	S		248	t	f	2018-07-17 16:27:52.148459	2018-07-17 16:27:52.148459	f	APP	\N	\N	\N	\N	\N	\N	\N		f	\N	\N	f
250	\N	256	S		LA	2018-06-28 19:21:00	\N		<p>diabetes</p>	E	\N	\N	t	f	2018-06-19 16:21:51.029774	2018-06-19 17:14:32.600227	t	WEB	<p>none</p>	1	f			\N	\N		f	\N	\N	f
248	\N	256	S		PD	\N	\N		<p>HTN</p>	E	\N	\N	t	f	2018-06-19 15:56:00.986826	2018-06-19 17:55:25.578325	t	WEB		1	t	koby appaih		\N	\N		f	\N	\N	f
227	\N	247	S		PC	2018-06-08 23:09:00	\N	Want to make free night call with you	Missed someone	S	\N	\N	t	f	2018-06-07 11:10:46.67815	2018-06-07 12:14:30.555615	t	APP	Divided attention	\N	\N	\N	Free night calls, funny conversations	\N	\N		f	\N	\N	f
295	6	251	S		MA	2018-07-22 10:48:00	\N	Headache	Headache	S	\N	\N	t	f	2018-07-22 22:49:18.542138	2018-07-22 22:49:18.542138	f	APP	None	\N	\N	\N	\N	\N	\N		f	\N	\N	f
451	\N	286	S		PDHC	2018-08-17 00:00:00	\N	Checkups	Noen	S	\N	\N	t	f	2018-08-17 18:07:05.228785	2018-08-20 08:52:41.855732	t	APP	None	1	\N	\N	None	\N			t	\N	\N	t
363	\N	272	S		PDHC	2018-08-31 09:32:00	\N	Pretty	Pretty	S	\N	\N	t	f	2018-08-09 09:36:47.709306	2018-08-20 17:28:06.286287	t	APP	Pretty	\N	\N	\N	Pretty	\N			t	\N	\N	t
368	\N	272	T	Richard 	PDVC	2018-08-09 11:23:00	\N	Stress	Stress	E	\N	\N	t	f	2018-08-09 11:20:28.328701	2018-08-20 17:28:16.762466	t	APP	Stress	\N	\N	\N	Stressed	\N	\N	0279421235	t	\N	\N	t
427	\N	247	S		PDVC	2018-08-16 19:15:00	\N	Ghgfd	Gfds	S	\N	\N	t	f	2018-08-16 19:15:10.319472	2018-08-24 14:43:23.225239	t	APP	Gfds	\N	\N	\N	Gfs	\N	\N		t	\N	\N	t
359	\N	272	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-08-08 18:41:33.803518	2018-09-06 12:29:06.248647	t	APP	None 	\N	\N	\N	None	\N	\N		t	\N	\N	t
354	\N	234	T	Andy	PC	2018-08-08 15:48:00	\N	Mental	Emotional	E	\N	\N	t	f	2018-08-08 15:48:39.800934	2018-09-17 10:39:45.171789	t	APP	Men	\N	\N	\N	Ladies	\N	\N		t	\N	\N	f
454	\N	286	S		PDHC	2018-08-18 00:00:00	\N	Fdasf	Fdsaf	S	\N	\N	t	f	2018-08-18 18:20:26.860193	2018-09-13 18:06:40.712575	t	APP	Fdsaf	3	\N	\N	Fdsag	\N			t	\N	\N	f
285	2	257	S		MA	2018-07-22 17:00:00	\N	Head	Diabetes 	E	\N	\N	t	f	2018-07-22 17:02:28.604866	2018-09-24 20:20:13.8183	t	APP	None 	\N	\N	\N	\N	\N	\N		f	\N	\N	t
319	9	257	S		HC	2018-07-23 12:29:00	\N	Home	Lots	S	None	258	t	f	2018-07-23 12:29:15.338713	2018-09-24 20:37:48.925147	t	APP	\N	\N	\N	\N	\N	\N	\N		f	\N	\N	t
286	\N	257	S		MD	\N	\N	\N	Diabeteb	S	\N	\N	t	f	2018-07-22 17:03:31.145739	2018-09-24 20:38:38.762896	t	APP	None	\N	\N	\N	Para	\N	\N		f	\N	\N	t
613	\N	257	S		PDDP	\N	\N	\N	Sid	S	\N	\N	t	f	2018-09-24 20:45:43.706526	2018-09-24 20:45:43.706526	f	APP	Bka	\N	\N	\N	Nif	\N	\N		f	\N		\N
410	\N	247	S		MD	\N	\N	\N	Diabetes	S	\N	\N	t	f	2018-08-13 15:59:53.670983	2018-11-13 00:03:28.292727	t	APP	Nka	\N	\N	\N	Paracetamol\nCjloroquine	\N	\N		f	\N	\N	f
382	\N	276	S		MD	\N	\N	\N	Diabews	E	\N	\N	t	f	2018-08-09 14:25:26.237511	2018-11-13 00:13:10.434103	t	APP	Nuts	1	\N	\N	Paracetamol	\N	\N		f	\N	\N	f
309	\N	262	S		MD	\N	\N	\N	Frequent headaches	S	\N	\N	t	f	2018-07-23 11:13:29.109429	2018-11-13 00:39:18.728282	t	APP	None	\N	\N	\N	None	\N	\N		f	\N	\N	f
291	\N	251	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-07-22 17:30:57.470579	2018-11-13 00:45:26.381684	t	APP	None	\N	\N	\N	Para	\N	\N		f	\N	\N	f
252	\N	139	S		MD	\N	\N			S	\N	\N	t	f	2018-06-19 16:57:19.238693	2018-11-13 00:46:21.848574	t	WEB		4	f			\N	\N		f	\N	\N	f
439	\N	247	T	Mansah	LA	2018-08-17 00:54:00	\N	\N	None	E	\N	\N	t	f	2018-08-17 10:54:14.101252	2018-11-14 16:46:43.069875	t	APP	None	1	\N	\N	\N	\N	Urine	0541840988	f	\N	\N	f
421	\N	247	S		LA	2018-08-16 00:00:00	\N	\N	Sfa	S	\N	\N	t	f	2018-08-16 18:10:28.178858	2018-11-14 16:57:32.60118	t	APP	Saf	1	\N	\N	\N	\N	Urine test		f	\N	\N	f
393	\N	276	S		LA	2018-08-09 16:24:00	\N	\N	Stones	E	\N	\N	t	f	2018-08-09 16:24:51.730078	2018-11-14 17:00:50.262303	t	APP	Nuts	1	\N	\N	\N	\N	Kidney\nColon\nLungs		f	\N	\N	f
445	\N	286	S		HC	2018-08-17 00:00:00	\N	Headache	None	S	\N	\N	t	f	2018-08-17 13:20:12.30845	2018-11-14 17:31:19.982226	t	APP	Beans\nKenkey	1	\N	\N	Efpac	\N			t	\N	\N	f
251	\N	139	S		HC	2018-06-20 16:44:00	\N			S	\N	\N	t	f	2018-06-19 16:44:48.500251	2018-12-19 17:59:04.036912	f	WEB		1	f			\N	\N		t	\N	\N	f
300	\N	247	S		LA	2018-07-23 00:00:00	\N	\N	none	S	\N	\N	t	f	2018-07-22 23:06:09.883384	2018-07-22 23:06:09.883384	f	APP	none	1	\N	\N	\N	\N	urine test		f	\N	\N	f
305	2	262	T	Paddy	MA	2018-07-24 10:30:00	\N	Fine	None	E	\N	\N	t	f	2018-07-23 10:57:24.276399	2018-07-23 10:57:24.276399	f	APP	None	\N	\N	\N	\N	\N	\N	0241234567	f	\N	\N	f
247	\N	256	T	Nana Kobi	HC	2018-06-22 10:53:00	\N	<p>diabetes review&nbsp;</p>	<p>DM</p>	E	\N	\N	t	f	2018-06-19 15:54:19.485831	2018-06-21 13:33:15.019391	t	WEB	<p>none</p>	1	f			\N	\N	7777777777	t	\N	\N	f
246	\N	256	S		VC	2018-06-28 18:50:00	\N	<p>haing headaches</p>	<p>meoldy</p>	S	\N	\N	t	f	2018-06-19 15:51:07.502313	2018-06-21 13:33:18.228301	t	WEB		\N	f			\N	\N		t	\N	\N	f
310	\N	262	S		LA	2018-07-26 10:00:00	\N	\N	Headaches	S	\N	\N	t	f	2018-07-23 11:17:03.742404	2018-07-23 11:17:03.742404	f	APP	None	\N	\N	\N	\N	\N	Blood test		f	\N	\N	f
388	\N	276	S		PDHC	2018-08-09 16:04:00	\N	Sick	Sickness	S	\N	\N	t	f	2018-08-09 16:04:38.928301	2018-08-09 16:18:34.553905	t	APP	Nuts	\N	\N	\N	Doctors	\N			t	\N	\N	f
260	8	257	S		PC	2018-07-07 16:49:00	\N	<p>see me in two weeks&nbsp;</p>		E		258	t	f	2018-06-21 13:48:44.51003	2018-07-23 12:01:03.245919	t	PTL	\N	1	\N	\N	\N	\N	\N	\N	t	\N	\N	f
315	1	247	T	Akos	MA	2018-07-25 00:00:00	\N	menstrual pains	headache	S	\N	\N	t	f	2018-07-23 12:15:22.370914	2018-07-23 12:15:22.370914	f	APP	none	1	\N	\N	\N	\N	\N		f	\N	\N	f
327	\N	247	S		LA	2018-07-23 00:00:00	\N	\N	none	S	\N	\N	t	f	2018-07-23 13:57:35.765046	2018-07-23 13:57:35.765046	f	APP	none	\N	\N	\N	\N	\N	none		f	\N	\N	f
334	\N	262	T	Yaa	PDVC	2018-07-26 23:58:00	\N	Foine	None	E	\N	\N	t	f	2018-07-24 11:58:34.930775	2018-07-24 12:24:33.121594	t	APP	None	\N	\N	\N	None	\N	\N		t	\N	\N	f
339	4	262	S		MA	2018-08-25 10:30:00	\N	Back pains i just cant sleep 	Para	E	\N	\N	t	f	2018-07-25 12:49:12.46473	2018-07-25 12:59:58.947962	t	APP	None	1	\N	\N	\N	\N	\N		f	\N	\N	f
402	\N	277	S		HC	2018-08-10 18:24:00	\N			S	\N	\N	t	f	2018-08-10 18:25:04.445655	2018-08-10 18:25:04.445655	f	WEB		1	f			\N	\N		f	\N	\N	f
344	\N	267	T	Paddy	VC	2018-08-07 12:00:00	\N	Headache	Weak	S	\N	\N	t	f	2018-08-07 11:45:18.211277	2018-08-07 12:54:44.349038	t	APP	Not that i know of	\N	\N	\N	Anti malaria drugs	\N	\N	0302502257	t	\N	\N	f
403	\N	277	S		VC	2018-08-11 18:25:00	\N			S	\N	\N	t	f	2018-08-10 18:25:27.028777	2018-08-10 18:25:27.028777	f	WEB		\N	f			\N	\N		f	\N	\N	f
350	\N	268	S		PDVC	2018-08-09 08:49:00	\N			S	\N	\N	t	f	2018-08-08 08:49:24.895207	2018-08-08 11:19:54.131729	t	WEB		\N	f			\N	\N		t	\N	\N	f
355	\N	247	S		PDVC	2018-08-08 16:24:00	\N	nothing	nothing	S	\N	\N	t	f	2018-08-08 16:25:01.177152	2018-08-08 16:25:01.177152	f	APP	none	\N	\N	\N	none	\N	\N		f	\N	\N	f
107	\N	137	T	Kwame	HC	2018-04-24 00:00:00	\N	Health	None	S	\N	\N	t	f	2018-04-24 19:11:22.363108	2018-08-08 20:30:44.722246	t	APP	None	1	\N	\N	\N	\N	\N	\N	t	\N	\N	f
364	1	267	S		MA	\N	\N	None	None	S	\N	\N	t	f	2018-08-09 11:03:50.803262	2018-08-09 11:45:12.31092	t	APP		1	\N	\N	\N	\N			f	\N	\N	f
369	\N	267	S		VC	2018-08-09 11:20:00	\N	Acne	None	E	\N	\N	t	f	2018-08-09 11:22:11.642673	2018-08-09 12:13:31.457459	t	APP		\N	\N	\N		\N	\N		t	\N	\N	f
374	\N	276	S		PC	2018-08-09 13:14:00	\N	Sick	Sick	S	\N	\N	t	f	2018-08-09 13:14:29.270216	2018-08-09 13:17:27.352089	f	APP		\N	\N	\N	Ibuprofen	\N	\N		t	\N	\N	f
378	8	276	S		PDHC	2018-08-09 13:38:00	\N	Htn	Htm	S	No prb	258	t	f	2018-08-09 13:38:57.92553	2018-08-09 13:38:57.92553	f	APP		\N	\N	\N	\N	\N			f	\N	\N	f
409	\N	278	\N	\N	PD	\N	\N	\N	Suab	\N	\N	\N	t	f	2018-08-13 15:35:43.944362	2018-08-13 16:14:24.382087	t	APP	\N	1	t	Yaw kusi mensah	\N	\N	\N	\N	t	\N	\N	f
414	\N	139	S		PDDP	\N	\N			S	\N	\N	t	f	2018-08-15 11:19:55.87257	2018-08-15 11:21:24.879945	t	WEB		\N	f		<p>fgfd</p>	45	\N		t	\N	\N	f
415	\N	139	S		PDHC	2018-08-16 11:53:00	\N			S	\N	\N	t	f	2018-08-15 11:53:44.41816	2018-08-15 11:54:44.702064	t	WEB		\N	f			\N	\N		t	\N	\N	f
419	7	284	S		MA	2018-08-21 00:00:00	\N	Gfdsg	Gdassdfa	S	\N	\N	t	f	2018-08-16 17:34:25.439377	2018-08-16 17:34:25.439377	f	APP	Fdafdsa	3	\N	\N	\N	\N			f	\N	\N	f
424	\N	247	S		PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-08-16 19:04:41.874782	2018-08-16 19:04:41.874782	f	APP	\N	\N	\N	\N	Ytreh gfs\nGfds	4	\N		f	\N	\N	f
428	\N	247	S		PDHC	2018-08-16 19:27:00	\N	Gfdsg	Gfsdg	S	\N	\N	t	f	2018-08-16 19:27:13.504897	2018-08-16 19:27:13.504897	f	APP	Gfdsg	1	\N	\N	Gfsdg	\N			f	\N	\N	f
431	\N	247	S		PDHC	2018-08-16 19:39:00	\N	Gfd	Gfsd	S	\N	\N	t	f	2018-08-16 19:39:04.295792	2018-08-16 19:39:04.295792	f	APP	Gfds	1	\N	\N	Ghgfd	\N			f	\N	\N	f
434	7	247	S		MA	2018-08-25 00:00:00	\N	Headache	None	S	\N	\N	t	f	2018-08-17 09:41:36.840423	2018-08-17 09:41:36.840423	f	APP	None	3	\N	\N	\N	\N			f	\N	\N	f
437	1	247	T	Ama	MA	2018-08-17 00:00:00	\N	Gsg	Gfsgfs	E	\N	\N	t	f	2018-08-17 10:29:26.660084	2018-08-17 10:29:26.660084	f	APP	None	1	\N	\N	\N	\N			f	14	F	f
446	\N	286	S		HC	2018-08-18 14:54:00	\N	<p>Checkup</p>	<p>None</p>	S		\N	t	f	2018-08-17 14:53:13.227225	2018-08-17 15:20:22.799639	t	PTL	None	1	\N	\N	None	\N			t	\N	\N	f
458	\N	286	S		PDVC	2018-08-20 18:25:00	\N	None	Noneno	S	\N	\N	t	f	2018-08-18 18:26:04.66493	2018-08-18 18:26:04.66493	f	APP	None	\N	\N	\N	None	\N	\N		f	\N		f
320	\N	247	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-07-23 12:37:39.419691	2018-08-19 21:21:14.36736	t	APP	none	\N	\N	\N	efpac	\N	\N		f	\N	\N	f
287	\N	257	S		LA	2018-07-22 17:08:00	\N	\N	Diab	S	\N	\N	t	f	2018-07-22 17:08:59.910038	2018-09-24 20:21:55.378029	t	APP	None	\N	\N	\N	\N	\N	Fifidine 		f	\N	\N	t
55	1	137	T	Adjoa	MA	2018-04-25 09:00:00	\N	Diarrhoea	Waist pain	S	\N	\N	t	f	2018-04-19 15:38:37.94788	2018-04-20 16:42:39.167713	t	APP		1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
432	\N	247	S		PC	2018-08-16 19:44:00	\N	Hgdf	Gfds	S	\N	\N	t	f	2018-08-16 19:41:19.498129	2018-08-16 19:41:19.498129	f	APP	Gfds	\N	\N	\N	Gfds	\N	\N		f	\N	\N	f
279	\N	139	S		LA	2018-06-28 11:23:00	\N			S	\N	\N	t	f	2018-06-28 11:24:33.185429	2018-06-28 11:24:33.185429	f	WEB		4	f			\N	\N		f	\N	\N	f
389	\N	276	S		PDHC	2018-08-09 16:05:00	\N	Hshs	Bad	E	\N	\N	t	f	2018-08-09 16:05:22.852666	2018-08-09 16:18:11.139288	t	APP	Issj	\N	\N	\N	Medicien	\N			t	\N	\N	f
283	7	250	S		VC	2018-07-22 00:00:00	\N	none	none	S		248	t	f	2018-07-17 17:23:07.479925	2018-07-17 17:23:07.479925	f	APP	\N	\N	\N	\N	\N	\N	\N		f	\N	\N	f
228	\N	247	T	Akos	PC	2018-06-11 12:53:00	\N	Checkup	None	E	\N	\N	t	f	2018-06-07 12:53:42.02007	2018-07-22 22:31:07.184092	t	APP		\N	\N	\N		\N	\N	0541840988	t	\N	\N	f
242	\N	254	T	Kwabena	HC	2018-06-24 12:56:00	\N	None	None	E	\N	\N	t	f	2018-06-15 12:52:22.160469	2018-06-20 01:06:08.639786	t	APP	None	1	\N	\N	None	\N	\N	0277457214	f	\N	\N	f
241	\N	254	T	Yaw	VC	2018-06-17 12:51:00	\N	Malaria	Malaria	S	\N	\N	t	f	2018-06-15 12:49:22.267247	2018-06-20 09:01:53.260958	t	APP	None	\N	\N	\N	None	\N	\N	0205869652	f	\N	\N	f
296	\N	247	S		PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-07-22 22:53:51.745058	2018-07-22 22:53:51.745058	f	APP	\N	\N	\N	\N		\N	\N		f	\N	\N	f
301	\N	257	S		PC	2018-07-23 09:53:00	\N	Nose bleed	Dm	S	\N	\N	t	f	2018-07-23 09:53:33.371613	2018-07-23 12:00:53.128732	t	APP	None	\N	\N	\N	Para	\N	\N		t	\N	\N	f
254	\N	256	S		HC	2018-07-07 21:24:00	\N	<p>head ups</p>	<p>diabetes</p>	S	\N	\N	t	f	2018-06-19 18:24:38.50915	2018-06-21 13:27:44.95534	t	WEB	<p>nione</p>	1	f			\N	\N		t	\N	\N	f
253	\N	256	T	kofi nti 	PC	2018-07-06 21:19:00	\N	<p>headache of my brother&nbsp;</p>	<p>disabetes&nbsp;</p>	S	\N	\N	t	f	2018-06-19 18:21:29.796485	2018-06-21 13:32:50.172849	t	WEB		\N	f			\N	\N	4444444444	t	\N	\N	f
255	\N	256	S		PDVC	2018-06-19 21:27:00	\N	<p>irorp[p</p>\r\n<p>[]t</p>	<p>jhwywiooyt</p>	E	\N	\N	t	f	2018-06-19 18:46:54.574249	2018-06-21 13:32:53.451085	t	WEB		\N	f			\N	\N		t	\N	\N	f
262	3	261	S		MA	2018-06-22 10:47:00	\N	Im dead	I died	E	\N	\N	t	f	2018-06-22 10:47:23.19514	2018-06-22 10:49:27.574117	t	APP	Happiness	\N	\N	\N	\N	\N	\N		f	\N	\N	f
266	\N	247	S		LA	2018-06-24 00:00:00	\N	\N	None	S	\N	\N	t	f	2018-06-24 17:53:33.396293	2018-06-24 17:53:33.396293	f	APP		1	\N	\N	\N	\N	Check ups		f	\N	\N	f
328	\N	247	S		LA	2018-07-23 00:00:00	\N	\N	none	S	\N	\N	t	f	2018-07-23 14:20:40.501437	2018-07-23 14:20:40.501437	f	APP	none	\N	\N	\N	\N	\N	none		f	\N	\N	f
435	7	247	T	Kofi	MA	2018-08-17 00:00:00	\N	Checkup	None	S	\N	\N	t	f	2018-08-17 09:48:14.358378	2018-08-17 09:48:14.358378	f	APP	None	3	\N	\N	\N	\N		0541840988	f	15	\N	f
335	\N	262	S		PDHC	2018-09-24 12:00:00	\N	Free	Free	S	\N	\N	t	f	2018-07-24 12:00:45.186325	2018-07-24 12:24:43.900064	t	APP	Free	\N	\N	\N	Free	\N	\N		t	\N	\N	f
449	\N	286	S		PC	2018-08-17 17:23:00	\N	Headache	Headache	S	\N	\N	t	f	2018-08-17 17:23:29.626752	2018-08-20 08:43:19.770148	t	APP	None	\N	\N	\N	None	\N	\N		t	\N		t
443	\N	286	S		LA	2018-08-17 12:34:00	\N	\N	Headache	S	\N	\N	t	f	2018-08-17 12:39:27.738446	2018-08-20 09:34:31.757821	t	APP	Beans	3	\N	\N	\N	\N	Urine\nMalaria		f	\N		t
396	\N	272			PDDP	\N	\N	\N	\N		\N	\N	t	f	2018-08-10 10:56:23.616623	2018-08-20 17:28:35.571138	t	APP	\N	\N	\N	\N		\N	\N		t	\N	\N	t
270	\N	247	S		PDVC	2018-06-25 12:03:00	\N	tooth ache	none	S	\N	\N	t	f	2018-06-25 12:03:30.745526	2018-08-24 14:37:54.855836	t	APP	none	\N	\N	\N	none	\N	\N		t	\N	\N	t
455	\N	286	S		PC	2018-08-18 18:30:00	\N	Gfag	Fdaf	S	\N	\N	t	f	2018-08-18 18:22:00.26354	2018-09-17 10:39:25.020606	t	APP	Afas	\N	\N	\N	Fafs	\N	\N		t	\N		f
452	\N	286	S		PDHC	2018-08-19 00:00:00	\N	Headache	None	S	\N	\N	t	f	2018-08-18 18:13:28.391921	2018-09-17 12:08:00.75087	f	APP	None	1	\N	\N	None	\N			t	\N	\N	f
273	\N	257	S		PDVC	2018-06-28 08:26:00	\N	Dm	Gono	S	\N	\N	t	f	2018-06-28 08:26:56.394398	2018-09-24 20:31:16.934279	t	APP	None 	\N	\N	\N	Para	\N	\N		t	\N	\N	t
274	\N	257	T	Kofi 	PDHC	2018-06-28 08:29:00	\N	Tomy	Htn	S	\N	\N	t	f	2018-06-28 08:29:07.624976	2018-09-24 20:32:32.596554	t	APP	 None	1	\N	\N	Para	\N	\N	90002255	t	\N	\N	t
407	\N	278	S		MD	\N	\N	\N	Diabetes 	E	\N	\N	t	f	2018-08-13 14:18:24.667356	2018-11-13 00:06:07.445983	t	APP	Nka	\N	\N	\N	Paracetamol \nChkoroquine \nAcetaminophine	\N	\N		f	\N	\N	f
306	\N	262	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-07-23 11:00:55.931196	2018-11-13 00:43:48.530326	t	APP	None	\N	\N	\N	Para	\N	\N		f	\N	\N	f
707	11	289	S		MA	2018-11-23 16:34:00	\N	None	Dont remember	S	\N	\N	t	f	2018-11-23 18:15:56.05855	2018-11-23 18:15:56.05855	f	APP	None	1	\N	\N		\N			f	\N		\N
316	9	257	S		LA	2018-07-23 12:24:00	\N	Diabetes 	Bp	S		258	t	f	2018-07-23 12:24:55.017124	2018-12-14 16:44:53.813433	t	APP	\N	\N	\N	\N	\N	\N	\N		f	\N	\N	f
345	\N	267	T	Grandma	HC	2018-08-07 12:30:00	\N	Old age	None\nNone\nNone\nNone\nNone	E	\N	\N	t	f	2018-08-07 11:54:06.258067	2018-08-08 12:07:41.574065	t	APP	A lot i dont know	\N	\N	\N	I dont know 	\N	\N		t	\N	\N	f
351	\N	272	\N	\N	PD	\N	\N	\N	Love	\N	\N	\N	t	f	2018-08-08 14:47:36.231385	2018-08-08 15:07:11.874659	t	APP	\N	3	t	\N	\N	\N	\N	\N	f	\N	\N	f
397	\N	277	S		HC	2018-08-10 10:59:00	\N	<p>djm djk d m jskdj dm kdj m</p>	<p>df kd ksk jsk</p>	S	\N	\N	t	f	2018-08-10 10:59:57.980957	2018-08-10 11:54:24.502453	t	WEB	<p>kdjf ka kdj</p>	1	f			\N	\N		t	\N	\N	f
360	9	262	S		MA	2018-08-09 00:00:00	\N	Diarrhea	None	S		264	t	f	2018-08-09 08:50:03.162762	2018-08-09 08:50:03.162762	f	APP	None	\N	\N	\N	\N	\N			f	\N	\N	f
365	1	267	S		MA	2018-08-09 11:07:00	\N	Sleepy all the time 	As usual sleeping saaaa	S	\N	\N	t	f	2018-08-09 11:09:33.51444	2018-08-09 11:50:01.968075	t	APP	Not sleeping	1	\N	\N	\N	\N			f	\N	\N	f
370	\N	267	S		HC	2018-08-09 11:23:00	\N	Nothing	Headache	E	\N	\N	t	f	2018-08-09 11:23:50.588612	2018-08-09 12:12:02.768641	t	APP	Salt	\N	\N	\N	None	\N			t	\N	\N	f
375	\N	276	S		PDVC	2018-08-09 13:15:00	\N	Sick	Sick	E	\N	\N	t	f	2018-08-09 13:15:48.289218	2018-08-09 13:15:48.289218	f	APP		\N	\N	\N	Hsj	\N	\N		f	\N	\N	f
630	\N	272	T	Clarence	PDHC	2018-09-27 08:34:00	\N	Metallic	Metallic	E	\N	\N	t	f	2018-09-27 08:35:02.207071	2018-09-27 08:35:02.207071	f	APP	Metallic	2	\N	\N	None	\N		0269412536	f	26	M	\N
379	\N	276	S		PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-08-09 13:41:29.766311	2018-08-09 13:43:05.491528	t	APP	\N	\N	\N	\N		\N	\N		t	\N	\N	f
384	\N	276	S		VC	2018-08-10 14:45:00	\N	Headache	Migraine	S	\N	\N	t	f	2018-08-09 14:45:35.806135	2018-08-09 14:48:34.930112	t	APP	None	\N	\N	\N	Para	\N	\N		t	\N	\N	f
394	\N	277	S		PD	\N	\N		<p>diabetice</p>	S	\N	\N	t	f	2018-08-10 10:26:19.68207	2018-08-10 12:16:54.900957	t	WEB		3	f			\N	\N		f	\N	\N	f
404	\N	212	S		PC	2018-08-11 00:00:00	\N	None	None	S	None	264	t	f	2018-08-11 12:15:02.102374	2018-08-11 12:15:02.102374	f	APP	None	\N	\N	\N	\N	\N			f	\N	\N	f
311	\N	262	S		VC	2018-07-26 10:00:00	\N	Headache	Headache	E	\N	\N	t	f	2018-07-23 11:21:09.579515	2018-08-19 21:41:41.424084	t	APP	None	\N	\N	\N	None	\N	\N		t	\N	\N	f
411	\N	281	S		PD	\N	\N			S	\N	\N	t	f	2018-08-13 16:31:30.637484	2018-08-13 16:34:38.710099	t	WEB		1	f			\N	\N		t	\N	\N	f
416	\N	139	S		PDHC	2018-08-15 11:57:00	\N	Gh	Bh	S	\N	\N	t	f	2018-08-15 11:57:37.526422	2018-08-15 12:02:46.584578	t	APP	Vh	\N	\N	\N	Vg	\N			t	\N	\N	f
422	\N	247	S		HC	2018-08-19 18:23:00	\N	Dfas	Fsaf	S	\N	\N	t	f	2018-08-16 18:23:55.524733	2018-08-16 18:23:55.524733	f	APP	Fdsaf	3	\N	\N	Adsfad	\N			f	\N	\N	f
425	\N	247	S		PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-08-16 19:12:33.226543	2018-08-16 19:12:33.226543	f	APP	\N	\N	\N	\N	Gfdsg	4	\N		f	\N	\N	f
453	\N	286	S		PDHC	2018-08-20 00:00:00	\N	Rdfsdfa	Fdsfa	S	\N	\N	t	f	2018-08-18 18:17:01.862287	2018-08-18 18:17:01.862287	f	APP	Fdasf	3	\N	\N	Adsfa	\N			f	\N	\N	f
447	\N	286	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-08-17 15:30:15.645947	2018-08-17 17:08:24.64337	t	APP	\N	1	t	My Name	\N	\N	\N	\N	t	\N	\N	f
456	\N	286	S		PDVC	2018-08-18 19:22:00	\N	Headache	None	E	\N	\N	t	f	2018-08-18 18:22:42.194497	2018-08-18 18:22:42.194497	f	APP	None	\N	\N	\N	None	\N	\N		f	\N		f
57	\N	146	\N	\N	PDDP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:39:07.32885	2018-04-19 19:29:03.505701	t	APP	\N	\N	\N	\N	Tramadol \nErgometrine\n	7	\N	\N	f	\N	\N	f
243	\N	254	S		LA	2018-06-15 16:49:00	\N	\N	None	S	\N	\N	t	f	2018-06-15 16:44:22.949563	2018-06-16 00:38:55.52594	t	APP	None	1	\N	\N	\N	\N	None		f	\N	\N	f
3	1	139	S		MA	2018-04-14 10:20:00	\N	<p>A headache</p>\r\n<p>Cold</p>\r\n<p>&nbsp;</p>	<p>Diabetic</p>	S	\N	\N	t	f	2018-04-13 10:21:26.359927	2018-04-13 10:21:26.359927	f	WEB	<p>Sausage</p>	2	f			\N	\N	\N	f	\N	\N	f
4	4	137	S		MA	\N	\N	Check up	None	S	\N	\N	t	f	2018-04-13 10:34:50.193067	2018-04-13 10:34:50.193067	f	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
5	4	139	S		MA	2018-04-17 12:00:00	\N	Body pains 	Diabetic	S	\N	\N	t	f	2018-04-13 10:36:19.641441	2018-04-13 10:36:19.641441	f	APP		1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
6	\N	139	S		MD	\N	\N	\N	Diabetic	S	\N	\N	t	f	2018-04-13 15:18:18.06515	2018-04-13 16:18:41.799686	t	APP	None	1	\N	\N	Paracetamol\nCloroquine\nFeroglobin	\N	\N	\N	f	\N	\N	f
9	\N	136	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-13 16:04:00.228968	2018-04-13 16:19:57.017317	t	APP	None	2	\N	\N	Lonart	\N	\N	\N	f	\N	\N	f
10	\N	136	S		MD	\N	\N			S	\N	\N	t	f	2018-04-13 16:10:24.833278	2018-04-13 16:20:52.819689	t	WEB	<p>none</p>	1	f			\N	\N	\N	f	\N	\N	f
11	\N	136	S		LA	2018-04-16 13:22:00	\N	\N	Headache	E	\N	\N	t	f	2018-04-13 16:22:35.279813	2018-04-13 16:25:30.180503	t	APP	None	1	\N	\N	\N	\N	Pregnancy test	\N	f	\N	\N	f
12	\N	136	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-04-13 16:26:14.124538	2018-04-13 17:09:25.672952	t	APP	\N	2	t	\N	\N	\N	\N	\N	f	\N	\N	f
16	\N	139	S		VC	2018-04-17 09:20:00	\N			S	\N	\N	t	f	2018-04-16 09:16:26.370608	2018-04-16 10:54:44.313273	t	WEB		\N	f			\N	\N	\N	f	\N	\N	f
17	\N	139	\N	\N	VC	2018-04-16 09:18:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-16 09:18:05.372878	2018-04-16 10:55:23.42028	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
18	\N	139	S		HC	2018-04-17 09:42:00	\N	<p>have fever and headach</p>\r\n<p>Also feeling cold</p>	<p>Dibetic</p>	S	\N	\N	t	f	2018-04-16 09:33:23.7488	2018-04-16 10:56:29.341463	t	WEB	<p>None</p>	2	f			\N	\N	\N	f	\N	\N	f
19	\N	139	S		LA	2018-04-17 10:00:00	\N			S	\N	\N	t	f	2018-04-16 10:02:23.798149	2018-04-16 10:56:47.773896	t	WEB		2	f			\N	\N	\N	f	\N	\N	f
14	\N	137	T	Akose	MD	\N	\N	\N	None	E	\N	\N	t	f	2018-04-14 15:48:52.73289	2018-04-16 11:57:33.598878	t	APP	None	1	\N	\N	Eye problem	\N	\N	\N	f	\N	\N	f
20	\N	137	S		PD	\N	\N		<p>fghjghjjhhg</p>	S	\N	\N	t	f	2018-04-16 12:07:11.521627	2018-04-16 12:07:11.521627	f	WEB		1	f			\N	\N	\N	f	\N	\N	f
21	\N	139	\N	\N	PD	\N	\N	\N	Diabetic	\N	\N	\N	t	f	2018-04-16 12:12:29.484277	2018-04-16 12:12:55.299381	t	APP	\N	1	t	Ago Nam	\N	\N	\N	\N	f	\N	\N	f
23	8	137	S		MA	2018-04-25 12:20:00	\N	<p>Nose ache</p>		E	\N	\N	t	f	2018-04-16 12:24:17.657788	2018-04-16 12:24:17.657788	f	WEB		1	f			\N	\N	\N	f	\N	\N	f
24	1	137	T	Bertha	MA	2018-05-17 12:32:00	\N	Eye problem	Chills	E	\N	\N	t	f	2018-04-16 12:25:24.190507	2018-04-16 12:25:24.190507	f	APP	Cold	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
25	\N	139	\N	\N	PC	2018-04-16 12:31:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-16 12:31:59.265538	2018-04-16 12:32:14.777962	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
26	\N	137	S		LA	2018-05-24 00:00:00	\N	\N	None	S	\N	\N	t	f	2018-04-16 12:36:07.384636	2018-04-16 12:36:07.384636	f	APP	Cold,  teeth burns	1	\N	\N	\N	\N	Urinary	\N	f	\N	\N	f
27	\N	137	S		LA	2018-04-18 12:33:00	\N		<p>none</p>	S	\N	\N	t	f	2018-04-16 12:36:46.360061	2018-04-16 12:36:46.360061	f	WEB		2	f			\N	\N	\N	f	\N	\N	f
13	\N	136	\N	\N	VC	2018-04-17 13:36:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 16:37:04.670923	2018-04-16 12:46:12.754471	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
30	2	137	T	Kojo	MA	2018-12-16 00:00:00	\N	Waist pain	None	S	\N	\N	t	f	2018-04-17 22:41:20.575326	2018-04-17 22:41:20.575326	f	APP	Okro	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
33	\N	139	S		PDVC	2018-04-19 11:49:00	\N			S	\N	\N	t	f	2018-04-18 11:49:44.148587	2018-04-18 11:49:44.148587	f	WEB		\N	f			\N	\N	\N	f	\N	\N	f
35	\N	139	T	John	PDDP	\N	\N			S	\N	\N	t	f	2018-04-18 12:05:56.850955	2018-04-18 12:05:56.850955	f	WEB		\N	f		<p>Paracemol, cough mixture</p>	5	\N	\N	f	\N	\N	f
36	2	144	S		MA	2018-04-21 09:00:00	\N	<p>headaches</p>	<p>headache</p>	S	\N	\N	t	f	2018-04-18 16:04:03.915473	2018-04-18 16:30:37.860356	t	WEB	<p>none</p>	2	f			\N	\N	\N	f	\N	\N	f
41	\N	144	S		MD	\N	\N			S	\N	\N	t	f	2018-04-18 16:23:28.665974	2018-04-18 16:32:04.068477	t	WEB		1	f			\N	\N	\N	f	\N	\N	f
40	\N	144	T	Papa	HC	2018-04-26 08:20:00	\N			S	\N	\N	t	f	2018-04-18 16:20:44.978427	2018-04-18 16:33:16.265461	t	WEB		2	f			\N	\N	\N	f	\N	\N	f
39	\N	144	S		VC	2018-04-19 10:00:00	\N			E	\N	\N	t	f	2018-04-18 16:19:56.180418	2018-04-18 16:34:42.782814	t	WEB		\N	f			\N	\N	\N	f	\N	\N	f
321	\N	247	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-07-23 12:43:05.559214	2018-08-20 00:02:11.070168	t	APP	none	\N	\N	\N	none	\N	\N		f	\N	\N	t
292	\N	247	S		HC	2018-07-22 00:00:00	\N	None	None	S	\N	\N	t	f	2018-07-22 21:42:30.338954	2018-08-20 00:03:07.778373	t	APP	None	\N	\N	\N	None	\N	\N		t	\N	\N	t
450	\N	286	S		PDVC	2018-08-17 18:02:00	\N	Checkup	None	S	\N	\N	t	f	2018-08-17 18:01:20.781666	2018-08-20 08:50:58.265556	t	APP	None	\N	\N	\N	None	\N	\N		t	\N		t
444	\N	286	S		VC	2018-08-17 13:59:00	\N	Hunger	Bread seller did not come on time	S	\N	\N	t	f	2018-08-17 12:57:00.084095	2018-08-20 09:03:18.966313	t	APP		\N	\N	\N	Kinspisky’s food	\N	\N		t	\N		t
429	\N	247	S		PDHC	2018-08-16 19:31:00	\N	Gfdg	Gasd	S	\N	\N	t	f	2018-08-16 19:31:37.211927	2018-08-24 14:37:18.682086	t	APP	Gds	3	\N	\N	Gdadsa	\N			t	\N	\N	t
356	\N	247	S		PDVC	2018-08-09 16:51:00	\N	<p>nothing</p>	<p>headache</p>	S	\N	\N	t	f	2018-08-08 16:51:36.378547	2018-08-24 14:43:47.929245	t	WEB		\N	f			\N	\N		t	\N	\N	t
31	\N	139	S		PC	2018-04-19 11:00:00	\N			S	\N	\N	t	f	2018-04-18 09:59:01.859461	2018-09-17 12:18:02.67698	f	WEB		\N	f			\N	\N	\N	t	\N	\N	f
459	\N	286	S		PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-08-18 18:26:36.913294	2018-08-27 15:21:57.150433	t	APP	\N	\N	\N	\N	None	1	\N		t	\N	\N	f
412	\N	257	S		PC	2018-08-13 19:32:00	\N	Headach	Dm	E	\N	\N	t	f	2018-08-13 16:32:56.765661	2018-09-18 20:01:12.628123	t	APP	Nka	\N	\N	\N	Para	\N	\N		t	\N	\N	f
256	8	257	S		MA	2018-09-15 00:46:00	\N	Headaches 	Vesicare	S	\N	\N	t	f	2018-06-20 10:46:54.520965	2018-09-24 20:20:23.377805	t	APP	None	1	\N	\N	\N	\N	\N		f	\N	\N	t
438	\N	247	T	Appiah	MD	\N	\N	\N	None	E	\N	\N	t	f	2018-08-17 10:41:53.826225	2018-11-12 23:38:51.291423	t	APP	None	1	\N	\N	Efpac	\N	\N	0541840988	f	12	M	f
420	\N	284	S		MD	\N	\N	\N	Fdsafdsa	S	\N	\N	t	f	2018-08-16 17:48:54.606591	2018-11-12 23:56:16.523549	t	APP	Fdsaf	3	\N	\N	Hello	\N	\N		f	\N	\N	f
340	\N	262	S		MD	\N	\N	\N	None	E	\N	\N	t	f	2018-07-25 13:13:21.300744	2018-11-13 00:31:48.569534	t	APP	None	\N	\N	\N	Lonart	\N	\N		t	\N	\N	f
29	\N	137	S		MD	\N	\N	\N	None	E	\N	\N	t	f	2018-04-16 12:51:00.528325	2018-11-13 00:52:30.040623	t	APP	None	1	\N	\N	Borbor bitters	\N	\N	\N	f	\N	\N	f
8	\N	139	S		MD	\N	\N			S	\N	\N	t	f	2018-04-13 15:47:53.976648	2018-11-13 00:56:06.928406	t	WEB		2	f			\N	\N	\N	f	\N	\N	f
38	\N	144	S		LA	2018-04-18 16:18:00	\N			S	\N	\N	t	f	2018-04-18 16:18:56.182755	2018-04-18 16:35:18.806568	t	WEB		2	f			\N	\N	\N	f	\N	\N	f
37	8	144	S		MA	2018-04-26 16:09:00	\N			S	\N	\N	t	f	2018-04-18 16:09:46.75572	2018-04-18 16:36:11.322369	t	WEB		1	f			\N	\N	\N	f	\N	\N	f
42	\N	144	S		PD	\N	\N			S	\N	\N	t	f	2018-04-18 16:45:16.424382	2018-04-18 16:45:16.424382	f	WEB		1	t	doctor Ab		\N	\N	\N	f	\N	\N	f
43	1	136	T	1234	MA	2018-04-25 16:52:00	\N	<p>123</p>	<p>123</p>	S	\N	\N	t	f	2018-04-18 16:52:40.675868	2018-04-18 16:52:40.675868	f	WEB	<p>123</p>	1	f			\N	\N	\N	f	\N	\N	f
44	1	146	S		MA	2018-04-22 12:29:00	\N	Headaches	Labetal	S	\N	\N	t	f	2018-04-18 22:29:48.592667	2018-04-18 22:39:54.258668	t	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
45	\N	146	T	Kofi effah	MD	\N	\N	\N	None 	S	\N	\N	t	f	2018-04-18 22:43:02.937272	2018-04-18 22:48:02.278663	t	APP	None 	1	\N	\N	Paracetamol 	\N	\N	\N	f	\N	\N	f
47	\N	146	S		MD	\N	\N	\N	Diabetes 	E	\N	\N	t	f	2018-04-19 13:39:48.544188	2018-04-19 13:41:57.315002	t	APP	None	1	\N	\N	Halothane	\N	\N	\N	f	\N	\N	f
48	\N	146	S		LA	2018-07-19 17:44:00	\N	\N	Diabetes 	E	\N	\N	t	f	2018-04-19 13:44:26.954443	2018-04-19 13:47:37.736304	t	APP	Nil	1	\N	\N	\N	\N	Urine culture \nFull blood count	\N	f	\N	\N	f
46	\N	146	S		LA	2018-07-18 12:45:00	\N	\N	Diabetes 	S	\N	\N	t	f	2018-04-18 22:45:47.704028	2018-04-19 13:49:05.555251	t	APP	None 	1	\N	\N	\N	\N	Pelvic	\N	f	\N	\N	f
49	1	146	S		MA	2018-04-19 16:50:00	\N	Diabetes 	Diabetes	S	\N	\N	t	f	2018-04-19 13:50:59.628066	2018-04-19 13:50:59.628066	f	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
51	\N	146	\N	\N	PD	\N	\N	\N	Diabetes	\N	\N	\N	t	f	2018-04-19 13:53:46.330705	2018-04-19 14:02:01.522092	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
50	1	146	S		MA	2018-04-19 16:50:00	\N	Diabetes 	Diabetes	S	\N	\N	t	f	2018-04-19 13:51:09.933986	2018-04-19 14:03:35.300104	t	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
52	\N	150	S		VC	2018-04-19 18:15:00	\N			E	\N	\N	t	f	2018-04-19 15:15:25.296165	2018-04-19 15:15:25.296165	f	WEB		\N	f			\N	\N	\N	f	\N	\N	f
53	\N	150	S		VC	2018-04-19 18:19:00	\N			S	\N	\N	t	f	2018-04-19 15:20:55.705888	2018-04-19 15:20:55.705888	f	WEB		\N	f			\N	\N	\N	f	\N	\N	f
54	1	150	T	Gloria	MA	2018-04-19 18:27:00	\N	<p>early appointment</p>		S	\N	\N	t	f	2018-04-19 15:27:35.577922	2018-04-19 15:27:35.577922	f	WEB		1	f			\N	\N	\N	f	\N	\N	f
56	\N	146	\N	\N	PC	2018-08-19 21:37:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:37:37.845037	2018-04-19 19:25:00.80045	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
63	1	137	T	Dankwah	MA	2018-04-19 00:00:00	\N	Stomach upset	None	E	\N	\N	t	f	2018-04-19 19:30:34.409069	2018-04-19 19:30:34.409069	f	APP	None	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
58	\N	146	\N	\N	PDHC	2018-07-19 21:39:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:39:37.502717	2018-04-19 19:46:15.544437	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
59	\N	146	\N	\N	PDHC	2018-04-18 21:43:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:43:32.896127	2018-04-19 19:48:55.848783	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
64	\N	146	\N	\N	PDVC	2018-04-19 12:02:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 20:03:01.696819	2018-04-19 20:03:01.696819	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
66	1	156	S		MA	2018-04-22 10:53:00	\N	Broken leg	Migraine	S	\N	\N	t	f	2018-04-20 10:53:27.243007	2018-04-20 10:53:27.243007	f	APP	Calcium	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
69	\N	156	\N	\N	VC	2018-04-20 11:00:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-20 11:00:37.687158	2018-04-20 11:10:12.717898	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
65	8	136	S		MA	2018-04-21 10:34:00	\N	<p>diarrhoea</p>	<p>migraine</p>	S	\N	\N	t	f	2018-04-20 10:36:13.942623	2018-04-20 11:14:49.68883	t	WEB	<p>calcium</p>	1	f			\N	\N	\N	f	\N	\N	f
259	\N	257	\N	\N	PD	\N	\N	\N	Diabetic 	\N	\N	\N	t	f	2018-06-20 10:50:14.625223	2018-06-20 11:13:07.761346	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
229	\N	250	S		HC	2018-06-14 12:59:00	\N	Headache	Migraine	E	\N	\N	t	f	2018-06-14 12:56:43.817232	2018-06-22 09:47:11.722365	t	APP	None	1	\N	\N	None	\N	\N	\N	t	\N	\N	f
267	\N	247	S		VC	2018-06-29 18:07:00	\N	dizziness	headache	S	\N	\N	t	f	2018-06-24 18:07:19.877865	2018-07-02 22:26:46.443838	f	APP	none	\N	\N	\N	none	\N	\N		t	\N	\N	f
271	\N	247	S		PDHC	2018-06-30 12:05:00	\N	Homecare	none	S	\N	\N	t	f	2018-06-25 12:05:48.417419	2018-07-03 12:16:58.345047	f	APP	none	1	\N	\N	none	\N	\N		t	\N	\N	f
34	\N	139	S		PDHC	2018-04-19 11:54:00	\N			S	\N	\N	t	f	2018-04-18 11:54:31.549391	2018-07-03 12:26:55.975297	f	WEB		\N	f			\N	\N	\N	t	\N	\N	f
61	\N	146	\N	\N	VC	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:44:16.616285	2018-07-03 12:48:13.896834	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
32	\N	139	S		PC	2018-04-19 10:03:00	\N			S	\N	\N	t	f	2018-04-18 10:03:17.124561	2018-07-22 21:51:03.784117	f	WEB		\N	f			\N	\N	\N	t	\N	\N	f
15	\N	137	\N	\N	VC	2018-04-30 19:28:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-15 19:27:54.555682	2018-07-16 12:40:44.741982	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
28	\N	137	S		MD	\N	\N			E	\N	\N	t	f	2018-04-16 12:49:52.856846	2018-07-16 15:58:33.466289	t	WEB	<p>None</p>	2	f		<p>Para</p>\r\n<p>Efpac</p>\r\n<p>Herbal life</p>	\N	\N	\N	t	\N	\N	f
257	\N	257	S		VC	2018-09-22 07:48:00	\N	Diabetes review 	Gdm 	E	\N	\N	t	f	2018-06-20 10:48:15.361432	2018-09-24 20:37:28.099053	t	APP	None	\N	\N	\N	Vesicare 	\N	\N		t	\N	\N	t
67	\N	156	S		MD	\N	\N	\N	Migraine	S	\N	\N	t	f	2018-04-20 10:54:17.525141	2018-04-20 11:46:06.800645	t	APP	Iron	2	\N	\N	Para	\N	\N	\N	f	\N	\N	f
70	1	137	S		MA	2018-04-20 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-20 15:36:28.090052	2018-04-20 15:36:28.090052	f	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
7	\N	137	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-13 15:39:17.504395	2018-04-23 17:58:55.610557	t	APP	\N	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
22	\N	139	\N	\N	PDDP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-16 12:14:27.084389	2018-04-16 12:15:10.436936	t	APP	\N	\N	\N	\N	Paracetamol, zubes, feroglobin	5	\N	\N	f	\N	\N	f
72	\N	159	\N	\N	PD	\N	\N	\N	Diabetes	\N	\N	\N	t	f	2018-04-21 05:16:12.636272	2018-04-21 05:18:56.281571	t	APP	\N	2	t	Koku Apps	\N	\N	\N	\N	f	\N	\N	f
73	6	159	S		MA	2018-04-21 18:14:00	\N	Ghana	Togi	E	\N	\N	t	f	2018-04-21 06:14:37.728319	2018-04-21 06:14:37.728319	f	APP	Nonr	2	\N	\N	\N	\N	\N	\N	f	\N	\N	f
74	2	159	S		MA	2018-04-21 18:15:00	\N	Pisss	Naught	E	\N	\N	t	f	2018-04-21 06:15:27.98215	2018-04-21 06:15:27.98215	f	APP	Pls 	2	\N	\N	\N	\N	\N	\N	f	\N	\N	f
75	\N	159	S		MD	\N	\N	\N	Diabete	E	\N	\N	t	f	2018-04-21 06:17:03.353313	2018-04-21 06:27:31.692425	t	APP	Nana	2	\N	\N	Para	\N	\N	\N	f	\N	\N	f
76	\N	159	S		LA	2018-04-21 06:17:00	\N	\N	Diabets	E	\N	\N	t	f	2018-04-21 06:18:00.305644	2018-04-21 06:30:10.608007	t	APP	None	1	\N	\N	\N	\N	Hb	\N	f	\N	\N	f
77	\N	159	\N	\N	PC	2018-04-21 02:18:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-21 06:18:22.197866	2018-04-21 06:32:13.273496	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
78	\N	159	\N	\N	PDHC	2018-04-21 06:16:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-21 06:19:04.06063	2018-04-21 06:36:00.337745	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
80	\N	162	\N	\N	PD	\N	\N	\N	1 Previous Surgery \n	\N	\N	\N	t	f	2018-04-21 12:58:09.030619	2018-04-21 12:58:09.030619	f	APP	\N	2	t	\N	\N	\N	\N	\N	f	\N	\N	f
81	2	162	S		MA	2018-04-23 12:00:00	\N	Routine Check up\n	Nil	S	\N	\N	t	f	2018-04-21 12:59:59.910769	2018-04-21 12:59:59.910769	f	APP	None	2	\N	\N	\N	\N	\N	\N	f	\N	\N	f
83	\N	159	\N	\N	PC	2018-04-21 20:19:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-21 20:19:52.787736	2018-04-21 20:19:52.787736	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
84	\N	159	S		HC	2018-04-21 20:20:00	\N	Ndt	Rtin	S	\N	\N	t	f	2018-04-21 20:20:29.626403	2018-04-21 20:20:29.626403	f	APP	Nin	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
85	1	137	T	Mini	MA	2018-05-30 15:39:00	\N	Check up	None	S	\N	\N	t	f	2018-04-23 15:39:41.868282	2018-04-23 15:39:41.868282	f	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
86	2	137	S		MA	2018-04-23 00:00:00	\N	None	padmore123	S	\N	\N	t	f	2018-04-23 15:44:59.842424	2018-04-23 15:44:59.842424	f	APP	padmore123	2	\N	\N	\N	\N	\N	\N	f	\N	\N	f
87	6	137	S		MA	2018-04-23 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-23 15:53:08.255484	2018-04-23 15:53:08.255484	f	APP	None	2	\N	\N	\N	\N	\N	\N	f	\N	\N	f
88	3	137	S		MA	2018-04-23 15:58:00	\N	None	None	E	\N	\N	t	f	2018-04-23 15:58:36.698209	2018-04-23 15:58:36.698209	f	APP	None	2	\N	\N	\N	\N	\N	\N	f	\N	\N	f
89	3	137	S		MA	2018-04-23 00:00:00	\N	none	None	S	\N	\N	t	f	2018-04-23 16:07:49.175709	2018-04-23 16:07:49.175709	f	APP	none	2	\N	\N	\N	\N	\N	\N	f	\N	\N	f
90	6	137	S		MA	2018-04-23 00:00:00	\N	None	None	E	\N	\N	t	f	2018-04-23 16:38:00.687996	2018-04-23 16:38:00.687996	f	APP	None	2	\N	\N	\N	\N	\N	\N	f	\N	\N	f
95	3	137	S		MA	2018-04-23 17:06:00	\N	Check up	None	S	\N	\N	t	f	2018-04-23 17:06:23.825573	2018-04-23 17:06:23.825573	f	APP	None	2	\N	\N	\N	\N	\N	\N	f	\N	\N	f
100	\N	137	\N	\N	VC	2018-04-23 17:22:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-23 17:22:45.082931	2018-04-23 17:22:45.082931	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
99	\N	137	\N	\N	VC	2018-04-23 00:00:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-23 17:16:27.537649	2018-04-23 17:43:04.228999	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
97	\N	137	S		LA	2018-04-23 17:07:00	\N	\N	None	S	\N	\N	t	f	2018-04-23 17:07:59.908877	2018-04-23 17:52:54.008809	t	APP	None 	1	\N	\N	\N	\N	None	\N	f	\N	\N	f
101	\N	137	S		HC	2018-04-23 17:24:00	\N	None	None	S	\N	\N	t	f	2018-04-23 17:24:49.119267	2018-04-23 17:54:04.19971	t	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
96	\N	137	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-23 17:07:04.119171	2018-04-23 17:56:00.823334	t	APP	None	2	\N	\N	Efpac	\N	\N	\N	f	\N	\N	f
91	8	137	S		MA	2018-04-23 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-23 16:40:03.067204	2018-04-23 17:57:05.364632	t	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
102	8	155	S		MA	2018-04-23 21:25:00	\N	Hads	Mad	E	\N	\N	t	f	2018-04-23 21:25:43.168079	2018-04-23 21:25:43.168079	f	APP	Non	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
103	8	155	S		MA	2018-04-23 21:25:00	\N	Hads	Mad	E	\N	\N	t	f	2018-04-23 21:26:03.03637	2018-04-23 21:26:03.03637	f	APP	Non	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
105	\N	155	S		MD	\N	\N	\N	Duab	S	\N	\N	t	f	2018-04-23 21:47:04.157668	2018-04-23 22:20:12.782663	t	APP	Nik 	2	\N	\N	Tegretol	\N	\N	\N	f	\N	\N	f
108	\N	137	S		HC	2018-04-24 00:00:00	\N	Checks	None	S	\N	\N	t	f	2018-04-24 19:24:20.136319	2018-04-24 19:24:20.136319	f	APP	None	1	\N	\N	Efpac	\N	\N	\N	f	\N	\N	f
109	1	137	S		MA	2018-04-24 19:25:00	\N	Noon e	None	S	\N	\N	t	f	2018-04-24 19:27:12.992752	2018-04-24 19:27:12.992752	f	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
111	1	179	S		MA	2018-04-27 11:00:00	\N	Headache	None	S	\N	\N	t	f	2018-04-26 11:46:48.407294	2018-04-26 12:06:47.946087	t	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
258	\N	257	T	Kofi	HC	2018-12-25 10:49:00	\N	Fanaticism	Gdm	E	\N	\N	t	f	2018-06-20 10:49:39.980865	2018-09-24 20:38:01.902473	t	APP	None	1	\N	\N	Besides 	\N	\N	5633258	t	\N	\N	t
110	\N	137	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-24 19:29:01.569166	2018-11-13 00:49:49.140358	t	APP	None	1	\N	\N	Efpac	\N	\N	\N	f	\N	\N	f
708	\N	289	S		VC	2018-11-23 15:30:00	\N	None	None	S	\N	\N	t	f	2018-11-23 18:31:01.503771	2018-11-23 18:31:01.503771	f	APP	None	\N	\N	\N		\N			f	\N		\N
119	\N	137	\N	\N	VC	2018-04-26 12:31:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 12:31:42.966984	2018-04-26 12:31:42.966984	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
112	1	179	S		MA	2018-04-27 11:00:00	\N	Headache	None	S	\N	\N	f	f	2018-04-26 11:48:12.211171	2018-04-26 12:07:53.156588	t	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
113	\N	179	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-26 11:52:26.553989	2018-04-26 12:09:27.999467	t	APP	None	1	\N	\N	Vitamin c	\N	\N	\N	f	\N	\N	f
114	\N	179	S		LA	2018-04-26 11:54:00	\N	\N	None	S	\N	\N	t	f	2018-04-26 11:54:24.072629	2018-04-26 12:10:20.100055	t	APP	None	1	\N	\N	\N	\N	Malaria	\N	f	\N	\N	f
115	\N	179	\N	\N	VC	2018-04-26 00:57:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 11:54:45.814376	2018-04-26 12:11:40.390884	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
116	\N	179	S		HC	2018-04-26 01:55:00	\N	Knee pains	None	S	\N	\N	t	f	2018-04-26 11:56:23.051029	2018-04-26 12:13:33.383626	t	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
117	\N	179	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-04-26 11:56:54.503871	2018-04-26 12:20:50.348993	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
120	\N	179	\N	\N	PC	2018-04-26 12:34:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 12:34:55.885099	2018-04-26 12:34:55.885099	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
121	\N	137	\N	\N	VC	2018-04-26 12:36:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 12:36:28.208493	2018-04-26 12:36:28.208493	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
122	8	179	S		MA	2018-04-26 12:38:00	\N	Headache	None	S	\N	\N	t	f	2018-04-26 12:39:13.315989	2018-04-26 12:39:13.315989	f	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
124	\N	179	S		LA	2018-04-26 12:41:00	\N	\N	No	S	\N	\N	t	f	2018-04-26 12:41:38.667984	2018-04-26 12:41:38.667984	f	APP	No	2	\N	\N	\N	\N	Malaria	\N	f	\N	\N	f
125	\N	137	S		VC	2018-04-28 09:27:00	\N	Malaria	Chloroquine	S	\N	\N	t	f	2018-04-26 12:48:12.950947	2018-04-26 12:48:12.950947	f	APP	None	\N	\N	\N	None 	\N	\N	\N	f	\N	\N	f
127	4	179	S		MA	2018-04-26 13:27:00	\N	Headache 	None	S	\N	\N	t	f	2018-04-26 13:27:29.388585	2018-04-26 13:27:29.388585	f	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
128	8	180	S		MA	2018-04-27 13:00:00	\N	Headache	None	S	\N	\N	t	f	2018-04-26 15:48:51.919094	2018-04-26 15:48:51.919094	f	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
129	\N	180	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 16:05:49.745008	2018-04-26 16:05:49.745008	f	APP	\N	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
130	\N	137	S		VC	2018-04-26 00:00:00	\N	Line	None	S	\N	\N	t	f	2018-04-26 16:11:44.277618	2018-04-26 16:11:44.277618	f	APP	None	\N	\N	\N	None	\N	\N	\N	f	\N	\N	f
132	\N	137	S		VC	2018-04-26 00:00:00	\N	Feed	None	S	\N	\N	t	f	2018-04-26 16:47:24.367109	2018-04-26 16:47:24.367109	f	APP	None	\N	\N	\N	None	\N	\N	\N	f	\N	\N	f
118	\N	179	\N	\N	VC	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 12:23:29.380712	2018-07-03 13:23:02.711749	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
134	\N	137	T	Vinatieri	HC	2018-04-26 00:00:00	\N	Stroke	Waist	S	\N	\N	t	f	2018-04-26 17:23:53.076022	2018-04-26 17:23:53.076022	f	APP	Garlic	1	\N	\N	None	\N	\N	\N	f	\N	\N	f
135	\N	180	S		\N	2018-04-26 00:00:00	\N	Bottles	None	S	\N	\N	t	f	2018-04-26 17:37:36.782305	2018-04-26 17:37:36.782305	f	APP	None	1	\N	\N	None	\N	\N	\N	f	\N	\N	f
136	\N	180	T	Mart	\N	2018-04-26 00:00:00	\N	Checkups	None	S	\N	\N	t	f	2018-04-26 17:39:13.903562	2018-04-26 17:39:13.903562	f	APP		1	\N	\N		\N	\N	\N	f	\N	\N	f
137	\N	180	S		\N	2018-04-26 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-26 17:43:55.065439	2018-04-26 17:43:55.065439	f	APP		1	\N	\N		\N	\N	\N	f	\N	\N	f
123	\N	179	T	Nii	MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-26 12:40:44.706866	2018-06-24 16:40:13.023986	t	APP	None	1	\N	\N	Vitamin e	\N	\N	\N	t	\N	\N	f
94	\N	137	S		MD	\N	\N	\N	dfgdfhd	S	\N	\N	t	f	2018-04-23 16:50:25.622834	2018-07-03 13:08:56.186974	t	APP	fdfghfd	2	\N	\N	none	\N	\N	\N	t	\N	\N	f
126	\N	137	T	Mathan	VC	2018-04-26 13:02:00	\N	Running	None	S	\N	\N	t	f	2018-04-26 13:02:25.356645	2018-06-26 10:29:07.233027	t	APP	None	\N	\N	\N	None	\N	\N	\N	t	\N	\N	f
131	\N	137	S		VC	2018-04-26 00:00:00	\N	Home	None	S	\N	\N	t	f	2018-04-26 16:26:35.212333	2018-06-22 10:23:11.712865	t	APP	None	\N	\N	\N	None	\N	\N	\N	t	\N	\N	f
104	\N	155	T	Kofo Ghana	MD	\N	\N	\N	Diab	E	\N	\N	t	f	2018-04-23 21:36:48.121985	2018-06-22 09:43:36.881488	t	APP	Nil	2	\N	\N	Para	\N	\N	\N	t	\N	\N	f
79	\N	159	S		HC	2018-04-21 09:20:00	\N	Pad	Trouble	E	\N	\N	t	f	2018-04-21 06:20:08.742451	2018-07-03 18:51:04.156536	t	APP	None	2	\N	\N	\N	\N	\N	\N	t	\N	\N	f
93	\N	137	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-04-23 16:48:15.682819	2018-07-03 15:23:12.428029	t	APP	none	2	\N	\N	none	\N	\N	\N	t	\N	\N	f
71	\N	137	S		HC	2018-04-20 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-20 16:50:26.428397	2018-07-15 15:36:56.943098	t	APP	None	1	\N	\N	\N	\N	\N	\N	t	\N	\N	f
98	\N	137	\N	\N	VC	2018-04-30 17:08:00	\N	\N	\N	\N	\N	\N	t	f	2018-04-23 17:08:50.10843	2018-07-22 22:00:24.276144	t	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
390	\N	276	S		PDDP	\N	\N	\N	\N		\N	\N	t	f	2018-08-09 16:06:06.05979	2018-08-09 16:18:50.078199	t	APP	\N	\N	\N	\N		\N	\N		t	\N	\N	f
395	\N	267	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-08-10 10:50:40.103354	2018-08-13 02:19:37.990544	f	APP	\N	1	t	\N	\N	\N	\N	\N	t	\N	\N	f
62	\N	146	\N	\N	PDDP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-19 18:58:21.998159	2018-04-19 18:58:21.998159	f	APP	\N	\N	\N	\N	Durolex\nFlagyl \n	30	\N	\N	f	\N	\N	f
142	\N	137	\N	\N	PDDP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-26 18:37:27.681672	2018-04-26 18:37:27.681672	f	APP	\N	\N	\N	\N		\N	\N	\N	f	\N	\N	f
143	\N	137	\N	\N	DP	\N	\N	\N	\N	\N	\N	\N	t	f	2018-04-27 12:21:30.739442	2018-04-27 12:21:30.739442	f	APP	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
144	\N	137	S	\N	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-04-27 12:47:35.832314	2018-04-27 12:47:35.832314	f	APP	\N	\N	\N	\N		\N	\N	\N	f	\N	\N	f
263	\N	261	T	Mom	HC	2018-06-22 11:07:00	\N	Shes sick	Sickendss	E	\N	\N	t	f	2018-06-22 11:07:25.109641	2018-06-28 11:30:47.457883	t	APP	None	2	\N	\N	Cough syrup	\N	\N	30018292	t	\N	\N	f
146	\N	137	T	Ama	HC	2018-04-27 00:00:00	\N	Diarrhoea	None	E	\N	\N	t	f	2018-04-27 15:01:14.963691	2018-04-27 15:01:14.963691	f	APP	None	1	\N	\N		\N	\N	\N	f	\N	\N	f
147	\N	137	S		LA	2018-04-27 00:00:00	\N	\N	None	S	\N	\N	t	f	2018-04-27 17:47:17.59163	2018-04-27 17:47:17.59163	f	APP	None	1	\N	\N	\N	\N	Health	\N	f	\N	\N	f
183	\N	237	S	\N	PDDP	\N	\N	\N	\N		\N	\N	t	f	2018-05-09 15:49:03.826813	2018-07-03 13:19:00.886911	t	APP	\N	\N	\N	\N		\N	\N	\N	f	\N	\N	f
152	\N	146	S		LA	2018-05-02 19:01:00	\N	\N	Diabetes 	E	\N	\N	t	f	2018-05-02 19:01:29.697781	2018-05-02 19:01:29.697781	f	APP	None 	1	\N	\N	\N	\N	Urine test 	\N	f	\N	\N	f
150	1	146	S		MA	2018-05-02 18:58:00	\N	Headache 	Diabetes 	E	\N	\N	t	f	2018-05-02 18:58:59.482277	2018-05-02 19:01:31.060329	t	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
155	\N	146	S	\N	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-05-02 19:07:29.257627	2018-05-02 19:07:29.257627	f	APP	\N	\N	\N	\N		\N	\N	\N	f	\N	\N	f
156	4	159	S		MA	2018-05-02 19:48:00	\N	Med 	Db	S	\N	\N	t	f	2018-05-02 19:48:13.033824	2018-05-02 19:48:13.033824	f	APP	Nkne 	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
158	\N	159	S		LA	2018-05-02 19:49:00	\N	\N	None 	E	\N	\N	t	f	2018-05-02 19:49:34.760679	2018-05-02 19:49:34.760679	f	APP	Nome 	2	\N	\N	\N	\N	Urine 	\N	f	\N	\N	f
159	\N	159	S		LA	2018-05-02 19:52:00	\N	\N	Non 	E	\N	\N	t	f	2018-05-02 19:52:08.923852	2018-05-02 19:52:08.923852	f	APP	Non	2	\N	\N	\N	\N	Stool 	\N	f	\N	\N	f
312	\N	262	S		HC	2018-07-26 10:00:00	\N	Headache	Headache	E	\N	\N	t	f	2018-07-23 11:24:34.286287	2018-07-24 15:03:04.668788	t	APP	None	\N	\N	\N	None	\N	\N		f	\N	\N	f
293	\N	247	S		PDHC	2018-07-24 00:00:00	\N	Headache	None	S	\N	\N	t	f	2018-07-22 21:47:09.952156	2018-07-22 21:47:09.952156	f	APP	None	\N	\N	\N	Paracetamol	\N	\N		f	\N	\N	f
162	\N	159		\N	PDDP	\N	\N	\N	\N		\N	\N	t	f	2018-05-02 19:54:04.612297	2018-05-02 19:54:04.612297	f	APP	\N	\N	\N	\N		\N	\N	\N	f	\N	\N	f
163	\N	159	S	\N	PDDP	\N	\N	\N	\N		\N	\N	t	f	2018-05-02 19:54:19.93823	2018-05-02 19:54:19.93823	f	APP	\N	\N	\N	\N		\N	\N	\N	f	\N	\N	f
164	\N	159	S	\N	PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-05-02 19:54:43.008626	2018-05-02 19:54:43.008626	f	APP	\N	\N	\N	\N		\N	\N	\N	f	\N	\N	f
165	1	208	S		MA	2018-05-04 09:44:00	\N	None	None 	S	\N	\N	t	f	2018-05-04 09:44:41.248125	2018-05-04 09:44:41.248125	f	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
167	\N	216	\N	\N	PD	\N	\N	\N	Diabetic	\N	\N	\N	t	f	2018-05-04 14:27:18.625965	2018-05-04 14:44:02.70808	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
168	\N	208	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-05-04 15:22:54.682639	2018-05-04 15:25:09.662591	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
169	\N	229	S		PD	\N	\N			S	\N	\N	t	f	2018-05-05 14:27:41.448564	2018-05-05 14:31:52.724726	t	WEB		1	f			\N	\N	\N	f	\N	\N	f
192	\N	239	S	\N	PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-05-10 03:03:58.496353	2018-07-22 22:28:49.684489	t	APP	\N	\N	\N	\N		\N	\N	\N	t	\N	\N	f
189	\N	239	\N	\N	PD	\N	\N	\N	Diabetes 	\N	\N	\N	t	f	2018-05-10 02:35:27.674999	2018-05-10 02:58:42.503437	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
172	9	136	S		PD	2018-05-09 23:22:00	\N			S		\N	t	f	2018-05-05 22:22:11.14515	2018-05-05 22:22:32.486942	t	PTL	\N	3	\N	\N	\N	\N	\N	\N	f	\N	\N	f
170	9	137	T	Padmore	PD	2018-05-08 23:08:00	\N			E		\N	t	f	2018-05-05 22:08:33.424613	2018-05-05 22:22:52.029652	t	PTL	\N	3	\N	\N	\N	\N	\N	\N	f	\N	\N	f
173	8	232	T	Claire	MA	2018-05-07 17:21:00	\N	None	None	S	\N	\N	t	f	2018-05-07 13:21:34.012588	2018-05-07 15:06:33.608736	t	APP	None	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
174	\N	232	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-05-07 13:24:42.714815	2018-05-07 15:08:08.524081	t	APP	None	2	\N	\N	Vitamin c	\N	\N	\N	f	\N	\N	f
175	\N	232	S		LA	2018-05-07 13:31:00	\N	\N	None	S	\N	\N	t	f	2018-05-07 13:25:34.223964	2018-05-07 15:09:15.816693	t	APP	None	1	\N	\N	\N	\N	Malaria	\N	f	\N	\N	f
297	\N	247	T	Ama	PDHC	2018-07-26 00:00:00	\N	fever	malaria	S	\N	\N	t	f	2018-07-22 22:57:22.333618	2018-07-22 22:57:22.333618	f	APP	efpac	\N	\N	\N	none	\N	\N	0270000000	f	\N	\N	f
177	\N	193	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-05-08 18:01:45.141195	2018-05-08 20:33:21.88265	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
176	\N	232	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-05-07 15:22:08.059817	2018-05-08 20:33:45.355918	t	APP	\N	1	t	Ben	\N	\N	\N	\N	f	\N	\N	f
179	\N	234	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-05-09 09:27:48.535281	2018-05-09 09:38:38.786515	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
182	\N	237	\N	\N	PD	\N	\N	\N	Malaria 	\N	\N	\N	t	f	2018-05-09 15:28:05.27309	2018-05-09 15:47:40.864088	t	APP	\N	3	t	Yaw Adom	\N	\N	\N	\N	f	\N	\N	f
184	9	237	S		PC	2018-05-12 16:53:00	\N			E		230	t	f	2018-05-09 15:52:40.663781	2018-05-09 15:54:30.685649	t	PTL	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	f
302	\N	247	S		PC	2018-07-23 07:07:00	\N	Sick	None	S	\N	\N	t	f	2018-07-23 10:10:15.034281	2018-07-23 10:16:26.700267	t	APP	None	\N	\N	\N	None	\N	\N		t	\N	\N	f
288	\N	257	T	Gino	PC	2018-07-22 17:14:00	\N	Head	Diabete 	S	\N	\N	t	f	2018-07-22 17:10:16.928038	2018-07-23 12:02:43.204864	t	APP	None 	\N	\N	\N	Diidifine	\N	\N		t	\N	\N	f
151	\N	146	T	Kofi	MD	\N	\N	\N	Diabrsrs 	S	\N	\N	t	f	2018-05-02 18:59:49.609923	2018-11-13 00:47:55.630306	t	APP	Bonr 	1	\N	\N	Paracetamol	\N	\N	\N	f	\N	\N	f
92	\N	137	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-04-23 16:40:56.681799	2018-11-13 00:50:55.475747	t	APP	None	2	\N	\N	None	\N	\N	\N	t	\N	\N	f
203	4	136	T	Yaa	MA	2018-05-10 11:15:00	\N			S	\N	\N	t	f	2018-05-10 11:16:11.637488	2018-05-10 11:16:11.637488	f	WEB		1	f			\N	\N	501234567	f	\N	\N	f
204	8	136	T	Nana	MA	2018-05-10 11:17:00	\N			S	\N	\N	t	f	2018-05-10 11:17:44.240737	2018-05-10 11:17:44.240737	f	WEB		1	f			\N	\N	0201234567	f	\N	\N	f
205	8	136	T	Nii	MA	2018-05-10 14:24:00	\N			S	\N	\N	t	f	2018-05-10 14:24:04.375556	2018-05-10 14:24:04.375556	f	WEB		2	f			\N	\N	0266009887	f	\N	\N	f
196	1	239	S		MA	2019-05-10 10:35:00	\N	Vbbbv	Hfds	E	\N	\N	t	f	2018-05-10 10:35:41.191027	2018-05-10 15:20:25.142886	t	APP	Nino	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
201	\N	239	S		PDHC	2018-05-10 10:39:00	\N	Gtn	Accr	E	\N	\N	t	f	2018-05-10 10:39:29.637364	2018-05-10 15:30:45.532042	t	APP	Nono	2	\N	\N	Gtn	\N	\N	\N	f	\N	\N	f
200	\N	239	S		PDHC	2018-05-10 10:38:00	\N	Ghhy	Nuut	E	\N	\N	t	f	2018-05-10 10:38:21.582065	2018-05-10 15:31:22.761631	t	APP	Nono	1	\N	\N	Patpaddy 	\N	\N	\N	f	\N	\N	f
336	\N	262	S		PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-07-24 12:04:21.856177	2018-07-24 12:24:55.306342	t	APP	\N	\N	\N	\N		\N	\N		t	\N	\N	f
153	\N	146	S		PDVC	2018-05-02 19:05:00	\N	Diarrhoea 	DB	E	\N	\N	t	f	2018-05-02 19:05:19.736085	2018-07-24 16:12:24.239351	t	APP	None	\N	\N	\N	Pain	\N	\N	\N	t	\N	\N	f
190	\N	239	S		VC	2018-05-10 02:36:00	\N	Ghk	Gda	E	\N	\N	t	f	2018-05-10 02:36:15.429024	2018-05-10 15:41:25.63211	t	APP	Nib	\N	\N	\N	Hop	\N	\N	\N	f	\N	\N	f
188	\N	239	T	Hogg	LA	2018-05-10 02:34:00	\N	\N	Dib	S	\N	\N	t	f	2018-05-10 02:34:25.290004	2018-05-10 15:42:39.155909	t	APP	Nk 	1	\N	\N	\N	\N	Urine tes\nCbc\nMrsa	\N	f	\N	\N	f
187	\N	239	S		MD	\N	\N	\N	Iaasc	E	\N	\N	t	f	2018-05-10 02:32:48.398369	2018-05-10 15:47:24.960978	t	APP	Nibe	1	\N	\N	Hklo	\N	\N	\N	f	\N	\N	f
186	1	239	S		MA	2018-05-10 02:32:00	\N	Hoad	Gjisc	S	\N	\N	t	f	2018-05-10 02:32:18.863618	2018-05-10 15:47:56.483372	t	APP	Nlne	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
341	4	267	S		MA	2018-09-07 11:00:00	\N	Eyes hurt	Teary eye	S	\N	\N	t	f	2018-08-07 11:16:41.900359	2018-08-07 11:56:31.246543	t	APP	Onion	1	\N	\N	\N	\N	\N		f	\N	\N	f
207	1	137	T	Essel	MA	2018-05-11 00:00:00	\N	None	No	S	\N	\N	t	f	2018-05-11 03:25:10.694441	2018-05-11 03:25:10.694441	f	APP		1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
208	1	137	T	Kofi	MA	2018-06-11 00:00:00	\N	rfdsaf	fdsafasf	S	\N	\N	t	f	2018-05-11 03:28:10.130946	2018-05-11 03:28:10.130946	f	APP	fads	1	\N	\N	\N	\N	\N	\N	f	\N	\N	f
209	1	137	T	dad	MA	2018-05-11 00:00:00	\N	hgf	dfasf	E	\N	\N	t	f	2018-05-11 03:37:05.80313	2018-05-11 03:37:05.80313	f	APP	fads fa	1	\N	\N	\N	\N	\N	0541840988	f	\N	\N	f
346	4	247	S		LA	2018-08-08 09:30:00	\N	Headache	None	S	Check	248	t	f	2018-08-07 16:52:22.992528	2018-08-08 11:35:59.909703	t	APP	\N	\N	\N	\N	\N	\N	\N		f	\N	\N	f
139	\N	137	S		PDHC	2018-04-26 00:00:00	\N	Checkups	None	S	\N	\N	t	f	2018-04-26 17:52:41.924785	2018-06-22 09:48:44.927318	t	APP	Rice	2	\N	\N		\N	\N	\N	t	\N	\N	f
276	\N	257	S		LA	2018-06-28 20:49:00	\N	\N	Diabetic 	S	\N	\N	t	f	2018-06-28 08:49:44.767742	2018-09-24 20:22:01.649752	t	APP	None 	2	\N	\N	\N	\N	Urine test 		f	\N	\N	t
352	9	272	S		MA	2018-12-25 12:54:00	\N	Love	Love	S	\N	\N	t	f	2018-08-08 14:49:37.397284	2018-08-08 15:05:47.00546	t	APP	Love	3	\N	\N	\N	\N	\N		f	\N	\N	f
289	\N	257	T	Kwaku	PDVC	2018-07-22 17:11:00	\N	Head	DM	E	\N	\N	t	f	2018-07-22 17:11:26.666454	2018-09-24 20:31:11.631671	t	APP	None	\N	\N	\N	Fidione	\N	\N	00997766	t	\N	\N	t
361	9	262	S		LA	2018-08-11 00:00:00	\N	Checkup	None	S		264	t	f	2018-08-09 08:51:09.045593	2018-08-09 08:51:09.045593	f	APP	None	\N	\N	\N	\N	\N			f	\N	\N	f
148	1	193	S		MA	2018-05-02 12:15:00	\N			S	\N	\N	t	f	2018-04-30 12:15:46.848379	2018-06-13 13:28:43.62468	t	WEB		1	f			\N	\N	\N	f	\N	\N	f
391	1	276	S		MA	2018-08-09 16:21:00	\N	Medical problem	Never	S	\N	\N	t	f	2018-08-09 16:21:19.41036	2018-08-09 16:21:19.41036	f	APP	None	1	\N	\N	\N	\N			f	\N	\N	f
212	\N	137	T	Nath	LA	2018-05-11 00:00:00	\N	\N	fdaf	S	\N	\N	t	f	2018-05-11 04:10:36.519939	2018-05-11 04:10:36.519939	f	APP	far	1	\N	\N	\N	\N	fdaf	0541840988	f	\N	\N	f
318	4	257	S		PC	2018-07-23 12:28:00	\N	Think 	Hist 	S	Bome	258	t	f	2018-07-23 12:28:12.014923	2018-07-23 18:02:39.51881	f	APP	\N	\N	\N	\N	\N	\N	\N		t	\N	\N	f
211	\N	137	T	Edgar	MD	\N	\N	\N	rrqewr	E	\N	\N	t	f	2018-05-11 03:47:20.393134	2018-06-06 15:19:41.492567	t	APP	 gfdgs	1	\N	\N	her	\N	\N	0541840988	f	\N	\N	f
218	\N	137	T	Michael	PC	2018-05-11 04:51:00	\N	fa	fdsfs	E	\N	\N	t	f	2018-05-11 04:51:29.817718	2018-06-06 15:59:59.859756	t	APP	fdsaf	\N	\N	\N		\N	\N	0541840988	f	\N	\N	f
280	8	250	S		PC	2018-07-17 22:28:00	\N	None	none	S	None	\N	t	f	2018-07-17 15:39:40.030243	2018-07-20 10:41:21.152385	t	APP	\N	\N	\N	\N	\N	\N	\N		t	\N	\N	f
215	\N	137	T	Pogba	VC	2018-05-11 04:28:00	\N	rrrq	are	E	\N	\N	t	f	2018-05-11 04:28:50.36286	2018-06-11 10:38:25.783458	f	APP	gfdg	\N	\N	\N	gear	\N	\N	0541840988	f	\N	\N	f
214	\N	137	S		VC	2018-05-11 04:27:00	\N	Tooth ache	none	S	\N	\N	t	f	2018-05-11 04:27:39.446246	2018-06-13 12:53:34.138601	t	APP		\N	\N	\N		\N	\N		f	\N	\N	f
213	\N	137	T	Jacob	VC	2018-05-11 04:23:00	\N	fads	fdsaf	S	\N	\N	t	f	2018-05-11 04:26:47.704367	2018-06-13 13:26:55.468609	t	APP	fdafa	\N	\N	\N		\N	\N	0541840988	f	\N	\N	f
217	\N	137	S		PC	2018-05-11 04:47:00	\N	Hair	fdsaf	S	\N	\N	t	f	2018-05-11 04:47:49.667306	2018-06-13 13:49:05.632577	t	APP	fads	\N	\N	\N		\N	\N		f	\N	\N	f
106	\N	137	S		HC	2018-04-24 00:00:00	\N	Checkups	None	E	\N	\N	t	f	2018-04-24 19:05:03.810879	2018-07-22 22:00:46.575762	t	APP	None	1	\N	\N	\N	\N	\N	\N	t	\N	\N	f
140	\N	137	S		PDVC	2018-04-26 18:07:00	\N	Home	None	S	\N	\N	t	f	2018-04-26 18:08:08.952371	2018-07-22 22:30:12.404746	t	APP	None	\N	\N	\N	None	\N	\N	\N	t	\N	\N	f
298	\N	247	S		PDVC	2018-07-26 21:57:00	\N	checkup	none	S	\N	\N	t	f	2018-07-22 22:58:42.99478	2018-07-22 22:58:42.99478	f	APP	none	\N	\N	\N	none	\N	\N		f	\N	\N	f
303	\N	247	S		PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-07-23 10:26:07.349492	2018-07-23 10:26:07.349492	f	APP	\N	\N	\N	\N		\N	\N		f	\N	\N	f
233	4	251	S		MA	2018-06-18 09:30:00	\N	Headache	None	S	\N	\N	t	f	2018-06-15 10:30:56.236335	2018-06-15 10:30:56.236335	f	APP	None	1	\N	\N	\N	\N	\N		f	\N	\N	f
235	\N	251	T	Esi	LA	2018-06-18 10:30:00	\N	\N	None	S	\N	\N	t	f	2018-06-15 10:34:17.716192	2018-06-15 10:34:17.716192	f	APP	None	\N	\N	\N	\N	\N	Blood count	0203443235	f	\N	\N	f
232	4	251	S		MA	2018-06-18 09:30:00	\N	Headache	None	S	\N	\N	t	f	2018-06-15 10:29:57.931826	2018-06-16 00:43:25.11409	t	APP	None	1	\N	\N	\N	\N	\N		f	\N	\N	f
308	1	262	S		MA	2018-07-25 09:00:00	\N	Frequent headaches	Headache	S	\N	\N	t	f	2018-07-23 11:11:33.603604	2018-07-23 11:11:33.603604	f	APP	None	\N	\N	\N	\N	\N	\N		f	\N	\N	f
313	4	247	S		MA	2018-07-23 00:00:00	\N	none	none	S	\N	\N	t	f	2018-07-23 11:25:06.054613	2018-07-23 11:25:06.054613	f	APP	none	\N	\N	\N	\N	\N	\N		f	\N	\N	f
337	1	262	S		MA	2018-08-24 12:38:00	\N	Running	Headache	S	\N	\N	t	f	2018-07-24 12:36:53.543017	2018-07-24 12:41:03.449181	t	APP	Ion	1	\N	\N	\N	\N	\N		f	\N	\N	f
202	\N	239	S	\N	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-05-10 10:40:15.855817	2018-06-16 00:42:16.420962	t	APP	\N	\N	\N	\N		\N	\N	\N	f	\N	\N	f
206	\N	136	S		MD	\N	\N		<p>none</p>	S	\N	\N	t	f	2018-05-10 16:50:49.091546	2018-06-07 16:52:33.340181	t	WEB	<p>none</p>	1	f		<p>wormplex</p>	\N	\N		f	\N	\N	f
185	\N	146	T	Kobu2	HC	2018-08-01 08:00:00	\N	Medical 	Huddlt	E	\N	\N	t	f	2018-05-09 20:00:53.459606	2018-06-07 14:42:12.868517	t	APP	Assuming 	1	\N	\N	Pramed	\N	\N	\N	f	\N	\N	f
160	\N	159	S		VC	2018-05-02 19:53:00	\N	Consult	Db	E	\N	\N	t	f	2018-05-02 19:53:15.139822	2018-06-08 09:58:41.678047	t	APP	Non	\N	\N	\N	Pha	\N	\N	\N	f	\N	\N	f
171	9	137	T	Padmore	HC	2018-05-08 23:13:00	\N			E		\N	t	f	2018-05-05 22:13:13.971254	2018-06-07 16:54:12.9655	t	PTL	\N	3	\N	\N	\N	\N	\N	\N	f	\N	\N	f
145	\N	137	S		VC	2018-04-27 14:59:00	\N	None	None 	S	\N	\N	t	f	2018-04-27 14:59:44.246846	2018-06-07 16:54:49.197119	t	APP	None	\N	\N	\N	None	\N	\N	\N	f	\N	\N	f
154	\N	146	S		PDHC	2018-05-02 19:06:00	\N	Ha 	Pain	E	\N	\N	t	f	2018-05-02 19:06:51.641476	2018-06-10 20:23:49.984785	t	APP	Bine 	1	\N	\N	Para	\N	\N	\N	f	\N	\N	f
138	\N	137	S		HC	2018-04-26 00:00:00	\N	None	None	S	\N	\N	t	f	2018-04-26 17:49:20.958752	2018-06-10 20:23:20.508327	t	APP		1	\N	\N		\N	\N	\N	f	\N	\N	f
149	\N	193	S		HC	2018-05-03 10:42:00	\N	<p>Wond dressing</p>		S	\N	\N	t	f	2018-05-02 10:42:29.52193	2018-06-13 13:35:39.406599	t	WEB		1	f			\N	\N	\N	f	\N	\N	f
181	\N	137	S		PDHC	2018-05-09 14:21:00	\N	Home	None	S	\N	\N	t	f	2018-05-09 14:21:49.068022	2018-06-13 13:55:56.182289	t	APP	None	1	\N	\N	Top	\N	\N	\N	f	\N	\N	f
197	\N	239	S		VC	2018-05-10 22:36:00	\N	Jjkjd	Bhhyyr	E	\N	\N	t	f	2018-05-10 10:36:19.525655	2018-06-13 15:20:33.121002	t	APP	Nono	\N	\N	\N	Gttn	\N	\N	\N	f	\N	\N	f
191	\N	239	S		HC	2018-05-10 02:37:00	\N	Him	Gha	E	\N	\N	t	f	2018-05-10 02:37:11.25249	2018-06-13 17:46:14.162697	t	APP	Nin	1	\N	\N	Para	\N	\N	\N	f	\N	\N	f
180	\N	208	S	\N	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-05-09 14:10:27.926852	2018-06-14 06:49:42.075136	f	APP	\N	\N	\N	\N		\N	\N	\N	f	\N	\N	f
210	\N	137	T	Sdfsfa	MD	\N	\N	\N	rear	S	\N	\N	t	f	2018-05-11 03:46:29.855575	2018-06-20 09:23:53.808684	t	APP	rear	1	\N	\N	ear	\N	\N	\N	f	\N	\N	f
216	\N	137	T	Omar Sherif	HC	2018-05-11 00:00:00	\N	ghgjj	rear	S	\N	\N	t	f	2018-05-11 04:36:50.426934	2018-06-16 11:48:17.276494	t	APP	fsdaf	1	\N	\N	ret trqwfa 	\N	\N	0541840988	f	\N	\N	f
133	\N	137	S		PDVC	2018-04-26 16:55:00	\N	Checkups	None	S	\N	\N	t	f	2018-04-26 16:55:56.25055	2018-06-16 11:51:24.832859	t	APP		\N	\N	\N		\N	\N	\N	f	\N	\N	f
325	\N	247	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-07-23 13:14:38.274245	2018-08-24 15:09:49.395965	t	APP	none	1	\N	\N	none	\N	\N		t	\N	\N	t
366	\N	267	T	Andy	MD	\N	\N	\N	None	S	\N	\N	t	f	2018-08-09 11:13:04.829017	2018-11-13 00:18:42.28555	t	APP	Foreign drugs	1	\N	\N	Adom ko bitters	\N	\N		t	\N	\N	f
324	\N	247	S		MD	\N	\N	\N	none	S	\N	\N	t	f	2018-07-23 13:09:11.460256	2018-11-13 00:34:59.103579	t	APP	none	\N	\N	\N	none	\N	\N		t	\N	\N	f
317	3	257	T	Kofi	MD	2018-07-23 12:26:00	\N	Sm	Dm	S		258	t	f	2018-07-23 12:26:39.254552	2018-11-13 00:37:03.987962	t	APP	\N	\N	\N	\N	\N	\N	\N		f	\N	\N	f
690	1	322	S		MA	\N	\N	Head		S	\N	\N	t	f	2018-11-22 20:47:00.168175	2018-11-22 20:47:00.168175	f	APP		1	\N	\N	\N	\N			f	\N		\N
195	\N	139	T	Padmore Paddy	VC	2018-05-11 10:06:00	\N			S	\N	\N	t	f	2018-05-10 10:06:47.587306	2018-12-20 11:56:19.102612	t	WEB		\N	f			\N	\N	248990122	t	\N	\N	f
653	\N	322	S		MD	\N	\N	\N	kjn	S	\N	\N	t	f	2018-10-15 17:02:14.040115	2019-02-05 17:54:08.777878	t	APP	thjk	1	\N	\N		\N	\N		f	\N		t
222	\N	239	S		PDHC	2018-05-12 06:08:00	\N	Ghan	Hooi	E	\N	\N	t	f	2018-05-12 06:08:10.429882	2018-06-18 11:20:16.100792	t	APP	Nuui	1	\N	\N	Ntf	\N	\N	\N	f	\N	\N	f
236	\N	251	S		VC	2018-06-19 10:30:00	\N	Headache 	None	S	\N	\N	t	f	2018-06-15 10:35:16.948232	2018-06-20 09:18:35.116746	f	APP	None	\N	\N	\N	Para	\N	\N		f	\N	\N	f
237	\N	251	T	Grandma	HC	2018-06-15 10:45:00	\N	Old age	None	S	\N	\N	t	f	2018-06-15 10:41:11.483352	2018-06-21 09:56:16.966607	t	APP	Nonesense	2	\N	\N	Pressure	\N	\N	0201376542	f	\N	\N	f
234	\N	251	S		MD	\N	\N	\N	None	E	\N	\N	t	f	2018-06-15 10:33:12.533181	2018-06-21 10:56:40.222738	t	APP	None	1	\N	\N	Paracetamol	\N	\N		f	\N	\N	f
332	\N	262	\N	\N	PD	\N	\N	\N	None	\N	\N	\N	t	f	2018-07-23 16:09:45.691336	2018-07-23 17:52:18.537911	t	APP	\N	1	t	\N	\N	\N	\N	\N	f	\N	\N	f
353	\N	272	S		PC	2018-08-30 15:07:00	\N	Strong 	Strong 	E	\N	\N	t	f	2018-08-08 15:28:14.068685	2018-08-08 18:05:37.311114	t	APP	Very strong	\N	\N	\N	Faith\nHope \nLove	\N	\N		t	\N	\N	f
193	\N	239	S		PDVC	2018-05-10 03:04:00	\N	Doddy	Min	S	\N	\N	t	f	2018-05-10 03:04:42.431178	2018-06-21 18:20:08.909143	t	APP	Non	\N	\N	\N	Pata	\N	\N	\N	t	\N	\N	f
220	\N	137	T	Adwoa	PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-05-11 06:36:50.496396	2018-06-24 16:41:04.439094	t	APP	\N	\N	\N	\N		\N	\N	0541840988	t	\N	\N	f
223	\N	239	T	\N	PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-05-12 06:10:44.099556	2018-06-26 10:31:45.505165	t	APP	\N	\N	\N	\N		\N	\N	\N	t	\N	\N	f
219	\N	137	T	fdsafs	PDHC	2018-05-11 05:33:00	\N	fast	fast	E	\N	\N	t	f	2018-05-11 05:33:53.160265	2018-07-23 18:00:05.90205	t	APP	fsa	1	\N	\N	fdaf	\N	\N	0541840988	t	\N	\N	f
194	\N	239	T	Kofi baah	PDHC	2018-05-10 03:05:00	\N	Headaches 	Db	S	\N	\N	t	f	2018-05-10 03:06:00.822571	2018-07-23 18:00:51.110752	t	APP	Jon	1	\N	\N	Pata	\N	\N	\N	t	\N	\N	f
221	\N	239	T	Nans	PDVC	2018-05-12 06:07:00	\N	Think 	Thinl	S	\N	\N	t	f	2018-05-12 06:07:11.389334	2018-07-23 18:01:52.698965	t	APP	Non	\N	\N	\N	Noon	\N	\N	\N	t	\N	\N	f
199	\N	239	S		PDVC	2018-05-10 10:38:00	\N	Gtttc	Hiion	E	\N	\N	t	f	2018-05-10 10:37:37.84642	2018-07-24 16:11:31.296403	t	APP	Nono	\N	\N	\N	Gtb	\N	\N	\N	t	\N	\N	f
367	\N	267	S		LA	2018-08-10 11:30:00	\N	\N	Headache	S	\N	\N	t	f	2018-08-09 11:17:42.25277	2018-08-09 12:03:58.508602	t	APP	Para	2	\N	\N	\N	\N	Blood count		f	\N	\N	f
347	9	250	S		PC	2018-08-08 07:30:00	\N	Headache	None	S	Check	248	t	f	2018-08-07 17:54:19.695162	2018-08-08 18:05:53.061029	t	APP	\N	\N	\N	\N	\N	\N	\N		t	\N	\N	f
372	\N	272	T	Clarence	PC	2018-08-09 12:23:00	\N	Catarrh	None	S	\N	\N	t	f	2018-08-09 12:24:11.470671	2018-08-09 12:24:11.470671	f	APP	Dust	\N	\N	\N	Procold	\N	\N		f	\N	\N	f
377	\N	276	S		PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-08-09 13:19:19.285701	2018-08-09 13:25:22.92311	t	APP	\N	\N	\N	\N		\N	\N		t	\N	\N	f
386	\N	276	S		PC	2018-08-09 16:02:00	\N	Yeet	N	S	\N	\N	t	f	2018-08-09 16:02:57.545251	2018-08-09 16:19:06.424236	t	APP	Nuts	\N	\N	\N	CozRt	\N	\N		t	\N	\N	f
400	\N	277	S		PDVC	2018-08-11 12:29:00	\N			S	\N	\N	t	f	2018-08-10 12:29:46.826822	2018-08-10 12:33:40.340397	t	WEB		\N	f			\N	\N		t	\N	\N	f
401	\N	277	S		PDHC	2018-08-11 12:30:00	\N			S	\N	\N	t	f	2018-08-10 12:30:11.82543	2018-08-10 12:33:47.59508	t	WEB		\N	f			\N	\N		t	\N	\N	f
399	\N	277	S		PC	2018-08-10 12:29:00	\N			S	\N	\N	t	f	2018-08-10 12:29:22.599249	2018-08-10 12:33:26.714489	t	WEB		\N	f			\N	\N		t	\N	\N	f
417	\N	282	\N	\N	PD	\N	\N	\N	Dibetic\nAsmatic	\N	\N	\N	t	f	2018-08-16 08:42:38.111844	2018-08-16 08:42:38.111844	f	APP	\N	1	t	Ago Nam	\N	\N	\N	\N	f	\N	\N	f
426	\N	247	S		PDDP	\N	\N	\N	\N	S	\N	\N	t	f	2018-08-16 19:14:11.386788	2018-08-16 19:14:11.386788	f	APP	\N	\N	\N	\N	Gfdsg	\N	\N		f	\N	\N	f
362	\N	272	S		LA	2018-08-31 09:26:00	\N	\N	Beautiful 	S	\N	\N	t	f	2018-08-09 09:27:01.469924	2018-08-20 17:27:21.385365	t	APP	Beautiful 	\N	\N	\N	\N	\N	Beautiful 		f	\N	\N	t
358	\N	272	S		PDVC	2018-08-08 18:24:00	\N	Spine 	Spine 	S	\N	\N	t	f	2018-08-08 18:21:01.201056	2018-08-20 17:28:21.364608	t	APP	Spine	\N	\N	\N	Spine	\N	\N		t	\N	\N	t
381	\N	276	S		MD	\N	\N		<p>Uhh</p>	S		\N	t	f	2018-08-09 14:15:30.456207	2018-11-13 00:14:45.323301	t	PTL	Milk	1	\N	\N	Milk	\N	\N		f	\N	\N	f
467	\N	289	S		VC	2018-08-22 15:31:00	\N	Headache	None	E	\N	\N	t	f	2018-08-20 15:31:48.124879	2018-08-22 17:14:31.420495	t	APP	None	\N	\N	\N	None	\N	\N		t	\N		t
558	\N	325	S		PDVC	2018-10-18 07:05:00	\N	Wdk overdose 	Fainting spells 	E	\N	\N	t	f	2018-09-18 20:05:27.068548	2018-09-18 20:14:58.615016	t	APP	N/a 	\N	\N	\N	Paracetamol 	\N	\N		t	\N		t
475	\N	289	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-08-24 11:16:21.838265	2018-08-27 10:48:05.6776	t	APP	\N	1	t	Clara doctor	\N	\N	\N	\N	t	\N	\N	\N
481	\N	300	S		VC	2018-12-08 09:20:00	\N	Headaches	Headaches	S	\N	\N	t	f	2018-09-05 15:44:12.681599	2018-09-05 15:44:12.681599	f	APP	Pollen, onion	\N	\N	\N	Panadol	\N	\N		f	\N		\N
489	1	304	T	Yaa	MA	2018-09-10 17:12:00	\N	Nothing	Nothing	S	\N	\N	t	f	2018-09-10 13:12:55.494677	2018-09-10 15:30:11.69556	t	APP	None	1	\N	\N	\N	\N		0246774322	f	24	F	t
537	\N	322	S	Paddy	VC	2018-09-18 06:44:00	\N	Tired	Stress	E	\N	\N	t	f	2018-09-17 18:46:37.121038	2018-09-19 15:40:12.010099	t	APP	Work	\N	\N	\N	Moringa	\N	\N	05478373947	t	30	M	t
505	\N	306	S		LA	2018-10-15 12:30:00	\N	\N	Stomach pains	E	\N	\N	t	f	2018-09-11 11:41:56.633141	2018-09-11 15:14:03.353676	t	APP	Onion	1	\N	\N	\N	\N	Blood		f	\N		t
513	\N	289	S		HC	2018-10-15 19:01:00	\N	Old age	None	S	\N	\N	t	f	2018-09-15 19:01:18.263882	2018-09-15 19:46:01.912318	t	APP	Broke	1	\N	\N	None	\N			t	\N		\N
529	\N	321	T	Kwame Eugene	PC	2018-09-20 12:50:00	\N	Stress	Headache	S	\N	\N	t	f	2018-09-17 12:46:10.664253	2018-09-17 12:50:30.300037	t	APP	Shatta wale	\N	\N	\N	Good tunes	\N	\N	0621930123	t	27	M	\N
597	\N	289	S		PDVC	2018-09-27 11:19:00	\N	Alright stop	Alright stop 	S	\N	\N	t	f	2018-09-20 11:12:09.548566	2018-09-20 11:12:09.548566	f	APP	Alright stop 	\N	\N	\N	Alright stop already 	\N	\N		f	\N		\N
342	\N	267	T	Yaa	MD	\N	\N	\N	None	E	\N	\N	t	f	2018-08-07 11:35:31.539748	2018-11-13 00:27:37.08196	t	APP	None	1	\N	\N	Postinor2	\N	\N	0205626974	t	\N	\N	f
550	\N	324	\N	\N	PD	\N	\N	\N	\N	\N	\N	\N	t	f	2018-09-18 18:52:16.301237	2018-09-18 18:52:16.301237	f	APP	\N	1	t		\N	\N	\N	\N	f	\N	\N	\N
589	\N	322	S		PDHC	2018-09-20 21:26:00	\N	Tired	None	S	\N	\N	t	f	2018-09-20 09:26:18.413245	2018-09-20 11:14:16.152697	f	APP	None	1	\N	\N	No e	\N			t	\N		\N
615	\N	325	T	Sam	PDVC	2018-11-28 06:00:00	\N	Sick	Headcount	S	\N	\N	t	f	2018-09-25 06:00:52.051613	2018-09-25 06:07:34.530381	t	APP	Na	\N	\N	\N	Na	\N	\N		t	17	M	t
734	0	322	S		HC	2018-11-28 15:30:00	\N	Non	No	S	\N	\N	t	f	2018-11-28 13:31:24.034276	2019-02-05 18:17:57.120015	t	APP	No	1	\N	\N	On	\N			t	\N	\N	t
622	\N	272	T	Celestina 	PDDP	\N	\N	\N	Mean	S	\N	\N	t	f	2018-09-25 09:54:08.779229	2018-09-25 10:03:10.998501	t	APP	Celestina the mean girl	\N	\N	\N	Celeatina the liar 	20	\N	0279454771	t	22	F	\N
664	\N	139	S		MD	\N	\N	\N	Hj	S	\N	\N	t	f	2018-11-13 01:20:27.780764	2018-11-13 01:21:53.223046	t	APP	Bh	1	\N	\N	Gtj	\N	\N		f	\N		\N
632	\N	272	T	Andrew T	PDDP	\N	\N	\N	Helper	S	\N	\N	t	f	2018-09-27 08:41:13.337489	2018-09-27 16:03:09.567367	t	APP	Helper	\N	\N	\N	Helper	20	\N	0279123145	t	27	M	\N
631	\N	272	S		PDDP	\N	\N	\N	Heartbeat	S	\N	\N	t	f	2018-09-27 08:37:37.086223	2018-09-27 16:03:28.624203	t	APP	Heartbeat	\N	\N	\N	Heartbeat	3	\N		t	\N		\N
521	\N	272	S		PC	2018-09-21 22:48:00	\N	Headache	Pains 	S	\N	\N	t	f	2018-09-17 10:46:22.090713	2018-09-27 16:04:28.719844	t	APP	None	\N	\N	\N	None 	\N	\N		t	\N		\N
655	\N	139	S		LA	2018-11-12 12:06:00	\N	\N	Gthhe	S	\N	\N	t	f	2018-11-12 12:06:49.772044	2018-11-12 15:26:55.157313	t	APP	Gdhhd	1	\N	\N	\N	\N	Urine test		f	\N		\N
405	\N	272	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-08-13 12:46:40.605078	2018-11-13 00:09:46.767541	t	APP	None	\N	\N	\N	Paracetamol,newlife cream	\N	\N		f	\N	\N	f
392	\N	276	S		MD	\N	\N	\N	<p>Never</p>	S		\N	t	f	2018-08-09 16:22:45.821025	2018-11-13 00:11:37.74695	t	PTL	Oton	1	\N	\N	<p>Otton</p>	\N	\N		f	\N	\N	f
675	\N	139	T	Jj	MD	\N	\N	\N	Bdbdh	S	\N	\N	t	f	2018-11-13 07:33:11.736911	2018-11-13 07:33:59.280029	t	APP	Hrhh	1	\N	\N	Thh	\N	\N	0248112259	f	50	M	\N
497	\N	304	S		PDVC	2018-09-12 05:56:00	\N	Headache	None	S	\N	\N	t	f	2018-09-10 17:56:55.665141	2018-09-10 18:11:46.220069	f	APP	None	\N	\N	\N	None	\N	\N		t	\N		\N
684	\N	139	S		MD	\N	\N	\N	Gh	S	\N	\N	t	f	2018-11-14 09:38:36.086388	2018-11-14 12:41:30.447567	t	APP		1	\N	\N	Th	\N	\N		f	\N		\N
691	1	322	S		MA	2018-12-31 22:51:00	\N	Old Ghinger	None	S	\N	\N	t	f	2018-11-22 20:51:36.513413	2018-11-22 20:51:36.513413	f	APP		1	\N	\N	\N	\N			f	\N		\N
699	\N	322	S		PC	2018-11-23 11:32:00	\N	Fever	None	E	\N	\N	t	f	2018-11-23 11:32:34.903507	2018-11-23 11:32:34.903507	f	APP	None	\N	\N	\N		\N			f	\N		\N
566	\N	322	S		PDDP	\N	\N	\N	\N	E	\N	\N	t	f	2018-09-19 14:52:12.548845	2018-11-23 13:07:19.997296	t	APP	\N	\N	\N	\N	Moneyyyy	7	\N		t	\N		t
709	0	289	S		HC	2018-11-23 15:30:00	\N	None	None	S	\N	\N	t	f	2018-11-23 18:34:34.473764	2018-11-23 18:34:34.473764	f	APP	None	1	\N	\N	None	\N			f	\N		\N
718	1	322	T	Naa	MA	2018-11-28 11:30:00	\N	None	None	E	\N	\N	t	f	2018-11-28 12:48:02.694669	2018-11-28 12:48:02.694669	f	APP	None	1	\N	\N		\N		0241234567	f	20	F	\N
748	\N	322	S		MD	\N	\N	\N	None	S	\N	\N	t	f	2018-12-06 18:26:24.859318	2018-12-06 18:26:24.859318	f	APP	None	1	\N	\N	Para	\N	\N		f	\N		\N
726	\N	322	S		PDVC	2019-11-28 15:30:00	\N	No	No	S	\N	\N	t	f	2018-11-28 12:57:56.138859	2018-11-28 13:58:33.498225	f	APP	No	\N	\N	\N	No	\N			t	\N	\N	\N
654	\N	322	S		MD	\N	\N	\N	kjn	S	\N	\N	t	f	2018-10-15 17:07:16.564253	2019-02-05 17:54:38.003926	t	APP	thjk	1	\N	\N		\N	\N		f	\N		t
756	\N	322	S		LA	2018-12-10 17:58:00	\N	\N	Gfgy	S	\N	\N	t	f	2018-12-10 17:59:03.710726	2018-12-10 17:59:03.710726	f	APP	Ytuu	1	\N	\N	\N	\N			f	\N		\N
772	\N	322	T	Ni	PC	2018-12-11 18:13:00	\N	None	None	E	\N	\N	t	f	2018-12-11 18:13:58.098631	2018-12-11 18:17:37.323729	f	APP	None	\N	\N	\N	None	\N	\N	0266000352	t	23	M	\N
764	1	322	T	Naa	MA	2018-12-11 17:36:00	\N	None	None	E	\N	\N	t	f	2018-12-11 17:36:52.097674	2018-12-11 18:30:26.691385	t	APP	None	1	\N	\N	\N	\N		0248021111	f	12	F	t
802	\N	330	T	Clara	VC	2018-12-24 13:41:00	\N	Headache	Headache	S	\N	\N	t	f	2018-12-13 13:40:02.687022	2018-12-13 13:40:02.687022	f	APP	None	\N	\N	\N	Pain killer	\N	\N	0248021199	f	25	F	\N
915	\N	257	S		PC	2019-01-11 13:36:00	\N	Nkkk	 Nkkk	S	\N	\N	t	f	2019-01-11 13:37:01.709592	2019-01-15 10:34:21.373319	f	APP	Nkkk	\N	\N	\N	Nkkk	\N	\N		t	\N		\N
920	\N	322	T	Mommie	PDHC	2019-01-23 00:05:00	\N	Pooing	None	E	\N	\N	t	f	2019-01-23 11:04:13.196474	2019-01-23 11:45:21.603905	f	APP	None	2	\N	\N	Imodium	\N		0205869653	t	26	F	\N
919	\N	322	S		HC	2019-01-25 11:01:00	\N	Farting saaaaa	None	S	\N	\N	t	f	2019-01-23 11:01:56.223286	2019-01-23 11:48:46.349998	f	APP	None	1	\N	\N	Liversalt	\N			t	\N		\N
924	\N	322	T	Paddy	HC	2019-01-26 11:12:00	\N	Hi	Hi	S	\N	\N	t	f	2019-01-24 11:13:22.752949	2019-02-05 18:20:34.240555	t	APP	Hi	2	\N	\N	Hi	\N		0541840988	t	1	M	t
940	\N	257	S		HC	2019-01-26 10:55:00	\N	Din	Dm	E	\N	\N	t	f	2019-01-26 10:55:25.377396	2019-01-26 10:57:27.143217	t	APP	Non	1	\N	\N	Ghana	\N			t	\N		\N
951	\N	322	S		PC	2019-02-05 12:15:00	\N	Pls	List	S	\N	\N	t	f	2019-02-05 11:20:22.636055	2019-02-05 12:13:31.679106	t	APP	Please	\N	\N	\N	Medi	\N	\N		t	\N		\N
930	\N	322	S		HC	2019-01-24 11:25:00	\N	Hi	Hi	S	\N	\N	t	f	2019-01-24 11:26:09.302153	2019-01-24 11:40:07.107977	f	APP	Hi	2	\N	\N	Hi	\N			t	\N		\N
941	\N	322	T	mommie	PC	2019-02-02 13:04:00	\N	<p>none</p>	<p>none</p>	S	\N	\N	t	f	2019-01-28 13:06:35.949759	2019-01-28 13:46:09.292552	f	WEB		\N	f			\N	\N	0205869653	t	\N	\N	\N
925	\N	322	S		HC	2019-01-26 00:00:00	\N	Hi	Sgsb	E	\N	\N	t	f	2019-01-24 11:15:15.927196	2019-02-05 18:20:38.358756	t	APP	Bdhjd	1	\N	\N	Ndjhd	\N			t	\N		t
952	\N	322	S		PC	2019-02-05 12:15:00	\N	Please	Your	S	\N	\N	t	f	2019-02-05 11:22:20.475589	2019-02-05 12:14:11.288918	t	APP	List	\N	\N	\N	Problems 	\N	\N		t	\N		\N
929	\N	322	S		HC	2019-01-24 00:00:00	\N	Standard	Express	E	\N	\N	t	f	2019-01-24 11:24:04.653874	2019-01-24 12:07:13.940138	t	APP	Allergies	2	\N	\N	List	\N			t	\N		t
931	\N	322	S		HC	2019-01-24 11:25:00	\N	Hi	Hi	S	\N	\N	t	f	2019-01-24 11:26:40.416967	2019-01-24 12:21:18.699332	t	APP	Hi	2	\N	\N	Hi	\N			t	\N		t
928	\N	322	S		HC	2019-01-24 11:21:00	\N	Mi	Mo	S	\N	\N	t	f	2019-01-24 11:22:01.72738	2019-01-25 16:38:52.555683	f	APP	Hi	1	\N	\N	Ih	\N			t	\N		\N
934	\N	322	T	Pady	HC	2019-01-28 08:04:00	\N	No	No	E	\N	\N	t	f	2019-01-25 17:05:04.523471	2019-01-25 17:07:10.437393	f	APP	No	1	\N	\N	No	\N		0541840988	t	26	M	\N
926	\N	322	S		HC	2019-01-24 11:21:00	\N	Please	Describe	S	\N	\N	t	f	2019-01-24 11:17:13.087968	2019-02-05 18:20:42.739739	t	APP	List	1	\N	\N	Medicatiin 	\N			t	\N		t
933	\N	322	S		HC	2019-02-25 17:02:00	\N	No	No	S	\N	\N	t	f	2019-01-25 17:02:54.186064	2019-01-25 17:58:04.020962	t	APP	No	1	\N	\N	No	\N			t	\N		t
932	\N	322	S		HC	2019-01-24 11:27:00	\N	Hi	Hi	S	\N	\N	t	f	2019-01-24 11:27:57.474549	2019-01-25 18:01:48.870344	t	APP	Hi	2	\N	\N	Hi	\N			t	\N		t
953	\N	322	T	Maame	HC	2019-02-05 12:15:00	\N	Hi	Hi	E	\N	\N	t	f	2019-02-05 11:26:01.232168	2019-02-05 12:16:35.399	t	APP	Hi	1	\N	\N	Hi	\N		0203443235	t	21	F	t
936	\N	322	S		HC	2019-01-26 06:45:00	\N	Hi	Hi	S	\N	\N	t	f	2019-01-25 18:45:40.775776	2019-01-25 19:02:25.134951	t	APP	Hi	1	\N	\N	Hi	\N			t	\N		t
935	\N	322	S		HC	2019-01-28 18:43:00	\N	No	No	S	\N	\N	t	f	2019-01-25 18:44:04.039583	2019-01-25 19:02:30.983139	t	APP	No	1	\N	\N	No	\N			t	\N		t
938	\N	322	S		HC	2019-01-25 19:17:00	\N	Hi	Hi	S	\N	\N	t	f	2019-01-25 19:17:28.04448	2019-01-25 19:19:31.158109	f	APP	Hi	1	\N	\N	Hi	\N			t	\N		\N
927	\N	322	S		HC	2019-01-25 11:18:00	\N	Sleepy	Tired	E	\N	\N	t	f	2019-01-24 11:20:22.179312	2019-02-05 18:20:46.853255	t	APP	Negative vibes	1	\N	\N	None	\N			t	\N		t
942	\N	322	S		HC	2019-01-28 00:00:00	\N	Test	Test	S	\N	\N	t	f	2019-01-28 14:20:49.767639	2019-01-28 14:31:45.236582	t	APP	Test	1	\N	\N	No	\N			t	\N		t
939	\N	257	S		HC	2019-01-26 10:14:00	\N	Wound dressing 	Diabetic ulcer	E	\N	\N	t	f	2019-01-26 10:14:29.598847	2019-01-26 10:28:19.357607	t	APP	Non	1	\N	\N	Meft	\N			t	\N		\N
943	\N	322	S		PDDP	\N	\N	\N	Alright 	S	\N	\N	t	f	2019-02-05 10:44:27.866084	2019-02-05 10:44:27.866084	f	APP	Testing too	\N	\N	\N	Testing	5	\N		f	\N		\N
947	\N	322	S		LA	2019-02-05 12:10:00	\N	\N	List again	S	\N	\N	t	f	2019-02-05 11:07:51.992723	2019-02-05 17:56:32.517045	t	APP	Allergies	1	\N	\N	\N	\N	LAb tests		f	\N		t
722	0	322	S		LA	2018-11-28 15:30:00	\N		None	S	\N	\N	t	f	2018-11-28 12:53:39.833505	2019-02-05 18:05:09.785424	t	APP	None	1	\N	\N		\N	None		f	\N	\N	t
954	\N	322	S		PDDP	\N	\N	\N	History	S	\N	\N	t	f	2019-02-05 11:28:05.30541	2019-02-05 12:27:18.546093	f	APP	Know your	\N	\N	\N	Medicine	14	\N		t	\N		\N
937	\N	322	S		HC	2019-01-25 00:00:00	\N	Hu	Hi	E	\N	\N	t	f	2019-01-25 19:12:13.931014	2019-02-05 18:22:56.434339	t	APP	Hi	1	\N	\N	Hi	\N			t	\N		t
948	\N	322	S		VC	2019-02-05 12:15:00	\N	Current medical	Previous medical	S	\N	\N	t	f	2019-02-05 11:15:40.702327	2019-02-05 18:05:49.218833	t	APP	Allergies	\N	\N	\N	Medications	\N	\N		t	\N		t
581	\N	322	S		VC	2018-09-22 08:52:00	\N	Swollen face	None	S	\N	\N	t	f	2018-09-20 08:52:56.245654	2019-02-05 18:06:59.900609	t	APP	None	\N	\N	\N	None	\N	\N		t	\N		t
957	\N	322	S		PDHC	2019-02-05 12:45:00	\N	Hi	Hi	S	\N	\N	t	f	2019-02-05 12:25:36.862092	2019-02-05 12:27:53.707858	f	APP	Hf	1	\N	\N	Hf	\N			t	\N		\N
950	\N	322	S		HC	2019-02-08 11:22:00	\N	Testing mic	Testing mic 1	S	\N	\N	t	f	2019-02-05 11:20:11.445912	2019-02-05 12:08:28.332376	t	APP	Testing testing 	1	\N	\N	Tester testing	\N			t	\N		t
792	\N	322	S		PDVC	2018-12-21 15:06:00	\N	Please	Yoir	E	\N	\N	t	f	2018-12-13 12:06:54.23621	2019-02-05 18:08:14.025124	t	APP	Allergies	\N	\N	\N	List	\N	\N		t	\N		t
944	\N	322	S		HC	2019-02-19 10:47:00	\N	Final testing	Final test	E	\N	\N	t	f	2019-02-05 10:47:22.552554	2019-02-05 18:23:36.878207	t	APP	Good	1	\N	\N	Great	\N			t	\N		t
956	\N	322	S		PDVC	2019-02-05 12:40:00	\N	Hello	Hi	S	\N	\N	t	f	2019-02-05 12:24:29.109921	2019-02-05 12:29:32.094536	f	APP	Hay	\N	\N	\N	Low	\N	\N		t	\N		\N
946	\N	322	S		MD	\N	\N	\N	Headache running	S	\N	\N	t	f	2019-02-05 10:59:26.80459	2019-02-05 13:59:24.763782	t	APP	No no no no	1	\N	\N	Medication	\N	\N		f	\N		t
960	\N	322	S		HC	2019-02-06 22:30:00	\N	Describe	Problems	S	\N	\N	t	f	2019-02-05 17:29:30.53208	2019-02-05 17:29:30.53208	f	APP	Allergies	1	\N	\N	Medications	\N			f	\N		\N
794	\N	322	T	Him	PDHC	2018-12-13 12:10:00	\N	No	No	E	\N	\N	t	f	2018-12-13 12:11:07.436008	2019-02-05 18:10:40.82953	t	APP	No	1	\N	\N	No	\N			t	21	M	t
955	\N	322	S		PDDP	\N	\N	\N	History	S	\N	\N	t	f	2019-02-05 11:28:45.491462	2019-02-05 18:11:21.024712	t	APP	You	\N	\N	\N	Your	14	\N		t	\N		t
959	\N	322	S		LA	2019-02-06 10:00:00	\N	\N	Hi	S	\N	\N	t	f	2019-02-05 17:25:15.997954	2019-02-05 17:45:24.884791	t	APP	Hu	1	\N	\N	\N	\N	Hi		f	\N		t
945	4	322	S		MA	2019-02-05 12:00:00	\N	Hello i am testing 	I have no idea	S	\N	\N	t	f	2019-02-05 10:50:24.742838	2019-02-05 17:51:35.345269	t	APP	I cant list	1	\N	\N	\N	\N			f	\N		t
958	\N	322	S		MD	\N	\N	\N	No	S	\N	\N	t	f	2019-02-05 17:23:21.059146	2019-02-05 17:56:17.308969	t	APP	No	1	\N	\N	None	\N	\N		f	\N		t
788	\N	322	S		HC	2018-12-13 11:55:00	\N	Please	List	S	\N	\N	t	f	2018-12-13 11:55:03.592967	2019-02-05 18:18:57.261287	t	APP	Allergies	1	\N	\N	No	\N			t	\N		t
921	\N	322	S		HC	2019-01-24 17:39:00	\N	headache	none	S	\N	\N	t	f	2019-01-23 17:39:20.786437	2019-02-05 18:19:45.087338	t	APP	none	1	\N	\N	none	\N			t	\N		t
922	\N	322	S		HC	2019-01-24 00:00:00	\N	checkup	none	S	\N	\N	t	f	2019-01-24 11:07:22.094441	2019-02-05 18:20:23.645766	t	APP	none	1	\N	\N	paracetamol	\N			t	\N		t
923	\N	322	S		HC	2019-01-24 00:00:00	\N	Hi	Lo	E	\N	\N	t	f	2019-01-24 11:11:07.210873	2019-02-05 18:20:27.428395	t	APP	Li	1	\N	\N	Ho	\N			t	\N		t
949	\N	322	S		HC	2019-02-05 12:15:00	\N	\nMedical problems	List	S	\N	\N	t	f	2019-02-05 11:19:17.636543	2019-02-05 18:23:51.583456	t	APP	Nurse	1	\N	\N	You	\N			t	\N		t
\.


--
-- Name: pre_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.pre_appointments_id_seq', 960, true);


--
-- Data for Name: pre_confirmed_appointments; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.pre_confirmed_appointments (id, pre_appointment_id, doctor_id, nurse_id, user_id, active_status, del_status, created_at, updated_at, accepted_status, date_time, decline_status, closed, patient_id) FROM stdin;
145	239	240	\N	36	t	f	2018-06-21 13:01:29.565093	2018-06-21 13:01:29.565093	f	2018-06-21 13:01:00	f	f	254
147	239	190	\N	36	t	f	2018-06-21 13:01:29.576051	2018-06-21 13:01:29.576051	f	2018-06-21 13:01:00	f	f	254
149	254	\N	259	145	t	f	2018-06-21 13:17:32.723539	2018-06-21 13:27:44.957682	t	2018-06-29 16:17:00	f	t	256
164	123	248	\N	135	t	f	2018-06-21 18:17:11.108688	2018-06-24 16:40:13.02733	t	2018-06-21 18:17:00	f	t	179
150	253	258	\N	145	t	f	2018-06-21 13:17:58.302367	2018-06-21 13:32:50.17462	t	2018-06-29 16:18:00	f	t	256
148	255	258	\N	145	t	f	2018-06-21 13:16:39.087819	2018-06-21 13:32:53.453184	t	2018-07-07 16:16:00	f	t	256
166	220	248	\N	135	t	f	2018-06-21 18:17:55.529154	2018-06-24 16:41:04.442496	f	2018-06-27 18:17:00	f	t	137
142	257	140	\N	36	t	f	2018-06-21 12:56:39.73552	2018-06-21 12:56:39.73552	f	2018-06-22 12:56:00	f	t	257
143	257	222	\N	36	t	f	2018-06-21 12:56:39.741792	2018-06-21 12:56:39.741792	f	2018-06-22 12:56:00	f	t	257
144	257	258	\N	36	t	f	2018-06-21 12:56:39.746366	2018-06-21 13:33:08.409756	t	2018-06-22 12:56:00	f	t	257
156	220	248	\N	135	t	f	2018-06-21 18:14:18.441884	2018-06-24 16:41:04.443448	t	2018-06-21 18:14:00	f	t	137
138	258	140	\N	36	t	f	2018-06-21 12:54:26.844108	2018-06-21 12:54:26.844108	f	2018-06-22 13:00:00	f	t	257
139	258	190	\N	36	t	f	2018-06-21 12:54:26.851036	2018-06-21 12:54:26.851036	f	2018-06-22 13:00:00	f	t	257
141	258	248	\N	36	t	f	2018-06-21 12:54:26.860271	2018-06-21 12:54:26.860271	f	2018-06-22 13:00:00	f	t	257
140	258	258	\N	36	t	f	2018-06-21 12:54:26.855772	2018-06-21 13:33:12.133806	t	2018-06-22 13:00:00	f	t	257
151	247	258	\N	145	t	f	2018-06-21 13:18:32.617141	2018-06-21 13:33:15.021557	t	2018-06-27 16:18:00	f	t	256
158	231	246	\N	135	t	f	2018-06-21 18:14:48.717412	2018-06-26 09:33:35.152779	f	2018-06-22 18:14:00	f	t	247
153	246	188	\N	145	t	f	2018-06-21 13:19:27.817463	2018-06-21 13:19:27.817463	f	2018-06-29 16:19:00	f	t	256
154	246	248	\N	145	t	f	2018-06-21 13:19:27.82352	2018-06-21 13:19:27.82352	f	2018-06-29 16:19:00	f	t	256
155	246	238	\N	145	t	f	2018-06-21 13:19:27.829334	2018-06-21 13:19:27.829334	f	2018-06-29 16:19:00	f	t	256
152	246	258	\N	145	t	f	2018-06-21 13:19:27.810203	2018-06-21 13:33:18.230335	t	2018-06-29 16:19:00	f	t	256
157	231	248	\N	135	t	f	2018-06-21 18:14:48.711543	2018-06-26 09:33:35.153779	t	2018-06-22 18:14:00	f	t	247
170	104	248	\N	135	t	f	2018-06-21 18:23:00.287433	2018-06-22 09:43:36.884833	t	2018-06-21 18:20:00	f	t	155
168	92	248	\N	135	t	f	2018-06-21 18:19:44.91107	2018-06-22 09:45:50.168965	f	2018-06-21 18:19:00	t	f	137
165	229	248	\N	135	t	f	2018-06-21 18:17:36.14151	2018-06-22 09:47:11.725754	t	2018-06-26 18:17:00	f	t	250
163	126	248	\N	135	t	f	2018-06-21 18:16:14.799404	2018-06-26 10:29:07.236434	t	2018-06-21 18:15:00	f	t	137
169	193	248	\N	135	t	f	2018-06-21 18:20:08.905725	2018-06-22 09:48:04.076916	t	2018-06-27 18:20:00	f	t	239
167	139	248	\N	135	t	f	2018-06-21 18:19:16.372183	2018-06-22 09:48:44.930745	t	2018-06-21 18:19:00	f	t	137
162	223	246	\N	135	t	f	2018-06-21 18:15:43.390239	2018-06-26 10:31:45.50855	f	2018-06-25 18:15:00	f	t	239
160	131	246	\N	135	t	f	2018-06-21 18:15:17.748718	2018-06-22 10:23:11.716262	f	2018-06-28 18:15:00	f	t	137
159	131	248	\N	135	t	f	2018-06-21 18:15:17.742632	2018-06-22 10:23:11.717216	t	2018-06-28 18:15:00	f	t	137
161	223	248	\N	135	t	f	2018-06-21 18:15:43.379977	2018-06-26 10:31:45.509488	t	2018-06-25 18:15:00	f	t	239
171	263	222	\N	145	t	f	2018-06-22 11:27:38.713939	2018-06-28 11:30:47.460472	f	2018-06-22 14:10:00	f	t	261
172	263	213	\N	145	t	f	2018-06-22 11:27:38.722119	2018-06-28 11:30:47.461532	f	2018-06-22 14:10:00	f	t	261
173	263	141	\N	145	t	f	2018-06-22 11:27:38.727821	2018-06-28 11:30:47.462505	f	2018-06-22 14:10:00	f	t	261
174	263	258	\N	145	t	f	2018-06-22 11:27:38.735252	2018-06-28 11:30:47.463471	f	2018-06-22 14:10:00	f	t	261
175	263	222	\N	145	t	f	2018-06-22 11:27:38.782491	2018-06-28 11:30:47.464402	f	2018-06-22 14:10:00	f	t	261
176	263	213	\N	145	t	f	2018-06-22 11:27:38.788264	2018-06-28 11:30:47.465323	f	2018-06-22 14:10:00	f	t	261
177	263	141	\N	145	t	f	2018-06-22 11:27:38.79369	2018-06-28 11:30:47.466299	f	2018-06-22 14:10:00	f	t	261
190	268	248	\N	135	t	f	2018-07-03 12:19:24.949017	2018-07-03 12:39:04.310195	f	2018-07-27 12:19:00	t	f	247
178	263	258	\N	145	t	f	2018-06-22 11:27:38.799829	2018-06-28 11:30:47.468248	t	2018-06-22 14:10:00	f	t	261
195	120	248	\N	135	t	f	2018-07-03 13:08:09.807761	2018-07-03 13:19:29.398845	f	2018-07-04 13:07:00	t	f	179
184	261	258	\N	145	t	f	2018-06-28 11:53:05.365049	2018-06-28 12:03:01.943906	t	2018-06-29 14:52:00	f	t	257
185	61	248	\N	135	t	f	2018-07-02 22:26:28.113448	2018-07-03 12:48:13.900253	t	2018-07-02 22:26:00	f	t	146
189	271	248	\N	135	t	f	2018-07-03 12:16:58.340605	2018-07-03 12:48:41.564149	f	2018-07-03 12:16:00	t	f	247
191	34	248	\N	135	t	f	2018-07-03 12:26:55.969651	2018-07-03 12:50:04.735112	f	2018-07-25 12:26:00	t	f	139
186	267	248	\N	135	t	f	2018-07-02 22:26:46.441106	2018-07-03 12:52:53.383555	f	2018-07-02 22:26:00	t	f	247
188	265	248	\N	135	t	f	2018-07-03 12:14:23.805534	2018-07-03 12:59:25.662024	t	2018-07-03 12:14:00	f	t	247
193	118	248	\N	135	t	f	2018-07-03 13:03:11.443883	2018-07-03 13:23:02.715149	t	2018-07-25 13:03:00	f	t	179
192	94	248	\N	135	t	f	2018-07-03 12:58:53.643186	2018-07-03 13:08:56.190411	t	2018-07-25 12:58:00	f	t	137
194	60	248	\N	135	t	f	2018-07-03 13:06:11.41477	2018-07-03 13:18:06.754809	t	2018-07-04 13:04:00	f	t	146
187	183	248	\N	135	t	f	2018-07-03 10:29:12.524059	2018-07-03 13:19:00.890283	t	2018-07-03 10:29:00	f	t	237
198	93	248	\N	135	t	f	2018-07-03 14:46:39.247577	2018-07-03 15:23:12.431449	t	2018-07-04 14:46:00	f	t	137
196	79	248	\N	135	t	f	2018-07-03 13:43:14.741871	2018-07-03 13:43:14.741871	f	2018-07-03 13:34:00	f	t	159
197	79	248	\N	135	t	f	2018-07-03 13:43:14.764237	2018-07-03 18:51:04.158233	t	2018-07-03 13:34:00	f	t	159
205	15	246	\N	135	t	f	2018-07-12 15:14:53.544197	2018-07-16 12:40:44.746382	f	2018-07-12 15:14:00	f	t	137
202	71	248	\N	135	t	f	2018-07-12 15:14:08.922753	2018-07-15 15:36:56.946468	t	2018-07-12 15:14:00	f	t	137
203	15	140	\N	135	t	f	2018-07-12 15:14:53.532568	2018-07-16 12:40:44.744383	f	2018-07-12 15:14:00	f	t	137
199	269	248	\N	135	t	f	2018-07-03 14:56:51.480698	2018-07-16 12:44:15.913378	f	2018-07-03 14:56:00	t	f	247
204	15	248	\N	135	t	f	2018-07-12 15:14:53.538872	2018-07-16 12:40:44.747328	t	2018-07-12 15:14:00	f	t	137
200	270	248	\N	135	t	f	2018-07-12 15:13:37.153208	2018-07-18 14:43:04.06548	t	2018-07-12 15:13:00	f	t	247
201	28	248	\N	135	t	f	2018-07-12 15:13:56.630921	2018-07-16 15:58:33.471639	t	2018-07-12 15:13:00	f	t	137
207	121	248	\N	135	t	f	2018-07-20 09:59:39.396893	2018-07-20 10:40:52.303852	f	2018-07-21 09:59:00	t	f	137
206	280	248	\N	135	t	f	2018-07-20 09:59:23.320662	2018-07-20 10:41:21.155794	t	2018-07-20 09:59:00	f	t	250
210	286	258	\N	145	t	f	2018-07-22 17:45:19.480665	2018-07-22 17:57:22.532403	f	2018-07-22 20:49:00	f	t	257
181	274	258	\N	145	t	f	2018-06-28 11:02:30.353238	2018-07-23 12:02:19.116821	f	2018-06-28 14:02:00	f	t	257
182	274	258	\N	145	t	f	2018-06-28 11:46:51.910584	2018-07-23 12:02:19.117873	f	2018-06-28 14:46:00	f	t	257
212	274	258	\N	145	t	f	2018-07-22 17:52:52.958888	2018-07-23 12:02:19.118844	f	2018-07-22 20:52:00	f	t	257
208	289	258	\N	145	t	f	2018-07-22 17:43:22.607463	2018-07-23 12:02:31.809932	f	2018-07-22 20:43:00	f	t	257
180	273	258	\N	145	t	f	2018-06-28 11:01:59.304842	2018-07-23 12:03:22.242654	f	2018-06-28 14:01:00	f	t	257
214	289	258	\N	145	t	f	2018-07-22 17:55:00.469718	2018-07-23 12:02:31.812038	t	2018-07-22 20:59:00	f	t	257
209	288	258	\N	145	t	f	2018-07-22 17:44:21.184911	2018-07-23 12:02:43.208288	t	2018-07-22 20:44:00	f	t	257
146	239	140	\N	36	t	f	2018-06-21 13:01:29.571622	2018-08-16 18:18:06.658703	f	2018-06-21 13:01:00	t	f	254
183	273	258	\N	145	t	f	2018-06-28 11:52:01.971479	2018-07-23 12:03:22.244622	t	2018-06-28 21:51:00	f	t	257
179	272	258	\N	145	t	f	2018-06-28 11:00:35.985405	2018-07-23 12:03:31.121893	t	2018-06-28 14:00:00	f	t	257
211	286	258	\N	145	t	f	2018-07-22 17:51:52.071469	2018-07-22 17:57:22.533414	f	2018-07-22 20:51:00	f	t	257
213	286	258	\N	145	t	f	2018-07-22 17:53:54.444886	2018-07-22 17:57:22.534508	f	2018-07-22 20:56:00	f	t	257
215	286	258	\N	145	t	f	2018-07-22 17:55:55.540598	2018-07-22 17:57:22.536398	t	2018-07-22 20:55:00	f	t	257
220	291	140	\N	135	t	f	2018-07-22 21:51:53.445766	2018-07-22 21:51:53.445766	f	2018-07-23 21:51:00	f	f	251
221	291	248	\N	135	t	f	2018-07-22 21:51:53.451226	2018-07-22 21:51:53.451226	f	2018-07-23 21:51:00	f	f	251
222	291	246	\N	135	t	f	2018-07-22 21:51:53.456073	2018-07-22 21:51:53.456073	f	2018-07-23 21:51:00	f	f	251
253	333	264	\N	158	t	f	2018-07-24 12:19:43.996831	2018-07-24 12:24:07.042432	t	2018-07-24 12:30:00	f	t	262
217	98	248	\N	135	t	f	2018-07-22 21:48:04.472033	2018-07-22 22:00:24.279571	t	2018-07-22 21:47:00	f	t	137
219	106	248	\N	135	t	f	2018-07-22 21:51:24.773893	2018-07-22 22:00:46.579202	t	2018-07-22 21:51:00	f	t	137
233	302	248	\N	158	t	f	2018-07-23 10:12:23.704587	2018-07-23 10:16:26.70271	f	2018-07-23 10:12:00	f	t	247
252	334	264	\N	158	t	f	2018-07-24 12:17:04.202899	2018-07-24 12:24:33.125047	t	2018-07-31 12:30:00	f	t	262
234	302	248	\N	158	t	f	2018-07-23 10:14:11.454192	2018-07-23 10:16:26.704749	t	2018-07-23 10:13:00	f	t	247
236	301	258	\N	158	t	f	2018-07-23 11:55:59.87309	2018-07-23 12:00:53.131119	f	2018-07-24 12:00:00	f	t	257
237	301	258	\N	158	t	f	2018-07-23 11:59:34.985799	2018-07-23 12:00:53.13312	t	2018-07-25 11:57:00	f	t	257
251	335	264	\N	158	t	f	2018-07-24 12:13:14.333441	2018-07-24 12:24:43.903561	t	2018-07-24 12:15:00	f	t	262
235	260	258	\N	158	t	f	2018-07-23 11:39:50.791195	2018-07-23 12:01:03.249359	t	2018-07-24 11:30:00	f	t	257
229	274	248	\N	135	t	f	2018-07-22 22:29:44.666791	2018-07-23 12:02:19.120788	f	2018-07-23 22:29:00	f	t	257
216	274	258	\N	145	t	f	2018-07-22 18:21:30.040768	2018-07-23 12:02:19.121752	t	2018-07-22 21:22:00	f	t	257
238	325	248	\N	158	t	f	2018-07-23 17:52:33.963194	2018-07-24 11:20:02.832936	f	2018-07-23 17:52:00	f	t	247
239	325	264	\N	158	t	f	2018-07-23 17:52:33.970782	2018-07-24 11:20:02.834967	t	2018-07-23 17:52:00	f	t	247
250	336	264	\N	158	t	f	2018-07-24 12:10:44.879403	2018-07-24 12:24:55.309886	t	2018-07-25 12:10:00	f	t	262
240	322	264	\N	158	t	f	2018-07-23 17:52:46.182663	2018-07-24 11:20:20.113622	t	2018-07-23 17:52:00	f	t	247
248	221	264	\N	158	t	f	2018-07-23 18:01:52.695511	2018-07-24 12:25:33.150859	f	2018-07-26 18:01:00	t	f	239
243	219	264	\N	158	t	f	2018-07-23 18:00:05.898284	2018-07-24 11:24:33.818267	t	2018-07-25 17:59:00	f	t	137
225	192	140	\N	135	t	f	2018-07-22 22:28:49.681704	2018-07-24 11:24:49.969546	f	2018-07-23 22:28:00	f	t	239
226	192	248	\N	135	t	f	2018-07-22 22:28:49.686725	2018-07-24 11:24:49.970836	f	2018-07-23 22:28:00	f	t	239
227	192	246	\N	135	t	f	2018-07-22 22:28:49.690393	2018-07-24 11:24:49.971823	f	2018-07-23 22:28:00	f	t	239
230	140	248	\N	135	t	f	2018-07-22 22:30:12.401297	2018-07-24 12:26:25.979104	f	2018-07-23 22:30:00	f	t	137
244	192	264	\N	158	t	f	2018-07-23 18:00:35.183615	2018-07-24 11:24:49.973787	t	2018-07-24 18:00:00	f	t	239
249	318	264	\N	158	t	f	2018-07-23 18:02:39.51538	2018-07-24 11:25:08.202415	f	2018-07-26 18:02:00	t	f	257
283	338	\N	149	158	t	f	2018-08-08 11:29:20.976878	2018-08-08 11:29:20.976878	f	2018-09-13 12:30:00	f	f	262
247	194	264	\N	158	t	f	2018-07-23 18:01:21.53352	2018-07-24 11:25:58.16894	f	2018-07-25 18:01:00	f	t	239
245	194	264	\N	158	t	f	2018-07-23 18:00:51.107369	2018-07-24 11:25:58.169931	t	2018-07-26 18:00:00	f	t	239
242	319	264	\N	158	t	f	2018-07-23 17:53:19.200865	2018-08-07 15:47:42.523264	f	2018-07-25 17:53:00	t	t	257
246	140	264	\N	158	t	f	2018-07-23 18:01:06.394252	2018-07-24 12:26:25.981344	t	2018-07-27 18:01:00	f	t	137
241	319	248	\N	158	t	f	2018-07-23 17:53:19.195003	2018-08-07 15:47:42.524271	t	2018-07-25 17:53:00	f	t	257
255	312	264	\N	158	t	f	2018-07-24 12:43:29.413579	2018-07-24 15:03:04.672304	f	2018-07-25 12:42:00	f	t	262
254	312	264	\N	158	t	f	2018-07-24 12:42:02.576871	2018-07-24 15:03:04.673289	t	2018-07-24 12:42:00	f	t	262
258	199	264	\N	158	t	f	2018-07-24 16:11:31.292185	2018-07-24 16:11:31.292185	f	2018-07-25 16:11:00	f	f	239
259	153	264	\N	158	t	f	2018-07-24 16:12:24.235215	2018-07-24 16:12:24.235215	f	2018-07-25 16:12:00	f	f	146
262	342	\N	149	158	t	f	2018-08-07 12:02:02.780061	2018-08-07 12:02:02.780061	f	2018-08-07 12:00:00	f	f	267
232	100	248	\N	135	t	f	2018-07-22 22:32:19.468694	2018-08-07 15:48:02.532649	f	2018-07-24 22:32:00	t	f	137
263	344	265	\N	158	t	f	2018-08-07 12:50:27.509051	2018-08-07 12:50:27.509051	f	2018-08-07 12:06:00	f	t	267
264	344	264	\N	158	t	f	2018-08-07 12:50:27.515599	2018-08-07 12:50:27.515599	f	2018-08-07 12:06:00	f	t	267
265	344	246	\N	158	t	f	2018-08-07 12:50:27.520222	2018-08-07 12:54:44.351203	t	2018-08-07 12:06:00	f	t	267
281	350	230	\N	158	t	f	2018-08-08 11:17:18.794724	2018-08-08 11:19:54.135179	t	2018-08-08 12:45:00	f	t	268
231	228	248	\N	135	t	f	2018-07-22 22:31:07.180612	2018-08-07 15:52:55.412097	t	2018-07-24 22:30:00	f	t	247
218	32	248	\N	135	t	f	2018-07-22 21:51:03.780423	2018-08-07 15:53:43.988331	f	2018-07-28 21:50:00	t	f	139
278	348	140	\N	36	t	f	2018-08-07 21:45:00.614398	2018-08-07 21:45:00.614398	f	2018-08-08 21:44:00	f	f	139
279	348	222	\N	36	t	f	2018-08-07 21:45:00.621129	2018-08-07 21:45:00.621129	f	2018-08-08 21:44:00	f	f	139
280	348	145	\N	36	t	f	2018-08-07 21:45:00.625725	2018-08-07 21:45:00.625725	f	2018-08-08 21:44:00	f	f	139
282	340	\N	149	158	t	f	2018-08-08 11:28:31.396266	2018-08-08 11:28:31.396266	f	2018-08-29 12:29:00	f	f	262
284	324	\N	149	158	t	f	2018-08-08 11:32:15.303923	2018-08-08 11:32:15.303923	f	2018-09-28 12:33:00	f	f	247
267	345	\N	149	158	t	f	2018-08-07 13:01:54.560185	2018-08-08 12:07:41.576724	f	2018-08-07 13:01:00	f	t	267
268	345	\N	149	158	t	f	2018-08-07 13:05:30.432019	2018-08-08 12:07:41.5778	f	2018-08-07 13:05:00	f	t	267
269	345	246	\N	158	t	f	2018-08-07 13:06:02.133363	2018-08-08 12:07:41.578803	f	2018-08-07 13:05:00	f	t	267
266	345	\N	149	158	t	f	2018-08-07 13:01:14.304402	2018-08-08 12:07:41.579804	f	2018-08-07 12:57:00	f	t	267
223	107	248	\N	135	t	f	2018-07-22 21:52:18.185112	2018-08-08 20:30:44.726901	t	2018-07-23 21:52:00	f	t	137
272	345	140	\N	36	t	f	2018-08-07 21:27:20.131559	2018-08-08 12:07:41.581803	f	2018-08-08 21:26:00	f	t	267
273	345	222	\N	36	t	f	2018-08-07 21:27:20.135798	2018-08-08 12:07:41.582811	f	2018-08-08 21:26:00	f	t	267
274	345	145	\N	36	t	f	2018-08-07 21:27:20.139973	2018-08-08 12:07:41.583797	f	2018-08-08 21:26:00	f	t	267
270	347	230	\N	158	t	f	2018-08-07 19:10:28.031419	2018-08-08 18:05:53.06465	t	2018-09-05 20:10:00	f	t	250
228	198	248	\N	135	t	f	2018-07-22 22:29:24.969763	2018-08-13 15:25:58.162153	t	2018-07-23 22:29:00	f	t	239
224	107	246	\N	135	t	f	2018-07-22 21:52:18.193547	2018-08-08 20:30:44.725895	f	2018-07-23 21:52:00	f	t	137
257	255	264	\N	158	t	f	2018-07-24 16:11:09.607888	2018-08-19 22:08:02.028443	t	2018-07-25 16:11:00	f	t	256
260	320	264	\N	158	t	f	2018-07-24 16:13:34.470081	2018-08-19 21:21:14.370978	t	2018-07-25 16:13:00	f	t	247
256	321	264	\N	158	t	f	2018-07-24 16:10:52.535701	2018-08-19 21:09:09.983276	t	2018-07-25 16:10:00	f	t	247
261	340	264	\N	158	t	f	2018-07-25 13:14:29.766245	2018-08-19 21:21:38.910344	f	2018-07-26 13:00:00	t	f	262
275	345	155	\N	36	t	f	2018-08-07 21:27:20.144146	2018-08-08 12:07:41.584781	f	2018-08-08 21:26:00	f	t	267
276	345	222	\N	36	t	f	2018-08-07 21:33:15.989689	2018-08-08 12:07:41.585837	f	2018-08-08 21:33:00	f	t	267
277	345	222	\N	36	t	f	2018-08-07 21:34:27.382373	2018-08-08 12:07:41.58682	f	2018-08-08 21:33:00	f	t	267
271	345	230	\N	36	t	f	2018-08-07 21:27:20.126166	2018-08-08 12:07:41.587814	t	2018-08-08 21:26:00	f	t	267
285	294	246	\N	158	t	f	2018-08-08 12:37:04.530292	2018-08-08 12:37:04.530292	f	2018-08-09 12:30:00	f	f	251
287	323	140	\N	158	t	f	2018-08-08 15:31:05.589765	2018-08-08 15:31:05.589765	f	2018-09-01 16:31:00	f	f	247
343	395	265	\N	158	t	f	2018-08-13 02:19:37.986564	2018-08-13 02:19:37.986564	f	2018-08-14 02:19:00	f	f	267
288	356	265	\N	158	t	f	2018-08-08 17:01:42.052592	2018-08-08 17:01:42.052592	f	2018-08-09 17:01:00	f	t	247
290	356	246	\N	158	t	f	2018-08-08 17:01:42.063524	2018-08-08 17:01:42.063524	f	2018-08-09 17:01:00	f	t	247
289	356	264	\N	158	t	f	2018-08-08 17:01:42.059066	2018-08-08 17:05:07.21089	t	2018-08-09 17:01:00	f	t	247
322	389	258	\N	145	t	f	2018-08-09 16:16:58.371789	2018-08-09 16:18:11.14288	t	2018-08-28 19:16:00	f	t	276
286	353	230	\N	158	t	f	2018-08-08 15:29:29.655885	2018-08-08 18:05:37.314692	t	2018-08-30 16:30:00	f	t	272
338	399	140	\N	36	t	f	2018-08-10 12:30:49.516351	2018-08-10 12:33:26.716721	t	2018-08-10 12:30:00	f	t	277
291	358	230	\N	230	t	f	2018-08-08 18:26:52.220203	2018-08-08 18:29:15.343363	t	2018-10-03 19:27:00	f	t	272
320	387	258	\N	145	t	f	2018-08-09 16:12:43.96282	2018-08-09 16:18:21.010323	t	2018-08-09 19:12:00	f	t	276
296	363	230	\N	158	t	f	2018-08-09 10:57:55.106261	2018-08-09 10:59:35.692538	t	2018-08-09 10:57:00	f	t	272
344	395	264	\N	158	t	f	2018-08-13 02:19:37.993721	2018-08-13 02:19:37.993721	f	2018-08-14 02:19:00	f	f	267
297	359	230	\N	158	t	f	2018-08-09 11:13:19.105419	2018-08-09 11:16:50.683788	t	2018-09-30 12:14:00	f	t	272
321	388	258	\N	145	t	f	2018-08-09 16:16:25.853258	2018-08-09 16:18:34.55753	t	2018-08-09 19:15:00	f	t	276
299	368	140	\N	158	t	f	2018-08-09 11:25:16.006496	2018-08-09 11:26:41.546904	f	2018-08-29 12:25:00	f	t	272
298	368	230	\N	158	t	f	2018-08-09 11:25:16.000798	2018-08-09 11:26:41.547911	t	2018-08-29 12:25:00	f	t	272
301	366	265	\N	158	t	f	2018-08-09 11:56:31.905924	2018-08-09 11:56:31.905924	f	2018-08-09 11:55:00	f	f	267
339	400	140	\N	36	t	f	2018-08-10 12:31:24.040579	2018-08-10 12:33:40.34216	t	2018-08-10 12:31:00	f	t	277
303	370	230	\N	158	t	f	2018-08-09 12:06:49.023035	2018-08-09 12:12:02.772322	t	2018-08-09 12:06:00	f	t	267
319	390	258	\N	145	t	f	2018-08-09 16:12:14.203605	2018-08-09 16:18:50.081838	t	2018-08-09 19:11:00	f	t	276
302	369	230	\N	158	t	f	2018-08-09 12:05:46.262753	2018-08-09 12:13:31.461045	t	2018-08-09 12:05:00	f	t	267
340	400	222	\N	36	t	f	2018-08-10 12:31:24.047212	2018-08-10 12:31:24.047212	f	2018-08-10 12:31:00	f	t	277
306	376	258	\N	36	t	f	2018-08-09 13:24:08.367725	2018-08-09 13:25:12.145021	t	2018-08-10 13:24:00	f	t	276
318	386	258	\N	145	t	f	2018-08-09 16:04:19.929407	2018-08-09 16:19:06.427951	t	2018-08-09 19:04:00	f	t	276
305	377	258	\N	36	t	f	2018-08-09 13:23:35.725936	2018-08-09 13:25:22.926671	t	2018-08-09 13:23:00	f	t	276
304	374	258	\N	36	t	f	2018-08-09 13:17:27.34851	2018-08-09 13:25:56.021024	f	2018-08-09 13:16:00	t	f	276
307	379	258	\N	158	t	f	2018-08-09 13:42:07.130786	2018-08-09 13:43:05.495021	t	2018-08-10 14:43:00	f	t	276
308	384	36	\N	145	t	f	2018-08-09 14:46:46.05357	2018-08-09 14:48:34.932668	f	2018-08-09 17:46:00	f	t	276
309	384	141	\N	145	t	f	2018-08-09 14:46:46.141077	2018-08-09 14:48:34.933768	f	2018-08-09 17:46:00	f	t	276
311	384	153	\N	145	t	f	2018-08-09 14:46:46.150229	2018-08-09 14:48:34.93579	f	2018-08-09 17:46:00	f	t	276
312	384	157	\N	145	t	f	2018-08-09 14:46:46.154606	2018-08-09 14:48:34.936789	f	2018-08-09 17:46:00	f	t	276
310	384	258	\N	145	t	f	2018-08-09 14:46:46.145639	2018-08-09 14:48:34.937813	t	2018-08-09 17:46:00	f	t	276
314	385	222	\N	145	t	f	2018-08-09 14:53:45.979318	2018-08-09 14:53:45.979318	f	2018-08-09 17:52:00	f	f	276
315	385	36	\N	145	t	f	2018-08-09 14:53:45.983829	2018-08-09 14:53:45.983829	f	2018-08-09 17:52:00	f	f	276
316	385	142	\N	145	t	f	2018-08-09 14:53:45.988258	2018-08-09 14:53:45.988258	f	2018-08-09 17:52:00	f	f	276
317	385	214	\N	145	t	f	2018-08-09 14:53:45.992662	2018-08-09 14:53:45.992662	f	2018-08-09 17:52:00	f	f	276
324	397	222	\N	36	t	f	2018-08-10 11:05:38.031999	2018-08-10 11:05:38.031999	f	2018-08-10 11:01:00	f	t	277
325	397	258	\N	36	t	f	2018-08-10 11:05:38.035908	2018-08-10 11:05:38.035908	f	2018-08-10 11:01:00	f	t	277
326	397	264	\N	36	t	f	2018-08-10 11:05:38.039668	2018-08-10 11:05:38.039668	f	2018-08-10 11:01:00	f	t	277
327	397	246	\N	36	t	f	2018-08-10 11:05:38.043488	2018-08-10 11:05:38.043488	f	2018-08-10 11:01:00	f	t	277
323	397	140	\N	36	t	f	2018-08-10 11:05:38.025885	2018-08-10 11:54:24.504876	t	2018-08-10 11:01:00	f	t	277
329	394	222	\N	36	t	f	2018-08-10 11:10:03.176931	2018-08-10 11:10:03.176931	f	2018-08-10 11:09:00	f	t	277
341	401	140	\N	36	t	f	2018-08-10 12:31:47.183356	2018-08-10 12:33:47.597291	t	2018-08-10 12:31:00	f	t	277
342	401	222	\N	36	t	f	2018-08-10 12:31:47.190148	2018-08-10 12:31:47.190148	f	2018-08-10 12:31:00	f	t	277
336	398	140	\N	36	t	f	2018-08-10 12:28:24.777176	2018-08-10 12:43:13.357815	t	2018-08-11 12:28:00	f	t	277
337	398	222	\N	36	t	f	2018-08-10 12:28:24.78355	2018-08-10 12:28:24.78355	f	2018-08-11 12:28:00	f	t	277
330	394	36	\N	36	t	f	2018-08-10 11:10:03.181328	2018-08-10 11:10:03.181328	f	2018-08-10 11:09:00	f	t	277
331	394	258	\N	36	t	f	2018-08-10 11:10:03.185601	2018-08-10 11:10:03.185601	f	2018-08-10 11:09:00	f	t	277
332	394	135	\N	36	t	f	2018-08-10 11:10:03.189914	2018-08-10 11:10:03.189914	f	2018-08-10 11:09:00	f	t	277
328	394	140	\N	36	t	f	2018-08-10 11:10:03.170468	2018-08-10 12:16:54.903162	t	2018-08-10 11:09:00	f	t	277
345	370	265	\N	158	t	f	2018-08-13 02:24:14.128278	2018-08-13 02:24:54.590697	f	2018-08-13 02:23:00	f	t	267
347	370	246	\N	158	t	f	2018-08-13 02:24:14.137818	2018-08-13 02:24:54.592964	f	2018-08-13 02:23:00	f	t	267
346	370	264	\N	158	t	f	2018-08-13 02:24:14.133369	2018-08-13 02:24:54.593964	t	2018-08-13 02:23:00	f	t	267
349	369	246	\N	158	t	f	2018-08-13 02:28:11.654595	2018-08-13 02:28:39.187506	f	2018-08-13 02:27:00	f	t	267
348	369	264	\N	158	t	f	2018-08-13 02:28:11.649119	2018-08-13 02:28:39.188469	t	2018-08-13 02:27:00	f	t	267
350	409	279	\N	158	t	f	2018-08-13 15:57:07.690158	2018-08-13 16:14:24.384637	f	2018-08-15 16:58:00	f	t	278
351	409	279	\N	158	t	f	2018-08-13 15:58:53.625705	2018-08-13 16:14:24.386779	t	2018-08-13 17:00:00	f	t	278
352	411	140	\N	158	t	f	2018-08-13 16:32:28.307806	2018-08-13 16:34:38.712288	t	2018-08-13 17:33:00	f	t	281
355	414	140	\N	36	t	f	2018-08-15 11:20:55.088531	2018-08-15 11:21:24.882279	t	2018-08-16 11:20:00	f	t	139
356	415	140	\N	36	t	f	2018-08-15 11:54:20.648531	2018-08-15 11:54:44.704096	t	2018-08-16 11:54:00	f	t	139
292	354	265	\N	158	t	f	2018-08-08 23:28:55.32952	2018-09-17 10:39:45.174362	f	2018-08-08 23:26:00	f	t	234
358	416	222	\N	36	t	f	2018-08-15 12:02:30.159106	2018-08-15 12:02:30.159106	f	2018-08-16 12:02:00	f	t	139
333	396	230	\N	36	t	f	2018-08-10 12:22:26.032279	2018-08-10 12:22:26.032279	f	2018-08-10 12:22:00	f	t	272
335	396	222	\N	36	t	f	2018-08-10 12:22:26.043728	2018-08-10 12:22:26.043728	f	2018-08-10 12:22:00	f	t	272
353	412	258	\N	158	t	f	2018-08-13 16:33:34.635087	2018-09-18 20:01:12.630637	f	2018-08-13 17:34:00	f	t	257
294	354	135	\N	158	t	f	2018-08-08 23:28:55.339893	2018-09-17 10:39:45.176418	f	2018-08-08 23:26:00	f	t	234
313	385	230	\N	145	t	f	2018-08-09 14:53:45.97288	2018-09-27 16:06:34.158654	f	2018-08-09 17:52:00	t	f	276
354	412	258	\N	158	t	f	2018-08-13 16:33:34.790514	2018-09-18 20:01:12.632672	t	2018-08-13 17:34:00	f	t	257
300	366	230	\N	158	t	f	2018-08-09 11:56:31.899312	2018-09-27 16:07:36.263235	f	2018-08-09 11:55:00	t	f	267
357	416	140	\N	36	t	f	2018-08-15 12:02:30.153604	2018-08-15 12:02:46.5867	t	2018-08-16 12:02:00	f	t	139
334	396	140	\N	36	t	f	2018-08-10 12:22:26.039259	2018-08-16 18:17:44.860902	t	2018-08-10 12:22:00	f	t	272
368	446	142	\N	36	t	f	2018-08-17 15:05:58.7153	2018-08-17 15:20:22.802276	f	2018-08-18 15:05:00	f	t	286
390	474	291	\N	158	t	f	2018-08-22 17:22:37.194926	2018-08-22 17:24:02.388987	t	2018-08-23 17:22:00	f	t	289
369	446	285	\N	36	t	f	2018-08-17 15:05:58.721683	2018-08-17 15:20:22.804423	t	2018-08-18 15:05:00	f	t	286
370	447	140	\N	36	t	f	2018-08-17 17:04:19.59143	2018-08-17 17:08:24.64594	f	2018-08-18 17:03:00	f	t	286
371	447	222	\N	36	t	f	2018-08-17 17:04:19.597905	2018-08-17 17:08:24.64701	f	2018-08-18 17:03:00	f	t	286
372	447	285	\N	36	t	f	2018-08-17 17:04:19.602297	2018-08-17 17:08:24.649045	t	2018-08-18 17:03:00	f	t	286
373	449	140	\N	36	t	f	2018-08-17 17:54:49.848436	2018-08-17 17:57:50.89553	f	2018-08-18 17:54:00	f	t	286
374	449	285	\N	36	t	f	2018-08-17 17:54:49.858383	2018-08-17 17:57:50.897694	t	2018-08-18 17:54:00	f	t	286
375	450	140	\N	36	t	f	2018-08-17 18:03:51.419028	2018-08-17 18:04:43.061593	f	2018-08-18 18:03:00	f	t	286
376	450	222	\N	36	t	f	2018-08-17 18:03:51.425815	2018-08-17 18:04:43.062725	f	2018-08-18 18:03:00	f	t	286
391	429	248	\N	158	t	f	2018-08-24 14:33:17.615199	2018-08-24 14:35:14.514974	t	2018-08-24 14:32:00	f	t	247
377	450	285	\N	36	t	f	2018-08-17 18:03:51.430379	2018-08-17 18:04:43.064849	t	2018-08-18 18:03:00	f	t	286
379	451	187	\N	36	t	f	2018-08-17 18:08:15.688314	2018-08-17 18:08:44.102154	f	2018-08-18 18:07:00	f	t	286
378	451	285	\N	36	t	f	2018-08-17 18:08:15.681906	2018-08-17 18:08:44.103209	t	2018-08-18 18:07:00	f	t	286
359	444	230	\N	36	t	f	2018-08-17 13:11:34.933651	2018-08-19 21:21:26.53612	f	2018-08-17 13:59:00	f	t	286
360	444	140	\N	36	t	f	2018-08-17 13:11:34.940578	2018-08-19 21:21:26.53721	f	2018-08-17 13:59:00	f	t	286
361	444	222	\N	36	t	f	2018-08-17 13:11:34.945048	2018-08-19 21:21:26.538197	f	2018-08-17 13:59:00	f	t	286
362	444	148	\N	36	t	f	2018-08-17 13:11:34.949412	2018-08-19 21:21:26.539163	f	2018-08-17 13:59:00	f	t	286
408	499	303	\N	158	t	f	2018-09-10 18:23:33.903371	2018-09-10 18:25:28.57699	t	2018-09-11 18:23:00	f	t	304
363	444	264	\N	36	t	f	2018-08-17 13:11:34.953682	2018-08-19 21:21:26.541101	t	2018-08-17 13:59:00	f	t	286
392	427	248	\N	158	t	f	2018-08-24 14:41:09.347159	2018-08-24 14:41:43.084513	t	2018-08-24 14:40:00	f	t	247
382	292	207	\N	158	t	f	2018-08-19 21:37:02.211922	2018-08-19 21:38:19.801249	f	2018-08-20 21:36:00	f	t	247
381	292	264	\N	158	t	f	2018-08-19 21:37:02.205252	2018-08-19 21:38:19.802228	t	2018-08-20 21:36:00	f	t	247
383	311	264	\N	158	t	f	2018-08-19 21:41:12.447315	2018-08-19 21:41:41.4277	t	2018-08-21 21:41:00	f	t	262
423	528	319	\N	158	t	f	2018-09-17 12:32:51.162782	2018-09-17 12:40:53.824041	t	2018-09-17 12:32:00	f	t	321
384	284	264	\N	158	t	f	2018-08-19 21:43:38.99368	2018-08-19 21:48:57.938032	t	2018-08-22 21:43:00	f	t	250
393	475	298	\N	36	t	f	2018-08-27 10:46:23.40873	2018-08-27 10:48:05.681158	t	2018-08-28 10:45:00	f	t	289
385	82	264	\N	158	t	f	2018-08-19 21:59:49.000239	2018-08-19 22:00:34.010023	t	2018-08-20 21:59:00	f	t	162
389	468	248	\N	158	t	f	2018-08-22 16:29:49.682611	2018-08-22 16:39:08.364212	f	2018-08-22 16:29:00	f	t	289
388	468	291	\N	158	t	f	2018-08-22 16:29:49.676288	2018-08-22 16:39:08.365224	t	2018-08-22 16:29:00	f	t	289
387	467	248	\N	158	t	f	2018-08-22 16:29:10.075215	2018-08-22 16:42:59.184619	f	2018-08-23 16:28:00	t	t	289
386	467	291	\N	158	t	f	2018-08-22 16:29:10.069532	2018-08-22 16:42:59.185661	t	2018-08-23 16:28:00	f	t	289
407	498	303	\N	158	t	f	2018-09-10 18:13:44.326661	2018-09-10 18:30:48.090919	t	2018-09-19 18:13:00	f	t	304
406	497	303	\N	158	t	f	2018-09-10 18:11:46.216615	2018-09-10 18:31:30.103646	f	2018-09-11 18:11:00	t	f	304
396	475	291	\N	158	t	f	2018-08-27 15:16:20.546419	2018-08-27 15:19:07.289965	t	2018-08-27 15:16:00	f	t	289
394	459	285	\N	158	t	f	2018-08-27 11:10:08.854373	2018-08-27 15:21:57.152966	f	2018-08-27 11:09:00	f	t	286
415	515	298	\N	158	t	f	2018-09-15 19:15:42.935752	2018-09-15 19:38:49.441324	t	2018-09-15 19:15:00	f	t	289
395	459	298	\N	158	t	f	2018-08-27 11:10:08.861207	2018-08-27 15:21:57.155084	t	2018-08-27 11:09:00	f	t	286
405	496	303	\N	158	t	f	2018-09-10 18:11:21.540014	2018-09-10 18:31:51.595011	t	2018-09-11 18:11:00	f	t	304
403	494	303	\N	158	t	f	2018-09-10 13:52:57.958829	2018-09-10 15:50:05.932664	t	2018-09-11 17:52:00	f	t	304
402	493	303	\N	158	t	f	2018-09-10 13:52:19.958263	2018-09-10 15:50:49.82852	t	2018-09-10 16:52:00	f	t	304
401	492	303	\N	158	t	f	2018-09-10 13:51:48.289583	2018-09-10 15:51:29.819158	t	2018-09-10 15:51:00	f	t	304
411	487	308	\N	158	t	f	2018-09-13 17:35:03.141457	2018-09-13 17:35:03.141457	f	2018-09-13 17:34:00	f	f	234
404	495	303	\N	158	t	f	2018-09-10 15:43:03.307147	2018-09-10 16:10:03.374301	t	2018-09-11 16:00:00	f	t	304
410	504	308	\N	158	t	f	2018-09-13 17:33:08.928553	2018-09-13 18:06:19.149251	t	2018-09-13 17:33:00	f	t	306
412	518	298	\N	158	t	f	2018-09-15 19:14:25.49874	2018-09-15 19:41:56.909945	f	2018-09-15 19:14:00	t	f	289
409	454	308	\N	158	t	f	2018-09-13 15:40:49.791842	2018-09-13 18:06:40.716222	t	2018-09-13 15:36:00	f	t	286
413	517	298	\N	158	t	f	2018-09-15 19:14:39.950461	2018-09-15 19:14:39.950461	f	2018-09-15 19:14:00	f	f	289
414	516	298	\N	158	t	f	2018-09-15 19:15:31.536109	2018-09-15 19:15:31.536109	f	2018-09-15 19:15:00	f	f	289
380	455	264	\N	158	t	f	2018-08-19 21:36:05.780085	2018-09-17 10:39:25.024268	t	2018-08-19 21:35:00	f	t	286
416	514	298	\N	158	t	f	2018-09-15 19:15:53.184987	2018-09-15 19:42:40.453347	t	2018-09-15 19:15:00	f	t	289
295	354	246	\N	158	t	f	2018-08-08 23:28:55.343824	2018-09-17 10:39:45.177371	f	2018-08-08 23:26:00	f	t	234
418	512	291	\N	158	t	f	2018-09-15 19:30:59.88454	2018-09-15 19:45:42.842592	t	2018-09-15 19:30:00	f	t	289
293	354	264	\N	158	t	f	2018-08-08 23:28:55.335815	2018-09-17 10:39:45.17836	t	2018-08-08 23:26:00	f	t	234
417	513	291	\N	158	t	f	2018-09-15 19:30:30.282499	2018-09-15 19:46:01.915924	t	2018-09-15 19:29:00	f	t	289
419	525	319	\N	158	t	f	2018-09-17 12:07:17.875408	2018-09-17 12:07:17.875408	f	2018-09-17 12:07:00	f	f	272
420	452	285	\N	158	t	f	2018-09-17 12:08:00.723148	2018-09-17 12:08:00.723148	f	2018-09-17 12:07:00	f	f	286
421	524	320	\N	158	t	f	2018-09-17 12:15:53.266624	2018-09-17 12:15:53.266624	f	2018-10-06 12:15:00	f	f	272
422	31	320	\N	158	t	f	2018-09-17 12:18:02.652074	2018-09-17 12:18:02.652074	f	2018-09-17 12:17:00	f	f	139
424	523	319	\N	158	t	f	2018-09-17 12:44:05.202784	2018-09-17 12:44:05.202784	f	2018-09-17 12:39:00	f	f	272
426	530	319	\N	158	t	f	2018-09-17 12:50:15.064584	2018-09-17 12:50:15.064584	f	2018-09-17 12:50:00	f	f	321
425	529	319	\N	158	t	f	2018-09-17 12:46:32.33939	2018-09-17 12:50:30.303607	t	2018-09-17 12:46:00	f	t	321
398	477	298	\N	158	t	f	2018-08-27 15:59:24.501526	2018-09-15 19:39:48.784522	f	2018-08-28 15:39:00	t	t	289
397	477	291	\N	158	t	f	2018-08-27 15:59:24.494285	2018-09-17 16:15:11.966003	t	2018-08-28 15:39:00	f	t	289
428	535	323	\N	158	t	f	2018-09-17 18:29:31.587233	2018-09-17 18:38:55.058691	t	2018-09-18 18:29:00	f	t	322
427	534	323	\N	158	t	f	2018-09-17 18:28:45.035355	2018-09-17 18:39:23.654281	t	2018-09-18 18:28:00	f	t	322
429	537	323	\N	158	t	f	2018-09-17 18:47:14.901	2018-09-17 18:50:33.050763	t	2018-09-18 18:47:00	f	t	322
431	536	323	\N	158	t	f	2018-09-17 18:54:29.521933	2018-09-17 18:58:17.54241	t	2018-09-18 18:53:00	f	t	322
400	478	230	\N	158	t	f	2018-08-27 17:24:51.098768	2018-09-25 09:24:05.682957	f	2018-08-27 17:24:00	f	t	272
430	521	230	\N	158	t	f	2018-09-17 18:49:59.946744	2018-09-27 16:04:28.723454	t	2018-09-30 19:49:00	f	t	272
365	445	189	\N	36	t	f	2018-08-17 13:23:10.526552	2018-08-17 13:23:10.526552	f	2018-08-17 13:22:00	f	t	286
366	445	217	\N	36	t	f	2018-08-17 13:23:10.531279	2018-08-17 13:23:10.531279	f	2018-08-17 13:22:00	f	t	286
367	445	191	\N	36	t	f	2018-08-17 13:23:10.53596	2018-08-17 13:23:10.53596	f	2018-08-17 13:22:00	f	t	286
433	538	323	\N	158	t	f	2018-09-17 19:07:48.531441	2018-09-17 19:14:57.154815	t	2018-09-19 08:07:00	f	t	322
478	569	323	\N	158	t	f	2018-09-25 10:19:56.987224	2018-09-25 10:19:56.987224	f	2018-09-25 10:19:00	f	f	322
434	540	323	\N	158	t	f	2018-09-17 19:08:48.849841	2018-09-17 19:15:05.378025	t	2018-09-18 19:08:00	f	t	322
459	586	323	\N	158	t	f	2018-09-20 11:16:48.014554	2018-09-20 12:16:18.914942	t	2018-09-21 11:16:00	f	t	322
435	541	323	\N	158	t	f	2018-09-17 19:09:22.363351	2018-09-17 19:15:14.807403	t	2018-09-18 19:09:00	f	t	322
458	587	323	\N	158	t	f	2018-09-20 11:15:58.35637	2018-09-20 12:17:49.174779	f	2018-09-21 11:15:00	t	f	322
436	542	323	\N	158	t	f	2018-09-17 19:11:02.153926	2018-09-17 19:16:57.338493	t	2018-09-18 19:10:00	f	t	322
432	539	230	\N	158	t	f	2018-09-17 19:04:25.373917	2018-09-18 14:23:50.89588	t	2018-10-01 20:04:00	f	t	272
437	543	230	\N	158	t	f	2018-09-18 14:17:59.557043	2018-09-18 14:25:01.062407	f	2018-09-30 15:17:00	t	f	272
439	545	308	\N	158	t	f	2018-09-18 17:36:15.067946	2018-09-18 17:41:11.872397	f	2018-09-18 17:35:00	f	t	322
440	545	319	\N	158	t	f	2018-09-18 17:36:15.09553	2018-09-18 17:41:11.873443	f	2018-09-18 17:35:00	f	t	322
479	567	323	\N	158	t	f	2018-09-25 10:24:09.957606	2018-09-25 10:24:09.957606	f	2018-09-25 10:23:00	f	f	322
441	545	323	\N	158	t	f	2018-09-18 17:36:15.099382	2018-09-18 17:41:11.875421	t	2018-09-18 17:35:00	f	t	322
457	588	323	\N	158	t	f	2018-09-20 11:15:26.272402	2018-09-20 12:18:25.864716	t	2018-09-21 11:15:00	f	t	322
438	546	323	\N	158	t	f	2018-09-18 17:35:45.721029	2018-09-18 17:42:16.505301	t	2018-09-18 17:35:00	f	t	322
456	589	323	\N	158	t	f	2018-09-20 11:14:16.128055	2018-09-20 12:22:11.355232	f	2018-09-21 11:14:00	t	f	322
442	548	323	\N	158	t	f	2018-09-18 18:06:21.114748	2018-09-18 18:33:36.007961	t	2018-09-18 18:06:00	f	t	322
480	568	323	\N	158	t	f	2018-09-25 10:25:02.522609	2018-09-25 10:25:02.522609	f	2018-09-25 10:24:00	f	f	322
444	556	258	\N	145	t	f	2018-09-18 19:59:25.431665	2018-09-18 20:01:00.629963	t	2018-09-18 22:58:00	f	t	325
455	590	323	\N	158	t	f	2018-09-20 11:13:24.159617	2018-09-20 12:24:21.422754	t	2018-09-21 11:13:00	f	t	322
446	557	258	\N	145	t	f	2018-09-18 20:07:59.077471	2018-09-18 20:12:04.425704	t	2018-09-20 23:07:00	f	t	325
445	558	258	\N	145	t	f	2018-09-18 20:07:19.663352	2018-09-18 20:12:12.540019	t	2018-09-18 23:07:00	f	t	325
447	570	308	\N	158	t	f	2018-09-19 15:34:58.654566	2018-09-19 15:36:18.044055	f	2018-09-19 15:34:00	f	t	322
448	570	248	\N	158	t	f	2018-09-19 15:34:58.683674	2018-09-19 15:36:18.045103	f	2018-09-19 15:34:00	f	t	322
454	591	323	\N	158	t	f	2018-09-20 11:08:43.514538	2018-09-20 12:24:38.304983	t	2018-09-21 11:08:00	f	t	322
450	570	320	\N	158	t	f	2018-09-19 15:34:58.691327	2018-09-19 15:36:18.047022	f	2018-09-19 15:34:00	f	t	322
449	570	323	\N	158	t	f	2018-09-19 15:34:58.687602	2018-09-19 15:36:18.048012	t	2018-09-19 15:34:00	f	t	322
482	626	230	\N	158	t	f	2018-09-27 08:37:40.149859	2018-09-27 16:05:29.58249	t	2018-09-27 08:37:00	f	t	272
451	572	323	\N	158	t	f	2018-09-19 17:32:35.063062	2018-09-19 17:33:04.222414	t	2018-09-19 17:32:00	f	t	322
453	593	323	\N	158	t	f	2018-09-20 11:08:04.232452	2018-09-20 12:24:49.363661	t	2018-09-21 11:07:00	f	t	322
443	547	323	\N	158	t	f	2018-09-18 18:06:33.61305	2018-09-19 19:04:13.346464	t	2018-09-18 18:06:00	f	t	322
481	566	323	\N	158	t	f	2018-09-25 10:25:46.072387	2018-09-25 10:54:10.255039	t	2018-09-26 10:25:00	f	t	322
464	581	323	\N	158	t	f	2018-09-20 11:21:10.601902	2018-09-20 12:04:03.271322	t	2018-09-21 11:21:00	f	t	322
452	592	323	\N	158	t	f	2018-09-20 10:48:25.66037	2018-09-20 12:25:00.102175	t	2018-09-21 10:46:00	f	t	322
463	582	323	\N	158	t	f	2018-09-20 11:19:55.368535	2018-09-20 12:04:20.147758	t	2018-09-21 11:19:00	f	t	322
462	583	323	\N	158	t	f	2018-09-20 11:18:42.305649	2018-09-20 12:04:48.39927	t	2018-09-22 11:18:00	f	t	322
461	584	323	\N	158	t	f	2018-09-20 11:18:09.60954	2018-09-20 12:05:26.425414	t	2018-09-21 11:18:00	f	t	322
460	585	323	\N	158	t	f	2018-09-20 11:17:21.845653	2018-09-20 12:16:06.159267	t	2018-09-27 11:17:00	f	t	322
465	614	258	\N	145	t	f	2018-09-25 06:02:07.000588	2018-09-25 06:04:26.087537	t	2018-09-26 09:00:00	f	t	325
466	615	258	\N	145	t	f	2018-09-25 06:03:03.405785	2018-09-25 06:04:37.393781	t	2018-09-26 16:02:00	f	t	325
467	616	258	\N	145	t	f	2018-09-25 06:07:04.940949	2018-09-25 06:11:27.541502	t	2018-09-27 09:06:00	f	t	325
468	617	258	\N	145	t	f	2018-09-25 06:07:55.293012	2018-09-25 06:11:53.681524	t	2018-09-29 09:07:00	f	t	325
469	621	230	\N	158	t	f	2018-09-25 09:20:25.832095	2018-09-25 09:23:26.765062	t	2018-09-26 09:20:00	f	t	272
399	478	230	\N	158	t	f	2018-08-27 17:16:41.497412	2018-09-25 09:24:05.683981	t	2018-09-10 18:16:00	f	t	272
470	622	230	\N	158	t	f	2018-09-25 09:57:21.385926	2018-09-25 10:03:11.0022	t	2018-09-26 10:56:00	f	t	272
471	538	323	\N	158	t	f	2018-09-25 10:05:59.405933	2018-09-25 10:05:59.405933	f	2018-09-26 10:05:00	f	f	322
472	538	323	\N	158	t	f	2018-09-25 10:06:55.189987	2018-09-25 10:06:55.189987	f	2018-09-25 10:06:00	f	f	322
473	605	323	\N	158	t	f	2018-09-25 10:07:40.00758	2018-09-25 10:07:40.00758	f	2018-09-25 10:07:00	f	f	322
475	603	323	\N	158	t	f	2018-09-25 10:08:53.674247	2018-09-25 10:08:53.674247	f	2018-09-25 10:08:00	f	f	322
488	632	323	\N	158	t	f	2018-09-27 08:41:55.11771	2018-09-27 16:03:09.57138	f	2018-09-28 08:41:00	f	t	272
487	632	230	\N	158	t	f	2018-09-27 08:41:55.090446	2018-09-27 16:03:09.572402	t	2018-09-28 08:41:00	f	t	272
486	631	230	\N	158	t	f	2018-09-27 08:41:19.590708	2018-09-27 16:03:28.627789	t	2018-09-28 08:41:00	f	t	272
485	629	230	\N	158	t	f	2018-09-27 08:39:24.161257	2018-09-27 16:03:44.362152	t	2018-09-27 08:38:00	f	t	272
484	628	230	\N	158	t	f	2018-09-27 08:38:33.40296	2018-09-27 16:04:00.053904	t	2018-09-27 08:38:00	f	t	272
483	627	230	\N	158	t	f	2018-09-27 08:38:05.966836	2018-09-27 16:05:11.157917	t	2018-09-28 08:37:00	f	t	272
474	604	323	\N	158	t	f	2018-09-25 10:08:21.986703	2018-10-10 21:37:04.381305	t	2018-09-25 10:08:00	f	t	322
491	642	258	\N	145	t	f	2018-09-28 15:29:14.73244	2018-09-28 15:31:22.905861	t	2018-09-28 18:29:00	f	t	257
364	445	140	\N	36	t	f	2018-08-17 13:23:10.519986	2018-11-14 17:31:19.984859	t	2018-08-17 13:22:00	f	t	286
489	640	258	\N	145	t	f	2018-09-28 15:26:00.833141	2018-09-28 15:31:56.003135	t	2018-09-28 18:25:00	f	t	257
493	659	140	\N	36	t	f	2018-11-15 08:20:22.279319	2018-11-15 08:20:22.279319	f	2018-11-23 08:19:00	f	f	139
490	641	258	\N	145	t	f	2018-09-28 15:27:46.239989	2018-09-28 15:32:19.076956	t	2018-09-28 18:27:00	f	t	257
494	659	188	\N	36	t	f	2018-11-15 08:20:22.444871	2018-11-15 08:20:22.444871	f	2018-11-23 08:19:00	f	f	139
492	643	258	\N	145	t	f	2018-09-28 15:29:48.524025	2018-09-28 15:32:36.191826	t	2018-09-28 18:29:00	f	t	257
495	658	230	\N	36	t	f	2018-11-15 08:34:07.636353	2018-11-15 08:34:07.636353	f	2018-11-22 08:33:00	f	f	139
496	658	222	\N	36	t	f	2018-11-15 08:34:07.645827	2018-11-15 08:34:07.645827	f	2018-11-22 08:33:00	f	f	139
497	658	145	\N	36	t	f	2018-11-15 08:34:07.652669	2018-11-15 08:34:07.652669	f	2018-11-22 08:33:00	f	f	139
498	657	140	\N	36	t	f	2018-11-15 08:36:11.841406	2018-11-15 08:36:11.841406	f	2018-11-21 08:35:00	f	f	139
499	657	222	\N	36	t	f	2018-11-15 08:36:11.851624	2018-11-15 08:36:11.851624	f	2018-11-21 08:35:00	f	f	139
477	601	323	\N	158	t	f	2018-09-25 10:12:59.290644	2019-01-24 18:25:55.699601	f	2018-09-25 10:12:00	t	f	322
506	602	157	\N	36	t	f	2018-11-15 09:51:47.630843	2018-12-06 18:48:24.749043	f	2018-11-20 09:51:00	f	t	322
507	602	140	\N	36	t	f	2018-11-15 10:28:13.071602	2018-12-06 18:48:24.750016	f	2018-11-29 10:27:00	f	t	322
508	602	323	\N	36	t	f	2018-11-15 10:28:13.137104	2018-12-06 18:48:24.750984	f	2018-11-29 10:27:00	f	t	322
476	602	323	\N	158	t	f	2018-09-25 10:12:12.214984	2018-12-06 18:48:24.751952	t	2018-09-25 10:10:00	f	t	322
511	594	222	\N	36	t	f	2018-11-15 10:55:06.65865	2018-11-15 10:55:06.65865	f	2018-11-15 10:54:00	f	f	289
512	594	145	\N	36	t	f	2018-11-15 10:55:06.689675	2018-11-15 10:55:06.689675	f	2018-11-15 10:54:00	f	f	289
513	659	140	\N	36	t	f	2018-11-15 10:55:34.124716	2018-11-15 10:55:34.124716	f	2018-11-21 10:55:00	f	f	139
514	659	222	\N	36	t	f	2018-11-15 10:55:34.145097	2018-11-15 10:55:34.145097	f	2018-11-21 10:55:00	f	f	139
518	725	323	\N	158	t	f	2018-11-28 13:44:26.761989	2018-11-28 13:44:26.761989	f	2018-11-29 13:44:00	f	f	322
522	731	323	\N	158	t	f	2018-11-28 13:55:22.09052	2018-11-28 13:55:22.09052	f	2018-11-29 13:55:00	f	f	322
523	730	323	\N	158	t	f	2018-11-28 13:56:01.051934	2018-11-28 13:56:01.051934	f	2018-11-29 13:55:00	f	f	322
524	729	323	\N	158	t	f	2018-11-28 13:56:26.131873	2018-11-28 13:56:26.131873	f	2018-11-29 13:55:00	f	f	322
525	728	323	\N	158	t	f	2018-11-28 13:56:43.739772	2018-11-28 13:56:43.739772	f	2018-11-29 13:56:00	f	f	322
527	726	323	\N	158	t	f	2018-11-28 13:58:33.49481	2018-11-28 13:58:33.49481	f	2018-11-29 13:58:00	f	f	322
528	724	323	\N	158	t	f	2018-11-28 14:00:20.898706	2018-11-28 14:00:20.898706	f	2018-11-28 13:59:00	f	f	322
500	607	36	\N	36	t	f	2018-11-15 09:43:13.759175	2018-11-29 11:42:23.793772	f	2018-11-21 09:42:00	f	t	257
501	607	258	\N	36	t	f	2018-11-15 09:44:45.317726	2018-11-29 11:42:23.80663	f	2018-11-21 09:43:00	f	t	257
502	607	36	\N	36	t	f	2018-11-15 09:46:28.304494	2018-11-29 11:42:23.807694	f	2018-11-29 09:45:00	f	t	257
503	607	141	\N	36	t	f	2018-11-15 09:46:28.336419	2018-11-29 11:42:23.808853	f	2018-11-29 09:45:00	f	t	257
505	607	135	\N	36	t	f	2018-11-15 09:46:28.367128	2018-11-29 11:42:23.810977	f	2018-11-29 09:45:00	f	t	257
504	607	258	\N	36	t	f	2018-11-15 09:46:28.351869	2018-11-29 11:42:23.812027	t	2018-11-29 09:45:00	f	t	257
515	610	230	\N	36	t	f	2018-11-15 10:55:58.416029	2018-11-29 11:44:41.87791	f	2018-11-19 10:55:00	f	t	257
516	610	258	\N	36	t	f	2018-11-15 10:55:58.432964	2018-11-29 11:44:41.879959	t	2018-11-19 10:55:00	f	t	257
563	825	258	\N	145	t	f	2018-12-14 10:13:17.263456	2018-12-14 10:24:19.644543	t	2018-12-14 13:12:00	f	t	257
510	608	163	\N	36	t	f	2018-11-15 10:54:09.200729	2018-11-29 11:45:20.011891	f	2018-11-16 10:53:00	f	t	257
509	608	258	\N	36	t	f	2018-11-15 10:54:09.152819	2018-11-29 11:45:20.012863	t	2018-11-16 10:53:00	f	t	257
560	803	230	\N	158	t	f	2018-12-13 14:39:43.397391	2018-12-13 17:45:36.940156	t	2018-12-31 14:40:00	f	t	330
521	732	323	\N	158	t	f	2018-11-28 13:54:55.142202	2018-12-06 18:04:41.424598	t	2018-11-28 13:54:00	f	t	322
519	734	323	\N	158	t	f	2018-11-28 13:44:58.48662	2018-12-06 18:05:48.463043	t	2018-11-29 13:44:00	f	t	322
535	772	323	\N	158	t	f	2018-12-11 18:17:37.320949	2018-12-11 18:17:37.320949	f	2018-12-12 18:16:00	f	f	322
537	775	323	\N	158	t	f	2018-12-11 18:22:28.573852	2018-12-11 18:22:28.573852	f	2018-12-12 18:22:00	f	f	322
538	777	323	\N	158	t	f	2018-12-11 18:24:45.768845	2018-12-11 18:24:45.768845	f	2018-12-11 18:23:00	f	f	322
539	779	323	\N	158	t	f	2018-12-11 18:25:32.16723	2018-12-11 18:25:32.16723	f	2018-12-12 18:25:00	f	f	322
534	770	323	\N	158	t	f	2018-12-11 18:11:49.874308	2018-12-11 18:27:10.513148	t	2018-12-12 18:10:00	f	t	322
543	771	323	\N	158	t	f	2018-12-11 18:28:38.349384	2018-12-11 18:28:38.349384	f	2018-12-12 18:28:00	f	f	322
548	790	323	\N	158	t	f	2018-12-13 12:05:47.582502	2018-12-13 12:05:47.582502	f	2018-12-14 12:05:00	f	f	322
547	789	323	\N	158	t	f	2018-12-13 11:58:54.006741	2018-12-13 12:40:14.435846	t	2018-12-22 11:58:00	f	t	322
559	804	230	\N	158	t	f	2018-12-13 14:26:18.059698	2018-12-13 14:28:54.645205	t	2018-12-31 14:26:00	f	t	330
566	837	258	\N	145	t	f	2018-12-15 10:53:02.996524	2018-12-15 10:57:40.378759	t	2018-12-15 13:52:00	f	t	257
564	826	258	\N	145	t	f	2018-12-14 10:13:50.321687	2018-12-14 10:20:57.082731	t	2018-12-21 13:13:00	f	t	257
562	824	258	\N	145	t	f	2018-12-14 10:12:22.753085	2018-12-14 10:24:39.031779	t	2018-12-14 13:12:00	f	t	257
531	736	258	\N	145	t	f	2018-12-01 23:04:40.679563	2018-12-14 10:21:25.552921	t	2018-12-17 01:52:00	f	t	257
530	740	258	\N	145	t	f	2018-12-01 23:02:37.624452	2018-12-14 10:21:47.950699	t	2018-12-18 02:02:00	f	t	257
561	817	258	\N	145	t	f	2018-12-14 10:11:42.570192	2018-12-14 10:25:04.086325	t	2018-12-14 13:11:00	f	t	257
565	819	258	\N	145	t	f	2018-12-14 10:16:58.26135	2018-12-14 10:22:16.553685	t	2018-12-14 13:16:00	f	t	257
572	821	230	\N	36	t	f	2018-12-19 16:19:44.027922	2018-12-19 16:19:44.027922	f	2018-12-26 16:19:00	f	f	331
567	850	258	\N	145	t	f	2018-12-18 16:38:40.134788	2018-12-18 16:39:41.985353	t	2018-12-18 19:38:00	f	t	257
529	741	258	\N	145	t	f	2018-12-01 22:59:13.960251	2018-12-14 10:25:23.004661	t	2018-12-11 01:58:00	f	t	257
573	821	145	\N	36	t	f	2018-12-19 16:19:44.077419	2018-12-19 16:19:44.077419	f	2018-12-26 16:19:00	f	f	331
568	847	230	\N	36	t	f	2018-12-19 12:42:03.614145	2018-12-19 12:42:03.614145	f	2018-12-20 12:41:00	f	f	331
571	846	291	\N	36	t	f	2018-12-19 15:30:44.323691	2018-12-19 15:30:44.323691	f	2018-12-20 15:30:00	f	f	331
574	821	157	\N	36	t	f	2018-12-19 16:19:44.092537	2018-12-19 16:19:44.092537	f	2018-12-26 16:19:00	f	f	331
575	348	230	\N	36	t	f	2018-12-19 17:53:55.270654	2018-12-19 17:53:55.270654	f	2018-12-28 17:53:00	f	f	139
576	348	140	\N	36	t	f	2018-12-19 17:53:55.308085	2018-12-19 17:53:55.308085	f	2018-12-28 17:53:00	f	f	139
577	348	145	\N	36	t	f	2018-12-19 17:53:55.321712	2018-12-19 17:53:55.321712	f	2018-12-28 17:53:00	f	f	139
578	348	140	\N	36	t	f	2018-12-19 17:56:30.925392	2018-12-19 17:56:30.925392	f	2018-12-25 17:55:00	f	f	139
579	348	140	\N	36	t	f	2018-12-19 17:57:51.986475	2018-12-19 17:57:51.986475	f	2018-12-27 17:57:00	f	f	139
580	251	140	\N	36	t	f	2018-12-19 17:59:04.033427	2018-12-19 17:59:04.033427	f	2018-12-20 17:58:00	f	f	139
581	251	145	\N	36	t	f	2018-12-19 17:59:04.570314	2018-12-19 17:59:04.570314	f	2018-12-20 17:58:00	f	f	139
582	348	140	\N	36	t	f	2018-12-19 18:05:03.067743	2018-12-19 18:05:03.067743	f	2018-12-25 18:04:00	f	f	139
551	792	323	\N	158	t	f	2018-12-13 12:10:34.967843	2019-01-23 15:29:34.85507	f	2018-12-14 12:10:00	f	t	322
569	831	36	\N	36	t	f	2018-12-19 12:46:51.447476	2019-01-24 17:51:02.129227	f	2018-12-20 12:46:00	f	t	322
557	792	323	\N	158	t	f	2018-12-13 12:34:48.91639	2019-01-23 15:29:34.857127	t	2018-12-14 12:34:00	f	t	322
555	797	323	\N	158	t	f	2018-12-13 12:16:50.296776	2019-01-23 15:30:21.654986	t	2018-12-14 12:16:00	f	t	322
532	769	323	\N	158	t	f	2018-12-11 18:01:10.509069	2019-01-24 11:04:32.875776	t	2018-12-12 18:00:00	f	t	322
552	794	323	\N	158	t	f	2018-12-13 12:11:57.464844	2019-01-24 11:04:51.720447	t	2018-12-14 12:11:00	f	t	322
544	786	323	\N	158	t	f	2018-12-13 11:55:13.924605	2019-01-24 18:21:57.848599	f	2018-12-14 11:55:00	t	f	322
570	831	323	\N	36	t	f	2018-12-19 12:46:51.466518	2019-01-24 17:51:02.131275	t	2018-12-20 12:46:00	f	t	322
533	768	323	\N	158	t	f	2018-12-11 18:01:33.38631	2019-01-24 18:21:27.794387	t	2018-12-12 18:01:00	f	t	322
517	704	323	\N	158	t	f	2018-11-26 16:25:41.994658	2019-01-25 15:34:44.161572	f	2018-11-26 16:25:00	t	f	322
526	727	323	\N	158	t	f	2018-11-28 13:58:03.692253	2019-01-25 15:33:46.994336	t	2018-11-29 13:57:00	f	t	322
520	733	323	\N	158	t	f	2018-11-28 13:45:22.359649	2019-01-25 15:37:56.170134	f	2018-11-29 13:45:00	t	f	322
545	787	323	\N	158	t	f	2018-12-13 11:55:46.011151	2019-01-25 15:37:24.884558	t	2018-12-14 11:55:00	f	t	322
554	796	323	\N	158	t	f	2018-12-13 12:15:47.48003	2019-01-25 15:40:30.580577	f	2018-12-14 12:15:00	t	f	322
558	798	323	\N	158	t	f	2018-12-13 12:37:22.998039	2019-01-25 15:39:11.427669	t	2018-12-14 12:37:00	f	t	322
540	778	323	\N	158	t	f	2018-12-11 18:26:15.014877	2019-01-25 15:41:08.928327	t	2018-12-12 18:25:00	f	t	322
536	776	323	\N	158	t	f	2018-12-11 18:22:01.47045	2019-02-04 15:26:31.433811	t	2018-12-11 18:21:00	f	t	322
553	795	323	\N	158	t	f	2018-12-13 12:14:03.18316	2019-02-05 11:41:46.072933	t	2018-12-14 12:13:00	f	t	322
549	791	323	\N	158	t	f	2018-12-13 12:06:10.958569	2019-02-05 11:42:40.126927	t	2018-12-14 12:06:00	f	t	322
542	773	323	\N	158	t	f	2018-12-11 18:27:00.138231	2019-02-05 12:14:35.854846	t	2018-12-12 18:26:00	f	t	322
541	774	323	\N	158	t	f	2018-12-11 18:26:36.854662	2019-02-05 12:15:19.640584	t	2018-12-12 18:26:00	f	t	322
583	348	140	\N	36	t	f	2018-12-19 18:06:19.119937	2018-12-19 18:06:19.119937	f	2018-12-27 18:05:00	f	f	139
584	348	145	\N	36	t	f	2018-12-19 18:06:19.247739	2018-12-19 18:06:19.247739	f	2018-12-27 18:05:00	f	f	139
585	348	155	\N	36	t	f	2018-12-19 18:06:19.274674	2018-12-19 18:06:19.274674	f	2018-12-27 18:05:00	f	f	139
586	348	140	\N	36	t	f	2018-12-20 07:33:00.936234	2018-12-20 07:33:00.936234	f	2018-12-27 07:32:00	f	f	139
587	348	145	\N	36	t	f	2018-12-20 07:33:00.982484	2018-12-20 07:33:00.982484	f	2018-12-27 07:32:00	f	f	139
588	348	140	\N	36	t	f	2018-12-20 09:06:08.909375	2018-12-20 09:06:08.909375	f	2018-12-27 09:05:00	f	f	139
589	348	140	\N	36	t	f	2018-12-20 09:11:47.366785	2018-12-20 09:11:47.366785	f	2018-12-26 09:11:00	f	f	139
590	348	140	\N	36	t	f	2018-12-20 09:13:45.450424	2018-12-20 09:13:45.450424	f	2018-12-26 09:13:00	f	f	139
591	348	140	\N	36	t	f	2018-12-20 09:29:08.429276	2018-12-20 09:29:08.429276	f	2018-12-21 09:28:00	f	f	139
592	348	140	\N	36	t	f	2018-12-20 09:30:50.211067	2018-12-20 09:30:50.211067	f	2018-12-26 09:30:00	f	f	139
593	348	230	\N	36	t	f	2018-12-20 09:33:45.043997	2018-12-20 09:33:45.043997	f	2018-12-31 09:33:00	f	f	139
594	348	140	\N	36	t	f	2018-12-20 09:41:02.489025	2018-12-20 09:41:02.489025	f	2018-12-26 09:40:00	f	f	139
595	348	140	\N	36	t	f	2018-12-20 09:58:10.883909	2018-12-20 09:58:10.883909	f	2018-12-27 09:57:00	f	f	139
596	696	140	\N	36	t	f	2018-12-20 10:10:31.375983	2018-12-20 10:10:31.375983	f	2018-12-25 10:10:00	f	f	322
597	348	140	\N	36	t	f	2018-12-20 10:15:56.34568	2018-12-20 10:15:56.34568	f	2018-12-25 10:15:00	f	f	139
598	348	140	\N	36	t	f	2018-12-20 10:17:12.439613	2018-12-20 10:17:12.439613	f	2019-01-01 10:16:00	f	f	139
599	348	230	\N	36	t	f	2018-12-20 10:20:09.307549	2018-12-20 10:20:09.307549	f	2018-12-31 10:19:00	f	f	139
600	348	140	\N	36	t	f	2018-12-20 10:20:11.256483	2018-12-20 10:20:11.256483	f	2018-12-31 10:19:00	f	f	139
601	348	222	\N	36	t	f	2018-12-20 10:20:13.213884	2018-12-20 10:20:13.213884	f	2018-12-31 10:19:00	f	f	139
602	348	230	\N	36	t	f	2018-12-20 10:22:10.626851	2018-12-20 10:22:10.626851	f	2019-01-03 10:21:00	f	f	139
603	348	140	\N	36	t	f	2018-12-20 10:22:12.585192	2018-12-20 10:22:12.585192	f	2019-01-03 10:21:00	f	f	139
604	348	222	\N	36	t	f	2018-12-20 10:22:14.540724	2018-12-20 10:22:14.540724	f	2019-01-03 10:21:00	f	f	139
605	348	140	\N	36	t	f	2018-12-20 10:25:14.709587	2018-12-20 10:25:14.709587	f	2018-12-25 10:24:00	f	f	139
606	348	140	\N	36	t	f	2018-12-20 10:25:59.570485	2018-12-20 10:25:59.570485	f	2018-12-25 10:25:00	f	f	139
607	348	145	\N	36	t	f	2018-12-20 10:30:22.310868	2018-12-20 10:30:22.310868	f	2018-12-26 10:30:00	f	f	139
608	348	140	\N	36	t	f	2018-12-20 10:44:55.343613	2018-12-20 10:44:55.343613	f	2018-12-26 10:44:00	f	f	139
609	348	140	\N	36	t	f	2018-12-20 11:01:22.544313	2018-12-20 11:01:22.544313	f	2018-12-27 03:01:00	f	f	139
610	348	145	\N	36	t	f	2018-12-20 11:01:25.126124	2018-12-20 11:01:25.126124	f	2018-12-27 03:01:00	f	f	139
611	348	140	\N	36	t	f	2018-12-20 11:04:28.165982	2018-12-20 11:04:28.165982	f	2019-01-02 03:04:00	f	f	139
612	348	140	\N	36	t	f	2018-12-20 11:05:29.838491	2018-12-20 11:05:29.838491	f	2019-01-02 03:04:00	f	f	139
613	348	155	\N	36	t	f	2018-12-20 11:05:53.275643	2018-12-20 11:05:53.275643	f	2019-01-02 03:05:00	f	f	139
614	348	155	\N	36	t	f	2018-12-20 11:06:39.077836	2018-12-20 11:06:39.077836	f	2019-01-02 03:05:00	f	f	139
615	822	140	\N	36	t	f	2018-12-20 11:19:11.030529	2018-12-20 11:19:11.030529	f	2018-12-27 03:19:00	f	f	331
616	348	140	\N	36	t	f	2018-12-20 11:30:10.831252	2018-12-20 11:30:10.831252	f	2019-01-01 11:29:00	f	f	139
617	348	222	\N	36	t	f	2018-12-20 11:32:25.549364	2018-12-20 11:32:25.549364	f	2018-12-25 11:32:00	f	f	139
618	348	140	\N	36	t	f	2018-12-20 11:33:37.1101	2018-12-20 11:33:37.1101	f	2018-12-27 11:33:00	f	f	139
619	348	140	\N	36	t	f	2018-12-20 11:38:31.922823	2018-12-20 11:38:31.922823	f	2018-12-25 11:38:00	f	f	139
620	348	140	\N	36	t	f	2018-12-20 11:40:05.646042	2018-12-20 11:40:05.646042	f	2018-12-25 11:39:00	f	f	139
621	195	140	\N	36	t	f	2018-12-20 11:56:19.099764	2018-12-20 11:56:19.099764	f	2019-01-03 11:56:00	f	f	139
622	195	140	\N	36	t	f	2018-12-20 11:57:56.835805	2018-12-20 11:57:56.835805	f	2019-01-03 11:56:00	f	f	139
623	32	140	\N	36	t	f	2018-12-20 11:58:55.695783	2018-12-20 11:58:55.695783	f	2019-01-02 11:58:00	f	f	139
624	32	222	\N	36	t	f	2018-12-20 11:58:55.7131	2018-12-20 11:58:55.7131	f	2019-01-02 11:58:00	f	f	139
625	32	140	\N	36	t	f	2018-12-20 12:01:46.923024	2018-12-20 12:01:46.923024	f	2019-01-02 12:01:00	f	f	139
626	32	222	\N	36	t	f	2018-12-20 12:01:46.938649	2018-12-20 12:01:46.938649	f	2019-01-02 12:01:00	f	f	139
627	348	140	\N	36	t	f	2018-12-20 15:18:02.012182	2018-12-20 15:18:02.012182	f	2018-12-26 15:17:00	f	f	139
628	348	155	\N	36	t	f	2018-12-20 15:18:02.03716	2018-12-20 15:18:02.03716	f	2018-12-26 15:17:00	f	f	139
629	348	140	\N	36	t	f	2018-12-20 15:24:25.887637	2018-12-20 15:24:25.887637	f	2018-12-24 15:24:00	f	f	139
630	348	140	\N	36	t	f	2018-12-20 15:29:48.770548	2018-12-20 15:29:48.770548	f	2019-01-01 15:29:00	f	f	139
631	348	222	\N	36	t	f	2018-12-20 15:29:48.789983	2018-12-20 15:29:48.789983	f	2019-01-01 15:29:00	f	f	139
632	852	230	\N	158	t	f	2018-12-20 17:29:19.568884	2018-12-20 17:29:19.568884	f	2018-12-25 17:30:00	f	f	330
633	852	230	\N	158	t	f	2018-12-20 17:30:24.673341	2018-12-20 17:30:24.673341	f	2018-12-25 17:30:00	f	f	330
634	843	258	\N	36	t	f	2018-12-20 17:33:24.88589	2018-12-20 17:33:24.88589	f	2018-12-25 17:33:00	f	f	257
635	842	258	\N	36	t	f	2018-12-20 17:35:03.505382	2018-12-20 17:35:03.505382	f	2018-12-26 17:34:00	f	f	257
636	857	230	\N	158	t	f	2018-12-21 17:56:17.73179	2018-12-21 17:56:17.73179	f	2018-12-24 17:57:00	f	f	330
637	840	258	\N	36	t	f	2019-01-14 21:45:34.112197	2019-01-14 21:45:34.112197	f	2019-01-15 21:45:00	f	f	257
638	840	163	\N	36	t	f	2019-01-14 21:45:34.135521	2019-01-14 21:45:34.135521	f	2019-01-15 21:45:00	f	f	257
639	915	\N	349	158	t	f	2019-01-15 10:34:21.369596	2019-01-15 10:34:21.369596	f	2019-01-15 10:34:00	f	f	257
546	788	323	\N	158	t	f	2018-12-13 11:58:33.070504	2019-01-15 12:37:04.088412	f	2018-12-21 11:58:00	f	t	322
640	788	\N	349	158	t	f	2019-01-15 11:37:33.951093	2019-01-15 12:37:04.089551	f	2019-01-16 11:37:00	f	t	322
641	788	\N	349	158	t	f	2019-01-15 11:38:45.233368	2019-01-15 12:37:04.090566	f	2019-01-16 11:38:00	f	t	322
642	788	\N	349	158	t	f	2019-01-15 11:38:54.19112	2019-01-15 12:37:04.091581	f	2019-01-16 11:38:00	f	t	322
651	911	\N	349	158	t	f	2019-01-23 16:54:59.691045	2019-01-23 16:54:59.691045	f	2019-01-23 16:46:00	f	f	257
643	788	\N	349	158	t	f	2019-01-15 11:39:39.773036	2019-01-15 12:37:04.093599	t	2019-01-16 11:39:00	f	t	322
644	920	148	\N	36	t	f	2019-01-23 11:45:21.346139	2019-01-23 11:45:21.346139	f	2019-01-24 11:45:00	f	f	322
645	920	252	\N	36	t	f	2019-01-23 11:45:21.690692	2019-01-23 11:45:21.690692	f	2019-01-24 11:45:00	f	f	322
646	919	147	\N	36	t	f	2019-01-23 11:48:46.346994	2019-01-23 11:48:46.346994	f	2019-01-24 11:48:00	f	f	322
647	919	310	\N	36	t	f	2019-01-23 11:48:46.363312	2019-01-23 11:48:46.363312	f	2019-01-24 11:48:00	f	f	322
648	918	258	\N	36	t	f	2019-01-23 11:50:17.437894	2019-01-23 12:34:11.684505	f	2019-01-24 11:49:00	f	t	257
649	918	323	\N	36	t	f	2019-01-23 11:50:17.454402	2019-01-23 12:34:11.686616	t	2019-01-24 11:49:00	f	t	257
556	793	323	\N	158	t	f	2018-12-13 12:34:15.101652	2019-01-23 15:14:23.870568	f	2018-12-14 12:34:00	f	t	322
550	793	323	\N	158	t	f	2018-12-13 12:09:38.362117	2019-01-23 15:14:23.871608	t	2018-12-14 12:09:00	f	t	322
650	904	\N	349	158	t	f	2019-01-23 16:46:14.426815	2019-01-23 17:00:16.681521	t	2019-01-23 16:46:00	f	t	342
652	921	\N	149	36	t	f	2019-01-23 17:50:45.479318	2019-01-23 18:01:37.926574	f	2019-01-24 17:50:00	f	t	322
653	921	\N	158	36	t	f	2019-01-23 17:50:45.580242	2019-01-23 18:01:37.927621	f	2019-01-24 17:50:00	f	t	322
655	917	186	\N	36	t	f	2019-01-24 10:55:32.248014	2019-01-24 10:55:32.248014	f	2019-01-25 10:55:00	f	f	257
654	921	\N	349	36	t	f	2019-01-23 17:50:45.601172	2019-01-23 18:01:37.929592	t	2019-01-24 17:50:00	f	t	322
656	917	258	\N	36	t	f	2019-01-24 10:55:32.251176	2019-01-24 10:55:32.251176	f	2019-01-25 10:55:00	f	f	257
657	917	163	\N	36	t	f	2019-01-24 10:55:32.253848	2019-01-24 10:55:32.253848	f	2019-01-25 10:55:00	f	f	257
663	931	\N	335	36	t	f	2019-01-24 11:29:24.999091	2019-01-24 11:29:55.5401	f	2019-01-25 11:29:00	f	t	322
691	942	\N	357	158	t	f	2019-01-28 14:30:59.188475	2019-01-28 14:31:22.272078	t	2019-01-29 14:30:00	f	t	322
664	931	\N	349	36	t	f	2019-01-24 11:29:25.002622	2019-01-24 11:29:55.562479	t	2019-01-25 11:29:00	f	t	322
665	930	\N	223	36	t	f	2019-01-24 11:40:07.098844	2019-01-24 11:40:07.098844	f	2019-01-26 11:39:00	f	f	322
666	930	\N	158	36	t	f	2019-01-24 11:40:07.102015	2019-01-24 11:40:07.102015	f	2019-01-26 11:39:00	f	f	322
667	930	\N	349	36	t	f	2019-01-24 11:40:07.104739	2019-01-24 11:40:07.104739	f	2019-01-26 11:39:00	f	f	322
658	922	\N	149	36	t	f	2019-01-24 11:08:05.555308	2019-01-24 12:00:09.362887	f	2019-01-25 11:07:00	f	t	322
659	922	\N	335	36	t	f	2019-01-24 11:08:05.557852	2019-01-24 12:00:09.363965	f	2019-01-25 11:07:00	f	t	322
660	922	\N	349	36	t	f	2019-01-24 11:08:05.560014	2019-01-24 12:00:09.386611	t	2019-01-25 11:07:00	f	t	322
668	929	\N	223	36	t	f	2019-01-24 11:41:27.515853	2019-01-24 12:04:29.745759	f	2019-01-31 11:41:00	f	t	322
669	929	\N	349	36	t	f	2019-01-24 11:41:27.519313	2019-01-24 12:04:29.768178	t	2019-01-31 11:41:00	f	t	322
662	932	\N	337	36	t	f	2019-01-24 11:28:57.339196	2019-01-24 13:03:56.575447	f	2019-01-25 11:28:00	f	t	322
661	932	\N	349	36	t	f	2019-01-24 11:28:57.246402	2019-01-24 13:03:56.597175	t	2019-01-25 11:28:00	f	t	322
671	927	\N	354	158	t	f	2019-01-25 16:39:27.675761	2019-01-25 16:47:11.81877	t	2019-01-29 17:40:00	f	t	322
670	928	\N	354	158	t	f	2019-01-25 16:38:52.552634	2019-01-25 16:48:06.114999	f	2019-01-31 17:39:00	t	f	322
673	933	\N	354	158	t	f	2019-01-25 17:07:42.781471	2019-01-25 17:08:22.569487	t	2019-01-28 17:07:00	f	t	322
672	934	\N	354	158	t	f	2019-01-25 17:07:10.434537	2019-01-25 17:09:56.223458	f	2019-01-26 17:06:00	t	f	322
694	950	\N	149	158	t	f	2019-02-05 11:28:51.434973	2019-02-05 11:29:28.050555	f	2019-02-28 12:30:00	f	t	322
676	935	\N	354	158	t	f	2019-01-25 18:47:41.697865	2019-01-25 18:49:09.851029	f	2019-01-28 18:47:00	t	t	322
675	935	\N	354	158	t	f	2019-01-25 18:47:35.143641	2019-01-25 18:49:09.873886	t	2019-01-28 18:47:00	f	t	322
695	950	\N	356	158	t	f	2019-02-05 11:28:51.438945	2019-02-05 11:29:28.07391	t	2019-02-28 12:30:00	f	t	322
674	936	\N	354	158	t	f	2019-01-25 18:46:57.608996	2019-01-25 18:59:48.788513	t	2019-01-26 18:46:00	f	t	322
677	938	\N	354	158	t	f	2019-01-25 19:19:31.154496	2019-01-25 19:19:31.154496	f	2019-01-26 19:19:00	f	f	322
692	944	\N	149	158	t	f	2019-02-05 11:01:32.781822	2019-02-05 11:29:41.624061	f	2019-02-28 12:00:00	f	t	322
678	937	\N	354	158	t	f	2019-01-25 19:19:59.145932	2019-01-25 19:27:41.393132	t	2019-01-28 19:19:00	f	t	322
679	939	\N	259	145	t	f	2019-01-26 10:26:31.883708	2019-01-26 10:28:19.360508	f	2019-01-31 13:23:00	f	t	257
680	939	\N	335	145	t	f	2019-01-26 10:26:31.886667	2019-01-26 10:28:19.383145	t	2019-01-31 13:23:00	f	t	257
693	944	\N	356	158	t	f	2019-02-05 11:01:32.813608	2019-02-05 11:29:41.646367	t	2019-02-28 12:00:00	f	t	322
681	940	\N	335	145	t	f	2019-01-26 10:56:11.048372	2019-01-26 10:57:27.169499	t	2019-01-30 13:56:00	f	t	257
683	941	\N	357	158	t	f	2019-01-28 13:46:09.286678	2019-01-28 13:46:09.286678	f	2019-01-29 13:45:00	f	f	322
684	941	\N	354	158	t	f	2019-01-28 13:46:09.289686	2019-01-28 13:46:09.289686	f	2019-01-29 13:45:00	f	f	322
685	925	\N	356	158	t	f	2019-01-28 13:47:11.228287	2019-01-28 13:48:32.304596	t	2019-01-31 14:48:00	f	t	322
686	925	\N	357	158	t	f	2019-01-28 13:49:19.462977	2019-01-28 13:49:19.462977	f	2019-01-29 13:48:00	f	f	322
687	925	\N	354	158	t	f	2019-01-28 13:49:19.466042	2019-01-28 13:49:19.466042	f	2019-01-29 13:48:00	f	f	322
682	926	\N	356	158	t	f	2019-01-28 13:45:57.614473	2019-01-28 13:50:38.563811	t	2019-01-30 14:46:00	f	t	322
688	923	\N	357	158	t	f	2019-01-28 14:00:06.04056	2019-01-28 14:01:40.784118	t	2019-01-29 13:59:00	f	t	322
689	924	\N	357	158	t	f	2019-01-28 14:02:39.594984	2019-01-28 14:03:04.068043	t	2019-01-30 14:02:00	f	t	322
698	955	323	\N	158	t	f	2019-02-05 12:01:59.361481	2019-02-05 12:04:22.522925	t	2019-02-05 12:15:00	f	t	322
690	872	\N	357	158	t	f	2019-01-28 14:03:50.456844	2019-01-28 14:08:03.063703	t	2019-01-29 14:03:00	f	t	331
697	949	\N	354	158	t	f	2019-02-05 12:00:03.991116	2019-02-05 12:10:54.620993	t	2019-02-05 12:15:00	f	t	322
696	953	\N	354	158	t	f	2019-02-05 11:59:22.347227	2019-02-05 12:11:15.264321	t	2019-02-05 13:15:00	f	t	322
701	948	323	\N	158	t	f	2019-02-05 12:06:21.925359	2019-02-05 12:12:40.461977	t	2019-02-05 12:15:00	f	t	322
700	951	323	\N	158	t	f	2019-02-05 12:05:48.367205	2019-02-05 12:13:31.682825	t	2019-02-05 12:15:00	f	t	322
699	952	323	\N	158	t	f	2019-02-05 12:04:39.379889	2019-02-05 12:14:11.292593	t	2019-02-05 12:20:00	f	t	322
702	954	323	\N	158	t	f	2019-02-05 12:27:18.542772	2019-02-05 12:27:18.542772	f	2019-02-05 12:45:00	f	f	322
703	957	323	\N	158	t	f	2019-02-05 12:27:53.704538	2019-02-05 12:27:53.704538	f	2019-02-05 12:45:00	f	f	322
704	956	323	\N	158	t	f	2019-02-05 12:29:32.091338	2019-02-05 12:29:32.091338	f	2019-02-05 12:45:00	f	f	322
\.


--
-- Name: pre_confirmed_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.pre_confirmed_appointments_id_seq', 704, true);


--
-- Data for Name: pre_payment_reqs; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.pre_payment_reqs (id, billing_info_id, amount, reference, created_at, updated_at) FROM stdin;
\.


--
-- Name: pre_payment_reqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.pre_payment_reqs_id_seq', 1, false);


--
-- Data for Name: profesional_groups; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.profesional_groups (id, group_name, comment, user_id, entity_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Ghana Medical Association				t	f	2017-11-29 17:01:38.652699	2017-12-11 21:17:32.013776
2	Sweetness Medical Association				t	f	2018-03-05 15:33:49.628483	2018-03-05 15:33:49.628483
\.


--
-- Name: profesional_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.profesional_groups_id_seq', 2, true);


--
-- Data for Name: provider_engaged_users; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.provider_engaged_users (id, provider_id, person_id, comment, user_id, entity_id, active_status, del_status, created_at, updated_at) FROM stdin;
2	7	32		\N	\N	t	f	2018-01-17 16:26:36.002939	2018-01-17 16:26:36.002939
3	9	140	dfjdf	\N	\N	t	f	2018-08-07 22:09:02.21321	2018-08-07 22:09:02.21321
4	9	257		\N	\N	t	f	2018-08-07 22:14:27.835025	2018-08-07 22:14:27.835025
5	1	169		\N	\N	t	f	2018-08-07 22:14:54.303211	2018-08-07 22:14:54.303211
6	2	220		\N	\N	t	f	2018-08-07 22:30:31.908714	2018-08-07 22:30:31.908714
7	10	290	very hard working	\N	\N	t	f	2018-09-05 11:41:16.044201	2018-09-05 11:41:16.044201
\.


--
-- Name: provider_engaged_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.provider_engaged_users_id_seq', 7, true);


--
-- Data for Name: provider_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.provider_masters (id, provider_name, alias, provider_type_id, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
5	Lawer Eye Clinic		2		\N	\N	t	f	2017-11-07 10:52:44.579415	2017-11-11 21:23:12.837465
4	Aseye Eye Specialist		2		\N	\N	t	f	2017-11-07 10:52:08.050862	2017-11-11 21:23:24.001424
3	Emmanuel Eye Clinic		2		\N	\N	t	f	2017-11-07 10:51:30.093442	2017-11-11 21:23:36.811823
6	Akosombo Hospital	Agh	8		\N	\N	t	f	2017-12-04 18:39:29.886651	2017-12-04 18:39:29.886651
7	Glorylove		9		\N	\N	t	f	2018-01-17 16:19:10.151963	2018-01-17 16:19:10.151963
8	University Of Ghana	Legon	5		\N	83	t	f	2018-03-05 11:27:58.99268	2018-03-05 11:27:58.99268
2	Nyaho Hospital	Nyaho	1		\N	36	t	f	2017-11-02 17:55:39.53986	2018-08-07 22:12:58.734128
9	Oyarifa General Hospital	Ogh	10		\N	149	t	f	2018-05-05 22:06:16.713326	2018-08-07 22:13:33.749435
10	37 Military Health Centre		10		\N	158	t	f	2018-09-05 11:34:40.029466	2018-09-05 11:34:40.029466
1	37 Military Hospital	37mh	1		\N	158	t	f	2017-11-02 17:26:55.396258	2018-09-05 11:35:39.303924
11	End Point Lab Centre	Eplc	11		\N	158	t	f	2018-09-10 12:09:41.09158	2018-09-10 12:09:41.09158
\.


--
-- Name: provider_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.provider_masters_id_seq', 11, true);


--
-- Data for Name: provider_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.provider_services (id, service_provider_id, service_id, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	2	1		\N	\N	t	f	2017-11-03 09:06:29.863901	2017-11-03 09:06:29.863901
2	5	3		\N	\N	t	f	2017-11-07 11:15:36.537808	2017-11-07 11:15:36.537808
3	5	2		\N	\N	t	f	2017-11-07 11:15:57.323937	2017-11-07 11:15:57.323937
4	7	3		\N	\N	t	f	2018-01-17 16:20:20.549455	2018-01-17 16:20:20.549455
5	2	5		\N	\N	t	f	2018-08-07 22:13:20.249821	2018-08-07 22:13:20.249821
6	2	3		\N	\N	t	f	2018-09-11 11:57:37.79709	2018-09-11 11:57:37.79709
7	10	4		\N	\N	t	f	2018-09-11 12:00:15.570934	2018-09-11 12:00:15.570934
8	10	4		\N	\N	t	f	2018-09-11 12:00:23.158377	2018-09-11 12:00:23.158377
9	10	4		\N	\N	t	f	2018-09-11 12:00:23.178881	2018-09-11 12:00:23.178881
10	10	7		\N	\N	t	f	2018-09-11 12:00:58.767836	2018-09-11 12:00:58.767836
\.


--
-- Name: provider_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.provider_services_id_seq', 10, true);


--
-- Data for Name: referals; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.referals (id, surname, other_names, dob, contact, refered_by, user_id, active_status, del_status, created_at, updated_at, processed_status) FROM stdin;
23	Andrew	Tetteh	2012-08-16	0277454712	253	\N	t	f	2018-08-08 10:58:13.36867	2018-08-09 10:57:10.476284	t
22	Araba	Maame	1994-02-04	0205869653	246	\N	t	f	2018-08-07 18:56:40.25676	2018-08-09 10:57:21.817958	t
2	Paddy	Sweet	2018-05-09	0248001090	192	\N	t	f	2018-05-02 09:55:33.797983	2018-08-09 11:23:02.922964	t
13	Obidea	Joyce	1992-06-21	0541849600	248	\N	t	f	2018-06-21 11:56:02.219422	2018-08-09 11:23:06.037072	t
1	Jonas	Mine	2018-01-01	0243112233	140	\N	t	f	2018-05-02 09:26:49.207588	2018-08-09 11:23:12.993651	t
21	Noah	Dra	2018-07-22	2335577008	258	\N	t	f	2018-07-22 18:05:52.187478	2018-08-09 11:34:52.613154	t
20	Kweku	Ababio	2007-06-26	0279456123	253	\N	t	f	2018-06-26 11:16:46.003389	2018-08-09 11:34:55.874231	t
19	Quaye	Akosua	2018-06-25	0283789928	248	\N	t	f	2018-06-25 12:43:22.912004	2018-08-09 11:34:58.088888	t
17	Sunday	Kofi	1991-11-25	0589080000	248	\N	t	f	2018-06-21 12:39:23.552572	2018-08-09 11:35:01.647992	t
18	Dahu	Ions	1993-06-22	0209210765	258	\N	t	f	2018-06-22 13:37:37.002469	2018-08-09 11:35:04.848531	t
16	Me	Gift	1993-06-21	0200000000	248	\N	t	f	2018-06-21 12:32:01.480276	2018-08-09 11:35:09.370918	t
15	Me	Me	1986-06-21	0541000070	248	\N	t	f	2018-06-21 12:12:26.846014	2018-08-09 11:35:15.730701	t
14	Obidea	Joyce	1992-06-21	0541849600	248	\N	t	f	2018-06-21 11:56:02.243161	2018-08-09 11:35:30.408203	t
12	Mansah	Kofi	1999-06-21	0541840988	248	\N	t	f	2018-06-21 11:43:28.999581	2018-08-09 11:35:37.033743	t
11	Abena	Koo	2013-06-19	0205869652	230	\N	t	f	2018-06-19 12:37:52.011943	2018-08-09 11:35:40.532705	t
10	Adjoa	Addae	2012-06-25	0205869653	253	\N	t	f	2018-06-18 10:22:12.965064	2018-08-09 11:35:44.890917	t
9	Fiifi	Addo	1985-06-22	0204567892	253	\N	t	f	2018-06-18 09:54:15.814516	2018-09-05 12:30:47.334737	t
24	Mommie	Yaa	1994-09-20	0230975467	323	\N	t	f	2018-09-20 13:40:15.007589	2018-09-20 13:40:15.007589	\N
25	Appiah	Adoma	1984-09-25	5544444999	258	\N	t	f	2018-09-25 06:37:51.148019	2018-09-25 06:37:51.148019	\N
27	Mama	Abena	\N	09876543	335	\N	t	f	2019-01-11 09:55:25.011458	2019-01-11 09:55:25.011458	f
28	Francis	Ababio	2019-01-31	0279454771	354	\N	t	f	2019-01-25 19:10:14.74472	2019-01-25 19:10:14.74472	\N
29	Hi	Patient	2013-01-31	0208622333	354	\N	t	f	2019-01-25 21:04:03.048444	2019-01-25 21:04:03.048444	\N
30	Kob	Apps	2019-01-26	0244365850	335	\N	t	f	2019-01-26 10:30:40.245377	2019-01-26 10:30:40.245377	\N
31	Test	Testing 	1986-01-21	0274875432	356	\N	t	f	2019-01-26 12:37:39.487508	2019-01-26 12:37:39.487508	\N
26	Ghana	Akuffo	\N	0209210765	337	\N	t	f	2019-01-08 10:13:05.306369	2019-01-28 12:56:24.316988	t
32	Refer	Name	\N	026600350	357	\N	t	f	2019-01-28 13:44:23.155452	2019-01-28 13:45:14.064409	t
6	Mensah	Adjoa	2000-06-08	0541840988	\N	\N	t	f	2018-06-08 05:55:25.400426	2018-06-08 05:55:25.400426	f
7	Adjei	Frank	1993-06-08	0541840988	248	\N	t	f	2018-06-08 06:11:10.330194	2018-06-08 06:11:10.330194	f
8	Essel	Kwasi	2000-12-08	0249737457	248	\N	t	f	2018-06-08 06:39:10.641505	2018-06-08 06:39:10.641505	f
5	Yeboah	Kofi	2017-09-04	0541840988	248	\N	t	f	2018-06-07 12:48:53.766882	2018-08-09 10:26:43.553094	f
4	Tim	Kojo	1993-06-01	0205869653	230	\N	t	f	2018-05-09 14:15:04.488036	2018-08-09 10:28:06.683979	f
3	Mobiles	Clemence	2018-05-15	4567878	210	\N	t	f	2018-05-04 12:36:12.86643	2018-08-09 10:29:11.60267	f
\.


--
-- Name: referals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.referals_id_seq', 32, true);


--
-- Data for Name: region_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.region_masters (id, region_state_name, comment, country_id, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	Volta		1	\N	36	t	f	2018-03-05 11:01:20.717709	2018-03-05 11:01:20.717709
2	Greater Accra		1	\N	83	t	f	2018-03-05 11:17:06.265971	2018-03-05 11:17:06.265971
3	Lagos		2	\N	83	t	f	2018-03-05 11:19:02.294644	2018-03-05 11:19:02.294644
4	South Africa		4	\N	149	t	f	2018-04-19 10:47:51.820186	2018-04-19 10:47:51.820186
5	Western Region		1	\N	135	t	f	2018-04-20 12:19:55.082822	2018-04-20 12:19:55.082822
\.


--
-- Name: region_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.region_masters_id_seq', 5, true);


--
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.registration (id, surname, other_names, mobile_number, password, status, telco, src, verified, email, username, user_type, surburb_id, user_id, user_uniq_code, dob, created_at, updated_at, specialty_id, specialty_duration, has_specialty, foreign_training, foreign_institution, professional_group_id, licence_number, foreign_licence_number, pd_sub, hospital_name) FROM stdin;
209	Naa	Naa	Naa                                               	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	Naa@gmail.com	naa122	C	\N	\N	pas123	1997-11-30	2018-11-30 18:40:48.219775	2018-11-30 18:40:48.219775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
158	New	Patient	0243542211                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	newpatient@gmail.com	new	C	3	\N	pas123	2017-11-26	2018-08-10 10:24:25.078177	2018-08-10 10:24:25.32749	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
164	Friday	Test	0254631978                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	APP	t	friday@fri.com	friday	C	\N	\N	pas123	1999-08-04	2018-08-16 09:38:55.976821	2018-08-16 09:38:55.976821	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	Admin	Adminqa	0727630122                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	UNKNOWN	WEB	t	bigyawson@gmail.com	demoqa	C	6	\N	123456789	2017-07-18	2019-01-08 10:51:39.940525	2019-01-08 10:51:40.166218	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
170	Clara	Patient	0248021199                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	madyquaye1@gmail.com	clarapatient	C	\N	\N	pas123	1992-08-30	2018-08-20 15:06:01.942016	2018-08-20 15:06:01.942016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
224	Testnurse	Testnurse	0244562233                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	VOD	APP	f	nirse@gmail.com	testnurse	N	\N	\N	123456789	2019-01-11	2019-01-11 09:59:15.006168	2019-01-11 09:59:15.006168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
175	Dre	Ric	0543692511                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	MTN	APP	f	dre@gmail.com	nana	D	\N	\N	12345678	1987-03-20	2018-08-20 16:50:00.021048	2018-08-20 16:50:00.021048	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
3	Quaye	Clara	0264620500                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	f	MTN	WEB	t	clara@gmail.com	mady	C	1	\N	123456789	2008-04-12	2018-04-17 22:02:00	2018-08-20 17:00:39.906307	1	4	f	f		1	H2234		\N	Oyarifa
181	Rich	Terty	0245325698                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	MTN	APP	t	greg34@gmail.com	greg	C	\N	\N	12345678	1984-09-05	2018-09-05 15:20:11.429281	2018-09-05 15:20:11.429281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
145	Paddy	Morey	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	APP	f	pady@yahoo.com	senior1	D	1	\N	pas123	1988-07-11	2018-07-23 17:00:01.701836	2018-07-23 17:01:50.350444	2	3	f	f	\N	1	Ab123	\N	t	Nyaho clinic
185	Mady	Patient	0201463899                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	APP	t	mady1@gmail.com	madypatient	C	\N	\N	pas123	1990-09-10	2018-09-10 13:08:58.336615	2018-09-10 13:08:58.336615	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
190	Lampo	Isaac	02341232134                                       	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	UNKNOWN	WEB	t	da@gasd.com	padpatientt	C	1	\N	123456	1999-12-27	2018-09-13 18:28:56.789972	2018-09-13 18:28:56.985712	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
228	Testnhh	Tesrbvg	0233653863                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	VOD	APP	f	ff@gmail.com	famacist	P	\N	\N	123456789	2019-01-11	2019-01-11 10:17:05.43665	2019-01-11 10:17:05.43665	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
191	Yousa	James	05413209888                                       	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	WEB	t	fda@fdsaf.com	paddocc	D	1	158	123456	1999-12-27	2018-09-13 18:32:31.857089	2018-09-13 18:34:11.452155	4	2	t	f		1	33242s		t	Emmanuel Hospital
196	Padd	Doc	09874632432                                       	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	TIG	APP	f	fa@ijksa.com	paddoctor1	D	1	\N	123456	1995-09-14	2018-09-14 11:16:32.881986	2018-09-14 11:18:03.375776	4	2	f	\N		1	65452tgr		t	Kontact Eye Hospital
201	You	Paddy	09043214342                                       	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	AIR	APP	t	dae@fdsa.com	youpaddy	D	1	158	123456	1987-09-17	2018-09-17 12:10:58.150874	2018-09-17 12:15:07.962553	4	2	t	f		1	Y324132		t	Eunica Hospital
151	Nipa	Kofi	0000000001                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	AIR	APP	t	p@fdsaf.com	nipa	C	\N	\N	123456	2005-08-08	2018-08-08 10:47:34.76894	2018-08-08 10:47:34.76894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
235	Nurse	Naa	0203443235                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	APP	t	clara@appsnmobilesolutions.com	nursenaa	N	1	158	pas123	1992-07-19	2019-01-25 16:22:02.185538	2019-01-25 16:37:02.865944	\N		\N	\N		\N	N1233		\N	Legon
4	Tetteh	Andrew	0264620500                                        	c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646	t	VOD	APP	t	andymistic37@gmail.com 	niimistic 	C	\N	\N	1234567890	1989-01-01	2018-04-17 22:03:00	2018-04-17 22:03:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	Agonam	Davi	0264620500                                        	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	t	MTN	APP	t	davi@gmail.com	davi	C	\N	\N	pas12345	2001-01-01	2018-04-17 22:03:00	2018-04-17 22:03:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	Amemawukpor	Kwame	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	kwame@gmail.com	kwame	C	1	36	\N	1990-02-10	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	Bansah	Jerry	0201234467                                        	c946f701a3b98b8ec1e4ed93de689450acba912910c28a945d7593982a29fd79	t	AIR	WEB	t	jerry@gmail.com	jerry	C	2	135	\N	2016-06-05	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	Ocansey	Joni	0264620500                                        	8ddc17508748f3a7d0e55516d63ca55f6732fd1908e6ad95e9d2dfa32be8239d	t	TIG	APP	t	kasakyi@hotmail.com 	joni1	C	\N	36	\N	1994-01-04	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	Mensah	Clarence	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	PTL	t	cle@hotmail.com	clarence	C	\N	36	\N	2018-04-19	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	Mac	Naa	0201234467                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	TIG	APP	t	Naa@gmail.com	naa	D	\N	135	\N	2001-01-01	2018-04-20 12:52:50.017535	2018-04-20 12:53:41.331842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	Oduro	Patemma	0244574744                                        	b2036656b8afe1586f68af792d17100fadd2ed2367c925d58d3484e4761a4f8f	t	VOD	APP	t	g@gmail.com	patemma	C	\N	145	\N	1984-09-01	2018-04-21 05:30:54.828564	2018-04-21 05:43:48.305445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	Apps	Nursegloria	0244574744                                        	356e20864cb22a75b64121a04606254f11da037cd533d48c6c8e855601be0c5b	t	VOD	APP	t	Gg@gmail.com	nursegloria	N	\N	145	\N	1988-12-01	2018-04-21 10:50:47.365937	2018-04-21 10:52:02.852579	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
140	Akufs	Rebecca	0244574744                                        	2c7f3c096da374065d6b10242ddc0c0c52a7712a34679d5e5f59cf54cfcaff75	t	UNKNOWN	WEB	t	reb@hotmail.com	rebecca	N	3	145	topnurse	2004-02-11	2018-06-20 10:33:04.601537	2018-06-20 10:41:04.812888	3	4	\N	\N	\N	2		\N	f	asona hospital
29	Kusi	Yaw	0244574744                                        	625b9cf31e5744733d007297e01066a44e385d4c51ef78306ed4b38e7630e844	t	MTN	APP	t	ykusimensah@yahoo.com	papsicle	C	\N	145	\N	1988-01-28	2018-04-21 11:04:27.414424	2018-04-21 11:21:46.792824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	Essel	Chale	0201234467                                        	cb9d7e942f9838817d3cc1ee507240eebe305dc6f1532cf92c1d28391bf67939	t	VOD	APP	t	Chale@gmail.com	chale	D	\N	135	\N	2001-01-01	2018-04-24 17:12:13.904016	2018-04-24 17:46:21.218986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	Nyan	Tiery	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	tiery@gmail.com	tiery	D	1	36	pas123	2018-04-01	2018-04-27 17:42:25.26288	2018-04-27 18:13:55.981907	1	5	t	t	British Medical Association	2	RK6879K	BR658JK	t	\N
70	Asamoah	David	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	t	david23@yahoo.com	davido	D	1	36	pas123	2018-04-27	2018-04-27 18:23:09.918964	2018-04-27 18:24:25.87474	3	6	f	f		1	HJ56KK	\N	t	\N
71	Amoah	Matthew	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	amoah@gmail.com	matthew	D	1	36	pas123	2018-04-27	2018-04-27 18:31:02.875588	2018-04-27 18:41:04.348223	1	2	f	f		1	HJ657KG	\N	f	\N
72	Jonah	Joan	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	joan@gmail.com	joan	D	1	36	pas123	2018-04-01	2018-04-30 09:05:54.548578	2018-04-30 09:47:34.377607	1	2	f	f		1	GH8847M	\N	f	\N
73	Tetteh	Celestina	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	celest@yahoo.com	celest	N	1	36	pas123	2018-04-01	2018-04-30 11:07:57.385891	2018-04-30 11:09:17.767145	4	2	f	f		1	NU34J	\N	f	\N
75	Yaa	Freda	0201234467                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	t	yaaa@gmail.com	yaaa	D	1	135	pas123	2018-04-03	2018-04-30 11:49:20.177741	2018-04-30 12:26:48.501861	3	4	f	f		1	FGF5HJ	\N	f	\N
91	Winkles	August	0244574744                                        	ca068749082aac43d67e55ad71962e320a398b0405baa18996492b4e756a88fd	t	UNKNOWN	WEB	t	a@gmail.com	nurseaugust	N	1	145	Passwordnurseaugust	2018-05-07	2018-05-04 12:29:55.418825	2018-05-04 12:33:27.890707	3	5	f	f		2	3356553767	\N	f	\N
94	Cloe	Hulda	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	cloe1@yahoo.com	clueh	D	2	36	pas123	2018-05-08	2018-05-04 13:03:19.82815	2018-05-04 15:20:32.442674	4	4	f	f		1	454656464	\N	f	\N
98	Chilax	Victor	0244574744                                        	a14e5f92c29592c7fd21e99e0a112d206cfdf4e74270e33957689840485f97cc	t	UNKNOWN	WEB	t	c@gmail.com	drchilax	D	1	145	Passworddrchilax	2018-04-29	2018-05-04 15:36:20.017453	2018-05-04 15:39:56.971629	2	7	t	t	ghana	1	7789000	6878090-	t	\N
102	Paddydocc	Paddydocc	0264620500                                        	c6a9c46899f8e648ed1ff0f926bff782e0141e39dcea7ab882b0da525e5058ff	t	VOD	APP	t	paddydocc@gmail.com	paddydocc	D	1	36	paddydocc	2001-01-01	2018-05-04 21:48:10.108053	2018-05-04 23:45:15.640026	1	3	t	t	4324sfs	1	324rr32	fsdfdsf	\N	\N
104	Agozi	Zeal	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	zealous@yahoo.com	zealous	N	1	36	pas123	2018-05-06	2018-05-05 12:22:14.760991	2018-05-05 12:24:44.846659	1	2	\N	\N	\N	1	hj76hj	\N	f	Nyaho Hospital
103	Agozi	Zeal	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	zeal@gmail.com	zeal	D	2	36	pas123	2018-05-09	2018-05-05 12:01:30.502282	2018-05-05 12:03:59.639859	1	3	f	f		1	hj578jsk	\N	t	Pentecost Hospital
22	Apps	Koku	0244574744                                        	2a53a7cb14c711408babca8a8444cbb1d7e81c5c744bcc7fc9f2f26403266450	t	VOD	APP	t	K@aol.com	drkoku	D	1	145	\N	1997-08-01	2018-04-20 07:52:23.669727	2018-05-14 18:53:37.545935	2	7	t	\N	\N	2	3455555	\N	\N	Mbu
129	Ionic	Senior	027507907                                         	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	ionic@gmail.com	senior	D	3	158	pas123	1983-06-07	2018-06-07 10:26:50.075203	2018-06-07 10:30:40.9256	3	5	f	f		1	123456789	\N	t	legon
133	Ayeley	Naa	0201234467                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	naa@yahoo.com	cdoctor	D	1	135	pas123	1983-12-25	2018-06-15 10:04:26.944007	2018-06-15 10:10:11.741575	4	3	f	f	\N	1	Doctorla	\N	t	University of ghana
159	Dominica 	Sophia 	444444888                                         	225cdbb68e0df9a0b8f5c582ece76a36f82ec706bf6afec19440db7b55e9b0a3	t	VOD	APP	t	soph@gmail.com	sophidom	C	\N	\N	newfriend	1986-06-13	2018-08-13 14:05:17.913292	2018-08-13 14:05:17.913292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
165	Sat	Sat	058466539                                         	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	sat@sat.com	sat	C	\N	\N	pas123	1985-08-02	2018-08-16 10:14:23.503698	2018-08-16 10:14:23.503698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
130	Yeboah	George	0201234467                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	WEB	t	p@fdsaf.com	pnurse	N	1	135	123456	1985-01-30	2018-06-13 21:39:22.10792	2018-06-14 06:47:38.512589	4	5 years	\N	\N	\N	1	4342314	\N	f	37 Hospital
37	Morin	Nod	0264620500                                        	e5351a1b138656788e51c7dbf1baba4d0eb75bd110d1a8b498b63926b15faf4d	t	VOD	APP	f	Fd@gmail.com	may	C	\N	\N	may123	2001-01-01	2018-04-24 22:47:59.662127	2018-04-24 22:47:59.662127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	Gbeku	Mawunya	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	mawunya22@gmail.com	mawunya	D	2	36	pas123	2018-04-01	2018-04-27 18:15:56.864714	2018-04-27 18:17:27.133046	3	5	f	f		1	FGH45HJ	\N	t	\N
146	Paddy	Monday	0235667189                                        	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	t	\N	PTL	t	monday@gmail.com	monday	D	\N	158	\N	2018-07-08	2018-07-23 17:28:12.617367	2018-07-23 17:28:12.617367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
153	Bansah	Kwame	0003009900                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	APP	t	jerry1@gmail.com	jerry2	C	\N	\N	12345678	1994-08-08	2018-08-08 14:40:47.140024	2018-08-08 14:40:47.140024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
147	Assurance	Rich	0267889899                                        	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	t	AIR	WEB	t	assurance@gmail.ao	assurance	D	4	158	$Clem@200!	2018-07-09	2018-07-23 17:46:32.804414	2018-08-07 17:13:04.137945	3	3	f	f		1	dfg4556	\N	t	
160	Kusi-Mensah	Yaw	44444555                                          	b8d59deb6d09e1e5ca59ca4bb8319d8fa8bd1e669bc8dac50ab53c19811b8547	t	MTN	APP	f	ykusimensah@yahoo.com	kusmeister	D	1	\N	Papsy4329	1993-08-12	2018-08-13 14:53:25.493819	2018-08-13 15:30:52.475416	4	3	t	t	\N	1	56603033 	\N	t	Korle Bu
197	Kwad	Kwad	09876531523                                       	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	t	ag@gdsa.com	paddoctor2	D	1	36	123456	1990-09-14	2018-09-14 11:22:03.870406	2018-09-17 12:01:20.853252	4	2	t	f		1	T4423		t	Kontact2 Hospital
166	Name	My	0243556632                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	myname@gmail.com	myname	D	1	36	pas123	1995-08-01	2018-08-17 11:57:34.6716	2018-08-17 12:03:34.09874	4	3	f	f	\N	2	455ghh	\N	t	Korle Bu
202	Patient	You	641654264                                         	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	TIG	APP	t	dfsa@oas.com	youpatient	C	\N	\N	123456	1994-09-17	2018-09-17 12:22:24.669707	2018-09-17 12:22:24.669707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
210	Hoffmann	Caleb	0272704910                                        	2f5735e8918b4384d63597e5afc9fff41f095d1908487868aa5304de19625e11	t	TIG	APP	t	lehoff2g8@gmail.com	caleb	C	\N	\N	ghingertest	1992-05-27	2018-12-01 06:26:19.891905	2018-12-01 06:26:19.891905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
221	Yamson	Enesrt	0546747905                                        	39e4837fb1bccdede34f783e82877cba56df503504a985a936163f31e9e01399	t	VOD	APP	t	fii@gmail.com	fiifi	C	\N	\N	centrik	2019-01-09	2019-01-09 14:33:23.416181	2019-01-09 14:33:23.416181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
177	Paddy	Doc	0541800000                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	dddoc2@gmail.com	paddydoc2	D	1	\N	123456	1993-08-26	2018-08-26 12:06:56.135583	2018-08-26 12:19:28.209438	4	3	t	t	\N	1	T24324	\N	t	Emmanual Eye Clinic
225	Testdox	Testsox	0244123412                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	VOD	APP	f	ga@gmail.com	testdoc	D	\N	\N	123456789	2019-01-11	2019-01-11 10:01:32.294807	2019-01-11 10:01:32.294807	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
182	Dede	Yeye	0243619780                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	joj@gmail.com	jojo	D	4	36	pas123	1973-12-01	2018-09-06 10:25:43.459373	2018-09-06 10:34:29.19224	4	5	f	\N		1	Gh267;		t	Kole Bu
186	Frema	Greg	0245369807                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	MTN	APP	f	gregf@gmail.com	akua	N	\N	\N	12345678	1984-09-11	2018-09-11 09:16:47.687234	2018-09-11 09:16:47.687234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
192	Leave	Leaves	0234119069                                        	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	t	UNKNOWN	WEB	t	leave@hotmail.com	leave	D	1	36	$Clem@200!	2018-08-27	2018-09-14 09:35:12.965673	2018-09-14 09:40:07.74013	3	3	f	f		1	HGJ453	\N	t	Alpha Hospital
236	Araba	Freda	0002200000                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	APP	f	araba@freda.com	dr	N	3	\N	12345678	1994-03-22	2019-01-25 19:05:56.081304	2019-01-25 19:07:00.131117	\N		\N	\N		\N	12345		\N	Mother Love
229	Lablab	Lablab	0244564123                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	VOD	APP	f	hgg@gmm.com	labman	L	\N	\N	123456789	2019-01-11	2019-01-11 10:19:22.709757	2019-01-11 10:19:22.709757	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
232	Yebb	Nurse2	0022001002                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	APP	f	fdsa@afdsa.com	pnurse2	N	\N	\N	pas123	1973-01-24	2019-01-24 13:37:13.100381	2019-01-24 13:37:13.100381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
172	Clara	Doctor	0003000000                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	APP	t	madyquaye1@icloud.com	claradoctor	D	1	158	pas123	1992-08-30	2018-08-20 15:56:44.70406	2018-08-20 17:01:49.572786	4	3	f	f		1	N124678		\N	University of ghana legon
109	Clementine	Clementine	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	VOD	APP	t	clementine@gamil.com	clementine	D	1	36	123456	2001-01-01	2018-05-05 14:12:59.921431	2018-05-05 14:19:45.205696	2	2	t	t	RE32432	1	E4234	32432	t	clementine clinic
108	clementino	clementino	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	VOD	APP	f	clementino@gmail.com	clementino	D	1	\N	123456	2001-01-01	2018-05-05 14:03:18.232871	2018-05-05 14:05:13.216779	2	23	t	\N	USA	1	E234324	UE324234	t	clementino clinic
154	Tandoh	Akosua	0203440000                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	f	VOD	WEB	f	akosua@gmail.com	paddynurse	N	2	\N	123456	1985-08-08	2018-08-08 17:08:32.507791	2018-08-09 12:28:11.617993	3	2	\N	\N	\N	1	123456	\N	f	nyaho
178	Paddy3	Doc3	0541099988                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	pad3doc3@gmail.com	paddydoc3	D	1	\N	123456	1992-08-26	2018-08-26 12:23:18.004633	2018-08-26 12:51:27.303674	4	2	t	t	\N	1	F2423	\N	\N	Emanual
161	Clem	Clem	0234889902                                        	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	t	UNKNOWN	WEB	t	clems@hotmal.com	clems	D	2	158	$Clem@200!	2018-07-30	2018-08-13 15:20:07.504394	2018-09-04 11:31:05.40134	2		t	t		\N			t	
173	Doc	Pad	0541840000                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	t	padm@gm.com	paddoc	D	\N	158	123456	1990-08-20	2018-08-20 16:19:55.096206	2018-09-04 13:15:48.190519	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
183	Tetteh	Andrew	0504899386                                        	15d283140e2e1021aacec3e370bc99235b59d6a31bab3b6ee86e1f56b78e060a	t	VOD	APP	t	andymistic37@gmail.com	andymistic	C	\N	\N	optimistic123	1991-09-07	2018-09-07 16:10:01.479199	2018-09-07 16:10:01.479199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
187	Frema	Greg	0542369180                                        	924592b9b103f14f833faafb67f480691f01988aa457c0061769f58cd47311bc	t	MTN	APP	t	fremag@gmail.com	aku	C	\N	\N	01234567	1992-04-11	2018-09-11 10:04:44.812683	2018-09-11 10:04:44.812683	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
198	Maddy	Patient1	0201356665                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	APP	t	madyy@gmail.com	madypatient1	C	\N	\N	pas123	1985-09-15	2018-09-15 18:14:55.336575	2018-09-15 18:14:55.336575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
205	Yo	Yo	09876545678                                       	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	AIR	APP	t	fdsat@gds.com	youyo	C	\N	\N	123456	1994-09-18	2018-09-18 18:49:52.006981	2018-09-18 18:49:52.006981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
152	Pa	Yonmu	0200000001                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	TIG	APP	t	p@fdsaf.com	paddy6	C	\N	\N	123456	2006-08-08	2018-08-08 12:27:28.518207	2018-08-08 12:27:28.518207	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
217	Demo	Mike	1234567                                           	8bf15a5b4e93bb7c0183e7a2d60f4cfe893d8350e212bd8f94bb9b51c35326a3	t	UNKNOWN	WEB	t	bbbb@b.com	adminqa	P	4	145	GhaccrA1!	2019-01-07	2019-01-07 22:54:28.937905	2019-01-07 23:00:00.897812	\N		\N	\N	\N	\N		\N	f	
167	Yeboah	George Elorm	0540000000                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	t	p@fdsaf.com	paddy7	C	\N	\N	123456	1990-08-17	2018-08-17 12:21:01.621568	2018-08-17 12:21:01.621568	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
203	Maame	Naa	0248021199                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	APP	t	madyquaye1@gmail.com	maamenaa	C	\N	\N	pas123	1991-09-17	2018-09-17 17:44:51.825024	2018-09-17 17:44:51.825024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
211	Addo	Kofi	0246149530                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	AIR	APP	t	freda.addae92@gmail.com	kofi	C	\N	\N	12345678	1995-12-13	2018-12-13 10:54:33.127614	2018-12-13 10:54:33.127614	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
148	Paddy	More	002                                               	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	t	p@fdsaf.com	paddypatient	C	\N	\N	123456	1998-08-06	2018-08-06 14:42:44.364068	2018-08-06 14:42:44.364068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	Samuel	Apps	0209210765                                        	90cc33a41b541af2c1964e3e10a46088cbdedf63031efaa35d588a698c91193f	t	VOD	WEB	t	sam@gmail.com	samuel	N	1	145	samuel	2017-10-17	2019-01-07 22:56:03.233736	2019-01-08 10:07:33.761499	\N	6	\N	\N	\N	\N	4973	\N	f	Kbu
222	Dela	Dela	0555762244                                        	d3d7b6aee7baa4fcae0156eff2b47dc32951c41204e979ce76657987912875ca	t	MTN	APP	t	dela@gmail.com	dela	C	\N	\N	amdbestofall	2019-01-09	2019-01-09 14:46:38.251961	2019-01-09 14:46:38.251961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
226	Testpharm	Testpham	0233456234                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	MTN	APP	f	testpharm@gmail.com	testpharmacist	P	\N	\N	123456789	2019-01-11	2019-01-11 10:13:01.81478	2019-01-11 10:13:01.81478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
230	Pad	Nursee	0541840988                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	padmorey@gmail.com	pnurse1	N	\N	158	pas123	1995-01-15	2019-01-15 09:55:45.335788	2019-01-15 10:22:10.775117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
233	Peepy	Nurse	0002000010                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	APP	f	fgdaf@gf.com	pnurse3	N	\N	\N	pas123	1983-01-24	2019-01-24 13:42:49.634256	2019-01-24 13:42:49.634256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
214	Trick	Lez	0243579781                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	claraaaaaa@aa.com	tricklez	C	\N	\N	pas123	1990-12-21	2018-12-21 13:57:09.75605	2018-12-21 13:57:09.75605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
237	Araba	Maame	0205869653                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	APP	t	freda@appsnmobilesolutions.com	drs	N	\N	158	12345678	1997-01-17	2019-01-25 19:34:39.585525	2019-01-25 19:36:51.230498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
149	Duga	Newoavor	0246718898                                        	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	t	MTN	WEB	t	duga@gmail.com	duga	C	3	\N	pas12345	2018-07-30	2018-08-07 22:58:39.13284	2018-08-07 22:58:39.331897	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
155	Mirabel	Agozi	0231990090                                        	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	t	UNKNOWN	WEB	f	mirabel@gmail.com	mirabel	N	4	\N	$Clem@200!	2018-07-29	2018-08-09 12:19:36.195294	2018-08-09 12:21:19.312691	\N		\N	\N	\N	\N	234453	\N	f	mamobi polyclinic
156	Tandoh	Akosua	0302502275                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	UNKNOWN	WEB	t	akosua1@gmail.com	claranurse	N	2	158	123456	1992-07-19	2018-08-09 12:33:41.007529	2018-08-09 16:48:43.504489	4	3	\N	\N	\N	1	12345	\N	f	oyarifa
162	Free	Free	85395738925                                       	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	UNKNOWN	WEB	t	free@gmail.com	free	C	1	\N	pas123	2018-08-13	2018-08-13 16:30:52.719596	2018-08-13 16:30:52.922796	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
168	Your	Name	0236498200                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	yrname@g.cim	yourname	C	\N	\N	pas123	2018-08-17	2018-08-17 15:39:08.709873	2018-08-17 15:39:08.709873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
212	Jones	Paul	0556745326                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	MTN	APP	t	pauljonesyiv@outlook.com	pj	C	\N	\N	123456789	1976-12-13	2018-12-13 19:11:33.449459	2018-12-13 19:11:33.449459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
174	Sarah	Awuah	0544828369                                        	dd7f6bfb6e0d8bcd754e97cae4975c07996f00508f8346d649c5814e19c3f9b9	t	MTN	APP	t	sarah@gmail.com	drnana	D	1	158	sarah123	1987-10-20	2018-08-20 16:20:17.21821	2018-08-20 16:58:25.621257	4	3	f	f	Eghar David Medical Training Center	1	N124678	TD45433453	t	University of ghana legon
215	Hoffmann	Caleb	0261904987                                        	40e8ba120cafa2380c1a3da860ed43fa4bc667865217ff755566606ca7e63eb2	t	AIR	APP	t	lehoff2008@hotmail.com	calebh	C	\N	\N	eugeniaB	1992-05-27	2018-12-24 11:47:18.958808	2018-12-24 11:47:18.958808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
234	Peepp	Nurse4	0222000010                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	APP	t	gdsa@a.com	pnurse4	N	1	158	pas123	1972-11-18	2019-01-24 13:46:02.258798	2019-01-25 16:38:07.769567	\N		\N	\N		\N	T2342435		\N	Alpha Clinic
179	Paddy4	Doc4	0201000010                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	paddy4doc4@gmail.com	paddydoc4	D	1	\N	123456	1995-08-26	2018-08-26 13:12:20.427009	2018-08-26 13:13:52.07365	4	2	t	t	EMeria Medical center	2	E3242	E223211	t	37 Hospital
176	Clara	Doctor1	0244160414                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	f	co_excutie1@yahoo.com	claradoctor1	D	\N	\N	pas123	1992-08-30	2018-08-20 16:56:09.030794	2018-08-20 16:56:09.030794	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
188	Pad	Azalekor	0582000000                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	TIG	APP	t	saf@gdsa.com	padpatient	C	\N	\N	123456	1986-09-13	2018-09-13 11:39:31.624078	2018-09-13 11:39:31.624078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
199	Maddy	Doctor1	0242567754                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	maddyg@gmail.com	madydoctor1	D	1	36	pas123	1978-09-15	2018-09-15 18:16:24.155697	2018-09-17 11:00:52.839226	4	5	f	\N		1	Gn245		t	Legon
219	Nanapoland	Nanapoland	090967758765                                      	46d17de670e7538b2fa95f4f5061b997082f17dfaaa3c6f33964a9df1270bfa7	t	UNKNOWN	WEB	t	nana@gmail.com	nanapoland	C	1	\N	nanapoland	2006-03-09	2019-01-08 10:23:53.456419	2019-01-08 10:23:53.676587	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
206	Appiah-sakyi	Nana	539326102                                         	3331f66d3e17ea07a635da77e06d82cb88fcc74a15a3012a42b9b4948386628a	t	VOD	APP	t	nyamekyeapp@gmail.com	adoma	C	\N	\N	kasakyi	1997-07-14	2018-09-18 19:33:24.717125	2018-09-18 19:33:24.717125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
223	Testuser	Testuser	0233651122                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	AIR	APP	t	test@gmail.com	testuser	C	\N	\N	123456789	2019-01-11	2019-01-11 09:18:52.194804	2019-01-11 09:18:52.194804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
227	Testphif	Teatvbhg	0233566424                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	VOD	APP	f	hf@gmail.vom	testpharm	P	\N	\N	123456789	2019-01-11	2019-01-11 10:15:12.43535	2019-01-11 10:15:12.43535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
231	Nnurse	Newma	00000011                                          	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	APP	f	nnurse@nu.com	nnurse1	N	\N	\N	pas123	1982-12-23	2019-01-15 10:27:19.615333	2019-01-15 10:27:19.615333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
238	Maame	Nurse	050489938                                         	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	WEB	t	co_excutie16@yahoo.com	naanurse	N	1	158	pas123	2019-06-07	2019-01-28 13:28:07.000277	2019-01-28 13:34:04.337369	\N	2	\N	\N	\N	1	gn544	\N	f	university of ghana
204	Naa	Maame	0202233117                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	APP	t	freeee@freee.com	naamaame	D	1	158	pas123	1980-09-17	2018-09-17 17:48:20.939192	2018-09-17 18:07:27.216952	4	5	f	\N		1	Gh2344		t	Legon
110	Ben	Fiifi	0264620500                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	WEB	t	ben@gmail.com	ben	C	2	\N	12345678	2016-11-27	2018-05-05 14:13:12.50429	2018-05-05 14:13:12.691115	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
139	Dranas	Dranas	0244574744                                        	f0b7f71ec4da1c026c372cc862501f23ebd9dafc0256252815a3f6066722395c	t	UNKNOWN	WEB	t	anas@gmail.com	dranas	D	4	145	ntwelve	2005-01-09	2018-06-20 10:27:57.295641	2018-06-20 10:36:48.457411	3	14	t	t	rcog	2	1223345		f	north kaneshsie clinic 
7	Ago	Nam	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	ago@gmail.com	ago	D	1	36	\N	2014-03-30	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	Kusimensah	Yaw	0244574744                                        	6dccb5fa4402fe7f15fb887a20a7c4ddccfc17594c9777382da09931a17138a5	t	\N	WEB	t	ykusimensah@gmail.com	drkusmeister	D	2	145	\N	2028-02-19	2018-04-20 05:58:43.294476	2018-04-20 07:06:36.019548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	Appiah	Gloria	0244574744                                        	bbd617ad5ab21eca0ed7d0895e76ae062bc99ddbf2ea0e3fc81123e5ee4ca7a6	t	\N	WEB	t	G@apl.com	gloria	C	2	145	\N	2018-04-02	2018-04-20 06:20:49.080923	2018-04-20 07:15:27.125352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	Clara	Addae	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	PTL	t	cl@yahool.com	claradoc	N	\N	36	\N	2018-04-20	2018-04-20 16:08:20.812554	2018-04-20 16:08:20.812554	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	Doctor	Doctor	0264620500                                        	f348d5628621f3d8f59c8cabda0f8eb0aa7e0514a90be7571020b1336f26c113	t	VOD	APP	f	doc@gmail.com	doctor	D	\N	\N	doctor123	1988-02-01	2018-04-17 22:03:00	2018-04-17 22:03:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	Maddy	Cutie	0264620500                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	MTN	APP	f	Mady@gmail.com	maddy	D	\N	\N	123456789	1991-08-30	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	Appiah 	kobby2	0264620500                                        	92b7495bead46124bc6baa6616f19b9f7783e03c81595f33e01a2204713a6cf6	t	VOD	APP	f	K@aol.com 	kobby2	D	\N	\N	Passwordkobby2	1991-07-01	2018-04-20 07:24:51.872515	2018-04-20 07:24:51.872515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	Jon	Sexton	0264620500                                        	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	t	TIG	WEB	f	john@gmail.com	jon	C	2	\N	pas12345	2018-04-19	2018-04-19 11:36:28.945754	2018-04-19 11:36:28.945754	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	Quaye	Akosua	0264620500                                        	555cf638ea8288ac324dafe31787122f31c8d8d5825c6fb52b654aa01233f2b3	t	MTN	APP	t	Clara@gmail.com	clara	C	\N	\N	claraclara	2000-01-01	2018-04-17 22:01:00	2018-04-17 22:01:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	Atsra	Oscar	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	PTL	t	oscar@gmail.com	oscar1	D	\N	\N	\N	2018-04-09	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	Addae	Freda	0264620500                                        	ecb93e1590e08c3f17be82b54932ae78926d606d57d2f680377b82d7d20b2dcf	t	MTN	PTL	t	freda@gmail.com	sweetness	N	\N	\N	\N	2018-04-18	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	Jason	Kofi	0264620500                                        	3c64d02e75dab84df045b1486db6ff8b3967715cd2e0ee333e4c6c79f8db7f7a	t	VOD	APP	f	json@gmail.com	jason	P	\N	\N	jason123	2001-01-01	2018-04-19 16:14:10.437348	2018-04-19 16:14:10.437348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	Adzah	Huj	0264620500                                        	05a3a662c87fecce26130eafef769697ea4f95d8c3249409512b7fe9bc39f45d	t	AIR	APP	f	Adzah@am.com	adzah	L	\N	\N	adzah123	2001-01-01	2018-04-19 18:43:10.827142	2018-04-19 18:43:10.827142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	Doku	Mercy	0264620500                                        	a8447567d3aa5c32a3f197d9156a34fbd820f9290e8cccdcc640422f7aa7e147	t	MTN	APP	f	K@aol.com 	patmercy	C	\N	\N	Passwordpatmercy	1986-12-01	2018-04-20 13:27:31.042164	2018-04-20 13:27:31.042164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
157	Appiah	Sam	1234567970                                        	8a6eeebd0db62b649ac76f9cbc40adbbb93b7b634aece7e738907c9491a34a14	t	VOD	APP	t	sappiah004@gmail.com	samuelapp	C	\N	\N	hellopls	1993-08-09	2018-08-09 12:42:30.99988	2018-08-09 12:42:30.99988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
141	agyas	kenedy	0264620500                                        	b8cacfe93b1d528968b96af549cc85a9e277abdb269f906e39c7888cd99dd1f5	t	TIG	APP	t	ky@gmail.com	kenedy	C	\N	\N	kenedy	1957-01-01	2018-06-21 15:33:07.547443	2018-06-21 15:33:07.547443	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	Tetteh	Andy	0201234467                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	APP	t	Nii@gmail.com	nii	C	\N	135	\N	2001-01-01	2018-04-20 10:47:19.876099	2018-04-20 10:49:37.823634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	Danso	Kwame	0264620500                                        	263a601c948f2cdcb7521365a8b83120096121a618938ef1291a8de02f3837b8	t	MTN	WEB	t	kwamedanso@gmail.com	kwamedanso	P	1	36	\N	2012-01-02	2018-04-17 22:03:10	2018-04-17 22:03:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
163	Thursday	Test	0245113328                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	thursdaytest@test.com	thursday	C	\N	\N	pas123	2007-01-09	2018-08-16 08:40:16.702289	2018-08-16 08:40:16.702289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
169	Ne	Doc	0000000110                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	dsaf@gasd.com	newdoc	D	1	\N	123456	1994-08-17	2018-08-17 18:15:21.013516	2018-08-17 18:17:18.683173	1	3	t	t	Ggf hjk	2	4567fd78	Erty8787	t	Emmanuel Eye Clinic
171	Awuah	Nana	0247523760                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	MTN	APP	t	ponkrtiah@gmail.com	sarah	C	1	\N	12345678	1993-10-30	2018-08-20 15:44:01.366489	2018-08-20 16:48:36.07594	4	3	f	f	Eghar David Medical Training Center	1	N124678	TD45433453	\N	University of ghana legon
180	Clara	Doctor2	0506075223                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	APP	f	voda@gmail.com	claradoctor2	D	1	\N	pas123	1983-09-04	2018-09-04 11:23:03.487108	2018-09-04 11:26:00.975435	4	10	f	\N		1	Doc123		t	Oyarifa
184	Mady	Doctor	0264620508                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	APP	t	co_excutie@yahoo.com	madydoctor	D	1	158	pas123	1984-01-17	2018-09-10 12:55:47.021588	2018-09-10 13:02:08.932643	4	5	f	\N		1	Ggfvhjk		t	Legin
189	Essel	Pad	0200000190                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	t	pfasda@fasfs.com	paddoctor	D	1	158	123456	1986-09-13	2018-09-13 11:43:32.929617	2018-09-13 11:46:19.31293	4	2	t	f		1	8767ew0		t	Emmanuel Clinic
150	Anka	Appiah	0000000000                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	AIR	APP	t	p@fdsaf.com	anka	C	\N	\N	123456	2000-08-08	2018-08-08 10:43:37.132019	2018-08-08 10:43:37.132019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
200	My	Paddy	0998693200                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	t	fdsia@fja.com	mypaddy	D	1	36	123456	1990-09-17	2018-09-17 10:26:47.62454	2018-09-17 11:06:02.761225	4	3	t	f		1	T32421		t	M Paddy Hospital
1	Yeboah	Padmore	0264620500                                        	d169aa18ee15483aef92fb71a3eed0031e8d74715652e213a85fc66965edbed7	t	MTN	APP	t	p@fdsaf.com	paddy	C	\N	\N	padmore123	1992-12-16	2018-04-17 22:00:00	2018-04-17 22:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
208	Yeboah	Elorm kwaku	00200                                             	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	t	pd@gmaci.com	elorm	C	\N	\N	123456	2006-11-30	2018-11-30 13:10:10.419066	2018-11-30 13:10:10.419066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	Apps	Gloria	0208910765                                        	2ab425f1c4e3f382848f53e78c2f1fb14b0c79cabddd45d748933190fe9c7c48	t	MTN	APP	t	g@mail.com	gnurse	N	\N	145	mywife	1951-12-04	2019-01-01 05:25:42.181811	2019-01-11 09:50:33.704879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
213	El	Parddie	0202233117                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	VOD	APP	t	padyy@gm.com	paddy9	C	\N	\N	123456	1992-12-16	2018-12-17 12:19:40.817919	2018-12-17 12:19:40.817919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	Essel	Kwaku	0264620500                                        	93aa8e032ac13dc4b3eaf50cbf465d2dbf17c4a55891f2698ebf5bdfae529be8	t	VOD	WEB	f	kwakuessel@gmail.com	kwakuessel	D	2	\N	kwakuessel	2012-01-02	2018-04-22 10:11:51.639003	2018-04-22 10:11:51.639003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	Mercy	Dooko	0264620500                                        	f2880bb1ea28995bfa68716e8e9cd74d802b6e8b73638294f8386886e981a04d	t	VOD	APP	f	nm@gmail.com	nursemercy	N	\N	\N	Passwordnursemercy	1971-12-01	2018-04-23 07:30:50.542339	2018-04-23 07:30:50.542339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	Bum	Moesha	0264620500                                        	45a00a3962438c5abdffe4ff1c0b3a1a11a9aec76777f7a3ee240d305fb6a721	t	MTN	APP	f	moes@gmail.com	moesha	C	\N	\N	moesha123	2001-01-10	2018-04-24 23:01:31.025366	2018-04-24 23:01:31.025366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	Mensah	Kwame	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	ck@yahoo.com	ck	C	2	\N	pas123	2018-04-25	2018-04-25 11:11:26.222867	2018-04-25 11:11:26.222867	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	Mensah	Kwame	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	ck@yahoo1.com	cky	C	2	\N	pas123	2018-04-25	2018-04-25 11:13:04.790677	2018-04-25 11:13:04.790677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	Mensah	Kwame	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	cyk@yahoo1.com	ckye	C	2	\N	pas123	2018-04-25	2018-04-25 11:20:46.45085	2018-04-25 11:20:46.45085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	Mensah	Kwame	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	cye@yahoo1.com	cke	C	2	\N	pas123	2018-04-25	2018-04-25 11:22:23.000575	2018-04-25 11:22:23.239416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	Agozi	Melody	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	melody@gmail.com	melody	C	1	\N	pas123	2002-08-01	2018-04-25 11:38:25.565953	2018-04-25 11:38:25.770656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	Agozi	Melody	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	melod1y@gmail.com	melodye	C	1	\N	pas123	2002-08-01	2018-04-25 11:39:23.121232	2018-04-25 11:39:23.369392	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	Agozi	Nora	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	nora@gmail.com	nora	C	1	\N	pas123	2000-10-09	2018-04-25 12:11:53.786117	2018-04-25 12:11:54.042017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	Agozi	Yayra	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	yayra@gmail.com	yayra	C	2	\N	pas123	2018-04-25	2018-04-25 12:33:33.35417	2018-04-25 12:33:33.593467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	Amoah	getty	0264620500                                        	cee71eaf4ebca669b3db4e655c75f7755f965e498541ac3a630bfecb8ee87ee0	t	MTN	APP	f	get@gmail.com	getty	C	\N	\N	getty123	2001-01-01	2018-04-25 12:49:11.677179	2018-04-25 12:49:11.677179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	Jimah	namak	0264620500                                        	b592dc6a2efc7a96111b7fd118e128d47f25f2b0a5c2719e43364431b5330c88	t	MTN	APP	f	namak@yahoo.com	namak	D	\N	\N	namak123	2000-01-01	2018-04-25 12:51:30.09944	2018-04-25 12:51:30.09944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	Agada	Hope	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	hope@gmail.com	hpe	D	2	\N	pas123	2018-04-25	2018-04-25 14:09:01.093394	2018-04-25 14:09:01.093394	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	Chizzy	Baby	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	chizzy@gmail.com	chizzy	D	2	\N	pas123	2018-04-01	2018-04-25 14:27:55.409072	2018-04-25 14:27:55.409072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	Agbo	Clem	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	clem@yahot.com	clemsedem	D	1	\N	pas123	2018-04-25	2018-04-25 16:43:05.682418	2018-04-25 16:43:05.682418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	Agozi	Sedem	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	asedem@gmail.com	asedem	D	1	\N	pas123	2018-04-25	2018-04-25 16:50:10.055669	2018-04-25 16:50:10.055669	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	John	Johnson	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	jj@gmail.com	jj	D	1	\N	pas123	2018-04-26	2018-04-26 08:49:30.593406	2018-04-26 08:49:30.593406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	Bekui	Mawunya	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	mawu@gmail.com	mawu	D	2	\N	pas123	2018-04-01	2018-04-26 08:52:16.751038	2018-04-26 08:52:16.751038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	Agbemabiese	Padmore	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	padimore@gmail.com	padimore	D	2	\N	pas123	2018-04-26	2018-04-26 10:46:52.674762	2018-04-26 10:46:52.674762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	John	Kenny	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	f	kenny@gmail.com	kenny	D	1	\N	pas123	2018-04-26	2018-04-26 11:07:47.562183	2018-04-26 11:07:47.562183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	Blaq	John	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	blaq@yahool.com	blaq	D	1	\N	pas123	2018-04-26	2018-04-26 11:11:21.354629	2018-04-26 11:14:50.127571	\N		f	f		\N		\N	\N	\N
58	Nyedzi	Arnold	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	arnold@gmail.com	arnold	D	1	\N	pas123	2018-04-26	2018-04-26 11:28:36.161629	2018-04-26 11:31:27.963892	4	5	f	f		2	RK456IP	\N	\N	\N
59	Ayeley	Naa	0264620500                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	APP	t	Naa@yahoo.com	naa1	C	\N	\N	12345678	2001-01-01	2018-04-26 11:37:58.736236	2018-04-26 11:37:58.736236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	Mbea	Nancy	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	f	nancy@gmail.com	nancy	D	2	\N	pas123	2018-04-03	2018-04-26 12:47:28.783079	2018-04-26 15:18:23.186918	4	6	f	f		1	YTHjd33	\N	t	\N
61	Osei	Patricia	0264620500                                        	0414530a84a89ce3f1d693f0376570be8cc1177bee503027cbf15d4a79d9a9f5	t	MTN	APP	t	pat@gmail.com	pat	C	\N	\N	pat123	2001-01-01	2018-04-26 15:43:39.976461	2018-04-26 15:43:39.976461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	Mena	Mansah	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	mena@gmail.com	mena	C	1	\N	pas123	2018-04-25	2018-04-27 09:57:17.286403	2018-04-27 09:57:17.286403	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
63	Mena	Mansah	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	mansah@gmail.com	mensa	C	2	\N	pas123	2018-04-02	2018-04-27 10:01:18.758025	2018-04-27 10:01:18.758025	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
64	Mena	Mansah	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	mans1ah@gmail.com	mensah	C	2	\N	pas123	2018-04-02	2018-04-27 10:02:55.708459	2018-04-27 10:02:55.708459	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
65	Mena	Mansah	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	f	mans2ah@gmail.com	mensahs	C	2	\N	pas123	2018-04-02	2018-04-27 10:03:50.097291	2018-04-27 10:03:50.097291	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
66	Mena	Mansah	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	AIR	WEB	t	mans4ah@gmail.com	mens	C	2	\N	pas123	2018-04-02	2018-04-27 10:04:47.598821	2018-04-27 10:04:47.9177	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
67	Donalds	Stev	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	stev@gmail.com	stev	D	2	\N	pas123	2018-04-01	2018-04-27 10:09:13.396494	2018-04-27 17:37:22.654483	2	4	f	f		1	DKF75KF	\N	t	\N
87	Paddy1	Paddy1	0264620500                                        	df4b0a3d762c150089f185b86b1bc89874cfee38c08c61db99dbd7dde57d61f8	t	MTN	APP	f	paddy1@gmail.com	paddy1	N	\N	\N	paddy1	2001-01-01	2018-05-02 20:51:13.159955	2018-05-02 20:51:13.159955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	Paddy2	Paddy2	0264620500                                        	9a02247ddd864b9a04fd8a220e02a37bf375c8f47695e50e78ba8bd35c5ffbb9	t	MTN	APP	f	paddy2@gmail.com	paddy2	D	\N	\N	paddy2	2001-01-01	2018-05-02 20:52:13.471947	2018-05-02 20:52:13.471947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	Yaa	Freda	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	yaa2@hotmail.com	yaa	C	1	\N	pas123	2018-04-30	2018-04-30 11:44:33.000179	2018-04-30 11:44:33.203757	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
90	Winkles	Becky	0264620500                                        	af7acf0251392b90198d89b9934c9a7f4a60d2b7765e2d673f08a3c48cb333c1	t	AIR	APP	f	B@gmail.com	nursebecky	N	\N	\N	Passwordnursebecky	2001-01-01	2018-05-04 12:21:26.13067	2018-05-04 12:21:26.13067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	Cloe	Hulda	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	f	cloe@gmail.com	cloe	N	1	\N	pas123	2018-05-16	2018-05-04 12:59:51.405554	2018-05-04 13:00:59.878804	1	4	\N	\N	\N	2	j683334	\N	f	\N
93	Apps	Gloria	0264620500                                        	022d787db18783eec27669a3b950dbeb0e48f858567b9d9fcc866a0c601c6ee4	t	VOD	APP	t	G@gmail.com	patgloria	C	\N	\N	Passwordpatgloria	1992-01-01	2018-05-04 13:01:09.045297	2018-05-04 13:01:09.045297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
99	Paddydoc	Paddy	0264620500                                        	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	t	MTN	APP	f	portugal@gmail.com	paddydoc	D	1	\N	paddydoc123	2001-01-01	2018-05-04 17:57:13.393377	2018-05-04 19:49:32.38431	4	1 year	t	t	Fyn	2	Got t55	55tty77	\N	\N
95	Malik	Abdul	0264620500                                        	17dffde774df0caff8b6997b37163d4dc671d0c2f844aea43929e980480f288e	t	TIG	APP	f	A@hmail.com	drabdul	D	\N	\N	Passworddrabdul	1993-01-01	2018-05-04 13:18:53.805997	2018-05-04 13:18:53.805997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	Good	Luck	0264620500                                        	db8fce3159a1a83df4702831475e8be89cd11ac2abd200233ed9d62dccc3b8de	t	MTN	APP	t	Good@yah.com	luck	C	\N	\N	pas12345	2001-01-01	2018-05-04 14:26:33.159909	2018-05-04 14:26:33.159909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	Paddy	DOCTOR	0264620500                                        	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	t	MTN	APP	f	Paddoc@	paddydoctor	D	1	\N	paddydoc123	2001-01-01	2018-05-04 14:00:19.303599	2018-05-04 15:55:38.697188	3	2 years	t	t	Udhshs	1	Yeheh3	722hhe	\N	\N
101	Paddydoc	Paddydoc	0264620500                                        	47ee518e8ffc2a6940ed3c973d1801748fdfe05c23938494b38e351b87d0602a	t	VOD	WEB	f	paddydoc2@gmail.com	paddydocweb	D	1	\N	paddydoc23	2018-05-04	2018-05-04 21:35:52.955835	2018-05-04 21:41:15.303972	2	2	t	t	fdfq	1	rr32432	r45454	t	\N
100	paddydoc1	paddydoc1	0264620500                                        	9560e0290d69b4e7844c55dacbe836597fe61b3ae1ba479cbeee72d7be14144e	t	MTN	APP	f	paddydoc1@gmail.com	paddydoc1	D	1	\N	paddydoc123	2001-01-01	2018-05-04 21:29:12.412613	2018-05-04 21:43:23.159413	4	3	t	t	fads fsdf	1	43234	23424	\N	\N
105	Paddydocd	Paddydocd	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	fdsf@gmail.com	paddydocd	D	\N	\N	123456	2001-01-01	2018-05-05 13:34:27.230118	2018-05-05 13:34:27.230118	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
106	paddydoca	paddydoca	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	paddydoca@gmail.com	paddydoca	D	1	\N	123456	2001-01-01	2018-05-05 13:50:48.089229	2018-05-05 13:51:51.989902	1	2	t	\N	fsddaf	1	5234c	32rfsdf	t	paddydoca clinic
107	clementina	clementina	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	fasf@gmail.com	clementina	D	1	\N	123456	2001-01-01	2018-05-05 13:56:30.824123	2018-05-05 13:57:53.293381	2	2	t	\N	USA foreign regulator	1	asf45	EUS123434	t	clementina clinic
144	Shaft Asante	Dora	0264620500                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	MTN	APP	f	dadjoshaft@gmail.com	deeshaft	D	\N	\N	12345678	1993-04-06	2018-07-23 15:21:55.786982	2018-07-23 15:21:55.786982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
89	Araba	Yaa	0264620500                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	VOD	APP	t	freeee@freee.com	maame	C	\N	\N	12345678	1988-01-07	2018-05-04 09:33:53.084342	2018-05-04 09:33:53.084342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	Adom	Yaw	0264620500                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	AIR	APP	t	freda.addae92@gmail.com 	frank	D	1	149	123456789	1987-01-19	2018-05-05 21:26:36.446662	2018-05-05 21:46:16.614897	2	5	t	t	NY 	2	12345	98765	t	Oyarifa general hospital 
112	Mensah	Clara	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	clacla@yahoo.com	clacla	C	3	\N	pas123	2018-05-06	2018-05-07 13:15:28.40337	2018-05-07 13:15:28.615655	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
113	Mady	Clare	0264620500                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	MTN	APP	t	Clare@gmail.com	clare	C	\N	\N	12345678	2001-01-01	2018-05-07 13:19:45.031967	2018-05-07 13:19:45.031967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
114	Budog	Momo	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	WEB	t	momo@yall.om	mom	C	3	\N	pas123	2018-05-07	2018-05-07 13:32:22.686616	2018-05-07 13:32:22.888961	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
115	Padmore	Paddy	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	Paddy@gmail.com	paddy123	C	\N	\N	pas123	2001-01-01	2018-05-09 09:26:58.174643	2018-05-09 09:26:58.174643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
116	Clementina	Clementina	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	Clem@gmail.com	clementine1	D	\N	\N	123456	1994-06-01	2018-05-09 09:33:37.916069	2018-05-09 09:33:37.916069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
117	Clementine2	Cle	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	Hg@ymailm.com	clementine2	D	1	\N	123456	1985-01-01	2018-05-09 09:36:54.702478	2018-05-09 09:38:10.854621	2	2	t	t	Rttddfg	1	244433	443355	t	Beauty eye clinic 
118	Dadson	Samson	0264620500                                        	e24df920078c3dd4e7e8d2442f00e5c9ab2a231bb3918d65cc50906e49ecaef4	t	MTN	APP	t	freda.addae92@gmail.com 	kay	C	\N	\N	87654321	1990-01-01	2018-05-09 15:24:11.433451	2018-05-09 15:24:11.433451	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
119	New 	Paddy	0264620500                                        	ffff233db410e5acf113cff436edf4e8ec9d3d4284136219667294d674378e30	t	VOD	APP	f	P@gmail.com 	drpaddy	D	1	\N	Passworddrpaddy	1996-01-01	2018-05-10 00:54:48.823526	2018-05-10 01:27:59.565014	4	7yrs	t	t	Fmc	2	54368	67894	t	Korlebu
120	Newman 	Patpaddy	0264620500                                        	5f5d906024bedc60d3998a753fb800074f39a2c5fde6ac6b10239044084ad06d	t	MTN	APP	t	Pt@gmail.com 	patpaddy	C	\N	\N	Passwordpatpaddy	1996-05-01	2018-05-10 01:37:13.213418	2018-05-10 01:37:13.213418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
121	Ababio	Bansah	0264620500                                        	8a9bcf1e51e812d0af8465a8dbcc9f741064bf0af3b3d08e6b0246437c19f7fb	t	AIR	APP	f	ababio@gmail.com 	jerry1	D	\N	\N	987654321	1982-01-01	2018-05-10 09:32:48.497241	2018-05-10 09:32:48.497241	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
122	Andrew	Andy	0264620500                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	TIG	WEB	f	andy@yahoo.com	andy	D	3	\N	12345678	2015-12-27	2018-05-10 14:36:23.735939	2018-05-10 14:36:23.735939	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
123	Andrew	Andy	0264620500                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	TIG	WEB	f	andy1@yahoo.com	andrew	D	1	\N	12345678	2018-05-10	2018-05-10 15:16:44.653972	2018-05-10 15:17:43.386623	4	2	t	t		1			t	university of ghana
125	Wil	Mina	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	TIG	WEB	f	mina1@gmail.com	minaa	N	2	\N	pas123	1990-05-15	2018-05-15 16:36:28.774937	2018-05-15 16:36:35.556386	\N		\N	\N	\N	\N		\N	f	
124	Wil	Mina	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	f	TIG	WEB	f	mina@gmail.com	mina	N	2	\N	pas123	2018-05-15	2018-05-15 13:00:47.826899	2018-05-18 12:30:09.990002	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
126	Amemo	Johnson	0264620500                                        	dc168d29b385fd3dcf61f8feb1bc99c8907761c201ca3d2f5a2e27bea340af5d	t	MTN	WEB	f	johnson@hotmail.com	johnson	N	1	\N	$Clem@200!	2018-05-08	2018-05-18 16:02:18.647664	2018-05-18 16:02:33.149553	\N		\N	\N	\N	\N		\N	f	
135	Kwesi	Kay	0264620500                                        	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	t	MTN	APP	t	samson@appsnmobilesolutions.com	samson	C	\N	\N	12345678	1993-01-01	2018-06-15 12:36:11.397744	2018-06-15 12:36:11.397744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
132	Ayeley	Naa	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	MTN	APP	t	mady@yahoo.com	cpatient	C	\N	\N	pas123	1992-08-30	2018-06-15 10:02:05.534483	2018-06-15 10:02:05.534483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
136	Lawer	Nii	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	TIG	APP	f	silas@gmail.com	silas	D	\N	\N	123456	1996-01-01	2018-06-18 16:43:15.552246	2018-06-18 16:43:15.552246	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
137	Ocansey	John	0264620500                                        	836fff1d12aa49e02c8dc58540d7ff8ad925d72b061406f7e9d4d0c6ac0a8e30	t	UNKNOWN	WEB	t	kasakyi@hotmail.com	jonijoni	C	1	\N	jonijoni	2018-06-03	2018-06-19 15:47:54.469168	2018-06-19 15:47:54.663592	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
138	Nyantekyi	Kofi	0264620500                                        	10d2f04f8cabca069e9be72143f1ff0f93992d91d7a7e4dfb82dfe8dbe04ea26	t	UNKNOWN	WEB	t	nyam@gmail.com	nyants	C	1	\N	bribery	2011-10-11	2018-06-20 10:23:50.732761	2018-06-20 10:23:50.936657	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
142	Appiah1	Oh	0264620500                                        	bd36fef422668fcb69ad9e5547c9b52a27d581d61b695ffb131d71b18a49a06b	t	VOD	APP	t	kasakyi@hota	sam	C	\N	\N	simpleone	2001-01-01	2018-06-22 10:39:55.043305	2018-06-22 10:39:55.043305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
143	Quaye	Maame	0264620500                                        	8a6cf87229d1abf5d111b6d9ca19b77a6edddff5203b32bd1bee378d92371114	t	VOD	APP	t	maame@yahoo.com	cpatient1	C	\N	\N	pas123	1990-07-23	2018-07-23 10:50:38.256599	2018-07-23 10:50:38.256599	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	Shaft Asante	Dora	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	VOD	APP	t	dajoshaft@gmail.com	dee	C	\N	\N	123123123	1993-04-05	2018-06-14 12:55:03.995467	2018-06-14 12:55:03.995467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
127	Yeboah	Padmore	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	MTN	APP	f	p@fdsaf.com	paddy3	D	1	\N	123456	1990-10-01	2018-06-05 21:10:47.077963	2018-06-05 21:17:02.370546	1	2	t	t	Eisten School	1	756757	8043242	t	Emmanuel Eye Clinic
128	Yeboah	Elorm	0264620500                                        	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	t	TIG	APP	t	p@fdsaf.com	paddy4	C	\N	\N	123456	1991-11-01	2018-06-06 11:12:19.856195	2018-06-06 11:12:19.856195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
134	Araba	Aba	0264620500                                        	15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225	t	VOD	APP	f	freeee@freee.com	freda	D	1	\N	123456789	1994-08-16	2018-06-15 12:23:26.787082	2018-06-15 12:24:51.03777	4	4	f	f	\N	1	22345	\N	t	Motherlove
\.


--
-- Name: registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.registration_id_seq', 238, true);


--
-- Data for Name: request_categories; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.request_categories (id, category, ref_id, created_at, updated_at) FROM stdin;
1	Self	S	2017-11-03 14:40:26.429892	2017-11-03 14:40:26.429892
2	Beneficiary	T	2017-11-03 14:40:41.742451	2017-11-03 14:40:41.742451
\.


--
-- Name: request_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.request_categories_id_seq', 2, true);


--
-- Data for Name: request_urgencies; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.request_urgencies (id, urgency, ref_id, created_at, updated_at) FROM stdin;
1	Standard	S	2017-11-03 16:55:25.400372	2017-11-03 16:55:25.400372
2	Express	E	2017-11-03 16:56:00.18175	2017-11-03 16:56:00.18175
\.


--
-- Name: request_urgencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.request_urgencies_id_seq', 2, true);


--
-- Data for Name: requester_allergies; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.requester_allergies (id, pre_appointment_id, allergy_id, comment, user_id, active_status, del_status, created_at, updated_at, requester_id) FROM stdin;
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
16	\N	3		\N	t	f	2018-08-17 12:35:54.40774	2018-08-17 12:35:54.40774	286
17	\N	2		\N	t	f	2018-09-05 11:57:27.459156	2018-09-05 11:57:27.459156	289
18	\N	4		\N	t	f	2018-09-05 11:59:05.173162	2018-09-05 11:59:05.173162	290
19	\N	5		\N	t	f	2018-09-05 11:59:05.175476	2018-09-05 11:59:05.175476	290
20	\N	10		\N	t	f	2018-09-06 17:35:31.979283	2018-09-06 17:35:31.979283	272
21	\N	10		\N	t	f	2018-09-11 10:09:06.127961	2018-09-11 10:09:06.127961	306
22	\N	11		\N	t	f	2018-09-11 10:09:06.131543	2018-09-11 10:09:06.131543	306
23	\N	11		\N	t	f	2018-09-18 10:00:10.756449	2018-09-18 10:00:10.756449	300
24	\N	2		\N	t	f	2019-01-23 10:46:38.030687	2019-01-23 10:46:38.030687	257
25	\N	3		\N	t	f	2019-01-23 10:46:38.138359	2019-01-23 10:46:38.138359	257
\.


--
-- Name: requester_allergies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.requester_allergies_id_seq', 25, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.roles (id, name, created_at, updated_at, user_id, comment, active_status, del_status) FROM stdin;
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

SELECT pg_catalog.setval('public.roles_id_seq', 7, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.schema_migrations (version) FROM stdin;
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
20180620160130
20180813095614
20180816183128
20180817093142
20181105102758
20181105112635
20181105112836
20181105113003
20181108100154
20181108112215
20181108120438
20181109101843
20181112124339
20181112160040
20181115181227
20181115181234
20181115181240
\.


--
-- Data for Name: service_fee_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.service_fee_masters (id, appt_type_id, service_id, req_urgency, fee, comment, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
46	PDDP	\N	S	0.10		158	t	f	2019-01-11 14:51:12.729685	2019-01-11 14:51:12.729685
47	PDDP	\N	E	0.10		158	t	f	2019-01-11 14:51:26.60585	2019-01-11 14:51:26.60585
48	PDVC	\N	S	0.10		158	t	f	2019-01-11 14:51:42.757625	2019-01-11 14:51:42.757625
49	PDVC	\N	E	0.10		158	t	f	2019-01-11 14:52:06.520561	2019-01-11 14:52:06.520561
39	HC	\N	S	0.10		36	t	f	2018-12-19 17:51:45.859308	2019-01-24 11:33:40.686836
40	HC	\N	E	0.10	tuhegph[	36	t	f	2018-12-19 17:52:05.947354	2019-01-24 11:34:18.698023
35	PC	\N	S	58.00		36	t	f	2018-12-19 12:24:07.228814	2018-12-19 12:24:07.228814
36	PC	\N	E	100.00		36	t	f	2018-12-19 12:26:31.613171	2018-12-19 12:26:31.613171
37	VC	\N	S	120.00		36	t	f	2018-12-19 12:43:48.408211	2018-12-19 12:43:48.408211
38	VC	\N	E	200.00		36	t	f	2018-12-19 12:44:02.754454	2018-12-19 12:44:02.754454
41	PDHC	\N	S	70.00		36	t	f	2018-12-20 13:19:46.820061	2018-12-20 13:19:46.820061
45	LA	14	S	0.10		158	t	f	2019-01-02 15:19:33.639406	2019-01-02 15:19:33.639406
44	LA	2	E	0.20		36	t	f	2018-12-20 17:55:25.414909	2019-01-02 15:20:22.164858
43	LA	2	S	0.10		36	t	f	2018-12-20 17:55:01.202329	2019-01-02 15:20:36.299627
33	LA	7	S	0.20		36	t	f	2018-12-19 12:03:38.563759	2019-01-02 15:22:13.694326
34	LA	7	E	0.10		36	t	f	2018-12-19 12:13:35.472992	2019-01-02 15:23:16.964004
42	PDHC	\N	E	100.00	hjfhjfjhfjhfjh	36	t	f	2018-12-20 13:20:08.807708	2019-01-07 22:37:23.181851
\.


--
-- Name: service_fee_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.service_fee_masters_id_seq', 49, true);


--
-- Data for Name: service_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.service_masters (id, title, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
3	Physiotherapy Services		\N	36	t	f	2017-11-07 10:49:55.7931	2018-01-25 15:49:10.52437
2	Eye Health Care		\N	36	t	f	2017-11-07 10:49:18.907214	2018-01-25 15:49:15.230846
1	Mental Health Care		\N	36	t	f	2017-11-03 09:05:53.089627	2018-01-25 15:49:25.971976
4	Dental Service		\N	36	t	f	2017-12-04 18:36:02.681764	2018-03-05 10:27:51.871417
5	Gynaecology		\N	83	t	f	2018-03-05 10:28:36.551817	2018-03-05 10:28:36.551817
7	Pharmacy		\N	36	t	f	2018-03-05 11:26:17.4669	2018-08-07 22:35:38.034073
8	Laboratory		\N	158	t	f	2018-08-08 10:03:30.924999	2018-08-08 10:04:42.859527
6	Enterprise Ghana		\N	158	t	f	2018-03-05 10:30:53.666423	2018-09-05 11:31:15.784485
9	Gh Health		\N	158	t	f	2018-09-05 11:47:55.697029	2018-09-05 11:47:55.697029
11	Gh	as	\N	145	t	f	2019-01-07 22:23:06.008985	2019-01-07 22:23:06.008985
10	Cv	h	\N	145	f	f	2019-01-07 22:22:31.718412	2019-01-07 22:23:33.281608
\.


--
-- Name: service_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.service_masters_id_seq', 11, true);


--
-- Data for Name: service_prov_extra_infos; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.service_prov_extra_infos (id, service_prov_id, suburb_id, contact_number1, contact_number2, postal_address, location_address, contact_person_name, web_url, longitude, latitude, comment, entity_id, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	1	1	0234569909									\N	\N	t	f	2017-11-02 17:26:55.399093	2017-11-02 17:26:55.399093
3	3	2	24887									\N	\N	t	f	2017-11-07 10:51:30.096036	2017-11-07 10:51:30.096036
4	4	1	7894									\N	\N	t	f	2017-11-07 10:52:08.052964	2017-11-07 10:52:08.052964
5	5	3	5469									\N	\N	t	f	2017-11-07 10:52:44.581463	2017-11-07 10:52:44.581463
6	6	2	47474747	46464646	akosombo	akososmbo		wwww.url.com				\N	\N	t	f	2017-12-04 18:39:29.889234	2017-12-04 18:39:29.889234
7	7	3	0205869587									\N	\N	t	f	2018-01-17 16:19:10.154051	2018-01-17 16:19:10.154051
8	8	1	030123456									\N	\N	t	f	2018-03-05 11:27:58.994498	2018-03-05 11:27:58.994498
9	9	3	0277457312									\N	\N	t	f	2018-05-05 22:06:16.715206	2018-05-05 22:06:16.715206
2	2	2	0245443322	030123456	p.o box 345	accra tema station	front desk	www.nyaho.com	56	70		\N	\N	t	f	2017-11-02 17:55:39.542178	2018-08-07 11:33:48.028121
10	10	2	0245678989									\N	\N	t	f	2018-09-05 11:34:40.039854	2018-09-05 11:34:40.039854
11	11	1	0246789089		P.O. Box 34 LG Legon-Accra							\N	\N	t	f	2018-09-10 12:09:41.093373	2018-09-10 12:09:41.093373
\.


--
-- Name: service_prov_extra_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.service_prov_extra_infos_id_seq', 11, true);


--
-- Data for Name: service_prov_types; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.service_prov_types (id, service_prov_type_title, comment, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
3	Herbal Centre		\N	\N	t	f	2017-11-07 10:50:44.247617	2017-11-11 21:13:56.563655
2	Clinic		\N	\N	t	f	2017-11-07 10:50:26.110801	2017-11-11 21:14:04.804177
1	Hospital		\N	\N	t	f	2017-11-02 12:57:22.279357	2017-11-11 21:14:11.86312
4	Cocoa Clinic		\N	\N	t	f	2017-11-21 18:03:44.559779	2017-11-21 18:03:44.559779
5	Pharmacy		\N	\N	t	f	2017-11-21 21:07:48.912613	2017-11-21 21:07:48.912613
8	Tertiary Hospital		\N	36	t	f	2017-12-04 18:37:25.602415	2018-01-25 16:17:08.338432
7	Maternity Home		\N	36	t	f	2017-11-21 21:09:06.495535	2018-01-25 16:17:15.467643
6	Diagnostic Centres		\N	36	t	f	2017-11-21 21:08:20.585147	2018-01-25 16:17:28.029945
9	Physio		\N	36	t	f	2018-01-17 16:17:41.996204	2018-03-05 10:50:58.933272
10	Hospital		\N	36	t	f	2018-05-05 22:05:00.311306	2018-08-07 21:57:52.87067
11	End Point Homeophatic Clinic		\N	158	t	f	2018-09-10 12:05:48.106946	2018-09-10 12:05:48.106946
\.


--
-- Name: service_prov_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.service_prov_types_id_seq', 11, true);


--
-- Data for Name: specialty_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.specialty_masters (id, title, alias, comment, user_id, entity_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Pathology					t	f	2017-11-29 10:35:21.263252	2017-11-29 11:22:08.763144
2	Cardiothoracic Surgery					t	f	2017-11-29 12:17:43.933474	2017-11-29 12:17:43.933474
3	Colon And Rectal Surgery					t	f	2017-11-29 12:18:19.93821	2017-11-29 12:18:19.93821
4	Cardiology					t	f	2018-03-05 15:32:18.991452	2018-03-05 15:32:54.869609
\.


--
-- Name: specialty_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.specialty_masters_id_seq', 4, true);


--
-- Data for Name: suburb_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.suburb_masters (id, suburb_name, comment, city_town_id, entity_id, user_id, active_status, change_status, created_at, updated_at) FROM stdin;
1	Madina		1	\N	83	t	\N	2018-03-05 11:22:15.72852	2018-03-05 11:22:15.72852
2	Accra Central		1	\N	36	t	\N	2018-03-05 12:37:23.59947	2018-03-05 12:37:23.59947
3	Oyarifa		1	\N	149	t	\N	2018-05-05 21:51:56.247561	2018-05-05 21:51:56.247561
5	Essikado		4	\N	158	t	\N	2018-08-07 14:42:58.203505	2018-08-07 14:42:58.203505
6	Poly		5	\N	36	t	\N	2018-08-16 09:40:35.285063	2018-08-16 09:40:35.285063
4	Ga Mantsi		1	\N	158	t	\N	2018-05-07 09:17:59.357937	2018-09-27 08:32:10.966954
\.


--
-- Name: suburb_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.suburb_masters_id_seq', 6, true);


--
-- Data for Name: user_services; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.user_services (id, service_desc, service_alias, comment, entity_id, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Personal Doctor			\N	9	t	f	2017-12-19 15:45:47.900185	2017-12-19 15:46:06.209912
2	Phone Consult			\N	9	t	f	2017-12-21 11:38:51.242527	2017-12-21 11:38:51.242527
4	Home Care			\N	9	t	f	2017-12-21 11:39:20.686946	2018-03-02 13:00:53.979693
3	Video Consult			\N	9	t	f	2017-12-21 11:39:05.353977	2018-03-02 13:01:09.996205
\.


--
-- Name: user_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.user_services_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, person_id, username, active_status, del_status, profile_file_name, profile_content_type, profile_file_size, profile_updated_at, role_id) FROM stdin;
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
123		$2a$11$9VZ1NcTHblo.LRzaUviBaOH6tM8fV1PRiGPHVebXUuXbArjNMft.O	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 09:57:17.534564	2018-04-27 09:57:17.534564	181	mena	t	f	\N	\N	\N	\N	5
124		$2a$11$FCUfY5TDmjhAaYzE2NvNReKvvx4.Ye8Z75X8y/w/NTa0Pwx8LcRRG	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 10:01:18.987711	2018-04-27 10:01:18.987711	182	mensa	t	f	\N	\N	\N	\N	5
125		$2a$11$Cp0XPxfjZ2/l0gL41kQl4.Xr1GW.asifKZB8ZvWfvXFZvRSyVuqiC	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 10:02:55.945332	2018-04-27 10:02:55.945332	183	mensah	t	f	\N	\N	\N	\N	5
126		$2a$11$8J0ILD6.Rx/VFnjkb5/ShuFiTdcPurNSLF555qqZsqVs1s3EhmOQG	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 10:03:50.330892	2018-04-27 10:03:50.330892	184	mensahs	t	f	\N	\N	\N	\N	5
127		$2a$11$MxsHTRMkjxlc8g6e7P/6GOkFe9fhdHD1/J7x6Pc5x2MPRTBoD6fCi	\N	\N	\N	1	2018-04-27 10:05:30.881878	2018-04-27 10:05:30.881878	41.189.179.124	41.189.179.124	2018-04-27 10:04:47.915507	2018-04-27 10:05:30.884105	185	mens	t	f	\N	\N	\N	\N	5
134		$2a$11$6vHDISBctXHShVCDmZhLt.9rPA5CCbp2MOwENQQ2yb8wy5RfWNJxC	\N	\N	\N	18	2018-06-07 14:48:53.983725	2018-06-07 12:42:46.158198	154.160.14.138	154.160.14.138	2018-04-30 11:07:57.644385	2018-06-07 14:48:53.985832	192	celest	t	f	\N	\N	\N	\N	3
86		$2a$11$CG9nxirE5XinrIsl.LpnteFgouA0cQQYMFXHhvr14NhgCmsluFfQO	\N	\N	\N	28	2018-06-26 11:21:12.417052	2018-06-26 11:18:58.201628	154.160.14.201	154.160.14.201	2018-04-12 13:02:17.102533	2018-06-26 11:21:12.419975	137	paddy	t	\N	\N	\N	\N	\N	8
131		$2a$11$qeaRxBv77WalyJmZf4Or4uyzTcbTGXSWw5Zf0B8EFjbXahEOJnovS	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 18:23:10.168376	2018-04-27 18:24:25.877967	189	davido	t	f	\N	\N	\N	\N	4
128		$2a$11$/wqLXtwG/pJ1XI0X1aR2N.iGBHL2aECQEKXxy0RSlVJNEHdBbUl4G	\N	\N	\N	1	2018-04-27 17:46:43.814429	2018-04-27 17:46:43.814429	41.189.179.124	41.189.179.124	2018-04-27 10:09:13.636003	2018-04-27 17:46:43.817504	186	stev	t	f	\N	\N	\N	\N	4
129		$2a$11$8GHab5LEQZTMHxpDO1EtJOxerTNsdoW.Ve4TvcKBu65ybyVWkwFjK	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 17:42:25.45598	2018-04-27 18:13:55.985232	187	tiery	t	f	\N	\N	\N	\N	4
130		$2a$11$RU205jD7ILTwUG1VW/JSreQjhpgBN6URr5j7gDrB.Csv9BM3r6AIW	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 18:15:57.064	2018-04-27 18:17:27.137012	188	mawunya	t	f	\N	\N	\N	\N	4
132		$2a$11$xAJU9EItjh0hXQEMXKmHauimZ0.ScgUZHsRpTV7lJwALUvlciX6wu	\N	\N	\N	0	\N	\N	\N	\N	2018-04-27 18:31:03.06122	2018-04-27 18:41:04.351506	190	matthew	t	f	\N	\N	\N	\N	4
89		$2a$11$2bi.2KQZM7JguIRFpgoyzegwTF.h3dsF1Wzj1FR2Nw5IjOJt3ghCy	\N	\N	\N	39	2018-11-14 17:30:17.983617	2018-09-18 10:20:22.754367	154.160.14.61	178.62.110.4	2018-04-13 11:21:53.246002	2018-11-14 17:30:17.988096	140	ago	t	\N	image11.jpg	image/jpeg	6181	2018-04-16 17:38:32.661708	4
136		$2a$11$HVqmPXjgs2/RP18e2p0KtuLo1GdacQAvkpde/p5HHMlnclQepdFMu	\N	\N	\N	3	2018-05-08 21:52:03.873546	2018-05-02 11:48:41.016479	41.66.255.172	41.189.179.106	2018-04-30 11:49:20.359862	2018-05-08 21:52:03.8754	194	yaaa	t	f	\N	\N	\N	\N	4
98		$2a$11$1Inn9p5aa9OgVIUUJHgGIezEj/QAHjrwpIOqR4SOCC8d0cPrvHXkq	\N	\N	\N	19	2018-06-20 09:43:03.061624	2018-05-10 09:44:23.601252	154.160.14.227	41.189.179.83	2018-04-19 09:57:47.271956	2018-06-20 09:43:03.063493	149	sweetness	t	\N	\N	\N	\N	\N	1
133		$2a$11$IgW.6TIVvAN4oPXzgF9/cOu7HCBKDP0WMK0XrIhKnUR4Ri19M/8TW	\N	\N	\N	1	2018-04-30 09:48:05.032575	2018-04-30 09:48:05.032575	41.189.179.101	41.189.179.101	2018-04-30 09:05:54.749035	2018-04-30 09:48:05.034826	191	joan	t	f	\N	\N	\N	\N	4
107		$2a$11$R.xsUQjbfpTaOQfc4WJti.c1jxbDdTT/YgblkuKRdpgo/7rg/wrSe	\N	\N	\N	156	2019-02-05 17:29:33.861998	2019-02-05 11:58:35.177788	154.160.14.79	154.160.14.79	2018-04-20 16:08:20.780149	2019-02-05 17:29:33.86417	158	claradoc	t	\N	\N	\N	\N	\N	1
84		$2a$11$jUlQXLw63k1qPHwwqe.yIuZVKSj5WLwr6wRDJONCHpfoW1NYbAB8.	\N	\N	\N	52	2018-07-22 21:45:41.243219	2018-07-20 09:58:54.702276	154.160.18.143	154.160.14.58	2018-04-12 12:09:33.291711	2018-07-22 21:45:41.253679	135	andy	t	\N	\N	\N	\N	\N	2
94		$2a$11$YVko5T3MQUYTn02T/fUzXO08zbrGtgxbsYMAMHDwoNKQuqB1/Hqty	\N	\N	\N	46	2019-01-26 10:20:50.902602	2019-01-11 12:07:11.556212	37.210.252.225	37.210.252.225	2018-04-18 22:21:38.194205	2019-01-26 10:20:50.904845	145	kobby	t	\N	\N	\N	\N	\N	1
135		$2a$11$d4GbkvDRUZLl3bbvC3MHvuBz88Vsm49z5trJ8fpoyfaGyImZLHA5e	\N	\N	\N	7	2018-05-02 12:54:27.223959	2018-05-02 12:31:42.429955	41.189.179.106	41.189.179.106	2018-04-30 11:44:33.20181	2018-05-02 12:54:27.225754	193	yaa	t	f	\N	\N	\N	\N	5
137		paddy1	\N	\N	\N	0	\N	\N	\N	\N	2018-05-02 20:51:13.229136	2018-05-02 20:51:13.229136	206	paddy1	f	f	\N	\N	\N	\N	3
138		paddy2	\N	\N	\N	0	\N	\N	\N	\N	2018-05-02 20:52:13.477871	2018-05-02 20:52:13.477871	207	paddy2	f	f	\N	\N	\N	\N	4
108		$2a$11$CY1rzKLdaDxeUlpYBCpUaeDoMe1LI1LHxbQILKMLcRYUxu27T7Bli	\N	\N	2018-05-04 15:41:30.241435	1	2018-05-04 15:41:30.244018	2018-05-04 15:41:30.244018	41.189.179.64	41.189.179.64	2018-04-21 05:08:01.105173	2018-05-04 15:41:30.245626	159	patmercy	t	\N	\N	\N	\N	\N	5
174		$2a$11$GzfeQ9B5wmSn8ZAw4FmO5.Ko/TYICw1zAvW73nWHjsAJ9sXhr0UYC	\N	\N	\N	0	\N	\N	\N	\N	2018-05-15 16:36:29.027342	2018-05-15 16:36:29.027342	244	minaa	f	f	\N	\N	\N	\N	3
171		$2a$10$LblTCy0g5nX71mFrcjASl..mD9c8rLm2COrWoUPp/NnweT7zlQ2d6	\N	\N	\N	0	\N	\N	\N	\N	2018-05-10 09:32:48.634666	2018-05-10 09:32:48.634666	240	jerry1	f	f	\N	\N	\N	\N	4
175		$2a$11$U1QzPiG2PrvIaTacZMzItesEvSORRq9kC2iiGfpmDkW3DbEYPbPqm	\N	\N	\N	0	\N	\N	\N	\N	2018-05-18 16:02:18.923133	2018-05-18 16:02:18.923133	245	johnson	f	f	\N	\N	\N	\N	3
186		$2a$11$Ca/IKWLPYyBMgjKU6.dBHO6cY3LQa2J3HZR4/kAgkUJyBx3rDhKfi	\N	\N	\N	4	2018-06-19 18:17:13.462179	2018-06-19 16:21:51.236992	37.211.176.249	154.160.14.199	2018-06-19 15:47:54.661563	2018-06-19 21:05:04.21689	256	jonijoni	t	f	\N	\N	\N	\N	5
180		$2a$10$jdvwH71G1pKNre9l2WAWKu61/2Bx90txJMRsCH.D.Q0WxHIBxHjDa	\N	\N	\N	0	\N	\N	\N	\N	2018-06-14 12:55:04.144677	2018-06-14 12:55:04.144677	250	dee	t	f	\N	\N	\N	\N	5
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
152		$2a$10$nL647V5rx2.biZwBSsu6Z.rs.1QZybAWuA.o2tQni5EjLSu5HFpUa	\N	\N	\N	1	2018-05-04 23:49:08.262414	2018-05-04 23:49:08.262414	41.66.255.75	41.66.255.75	2018-05-04 21:48:10.19761	2018-05-04 23:49:08.264481	221	paddydocc	t	f	\N	\N	\N	\N	4
166		$2a$10$/sUdVv4LLncAiXPN5DjBU.uA3J1tdk4TmsLGfVdooy6yHOX9kXzIu	\N	\N	\N	0	\N	\N	\N	\N	2018-05-09 09:33:38.006934	2018-05-09 09:33:38.006934	235	clementine1	f	f	\N	\N	\N	\N	4
172		$2a$11$ZQDa33K.7WcheMICPvPcsOg.a1tfrjgs4J20NwmLMi2U.E4nzjqAG	\N	\N	\N	0	\N	\N	\N	\N	2018-05-10 15:16:44.855244	2018-05-10 15:16:44.855244	242	andrew	f	f	\N	\N	\N	\N	4
167		$2a$10$RmfW8O5icxzi3UgPVuQRju2AnRtgAuiSjrVbfTahDScDFr7ivYP5i	\N	\N	\N	0	\N	\N	\N	\N	2018-05-09 09:36:54.794767	2018-05-09 09:36:54.794767	236	clementine2	f	f	\N	\N	\N	\N	4
154		$2a$11$AitgeFzOKCryNofS4/hZe.wrFue8SxZuRgS3zr1KSyZmqUko92coe	\N	\N	\N	1	2018-05-05 12:24:57.617177	2018-05-05 12:24:57.617177	41.189.179.79	41.189.179.79	2018-05-05 12:22:14.945937	2018-05-05 12:24:57.619006	223	zealous	t	f	\N	\N	\N	\N	3
155		$2a$10$.mO1ajPJSRe9.UzdwsgQn.8sxezEY/a4oYiLZYfGYAKt0e8lk8056	\N	\N	\N	0	\N	\N	\N	\N	2018-05-05 13:34:27.385494	2018-05-05 13:34:27.385494	224	paddydocd	f	f	\N	\N	\N	\N	4
156		$2a$10$SBWvtyYohKLBo9GKK00mF.NLbneSXNgNaIZyCbqSdrdpRGKmPqTsu	\N	\N	\N	0	\N	\N	\N	\N	2018-05-05 13:50:48.245559	2018-05-05 13:50:48.245559	225	paddydoca	f	f	\N	\N	\N	\N	4
157		$2a$10$UUNuassytJwReWpbYPZzc.7v4LHUWXAQd3U1MJ4KbfOm6njBfWc7i	\N	\N	\N	0	\N	\N	\N	\N	2018-05-05 13:56:30.91326	2018-05-05 13:56:30.91326	226	clementina	f	f	\N	\N	\N	\N	4
158		$2a$10$aRR/J8V0IwFzkWlFuwZKbeV28YDVCUAiCiAQgcxfUsx12X/ePmdhO	\N	\N	\N	0	\N	\N	\N	\N	2018-05-05 14:03:18.384266	2018-05-05 14:03:18.384266	227	clementino	f	f	\N	\N	\N	\N	4
183		$2a$10$8lJprZqCdTQuNzYx/uLe5.kHbpQe86ws0vICRrlTpL649g9m3ubFy	\N	\N	\N	0	\N	\N	\N	\N	2018-06-15 12:23:26.940439	2018-06-15 12:23:26.940439	253	freda	f	f	\N	\N	\N	\N	4
169		$2a$10$UONghGLENphY8H90GKgP8eOLInkVMa3HSlrs9212xhhhxrDEIAXne	\N	\N	2018-05-10 15:49:05.681398	1	2018-05-10 15:49:05.684109	2018-05-10 15:49:05.684109	37.211.248.153	37.211.248.153	2018-05-10 00:54:48.913916	2018-05-10 15:49:05.685688	238	drpaddy	t	f	\N	\N	\N	\N	4
168		$2a$10$W1vdwTTsy9HcJ8x/XGWogeeoPea2Gk6W8OwkA5jpjSB6cLBeEr7zK	\N	\N	\N	0	\N	\N	\N	\N	2018-05-09 15:24:11.579775	2018-05-09 15:24:11.579775	237	kay	t	f	\N	\N	\N	\N	5
170		$2a$10$9gO0dTOb0W2FIxnYjwAlJOYSfo5HHvRp0P8g4HoTX.f1iyJAZ./3O	\N	\N	\N	0	\N	\N	\N	\N	2018-05-10 01:37:13.303315	2018-05-10 01:37:13.303315	239	patpaddy	t	f	\N	\N	\N	\N	5
153		$2a$11$FWTxFcNCzde347lGdAjxWOhLcJtVAtADit9Mw8fS0UNwC93Rfwe4q	\N	\N	\N	2	2018-06-07 12:41:18.949499	2018-05-05 12:20:35.345078	154.160.14.138	41.189.179.79	2018-05-05 12:01:30.705483	2018-06-07 12:41:18.953296	222	zeal	t	f	\N	\N	\N	\N	4
184		$2a$10$EZv7mO4eK1AjmwdyMsW.jOgW4EDnzj/eSdkBa9RRR0f6ozm8OOUwK	\N	\N	\N	0	\N	\N	\N	\N	2018-06-15 12:36:11.489583	2018-06-15 12:36:11.489583	254	samson	t	f	\N	\N	\N	\N	5
159		$2a$10$nn4Y0zapThqRZsQF9.VvI.mVgV7u5tiW4L4KrEKEX.m23m1ZytwD6	\N	\N	\N	4	2018-05-11 17:26:09.097153	2018-05-11 16:49:06.333632	41.189.179.85	41.189.179.85	2018-05-05 14:13:00.073626	2018-05-11 17:26:09.100021	228	clementine	t	f	\N	\N	\N	\N	4
173		$2a$11$OMw6dHqSTcXQ8wjbEQETd.6qMkhKZUfi2LGE5uCXNK.cQCdLH3tT2	\N	\N	\N	0	\N	\N	\N	\N	2018-05-15 13:00:48.036308	2018-05-15 13:00:48.036308	243	mina	f	f	\N	\N	\N	\N	3
179		$2a$11$D7zksntSj6WjN7JptG2c/e1SP/N6Go5NrrXtmbj/SHK385RuBVS5y	\N	\N	\N	1	2018-06-14 06:48:11.578268	2018-06-14 06:48:11.578268	41.66.255.84	41.66.255.84	2018-06-13 21:39:22.307268	2018-06-14 06:48:11.580085	249	pnurse	t	f	\N	\N	\N	\N	3
182		$2a$10$q5n/RvD6MhD.aeNqnvPamO5HTBrVNKYMsxDoElqr368uF1cTQB0qS	\N	\N	\N	0	\N	\N	\N	\N	2018-06-15 10:04:27.095805	2018-06-15 10:10:11.744864	252	cdoctor	t	f	\N	\N	\N	\N	4
185		$2a$10$kJSw3DtM4MxMAwqxEXrj4ueO6cad4anOMKx0Nx6pVTvLvfjS0nOXy	\N	\N	\N	0	\N	\N	\N	\N	2018-06-18 16:43:15.698712	2018-06-18 16:43:15.698712	255	silas	f	f	\N	\N	\N	\N	4
178		$2a$11$2990lfnaydRtjXWgR.5r3u26rKyGpLp2lNjQSr3fw.giZLY6IUE86	\N	\N	\N	39	2018-08-13 09:37:33.211518	2018-08-09 17:35:07.038956	154.160.14.178	154.160.14.42	2018-06-07 10:26:50.368232	2018-08-13 09:37:33.213517	248	senior	t	f	\N	\N	\N	\N	4
88		$2a$11$KoQwoiHgsfCe3MPoCbtvkeGfEhLtEwN5v0PEEW5AEVTAsGEMsKsuG	\N	\N	\N	49	2018-09-18 10:21:09.996901	2018-08-17 12:56:11.096413	178.62.110.4	154.160.14.187	2018-04-12 13:25:40.535758	2018-09-18 10:21:10.000144	139	davi	t	\N	\N	\N	\N	\N	5
187		$2a$11$CI4L6Ds/9ZktZClfhtTsTeJxwEY35PaWAdLb6A5nsDg6D1Zv7g6tW	\N	\N	\N	6	2018-11-24 14:15:22.655458	2018-10-06 17:16:12.084316	41.215.171.4	41.66.202.88	2018-06-20 10:23:50.934507	2018-11-24 14:15:22.657479	257	nyants	t	f	\N	\N	\N	\N	5
181		$2a$10$1BDzZipbjY3HyAnPm9tIM.eeGzuBIvWjIa3u8VRJnRMdJLWSpSk6a	\N	\N	\N	1	2018-06-26 11:29:35.478221	2018-06-26 11:29:35.478221	154.160.14.201	154.160.14.201	2018-06-15 10:02:05.694242	2018-06-26 11:29:35.480113	251	cpatient	t	f	\N	\N	\N	\N	5
177		$2a$10$BMmw3TsrqBfL0PO3EX6UUe8KGMbg8WcN/8VDQbgOK2jUAvEuWtX4i	\N	\N	\N	5	2018-08-13 15:47:31.146172	2018-08-09 09:13:18.898181	154.160.14.30	154.160.14.42	2018-06-06 11:12:20.011054	2018-08-13 15:47:31.148355	247	paddy4	t	f	\N	\N	\N	\N	5
165		$2a$10$J1xaBsOZ5Dgepw8bzvMY2eYXqN8CGnFcFoNvHllPPXAml4CZMCbXW	\N	\N	\N	1	2018-09-07 17:08:00.083821	2018-09-07 17:08:00.083821	154.160.14.81	154.160.14.81	2018-05-09 09:26:58.31948	2018-09-07 17:08:00.087658	234	paddy123	t	f	\N	\N	\N	\N	5
189		$2a$11$7YEuQRPLuOo0WJElm2FdBeuyzwBL8EsBDcoYJ1cpLr5zailLsQUIq	\N	\N	\N	1	2018-06-21 13:27:06.457411	2018-06-21 13:27:06.457411	37.211.176.249	37.211.176.249	2018-06-20 10:33:04.784029	2018-06-21 13:27:06.461989	259	rebecca	t	f	\N	\N	\N	\N	3
211		$2a$10$2632hx/T9SK5c6cgYbPrn.GoX0Dgni/CbwKFGUOguLbzKHmfdL0lC	\N	\N	\N	0	\N	\N	\N	\N	2018-08-16 08:40:16.855382	2018-08-16 08:40:16.855382	282	thursday	t	f	\N	\N	\N	\N	5
212		$2a$10$uu.G7cmijkzWLfBISRrtWOD7DdquyjgRCvXyUeVZn.r8USiXCBqI.	\N	\N	\N	0	\N	\N	\N	\N	2018-08-16 09:38:56.130646	2018-08-16 09:38:56.130646	283	friday	t	f	\N	\N	\N	\N	5
190		$2a$10$vhyzqY84oNodxhIKxZCjT.nE2HQFHrP6Yiw8Thuw063FHl3OFmU1m	\N	\N	\N	0	\N	\N	\N	\N	2018-06-21 15:33:07.698084	2018-06-21 15:33:07.698084	260	kenedy	t	f	\N	\N	\N	\N	5
191		$2a$10$Ol599tzoEvWbGU5DaAKJdOA1GW/rPmIIEgmLpzNAZ7h5C/JRaIJ0u	\N	\N	\N	0	\N	\N	\N	\N	2018-06-22 10:39:55.194936	2018-06-22 10:39:55.194936	261	sam	t	f	\N	\N	\N	\N	5
192		$2a$10$HMsHYar0ZZUG6VT7oLMlo.z9NmxKQb9yU9O8d.nQGQx3nHAD9uq/S	\N	\N	\N	0	\N	\N	\N	\N	2018-07-23 10:50:38.596299	2018-07-23 10:50:38.596299	262	cpatient1	t	f	\N	\N	\N	\N	5
193		$2a$10$tgIEq7SRX.er0bUdHt4j7.neympzgCuk0nRau6ewkuiIBRgpWxMFO	\N	\N	\N	0	\N	\N	\N	\N	2018-07-23 15:21:55.940969	2018-07-23 15:21:55.940969	263	deeshaft	f	f	\N	\N	\N	\N	4
213		$2a$10$1Gz4bVJGTTKX.B03WLBmgut.RxYtjpaD81gyZ9Mxxsfay8twcyclq	\N	\N	\N	0	\N	\N	\N	\N	2018-08-16 10:14:23.657358	2018-08-16 10:14:23.657358	284	sat	t	f	\N	\N	\N	\N	5
197		$2a$10$WjIFocVlrka.hWclBQzKOeVQH1MV1XADHpQJlgC.nrouf5JIazpLe	\N	\N	\N	1	2018-08-07 11:20:30.723474	2018-08-07 11:20:30.723474	154.160.14.133	154.160.14.133	2018-08-06 14:42:44.515387	2018-08-07 11:20:30.725884	267	paddypatient	t	f	\N	\N	\N	\N	5
232		$2a$10$9urS2NyrcIwZlnxSvMR7v.AiEHjbMc4o5VfTLeeHyHEemZfuWEExS	\N	\N	\N	0	\N	\N	\N	\N	2018-09-10 12:55:47.177843	2018-09-10 13:02:08.936023	303	madydoctor	t	f	\N	\N	\N	\N	4
196		$2a$11$eLZP02iZlQBQHcKbwLU1HeJBt89hbVbn.6ZXCNyx7e0q0Cq3tSJLm	\N	\N	\N	0	\N	\N	\N	\N	2018-07-23 17:46:32.996779	2018-08-07 17:13:04.141311	266	assurance	t	f	\N	\N	\N	\N	4
198		$2a$11$rmR71iAsk.W9OhiBNMOsfeN6z8X5YIYZ9RA/YVDl2BIgBk2cpwsOm	\N	\N	\N	1	2018-08-07 22:58:58.096451	2018-08-07 22:58:58.096451	41.204.44.25	41.204.44.25	2018-08-07 22:58:39.329115	2018-08-07 22:58:58.098496	268	duga	t	f	\N	\N	\N	\N	5
227		$2a$10$OaUAI13JDUl.zWZpxqKqH.mTXW24nWuGKi627S6cppNJqwhV3Cwwi	\N	\N	\N	0	\N	\N	\N	\N	2018-08-26 13:12:20.580839	2018-08-27 10:43:33.348257	298	paddydoc4	t	f	\N	\N	\N	\N	4
199		$2a$10$blkE5E5g0GKOuQnZ.Es0veCiAzhG0pPCYEJxk2NoN42B/BF02ShHW	\N	\N	\N	0	\N	\N	\N	\N	2018-08-08 10:43:37.284997	2018-08-08 10:43:37.284997	269	anka	t	f	\N	\N	\N	\N	5
200		$2a$10$Vv/SVpfOpaYV.JcBsLT7Fe.LJ1EWGq9WURtwtE3bclPNsVvvpT10m	\N	\N	\N	0	\N	\N	\N	\N	2018-08-08 10:47:34.923191	2018-08-08 10:47:34.923191	270	nipa	t	f	\N	\N	\N	\N	5
201		$2a$10$AkAvql5HhyyuGebCXv4kIuJdJ82gjnVK2jB/37IN0IStmuXpG9xVe	\N	\N	\N	0	\N	\N	\N	\N	2018-08-08 12:27:28.67415	2018-08-08 12:27:28.67415	271	paddy6	t	f	\N	\N	\N	\N	5
202		$2a$10$BXirNazw1ZjDoelkrGeoIeN0E9dWEjGuS8zIv9tELUxFN5kjRox22	\N	\N	\N	0	\N	\N	\N	\N	2018-08-08 14:40:47.293379	2018-08-08 14:40:47.293379	272	jerry2	t	f	\N	\N	\N	\N	5
203		$2a$11$B/Y7304J2fMlaWU5ghvLRe40.mw2g0krFBE956HDn918F/XWp0TmC	\N	\N	\N	0	\N	\N	\N	\N	2018-08-09 12:19:36.392242	2018-08-09 12:19:36.392242	274	mirabel	f	f	\N	\N	\N	\N	3
205		$2a$10$ZYGtFWXbTTtUCLEaejEVMOLwfHmW9rzhpSnqvtxQ5zxddJKQfjWRK	\N	\N	\N	0	\N	\N	\N	\N	2018-08-09 12:42:31.154842	2018-08-09 12:42:31.154842	276	samuelapp	t	f	\N	\N	\N	\N	5
216		$2a$10$rWPxJaD2GGXFRt/9zPychON.nuXAhCTRaI4bvS1sAFxM1BUjOv6FC	\N	\N	\N	0	\N	\N	\N	\N	2018-08-17 15:39:08.866201	2018-08-17 15:39:08.866201	287	yourname	t	f	\N	\N	\N	\N	5
215		$2a$10$buyge3inzX5DtSqe2kTejuLB2FyKUQO6sEYH2RPODB93GLbtorVRK	\N	\N	\N	2	2018-08-17 15:52:57.609094	2018-08-17 12:37:06.412222	154.160.14.187	154.160.14.187	2018-08-17 12:21:01.775937	2018-08-17 15:52:57.611522	286	paddy7	t	f	\N	\N	\N	\N	5
228		$2a$10$aaBa./5/F47ouUseQ4h7wuyCf4ff.l29K0nhU3MA7wDYFIoeOZLoi	\N	\N	\N	0	\N	\N	\N	\N	2018-09-04 11:23:03.640536	2018-09-04 11:27:51.301737	299	claradoctor2	t	f	\N	\N	\N	\N	4
214		$2a$10$Rg2gDTvMNYZu0wEAJIj0Z.GybEhQ/i1ibKu3cf2wfDnY0atcI1qT6	\N	\N	\N	1	2018-08-17 17:06:58.300473	2018-08-17 17:06:58.300473	154.160.14.187	154.160.14.187	2018-08-17 11:57:34.82492	2018-08-17 17:06:58.302433	285	myname	t	f	\N	\N	\N	\N	4
206		$2a$11$Ux21E55MulJGBXUQUxsIpeGe//sD9.xXgyBIWo6774LM2UMhguAi6	\N	\N	\N	1	2018-08-10 10:24:39.644779	2018-08-10 10:24:39.644779	154.160.14.159	154.160.14.159	2018-08-10 10:24:25.323985	2018-08-10 10:24:39.646809	277	new	t	f	\N	\N	\N	\N	5
217		$2a$10$wvoCKC.UxIG4U144KA/BMusUI2Xqb5lXMsFMbBg9IEd/GmuFPuY7G	\N	\N	\N	0	\N	\N	\N	\N	2018-08-17 18:15:21.16995	2018-08-17 18:15:21.16995	288	newdoc	f	f	\N	\N	\N	\N	4
207		$2a$10$L.F0.riHNy1BEJAGL5Oy8ua4BKR0kgdQg0feLTZ8HEVoLXSatv2ba	\N	\N	\N	0	\N	\N	\N	\N	2018-08-13 14:05:18.068312	2018-08-13 14:05:18.068312	278	sophidom	t	f	\N	\N	\N	\N	5
194		$2a$10$uhLgxNSI6bQqIP92VqM1X..iq7NKcdfdP4s4pwpBUG1XCC72IMMFm	\N	\N	\N	6	2018-08-13 14:19:36.955326	2018-08-13 10:00:53.507974	154.160.14.30	154.160.14.178	2018-07-23 17:00:01.854522	2018-08-13 14:19:36.964583	264	senior1	t	f	\N	\N	\N	\N	4
208		$2a$10$tmJ0ZjFvj1B2tzVEeLcvzOPwibI0Ee5nC6T6/NDHL3EzcNjR.UqVq	\N	\N	\N	1	2018-08-13 16:05:33.691916	2018-08-13 16:05:33.691916	154.160.14.30	154.160.14.30	2018-08-13 14:53:25.648789	2018-08-13 16:05:33.694858	279	kusmeister	t	f	\N	\N	\N	\N	4
210		$2a$11$H1fUeZHsQkLGeRPq9oZnHuJBQjYzvaN7cZWuq.0nZau.1qHpY..2i	\N	\N	\N	1	2018-08-13 16:31:06.682213	2018-08-13 16:31:06.682213	154.160.14.30	154.160.14.30	2018-08-13 16:30:52.920605	2018-08-13 16:31:06.684389	281	free	t	f	\N	\N	\N	\N	5
219		$2a$10$AbZiVUErdDV7MAkaW4TKPednbAMkPispi.vLJqu1dF71phihC6NVm	\N	\N	\N	0	\N	\N	\N	\N	2018-08-20 15:44:01.520498	2018-08-20 15:44:01.520498	290	sarah	t	f	\N	\N	\N	\N	5
223		$2a$10$7MYNoeGfT4RvZ9kzNsC6fufU0fTHbN.G1w80wjQDt1Zi9qOAAnAve	\N	\N	\N	0	\N	\N	\N	\N	2018-08-20 16:50:00.176301	2018-08-20 16:50:00.176301	294	nana	f	f	\N	\N	\N	\N	4
224		$2a$10$rESMv4EoU3UxZBxTG0ui4e90U/jUWXwyvwyskadUnraGVCidwOFDi	\N	\N	\N	0	\N	\N	\N	\N	2018-08-20 16:56:09.186834	2018-08-20 16:56:09.186834	295	claradoctor1	f	f	\N	\N	\N	\N	4
222		$2a$10$Og1ifjcUXAammu.21p3XwejwAdj6wVIke3xVSrJ7Lu0vNw3UrB7T6	\N	\N	\N	0	\N	\N	\N	\N	2018-08-20 16:20:17.372933	2018-08-20 16:58:25.625099	293	drnana	t	f	\N	\N	\N	\N	4
188		$2a$11$DNc9SfTaN0M/lzeq2X8W3uLcHeAr82RsEy.27A1P2zTVoTQyBbGxi	\N	\N	\N	7	2018-11-24 14:02:54.56694	2018-10-06 17:41:12.395225	41.215.171.4	41.66.202.88	2018-06-20 10:27:57.481673	2018-11-24 14:02:54.578609	258	dranas	t	f	\N	\N	\N	\N	4
204		$2a$11$XQKVr9LVImZVTkJXDHcrDuNx4ZxDprcdGY7JzzhyanTKuYo.nTyQ6	\N	\N	\N	2	2018-08-24 14:52:50.960646	2018-08-09 16:49:25.331951	154.160.14.89	154.160.14.42	2018-08-09 12:33:41.19354	2018-08-24 14:52:50.96293	275	claranurse	t	f	\N	\N	\N	\N	3
225		$2a$10$mq1MBrSGXbEp9IrjsVBnA.W6PZHp10rCE/vnnJcPXwh2mAG3AUFwO	\N	\N	\N	0	\N	\N	\N	\N	2018-08-26 12:06:56.291017	2018-08-26 12:06:56.291017	296	paddydoc2	f	f	\N	\N	\N	\N	4
226		$2a$10$I8wP9QVpy7A1Yq1jFmv7He1/UQEO7Kmy47zM/8ljKHpZUEWwGwsY.	\N	\N	\N	0	\N	\N	\N	\N	2018-08-26 12:23:18.158735	2018-08-26 12:23:18.158735	297	paddydoc3	f	f	\N	\N	\N	\N	4
209		$2a$11$imoI1lYu0PWHyKN1VDcBs.iYqBrDyirhhj4QV6GcmGXqR.TbE01D2	\N	\N	\N	0	\N	\N	\N	\N	2018-08-13 15:20:07.694509	2018-09-04 11:31:05.404459	280	clems	t	f	\N	\N	\N	\N	4
221		$2a$10$ZbSdpKw7neNSYuMByUu/5uL2aGSqq6v9nCbYG80BPgRI36N2mgW4.	\N	\N	\N	0	\N	\N	\N	\N	2018-08-20 16:19:55.250198	2018-09-04 13:15:48.193699	292	paddoc	t	f	\N	\N	\N	\N	4
229		$2a$10$PTC8IRKL31bpbw0rJxAcW.sEQtC7JKa3pSwGSeFWd/2Q7CC2kBefO	\N	\N	\N	0	\N	\N	\N	\N	2018-09-05 15:20:11.584576	2018-09-05 15:20:11.584576	300	greg	t	f	\N	\N	\N	\N	5
230		$2a$10$nNLY1NTlGLSV4nzznEFl.epA1X.8bCGDF351vHgG8NOKr9KNcNY.G	\N	\N	\N	0	\N	\N	\N	\N	2018-09-06 10:25:43.613927	2018-09-06 10:34:29.196081	301	jojo	t	f	\N	\N	\N	\N	4
195		$2a$11$2990lfnaydRtjXWgR.5r3u26rKyGpLp2lNjQSr3fw.giZLY6IUE86	\N	\N	\N	1	2018-09-07 10:55:26.293668	2018-09-07 10:55:26.293668	154.160.14.81	154.160.14.81	2018-07-23 17:28:12.285263	2018-09-07 10:55:26.304515	265	monday	t	\N	\N	\N	\N	\N	4
231		$2a$10$KWit1n269mXCn2AYBWO7leLCsZDJjrIA9OLZFPBrZf9H7mcEn5JZC	\N	\N	\N	0	\N	\N	\N	\N	2018-09-07 16:10:01.632537	2018-09-07 16:10:01.632537	302	andymistic	t	f	\N	\N	\N	\N	5
233		$2a$10$RSZoPU5e5eKnQyg7.PZQbOjn6CdN57QhN5qw8O3bjk30WlKTlWsuO	\N	\N	\N	0	\N	\N	\N	\N	2018-09-10 13:08:58.491019	2018-09-10 13:08:58.491019	304	madypatient	t	f	\N	\N	\N	\N	5
234		$2a$10$T8yLQavVUrEzwBlGI8byJeUfWwuYDp6bgRrHbaLMUQ7/md4BwVA6.	\N	\N	\N	0	\N	\N	\N	\N	2018-09-11 09:16:47.841803	2018-09-11 09:16:47.841803	305	akua	f	f	\N	\N	\N	\N	3
235		$2a$10$9e8JvHKL20880epXp.tX9ueZ/QhFBx/EQ0yNsw4LE3QQtg/negXMa	\N	\N	\N	0	\N	\N	\N	\N	2018-09-11 10:04:44.966483	2018-09-11 10:04:44.966483	306	aku	t	f	\N	\N	\N	\N	5
236		$2a$10$rpKZu6A7jikKDRZM32YP5eLXxp1QBYBW28aYxKAFYmofu0pONc9Wa	\N	\N	\N	0	\N	\N	\N	\N	2018-09-13 11:39:31.780082	2018-09-13 11:39:31.780082	307	padpatient	t	f	\N	\N	\N	\N	5
237		$2a$10$bRl.p.i7OLLkDbrPz/ihE.XPnoD0W/W9czGpeKt7fEt5fAPQwDNoK	\N	\N	\N	0	\N	\N	\N	\N	2018-09-13 11:43:33.084683	2018-09-13 11:46:19.316412	308	paddoctor	t	f	\N	\N	\N	\N	4
218		$2a$10$2FxJifuwtG67DaJq2Aj7puBI8dV2D8cCgyQ/xYmDOC4MseJx/oCTu	\N	\N	\N	1	2018-09-17 14:51:08.698442	2018-09-17 14:51:08.698442	154.160.14.60	154.160.14.60	2018-08-20 15:06:02.096272	2018-09-17 14:51:08.70174	289	clarapatient	t	f	\N	\N	\N	\N	5
238		$2a$11$l5VSWVOX7VXcLXAqFllWieeyqG/guC7r7.8j1Yub4IDY96UEiXIN6	\N	\N	\N	1	2018-09-13 18:29:12.616005	2018-09-13 18:29:12.616005	154.160.14.135	154.160.14.135	2018-09-13 18:28:56.983498	2018-09-13 18:29:12.617856	309	padpatientt	t	f	\N	\N	\N	\N	5
239		$2a$11$bUmI8h87j4itovV.fZyaW.BpbXb1lyiOyx1rkrP6XMARL0t10MoGG	\N	\N	\N	0	\N	\N	\N	\N	2018-09-13 18:32:32.042703	2018-09-13 18:34:11.455434	310	paddocc	t	f	\N	\N	\N	\N	4
240		$2a$11$V0qujkYTFXGmW1p9iqE.Y.szldpfGYckEMJ1HyMdlYOdWqAZ4he5y	\N	\N	\N	0	\N	\N	\N	\N	2018-09-14 09:35:13.203221	2018-09-14 09:40:07.744444	311	leave	t	f	\N	\N	\N	\N	4
241		$2a$10$FZbRAXBc4dz0TOwOHPX9DeKiwXPjwATNqA64CZqKU7jQq4lHiA1q6	\N	\N	\N	0	\N	\N	\N	\N	2018-09-14 11:16:33.032981	2018-09-14 11:20:48.670462	315	paddoctor1	t	f	\N	\N	\N	\N	4
242		$2a$10$F6XdDOWLfErdxghnFb8kW.0Ojw8x6nCirqhYhIRxQVtx076GX0X62	\N	\N	\N	0	\N	\N	\N	\N	2018-09-14 11:22:04.019366	2018-09-14 11:24:11.055926	316	paddoctor2	t	f	\N	\N	\N	\N	4
243		$2a$10$yPGqoDZBhHxDDTnRoYL36.49QAtaEf2.a3Vti5AaZYQTbGHrt615O	\N	\N	\N	0	\N	\N	\N	\N	2018-09-15 18:14:55.490699	2018-09-15 18:14:55.490699	317	madypatient1	t	f	\N	\N	\N	\N	5
244		$2a$10$yriGAs08/2M4/QtmZ.T6Ne0oa29zFk3qXyjARlnVcFkt2U5XweZwW	\N	\N	\N	0	\N	\N	\N	\N	2018-09-15 18:16:24.303907	2018-09-15 18:44:04.95082	318	madydoctor1	t	f	\N	\N	\N	\N	4
245		$2a$10$.uiXKrr93.RMAvJRDa5muOLI43Y5vOw1YqhZnoPtGirWT1BOHbeI.	\N	\N	\N	0	\N	\N	\N	\N	2018-09-17 10:26:47.775385	2018-09-17 11:06:02.763951	319	mypaddy	t	f	\N	\N	\N	\N	4
246		$2a$10$Z/uOoDw.GBsc4oKa/FrmL.ar/.WTVE90tF6NtLzFHP7v6SN5IG42W	\N	\N	\N	0	\N	\N	\N	\N	2018-09-17 12:10:58.300148	2018-09-17 12:15:07.965334	320	youpaddy	t	f	\N	\N	\N	\N	4
247		$2a$10$XXFaoDNFv3T737miFzwJP.RKZFT7xyeNrmiJc7GTymGmSMtoErDvS	\N	\N	\N	0	\N	\N	\N	\N	2018-09-17 12:22:24.825742	2018-09-17 12:22:24.825742	321	youpatient	t	f	\N	\N	\N	\N	5
220		$2a$10$pOnlG4aOjcN6vaWuzcjboeAkufwmAfupIA/SQv.TDQSn23.HVCKaW	\N	\N	\N	1	2018-09-17 15:52:16.140959	2018-09-17 15:52:16.140959	154.160.14.60	154.160.14.60	2018-08-20 15:56:44.85795	2018-09-17 15:52:16.145301	291	claradoctor	t	f	\N	\N	\N	\N	4
249		$2a$10$O6J9KOk.31vE9FdmJ7N2Bus75BvCaxwg2Uw2lcErKSAuSq84MUMDq	\N	\N	\N	0	\N	\N	\N	\N	2018-09-17 17:48:21.087985	2018-09-17 18:07:27.21993	323	naamaame	t	f	\N	\N	\N	\N	4
250		$2a$10$5RT3YMSEb781joUAEcsi8e.U0ney3pvZ7uckOFRk0DiT0oMHaH3gS	\N	\N	\N	0	\N	\N	\N	\N	2018-09-18 18:49:52.163094	2018-09-18 18:49:52.163094	324	youyo	t	f	\N	\N	\N	\N	5
251		$2a$10$ZaZDTSHj2YV5qlqysVkmMOcWeoCr7UesHuN8qkN2GPnCDCZ8yloSy	\N	\N	\N	0	\N	\N	\N	\N	2018-09-18 19:33:24.870732	2018-09-18 19:33:24.870732	325	adoma	t	f	\N	\N	\N	\N	5
248		$2a$10$vPzJfpRPpU8XVjsMYluIu.wdKwgJqW7xGSjnl8FXdCPWXhRNw14gi	\N	\N	\N	4	2019-01-28 15:19:27.7357	2019-01-28 13:04:29.308709	154.160.14.161	154.160.14.139	2018-09-17 17:44:51.982067	2019-01-28 15:19:27.737878	322	maamenaa	t	f	\N	\N	\N	\N	5
253		$2a$10$lKQSbZYMui.C.CUrAf8wy.wW.6HXWOjxlMo3kFwvLVj8DtOS7/e/2	\N	\N	\N	0	\N	\N	\N	\N	2018-11-30 13:10:10.653875	2018-11-30 13:10:10.653875	327	elorm	t	f	\N	\N	\N	\N	5
254		$2a$10$XsO6ILbo2P9lk6Z12hCnM.jv2e6l1KAcicd6JLUF3WfrCclAIw6my	\N	\N	\N	0	\N	\N	\N	\N	2018-11-30 18:40:48.373675	2018-11-30 18:40:48.373675	328	naa122	t	f	\N	\N	\N	\N	5
255		$2a$10$mRzGox.wPw1JIpu40A1I1e4elNh7nifm3l/Yw61tqcpktGmDpl20S	\N	\N	\N	0	\N	\N	\N	\N	2018-12-01 06:26:20.046525	2018-12-01 06:26:20.046525	329	caleb	t	f	\N	\N	\N	\N	5
256		$2a$10$exGkFK/kwXE5Fm4yuAEUmO17AxmIhjCfjNtfqd.e/h3Ohnpu0hsoG	\N	\N	\N	0	\N	\N	\N	\N	2018-12-13 10:54:33.353788	2018-12-13 10:54:33.353788	330	kofi	t	f	\N	\N	\N	\N	5
272		$2a$10$hgwp1xEZyg5C/wxIVQLmo.2DWR1zu60PAy/WqY7twfYLYSlATcXk.	\N	\N	\N	0	\N	\N	\N	\N	2019-01-15 10:27:19.783051	2019-01-15 10:27:19.783051	350	nnurse1	f	f	\N	\N	\N	\N	3
161		$2a$10$8t/4hEMx0vVpga9o0SUsa.31LWg8AltBxsBUVLDsraS2SxC0d0KLe	\N	\N	\N	13	2018-12-13 14:40:19.761004	2018-12-13 14:28:04.933844	154.160.14.24	154.160.14.24	2018-05-05 21:26:36.589382	2018-12-13 14:40:19.763924	230	frank	t	f	\N	\N	\N	\N	4
257		$2a$10$BJNcYW9LFDNgr8PzL0vp4OBQ.4lAO.did2xoF1lk7w.PnJIVHHf0y	\N	\N	\N	0	\N	\N	\N	\N	2018-12-13 19:11:33.765766	2018-12-13 19:11:33.765766	331	pj	t	f	\N	\N	\N	\N	5
258		$2a$10$iPLOB/H01ZEWPBi3MwXobenUN6KkLbcK3weoDB/B7sNqf83WJVr0i	\N	\N	\N	0	\N	\N	\N	\N	2018-12-17 12:19:41.139043	2018-12-17 12:19:41.139043	332	paddy9	t	f	\N	\N	\N	\N	5
259		$2a$10$Vc3tig3z2rbVQStNVf.XYer.65.wX8h5vuAuZMlxa/vKFRyQv00e2	\N	\N	\N	0	\N	\N	\N	\N	2018-12-21 13:57:10.107321	2018-12-21 13:57:10.107321	333	tricklez	t	f	\N	\N	\N	\N	5
260		$2a$10$Dce5imQvbPqDdFgkogSCOOTChW.jfvFjXe/7HJgAEg.gSLcRY1dTi	\N	\N	\N	0	\N	\N	\N	\N	2018-12-24 11:47:19.194503	2018-12-24 11:47:19.194503	334	calebh	t	f	\N	\N	\N	\N	5
262		$2a$11$1H4u3Ql2ITQHa.B3J3v0Oe/r4cZkJOP19f2USG/iUy3uhOMSjsRRS	\N	\N	\N	0	\N	\N	\N	\N	2019-01-07 22:54:29.229509	2019-01-07 23:00:00.901167	336	adminqa	t	f	\N	\N	\N	\N	7
275		$2a$10$esWA04zOFVREDVJiP/woJ.uH5Ki23HWYSHIhFRnA0l.6KIbHIl9cq	\N	\N	\N	0	\N	\N	\N	\N	2019-01-24 13:46:02.406839	2019-01-25 16:38:07.772577	353	pnurse4	t	f	\N	\N	\N	\N	3
265		$2a$11$gfszqWcfioJ1lOjUhY7efeDx8EAIy3eiV0SknZ92JxIXhDJ6ShBAm	\N	\N	\N	2	2019-01-08 11:13:40.803208	2019-01-08 10:52:30.663467	37.1.97.2	37.1.97.2	2019-01-08 10:51:40.163137	2019-01-08 11:13:40.807432	339	demoqa	t	f	\N	\N	\N	\N	5
263		$2a$11$R9rS7p5t/Yyi4Y5tgUNpzemlYD6jv8NJlfSz6LDRRvubc5eQijNUO	\N	\N	\N	1	2019-01-08 10:08:46.643896	2019-01-08 10:08:46.643896	37.210.252.225	37.210.252.225	2019-01-07 22:56:03.419711	2019-01-08 10:16:43.7603	337	samuel	t	f	\N	\N	\N	\N	3
277		$2a$10$rothTpTi231O3XuZ7CZDbefdt/bWmWKE0wEa7vmYYByK5GbWEJFki	\N	\N	\N	0	\N	\N	\N	\N	2019-01-25 19:05:56.231356	2019-01-25 19:05:56.231356	355	dr	f	f	\N	\N	\N	\N	3
266		$2a$10$O6c0dsY1kaCmWWI91EPxxe.eZb4r6NVON7Yfi/ZKhdJM2DflSdVwK	\N	\N	\N	0	\N	\N	\N	\N	2019-01-09 14:33:23.664249	2019-01-09 14:33:23.664249	340	fiifi	t	f	\N	\N	\N	\N	5
267		$2a$10$4UCyVZyH23TjQQSXRmtS1ufaP0qEla1gle6Nff/tVrOoZJrUC.zRu	\N	\N	\N	0	\N	\N	\N	\N	2019-01-09 14:46:38.452133	2019-01-09 14:46:38.452133	341	dela	t	f	\N	\N	\N	\N	5
6		$2a$11$g3m7AlKLlJuZfoDPt9joouLKcoJmIs3rgs4RtvHigWgvEbt8roq7u	\N	\N	\N	164	2019-02-10 18:13:17.529637	2019-01-26 17:35:50.701431	154.160.5.111	154.160.14.151	2018-01-05 11:52:52.858909	2019-02-10 18:13:17.539847	36	clem	t	\N	clem.jpg	image/jpeg	79054	2018-01-05 12:01:00.41165	1
268		$2a$10$SZHKoVHkdAkHtgEqY43m6usGqFg5q4o.W7v.YhSgxbWhLQA8hTwJW	\N	\N	\N	0	\N	\N	\N	\N	2019-01-11 09:18:52.422516	2019-01-11 09:18:52.422516	342	testuser	t	f	\N	\N	\N	\N	5
264		$2a$11$F41SUGLzElgOPkSkzuX6UucQdzSaAX2FIE1e7mMohuCMhZqZTUage	\N	\N	\N	1	2019-01-08 10:24:29.955235	2019-01-08 10:24:29.955235	37.210.252.225	37.210.252.225	2019-01-08 10:23:53.674375	2019-01-11 09:43:01.406994	338	nanapoland	t	f	\N	\N	\N	\N	5
273		$2a$10$cdxi3wO3.kkNa471qj5mTuPiT338CUzOLlDPp9bgXSERqL8F8cLKi	\N	\N	\N	0	\N	\N	\N	\N	2019-01-24 13:37:13.470497	2019-01-24 13:37:13.470497	351	pnurse2	f	f	\N	\N	\N	\N	3
261		$2a$10$/CAJjhrHHYD.aME78ZjBOuZ9HeEj4BzN9DISxVWOUPeYtcBQ2QYpu	\N	\N	\N	1	2019-01-11 09:54:34.998571	2019-01-11 09:54:34.998571	37.210.252.225	37.210.252.225	2019-01-01 05:25:42.422606	2019-01-11 09:54:35.000768	335	gnurse	t	f	\N	\N	\N	\N	3
269		$2a$10$D1oREtNjOym79SyacozIA.7oLah8Yp6R07NgeertKUTd/O3HmdUra	\N	\N	\N	0	\N	\N	\N	\N	2019-01-11 09:59:15.157061	2019-01-11 09:59:15.157061	343	testnurse	f	f	\N	\N	\N	\N	3
270		$2a$10$WTeQsMiDe4A.Sl7DFzLHjO.oe.zNyaJUYo3T6KLRbEfV5kMZj4qKa	\N	\N	\N	0	\N	\N	\N	\N	2019-01-11 10:01:32.444408	2019-01-11 10:01:32.444408	344	testdoc	f	f	\N	\N	\N	\N	4
271		$2a$10$U05OLbkqLjf4YvhPpTqKF.n35x9GIe63oIAJjWXxdD4p6uz8rPRGO	\N	\N	\N	0	\N	\N	\N	\N	2019-01-15 09:55:45.536185	2019-01-15 10:22:10.778427	349	pnurse1	t	f	\N	\N	\N	\N	3
274		$2a$10$dj6kgVHnPNek85SKbLhUAeIJYXXtyHm7P3RROKb88xMObNpJBvbA.	\N	\N	\N	0	\N	\N	\N	\N	2019-01-24 13:42:49.782659	2019-01-24 13:42:49.782659	352	pnurse3	f	f	\N	\N	\N	\N	3
276		$2a$10$dvrAqZsHpzOUQVq7u4IcKufM4hhcNtIpzhozB/rkZkLOUNi97YY4m	\N	\N	\N	0	\N	\N	\N	\N	2019-01-25 16:22:02.599447	2019-01-25 16:37:02.869195	354	nursenaa	t	f	\N	\N	\N	\N	3
278		$2a$10$Xx8BtXM9iz8P8YFO10YVgOERxaEmp3SGBCglRif/hlMFfjx55Rhxu	\N	\N	\N	1	2019-01-28 12:52:28.897936	2019-01-28 12:52:28.897936	154.160.14.139	154.160.14.139	2019-01-25 19:34:39.733736	2019-01-28 12:52:28.900021	356	drs	t	f	\N	\N	\N	\N	3
279		$2a$11$i031wi3eWoEUCdPe5G3pVONSh3dFmWwIbHHiGEffoesjRlhRLRDzm	\N	\N	\N	2	2019-01-28 16:18:41.827742	2019-01-28 13:34:44.363399	154.160.14.161	154.160.14.139	2019-01-28 13:28:07.288572	2019-01-28 16:18:41.830038	357	naanurse	t	f	\N	\N	\N	\N	3
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('public.users_id_seq', 279, true);


--
-- Name: affected_system_masters affected_system_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.affected_system_masters
    ADD CONSTRAINT affected_system_masters_pkey PRIMARY KEY (id);


--
-- Name: allergies_masters allergies_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.allergies_masters
    ADD CONSTRAINT allergies_masters_pkey PRIMARY KEY (id);


--
-- Name: app_versions app_version_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.app_versions
    ADD CONSTRAINT app_version_pkey PRIMARY KEY (id);


--
-- Name: appointment_types appointment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.appointment_types
    ADD CONSTRAINT appointment_types_pkey PRIMARY KEY (id);


--
-- Name: billing_info_bill_items billing_info_bill_items_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.billing_info_bill_items
    ADD CONSTRAINT billing_info_bill_items_pkey PRIMARY KEY (id);


--
-- Name: callback_statuses callback_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.callback_statuses
    ADD CONSTRAINT callback_statuses_pkey PRIMARY KEY (id);


--
-- Name: city_town_masters city_town_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.city_town_masters
    ADD CONSTRAINT city_town_masters_pkey PRIMARY KEY (id);


--
-- Name: condition_masters condition_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.condition_masters
    ADD CONSTRAINT condition_masters_pkey PRIMARY KEY (id);


--
-- Name: confirmed_appointments confirmed_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.confirmed_appointments
    ADD CONSTRAINT confirmed_appointments_pkey PRIMARY KEY (id);


--
-- Name: confirmed_conditions confirmed_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.confirmed_conditions
    ADD CONSTRAINT confirmed_conditions_pkey PRIMARY KEY (id);


--
-- Name: confirmed_personal_doctor_services confirmed_personal_doctor_services_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.confirmed_personal_doctor_services
    ADD CONSTRAINT confirmed_personal_doctor_services_pkey PRIMARY KEY (id);


--
-- Name: country_masters country_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.country_masters
    ADD CONSTRAINT country_masters_pkey PRIMARY KEY (id);


--
-- Name: decline_comments decline_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.decline_comments
    ADD CONSTRAINT decline_comments_pkey PRIMARY KEY (id);


--
-- Name: drug_masters drug_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.drug_masters
    ADD CONSTRAINT drug_masters_pkey PRIMARY KEY (id);


--
-- Name: drug_prices drug_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.drug_prices
    ADD CONSTRAINT drug_prices_pkey PRIMARY KEY (id);


--
-- Name: engaged_user_services engaged_user_services_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.engaged_user_services
    ADD CONSTRAINT engaged_user_services_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: lab_detail_images lab_detail_images_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.lab_detail_images
    ADD CONSTRAINT lab_detail_images_pkey PRIMARY KEY (id);


--
-- Name: lab_details lab_details_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.lab_details
    ADD CONSTRAINT lab_details_pkey PRIMARY KEY (id);


--
-- Name: lab_images lab_images_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.lab_images
    ADD CONSTRAINT lab_images_pkey PRIMARY KEY (id);


--
-- Name: lab_services lab_services_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.lab_services
    ADD CONSTRAINT lab_services_pkey PRIMARY KEY (id);


--
-- Name: measure_units measure_units_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.measure_units
    ADD CONSTRAINT measure_units_pkey PRIMARY KEY (id);


--
-- Name: medication_details medication_details_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.medication_details
    ADD CONSTRAINT medication_details_pkey PRIMARY KEY (id);


--
-- Name: password_table password_table_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.password_table
    ADD CONSTRAINT password_table_pkey PRIMARY KEY (id);


--
-- Name: patient_billing_infos patient_billing_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.patient_billing_infos
    ADD CONSTRAINT patient_billing_infos_pkey PRIMARY KEY (id);


--
-- Name: patient_med_records patient_med_records_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.patient_med_records
    ADD CONSTRAINT patient_med_records_pkey PRIMARY KEY (id);


--
-- Name: payment_reqs payment_reqs_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.payment_reqs
    ADD CONSTRAINT payment_reqs_pkey PRIMARY KEY (id);


--
-- Name: pds_patient_prev_med_histories pds_patient_prev_med_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.pds_patient_prev_med_histories
    ADD CONSTRAINT pds_patient_prev_med_histories_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: permissions_roles permissions_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.permissions_roles
    ADD CONSTRAINT permissions_roles_pkey PRIMARY KEY (id);


--
-- Name: person_contact_infos person_contact_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.person_contact_infos
    ADD CONSTRAINT person_contact_infos_pkey PRIMARY KEY (id);


--
-- Name: person_info_extras person_info_extras_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.person_info_extras
    ADD CONSTRAINT person_info_extras_pkey PRIMARY KEY (id);


--
-- Name: person_infos person_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.person_infos
    ADD CONSTRAINT person_infos_pkey PRIMARY KEY (id);


--
-- Name: person_type_masters person_type_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.person_type_masters
    ADD CONSTRAINT person_type_masters_pkey PRIMARY KEY (id);


--
-- Name: pre_appointments pre_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.pre_appointments
    ADD CONSTRAINT pre_appointments_pkey PRIMARY KEY (id);


--
-- Name: pre_confirmed_appointments pre_confirmed_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.pre_confirmed_appointments
    ADD CONSTRAINT pre_confirmed_appointments_pkey PRIMARY KEY (id);


--
-- Name: pre_payment_reqs pre_payment_reqs_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.pre_payment_reqs
    ADD CONSTRAINT pre_payment_reqs_pkey PRIMARY KEY (id);


--
-- Name: profesional_groups profesional_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.profesional_groups
    ADD CONSTRAINT profesional_groups_pkey PRIMARY KEY (id);


--
-- Name: provider_engaged_users provider_engaged_users_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.provider_engaged_users
    ADD CONSTRAINT provider_engaged_users_pkey PRIMARY KEY (id);


--
-- Name: provider_masters provider_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.provider_masters
    ADD CONSTRAINT provider_masters_pkey PRIMARY KEY (id);


--
-- Name: provider_services provider_services_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.provider_services
    ADD CONSTRAINT provider_services_pkey PRIMARY KEY (id);


--
-- Name: referals referals_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.referals
    ADD CONSTRAINT referals_pkey PRIMARY KEY (id);


--
-- Name: region_masters region_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.region_masters
    ADD CONSTRAINT region_masters_pkey PRIMARY KEY (id);


--
-- Name: registration registration_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (id);


--
-- Name: request_categories request_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.request_categories
    ADD CONSTRAINT request_categories_pkey PRIMARY KEY (id);


--
-- Name: request_urgencies request_urgencies_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.request_urgencies
    ADD CONSTRAINT request_urgencies_pkey PRIMARY KEY (id);


--
-- Name: requester_allergies requester_allergies_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.requester_allergies
    ADD CONSTRAINT requester_allergies_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: service_fee_masters service_fee_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.service_fee_masters
    ADD CONSTRAINT service_fee_masters_pkey PRIMARY KEY (id);


--
-- Name: service_masters service_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.service_masters
    ADD CONSTRAINT service_masters_pkey PRIMARY KEY (id);


--
-- Name: service_prov_extra_infos service_prov_extra_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.service_prov_extra_infos
    ADD CONSTRAINT service_prov_extra_infos_pkey PRIMARY KEY (id);


--
-- Name: service_prov_types service_prov_types_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.service_prov_types
    ADD CONSTRAINT service_prov_types_pkey PRIMARY KEY (id);


--
-- Name: specialty_masters specialty_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.specialty_masters
    ADD CONSTRAINT specialty_masters_pkey PRIMARY KEY (id);


--
-- Name: suburb_masters suburb_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.suburb_masters
    ADD CONSTRAINT suburb_masters_pkey PRIMARY KEY (id);


--
-- Name: user_services user_services_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.user_services
    ADD CONSTRAINT user_services_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: clemence
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: clemence
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

