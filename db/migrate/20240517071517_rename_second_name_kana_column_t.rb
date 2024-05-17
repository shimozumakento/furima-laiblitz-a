class RenameSecondNameKanaColumnT < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :second_name_kana, :first_name_kana
  end
end
