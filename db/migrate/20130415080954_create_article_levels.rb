class CreateArticleLevels < ActiveRecord::Migration
  def change
    create_table :article_levels do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
