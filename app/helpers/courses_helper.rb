module CoursesHelper
  def enrolment_button(course)
    if current_user
      if course.user == current_user
        link_to 'You creted this course. View Analitics', course_path(course)
        elsif course.enrolments.where(user: current_user).any?
        link_to 'You have already bought this course.', course_path(course)

        elsif course.price > 0
        link_to number_to_currency(course.price),new_course_enrolment_path(course), class: 'btn btn-success'
        else 
        link_to 'Free',new_course_enrolment_path(course), class: 'btn btn-success'
      end
    
    else 
      link_to "Check price", course_path(course), class: 'btn btn-success'

    end
  end
end
