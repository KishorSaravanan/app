class AddNewColumnsToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :date_of_birth, :date
  end
end
