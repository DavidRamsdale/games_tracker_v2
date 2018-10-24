class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :place
      t.date :date
      t.time :time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
