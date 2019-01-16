class CreateTransmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :transmissions do |t|
      t.string :message
      t.references :device
      t.timestamps
    end
  end
end
