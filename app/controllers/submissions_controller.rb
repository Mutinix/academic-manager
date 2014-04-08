class SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @submission = Submission.new
  end
  
  def create
    @submission = Submission.new(submission_params)
    @submission.user_id = current_user.id
    if @submission.save
      redirect_to submissions_path
    else
      render new_submission_path
    end
  end
  
  def index
    @submissions = current_user.submissions
  end
end

private
  
def submission_params
  params.require(:submission).permit(:title, :due_date)
end