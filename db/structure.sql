CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime(6), "remember_created_at" datetime(6), "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "name" varchar);
CREATE TABLE sqlite_sequence(name,seq);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE IF NOT EXISTS "incomes" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "monthly_income" float, "month" integer, "user_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "year" integer, CONSTRAINT "fk_rails_e53b3fa7c7"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_incomes_on_user_id" ON "incomes" ("user_id");
CREATE TABLE IF NOT EXISTS "expenses" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "expense_value" float, "category" integer DEFAULT 0, "user_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "month" integer, "year" integer, CONSTRAINT "fk_rails_c3ee69df61"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_expenses_on_user_id" ON "expenses" ("user_id");
CREATE TABLE IF NOT EXISTS "goals" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "fixed_cost" integer, "comfort" integer, "goals" integer, "pleasures" integer, "financial_freedom" integer, "knowledge" integer, "user_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_c5fd9c8a38"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_goals_on_user_id" ON "goals" ("user_id");
CREATE TABLE IF NOT EXISTS "investment_launches" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "asset_type" integer NOT NULL, "coin_type" integer DEFAULT 0 NOT NULL, "asset_name" varchar NOT NULL, "order_type" integer NOT NULL, "order_date" date NOT NULL, "quantity" float NOT NULL, "unitary_price" float NOT NULL, "order_total_value" float NOT NULL, "broker" varchar NOT NULL, "observation" text, "user_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_39ff11f6d7"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_investment_launches_on_user_id" ON "investment_launches" ("user_id");
INSERT INTO "schema_migrations" (version) VALUES
('20250904211140'),
('20241002154829'),
('20240918160626'),
('20240619200108'),
('20240619195815'),
('20240619194544'),
('20240619193838'),
('20240619152405');

