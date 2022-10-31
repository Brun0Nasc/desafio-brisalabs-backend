CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "name" varchar NOT NULL,
  "tel" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()'
);

CREATE TABLE "keys" (
  "id" bigserial PRIMARY KEY,
  "key_value" varchar UNIQUE NOT NULL,
  "user_id" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()'
);

CREATE TABLE "transactions" (
  "id" bigserial PRIMARY KEY,
  "amount" bigint NOT NULL,
  "from_user_id" bigint NOT NULL,
  "to_user_id" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()'
);

CREATE INDEX ON "users" ("name");

CREATE INDEX ON "users" ("email");

CREATE INDEX ON "keys" ("key_value");

CREATE INDEX ON "keys" ("user_id");

CREATE INDEX ON "transactions" ("from_user_id");

CREATE INDEX ON "transactions" ("to_user_id");

CREATE INDEX ON "transactions" ("from_user_id", "to_user_id");

ALTER TABLE "keys" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("from_user_id") REFERENCES "users" ("id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("to_user_id") REFERENCES "users" ("id");