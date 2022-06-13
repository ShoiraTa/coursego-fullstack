User.create(email: 'user@gmail.com', password: '123456', password_confirmation: '123456')

30.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user: User.first
  }])
end