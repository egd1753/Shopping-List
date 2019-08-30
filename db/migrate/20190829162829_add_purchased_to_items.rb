class AddPurchasedToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :purchased, :boolean
  end
end
