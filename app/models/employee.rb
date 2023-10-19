class Employee < ApplicationRecord

	paginates_per 5
	validates :name, :phone_number, :date_of_birth, presence:true #comment 2
end
