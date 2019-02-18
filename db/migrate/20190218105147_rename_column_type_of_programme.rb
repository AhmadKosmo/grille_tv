class RenameColumnTypeOfProgramme < ActiveRecord::Migration[5.2]
  def change
    rename_column :programmes, :type, :type_programme
  end
end
