# Heroku Dalli

A simple extension to use Memcache on Heroku with Dalli.


## Installation

These instructions are for Radiant v1.0.0.rc4 or above which uses
Bundler.

Add the following to your Radiant Gemfile :

```
group :production do
  gem "radiant-heroku_dalli-extension", "~> 1.0.0"
end
```

Then run :

```
bundle install
```

Remember to enable memcahe for your Heroku install :

```
heroku addons:add memcache
```

More details on Heroku and Memcache :

http://devcenter.heroku.com/articles/memcache#deploying_to_heroku


## TO DO

- Write some tests
- Possibly merge with radiant-heroku_memcached-extension
