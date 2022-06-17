class ApplicationController < ActionController::Base
  # Pagination 
  include Pagy::Backend
  # give role based access
  include Pundit::Authorization
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # 
  before_action :authenticate_user!
  before_action :set_global_variables, if: :user_signed_in?
  # check if user is online
  after_action :user_activity



  include PublicActivity::StoreController
  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search)
  end

  private
  def user_activity
    current_user.try :touch
  end

  def user_not_authorized #pundit
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end


end
