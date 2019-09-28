class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :text
      t.string :user_id
      t.string :room_id

      t.timestamps
    end
  end
end
