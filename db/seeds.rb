require 'faker'

puts "deletes all records"
User.destroy_all
Book.destroy_all

puts "creates fake users & fake books & fake rentals & fake reviews "

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
      book = Book.new(title: Faker::Book.title, language: languages.sample, description: "Ipsem lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam velit iste voluptatum enim, ipsa eveniet dolores doloremque quibusdam vitae deserunt pariatur, quaerat alias non porro minus aspernatur dolorem quasi! Aliquam. Ipsem Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae, necessitatibus perspiciatis natus minima vel architecto! Accusamus quisquam soluta in reiciendis a dolores fugiat sapiente quasi. Ab distinctio neque, possimus voluptatum.", image_url: "https://picsum.photos/200")
      book.user = new_user
      book.save
    end
  end
end


10.times do
  user = User.all.sample
  book = (Book.all - user.books).sample
  new_rental = Rental.create(book_id: book.id,
                           user_id: user.id,
                           start_date: Faker::Date.backward,
                           return_date: Faker::Date.forward)
end

rental1 = Rental.new(book_id:1, user_id:2)
rental1.save
rental2 = Rental.new(book_id:2, user_id:1)
rental2.save
rental3 = Rental.new(book_id:3, user_id:4)
rental3.save
rental4 = Rental.new(book_id:4, user_id:3)
rental4.save
rental5 = Rental.new(book_id:5, user_id:5)
rental5.save
rental6 = Rental.new(book_id:6, user_id:2)
rental6.save
rental7 = Rental.new(book_id:7, user_id:1)
rental7.save
rental8 = Rental.new(book_id:8, user_id:2)
rental8.save
rental9 = Rental.new(book_id:8, user_id:1)
rental9.save


  reader_review1 = Review.new(rental_id:1, content:"Such a lovely experience, we had coffee together when we met up and ended up in 2 hour discussion about the book.", rating:5, is_reader: true)
  reader_review1.save
  reader_review2 = Review.new(rental_id:2, content:"Always such a great opportunity to meet like-minded people. It started with a booklery meetup, and I would say we are now really good friends.", rating:5, is_reader: true)
  reader_review2.save
  reader_review3 = Review.new(rental_id:3, content:"Unfortunately the guy was an hour late (without prior notice), which mixed up my schedule for the day. The book was lovely though. 3 stars.", rating:3, is_reader: true)
  reader_review3.save
  reader_review4 = Review.new(rental_id:4, content:"He did not show up and did not message me. I wasted an hour of my life. Thanks Booklery.", rating:1, is_reader: true)
  reader_review4.save
  reader_review5 = Review.new(rental_id:5, content:"Wow, I never thought that this new platform would actually take me back to books. Thanks Booklery!", rating:5, is_reader: true)
  reader_review5.save
  reader_review6 = Review.new(rental_id:6, content:"The book has literally changed my life... Guys, believe in the power of books. Thanks Booklery for the smooth transaction!", rating:5, is_reader: true)
  reader_review6.save
  reader_review7 = Review.new(rental_id:7, content:"Again, another super smooth experience with Booklery!", rating:5, is_reader: true)
  reader_review7.save
  reader_review8 = Review.new(rental_id:8, content:"And yet another person who did not show up. Screw this!", rating:1, is_reader: true)
  reader_review8.save
  reader_review9 = Review.new(rental_id:9, content:"Never again. Shitty service.", rating:1, is_reader: true)
  reader_review9.save

  host_review1 = Review.new(rental_id:1, content:"Started as a booklery meetup, ended up having coffee and a chat over the book for almost 2 hours.", rating:5, is_reader: false)
  host_review1.save
  host_review2 = Review.new(rental_id:2, content:"Met one of the coolest guys in Berlin through Booklery! Thank you!", rating:5, is_reader: false)
  host_review2.save
  host_review3 = Review.new(rental_id:3, content:"Really enjoyed meeting this guy! Always a pleasure.", rating:3, is_reader: false)
  host_review3.save
  host_review4 = Review.new(rental_id:4, content:"Super sorry, but I messed up and missed the meeting due to an emergency. Sorry for that!", rating:1, is_reader: false)
  host_review4.save
  host_review5 = Review.new(rental_id:5, content:"Super smooth.", rating:5, is_reader: false)
  host_review5.save
  host_review6 = Review.new(rental_id:5, content:"Lovely experience.", rating:5, is_reader: false)
  host_review6.save
  host_review7 = Review.new(rental_id:5, content:"Super friendly guy!", rating:5, is_reader: false)
  host_review7.save
  host_review8 = Review.new(rental_id:5, content:"Loved the guy. Super German. Super punctual.", rating:5, is_reader: false)
  host_review8.save
  host_review9 = Review.new(rental_id:5, content:"Returned my book 2 days late :(", rating:1, is_reader: false)
  host_review9.save

puts "Successfully seeded"

