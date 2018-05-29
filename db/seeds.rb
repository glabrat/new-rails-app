# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This works for migration 2018_05_27_202231
heros_list = [
    ["Protón","active"],
    ["Neutrón","active"],
    ["Minimis","active"],
    ["Catrón","active"],
    ["Caurus","active"],
    ["Knoep","active"],
    ["Maximus","inactive"],
    ["Deerpool","active"],
    ["SupaMan","active"],
    ["W31rD0","active"],
    ["Secuaz","inactive"],
    ["Secuas","inactive"],
]

heros_list.each do |name, status| 
    Hero.create(name: name, status: status)
end