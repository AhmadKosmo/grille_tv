class AddRealisateurIdToProgramme < ActiveRecord::Migration[5.2]
  def change
    add_column :programmes, :realisateur_id, :integer
  end
end
