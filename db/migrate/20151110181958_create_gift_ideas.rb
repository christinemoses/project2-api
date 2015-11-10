class CreateGiftIdeas < ActiveRecord::Migration
  def change
    create_table :gift_ideas do |t|
      t.string :description
      t.references :recipient

      t.timestamps null: false
    end
  end
end
