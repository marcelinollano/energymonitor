class CreateSap < ActiveRecord::Migration
  def change
    create_table :sap do |t|
      t.decimal :bill, :precision => 15, :scale => 3
      t.decimal :price, :precision => 15, :scale => 3

      t.timestamps
    end
  end
end
