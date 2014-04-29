class StudentsController < ApplicationController

  def create
    @student = Student.new(post_params)

    @student.save
    redirect_to @student
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    @student = Student.all
  end

  private
  def post_params
    params.require(:student).permit(:first_name, :last_name, :password, :password_hash, :grade)
  end

end
