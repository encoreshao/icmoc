# encoding: utf-8

p '> create admin...'
User.delete_all
admin = User.create(email: 'admin@icmoc.com', name: 'Admin', password: 'icmoc2013')
admin.mark_as_admin!

p '> Create personalities...'
Personality.delete_all
DEFAULTS[:passport_character].each do |char|
  Personality.create(id: char[:value].to_i, name: char[:name])
end

p '> Add article old level...'
levels = [ '全新', '9成新', '8成新', '7成新', '6成新', '5成新', '4成新', '其他']
ArticleLevel.delete_all
levels.each do |level|
  ArticleLevel.create(name: level)
end

