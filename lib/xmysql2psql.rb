require 'xmysql2psql/errors'
require 'xmysql2psql/version'
require 'xmysql2psql/config'
require 'xmysql2psql/converter'
require 'xmysql2psql/mysql_reader'
require 'xmysql2psql/writer'
require 'xmysql2psql/postgres_writer'
require 'xmysql2psql/postgres_db_writer.rb'
require 'xmysql2psql/postgres_file_writer.rb'


class Xmysql2psql
  
  attr_reader :options, :reader, :writer
  
  def initialize(args)
    help if args.length==1 && args[0] =~ /^-.?|^-*he?l?p?$/i 
    configfile = args[0] || File.expand_path('xmysql2psql.yml')
    @options = Config.new( configfile, true )
  end
  
  def convert
    @reader = MysqlReader.new( options )

    if options.destfile(nil)
      @writer = PostgresFileWriter.new(options.destfile)
    else
      @writer = PostgresDbWriter.new(options)
    end

    Converter.new(reader, writer, options).convert
  end

  def help
    puts <<EOS
MySQL to PostgreSQL Conversion

EOS
    exit -2
  end
end