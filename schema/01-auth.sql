CREATE TYPE COIN AS
(
    denom  TEXT,
    amount BIGINT
);

CREATE TABLE account
(
    address TEXT NOT NULL PRIMARY KEY
);

CREATE TABLE account_balance
(
    address TEXT   NOT NULL PRIMARY KEY REFERENCES account (address),
    coins   COIN[] NOT NULL DEFAULT '{}'
);

CREATE TABLE account_balance_history
(
    address   TEXT                        NOT NULL REFERENCES account (address),
    coins     COIN[]                      NOT NULL DEFAULT '{}',
    height    BIGINT                      NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    PRIMARY KEY (address, height)
);