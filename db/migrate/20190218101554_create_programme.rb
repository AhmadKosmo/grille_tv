class CreateProgramme < ActiveRecord::Migration[5.2]
  def change
    create_table :programmes do |t|
      t.string :titre
      t.string :type
      t.string :classification
    end
  end
end
