class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'Estudante criado com sucesso!'
      redirect_to students_path
    else
      render 'new'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email)
  end
end