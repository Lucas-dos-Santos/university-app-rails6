class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update]
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
    params.require(:student).permit(:name, :email)
  end
end
