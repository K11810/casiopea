class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :title, limit: 20, default: -> { 'NOW()' }, null: false
      t.text :word, limit: 500, null: false
      t.text :source, limit: 500
      t.text :comment, limit: 10000
      t.text :picture, limit: 255

      t.timestamps
    end
  end
end
