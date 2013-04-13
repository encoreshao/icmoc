class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :name
      t.string :mobile
      t.text :content
      t.references :user

      t.timestamps
    end
  end
end
