class AddKeypointToRecap < ActiveRecord::Migration[6.1]
  def change
    add_column :recaps, :keypoint, :text
  end
end
