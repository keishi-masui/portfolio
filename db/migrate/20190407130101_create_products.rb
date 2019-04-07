class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name,  null: false
      t.string :image
      t.text :comment
      t.string :language

      t.timestamps
    end
  end
end
