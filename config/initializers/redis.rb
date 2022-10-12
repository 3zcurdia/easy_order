# frozen_string_literal: true

REDIS = if ENV["REDISCLOUD_URL"].present?
          Redis.new(url: ENV["REDISCLOUD_URL"])
        else
          Redis.new
        end
