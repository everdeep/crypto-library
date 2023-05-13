USE cryptodb;

-- Insert into roles
INSERT INTO roles (name, description) VALUES ('ADMIN', 'Administrator');
INSERT INTO roles (name, description) VALUES ('USER', 'User');

-- Insert into users table
INSERT INTO users (id, email, _password, is_admin) VALUES ('1', 'admin@admin.com', '$2b$12$F/EmqrDOVllQXDkO9xBXbexbwXVit/GuXOxSvAiQ3NrvPSwJCv7VK', 1);

-- Insert into Address table
INSERT INTO addresses (user_id, address_line_1, city, state, postal_code) VALUES ('1', '123 Main St', 'New York', 'NY', '10001');

-- Insert into portfolio table
INSERT INTO portfolios (user_id) VALUES ('1');

-- Insert into user roles
INSERT INTO roles_users (user_id, role_id) VALUES ('1', '1');

-- Insert into user_settings table
INSERT INTO user_settings (user_id, `key`, `value`) VALUES ('1', 'currency', 'USD');
INSERT INTO user_settings (user_id, `key`, `value`) VALUES ('1', 'timezone', 'America/New_York');
INSERT INTO user_settings (user_id, `key`, `value`) VALUES ('1', 'theme', 'dark');

-- Insert into balances table
INSERT INTO balances (portfolio_id, asset, free, locked, total) VALUES (1, 'BTC', 1.0, 0.0, 1.0);
INSERT INTO balances (portfolio_id, asset, free, locked, total) VALUES (1, 'ETH', 1.0, 0.0, 1.0);
INSERT INTO balances (portfolio_id, asset, free, locked, total) VALUES (1, 'IMX', 1.0, 0.0, 1.0);
INSERT INTO balances (portfolio_id, asset, free, locked, total) VALUES (1, 'USDT', 0.0, 5000.0, 10000.0);

-- Insert into watchlist table
INSERT INTO watchlists (user_id, currency_pair) VALUES (1, 'BTCUSDT');

-- Insert into orders table
INSERT INTO orders (user_id, currency_pair, order_id, exchange, cost, last_price, amount, side, status, type, is_autotraded, created_at) VALUES ('1', 'BTCUSDT', '1', 'BINANCE', 700, 7, 10, 'BUY', 'FILLED', 'MARKET', 0, "2018-01-01 00:00:00");
-- INSERT INTO orders (user_id, currency_pair, order_id, exchange, cost, last_price, amount, side, status, type, is_autotraded, created_at) VALUES ('1', 'BTCUSDT', '2', 'BINANCE', 1100, 11, 10, 'BUY', 'FILLED', 'MARKET', 0, "2022-03-01 00:00:00");
-- INSERT INTO orders (user_id, currency_pair, order_id, exchange, cost, last_price, amount, side, status, type, is_autotraded, created_at) VALUES ('1', 'BTCUSDT', '3', 'BINANCE', 1300, 13, 10, 'BUY', 'FILLED', 'MARKET', 0, "2022-07-01 00:00:00");
-- INSERT INTO orders (user_id, currency_pair, order_id, exchange, cost, last_price, amount, side, status, type, is_autotraded, created_at) VALUES ('1', 'ETHUSDT', '4', 'BINANCE', 200, 2, 10, 'SELL', 'FILLED', 'MARKET', 0, "2022-04-01 00:00:00");
-- INSERT INTO orders (user_id, currency_pair, order_id, exchange, cost, last_price, amount, side, status, type, is_autotraded, created_at) VALUES ('1', 'ETHUSDT', '5', 'BINANCE', 2400, 24, 10, 'BUY', 'NEW', 'MARKET', 0, "2023-01-17 00:00:00");
-- INSERT INTO orders (user_id, currency_pair, order_id, exchange, cost, last_price, amount, side, status, type, is_autotraded) VALUES ('1', 'BTCUSDT', '6', 'BINANCE', 500, 10, 5, 'SELL', 'NEW', 'MARKET', 0);
-- INSERT INTO orders (user_id, currency_pair, order_id, exchange, cost, last_price, amount, side, status, type, is_autotraded, limit_price) VALUES ('1', 'BTCUSDT', '7', 'BINANCE', 500, 10, 5, 'BUY', 'NEW', 'LIMIT', 0, 10);

-- Insert into symbols tablea
INSERT INTO symbols (symbol) VALUES ('BTC');
INSERT INTO symbols (symbol) VALUES ('ETH');
INSERT INTO symbols (symbol) VALUES ('IMX');
INSERT INTO symbols (symbol) VALUES ('BNB');
INSERT INTO symbols (symbol) VALUES ('XRP');
INSERT INTO symbols (symbol) VALUES ('USDT');

-- Insert into currency_pairs table
INSERT INTO currency_pairs (symbol, pair, currency_pair) VALUES ('BTC', 'USDT', 'BTCUSDT');
INSERT INTO currency_pairs (symbol, pair, currency_pair) VALUES ('ETH', 'USDT', 'ETHUSDT');
INSERT INTO currency_pairs (symbol, pair, currency_pair) VALUES ('IMX', 'USDT', 'IMXUSDT');
INSERT INTO currency_pairs (symbol, pair, currency_pair) VALUES ('BNB', 'USDT', 'BNBUSDT');
INSERT INTO currency_pairs (symbol, pair, currency_pair) VALUES ('XRP', 'USDT', 'XRPUSDT');

-- Insert into currency_pair_config table
INSERT INTO currency_pair_configs (user_id, currency_pair, bot_name, exchange, `interval`, strategy, `limit`, is_active, stop_loss, take_profit, allocated_balance, currency_free, currency_locked, asset_free, asset_locked) VALUES ('1', 'BTCUSDT', 'Active bot', 'BINANCE', 'MINUTE_1', 'BOLLINGER_BANDS', 1000, 1, 0.3, 0.3, 5000.0, 5000.0, 0.0, 0.0, 0.0);

-- Insert into signals table
INSERT INTO signals (currency_pair_config_id, `signal`) VALUES (1, 'HOLD');

-- Insert into strategy config table
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (1, 'BOLLINGER_BANDS', 'window', 20);
INSERT INTO strategy_configs (currency_pair_config_id, strategy, `key`, `value`) VALUES (1, 'BOLLINGER_BANDS', 'std', 2);
