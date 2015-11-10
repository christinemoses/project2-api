class CreateGiftIdeas < ActiveRecord::Migration
  def change
    create_table :gift_ideas do |t|
      t.string :description
      t.references :recipient, foreign_key: true

      t.timestamps null: false
    end
  end
end
