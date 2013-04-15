class CreateUserPromptProblems < ActiveRecord::Migration
  def change
    create_table :user_prompt_problems do |t|
      t.string :problem
      t.string :answer
      t.integer :frequency, default: 0
      t.references :user

      t.timestamps
    end

    add_index :user_prompt_problems, :user_id
  end
end