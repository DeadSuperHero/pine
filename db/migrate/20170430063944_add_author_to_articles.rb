class AddAuthorToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :author, foreign_key: true
  end
end
