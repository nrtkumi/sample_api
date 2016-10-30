class SchoolsController < ApplicationController
  before_action :set_shcool, only: :show
  def index
    @schools = School.all
    render json: @schools
  end

  def show
    render json: @school
  end

  def create
    @school = School.new(school_params)

    if @school.save
      render json: @school, status: :created, location: @school
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def set_shcool
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :member, :place, :description)
  end
end
