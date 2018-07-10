-- Project .............: R-DaaS
-- Author ..............: Greg Beam (KI7MT)
-- File ................: R-DaaS_Enum-Views.sql
-- Description .........: Views for Enumeration Tables
-- Database Type .......: PostgreSQL v10 or later
-- Version .............: 1.0.0
-- ADIF Specification ..: 3.0.8

--******************************************************************************
-- Table: antenna_path
--******************************************************************************

-- View: enum.vw_antenna_path
CREATE OR REPLACE VIEW enum.vw_antenna_path AS
    SELECT 
        antenna_path.antenna_path_abbreviation AS "Abbreviation",
        antenna_path.antenna_path_meaning AS "Meaning"
    FROM enum.antenna_path
    ORDER BY enum.antenna_path.antenna_path_abbreviation;

--******************************************************************************
-- Table: arrl_section
--******************************************************************************

-- View: enum.vw_arrl_section
CREATE OR REPLACE VIEW enum.vw_arrl_section AS
    SELECT 
        arrl_section_abbreviation AS "Abbreviation",
        arrl_section_name AS "Section Name",
        dxcc_entity_code AS "DXCC Code",
        dxcc_entity_name AS "DXCC Name",
        arrl_section_from_date AS "From Date",
        arrl_section_deleted_date AS "Deleted On"
    FROM enum.arrl_section
        INNER JOIN enum.dxcc_entity ON 
            enum.dxcc_entity.dxcc_entity_id = enum.arrl_section.dxcc_entity_id
    ORDER BY arrl_section_name;


--******************************************************************************
-- Table: enum.vw_award
--******************************************************************************

-- View: enum.vw_award
CREATE OR REPLACE VIEW enum.vw_award AS
    SELECT
        band_name AS "Band",
        band_lower_freq AS "Lower Freq (MHZ)",
        band_upper_freq AS "Upper Freq (MHZ)"
    FROM enum.band
    ORDER BY band_lower_freq;


--******************************************************************************
-- Table: enum.vw_band
--******************************************************************************

-- View: enum.vw_band
CREATE OR REPLACE VIEW enum.vw_band AS
    SELECT
        award_name AS "Award",
        award_import_only AS "Import Only"
    FROM enum.award
    ORDER BY award_name;


--******************************************************************************
-- Table: enum.vw_contest
--******************************************************************************

-- View: enum.vw_contest
CREATE OR REPLACE VIEW enum.vw_contest AS
    SELECT
        contest_name AS "Contest",
        contest_description AS "Description",
        contest_import_only AS "Import Only",
        weblink_url AS "Weblink URL"
    FROM enum.contest
        LEFT JOIN enum.weblink ON
            enum.weblink.weblink_id = enum.contest.weblink_id
    ORDER BY contest_name;


--******************************************************************************
-- Table: enum.vw_continent
--******************************************************************************

-- View: enum.vw_continent
CREATE OR REPLACE VIEW enum.vw_continent AS
    SELECT
        continent_abbreviation AS "Abbreviation",
        continent_name AS "Name"
    FROM enum.continent
    ORDER BY continent_abbreviation;


--******************************************************************************
-- Table: enum.vw_county_name
--******************************************************************************

-- View: enum.vw_county_name
CREATE OR REPLACE VIEW enum.vw_county_name AS
    SELECT
        county_name AS "County name"
    FROM enum.county_name
    ORDER BY county_name;


--******************************************************************************
-- Table: enum.vw_credit_award
--******************************************************************************

-- View: enum.vw_credit_award
CREATE OR REPLACE VIEW enum.vw_credit_award AS
    SELECT
        credit_award_name AS "Award name"
    FROM enum.credit_award
    ORDER BY credit_award_name;

--******************************************************************************
-- Table: enum.vw_credit_facet
--******************************************************************************

-- View: enum.vw_credit_facet
CREATE OR REPLACE VIEW enum.vw_credit_facet AS
    SELECT
        credit_facet_name AS "Facet"
    FROM enum.credit_facet
    ORDER BY credit_facet_name;

