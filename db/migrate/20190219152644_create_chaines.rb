class CreateChaines < ActiveRecord::Migration[5.2]
  def change
    create_table :chaines do |t|
      t.string :nom
    end
  end
end
