require "radiant-heroku_dalli-extension"
require "active_support/cache/dalli_store23"
require "action_controller/session/dalli_store"


class HerokuDalliExtension < Radiant::Extension
  version     RadiantHerokuDalliExtension::VERSION
  description RadiantHerokuDalliExtension::DESCRIPTION
  url         RadiantHerokuDalliExtension::URL

  extension_config do |config|
    begin
      unless ENV['MEMCACHE_SERVERS'].nil?
        require "radiant_cache"

        config.cache_store = :dalli_store
        config.action_controller.session_store = :dalli_store

        config.middleware.delete ::Radiant::Cache
        config.middleware.use ::Radiant::Cache,
          :metastore   => "memcached://#{ENV['MEMCACHE_SERVERS']}/meta",
          :entitystore => "memcached://#{ENV['MEMCACHE_SERVERS']}/body"

        # Compression tip from http://www.randomhacks.net/articles/2011/06/03/heroku-celadon-cedar-review
        config.middleware.insert_before ActionController::Failsafe, Rack::Deflater
      end
    rescue HerokuDalli::SomeErrorsWereReported => e
      puts %{Dalli #{e}. Is the Heroku memcache addon installed? http://devcenter.heroku.com/articles/memcache#deploying_to_heroku}
    end
  end
end
