json.extract! enrolment, :id, :course_id, :user_id, :rating, :review, :price, :created_at, :updated_at
json.url enrolment_url(enrolment, format: :json)
