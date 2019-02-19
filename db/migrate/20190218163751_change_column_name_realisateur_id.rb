class ChangeColumnNameRealisateurId < ActiveRecord::Migration[5.2]
  def change
    rename_column :programmes, :realisateur_id, :id_realisateur
  end
end
