class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(post_params)

    if @teacher.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
    @groups = @teacher.groups.all(params[:teacher_id])
  end

  def index
    @teachers = Teacher.all
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])

    @teacher.update(post_params)
    redirect_to @teacher
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    redirect_to teachers_path
  end

  private
  def post_params
    params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
  end

end
