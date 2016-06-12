class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.date :birthdate
      t.integer :weight
      t.integer :sex
      t.text :free_comment

      t.timestamps null: false
    end
  end
end
