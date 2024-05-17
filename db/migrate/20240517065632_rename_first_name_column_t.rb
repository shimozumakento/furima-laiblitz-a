class RenameFirstNameColumnT < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :first_name, :family_name
  end
end
