-- Project .............: R-DaaS
-- Author ..............: Greg Beam (KI7MT)
-- File ................: R-DaaS_Enum.sql
-- Description .........: Enumeration Tables for R-DaaS
-- Database Type .......: PostgreSQL v10 or later
-- Version .............: 1.0.0
-- ADIF Specification ..: 3.0.8

-- Drop, then Create Enumeration Schema
DROP SCHEMA IF EXISTS enum CASCADE;
CREATE SCHEMA enum;


-- *****************************************************************************
--  ENUMERATION DATA
-- *****************************************************************************

-- Antenna Path
CREATE TABLE enum.antenna_path
(
    antenna_path_id SMALLSERIAL PRIMARY KEY,
    antenna_path_abbreviation VARCHAR(1) NOT NULL,
    antenna_path_meaning VARCHAR(15) NOT NULL,
    CONSTRAINT uq_antenna_path UNIQUE (antenna_path_abbreviation, antenna_path_meaning)
);

-- Award
CREATE TABLE enum.award
(
    award_id SMALLSERIAL PRIMARY KEY,
    award_name VARCHAR(15),
    award_import_only BOOL NOT NULL DEFAULT '1',
    CONSTRAINT uq_award UNIQUE (award_name)
);

-- ARRL Section
-- FK fk_arrl_section_dxcc_entity (dxcc_entity_id)
CREATE TABLE enum.arrl_section
(
    arrl_section_id SMALLSERIAL PRIMARY KEY,
    arrl_section_abbreviation VARCHAR(4) NOT NULL,
    arrl_section_name VARCHAR(70) NOT NULL,
    dxcc_entity_id SMALLINT NOT NULL,
    arrl_section_from_date date,
    arrl_section_deleted_date date
);

-- Band
CREATE TABLE enum.band
(
    band_id SMALLSERIAL PRIMARY KEY,
    band_name VARCHAR(6) NOT NULL,
    band_lower_freq NUMERIC NOT NULL,
    band_upper_freq NUMERIC NOT NULL,
    CONSTRAINT uq_band_name UNIQUE (band_name)
);

-- Contest
-- FK fk_contest_weblink to enum.weblink(weblink_id)
CREATE TABLE enum.contest
(
    contest_id SMALLSERIAL PRIMARY KEY,
    contest_name VARCHAR(60),
    contest_description VARCHAR(120),
    contest_import_only BOOL NOT NULL DEFAULT '0',
    weblink_id SMALLINT,
    CONSTRAINT uq_contest_name UNIQUE (contest_name)
);

-- Continent
CREATE TABLE enum.continent
(
    continent_id SMALLSERIAL PRIMARY KEY,
    continent_abbreviation VARCHAR(2),
    continent_name VARCHAR(14),
    CONSTRAINT uq_continent_name UNIQUE (continent_abbreviation, continent_name)
);

-- Credit Facet
CREATE TABLE enum.credit_facet
(
    credit_facet_id SMALLSERIAL PRIMARY KEY,
    credit_facet_name VARCHAR(20),
    CONSTRAINT uq_credit_facet_name UNIQUE (credit_facet_name)
);

-- Credit Award
CREATE TABLE enum.credit_award
(
    credit_award_id SMALLSERIAL PRIMARY KEY,
    credit_award_name VARCHAR(60),
    CONSTRAINT uq_credit_award_name UNIQUE (credit_award_name)
);

-- Credit Sponsor Name
CREATE TABLE enum.credit_sponsor
(
    credit_sponsor_id SMALLSERIAL PRIMARY KEY,
    credit_sponsor_name VARCHAR(20),
    CONSTRAINT uq_credit_sponsor_name UNIQUE (credit_sponsor_name)
);

-- Credit One-to-One
-- FK fk_credit_credit_sponsor enum.credit_sponsor(credit_sponsor_id)
-- FK fk_credit_credit_award enum.credit_award(credit_award_id)
-- FK fk_credit_credit_facet enum.credit_facet(credit_facet_id)
CREATE TABLE enum.credit
(
    credit_id SMALLSERIAL PRIMARY KEY,
    credit_for VARCHAR(24) NOT NULL,
    credit_sponsor_id SMALLINT NOT NULL,
    credit_award_id SMALLINT NOT NULL,
    credit_facet_id SMALLINT NOT NULL,
CONSTRAINT uq_credit_for UNIQUE (credit_for)
);

