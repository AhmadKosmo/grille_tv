class AddIdProgrammeIdChaineToDiffusions < ActiveRecord::Migration[5.2]
  def change
    add_column :diffusions, :programme_id, :integer
    add_column :diffusions, :chaine_id, :integer
  end
end
