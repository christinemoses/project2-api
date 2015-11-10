class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.references :user

      t.timestamps null: false
    end
  end
end
