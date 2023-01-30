class CreatejoinTableEmployeeProduct < ActiveRecord::Migration[7.0]
  def change
    create_join_table :employees, :products do |t|
      # t.index [:employee_id, :product_id]
      # t.index [:product_id, :employee_id]
    end
  end
end
