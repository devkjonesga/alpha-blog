class AddUpdatedAtToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :updated_at, :datetime
  end
end
