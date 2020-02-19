import Config

config :tilex, :env, "prod"

config :tilex, TilexWeb.Endpoint,
  http: [port: System.get_env("PORT"), compress: true],
  url: [host: System.get_env("HOST"), scheme: "https", port: 443],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: true

config :tilex, Tilex.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

config :tilex, :organization_name, System.get_env("ORGANIZATION_NAME")
config :tilex, :canonical_domain, System.get_env("CANONICAL_DOMAIN")
config :tilex, :default_twitter_handle, System.get_env("DEFAULT_TWITTER_HANDLE")
config :tilex, :cors_origin, System.get_env("CORS_ORIGIN")
config :tilex, :hosted_domain, System.get_env("HOSTED_DOMAIN")
config :tilex, :guest_author_whitelist, System.get_env("GUEST_AUTHOR_WHITELIST")
config :tilex, :date_display_tz, System.get_env("DATE_DISPLAY_TZ")
config :tilex, :imgur_client_id, System.get_env("IMGUR_CLIENT_ID")

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

config :extwitter, :oauth,
  consumer_key: System.get_env("twitter_consumer_key"),
  consumer_secret: System.get_env("twitter_consumer_secret"),
  access_token: System.get_env("twitter_access_token"),
  access_token_secret: System.get_env("twitter_access_token_secret")

if System.get_env("ENABLE_BASIC_AUTH") do
  config :tilex, :basic_auth,
    realm: "tilex",
    username: System.get_env("BASIC_AUTH_USERNAME"),
    password: System.get_env("BASIC_AUTH_PASSWORD")
end

config :tilex, :ga_identifier, System.get_env("GA_IDENTIFIER")
config :tilex, :request_tracking, System.get_env("REQUEST_TRACKING")
