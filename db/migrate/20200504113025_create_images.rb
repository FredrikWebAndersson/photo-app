class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :name
      t.string :picture
      t.references :user, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
