class AddNameProfileToPet < ActiveRecord::Migration
  def change
    add_column :pets, :name, :string
    add_column :pets, :profile, :text
  end
end
