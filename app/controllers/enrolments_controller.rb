class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: %i[ show edit update destroy ]
  before_action :set_course, only: [:new, :create]

  def index

    @enrolments = Enrolment.all
    authorize @enrolments
  end

  def show
  end

  def new
    @enrolment = Enrolment.new
  end

  def edit
    authorize @enrolment
  end

  def create
    if @course.price > 0
      flash[:alert] = "You cannot get paid courses yet."
      redirect_to new_course_enrolment_path(@course)
    else
      @enrolment = current_user.buy_course(@course)
      redirect_to course_path(@course), notice: "You succesfully bought the course"
    end
  end

  def update
    authorize @enrolment
    respond_to do |format|
      if @enrolment.update(enrolment_params)
        format.html { redirect_to enrolment_url(@enrolment), notice: "Enrolment was successfully updated." }
        format.json { render :show, status: :ok, location: @enrolment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @enrolment.destroy
    authorize @enrolment
    respond_to do |format|
      format.html { redirect_to enrolments_url, notice: "Enrolment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_enrolment
      @enrolment = Enrolment.find(params[:id])
    end

    def enrolment_params
      params.require(:enrolment).permit( :rating, :review)
    end

    def set_course
      @course = Course.friendly.find(params[:course_id])
    end
end
