if RUBY_VERSION.match(/^1.8/)
  raise Gem::VerificationError, "xmysql2psql requires ruby which version >= 1.9.x"
end

source 'https://rubygems.org'

gem 'mysql-pr'
gem 'postgres-pr'

platforms :jruby do
  gem 'activerecord'
  gem 'jdbc-postgres'
  gem 'activerecord-jdbc-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
end

platforms :mri_19 do
  gem 'pg'
  gem 'mysql2'
end

gem 'test-unit'
