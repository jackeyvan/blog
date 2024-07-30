BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "backend_user" (
    "id" bigserial PRIMARY KEY,
    "account" text NOT NULL,
    "password" text NOT NULL
);


--
-- MIGRATION VERSION FOR blog
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('blog', '20240730150209690', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240730150209690', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
