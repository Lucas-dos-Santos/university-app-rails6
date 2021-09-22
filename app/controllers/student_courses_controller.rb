class StudentCoursesController < ApplicationController
  def create
    course_to_add = Course.find(params[:course_id])
    if current_user.courses.include?(course_to_add)
      flash[:notice] = 'Houve algum erro na sua inscrição'
      redirect_to root_path
    else
      StudentCourse.create(course: course_to_add, student: current_user)
      flash[:notice] = "Inscrito com sucesso no curso #{course_to_add.name}"
      redirect_to current_user
    end
  end
end
