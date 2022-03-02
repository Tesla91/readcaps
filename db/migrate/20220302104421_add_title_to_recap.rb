class AddTitleToRecap < ActiveRecord::Migration[6.1]
  def change
    add_column :recaps, :title, :string
  end
end
