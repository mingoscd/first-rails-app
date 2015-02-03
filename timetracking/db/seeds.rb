# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
Project.create(name: 'Ironhack', description: 'A bootcamp...').entries.create(hours: 1, minutes: 34, date: Date.today)
Project.create(name: 'Rails', description: 'A framework to ...').entries.create(hours: 2, minutes: 50, date: Date.today)
Project.create(name: 'Ruby', description: 'A language for ...').entries.create(hours: 3, minutes: 55, date: Date.today)

