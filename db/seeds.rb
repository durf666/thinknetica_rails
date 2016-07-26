# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
RailcarType.create(name: "coupe_railcar", display_name: "Купейный")
RailcarType.create(name: "economy_railcar", display_name: "Плацкартный")
RailcarType.create(name: "lux_railcar", display_name: "СВ")
RailcarType.create(name: "seating_railcar", display_name: "Сидячий")

RailwayStation.create(name: "Москва")
RailwayStation.create(name: "Воркута")
RailwayStation.create(name: "Питер")

Route.create(name: "Москва-Питер")
Route.create(name: "Москва-Воркута")
Route.create(name: "Питер-Воркута")
