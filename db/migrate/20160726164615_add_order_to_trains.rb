class AddOrderToTrains < ActiveRecord::Migration
  def change
  	change_table :trains do |t|
      t.boolean :sort_order
    end
  end
end
