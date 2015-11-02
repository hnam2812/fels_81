module StaticPagesHelper
  def total_answers
    Result.total_answers(current_user.id).size
  end

  def total_correct_answers
    Result.total_correct_answers(current_user.id).size
  end

  def percent_correct_answer
    total_answers > 0 ? t("percent_correct_answer",number:(100 * total_correct_answers.to_f/
      total_answers.to_f).round(2)) : 0
  end

  def learned_progress
    number_with_precision((100 * total_correct_answers.to_f/Word.all.size.to_f),
      precision: 2)
  end

  def unlearn_progress
    number_with_precision((100 - learned_progress.to_f), precision: 2)
  end
end
