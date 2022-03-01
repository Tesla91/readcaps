puts "Deleting old records"
Favorite.destroy_all
Rating.destroy_all
Recap.destroy_all
Book.destroy_all
User.destroy_all
puts "All done deleting old records"

# User seeds
puts "Creating users"

user1 = User.create!(email: "bob@bob.com", password: "bob123", first_name: "Bob", last_name: "Doe", username: "boblicious")
user2 = User.create!(email: "tod@tod.com", password: "tod123", first_name: "Tod", last_name: "Sue", username: "toddy123")
user3 = User.create!(email: "lisa@lisa.com", password: "lisa123", first_name: "Lisa", last_name: "Moon", username: "lovelisa")
user4 = User.create!(email: "nick@nick.com", password: "nick123", first_name: "Nick", last_name: "Sun", username: "nickita")
user5 = User.create!(email: "kurt@kurt.com", password: "kurt123", first_name: "Kurt", last_name: "Cloud", username: "kurtbert")

# Book seed (from API -> TB combined)
puts "Creating books"
book1 = Book.create!(title: "Harry Potter and the Philosopher's Stone", author:"J. K. Rowling", photo_url: "google.com", description: "This is the first part of Harry Potter")
book2 = Book.create!(title: "Harry Potter and the Chamber of Secrets", author:"J. K. Rowling", photo_url: "google.com", description: "This is the second part of Harry Potter")
book3 = Book.create!(title: "Harry Potter and the Prisoner of Azkaban", author:"J. K. Rowling", photo_url: "google.com", description: "This is the third part of Harry Potter")
book4 = Book.create!(title: "Harry Potter and the Goblet of Fire", author:"J. K. Rowling", photo_url: "google.com", description: "This is the fourth part of Harry Potter")
book5 = Book.create!(title: "Harry Potter and the Order of the Phoenix ", author:"J. K. Rowling", photo_url: "google.com", description: "This is the fifth part of Harry Potter")

# Recap seeds
puts "Creating recaps"
recap1 = Recap.create!(summary: "Dumbledore is dead and both Hogwarts and the Ministry of Magic are under Death Eater control. Harry, Ron, and Hermione set out on a quest to find the remaining Horcruxes, destroying which could defeat Voldemort once and for all. However, the Horcruxes soon become a test of endurance for the three friends. And when Harry learns of the legendary Deathly Hallows, he begins to doubt which path is right for him.", user_id: user5.id, book_id: book1.id)
recap2 = Recap.create!(summary: "Strange things are happening at Hogwarts in Harry's second year. Gradually, students are found petrified in the corridors and everything points to a mysterious chamber that Hagrid is said to have something to do with. New Defense Against the Dark Arts teacher Gilderoy Lockhart seems far from qualified, and when Dumbledore is eventually suspended, Harry, Ron and Hermione set out to solve the mystery themselves.", user_id: user1.id, book_id: book2.id)
recap3 = Recap.create!(summary: "Harry can't wait for the end of the vacation, especially when Vernon's sister announces her visit. Trouble is inevitable and eventually Harry runs away - much to the concern of the wizarding community as felon Sirius Black has broken out of prison and is believed to be out looking for him. Back at Hogwarts, Harry discovers that Black is responsible for his parents' deaths. And then Ron's rat behaves even more than strange.", user_id: user3.id, book_id: book3.id)
recap4 = Recap.create!(summary: "Harry Potter and his friends witness a historic event: This year, the Triwizard Tournament is taking place at Hogwarts. For inexplicable reasons, Harry becomes a participant and has to face dangerous dragons, water demons and difficult puzzles - and find a companion to the prom along the way. Harry soon realizes he has landed in a game of life and death and Voldemort is closer than he expected.", user_id: user4.id, book_id: book4.id)
recap5 = Recap.create!(summary: "Harry Potter is spending a lonely summer with the Dursleys when he and his cousin Dudley are suddenly attacked by dementors. Harry has a hard time driving them away, but he faces expulsion from school for performing magic in front of a Muggle. But that's just the beginning of the trouble, because back at Hogwarts, hardly anyone wants to believe that Voldemort is back. And then there's the new teacher who seems to be trying to prevent the students from learning magic.", user_id: user2.id, book_id: book5.id)

# Rating seeds
puts "Creating ratings"
rating1 = Rating.create!(comment: "This a very good recap. It really helped me to remember.", star: "5", user_id: user5.id, recap_id: recap1.id)
rating2 = Rating.create!(comment: "This a very a very bad summary. There was missing a really important part.", star: "1", user_id: user1.id, recap_id: recap2.id)
rating3 = Rating.create!(comment: "Really helped me to catch up on everything and prepare for the next part.", star: "5", user_id: user4.id, recap_id: recap3.id)
rating4 = Rating.create!(comment: "Not sufficient. I missed the part where Harry Potters and Ron did have this huge fight.", star: "3", user_id: user3.id, recap_id: recap4.id)
rating5 = Rating.create!(comment: "I enjoyed this recap and only would add the little thing that Ron and Hermine fell in love.", star: "4", user_id: user2.id, recap_id: recap5.id)

# Favorites seeds
puts "Creating favorites"
favorite1 = Favorite.create!(user_id: user5.id, recap_id: recap1.id)
favorite2 = Favorite.create!(user_id: user1.id, recap_id: recap2.id)
favorite3 = Favorite.create!(user_id: user4.id, recap_id: recap3.id)
favorite4 = Favorite.create!(user_id: user3.id, recap_id: recap4.id)
favorite5 = Favorite.create!(user_id: user2.id, recap_id: recap5.id)


puts 'All done seeding'
