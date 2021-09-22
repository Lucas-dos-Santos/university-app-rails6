class SessionsController < ApplicationController
  skip_before_action :require_user, only: %i[new create]
  def new; end

  def create
    student = Student.find_by(email: params[:sessions][:email])
    if student && student.authenticate(params[:sessions][:password])
      session[:student_id] = student.id
      flash[:notice] = 'Estudante logado com sucesso'
      redirect_to student
    else
      flash.now[:notice] = 'Login ou senha inválidos!'
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = 'Deslogado com sucesso!'
    redirect_to root_path
  end
end
