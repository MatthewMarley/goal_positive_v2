class CreateChains < ActiveRecord::Migration[5.0]
  def change
    create_table :chains do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.string :pledge
    end
  end
end
