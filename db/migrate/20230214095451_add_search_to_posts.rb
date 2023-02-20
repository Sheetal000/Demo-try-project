class AddSearchToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :search, :string
  end
end
