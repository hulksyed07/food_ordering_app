class MigrationConnection < ActiveRecord::Migration[5.0]

  # def self.connect_to_address_repo
  #   ActiveRecord::Base.establish_connection("address_repo_#{Rails.env}").connection
  # end


  # def self.connect_to_default 
  #   ActiveRecord::Base.establish_connection("#{Rails.env}").connection
  # end

  def connection
    @connection ||= ActiveRecord::Base.connection
  end

  def with_proper_connection
    @connection = Address.connection
    yield
    @connection = ActiveRecord::Base.connection
  end

end