class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :text
      t.object :user
      t.object :room

      t.timestamps
    end
  end
end
