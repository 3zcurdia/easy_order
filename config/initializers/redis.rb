if ENV["REDISCLOUD_URL"].present?
  $redis = Redis.new(url: ENV["REDISCLOUD_URL"])
else
  $redis = Redis.new
end
