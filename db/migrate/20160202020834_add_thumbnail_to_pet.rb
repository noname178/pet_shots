class AddThumbnailToPet < ActiveRecord::Migration
  def change
    add_column :pets, :thumbnail, :string
  end
end
