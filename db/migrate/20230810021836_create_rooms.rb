class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :code, index: { unique: true }
      t.timestamps
    end
  end
end