--******************************************************************************
-- Table: enum.vw_credit_sponsor
--******************************************************************************

-- View: enum.vw_credit_sponsor
CREATE OR REPLACE VIEW enum.vw_credit_sponsor AS
    SELECT
        credit_sponsor_name AS "Sponsor"
    FROM enum.credit_sponsor
    ORDER BY credit_sponsor_name;


--******************************************************************************
-- Table: enum.vw_credit
--******************************************************************************

-- View: enum.vw_credit
CREATE OR REPLACE VIEW enum.vw_credit AS
    SELECT
        credit_for AS "Credit For",
        credit_sponsor_name AS "Sponsor",
        credit_award_name AS "Award",
        credit_facet_name AS "Facet"
    FROM enum.credit
        LEFT JOIN enum.credit_sponsor ON
            enum.credit_sponsor.credit_sponsor_id = enum.credit.credit_sponsor_id
        LEFT JOIN enum.credit_award ON
            enum.credit_award.credit_award_id = enum.credit.credit_award_id
        LEFT JOIN enum.credit_facet ON
            enum.credit_facet.credit_facet_id = enum.credit.credit_facet_id
    ORDER BY credit_for;


--******************************************************************************
-- Table: enum.vw_dxcc_entity
--******************************************************************************

-- View: enum.vw_dxcc_entity
CREATE OR REPLACE VIEW enum.vw_dxcc_entity AS
    SELECT
        dxcc_entity_code AS "DXCC Code",
        dxcc_entity_name AS "DXCC Name",
        dxcc_entity_deleted as "Deleted"
    FROM enum.dxcc_entity
    ORDER BY dxcc_entity_code;


--******************************************************************************
-- Table: enum.vw_state
--******************************************************************************

-- View: enum.vw_state
CREATE OR REPLACE VIEW enum.vw_state AS
    SELECT
        state_abbreviation AS "Abbreviation",
        state_name AS "Name"
    FROM enum.state
    ORDER BY state_name;


--******************************************************************************
-- Table: enum.vw_state_county
--******************************************************************************

-- View: enum.vw_state_county
CREATE OR REPLACE VIEW enum.vw_state_county AS
    SELECT
        s.state_abbreviation AS "Abbreviation",
        s.state_name AS "State",
        county_name AS "County"
    FROM enum.state s
        JOIN enum.state_county sc on s.state_id = sc.state_id
        JOIN enum.county_name cn on cn.county_name_id = sc.county_name_id
    ORDER BY state_name;

--******************************************************************************
-- Enum Schema Utility Views
--******************************************************************************

-- View: enum.vw_view_list
CREATE OR REPLACE VIEW enum.vw_view_list AS
    SELECT
        schemaname AS "Schema",
        viewname AS "View Name"
        FROM pg_catalog.pg_views
        WHERE schemaname NOT IN ('pg_catalog', 'information_schema')
    ORDER BY schemaname, viewname;

ALTER TABLE enum.vw_view_list OWNER TO postgres;

-- View: enum.vw_db_size_detail
CREATE OR REPLACE VIEW enum.vw_db_size AS
    SELECT
        pg_size_pretty(pg_database_size('postgres')) AS "DB Size";

-- View: enum.vw_db_size_detail
CREATE OR REPLACE VIEW enum.vw_schema_size AS
    SELECT schema_name, 
        pg_size_pretty(sum(table_size)::BIGINT),
        trunc((sum(table_size) / pg_database_size(current_database())) * 100, 2) AS percent
    FROM (
        SELECT pg_catalog.pg_namespace.nspname AS schema_name,
               pg_relation_size(pg_catalog.pg_class.oid) AS table_size
        FROM pg_catalog.pg_class
            JOIN pg_catalog.pg_namespace ON relnamespace = pg_catalog.pg_namespace.oid
    ) t
    GROUP BY schema_name
    ORDER BY schema_name;

-- END VIEW SCRIPT
