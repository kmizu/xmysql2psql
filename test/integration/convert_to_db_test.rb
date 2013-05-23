require 'test_helper'

require 'xmysql2psql'

class ConvertToDbTest < Test::Unit::TestCase

  class << self
    def startup
      seed_test_database
      @@options=get_test_config_by_label(:localmysql_to_db_convert_all)
      @@xmysql2psql = Xmysql2psql.new([@@options.filepath])
      @@xmysql2psql.convert
      @@xmysql2psql.writer.open
    end
    def shutdown
      @@xmysql2psql.writer.close
      delete_files_for_test_config(@@options)
    end
  end
  def setup
  end
  def teardown
  end

  def test_table_creation
    assert_true @@xmysql2psql.writer.exists?('numeric_types_basics')
  end

end