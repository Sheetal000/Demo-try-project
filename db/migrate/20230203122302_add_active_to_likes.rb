class AddActiveToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :active, :boolean
  end
end
