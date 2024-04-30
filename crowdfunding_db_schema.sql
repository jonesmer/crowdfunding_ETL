CREATE TABLE "Category" (
    "category_id" varchar   NOT NULL,
    "category" varchar   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "Subcategories" (
    "subcategory_id" varchar   NOT NULL,
    "subcategory" varchar   NOT NULL,
    CONSTRAINT "pk_Subcategories" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "Campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar   NOT NULL,
    "description" varchar   NOT NULL,
    "goal" numeric   NOT NULL,
    "pledged" numeric   NOT NULL,
    "outcome" varchar   NOT NULL,
    "backers_count" smallint   NOT NULL,
    "country" varchar   NOT NULL,
    "currency" varchar   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar   NOT NULL,
    "subcategory_id" varchar   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "Contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "email" varchar   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Subcategories" ("subcategory_id");

COPY subcategories
FROM '/Users/celinakamler/ucb/homework/13-ETL/GroupProject2/crowdfunding_ETL/Output/subcategory.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM public."Subcategories"
ORDER BY subcategory_id;

COPY subcategories
FROM '/Users/celinakamler/ucb/homework/13-ETL/GroupProject2/crowdfunding_ETL/Output/category.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM public."Category"
ORDER BY category_id;

COPY subcategories
FROM '/Users/celinakamler/ucb/homework/13-ETL/GroupProject2/crowdfunding_ETL/Output/contacts.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM public."Contacts"
ORDER BY contact_id;

COPY subcategories
FROM '/Users/celinakamler/ucb/homework/13-ETL/GroupProject2/crowdfunding_ETL/Output/campaign.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM public."Campaign"
ORDER BY category_id ASC Limit 100;



