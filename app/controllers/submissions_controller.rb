class SubmissionsController < ApplicationController

  def new
    @assignment = Assignment.find(params[:assignment_id])
    @submission = Submission.new
  end

  def create
    @assignment = Assignment.find(params[:assignment_id])
    if params.has_key?(:submission)
      @submission = @assignment.submissions.create(submission_params)
      redirect_to @submission
    else
      render 'new'
    end
 end

  def show
    @submission = Submission.find(params[:id])
    @assignment = Assignment.find(@submission.assignment_id)
    @group = Group.find(@assignment.group_id)
    @teacher = Teacher.find(@group.teacher_id)
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    @submission = Submission.find(params[:id])
    @assignment = Assignment.find(@submission.assignment_id)

    @submission.update(submission_params)
    redirect_to @submission
  end

  def destroy
    @submission = Submission.find(params[:id])
    @assignment = Assignment.find(@submission.assignment_id)
    @submission.destroy

    redirect_to url_for(@assignment)
  end

  private
  def submission_params
    params.require(:submission).permit(:description, :recording, :name)
  end

end

