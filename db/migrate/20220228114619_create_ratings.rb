class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.text :comment
      t.integer :star
      t.references :user, null: false, foreign_key: true
      t.references :recap, null: false, foreign_key: true

      t.timestamps
    end
  end
end
