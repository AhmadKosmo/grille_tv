class CreateDiffusions < ActiveRecord::Migration[5.2]
  def change
    create_table :diffusions do |t|
      t.string :jour
      t.string :heure
    end
  end
end
