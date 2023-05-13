USE cryptodb;

-- Bot testing datta
INSERT INTO users (id, email, _password, is_admin) VALUES ('2', 'bot1@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('3', 'bot2@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('4', 'bot3@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('5', 'bot4@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('6', 'bot5@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('7', 'bot6@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('8', 'bot7@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('9', 'bot8@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('10', 'bot9@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('11', 'bot10@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('12', 'bot11@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('13', 'bot12@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('14', 'bot13@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('15', 'bot14@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('16', 'bot15@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);
INSERT INTO users (id, email, _password, is_admin) VALUES ('17', 'bot16@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 0);

-- Binance API keys
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('1', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('2', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('3', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('4', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('5', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('6', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('7', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('8', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('9', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('10', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('11', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('12', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('13', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('14', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('15', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('16', 'BINANCE', '', '');
INSERT INTO api_keys (user_id, exchange, api_key, api_secret) VALUES ('17', 'BINANCE', '', '');

-- Insert into portfolio table
INSERT INTO portfolios (id, user_id, total_cost) VALUES (2, '2', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (3, '3', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (4, '4', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (5, '5', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (6, '6', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (7, '7', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (8, '8', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (9, '9', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (10, '10', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (11, '11', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (12, '12', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (13, '13', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (14, '14', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (15, '15', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (16, '16', 0);
INSERT INTO portfolios (id, user_id, total_cost) VALUES (17, '17', 0);

-- Insert into balances table
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (2, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (3, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (4, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (5, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (6, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (7, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (8, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (9, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (10, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (11, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (12, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (13, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (14, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (15, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (16, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);
INSERT INTO balances (portfolio_id, exchange, asset, free, locked, total) VALUES (17, 'BINANCE', 'USDT', 0.0, 25000.0, 25000.0);

-- Insert into currency_pair_configs table
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('2', 'BTCUSDT', 'BOT A - BTC', 'BINANCE', 'MINUTE_1', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('2', 'ETHUSDT', 'BOT A - ETH', 'BINANCE', 'MINUTE_1', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('2', 'IMXUSDT', 'BOT A - IMX', 'BINANCE', 'MINUTE_1', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('2', 'BNBUSDT', 'BOT A - BNB', 'BINANCE', 'MINUTE_1', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('2', 'XRPUSDT', 'BOT A - XRP', 'BINANCE', 'MINUTE_1', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('3', 'BTCUSDT', 'BOT B - BTC', 'BINANCE', 'MINUTE_15', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('3', 'ETHUSDT', 'BOT B - ETH', 'BINANCE', 'MINUTE_15', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('3', 'IMXUSDT', 'BOT B - IMX', 'BINANCE', 'MINUTE_15', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('3', 'BNBUSDT', 'BOT B - BNB', 'BINANCE', 'MINUTE_15', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('3', 'XRPUSDT', 'BOT B - XRP', 'BINANCE', 'MINUTE_15', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('4', 'BTCUSDT', 'BOT C - BTC', 'BINANCE', 'MINUTE_30', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('4', 'ETHUSDT', 'BOT C - ETH', 'BINANCE', 'MINUTE_30', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('4', 'IMXUSDT', 'BOT C - IMX', 'BINANCE', 'MINUTE_30', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('4', 'BNBUSDT', 'BOT C - BNB', 'BINANCE', 'MINUTE_30', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('4', 'XRPUSDT', 'BOT C - XRP', 'BINANCE', 'MINUTE_30', 1, 'MACD', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('5', 'BTCUSDT', 'BOT D - BTC', 'BINANCE', 'MINUTE_1', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('5', 'ETHUSDT', 'BOT D - ETH', 'BINANCE', 'MINUTE_1', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('5', 'IMXUSDT', 'BOT D - IMX', 'BINANCE', 'MINUTE_1', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('5', 'BNBUSDT', 'BOT D - BNB', 'BINANCE', 'MINUTE_1', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('5', 'XRPUSDT', 'BOT D - XRP', 'BINANCE', 'MINUTE_1', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('6', 'BTCUSDT', 'BOT E - BTC', 'BINANCE', 'MINUTE_15', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('6', 'ETHUSDT', 'BOT E - ETH', 'BINANCE', 'MINUTE_15', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('6', 'IMXUSDT', 'BOT E - IMX', 'BINANCE', 'MINUTE_15', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('6', 'BNBUSDT', 'BOT E - BNB', 'BINANCE', 'MINUTE_15', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('6', 'XRPUSDT', 'BOT E - XRP', 'BINANCE', 'MINUTE_15', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('7', 'BTCUSDT', 'BOT F - BTC', 'BINANCE', 'MINUTE_30', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('7', 'ETHUSDT', 'BOT F - ETH', 'BINANCE', 'MINUTE_30', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('7', 'IMXUSDT', 'BOT F - IMX', 'BINANCE', 'MINUTE_30', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('7', 'BNBUSDT', 'BOT F - BNB', 'BINANCE', 'MINUTE_30', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('7', 'XRPUSDT', 'BOT F - XRP', 'BINANCE', 'MINUTE_30', 1, 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('8', 'BTCUSDT', 'BOT G - BTC', 'BINANCE', 'MINUTE_15', 1, 'WILLIAMS_R', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('8', 'ETHUSDT', 'BOT G - ETH', 'BINANCE', 'MINUTE_15', 1, 'WILLIAMS_R', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('8', 'IMXUSDT', 'BOT G - IMX', 'BINANCE', 'MINUTE_15', 1, 'WILLIAMS_R', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('8', 'BNBUSDT', 'BOT G - BNB', 'BINANCE', 'MINUTE_15', 1, 'WILLIAMS_R', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('8', 'XRPUSDT', 'BOT G - XRP', 'BINANCE', 'MINUTE_15', 1, 'WILLIAMS_R', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('9', 'BTCUSDT', 'BOT H - BTC', 'BINANCE', 'MINUTE_30', 1, 'WILLIAMS_R', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('9', 'ETHUSDT', 'BOT H - ETH', 'BINANCE', 'MINUTE_30', 1, 'WILLIAMS_R', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('9', 'IMXUSDT', 'BOT H - IMX', 'BINANCE', 'MINUTE_30', 1, 'WILLIAMS_R', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('9', 'BNBUSDT', 'BOT H - BNB', 'BINANCE', 'MINUTE_30', 1, 'WILLIAMS_R', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('9', 'XRPUSDT', 'BOT H - XRP', 'BINANCE', 'MINUTE_30', 1, 'WILLIAMS_R', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('10', 'BTCUSDT', 'BOT I - BTC', 'BINANCE', 'MINUTE_15', 1, 'STOCHASTIC_OSCILLATOR', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('10', 'ETHUSDT', 'BOT I - ETH', 'BINANCE', 'MINUTE_15', 1, 'STOCHASTIC_OSCILLATOR', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('10', 'IMXUSDT', 'BOT I - IMX', 'BINANCE', 'MINUTE_15', 1, 'STOCHASTIC_OSCILLATOR', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('10', 'BNBUSDT', 'BOT I - BNB', 'BINANCE', 'MINUTE_15', 1, 'STOCHASTIC_OSCILLATOR', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('10', 'XRPUSDT', 'BOT I - XRP', 'BINANCE', 'MINUTE_15', 1, 'STOCHASTIC_OSCILLATOR', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('11', 'BTCUSDT', 'BOT J - BTC', 'BINANCE', 'MINUTE_30', 1, 'STOCHASTIC_OSCILLATOR', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('11', 'ETHUSDT', 'BOT J - ETH', 'BINANCE', 'MINUTE_30', 1, 'STOCHASTIC_OSCILLATOR', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('11', 'IMXUSDT', 'BOT J - IMX', 'BINANCE', 'MINUTE_30', 1, 'STOCHASTIC_OSCILLATOR', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('11', 'BNBUSDT', 'BOT J - BNB', 'BINANCE', 'MINUTE_30', 1, 'STOCHASTIC_OSCILLATOR', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('11', 'XRPUSDT', 'BOT J - XRP', 'BINANCE', 'MINUTE_30', 1, 'STOCHASTIC_OSCILLATOR', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('12', 'BTCUSDT', 'BOT K - BTC', 'BINANCE', 'MINUTE_1', 1, 'AVERAGE_DIRECTIONAL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('12', 'ETHUSDT', 'BOT K - ETH', 'BINANCE', 'MINUTE_1', 1, 'AVERAGE_DIRECTIONAL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('12', 'IMXUSDT', 'BOT K - IMX', 'BINANCE', 'MINUTE_1', 1, 'AVERAGE_DIRECTIONAL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('12', 'BNBUSDT', 'BOT K - BNB', 'BINANCE', 'MINUTE_1', 1, 'AVERAGE_DIRECTIONAL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('12', 'XRPUSDT', 'BOT K - XRP', 'BINANCE', 'MINUTE_1', 1, 'AVERAGE_DIRECTIONAL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('13', 'BTCUSDT', 'BOT L - BTC', 'BINANCE', 'MINUTE_15', 1, 'AVERAGE_DIRECTIONAL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('13', 'ETHUSDT', 'BOT L - ETH', 'BINANCE', 'MINUTE_15', 1, 'AVERAGE_DIRECTIONAL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('13', 'IMXUSDT', 'BOT L - IMX', 'BINANCE', 'MINUTE_15', 1, 'AVERAGE_DIRECTIONAL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('13', 'BNBUSDT', 'BOT L - BNB', 'BINANCE', 'MINUTE_15', 1, 'AVERAGE_DIRECTIONAL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('13', 'XRPUSDT', 'BOT L - XRP', 'BINANCE', 'MINUTE_15', 1, 'AVERAGE_DIRECTIONAL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('14', 'BTCUSDT', 'BOT M - BTC', 'BINANCE', 'MINUTE_1', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('14', 'ETHUSDT', 'BOT M - ETH', 'BINANCE', 'MINUTE_1', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('14', 'IMXUSDT', 'BOT M - IMX', 'BINANCE', 'MINUTE_1', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('14', 'BNBUSDT', 'BOT M - BNB', 'BINANCE', 'MINUTE_1', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('14', 'XRPUSDT', 'BOT M - XRP', 'BINANCE', 'MINUTE_1', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);


INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('15', 'BTCUSDT', 'BOT N - BTC', 'BINANCE', 'MINUTE_15', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('15', 'ETHUSDT', 'BOT N - ETH', 'BINANCE', 'MINUTE_15', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('15', 'IMXUSDT', 'BOT N - IMX', 'BINANCE', 'MINUTE_15', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('15', 'BNBUSDT', 'BOT N - BNB', 'BINANCE', 'MINUTE_15', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('15', 'XRPUSDT', 'BOT N - XRP', 'BINANCE', 'MINUTE_15', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('16', 'BTCUSDT', 'BOT O - BTC', 'BINANCE', 'HOUR_2', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('16', 'ETHUSDT', 'BOT O - ETH', 'BINANCE', 'HOUR_2', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('16', 'IMXUSDT', 'BOT O - IMX', 'BINANCE', 'HOUR_2', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('16', 'BNBUSDT', 'BOT O - BNB', 'BINANCE', 'HOUR_2', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('16', 'XRPUSDT', 'BOT O - XRP', 'BINANCE', 'HOUR_2', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('17', 'BTCUSDT', 'BOT P - BTC', 'BINANCE', 'HOUR_2', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('17', 'ETHUSDT', 'BOT P - ETH', 'BINANCE', 'HOUR_2', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('17', 'IMXUSDT', 'BOT P - IMX', 'BINANCE', 'HOUR_2', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('17', 'BNBUSDT', 'BOT P - BNB', 'BINANCE', 'HOUR_2', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, tradeable, strategy, `limit`, is_active, stop_loss, take_profit, currency_free, currency_locked, asset_free, asset_locked) VALUES ('17', 'XRPUSDT', 'BOT P - XRP', 'BINANCE', 'HOUR_2', 1, 'COMMODITY_CHANNEL_INDEX', 1000, 1, 0.3, 0.3, 5000.0, 0.0, 0.0, 0.0);

-- Insert signals with the HOLD signal for all currency pairs
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (2, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (3, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (4, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (5, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (6, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (7, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (8, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (9, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (10, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (11, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (12, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (13, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (14, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (15, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (16, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (17, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (18, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (19, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (20, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (21, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (22, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (23, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (24, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (25, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (26, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (27, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (28, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (29, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (30, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (31, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (32, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (33, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (34, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (35, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (36, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (37, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (38, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (39, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (40, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (41, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (42, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (43, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (44, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (45, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (46, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (47, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (48, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (49, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (50, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (51, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (52, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (53, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (54, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (55, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (56, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (57, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (58, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (59, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (60, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (61, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (62, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (63, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (64, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (65, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (66, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (67, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (68, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (69, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (70, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (71, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (72, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (73, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (74, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (75, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (76, 'HOLD');

INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (77, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (78, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (79, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (80, 'HOLD');
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (81, 'HOLD');


-- Insert into strategy config table
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (2, 'MACD', 'short_window', 14);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (2, 'MACD', 'long_window', 29);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (2, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (3, 'MACD', 'short_window', 14);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (3, 'MACD', 'long_window', 29);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (3, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (4, 'MACD', 'short_window', 14);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (4, 'MACD', 'long_window', 29);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (4, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (5, 'MACD', 'short_window', 14);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (5, 'MACD', 'long_window', 29);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (5, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (6, 'MACD', 'short_window', 14);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (6, 'MACD', 'long_window', 29);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (6, 'MACD', 'signal_window', 1);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (7, 'MACD', 'short_window', 38);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (7, 'MACD', 'long_window', 9);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (7, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (8, 'MACD', 'short_window', 38);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (8, 'MACD', 'long_window', 9);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (8, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (9, 'MACD', 'short_window', 38);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (9, 'MACD', 'long_window', 9);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (9, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (10, 'MACD', 'short_window', 38);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (10, 'MACD', 'long_window', 9);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (10, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (11, 'MACD', 'short_window', 38);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (11, 'MACD', 'long_window', 9);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (11, 'MACD', 'signal_window', 1);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (12, 'MACD', 'short_window', 29);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (12, 'MACD', 'long_window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (12, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (13, 'MACD', 'short_window', 29);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (13, 'MACD', 'long_window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (13, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (14, 'MACD', 'short_window', 29);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (14, 'MACD', 'long_window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (14, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (15, 'MACD', 'short_window', 29);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (15, 'MACD', 'long_window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (15, 'MACD', 'signal_window', 1);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (16, 'MACD', 'short_window', 29);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (16, 'MACD', 'long_window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (16, 'MACD', 'signal_window', 1);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (17, 'BOLLINGER_BANDS', 'window', 19);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (17, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (18, 'BOLLINGER_BANDS', 'window', 19);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (18, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (19, 'BOLLINGER_BANDS', 'window', 19);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (19, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (20, 'BOLLINGER_BANDS', 'window', 19);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (20, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (21, 'BOLLINGER_BANDS', 'window', 19);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (21, 'BOLLINGER_BANDS', 'std', 2);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (22, 'BOLLINGER_BANDS', 'window', 21);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (22, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (23, 'BOLLINGER_BANDS', 'window', 21);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (23, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (24, 'BOLLINGER_BANDS', 'window', 21);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (24, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (25, 'BOLLINGER_BANDS', 'window', 21);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (25, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (26, 'BOLLINGER_BANDS', 'window', 21);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (26, 'BOLLINGER_BANDS', 'std', 2);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (27, 'BOLLINGER_BANDS', 'window', 7);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (27, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (28, 'BOLLINGER_BANDS', 'window', 7);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (28, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (29, 'BOLLINGER_BANDS', 'window', 7);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (29, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (30, 'BOLLINGER_BANDS', 'window', 7);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (30, 'BOLLINGER_BANDS', 'std', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (31, 'BOLLINGER_BANDS', 'window', 7);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (31, 'BOLLINGER_BANDS', 'std', 2);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (32, 'WILLIAMS_R', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (33, 'WILLIAMS_R', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (34, 'WILLIAMS_R', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (35, 'WILLIAMS_R', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (36, 'WILLIAMS_R', 'window', 3);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (37, 'WILLIAMS_R', 'window', 11);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (38, 'WILLIAMS_R', 'window', 11);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (39, 'WILLIAMS_R', 'window', 11);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (40, 'WILLIAMS_R', 'window', 11);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (41, 'WILLIAMS_R', 'window', 11);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (42, 'STOCHASTIC_OSCILLATOR', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (43, 'STOCHASTIC_OSCILLATOR', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (44, 'STOCHASTIC_OSCILLATOR', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (45, 'STOCHASTIC_OSCILLATOR', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (46, 'STOCHASTIC_OSCILLATOR', 'window', 3);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (47, 'STOCHASTIC_OSCILLATOR', 'window', 11);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (48, 'STOCHASTIC_OSCILLATOR', 'window', 11);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (49, 'STOCHASTIC_OSCILLATOR', 'window', 11);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (50, 'STOCHASTIC_OSCILLATOR', 'window', 11);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (51, 'STOCHASTIC_OSCILLATOR', 'window', 11);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (52, 'AVERAGE_DIRECTIONAL_INDEX', 'window', 4);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (53, 'AVERAGE_DIRECTIONAL_INDEX', 'window', 4);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (54, 'AVERAGE_DIRECTIONAL_INDEX', 'window', 4);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (55, 'AVERAGE_DIRECTIONAL_INDEX', 'window', 4);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (56, 'AVERAGE_DIRECTIONAL_INDEX', 'window', 4);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (57, 'AVERAGE_DIRECTIONAL_INDEX', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (58, 'AVERAGE_DIRECTIONAL_INDEX', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (59, 'AVERAGE_DIRECTIONAL_INDEX', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (60, 'AVERAGE_DIRECTIONAL_INDEX', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (61, 'AVERAGE_DIRECTIONAL_INDEX', 'window', 3);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (62, 'COMMODITY_CHANNEL_INDEX', 'window', 4);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (63, 'COMMODITY_CHANNEL_INDEX', 'window', 4);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (64, 'COMMODITY_CHANNEL_INDEX', 'window', 4);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (65, 'COMMODITY_CHANNEL_INDEX', 'window', 4);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (66, 'COMMODITY_CHANNEL_INDEX', 'window', 4);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (67, 'COMMODITY_CHANNEL_INDEX', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (68, 'COMMODITY_CHANNEL_INDEX', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (69, 'COMMODITY_CHANNEL_INDEX', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (70, 'COMMODITY_CHANNEL_INDEX', 'window', 3);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (71, 'COMMODITY_CHANNEL_INDEX', 'window', 3);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (72, 'COMMODITY_CHANNEL_INDEX', 'window', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (73, 'COMMODITY_CHANNEL_INDEX', 'window', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (74, 'COMMODITY_CHANNEL_INDEX', 'window', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (75, 'COMMODITY_CHANNEL_INDEX', 'window', 2);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (76, 'COMMODITY_CHANNEL_INDEX', 'window', 2);

INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (77, 'COMMODITY_CHANNEL_INDEX', 'window', 14);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (78, 'COMMODITY_CHANNEL_INDEX', 'window', 14);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (79, 'COMMODITY_CHANNEL_INDEX', 'window', 14);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (80, 'COMMODITY_CHANNEL_INDEX', 'window', 14);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (81, 'COMMODITY_CHANNEL_INDEX', 'window', 14);