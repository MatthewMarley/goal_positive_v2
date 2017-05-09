class CreateChainCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :chain_categories do |t|
      t.integer :chain_id
      t.integer :category_id
      t.timestamps
    end
  end
end
