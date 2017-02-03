class AddLinkToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :link, :string
  end
end
