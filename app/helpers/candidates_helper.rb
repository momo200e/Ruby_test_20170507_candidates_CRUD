module CandidatesHelper
  def user_gender(gender)
    if gender==1
      "男"
    elsif gender==0
      "女"
    else
      "秘密"
    end
  end
end
