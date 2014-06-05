class SessionsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.find_by_email(params[:email])
    if teacher && teacher.authenticate(params[:password_digest])
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