-- DXCC Entities
-- The PK Is "NOT" a sequence. The ID field matches the DXCC Code
CREATE TABLE enum.dxcc_entity
(
    dxcc_entity_id SMALLINT PRIMARY KEY,
    dxcc_entity_code VARCHAR(4) NOT NULL,
    dxcc_entity_name VARCHAR(90) NOT NULL,
    dxcc_entity_deleted BOOL DEFAULT 'n',
    CONSTRAINT uq_dxcc_entity UNIQUE (dxcc_entity_code, dxcc_entity_name)
);

-- *****************************************************************************
--  STATE, COUNTY and STATE-COUNTY
-- *****************************************************************************

-- State Name
CREATE TABLE enum.state
(
    state_id SMALLSERIAL PRIMARY KEY,
    state_abbreviation VARCHAR(2) NOT NULL,
    state_name VARCHAR(20) NOT NULL,
    CONSTRAINT uq_state UNIQUE (state_abbreviation, state_name)
);

-- County
CREATE TABLE enum.county_name
(
    county_name_id SMALLSERIAL PRIMARY KEY,
    county_name VARCHAR(60) NOT NULL,
    CONSTRAINT uq_county_name UNIQUE (county_name)
);

-- State County Many-To-Many
-- FK fk_state_county_state to enum.state(state_id)
-- FK fk_state_county_county_name to enum.county_name(county_id)
CREATE TABLE enum.state_county
(
    state_country_id SMALLSERIAL PRIMARY KEY,
    state_id SMALLINT NOT NULL,
    county_name_id SMALLINT NOT NULL
);


-- *****************************************************************************
--  MODE, SUBMODE and MODE_DESCTIPTION
-- *****************************************************************************

-- Mode
-- FK 
CREATE TABLE enum.mode
(
    mode_id SMALLSERIAL PRIMARY KEY,
    mode_name VARCHAR(20) NOT NULL,
    mode_description_id SMALLINT,
    mode_import_only BOOL NOT NULL DEFAULT '0',
    CONSTRAINT uq_mode_name UNIQUE (mode_name)
);

-- Submode One-To-Many
-- FK fk_submode_mode to enum.mode(mode_id)
-- FK fk_submode_mode_description to enum.mode_description(mode_description_id)
CREATE TABLE enum.submode
(
    submode_id SMALLSERIAL PRIMARY KEY,
    mode_id SMALLINT NOT NULL,
    submode_name VARCHAR(20) NOT NULL,
    mode_description_id SMALLINT,
    CONSTRAINT uq_submode_name UNIQUE (submode_name)
);

-- Mode Description
CREATE TABLE enum.mode_description
(
    mode_description_id SMALLSERIAL PRIMARY KEY,
    mode_description_content VARCHAR(120) NOT NULL
);

-- *****************************************************************************
--  CQ, ITU and OBLAST
-- *****************************************************************************

-- CQ Zone
-- PK cq_zonew_id is the same as the cqzone_number = No Auto Increment
CREATE TABLE enum.cq_zone
(
    cqzone_id SMALLINT PRIMARY KEY,
    cqzone_number SMALLINT NOT NULL,
    cqzone_short_description VARCHAR(60) NOT NULL,
    cqzone_long_description VARCHAR,
    weblink_id SMALLINT,
    CONSTRAINT uq_cq_zone UNIQUE (cqzone_number)
);

-- ITU Zone
-- PK itu_zone_id is the same ans the itu_zone_number = No Auto Increment
CREATE TABLE enum.itu_zone
(
    ituzone_id SMALLINT PRIMARY KEY,
    ituzone_number SMALLINT NOT NULL,
    ituzone_short_description VARCHAR(120),
    ituzone_long_description VARCHAR,
    weblink_id SMALLINT,
    CONSTRAINT ck_itu_zone UNIQUE (ituzone_number)
);

-- Oblast
-- TO-DO: enum.oblast will need an FK for PSA or SAS before its functional.
CREATE TABLE enum.oblast
(
    oblast_id SMALLSERIAL PRIMARY KEY,
    oblast_code VARCHAR(10) NOT NULL,
    oblast_name VARCHAR(120) NOT NULL,
    oblast_deleted BOOL NOT NULL DEFAULT '0',
    oblast_comment VARCHAR(120) NOT NULL,
    CONSTRAINT uq_oblast_code UNIQUE (oblast_code)
);

