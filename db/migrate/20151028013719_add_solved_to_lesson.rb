class AddSolvedToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :solved, :boolean
  end
end
