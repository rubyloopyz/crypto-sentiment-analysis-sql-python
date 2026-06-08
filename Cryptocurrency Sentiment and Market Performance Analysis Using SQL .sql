CREATE DATABASE crypto_sentiment_analysis;

USE crypto_sentiment_analysis;

CREATE TABLE crypto_sentiment (
    timestamp DATETIME,
    cryptocurrency VARCHAR(50),
    current_price_usd DECIMAL(20,2),
    price_change_24h_percent DECIMAL(10,2),
    trading_volume_24h DECIMAL(20,2),
    market_cap_usd DECIMAL(20,2),
    social_sentiment_score DECIMAL(5,2),
    news_sentiment_score DECIMAL(5,2),
    news_impact_score DECIMAL(5,2),
    social_mentions_count INT,
    fear_greed_index DECIMAL(5,2),
    volatility_index DECIMAL(5,2),
    rsi_technical_indicator DECIMAL(5,2),
    prediction_confidence DECIMAL(5,2)
);

-- Count total records

SELECT COUNT(*)
FROM crypto_sentiment;


-- View first 10 rows

SELECT DISTINCT cryptocurrency
FROM crypto_sentiment;

-- View all cryptocurrencies

SELECT cryptocurrency,
COUNT(*) AS total_records
FROM crypto_sentiment
GROUP BY cryptocurrency;

-- Check for NULL values

SELECT cryptocurrency,
ROUND(AVG(current_price_usd),2) AS avg_price
FROM crypto_sentiment
GROUP BY cryptocurrency;

-- Check duplicate records

SELECT cryptocurrency,
MAX(current_price_usd) AS highest_price
FROM crypto_sentiment
GROUP BY cryptocurrency;

-- Average price by cryptocurrency

SELECT cryptocurrency,
MIN(current_price_usd) AS lowest_price
FROM crypto_sentiment
GROUP BY cryptocurrency;

-- Highest price by cryptocurrency

SELECT cryptocurrency,
ROUND(AVG(market_cap_usd),2) AS avg_market_cap
FROM crypto_sentiment
GROUP BY cryptocurrency;

-- Lowest price by cryptocurrency

SELECT *
FROM crypto_sentiment
ORDER BY market_cap_usd DESC
LIMIT 10;

-- Average 24-hour price change

SELECT cryptocurrency,
ROUND(AVG(social_sentiment_score),2)
AS avg_social_sentiment
FROM crypto_sentiment
GROUP BY cryptocurrency;

-- Best performing records

SELECT
cryptocurrency,
price_change_24h_percent
FROM crypto_sentiment
ORDER BY price_change_24h_percent DESC
LIMIT 10;

-- Best performing records

SELECT
cryptocurrency,
price_change_24h_percent
FROM crypto_sentiment
ORDER BY price_change_24h_percent DESC
LIMIT 10;

-- Average market cap

SELECT
cryptocurrency,
ROUND(AVG(market_cap_usd),2)
AS average_market_cap
FROM crypto_sentiment
GROUP BY cryptocurrency;


-- Top market cap observations

SELECT *
FROM crypto_sentiment
ORDER BY market_cap_usd DESC
LIMIT 10;

-- Average social sentiment score

SELECT
cryptocurrency,
ROUND(AVG(social_sentiment_score),2)
AS average_social_sentiment
FROM crypto_sentiment
GROUP BY cryptocurrency;


-- Most positive sentiment records

SELECT *
FROM crypto_sentiment
ORDER BY social_sentiment_score DESC
LIMIT 10;

-- Average news sentiment

SELECT
cryptocurrency,
ROUND(AVG(news_sentiment_score),2)
AS average_news_sentiment
FROM crypto_sentiment
GROUP BY cryptocurrency;


-- Highest news impact records

SELECT *
FROM crypto_sentiment
ORDER BY news_impact_score DESC
LIMIT 10;

-- Average social mentions

SELECT
cryptocurrency,
ROUND(AVG(social_mentions_count),0)
AS average_mentions
FROM crypto_sentiment
GROUP BY cryptocurrency;


-- Most discussed cryptocurrencies

SELECT *
FROM crypto_sentiment
ORDER BY social_mentions_count DESC
LIMIT 10;

-- Average fear and greed score

SELECT
cryptocurrency,
ROUND(AVG(fear_greed_index),2)
AS average_fear_greed
FROM crypto_sentiment
GROUP BY cryptocurrency;

-- Average fear and greed score

SELECT
cryptocurrency,
ROUND(AVG(fear_greed_index),2)
AS average_fear_greed
FROM crypto_sentiment
GROUP BY cryptocurrency;

-- Average RSI

SELECT
cryptocurrency,
ROUND(AVG(rsi_technical_indicator),2)
AS average_rsi
FROM crypto_sentiment
GROUP BY cryptocurrency;


-- Overbought condition

SELECT *
FROM crypto_sentiment
WHERE rsi_technical_indicator > 70;


-- Oversold condition

SELECT *
FROM crypto_sentiment
WHERE rsi_technical_indicator < 30;

-- Average prediction confidence

SELECT
cryptocurrency,
ROUND(AVG(prediction_confidence),2)
AS average_confidence
FROM crypto_sentiment
GROUP BY cryptocurrency;


-- Highest confidence records

SELECT *
FROM crypto_sentiment
ORDER BY prediction_confidence DESC
LIMIT 10;

-- Rank cryptocurrencies by average market cap

SELECT
cryptocurrency,
ROUND(AVG(market_cap_usd),2) AS avg_market_cap,
RANK() OVER(
ORDER BY AVG(market_cap_usd) DESC
) AS market_cap_rank
FROM crypto_sentiment
GROUP BY cryptocurrency;

-- Classify market sentiment

SELECT

cryptocurrency,

social_sentiment_score,

CASE

WHEN social_sentiment_score >= 0.7
THEN 'Positive'

WHEN social_sentiment_score >= 0.4
THEN 'Neutral'

ELSE 'Negative'

END AS sentiment_category

FROM crypto_sentiment;

SELECT COUNT(*) AS total_records
FROM crypto_sentiment;


-- KPI 2: Average Price

SELECT
cryptocurrency,
AVG(current_price_usd)
FROM crypto_sentiment
GROUP BY cryptocurrency;


-- KPI 3: Average Market Cap

SELECT
cryptocurrency,
AVG(market_cap_usd)
FROM crypto_sentiment
GROUP BY cryptocurrency;

-- KPI 4: Average Trading Volume

SELECT
cryptocurrency,
AVG(trading_volume_24h)
FROM crypto_sentiment
GROUP BY cryptocurrency;


-- KPI 5: Average Prediction Confidence

SELECT
cryptocurrency,
AVG(prediction_confidence)
FROM crypto_sentiment
GROUP BY cryptocurrency;

