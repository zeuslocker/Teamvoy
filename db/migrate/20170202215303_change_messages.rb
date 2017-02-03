class ChangeMessages < ActiveRecord::Migration
  def change
    add_column :messages, :expires_at, :datetime
    add_column :messages, :visit_counter, :integer
    remove_column :messages, :num
  end
end
