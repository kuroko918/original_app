class RenameNameToGenre < ActiveRecord::Migration
  def change
    rename_column :tweets, :name, :genre
  end
end
