class LessonsController < ApplicationController
  before_action :require_login

  def create
    @lesson = current_user.lessons.new lesson_params
    if @lesson.save
      flash[:success] = t "create_lesson_complete"
      redirect_to @lesson
    else
      flash[:danger] = t "create_lesson_fail"
      redirect_to categories_path
    end
  end

  def show
    @lesson = Lesson.find_by id: params[:id]
    if @lesson.words.count == 0
      flash[:danger] = t "category_learned"
      redirect_to categories_path
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit :category_id
  end

end
