class CreateRecaps < ActiveRecord::Migration[6.1]
  def change
    create_table :recaps do |t|
      t.text :summary
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
