class StudentsController < ApplicationController
  skip_before_action :require_user, only: %i[new create]
  before_action :set_student, only: %i[show edit update]
  before_action :require_same_user, only: %i[edit update]
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show; end

  def edit; end

  def update
    if @student.update(student_params)
      flash[:notice] = 'Dados atualizados com sucesso!'
      redirect_to @student
    else
      render 'edit'
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'Estudante criado com sucesso!'
      redirect_to @student
    else
      render 'new'
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmations)
  end

  def require_same_user
    if current_user != @student
      flash[:notice] = 'Você só pode editar seu proprio perfil'
      redirect_to student_path(current_user)
    end
  end
end
