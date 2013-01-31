unless Rails.env.production?
  namespace :dev do
    namespace :db do
      desc "recreates the development database from migration, and updates the db schema if necessary"
      task :seed => :environment do
        require File.dirname(__FILE__) + '/../../db/seeds_for_dev' unless Rails.env.test?
      end

      desc "import seed and china_regions data into database"
      task :import => :environment do
        Rake::Task['dev:db:seed'].invoke
        Rake::Task['china_regions:import'].invoke
      end
    end
  end
end