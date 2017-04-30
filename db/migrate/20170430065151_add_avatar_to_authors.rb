class AddAvatarToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :avatar, :string
  end
end
