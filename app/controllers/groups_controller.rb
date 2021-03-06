class GroupsController < ApplicationController

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @group = Group.new
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    if params.has_key?(:group)
      @group = @teacher.groups.create(group_params)
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @teacher = Teacher.find(@group.teacher_id)
    @assignments = @group.assignments.all(params[:group_id])
    begin
    @submissions = @assignments[0].submissions.all
    rescue
    end
    @students = @group.students.all(params[:group_id])
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    @teacher = Teacher.find(@group.teacher_id)

    @group.update(group_params)
    redirect_to @group
  end

  def destroy
    @group = Group.find(params[:id])
    @teacher = Teacher.find(@group.teacher_id)
    @group.destroy

    redirect_to url_for(@teacher)
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end

end
