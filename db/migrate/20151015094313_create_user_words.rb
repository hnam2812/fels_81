class CreateUserWords < ActiveRecord::Migration
  def change
    create_table :user_words do |t|
      t.integer :user_id
      t.integer :word_id

      t.timestamps null: false
    end
  end
end
