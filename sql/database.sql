
DROP DATABASE IF EXISTS `cryptodb`;
CREATE DATABASE `cryptodb`;
USE `cryptodb`;


-- Table for roles
CREATE TABLE roles (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    UNIQUE (name)
);

-- Table for storing the symbols
CREATE TABLE symbols (
    symbol VARCHAR(10) NOT NULL PRIMARY KEY
);

-- Table for storing the currently available currency pairs
CREATE TABLE currency_pairs (
    currency_pair VARCHAR(20) NOT NULL PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    pair VARCHAR(10) NOT NULL,
    UNIQUE (symbol, pair),
    CONSTRAINT fk_currency_pairs_symbols
        FOREIGN KEY (symbol)
        REFERENCES symbols(symbol)
        ON DELETE CASCADE
);

-- Table for storing the users
CREATE TABLE users (
    id VARCHAR(32) NOT NULL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    _password VARCHAR(128) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    username VARCHAR(128),
    dob DATE,
    phone VARCHAR(255),
    is_admin BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (email)
);

-- Table for storing user addresses
CREATE TABLE addresses (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id VARCHAR(32) NOT NULL,
    address_line_1 VARCHAR(255),
    address_line_2 VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    postal_code VARCHAR(255),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (user_id),
    INDEX (user_id),
    CONSTRAINT fk_addresses_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

-- Table for storing the user portfolio
CREATE TABLE portfolios (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id VARCHAR(32) NOT NULL,
    total_earnings DECIMAL(18, 8) NOT NULL DEFAULT 0,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (user_id),
    INDEX (user_id),
    CONSTRAINT fk_portfolios_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

-- Table for storing the balances of the users
CREATE TABLE balances (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    portfolio_id INT NOT NULL,
    asset VARCHAR(10) NOT NULL,
    free DECIMAL(18, 8) NOT NULL,
    locked DECIMAL(18, 8) NOT NULL,
    total DECIMAL(18, 8) NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (portfolio_id, asset),
    INDEX (portfolio_id, asset),
    INDEX (portfolio_id),
    CONSTRAINT fk_balances_portfolios
        FOREIGN KEY (portfolio_id)
        REFERENCES portfolios(id)
        ON DELETE CASCADE
);

-- Table for storing user roles
CREATE TABLE roles_users (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id VARCHAR(32) NOT NULL,
    role_id INT NOT NULL,
    UNIQUE (user_id, role_id),
    INDEX (user_id, role_id),
    INDEX (user_id),
    CONSTRAINT fk_roles_users_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_roles_users_roles
        FOREIGN KEY (role_id)
        REFERENCES roles(id)
        ON DELETE CASCADE
);

-- Table for storing the user settings
CREATE TABLE user_settings (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id VARCHAR(32) NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NOT NULL,
    UNIQUE (user_id, `key`),
    INDEX (user_id, `key`),
    INDEX (user_id),
    CONSTRAINT fk_user_settings_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

-- Table for storing the bot configurations
CREATE TABLE currency_pair_configs (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id VARCHAR(32) NOT NULL,
    currency_pair VARCHAR(20) NOT NULL,
    bot_name VARCHAR(255) NOT NULL,                                 -- bot name
    exchange VARCHAR(20) NOT NULL,                                  -- exchange name
    `interval` VARCHAR(10) NOT NULL,                                -- interval of the candlestick
    strategy VARCHAR(255) NOT NULL,                                 -- strategy used for the currency pair
    `limit` DECIMAL(18, 8) NOT NULL,                                -- limit of records to do analysis on
    stop_loss DECIMAL(5, 2),                                        -- stop loss percentage
    take_profit DECIMAL(5, 2),                                      -- take profit percentage
    earnings DECIMAL(18, 8) NOT NULL DEFAULT 0,                               -- earnings made by the bot
    allocated_balance DECIMAL(18, 8) NOT NULL,                      -- initial balance to start trading
    currency_free DECIMAL(18, 8) NOT NULL,                          -- amount of the base currency to trade
    currency_locked DECIMAL(18, 8) NOT NULL,                        -- amount of the base currency invested in the currency pair
    asset_free DECIMAL(18, 8) NOT NULL,                             -- amount of the quote currency to trade
    asset_locked DECIMAL(18, 8) NOT NULL,                           -- amount of the quote currency invested in the currency pair
    is_active BOOLEAN NOT NULL,                                     -- whether the currency pair is actively trading
    is_decommissioned BOOLEAN NOT NULL DEFAULT 0,                   -- whether the currency pair is decommissioned
    is_simulated BOOLEAN NOT NULL DEFAULT 1,                        -- whether the currency pair is simulated
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (user_id, currency_pair),
    UNIQUE (user_id, bot_name),
    INDEX (user_id, currency_pair),
    INDEX (user_id),
    INDEX (is_active),
    CONSTRAINT fk_currency_pair_configs_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

-- Table for storing the strategy configs
CREATE TABLE strategy_configs (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    currency_pair_config_id INT NOT NULL,
    strategy VARCHAR(255) NOT NULL,                                 -- strategy used for the currency pair
    `key` VARCHAR(255) NOT NULL,                                    -- key of the strategy config
    `value` VARCHAR(255) NOT NULL,                                   -- value of the strategy config
    CONSTRAINT fk_strategy_configs_currency_pair_configs
        FOREIGN KEY (currency_pair_config_id)
        REFERENCES currency_pair_configs(id)
        ON DELETE CASCADE
);

-- Table for storing the autotradeable currency pairs
CREATE TABLE signals (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    currency_pair_config_id INT NOT NULL,
    `signal` VARCHAR(10) NOT NULL DEFAULT 'HOLD',
    last_trade_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX (currency_pair_config_id),
    CONSTRAINT fk_signals_currency_pair_configs
        FOREIGN KEY (currency_pair_config_id)
        REFERENCES currency_pair_configs(id)
        ON DELETE CASCADE
);

-- Table for storing the users activity
CREATE TABLE server_activity (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `url` VARCHAR(255) NOT NULL,
    `endpoint` VARCHAR(128),
    ua_browser VARCHAR(16),
    ua_language VARCHAR(16),
    ua_platform VARCHAR(16),
    ua_version VARCHAR(16),
    blueprint VARCHAR(16),
    view_args VARCHAR(64),
    status INT NOT NULL,
    remote_addr VARCHAR(24),
    xforwardedfor VARCHAR(24),
    authorization BOOLEAN,
    ip_info JSON,
    `path` VARCHAR(32),
    speed FLOAT,
    `datetime` DATETIME NOT NULL,
    username VARCHAR(128),
    user_id VARCHAR(32),
    track_var VARCHAR(128),
    UNIQUE (id, user_id),
    INDEX (user_id),
    CONSTRAINT fk_server_activity_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
);

-- Table for storing the API keys
CREATE TABLE api_keys (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id VARCHAR(32) NOT NULL,
    exchange VARCHAR(20) NOT NULL,
    api_key VARCHAR(255) NOT NULL,
    api_secret VARCHAR(255) NOT NULL,
    UNIQUE (id, api_key),
    CONSTRAINT fk_api_keys_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

-- Table for users watchlist
CREATE TABLE watchlists (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id VARCHAR(32) NOT NULL,
    currency_pair VARCHAR(20) NOT NULL,
    UNIQUE (user_id, currency_pair),
    INDEX (user_id, currency_pair),
    INDEX (user_id),
    CONSTRAINT fk_watchlists_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

-- Table for storing the current open orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id VARCHAR(32),
    currency_pair VARCHAR(20) NOT NULL,
    order_id VARCHAR(255) NOT NULL,
    bot_id INT,
    exchange VARCHAR(20) NOT NULL,
    cost DECIMAL(18, 8) NOT NULL,
    last_price DECIMAL(18, 8) NOT NULL,
    amount DECIMAL(18, 8) NOT NULL,
    side VARCHAR(10) NOT NULL,
    status VARCHAR(10) NOT NULL,
    type VARCHAR(10) NOT NULL,
    limit_price DECIMAL(18, 8),
    is_autotraded BOOLEAN NOT NULL,
    is_simulated BOOLEAN NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (order_id),
    INDEX (order_id),
    INDEX (user_id),
    INDEX (bot_id),
    INDEX (user_id, bot_id),
    INDEX (user_id, currency_pair),
    INDEX (user_id, currency_pair, status),
    CONSTRAINT fk_orders_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_orders_currency_pair_configs
        FOREIGN KEY (bot_id)
        REFERENCES currency_pair_configs(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table for storing snapshots of the portfolio
CREATE TABLE portfolio_history (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    portfolio_id INT NOT NULL,
    total_earnings DECIMAL(18, 8) NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX (portfolio_id),
    CONSTRAINT fk_portfolio_history_portfolios
        FOREIGN KEY (portfolio_id)
        REFERENCES portfolios(id)
        ON DELETE CASCADE
);

-- Table for storing the snapshots of the balance
CREATE TABLE balance_history (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    balance_id INT NOT NULL,
    asset VARCHAR(10) NOT NULL,
    free DECIMAL(18, 8) NOT NULL,
    locked DECIMAL(18, 8) NOT NULL,
    total DECIMAL(18, 8) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX (balance_id),
    INDEX (balance_id, asset),
    CONSTRAINT fk_balance_history_balances
        FOREIGN KEY (balance_id)
        REFERENCES balances(id)
        ON DELETE CASCADE
);

