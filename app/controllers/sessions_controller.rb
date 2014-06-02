class SessionsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.authenticate(params[:email], params[:password])
    if user
      session[:teacher_id] = teacher.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def index
    @teachers = Teacher.all
  end

end
