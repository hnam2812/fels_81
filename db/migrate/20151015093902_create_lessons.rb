class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :lesson_result

      t.timestamps null: false
    end
  end
end
