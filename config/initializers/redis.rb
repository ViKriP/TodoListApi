uri = ENV["REDISTOGO_URL"] || "redis://:@127.0.0.1:6379/0"
REDIS = Redis.new(url: uri)
