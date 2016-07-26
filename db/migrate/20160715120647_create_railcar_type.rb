class CreateRailcarType < ActiveRecord::Migration

  def change
    create_table :railcar_types do |t|
      t.string :name
      t.string :display_name
    end
  end
end
