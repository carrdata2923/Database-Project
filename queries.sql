-- Find the stock symbol of a company
SELECT "stock_symbol"
FROM "StockSymbols"
WHERE "company_name" = "Apple Inc."
);

-- Retrieve price data for a specific date range
SELECT "stock_symbol", "open_price", "close_price"
FROM "StockPriceHistory"
WHERE "trade_date" BETWEEN "2025-01-01" AND "2025-03-31"
);

-- Find the industry ID based on the name of the industry
SELECT "industry_id"
FROM "industries"
WHERE "industry_name" = "Auto Manufactures"
);

--Find all company names from a given industry like "Technology"
SELECT "company_name"
FROM "StockSymbols"
JOIN "StockIndustries" ON "StockIndustries"("stock_symbol") = "StockSymbols"("stock_symbol")
WHERE "StockIndustries"("industry_id") = (
    SELECT "industry_id"
    FROM "Industries"
    WHERE "industry_name" = "Technology"
);


-- Add Stock Price Data for APPL on 2025-04-21 (manually)
INSERT INTO "StockPriceHistory" ("stock_symbol"
                                 "trade_date",
                                 "open_price",
                                 "high_price",
                                 "low_price",
                                 "close_price",
                                 "adjusted_close",
                                 "volume")
VALUES ("APPL",
        "2025-04-21",
        "198.02",
        "198.80",
        "197.13",
        "197.99",
        "197.99",
        "51334300")
;

-- Comment: It is very unrealistic that I will be introducing one by one all prices and volumes myself. They best way to insert a vast amount of stock data into is by using
-- python and one of its libraries like yfinance to extract it.

-- Add a new industry
INSERT INTO "Industries" ("industry_name")
VALUES ("Semiconductors");

-- Add a new company
INSERT INTO "StockSymbols" ("stock_symbol", "company_name")
VALUES ("NVDA", "NVIDIA Corporation");

-- Add a relationship between a stock and an industry
INSERT INTO "StockIndustries" ("stock_symbol", "industry_id")
VALUES ("NVDA", (
    SELECT "industry_id"
    FROM "Industries"
    WHERE "industry_name" = "Semiconductors"))
;


