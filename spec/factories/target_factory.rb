# This will guess the User class
FactoryBot.define do
  factory :target do
    topic 'Football'
    length '200'
    title 'Prueba'
    latitude '-34'
    longitude '-54'
  end

  # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end
