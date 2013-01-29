# encoding: utf-8

require 'database_cleaner'
require Rails.root.join('spec', 'support/blueprints')

p '> clean database...'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

p '> clean up uploads...'
Dir.glob(Rails.root.join('public', 'uploads', '**')).each { |dir| FileUtils.rm_rf(dir) }

p '> import mandatory seed...'
require  Rails.root.join('db', 'seeds_mandatory')