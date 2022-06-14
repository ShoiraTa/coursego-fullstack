class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @popular_courses = Course.limit(3)
    @top_rated_courses = Course.where('title ILIKE ?', '%nursing%')
    @recent_courses = Course.all.limit(3).order(created_at: :desc)
  end

  def privacy_policy
  end
end
