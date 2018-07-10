-- Project .............: R-DaaS
-- Author ..............: Greg Beam (KI7MT)
-- File ................: R-DaaS_Enum-Views.sql
-- Description .........: View Queries for Enumeration Tables
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

ALTER TABLE enum.vw_antenna_path OWNER TO postgres;

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

ALTER TABLE enum.vw_arrl_section OWNER TO postgres;


-- View: enum.vw_award
CREATE OR REPLACE VIEW enum.vw_award AS
    SELECT
        award_name AS "Award",
        award_import_only AS "Import Only"
    FROM enum.award
    ORDER BY award_name;

ALTER TABLE enum.vw_award OWNER TO postgres;

--******************************************************************************
-- View: enum.vw_state_county
--******************************************************************************
CREATE OR REPLACE VIEW enum.vw_state_county AS
    SELECT
        s.state_abbreviation AS "Abbreviation",
        s.state_name AS "State",
        county_name AS "County"
    FROM enum.state s
        JOIN enum.state_county sc on s.state_id = sc.state_id
        JOIN enum.county_name cn on cn.county_name_id = sc.county_name_id
    ORDER BY state_name;

ALTER TABLE enum.vw_state_county OWNER TO postgres;

--******************************************************************************
-- View: enum.vw_db_size
--******************************************************************************
CREATE OR REPLACE VIEW enum.vw_db_size AS
    SELECT
        pg_size_pretty(pg_database_size('postgres')) AS "DB Size";

ALTER TABLE enum.vw_db_size OWNER TO postgres;

--******************************************************************************
-- View: enum.vw_db_size_detail
--******************************************************************************
CREATE OR REPLACE VIEW enum.vw_db_size_detail AS
    SELECT schema_name, 
        pg_size_pretty(sum(table_size)::bigint),
        trunc((sum(table_size) / pg_database_size(current_database())) * 100, 2) AS percent
    FROM (
        SELECT pg_catalog.pg_namespace.nspname as schema_name,
                pg_relation_size(pg_catalog.pg_class.oid) as table_size
        FROM pg_catalog.pg_class
            JOIN pg_catalog.pg_namespace ON relnamespace = pg_catalog.pg_namespace.oid
    ) t
    GROUP BY schema_name
    ORDER BY schema_name;

ALTER TABLE enum.vw_db_size_detail OWNER TO postgres;

--******************************************************************************
-- Fully clean Database
--******************************************************************************
-- vacuum full;

