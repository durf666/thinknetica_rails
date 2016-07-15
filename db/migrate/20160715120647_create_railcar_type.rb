class CreateRailcarType < ActiveRecord::Migration

  def change
    create_table :railcar_types do |t|
      t.string :railcar_type
    end
  end
end
