CREATE TABLE "campaigns" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "tstmp" datetime, "created_at" datetime, "updated_at" datetime, "user_id" integer);
CREATE TABLE "data_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "follow_users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "followed_id" integer, "created_at" datetime, "updated_at" datetime, "state" varchar(255));
CREATE TABLE "locations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "loc_name" varchar(255), "loc_street" varchar(255), "loc_city" varchar(255), "loc_state" varchar(255), "loc_zip" integer, "created_at" datetime, "updated_at" datetime, "org_id" integer, "organization_id" integer);
CREATE TABLE "organizations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "content" text, "created_at" datetime, "updated_at" datetime, "addressA" varchar(255), "cityA" varchar(255), "stateA" varchar(255), "zipA" varchar(255), "addressB" varchar(255), "cityB" varchar(255), "stateB" varchar(255), "zipB" varchar(255), "website" varchar(255), "phoneA" varchar(255), "phoneB" varchar(255), "fax" varchar(255), "user_id" integer);
CREATE TABLE "program_activities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "activity_name" varchar(255), "activity_short_desc" text, "program_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "programs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "prog_name" varchar(255), "prog_obj" text, "created_at" datetime, "updated_at" datetime, "organization_id" integer, "ideal_candidate" text, "initial_condition" text, "goal_condition" text, "next_step" varchar(255), "org_id" integer, "program_capacity" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime, "updated_at" datetime, "organization_id" integer, "first_name" varchar(255), "last_name" varchar(255), "job_title" varchar(255), "volunteer" integer);
CREATE INDEX "index_campaigns_on_user_id" ON "campaigns" ("user_id");
CREATE INDEX "index_follow_users_on_state" ON "follow_users" ("state");
CREATE INDEX "index_follow_users_on_user_id_and_followed_id" ON "follow_users" ("user_id", "followed_id");
CREATE INDEX "index_locations_on_org_id" ON "locations" ("org_id");
CREATE INDEX "index_locations_on_organization_id" ON "locations" ("organization_id");
CREATE INDEX "index_organizations_on_user_id" ON "organizations" ("user_id");
CREATE INDEX "index_program_activities_on_program_id" ON "program_activities" ("program_id");
CREATE INDEX "index_programs_on_org_id" ON "programs" ("org_id");
CREATE INDEX "index_programs_on_organization_id" ON "programs" ("organization_id");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE INDEX "index_users_on_organization_id" ON "users" ("organization_id");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "unique_data_migrations" ON "data_migrations" ("version");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20140325003722');

INSERT INTO schema_migrations (version) VALUES ('20140325020902');

INSERT INTO schema_migrations (version) VALUES ('20140325032233');

INSERT INTO schema_migrations (version) VALUES ('20140325032743');

INSERT INTO schema_migrations (version) VALUES ('20140325032918');

INSERT INTO schema_migrations (version) VALUES ('20140325044003');

INSERT INTO schema_migrations (version) VALUES ('20140330050412');

INSERT INTO schema_migrations (version) VALUES ('20140330052141');

INSERT INTO schema_migrations (version) VALUES ('20140331203200');

INSERT INTO schema_migrations (version) VALUES ('20140331203525');

INSERT INTO schema_migrations (version) VALUES ('20140407205947');

INSERT INTO schema_migrations (version) VALUES ('20140408042859');

INSERT INTO schema_migrations (version) VALUES ('20140408160909');

INSERT INTO schema_migrations (version) VALUES ('20140505031755');

INSERT INTO schema_migrations (version) VALUES ('20140515190511');

INSERT INTO schema_migrations (version) VALUES ('20140521172430');

INSERT INTO schema_migrations (version) VALUES ('20140521183839');

INSERT INTO schema_migrations (version) VALUES ('20140523005925');

INSERT INTO schema_migrations (version) VALUES ('20140612160505');

INSERT INTO schema_migrations (version) VALUES ('20140612193627');

INSERT INTO schema_migrations (version) VALUES ('20140612201232');

INSERT INTO schema_migrations (version) VALUES ('20140612202836');

INSERT INTO schema_migrations (version) VALUES ('20140612211256');
