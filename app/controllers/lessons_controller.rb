class LessonsController < ApplicationController
  before_action :require_login
  before_action :check_exist_word, only: :create

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

  def update
    @lesson = Lesson.find_by id: params[:id]
    if @lesson.update_attributes lesson_params
      flash[:success] = t "update_lesson_complete"
    else
      flash[:danger] = t "update_lesson_fail"
    end
    redirect_to @lesson
  end

  def show
    @lesson = Lesson.find_by id: params[:id]
  end

  private
  def lesson_params
    params.require(:lesson).permit :category_id, :solved, results_attributes: [:id, :answer_id]
  end

  def check_exist_word
    if Category.find(params[:lesson][:category_id])
      .words.not_learn(current_user.id).size == 0
      flash[:danger] = t "category_has_no_word"
      redirect_to categories_path
    end
  end
end
