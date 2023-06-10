DROP DATABASE IF EXISTS `cryptodata`;
CREATE DATABASE `cryptodata`;
USE `cryptodata`;

CREATE TABLE tickers (
    id INT NOT NULL AUTO_INCREMENT,
    symbol VARCHAR(20) NOT NULL,
    price_change DECIMAL(30, 10) NOT NULL,
    price_change_percent DECIMAL(30, 10) NOT NULL,
    weighted_average_price DECIMAL(30, 10) NOT NULL,
    trade_before_24h_window DECIMAL(30, 10) NOT NULL,
    last_price DECIMAL(30, 10) NOT NULL,
    last_quantity DECIMAL(30, 10) NOT NULL,
    best_bid_price DECIMAL(30, 10) NOT NULL,
    best_bid_quantity DECIMAL(30, 10) NOT NULL,
    best_ask_price DECIMAL(30, 10) NOT NULL,
    best_ask_quantity DECIMAL(30, 10) NOT NULL,
    open_price DECIMAL(30, 10) NOT NULL,
    high_price DECIMAL(30, 10) NOT NULL,
    low_price DECIMAL(30, 10) NOT NULL,
    total_traded_base_asset_volume DECIMAL(30, 10) NOT NULL,
    total_traded_quote_asset_volume DECIMAL(30, 10) NOT NULL,
    total_nr_of_trades DECIMAL(30, 10) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY (symbol),
    INDEX (symbol)
);

CREATE TABLE klines (
    id INT NOT NULL AUTO_INCREMENT,
    symbol VARCHAR(20) NOT NULL,
    kline_start_time DECIMAL(30, 10),
    kline_close_time DECIMAL(30, 10),
    `interval` VARCHAR(20) NOT NULL,
    first_trade_id DECIMAL(30, 10),
    last_trade_id DECIMAL(30, 10),
    open_price DECIMAL(30, 10) NOT NULL,
    close_price DECIMAL(30, 10) NOT NULL,
    high_price DECIMAL(30, 10) NOT NULL,
    low_price DECIMAL(30, 10) NOT NULL,
    base_volume DECIMAL(30, 10) NOT NULL,
    number_of_trades DECIMAL(30, 10) NOT NULL,
    is_closed BOOLEAN,
    quote DECIMAL(30, 10),
    taker_by_base_asset_volume DECIMAL(30, 10),
    taker_by_quote_asset_volume DECIMAL(30, 10),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY (symbol, `interval`),
    INDEX (symbol),
    INDEX (`interval`),
    INDEX (symbol, `interval`)
);

CREATE TABLE depth (
    id INT NOT NULL AUTO_INCREMENT,
    symbol VARCHAR(20) NOT NULL,
    depth_type VARCHAR(20) NOT NULL,
    
    ask_price DECIMAL(30, 10) NOT NULL,
    ask_quantity DECIMAL(30, 10) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY (symbol),
    INDEX (symbol)
);

CREATE TABLE bids (
    id INT NOT NULL AUTO_INCREMENT,
    depth_id INT NOT NULL,
    price DECIMAL(30, 10) NOT NULL,
    quantity DECIMAL(30, 10) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX (depth_id),
    FOREIGN KEY (depth_id) REFERENCES depth(id)
);

CREATE TABLE asks (
    id INT NOT NULL AUTO_INCREMENT,
    depth_id INT NOT NULL,
    price DECIMAL(30, 10) NOT NULL,
    quantity DECIMAL(30, 10) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX (depth_id),
    FOREIGN KEY (depth_id) REFERENCES depth(id)
);c