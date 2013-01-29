p '> create admin...'
User.delete_all
admin = User.create(email: 'admin@icmoc.com', name: 'Admin', password: '111111')
admin.mark_as_admin!

p '> Create personalities...'
Personality.delete_all
DEFAULTS[:passport_character].each do |char|
  Personality.create(id: char[:value].to_i, name: char[:name])
end