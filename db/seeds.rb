require 'faker'

puts "deletes all records"

Review.destroy_all
Rental.destroy_all
Book.destroy_all
User.destroy_all

puts "creates fake users & fake books & fake rentals & fake reviews "

languages = %w(english german polish french danish italian spanish)

#First 4 users hardcoded

User.create(email: "user1@example.com",
                    password: "123456",
                    first_name: "Peter",
                    last_name: "Lustig",
                    location: "Berlin",
                    language: "german",
                    description: "I read two books a day. How I do it? I was fired last month.",
                    profile_pic: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

User.create(email: "user2@example.com",
                    password: "123456",
                    first_name: "Friedrich",
                    last_name: "Seibert",
                    location: "Hamburg",
                    language: "german",
                    description: "Current student at Yale, Booklery is great to save costs on textbooks.",
                    profile_pic: "https://images.unsplash.com/photo-1555753838-55c1a93b41a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80")

User.create(email: "user3@example.com",
                    password: "123456",
                    first_name: "Michael",
                    last_name: "Jackson",
                    location: "Stuttgart",
                    language: "english",
                    description: "Former pilot, now retired and spending most of my day on Booklery",
                    profile_pic: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

User.create(email: "user4@example.com",
                    password: "123456",
                    first_name: "Heinrich",
                    last_name: "Muller",
                    location: "Munich",
                    language: "german",
                    description: "I read two books a day. How I do it? I am reading in my dreams.",
                    profile_pic: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

10.times do
  name = Faker::Internet.username
  new_user = User.create(email: "#{name}@example.com",
                    password: Faker::Internet.password(min_length: 8),
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    location: Faker::Address.city,
                    language: "english",
                    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est.")
print new_user
  if new_user
    10.times do
      book = Book.new(title: Faker::Book.title, language: languages.sample, description: "Ipsem lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam velit iste voluptatum enim, ipsa eveniet dolores doloremque quibusdam vitae deserunt pariatur, quaerat alias non porro minus aspernatur dolorem quasi! Aliquam. Ipsem Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae, necessitatibus perspiciatis natus minima vel architecto! Accusamus quisquam soluta in reiciendis a dolores fugiat sapiente quasi. Ab distinctio neque, possimus voluptatum.", image_url: "https://picsum.photosgit /200")
      book.user = new_user
      book.save
    end
  end
end

# FIRST 4 HARD CODED BOOKS:

first_book = Book.create(title: "Deutschland schafft sich ab")
second_book = Book.create(title: "1984")
third_book = Book.create(title: "Lord of the Rings")
fourth_book = Book.create(title: "Siege: Trump under Fire")

first_book.image_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Thilo_Sarrazin_-_Deutschland_schafft_sich_ab._Cover.png/1200px-Thilo_Sarrazin_-_Deutschland_schafft_sich_ab._Cover.png"

second_book.image_url = "https://ikindlebooks.com/wp-content/uploads/2016/09/1984-george-orwell.jpg"

third_book.image_url = "https://cdn.collider.com/wp-content/uploads/2016/07/the-lord-of-the-rings-book-cover.jpg"

fourth_book.image_url = "https://ewedit.files.wordpress.com/2019/05/siege.jpg"

first_book.description = "Thilo Sarrazin beschreibt mit seiner profunden Erfahrung aus Politik und Verwaltung die Folgen, die sich für Deutschlands Zukunft aus der Kombination von Geburtenrückgang, problematischer Zuwanderung und wachsender Unterschicht ergeben. Er will sich nicht damit abfinden, dass Deutschland nicht nur älter und kleiner, sondern auch dümmer und abhängiger von staatlichen Zahlungen wird. Sarrazin sieht genau hin, seine Analyse schont niemanden. Er zeigt ganz konkret, wie wir die Grundlagen unseres Wohlstands untergraben und so den sozialen Frieden und eine stabile Gesellschaft aufs Spiel setzen. Deutschland läuft Gefahr, in einen Alptraum zu schlittern. Dass das so ist, weshalb das so ist und was man dagegen tun kann, davon handelt dieses Buch."
second_book.description = "In 1984, London is a grim city where Big Brother is always watching you and the Thought Police can practically read your mind.  Winston Smith joins a secret revolutionary organization called The Brotherhood, dedicated to the destruction of the Party. Together with his beloved Julia, he hazards his life in a deadly match against the powers that be.

Animal Farm is Orwell's classic satire of the Russian Revolution -- an account of the bold struggle, initiated by the animals, that transforms Mr. Jones's Manor Farm into Animal Farm--a wholly democratic society built on the credo that All Animals Are Created Equal. But are they?"
third_book.description = "Inspired by The Hobbit and begun in 1937, The Lord of the Rings is a trilogy that J.R.R. Tolkien created to provide the necessary background of history for Elvish tongues. From these academic aspirations was born one of the most popular and imaginative works in English literature.

The Fellowship of the Ring, the first volume in the trilogy, tells of the fateful power of the One Ring. It begins a magnificent tale of adventure that will plunge the members of the Fellowship of the Ring into a perilous quest and set the stage for the ultimate clash between the powers of good and evil."
fourth_book.description = "With Fire and Fury, Michael Wolff defined the first phase of the Trump administration; now, in Siege, he has written an equally essential and explosive book about a presidency that is under fire from almost every side. A stunningly fresh narrative that begins just as Trump's second year as president is getting underway and ends with the delivery of the Mueller Report, Siege reveals an administration that is perpetually beleaguered by investigations and a president who is increasingly volatile, erratic, and exposed."

first_book.year = 2018
second_book.year = 2017
third_book.year = 2016
fourth_book.year = 2019

first_book.author = "Thilo Sarrazin"
second_book.author = "George Orwell"
third_book.author = "J. R. R. Tolkien"
fourth_book.author = "Michael Wolf"

first_book.genre = "fiction"
second_book.genre = "fiction"
third_book.genre = "fiction"
fourth_book.genre = "politics"

first_book.language = "German"
second_book.language = "English"
third_book.language = "English"
fourth_book.language = "English"

first_book.save
second_book.save
third_book.save
fourth_book.save

10.times do
  user = User.all.sample
  book = (Book.all - user.books).sample
end

# HARD CODING FOR DEMO ONLY - - - END

rental1 = Rental.new(book_id:1, user_id:2, start_date: Faker::Date.backward,
                           return_date: Faker::Date.forward)
rental1.save
rental2 = Rental.new(book_id:12, user_id:1, start_date: Faker::Date.backward,
                           return_date: Faker::Date.forward)
rental2.save
rental3 = Rental.new(book_id:3, user_id:4, start_date: Faker::Date.backward,
                           return_date: Faker::Date.forward)
rental3.save
rental4 = Rental.new(book_id:4, user_id:3, start_date: Faker::Date.backward,
                           return_date: Faker::Date.forward)
rental4.save
rental5 = Rental.new(book_id:5, user_id:5, start_date: Faker::Date.backward,
                           return_date: Faker::Date.forward)
rental5.save
rental6 = Rental.new(book_id:6, user_id:2, start_date: Faker::Date.backward,
                           return_date: Faker::Date.forward)
rental6.save
rental7 = Rental.new(book_id:17, user_id:1, start_date: Faker::Date.backward,
                           return_date: Faker::Date.forward)
rental7.save
rental8 = Rental.new(book_id:8, user_id:2, start_date: Faker::Date.backward,
                           return_date: Faker::Date.forward)
rental8.save
rental9 = Rental.new(book_id:18, user_id:1, start_date: Faker::Date.backward,
                           return_date: Faker::Date.forward)
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

