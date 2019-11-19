require 'faker'

puts "deletes all records"
User.destroy_all
Book.destroy_all

puts "creates fake users & fake books "

languages = %w(english german polish french danish italian spanish)

5.times do
  name = Faker::Internet.username
  new_user = User.create(email: "#{name}@example.com",
                    password: Faker::Internet.password(min_length: 8),
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    location: Faker::Address.city,
                    language: "english",
                    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est.")

  if new_user
    10.times do
      book = Book.new(title: Faker::Book.title, language: languages.sample, image_url: "https://picsum.photos/200")
      book.user = new_user
      book.save
    end
  end
end
