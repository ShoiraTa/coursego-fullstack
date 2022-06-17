class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: %i[ show edit update destroy ]

  def index
    @enrolments = Enrolment.all
  end

  def show
  end

  def new
    @enrolment = Enrolment.new
  end

  def edit
  end

  def create
    @enrolment = Enrolment.new(enrolment_params)
    @enrolment.price =  @enrolment.course.price
    respond_to do |format|
      if @enrolment.save
        format.html { redirect_to enrolment_url(@enrolment), notice: "Enrolment was successfully created." }
        format.json { render :show, status: :created, location: @enrolment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
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
      params.require(:enrolment).permit(:course_id, :user_id, :rating, :review)
    end
end
