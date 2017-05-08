class CandidatesController < ApplicationController
  def index
   @candidates = Candidate.all
  end
  def new
      @candidate = Candidate.new
    end
  def show
    @candidate = Candidate.find_by(id: params[:id])
  end
 def create
      @candidate = Candidate.new(candidate_params)
   if@candidate.save
     redirect_to candidates_path, notice: "候選人新增成功!!"
   else
     render :new
   end
 end
  
  def edit
    @candidate=Candidate.find_by(id: params[:id])
  end
  def update
    @candidate = Candidate.find_by(id: params[:id])
    if @candidate.update(candidate_params)
      redirect_to candidates_path,notice: "候選人編輯成功!!"
    else
      render :edit
    end
  end
  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy if @candidate
      redirect_to candidates_path, notice: "候選人資料已刪除!"
  end
    
  def vote
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.increment(:votes)
    @candidate.save
    redirect_to candidates_path,notice: "投票成功!"
  end
  
  private
  def candidate_params
    params.require(:candidate).permit(:name,:party,:age,:politics)
  end
end
