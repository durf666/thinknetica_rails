class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.belongs_to :stations, :first_station
      t.belongs_to :stations, :last_station
      t.belongs_to :user
      t.belongs_to :train
      t.timestamps null: false
    end
  end
end