-- Propogation
CREATE TABLE enum.propogation
(
    propogation_id SMALLSERIAL PRIMARY KEY,
    propogation_abbreviation VARCHAR(10) NOT NULL,
    propogation_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_propogation UNIQUE (propogation_abbreviation)
);

-- *****************************************************************************
--  PRIMARY and SECONDARY Administrative Subdivisions
-- *****************************************************************************

-- Primary Administrative Subdivision
-- FK fk_pas_dxcc_entity to enum.dxcc_entity(dxcc_entity_id)
CREATE TABLE enum.pas
(
    pas_id SMALLSERIAL PRIMARY KEY,
    dxcc_entity_id SMALLINT NOT NULL,
    pas_code VARCHAR(10) NOT NULL,
    pas_subdivision VARCHAR(80) NOT NULL,
    CONSTRAINT uq_pas_name UNIQUE (pas_code)
);

-- Secondary Administrative Subdivision
-- TO-DO: enum.sas needs FK "AFTER" Primary Subdivision has been populated
CREATE TABLE enum.sas
(
    sas_id SMALLSERIAL PRIMARY KEY,
    pas_id SMALLINT NOT NULL,
    sas_name VARCHAR(80) NOT NULL,
    CONSTRAINT uq_sas_name UNIQUE (sas_name)
);

-- *****************************************************************************
--  QSL and QSO
-- *****************************************************************************

-- QSL Medium
CREATE TABLE enum.qsl_medium
(
    qsl_medium_id SMALLSERIAL PRIMARY KEY,
    qsl_medium_type VARCHAR(10) NOT NULL,
    qsl_medium_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qsl_medium UNIQUE (qsl_medium_type)
);

-- QSL Recieved
CREATE TABLE enum.qsl_rcvd
(
    qsl_rcvd_id SMALLSERIAL PRIMARY KEY,
    qsl_rcvd_status VARCHAR(1) NOT NULL,
    qsl_rcvd_status_import_only BOOL NOT NULL DEFAULT '0',
    qsl_rcvd_meaning VARCHAR(20) NOT NULL,
    qsl_rcvd_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qsl_rcvd_status UNIQUE (qsl_rcvd_status)
);

-- QSL Sent
CREATE TABLE enum.qsl_sent
(
    qsl_sent_id SMALLSERIAL PRIMARY KEY,
    qsl_sent_status VARCHAR(1) NOT NULL,
    qsl_sent_status_import_only BOOL NOT NULL DEFAULT '0',
    qsl_sent_meaning VARCHAR(20) NOT NULL,
    qsl_sent_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qsl_sent_status UNIQUE (qsl_sent_status)
);

-- QSL Via
CREATE TABLE enum.qsl_via
(
    qsl_via_id SMALLSERIAL PRIMARY KEY,
    qsl_via_abbreviation VARCHAR(1) NOT NULL,
    qsl_via_import_only BOOL NOT NULL DEFAULT '0',
    qsl_via_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qsl_method UNIQUE (qsl_via_abbreviation)
);

-- QSO Complete
CREATE TABLE enum.qso_complete
(
    id SMALLSERIAL PRIMARY KEY,
    qso_complete_abbreviation VARCHAR(1) NOT NULL,
    qso_complete_meaning VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qso_complete_abbreviation UNIQUE (qso_complete_abbreviation)
);

-- QSO Status
CREATE TABLE enum.qso_status
(
    qso_status_id SMALLSERIAL PRIMARY KEY,
    qso_status_abbreviation VARCHAR(1) NOT NULL,
    qso_status_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qso_status UNIQUE (qso_status_abbreviation)
);

-- QSO Upload Status
CREATE TABLE enum.qso_upload_status
(
    qso_upload_status_id SMALLSERIAL PRIMARY KEY,
    qso_upload_status_abbreviaiton VARCHAR(1) NOT NULL,
    qso_upload_status_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qso_upload_status UNIQUE (qso_upload_status_abbreviaiton)
);


-- *****************************************************************************
--  REGION 
-- *****************************************************************************

-- Region
-- FK fk_region_dxcc_entity on enum.dxcc_entity(dxcc_entity_id)
CREATE TABLE enum.region
(
    region_id SMALLSERIAL PRIMARY KEY,
    region_entity_code VARCHAR(4) NOT NULL,
    dxcc_entity_id SMALLINT NOT NULL,
    region_name VARCHAR(120) NOT NULL,
    region_prefix VARCHAR(6) NOT NULL,
    CONSTRAINT uq_region UNIQUE (region_entity_code)
);

