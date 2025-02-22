# frozen_string_literal: true

module Coinbase
  module Advanced
    API_ENV_KEY = "COINBASE_API_KEY"
    API_SECRET_ENV_KEY = "COINBASE_API_SECRET"
    USER_AGENT = "coinbase-advanced-rb/0.0.1"

    # REST Constants
    BASE_URL = "api.coinbase.com"
    API_PREFIX = "/api/v3/brokerage"

    # Websocket Constants
    WS_BASE_URL = "wss://advanced-trade-ws.coinbase.com"
    WS_USER_BASE_URL = "wss://advanced-trade-ws-user.coinbase.com"

    WS_RETRY_MAX = 5
    WS_RETRY_BASE = 5
    WS_RETRY_FACTOR = 1.5

    # Message Types
    SUBSCRIBE_MESSAGE_TYPE = "subscribe"
    UNSUBSCRIBE_MESSAGE_TYPE = "unsubscribe"

    # Channels
    HEARTBEATS = "heartbeats"
    CANDLES = "candles"
    MARKET_TRADES = "market_trades"
    STATUS = "status"
    TICKER = "ticker"
    TICKER_BATCH = "ticker_batch"
    LEVEL2 = "level2"
    USER = "user"
    FUTURES_BALANCE_SUMMARY = "futures_balance_summary"

    # WS_AUTH_CHANNELS = {USER, FUTURES_BALANCE_SUMMARY}

    # X_RATELIMIT_LIMIT = "x-ratelimit-limit"
    # X_RATELIMIT_REMAINING = "x-ratelimit-remaining"
    # X_RATELIMIT_RESET = "x-ratelimit-reset"
    # RATE_LIMIT_HEADERS = {X_RATELIMIT_LIMIT, X_RATELIMIT_REMAINING, X_RATELIMIT_RESET}
  end
end
