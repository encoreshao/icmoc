unless Rails.env.production?
  namespace :dev do
    namespace :db do
      desc "import seed and china_regions data into database"
      task :import => :environment do
        Rake::Task['dev:db:seed'].invoke
        Rake::Task['china_regions:import'].invoke
        Rake::Task['dev:db:categories'].invoke
        Rake::Task['dev:db:article_levels'].invoke
      end

      desc "recreates the development database from migration, and updates the db schema if necessary"
      task :seed => :environment do
        require File.dirname(__FILE__) + '/../../db/seeds_for_dev' unless Rails.env.test?
      end

      desc "import seed and categories data into database"
      task :categories => :environment do
        p '> Create categories...'
        Category.delete_all
        file_path = File.join(Rails.root, 'db/seed_data', 'categories.yml')
        # file_path = File.dirname(__FILE__) + '/../../db/seed_data/categories.yml'
        data = File.open(file_path) { |file| YAML.load(file) }
        data.each do |name, categories|
          category = Category.create({name: name})
          categories['names'].each do |name|
            Category.create({name: name, parent_id: category.id})
          end
        end
      end

      desc 'Add 100 articles...'
      task :article_levels => :environment do
        Article.delete_all
        (1..100).each do |i|
          file_path = File.join(Rails.root, 'db/seed_data', 'normal.jpg')
          Article.create({
              swap_name: "Swap #{i}",
              wish_name: "Wish #{i}",
              phone: rand(36 ** 6).to_s(11),
              qq: rand(36 ** 6).to_s(9),
              province_id: Province.scoped.sample.id,
              publish_at: Time.now,
              user_id: User.scoped.sample.id,
              category_id: Category.scoped.sample.id,
              image: File.new(file_path),
              article_level_id: ArticleLevel.scoped.sample.id
            })
        end
      end
    end
  end
end