class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.string :content
      t.integer :word_id

      t.timestamps null: false
    end
  end
end
