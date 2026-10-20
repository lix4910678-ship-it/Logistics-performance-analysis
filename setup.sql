BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS carriers (
    carrier_id TEXT PRIMARY KEY,
    carrier_name TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS orders (
    order_id TEXT PRIMARY KEY,
    carrier_id TEXT NOT NULL,
    region TEXT NOT NULL,
    ship_date TEXT NOT NULL,
    promised_date TEXT NOT NULL,
    delivered_date TEXT,
    shipping_cost REAL NOT NULL CHECK (shipping_cost >= 0),
    FOREIGN KEY (carrier_id) REFERENCES carriers(carrier_id)
);
INSERT INTO "carriers" ("carrier_id","carrier_name") VALUES ('C01','Carrier A');
INSERT INTO "carriers" ("carrier_id","carrier_name") VALUES ('C02','Carrier B');
INSERT INTO "carriers" ("carrier_id","carrier_name") VALUES ('C03','Carrier C');
INSERT INTO "orders" ("order_id","carrier_id","region","ship_date","promised_date","delivered_date","shipping_cost") VALUES ('O001','C01','Los Angeles','2026-09-01','2026-09-03','2026-09-03',12.5);
INSERT INTO "orders" ("order_id","carrier_id","region","ship_date","promised_date","delivered_date","shipping_cost") VALUES ('O002','C01','San Diego','2026-09-01','2026-09-04','2026-09-05',15.0);
INSERT INTO "orders" ("order_id","carrier_id","region","ship_date","promised_date","delivered_date","shipping_cost") VALUES ('O003','C02','Los Angeles','2026-09-02','2026-09-04','2026-09-04',10.0);
INSERT INTO "orders" ("order_id","carrier_id","region","ship_date","promised_date","delivered_date","shipping_cost") VALUES ('O004','C02','San Bernardino','2026-09-02','2026-09-04','2026-09-06',9.5);
INSERT INTO "orders" ("order_id","carrier_id","region","ship_date","promised_date","delivered_date","shipping_cost") VALUES ('O005','C03','San Diego','2026-09-03','2026-09-06','2026-09-05',18.0);
INSERT INTO "orders" ("order_id","carrier_id","region","ship_date","promised_date","delivered_date","shipping_cost") VALUES ('O006','C03','San Bernardino','2026-09-03','2026-09-05','2026-09-05',14.0);
COMMIT;
