class RenameFirstNameKanaColumnT < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :first_name_kana, :family_name_kana
  end
end