-- Region Applicability 
CREATE TABLE enum.region_applicability
(
    region_applicability_id SMALLSERIAL PRIMARY KEY,
    weblink_id SMALLINT NOT NULL
);


-- *****************************************************************************
--  WEBLINKS
-- *****************************************************************************

-- Web Link Section
CREATE TABLE enum.weblink
(
    weblink_id SMALLSERIAL PRIMARY KEY,
    weblink_name VARCHAR(20) NOT NULL,
    weblink_short_name VARCHAR(10) NOT NULL,
    weblink_description VARCHAR(120) NOT NULL,
    weblink_url TEXT NOT NULL,
    CONSTRAINT uq_weblink UNIQUE (weblink_name)
);

-- *****************************************************************************
--  CSV FILE DATA
-- *****************************************************************************
COPY enum.antenna_path FROM 'D:/tmp/antenna-path-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.arrl_section FROM 'D:/tmp/arrl-section-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.award FROM 'D:/tmp/award-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.band FROM 'D:/tmp/band-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.contest FROM 'D:/tmp/contest-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.continent FROM 'D:/tmp/continent-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.county_name FROM 'D:/tmp/county-name-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.credit FROM 'D:/tmp/credit-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.credit_award FROM 'D:/tmp/credit-award-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.credit_facet FROM 'D:/tmp/credit-facet-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.credit_sponsor FROM 'D:/tmp/credit-sponsor-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.dxcc_entity FROM 'D:/tmp/dxcc-entity-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.state FROM 'D:/tmp/state-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.state_county FROM 'D:/tmp/state-county-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.mode FROM 'D:/tmp/mode-enum.csv' DELIMITER '|' CSV HEADER;
COPY enum.submode FROM 'D:/tmp/submode-enum.csv' DELIMITER '|' CSV HEADER;

-- *****************************************************************************
--  FOREIGN KEY's
-- *****************************************************************************

-- TO-DO: enum.oblast will need an FK for PSA or SAS before its functional.
-- TO-DO: enum.sas needs FK "AFTER" Primary Subdivision has been populated

ALTER TABLE enum.arrl_section ADD CONSTRAINT fk_arrl_section_dxcc_entity
    FOREIGN KEY (dxcc_entity_id) REFERENCES enum.dxcc_entity (dxcc_entity_id);

ALTER TABLE enum.contest ADD CONSTRAINT fk_contest_weblink
    FOREIGN KEY (weblink_id) REFERENCES enum.weblink (weblink_id);

ALTER TABLE enum.credit ADD CONSTRAINT fk_credit_credit_sponsor
    FOREIGN KEY (credit_sponsor_id) REFERENCES enum.credit_sponsor (credit_sponsor_id);

ALTER TABLE enum.credit ADD CONSTRAINT fk_credit_credit_award
    FOREIGN KEY (credit_award_id) REFERENCES enum.credit_award (credit_award_id);

ALTER TABLE enum.credit ADD CONSTRAINT fk_credit_credit_facet
    FOREIGN KEY (credit_facet_id) REFERENCES enum.credit_facet (credit_facet_id);

ALTER TABLE enum.state_county ADD CONSTRAINT fk_state_county_state
    FOREIGN KEY (state_id) REFERENCES enum.state (state_id);

ALTER TABLE enum.state_county ADD CONSTRAINT fk_state_county_county_name
    FOREIGN KEY (county_name_id) REFERENCES enum.county_name (county_name_id);

ALTER TABLE enum.pas ADD CONSTRAINT fk_pas_dxcc_entity
    FOREIGN KEY (dxcc_entity_id) REFERENCES enum.dxcc_entity (dxcc_entity_id);

ALTER TABLE enum.region ADD CONSTRAINT fk_region_dxcc_entity
    FOREIGN KEY (dxcc_entity_id) REFERENCES enum.dxcc_entity (dxcc_entity_id);

ALTER TABLE enum.mode ADD CONSTRAINT fk_mode_mode_description
    FOREIGN KEY (mode_description_id) REFERENCES enum.mode_description (mode_description_id);

ALTER TABLE enum.submode ADD CONSTRAINT fk_submode_mode
    FOREIGN KEY (mode_id) REFERENCES enum.mode (mode_id);

ALTER TABLE enum.submode ADD CONSTRAINT fk_submode_mode_description
    FOREIGN KEY (mode_description_id) REFERENCES enum.mode_description (mode_description_id);

-- END OF SQL SCRIPT