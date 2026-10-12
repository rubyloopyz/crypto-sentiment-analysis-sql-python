# Cryptocurrency Sentiment & Market Performance Analysis

Does investor sentiment move crypto markets? This project analyses 2,063 market snapshots across 10 cryptocurrencies, combining social and news sentiment with price, volume and volatility data, using SQL and Python.

## Question

How do social sentiment, news sentiment and mention volume relate to price change, trading activity, market volatility and the prediction confidence score in the dataset?

## Dataset

- `crypto_sentiment_prediction_dataset.csv`: 2,063 rows, 10 cryptocurrencies, 4 Jun to 4 Jul 2025
- Fields: price, 24h price change, 24h trading volume, market cap, social and news sentiment scores, news impact, social mentions, fear and greed index, volatility index, RSI, prediction confidence

## Method

1. **SQL** (`Cryptocurrency Sentiment and Market Performance Analysis Using SQL .sql`): create the table, then profile the data and summarise it by cryptocurrency (record counts, average, highest and lowest price, market cap, 24h price change)
2. **Python** (`Cryptocurrency_Sentiment_Analysis_and_Visualization_Using_Python.ipynb`, `Cryptocurrency_Sentiment_Analysis_v2.ipynb`): exploratory analysis, correlations and visualisations with pandas and matplotlib

## Key findings

Pearson correlations computed from the dataset:

| Pair | r |
|---|---|
| Social sentiment vs 24h price change | 0.01 |
| News sentiment vs 24h price change | 0.02 |
| Social sentiment vs prediction confidence | 0.00 |
| Volatility index vs prediction confidence | 0.00 |
| Volatility index vs size of 24h price move | 0.69 |

- **Sentiment scores show almost no linear relationship with price movement** in this one-month sample. A null result like this is a useful finding: sentiment alone was not a reliable signal here.
- **Volatility is the strongest relationship in the data.** A higher volatility index goes with larger 24h price moves (r = 0.69), as expected.
- The prediction confidence score does not track sentiment or volatility.

## Limitations

- One month of data, so this cannot show how sentiment behaves across market cycles.
- Correlation only: no causal claims, and no lag between sentiment and price was tested.

## Tools

SQL (MySQL), Python, pandas, matplotlib, Jupyter.

