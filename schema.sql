-- Represent stocks
CREATE TABLE "StockSymbols" (
    "stock_symbol" TEXT,
    "company_name" TEXT NOT NULL,
    PRIMARY KEY("stock_symbol")
);

-- Represent historical background of the stocks
CREATE TABLE "StockPriceHistory" (
    "stock_symbol" TEXT NOT NULL,
    "trade_date" TEXT NOT NULL,
    "open_price" REAL,
    "high_price" REAL,
    "low_price" REAL,
    "close_price" REAL,
    "adjusted_close" REAL,
    "volume" INTEGER
    PRIMARY KEY("stock_symbol", "trade_date")
    FOREIGN KEY("stock_symbol") REFERENCES "StockSymbols"("stock_symbol") ON DELETE RESTRICT
);

-- Represent industries
CREATE TABLE "Industries" (
    "industry_id" INTEGER,
    "industry_name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("industry_id" AUTOINCREMENT)
);

-- Represent junction table - stocks vs industries
CREATE TABLE "StockIndustries" (
    "stock_symbol" TEXT NOT NULL,
    "industry_id" INTEGER NOT NULL,
    PRIMARY KEY("stock_symbol", "industry_id")
    FOREIGN KEY("stock_symbol") REFERENCES "StockSymbols"("stock_symbol") ON DELETE RESTRICT
    FOREIGN KEY("industry_id") REFERENCES "Industries"("industry_id") ON DELETE RESTRICT
);


-- Create indexes to speed common searches
CREATE INDEX "company_name_search" ON "StockSymbols" ("company_name");
CREATE INDEX "trade_date_search" ON "StockPriceHistory" ("trade_date");
CREATE INDEX "industry_name_search" ON "Industries" ("industry_name");
CREATE INDEX "industry_stock_search" ON "StockIndustries" ("industry_id", "stock_symbol");

--CREATE INDEX "stock_date_search" ON "StockPriceHistory" ("stock_symbol", "trade_date");
--CREATE INDEX "stock_industry_search" ON "StockIndustries" ("stock_symbol", "industry_id");
--No need to create these two since they will be redundant.
--The database automatically creates those indexes when defining their respective PKs.
