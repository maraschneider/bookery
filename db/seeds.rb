require 'faker'

puts "deletes all records"
User.destroy_all
Books.destroy_all

puts "creates fake users & fake books "

languages = %w(english german polish french danish italian spanish)

5.times do
  name = Faker::Internet.username
  new_user = User.create(email: "#{name}@example.com",
                    password: Faker::Internet.password(min_length: 8))
  if new_user
    10.times do
      book = Book.new(title: Faker::Book.title, language: languages.sample, image_url: "https://picsum.photos/200")
      book.user = new_user
      book.save
    end
  end
end
