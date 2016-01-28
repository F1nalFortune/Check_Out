class ClassroomsController < ApplicationController
  before_action :classroom, only: [:show, :edit, :update, :destroy]
  def index
    @classrooms = Classroom.all
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      redirect_to classrooms_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def new
    @classroom = Classroom.new
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to classrooms_path
    else
      render 'edit'
    end
  end

  def destroy
    @classroom.destroy
    redirect_to classrooms_path
  end

  private
  def classroom_params
    params.require(:classroom).permit(:name, :code)
  end

  def classroom
    @classroom = Classroom.find(params[:id])
  end
end
