class AddNametoAuthor < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :name, :string
  end
end
