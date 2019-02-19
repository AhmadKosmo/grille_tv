class RechangeColumnIdRealisateur < ActiveRecord::Migration[5.2]
  def change
    rename_column :programmes, :id_realisateur, :realisateur_id
  end
end
