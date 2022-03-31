class StudentsController < ApplicationController
  def index
    if params[:name]
      by_first_name = Student.find_by(first_name: params[:name].titleize)
      by_last_name = Student.find_by(last_name: params[:name].titleize)
      if by_first_name.nil?
        puts json: by_last_name
        render json: by_last_name
      else
        puts json: by_first_name
        render json: by_first_name
      end
    else
      students = Student.all
      render json: students
    end
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
