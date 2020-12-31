class CreateCatpics < ActiveRecord::Migration[6.0]
  def change
    create_table :catpics do |t|
      t.string :image

      t.timestamps
    end
  end
end
