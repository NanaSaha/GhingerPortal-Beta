# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Role.create(name: 'Super Admin')
# Role.create(name: 'Customer Service')
# 
# Permission.create(action: 'manage', subject_class:'all')

User.create(username: "clem", email: "clem@gmail.com", password: "123456",  password_confirmation: "123456", role_id: Role.find_by_name('Super Admin').id)

# User.create(name: "Francis Nartey", email: "francis@gmail.com", password: "123456", password_confirmation: "123456", role_id: Role.find_by_name('Staff').id)

# PermissionRole.create(role_id: Role.find_by_name('Super Admin').id, permission_id: Permission.find_by_subject_class('all').id )