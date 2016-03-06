class RenameImageToTitle < ActiveRecord::Migration
  def change
    rename_column :tweets, :image, :title
  end
end
