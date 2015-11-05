class Result < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer

  scope :total_answers, -> user_id{where "lesson_id in (select id from lessons
    where user_id = #{user_id})"}
  scope :total_correct_answers, ->user_id{where "lesson_id in (select id from
    lessons where user_id = #{user_id}) and answer_id in
    (select id from answers where correct = 't')"}
end
