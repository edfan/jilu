class AssignmentsController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @assignment = Assignment.new
  end

  def create
    @group = Group.find(params[:group_id])
    if params.has_key?(:assignment)
      @assignment = @group.assignments.create(assignment_params)
      redirect_to @assignment
    else
      render 'new'
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
    @group = Group.find(@assignment.group_id)
    @teacher = Teacher.find(@group.teacher_id)
    @submissions = @assignment.submissions.all(params[:assignment_id])
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    @group = Group.find(@assignment.group_id)

    @assignment.update(assignment_params)
    redirect_to @assignment
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @group = Group.find(@assignment.group_id)
    @assignment.destroy

    redirect_to url_for(@group)
  end

  private
  def assignment_params
    params.require(:assignment).permit(:name, :description, :recording)
  end

end
