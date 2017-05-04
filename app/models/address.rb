class Address < ApplicationRecord
	
  # def self.configuration_name
  #   puts "The database is address_repo_#{Rails.env}"

  #   "address_repo_#{Rails.env}"
  # end

  establish_connection "address_repo_#{Rails.env}".to_sym
end
