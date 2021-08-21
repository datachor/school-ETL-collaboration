-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Egw0uy
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "general_information_of_schools" (
    "school_name" VARCHAR   NOT NULL,
    "url_address" VARCHAR   NOT NULL,
    "address" VARCHAR   NOT NULL,
    "postal_code" INT   NOT NULL,
    "telephone_no" INT   NOT NULL,
    "telephone_no_2" INT   NOT NULL,
    "fax_no" INT   NOT NULL,
    "fax_no_2" INT   NOT NULL,
    "email_address" VARCHAR   NOT NULL,
    "mrt_desc" VARCHAR   NOT NULL,
    "bus_desc" VARCHAR   NOT NULL,
    "principal_name" VARCHAR   NOT NULL,
    "first_vp_name" VARCHAR   NOT NULL,
    "second_vp_name" VARCHAR   NOT NULL,
    "third_vp_name" VARCHAR   NOT NULL,
    "fourth_vp_name" VARCHAR   NOT NULL,
    "fifth_vp_name" VARCHAR   NOT NULL,
    "sixth_vp_name" VARCHAR   NOT NULL,
    "dgp_code" VARCHAR   NOT NULL,
    "zone_code" VARCHAR   NOT NULL,
    "type_code" VARCHAR   NOT NULL,
    "nature_code" VARCHAR   NOT NULL,
    "session_code" VARCHAR   NOT NULL,
    "mainlevel_code" VARCHAR   NOT NULL,
    "sap_ind" VARCHAR   NOT NULL,
    "autonomous_ind" VARCHAR   NOT NULL,
    "gifted_ind" VARCHAR   NOT NULL,
    "ip_ind" VARCHAR   NOT NULL,
    "mothertongue1_code" VARCHAR   NOT NULL,
    "mothertongue2_code" VARCHAR   NOT NULL,
    "mothertongue3_code" VARCHAR   NOT NULL,
    CONSTRAINT "pk_general_information_of_schools" PRIMARY KEY (
        "school_name"
     )
);

CREATE TABLE "school_distinctive_programs" (
    "school_name" VARCHAR   NOT NULL,
    "alp_domain" VARCHAR   NOT NULL,
    "alp_title" VARCHAR   NOT NULL,
    "llp_domain1" VARCHAR   NOT NULL,
    "llp_title1" VARCHAR   NOT NULL,
    "llp_domain2" VARCHAR   NOT NULL,
    "llp_title2" VARCHAR   NOT NULL,
    CONSTRAINT "pk_school_distinctive_programs" PRIMARY KEY (
        "school_name"
     )
);

CREATE TABLE "moe_programmes" (
    "school_name" VARCHAR   NOT NULL,
    "moe_programmes" VARCHAR   NOT NULL,
    CONSTRAINT "pk_moe_programmes" PRIMARY KEY (
        "school_name"
     )
);

CREATE TABLE "subjects_offered" (
    "school_name" VARCHAR   NOT NULL,
    "subject_desc" VARCHAR   NOT NULL,
    CONSTRAINT "pk_subjects_offered" PRIMARY KEY (
        "school_name"
     )
);

CREATE TABLE "co_curricular_activities_ccas" (
    "school_name" VARCHAR   NOT NULL,
    "school_section" VARCHAR   NOT NULL,
    "cca_grouping_desc" VARCHAR   NOT NULL,
    "cca_generic_name" VARCHAR   NOT NULL,
    "cca_customized" VARCHAR   NOT NULL,
    CONSTRAINT "pk_co_curricular_activities_ccas" PRIMARY KEY (
        "school_name"
     )
);

ALTER TABLE "general_information_of_schools" ADD CONSTRAINT "fk_general_information_of_schools_school_name" FOREIGN KEY("school_name")
REFERENCES "moe_programmes" ("school_name");

ALTER TABLE "school_distinctive_programs" ADD CONSTRAINT "fk_school_distinctive_programs_school_name" FOREIGN KEY("school_name")
REFERENCES "co_curricular_activities_ccas" ("school_name");

ALTER TABLE "moe_programmes" ADD CONSTRAINT "fk_moe_programmes_school_name" FOREIGN KEY("school_name")
REFERENCES "subjects_offered" ("school_name");

ALTER TABLE "subjects_offered" ADD CONSTRAINT "fk_subjects_offered_school_name" FOREIGN KEY("school_name")
REFERENCES "co_curricular_activities_ccas" ("school_name");

