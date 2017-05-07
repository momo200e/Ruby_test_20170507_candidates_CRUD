class CandidatesController < ApplicationController
  def index
   @candidates = Candidate.all
  end
  def new
      @candidate = Candidate.new
    end
 def create
      @candidate=Candidate.new(candidate_params)
   if@candidate.save
     redirect_to candidates_path, notice: "候選人新增成功"
   else
     render :new
   end
 end
  private
  def candidate_params
    params.require(:candidate).permit(:name,:party,:age,:politics)
  end
end