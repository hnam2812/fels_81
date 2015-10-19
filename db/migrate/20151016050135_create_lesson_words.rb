class CreateLessonWords < ActiveRecord::Migration
  def change
    create_table :lesson_words do |t|
      t.integer :lesson_id
      t.integer :word_id

      t.timestamps null: false
    end
  end
end
