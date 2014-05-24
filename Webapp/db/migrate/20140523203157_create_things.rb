class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.decimal :time, :precision => 20, :scale => 12
      t.integer :watts

      t.timestamps
    end
  end
end