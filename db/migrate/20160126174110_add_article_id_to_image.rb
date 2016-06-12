class AddArticleIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :article_id, :integer
  end
end
