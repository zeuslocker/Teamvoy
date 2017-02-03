class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |f|
      f.text :body
      f.integer :num
      f.integer :destroy_type
      f.timestamps, null: false
    end
  end
end
