require "open-uri"
require "json"
require 'faker'

url = "https://www.googleapis.com/books/v1/users/102817767719508217692/bookshelves/0/volumes?maxResults=40&key=#{ENV['GOOGLE_API_KEY']}"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
books = user["items"]

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
user1.avatar.attach(io: URI.open('https://res.cloudinary.com/dbzj7fllo/image/upload/v1645790349/development/male_d9m7gk.jpg'),
                    filename: 'avatar1.jpg', content_type: 'image/png')
user2 = User.create!(email: "tod@tod.com", password: "tod123", first_name: "Tod", last_name: "Sue", username: "toddy123")
user2.avatar.attach(io: URI.open('https://res.cloudinary.com/dbzj7fllo/image/upload/v1645790517/development/NY9hnAbp_fc5umz.jpg'),
                    filename: 'avatar2.jpg', content_type: 'image/png')
user3 = User.create!(email: "lisa@lisa.com", password: "lisa123", first_name: "Lisa", last_name: "Moon", username: "lovelisa")
user3.avatar.attach(io: URI.open('https://res.cloudinary.com/dbzj7fllo/image/upload/v1645790349/development/female2_esrwlh.jpg'),
                    filename: 'avatar3.jpg', content_type: 'image/png')
user4 = User.create!(email: "nicolapilcher@msn.com", password: "nick123", first_name: "Nicola", last_name: "Pilcher", username: "tesla91")
user4.avatar.attach(io: URI.open('https://res.cloudinary.com/dbzj7fllo/image/upload/v1645815982/development/tiwep2th1l0vm3j0mie7z6b1e0h7.jpg'),
                    filename: 'avatar4.jpg', content_type: 'image/png')
user5 = User.create!(email: "kurt@kurt.com", password: "kurt123", first_name: "Kurt", last_name: "Cloud", username: "kurtbert")
user5.avatar.attach(io: URI.open('https://res.cloudinary.com/dbzj7fllo/image/upload/v1645790517/development/AW-rdWlG_ag3u6f.jpg'),
                    filename: 'avatar5.jpg', content_type: 'image/png')

20.times do
  User.create!(email: Faker::Internet.email, password: Faker::Internet.password,
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               username: Faker::Internet.username(specifier: 6..10))
end

user6 = User.last
user6.avatar.attach(io: URI.open('https://res.cloudinary.com/dbzj7fllo/image/upload/v1646759045/development/lorem-face-1717_ao2qzw.jpg'),
                    filename: 'avatar6.jpg', content_type: 'image/png')
user7 = User.second_to_last
user7.avatar.attach(io: URI.open('https://res.cloudinary.com/dbzj7fllo/image/upload/v1646759045/development/lorem-face-3606_oj3xjp.jpg'),
                    filename: 'avatar7.jpg', content_type: 'image/png')
user8 = User.third_to_last
user8.avatar.attach(io: URI.open('https://res.cloudinary.com/dbzj7fllo/image/upload/v1646759045/development/lorem-face-3352_mvye7h.jpg'),
                    filename: 'avatar8.jpg', content_type: 'image/png')


# Book seeds
puts "Creating books"
books.each do |book|
  Book.create!(title: book["volumeInfo"]["title"], author: book["volumeInfo"]["authors"][0],
               description: book["volumeInfo"]["description"],
               photo_url: book["volumeInfo"]["imageLinks"]["thumbnail"])
end

book1 = Book.find_by(title: "Harry Potter and the Sorcerers Stone")
book2 = Book.find_by(title: "Harry Potter and the Chamber of Secrets")
book3 = Book.find_by(title: "A Court of Thorns and Roses")
book4 = Book.find_by(title: "Pawn")
book5 = Book.find_by(title: "The House of the Scorpion")
book6 = Book.find_by(title: "A Wrinkle in Time")
book7 = Book.find_by(title: "Book of Night")
book8 = Book.find_by(title: "Gone Girl")
book9 = Book.find_by(title: "From Lukov with Love")
book10 = Book.find_by(title: "The Complete Grimm's Fairy Tales")


# Recap seeds
puts "Creating recaps"
recap1 = Recap.create!(summary: "Harry never knew he was a wizard, and a famous one at that. He grew up with his aunt and uncle and their spoilt son who were all mean to him and punished him every time they could. He had a miserable 10 years with them as an orphan - his parents supposedly died in a car crash. Then one day he got a letter from a huge man named Hagrid who delivered it to a hut on the sea where the family was hiding. He learnt he was a wizard and that he was accepted to a magical school named Hogwarts. There he made new friends for the first time in his life, learned a lot about magic and magical world, and in the end even faced the dark wizard Lord Voldemort who tried to kill him ten years ago. Harry managed to escape yet again and saved a precious Philosopher's stone in the process - a stone that turns any metal into gold and produces the Elixir of Life which makes the drinker immortal. He helped his house win the House Cup as well.

                      WHAT HAPPENED?

                      It was a strange day one October when Vernon Dursley left for work. Owls were seen everywhere, strange people in weird clothes were on every corner, and there was a lot of fireworks all over the country. They made Vernon very jumpy as he didn't want anything to do with magic - which he suspected was at fault for the strange day he was having.
                      The next day didn't improve when Harry, Vernon's orphaned nephew, was found on the Dursley's doorstep. He was brought there that night on a flying motorbike by a man named Rubeus Hagrid, a half-giant and gamekeeper at Hogwarts. Hagrid met with Hogwarts' headmaster Dumbledore and deputy headmistress McGonagall. She was worried about the family Harry was left with after the death of his parents, but Dumbledore was sure he was better off growing among Muggles and not knowing he was famous and why.
                      Harry spent with the family ten miserable years. He was underfed, he slept under the stairs in a small cupboard, he wore his cousin's too big clothes and he was constantly bullied by his aunt, uncle, cousin Dudley and Dudley's friends. It was a stroke of luck that he was allowed to go with the family to the zoo for Dudley's birthday, since his 'nanny' broke her leg. He tried to keep a low profile, but as trouble usually followed him, he somehow managed to let a Boa Constrictor loose and got punished for it.
                      A few days later he got a letter. He didn't even open it when it was taken away. His aunt and uncle knew what it was but never told him. They threw the letter - and hundreds more that came in the mail in the following week - away. Uncle Vernon finally had enough and made them leave home. They traveled far but the mail followed. Finally they ended up in a hut in the middle of the sea where uncle Vernon thought they are safe. It was the day before Harry's birthday. That night at midnight, when Harry wished himself a happy birthday, the door of the hut fell down and a huge man entered.
                      It was Rubeus Hagrid and he brought Harry a cake and a letter. He explained to Harry he was a wizard and that his parents didn't die in a car crash as he was told but were killed by a dark wizard named Voldemort. Hagrid also had a row with uncle Vernon and aunt Petunia about lying to Harry and about Vernon not allowing Harry to leave for magical school Hogwarts where he was accepted. Hagrid put a spell on Dudley that made him grow a pig tail.
                      Harry and Hagrid left for London the next morning to buy all school things. They went through the Leaky Cauldron where Harry met a lot of his fans, and emerged in Diagon Alley. The shopped all day for cloaks and books and potion ingredients. Hagrid bought Harry a snowy owl for his birthday. When shopping for wands, Harry was chosen by a 'sister' wand of the one that killed his parents. They were also at the bank where Hagrid took out a package for Dumbledore while they were picking up Harry's money.
                      On September 1st, Harry was dumped at King's Cross station by his family and left there. He was supposed to go to school from Platform 9 and 3 /4 which was nowhere to be found. Harry grew very worried but then found a wizard family that helped him through the barrier between Platforms 9 and 10 to get on the train.
                      On the train he made friends with Ron Weasley. His family helped Harry get on the Hogwarts Express. He and Ron learnt about each other's worlds, ate a lot of wizard candy and worried about school. They met Neville, who lost a toad, a Hermione, a bossy know-it-all who helped Neville look for the toad. They also met Draco Malfoy, a snotty boy whom Harry already met in Diagon Alley before. They almost fought but Ron's rat Scabbers 'saved the day'.
                      They arrived at Hogsmeade train station in the north of the country by the evening and were taken by boats to a huge castle - Hogwarts. After the sorting, where Harry and Ron were sorted into Gryffindor along with Neville and Hermione, they had a huge feast.
                      Lessons followed and Harry quite enjoyed all of them, except Potions, where their professor Snape was bullying Harry. Harry was convinced Snape hated him. After a terrible first Potions lesson with Snape, Harry and Ron visited Hagrid who lived on school grounds. There they learnt that the attempted robbery at Gringotts happened the day Harry was there. Harry recalled that Hagrid had removed a small package from the vault that had been broken into.
                      When flying lessons started, Harry had a row with Malfoy after he found a Remembrall, a gift from Neville's grandma that the boy lost when he fell off the broom. Harry went after Malfoy to get it and was spotted by professor McGonagall. Instead of punishing him she made him a Seeker in Gryffindor house Quidditch team. He was also gifted a brand new broom, top-of-the-range Nimbus 2000.
                      Draco tricked Ron and Harry, who were (unfortunately) accompanied by Neville and Hermione, when he didn't show up for a midnight duel and left them wandering the corridors dodging the caretaker Filch. They accidentally entered a forbidden corridor and found a huge three-headed dog. After safely back in the Gryffindor tower, Hermione told them that the dog was standing over a trapdoor. Harry concluded that the monster was guarding the package Hagrid retrieved from Gringotts.
                      At Hallowe'en feast professor Quirrel informed all of them there was a troll in the dungeons, and they ran for covers of their dormitories. But Harry and Ron knew about Hermione crying in a toilet and went after her. Before they got her, they had to battle the troll and Ron managed to knock it out. After that they all became close friends.
                      One evening Harry saw Snape's leg being tended after a bite from the dog on Hallowe'en. Snape was the best suspect to steal whatever the dog was guarding. During the game next day, Harry's broomstick went out of control, and Hermione saw Snape staring at Harry and chanting. She ran over to Snape's seat, knocking over Professor Quirrell mid-run, and set fire to Snape's robe. Harry regained control of his broomstick, caught the Snitch, and won the game for Gryffindor. Afterwards, Hagrid let slip that the three-headed dog was his and that the monster was guarding something that belongs to Professor Dumbledore and Nicolas Flamel.
                      Trio started an extensive search about Nicholas Flamel as Harry was sure he read the name somewhere before. Harry stayed at Hogwarts for Christmas, and one of his presents was an Invisibility Cloak. Harry used it to search the library's Restricted Section for Flamel, and while hiding from Filch and Snape, he found the Mirror of Erised. It showed him his family he never met. Harry became addicted to the Mirror and revisited it twice until he was told by Professor Dumbledore that it only shows the viewer their deepest desires and that Harry should stop searching for it as it will be moved.
                      After the holidays they finally found Flamel on a Dumbledore Chocolate Frog card. Hermione brought a book and explained that Flamel is a wizard who owned the only known Philosopher's Stone. They concluded that Snape was after it for the riches.
                      After the next game towards Slytherin that Harry won for Gyffindor in a matter of five minutes, Harry saw Snape sneaking into the Forbidden Forest. There he half-heard a conversation about the Philosopher's Stone between Snape and Quirrell. Harry concluded that Snape was trying to steal the Stone and he needed Quirrel to get past his defenses to get to it.
                      After meeting Hagrid in the library, the trio discovered that Hagrid was raising a dragon, which is against the law, and after Draco saw it as well, they decided to help in smuggling it out of the country around midnight in a few days time. Draco, hoping to get them into trouble, told Professor McGonagall. Even though Harry and Hermione managed to get rid of the dragon, they forgot the Invisibility Cloak and were caught. Harry, Hermione, Draco, and Neville, who was caught by McGonagall as well after looking for Harry to warn him, were punished by helping Hagrid to rescue an injured unicorn in the Forbidden Forest.
                      While in the forest, they met centaurs, who never gave a straight answer if they knew anything about the unicorn. After going further into the forest, Harry and Draco found the wounded animal. Approaching it, they found a creature feeding from it, and Draco fled in terror. The creature then lunged after Harry, but Harry was saved by another centaur named Firenze. Firenze told Harry he just met Voldemort.
                      A few weeks later, Harry asked Hagrid about the dragon egg that was given to him by a hooded stranger. The mysterious man had asked him how to get past the three-headed dog, which Hagrid, very drunk, revealed: with music. Realizing that defenses of the the Philosopher's Stone were now in danger, Harry ran to inform Professor Dumbledore, only to find that the headmaster left for London. Harry figured Snape faked the message to get headmaster out of the way and will try to steal the Stone that night.

                      HOW DID IT END?

                      Harry, Ron and Hermione went after professor Snape through the trap door. As they came over all the obstacles set there by different teachers - a trapping plant, enchanted keys and chess set, and a potion riddle - Harry was left alone with the man who was after the stone. Only it turned out it was Professor Quirrel rather than Snape. Quirrel had Lord Voldemort on the back of his own head under the funny-smelling turban. The last obstacle was the Mirror of Erised and Harry managed to get the stone from it before Quirrel. After Quirrel, by command of Voldemort, demanded it and attacked Harry, Harry managed to save himself with his touch - Quirrel's skin burned and blistered where it came in contact with Harry. Quirrel died, Voldemort escaped and Harry fainted. He woke up in the hospital wing 3 days later. Dumbledore explained that Harry's touch was due to love his mother imprinted on him and it was so good it hurt the evil in Quirrel. He also told Harry the stone was destroyed and that Voldemort will come back and find new ways to get what he wants. At the feast at the end of the year, Harry, Ron and Hermione won Gryffindor 160 points for their saving of the stone, and even Neville got ten points to bump the house into victory over Slytherin. Hagrid presented Harry with an album of his parents and when they left for home, Harry was a little cheerful; his family didn't know he wasn't allowed to do magic.",
                       user_id: user3.id, book_id: book1.id, title: "My recap HP book 1!",
                       keypoint: "Lord Voldemort - a dark wizard in search of great power, who killed many wizards, even Harry's parents.
                      Hogwarts - magical school in Britain for young witches and wizards
                      Muggles - non-magical people
                      Diagon Alley - an alley full of magical shops and stores and a wizard bank Gringotts
                      Gryffindor, Hufflepuff, Raveclaw and Slytherin - four houses of Hogwarts, like families for the school year
                      Quidditch - wizard sport played on brooms
                      Philosopher's stone - a stone that turns any metal into gold and is also used to produce Elixir of Life that makes the drinker immortal")
recap2 = Recap.create!(summary: "IN SHORT

                      Harry's had another terrible summer. None of his friends wrote to him, all his stuff was locked away and Hedwig was miserable, locked in her cage. Harry was in constant fight with his family and it didn't help when he got a visitor on a very important night for his uncle. Dobby the house elf came to warn him to not return to Hogwarts, and after Harry refused, Dobby tricked him. Harry got bars on his window and a cat door for food installed and it was only because of Ron that he escaped his prison.
                      Ron came to rescue Harry with his twin brothers in a flying car. After a successful escape, Harry had a great remainder of summer at the Burrow. More trouble arose after Ron an Harry were unable to go to the Platform 9 3/4 after the passage sealed. They flew Ron's father's car to Hogwarts and got detention for it. But that was only the start.
                      Strange happenings were going on at the school - people kept getting petrified because the heir of Slytherin was letting a monster loose on all the 'Mudbloods'. They all started to suspect Harry after they learnt he can talk to snakes. Harry meanwhile had other troubles as well: he got attacked by a rogue bludger - it turned out to be Dobby's, to get Harry to get home again, just like sealing the passage at the train station was Dobby's work as well.
                      After the number of petrified people was too great, they arrested Hagrid on account of old suspicions, and forced Dumbledore to leave his post as the headmaster. Harry and Ron decided to take matters in their own hands and, with a little help from Hermione, stopped Lord Voldemort from rising again. It turned out he was controlling Ron's sister Ginny to gain power, but Harry killed the beast, and the diary Voldemort was using, to beat him once more.

                      WHAT HAPPENED?

                      Harry's had another terrible summer. None of his friends wrote to him all summer, all his stuff was locked away in the cupboard under the stairs and Hedwig was miserable, locked in her cage, unable to exercise a little. Harry was in constant fight with his family and it didn't help when he got a visitor on a very important night for his uncle.
                      Dobby the house elf came to warn him to not return to Hogwarts, because bad things will happen in the next school year. He told Harry he was holding back all his letters because he thought that might persuade Harry to stay home. But Harry disregarded the warning so Dobby got Harry in trouble when he made the after-dinner pudding crash in the kitchen. After that Dobby disappeared and Harry got a letter from the ministry with a warning, since he's not allowed to do magic outside of school. Dinner with the investor was therefore ruined; the Dursleys were super mad and locked Harry in his room. Uncle Vernon had bars installed on Harry's window and a cat flap in his door for 3 lame meals per day.
                      Harry was rescued long and lonely days later by his friend Ron and Ron's twin brothers Fred and George in their flying car, spending the summer at the Weasley home the Burrow and having the best time. When traveling to Diagon Alley to get books, Harry accidentally ended up in Knockturn Alley, a place for dark arts lovers, in a weird shop. Hiding in a wardrobe, he saw Draco and his father come in and make some selling arrangements. Fortunately, Hagrid (who was buying flesh-eating slug repellent) guided Harry safely to Diagon Alley to shop for school supplies.
                      In the company of the Weasleys, Harry met the famous Gilderoy Lockhart while buying new schools books. Lockhart announced he will be the new Defense Against the Dark Arts teacher at Hogwarts, got a photo with Harry for The Daily Prophet and gifted Harry his entire works. While leaving, they met Draco and his father again. Mr. Weasley and Mr. Malfoy got in a row and had to be forcefully separated.
                      Soon after, the Weasleys departed with Harry to go to the train station on September 1st. They were rather late coming there and they all hurried to the passage to the Hogwarts platform. Harry and Ron went last and when they try to go through together, they crashed. The passage was sealed so they couldn't cross. They missed the train for school, so Ron had an idea to fly the Weasley's car to Hogwarts instead.
                      They made it almost to school before the car started acting weird. Ron lost his control over the car and it fell down from the sky and crashed into a Whoomping Willow - an old tree which attacks any person that comes near. Ron and Harry escaped from it but lost the car in the process. It ran straight for the forest. Harry and Ron were found by Snape, led to his office, yelled at and interrogated by Snape, McGonagall and Dumbledore. They both got detention and the next day, Molly Weasley sent a Howler to Ron, threatening to bring him home if he puts a toe out of line. Ron also broke his wand in the crash and was now having troubles with it.
                      Their first DADA lesson was a disaster. Lockhart was an incompetent teacher, more concerned with personal accomplishment than teaching. He quizzed the class on his favorite color etc. and only Hermione managed to answer correctly on all questions. He also let loose a cage of Pixies and left Harry, Ron and Hermione to deal with them after they went berzerk.
                      On Halloween, Filch's cat, Mrs. Norris, was petrified. “The Chamber of Secrets has been opened, enemies of the heir beware.” writing was found scrawled on a wall in the castle in big red letters. Harry, Ron and Hermione discoveredd that one of Hogwarts' founders, Salazar Slytherin, secretly built the Chamber of Secrets, which is rumoured to contain a monster only Slytherin's heir can have under direct control. The monster was there to purge the school of all Mudbloods.
                      Harry was training harder and more often with the team to win the Quidditch cup this year, and one day just before they started training, Slytherins came to take over the pitch. They had to 'break in' the new seeker that turned out to be Draco Malfoy. The other new thing were new brooms for the whole team - Numbus 2001 - that Draco's father bought for the Slytherins. That caused Hermione to point out at least nobody in Gryffindor team had to buy their way in, to which Draco replied with an insult 'Mudblood'. That resulted in a huge uproar and Ron blasting a curse at Draco, that backfired. Ron was throwing up slugs for a few hours that day.
                      First Quidditch game of the season, Harry was pursued by a rogue Bludger, which caused Harry's arm to be broken, but Harry still managed to catch the snitch and win the game. Lockhart volunteered to heal the broken bones in Harry's arm but removed them completely instead. That night, as Harry was in the hospital regrowing his bones, Dobby appeared and admitted he was the one that sealed the passage to the platform and set the Bludger after Harry. He begged Harry to leave Hogwarts again, sensing that he is in a grave danger and likely will die if he doesn't comply with him.
                      The talk with Dobby was interrupted by a new arrival at the hospital wing. Colin Creevey, was attacked and petrified and brought in by Dumbledore and McGonagall. They hoped he might have caught the attacker on his camera but the film was fried. Dumbledore admitted that the Chamber has been opened again for sure.
                      During the first meeting of Lockhart's new dueling club, Harry dueled with Draco, who cast a spell that produced a snake. After Lockhart unsuccessfully tried to get rid of it, the snake tried to attack a student. Harry unwittingly spoke Parseltongue and stopped the snake from attacking a boy. Harry's ability frightened everyone because Salazar Slytherin was also able to speak Parseltongue, and his heir would also have this ability, causing everybody in the school to think that Harry is actually Slytherin's heir.
                      Suspecting that Draco is actually the heir of Slytherin, the trio decided to make Polyjuice Potion, a brew which allows the drinker to look like someone else for a limited amount of time. The ingredients were hard to come by and they had to steal from Snape in order to finish it, but making of the potion still took a whole month and it was ready on Christmas.
                      Harry came under further suspicion when he stumbled upon the petrified bodies of Justin Finch-Fletchley (the student who was almost attacked by the snake), and the Gryffindor's ghost Nearly Headless Nick. He was brought before Dumbledore, who assured him Harry is not a suspect in his eyes. At Christmas, Harry and Ron used the finished Polyjuice Potion to disguise themselves as Crabbe and Goyle, while Hermione was supposed to turn in Milicent Bulstrode. Hermione's transformation went south so Harry and Ron had to infiltrate Slytherin's common room by themselves. They discovered that Draco was not the heir of Slytherin, and that the Chamber was opened 50 years before when a Muggle-born girl died.
                      After a few quiet months, Harry found a diary in a flooded bathroom. It turned out somebody threw it through Moaning Myrtle's head while presumably trying to get rid of it. The diary seemed empty and didn't yield any information, until Harry's ink spilled all over it and the diary stayed dry and spotless. Harry wrote in the diary, which responded in writing, telling Harry it's Tom Riddle's, a boy who was at Hogwarts 50 years before. Harry was shown the events after the death of the Muggle-born girl half a decade ago when Tom accused Hagrid, then in third year of schooling, of opening the Chamber of Secrets and being responsible for the girl's death. That resulted in Hagrid's expulsion.
                      Some time later, Harry's room was ransacked and the diary was taken. Harry tried to figure out which Gryffindor student took it. On the day of the next game Hermione got an idea and left for the library before the game. The game never started, however; Hermione and a Ravenclaw girl were found petrified as well. Harry and Ron intended to question Hagrid, but before they could, he was accused of opening the Chamber of Secrets again, and was sentenced to Azkaban prison. On the same evening, while Harry and Ron were hiding in the hut under the cloak, Dumbledore was asked to stand down as the headmaster by Lucius Malfoy. Before Hagrid was led away, he secretly instructed Harry and Ron to “follow the spiders” to learn the truth, while Dumbledore hinted that “Help will always be given at Hogwarts to those who ask for it.”.
                      Not long after that Harry and Ron followed the spiders to the Forbidden Forest. There they encountered Aragog, a giant spider, who told them the monster that killed the girl 50 years before was not him (as suspected), that the girl's body was found in a bathroom, and that Hagrid is innocent. After that Aragog left them to be eaten by his enormous family, but they managed to escape with the help of Mr Weasley's car that was living in the wild ever since the crash.
                      Going back to the castle they realised that Moaning Myrtle, the ghost who haunted the bathroom where they made the Polyjuice Potion, must have been the girl Aragog was referring to. Harry and Ron were caught in the corridors after one class and lied to McGonagall they wanted to visit Hermione. After they got the approval, they went straight to hospital wing. There Harry found a piece of paper clutched in Hermione's hand. It said that the monster in the Chamber is a Basilisk, a giant snake that kills those who look it in the eye. Harry and Ron figured out why nobody has died yet: none of the petrified people saw the snake directly. Hermione also wrote “pipes”, making the boys realize that's how the snake has been traveling around.
                      They left to inform professor McGonagall about what they learned, but nobody was in the staff room. Soon after there was an announcement that all students should return to their dormitories while all the staff should meet in the staff room. They hid in a coat closet and listened: Ron's sister Ginny has been taken into the Chamber. When Lockhart barged in, utterly ignorant, all professors told him his time has finally come; he must go get Ginny.
                      Realising he's their only hope, Ron and Harry left for Lockhart's office to tell him all they knew. Instead of preparing to save Ginny, Lockhart was packing to leave. It turned out he was not responsible for the stuff in his books; he stole the credit from other wizards and modified their memories. He tried to attack Harry and Ron as well, but they were too fast. They marched him to Myrtle's toilet to ask about her death. With her help they discovered the entrance to the Chamber of Secrets.
                      Sliding down the tunnel they ended up far below the castle. Lockhart, momentarily forgotten by the boys, stole Ron's wand and attempted a memory charm on the boys, trying to take all the credit again, this time for the Chamber. As he prepared to erase their memories, Ron's broken wand backfired the spell back at Lockhart, knocking him down and erasing all of his memories. The bang also caved the tunnel in and separated Harry from Ron. Harry was forced to go on alone while Ron was left to shift some rocks.

                      HOW DID IT END?

                      Harry soon found a door with two snakes and opened it using Parseltongue. Inside the chamber, Harry found Ginny unconscious and barely alive, as well as the almost-physical form of Tom Riddle. He learned it was Riddle who Ginny has been communicating with through the diary - by revealing all her deepest secrets, she poured her soul into it. Soon Riddle was able to pour some of his own back into her to possess her. She was the one killing all Hagrid's roosters, she wrote the messages on the walls and she let the Basilisk loose in school. Ginny realised that the diary wasn't what it seemed to be and tried to dispose of it in Myrtle's bathroom, but stole it back when she saw Harry with it, afraid that her crimes would be revealed. Riddle then forced Ginny to enter the Chamber in order to lure Harry down after her, and by possessing Ginny's soul, Tom began to take physical form, feeding on her receding energy. Riddle also revealed that Tom Marvolo Riddle is an anagram for I am Lord Voldemort.
                      Riddle then summoned the Basilisk and had it attack Harry. Just when it seemed Harry will die, Fawkes, Dumbledore's phoenix, appeared and blinded the Basilisk. Fawkes also brought Harry the Sorting Hat, which Harry used to ask for help, hanging on Dumbledore's words. The hat gave Harry a sword with which Harry killed the Basilisk, but one of its fangs pierces Harry's arm nevertheless, dooming him to die. Harry almost gave up under the triumphant stare of Riddle, when Fawkes saved him - phoenix tears have healing powers. Fawkes then brought Harry the diary that lay discarded by Ginny, and Harry stabbed it with a Basilisk fang, defeating Riddle and saving Ginny. The two returned to Ron and Lockhart with Fawkes, who carried them all back up to school.
                      They burst into McGonagall's office where Ginny was reunited with her parents and sent to the hospital, and Ron and Harry got congratulated by Dumbledore and won 400 points total for their house. Ron was sent to send an owl to bring Hagrid back while Harry was assured he was a true Gryffindor by Dumbledore. Their talk was interrupted by Lucius Malfoy who was mad Dumbledore was back. Headmaster told him all the other school governors were suddenly okay with Dumbledore returning. He also informed Malfoy about Harry saving the day. In the aftermath, Harry accused Lucius Malfoy of putting the diary in Ginny's cauldron and was set on returning it. He tricked Malfoy to drop the sock the diary was wrapped in which saved Malfoy's house-elf Dobby.",
                       user_id: user3.id, book_id: book2.id, title: "Potter 2 in short",
                       keypoint: "Lord Voldemort - a dark wizard in search of great power, who killed many wizards, even Harry's parents
                       Hogwarts - magical school in Britain for young witches and wizards
                       Muggles - non-magical people
                       Diagon Alley - an allex full of magical shops and stores and a wizard bank Gringotts
                       Gryffindor, Hufflepuff, Raveclaw and Slytherin - four houses of Hogwarts, like families for the school year
                       Quidditch - wizard sport played on brooms
                       Chamber of Secrets - a chamber within the school that holds a monster that kills Muggle-borns to clean up the school. Created by Salazar Slytherin, made to be operated only by his true heir (Lord Voldemort)
                       Mudblood - a Muggle-born witch or wizard, a wizard of 'bad blood'
                       House-elf - an elf in servitude of a wizarding family; free only if presented with clothes")
recap3 = Recap.create!(summary: "Feyre is a human and she goes back to Tamlin's Spring Court as part of a deal. He's meant to get her to fall in love with him to break a curse. Tamlin and co. are captured by Queen Amarantha and Feyre has to complete three tasks to rescue them. Rhysand, the guy from the Night Court, helps her out a bit. Feyre solves the riddle as she's about to die and frees the Fae. She actually does die but the Fae turn her into one of them and she's kind of reborn. She goes back to the Spring Court with Tamlin, for some unknown reason.
                      Feyre goes out hunting and kills a wolf.
                      A faerie called Tamlin goes to Feyre's house and demands payment for the dead wolf. Feyre decides to go to live with him in Prythian.
                      Tamlin is the High Lord of the Spring Court.
                      Feyre discovers that the Fae wear masks that are magically attached to their faces. Lol. The Fae are worried that a plight that is affecting their magic might spread to the human realm.
                      Feyre captures a Suriel to get information. He tells her that the ruler of Hybern, a neighbouring kingdom, doesn't like the treaty that the Fae have with the humans. This ruler sent Fae over to spy on the other courts. Fifty years ago, they were disobeyed by one of their commanders.
                      Feyre gets attacked and Tamlin saves her.
                      A faerie gets his wings ripped off and is heard saying “she took them”. “She” is referring to the queen of Prythian, Amarantha. Amarantha hates humans because her sister, Clythia, fell in love with a human who then betrayed her.
                      Feyre and Tamlin kiss in a field. It's very Twilight.
                      The High Lord of the Night Court, Rhysand, makes an appearance. Tamlin asks him not to tell Amarantha about Feyre being there. Feyre tells Rhysand that her name is Clare.
                      Tamlin sends Feyre home.
                      The house of the real Clare is burnt down. Oops.
                      Feyre returns to the Spring Court.
                      Feyre learns that Amarantha cursed Tamlin when he refused to become her lover. He has to have a human girl fall in love with him.
                      Tamlin and the rest of his court are with Amarantha. Feyre is found and taken to her as well.
                      Feyre makes a deal with Amarantha. Over the course of three months, she has to complete three tasks. If she manages this then everyone will be freed. Alternatively, she could solve a riddle to free them immediately.
                      Feyre completes the first task but gets injured. Rhysand heals her in return for her company once a month for the rest of her life. He tattoos her hand.
                      Feyre can't read so completing the second task - a riddle - is an issue. Rhysand helps her and admits he wants to be free of the queen.
                      For the third task, Feyre has to kill three Fae. She kills two, but the third is Tamlin so she's kind of stuck. Then she remembers that Tamlin (literally) has a heart of stone so she stabs him there.
                      Amarantha refuses to free the Fae. She starts hurting Feyre. Feyre solves the riddle and the Fae are released.",
                       user_id: user4.id, book_id: book3.id,
                       title: "ACOTAR", keypoint: "Amarantha kills Feyre. Tamlin kills Amarantha.
                       The Fae brnig Feyre back to life. Feyre becomes a High Fae.
                       Feyre is still bonded to Rhysand so will have to spend a lot of time with him. Ugh.
                       Feyre goes home with Tamlin.")
recap4 = Recap.create!(summary: "America is now a meritocracy, where citizens are selected based on the results of a test taken at 17, where they are ranked from I to VI according to their intelligence. Kitty Doe, an Extra, receives a III, which is bad, but not as bad as a II or a I. She decides to commit assignment fraud, and stay in DC as a prostitute.
                      But she's found by Daxton Hart, the Prime Minister, who offers her a rank VII. She agrees, and is turned into Lila Hart's (Daxton's niece) clone. She is expected to retract all of Lila's anti-governmental messages. But Celia, Lila's mother and Knox, her fiance, want her to support Lila's cause, and Kitty agrees after she sees first hand the lies the government has been telling the people.
                      Celia spearheads a plan to kill Daxton, with Kitty's help, but Kitty fails at the last moment, and Daxton goes into coma. After Kitty's first speech as Lila, Knox and Kitty come home to find that Celia has kidnapped Grayson with the intention of killing him. Knox reveals that Lila is really alive. They decide to trade Lila for Grayson. But when the time comes, Augusta plays a mean trick, forcing Celia to choose which girl is her real daughter. Celia chooses wrong, and Augusta shoots Lila (with a tranquilizer dart, which Celia doesn't know). The attempt to rescue Grayson, Lila and Benjy (Kitty's boyfriend) is foiled when Augusta discovers them and stabs Lila with a poker. When she's about to kill Benjy too, Kitty kills Augusta. Lila survives, but doesn't want to risk her life for the rebellion, so Kitty takes her place as the face of the rebellion.",
                       user_id: user1.id, book_id: book4.id,
                       title: "My cool recap", keypoint: "Daxton wakes up, but seems to have forgotten everything that happened in the last six weeks. He thinks that Lila is still alive.
                       Lila survives. During Augusta's funeral, Kitty finds out that Daxton actually remember everything that happened. When he threatens her, she blackmails him with the fact that she knows his secret, and so does Knox, and Grayson, who was never fooled.
                       Since Lila is not interested in putting her life at risk  for the rebellion, Kitty accepts her position.")
recap15 = Recap.create!(summary: "Ever since Harry Potter had come home for the summer, the Dursleys had been so mean and hideous that all Harry wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as he's packing his bags, Harry receives a warning from a strange impish creature who says that if Harry returns to Hogwarts, disaster will strike.
                        And strike it does. For in Harry's second year at Hogwarts, fresh torments and horrors arise, including an outrageously stuck-up new professor and a spirit who haunts the girls' bathroom. But then the real trouble begins - someone is turning Hogwarts students to stone. Could it be Draco Malfoy, a more poisonous rival than ever? Could it possible be Hagrid, whose mysterious past is finally told? Or could it be the one everyone at Hogwarts most suspects… Harry Potter himself!",
                        user_id: user8.id, book_id: book1.id, title: "My sorcers recap",
                        keypoint: "First book in this awesome series")
recap5 = Recap.create!(summary: "Matt is El Patrón's clone, and is seen as nothing but an organ donor by everyone around him, minus Celia, Tam Lin, and María. He grows up being told that he's less than human. El Patrón becomes sick, and tries to take Matt's heart, but Celia had been poisoning Matt with arsenic, so his heart is useless and would kill El Patrón anyway. Matt escapes into Aztlán, and is found by the Keepers. There, he makes some friends, is almost killed, but once again he escapes. He reunites with María at the convent, and then flies back to Opium to take the country back. Celia, Daft Donald, and Mr Ortega are all there. Tam Lin and the rest all died with El Patrón. Matt is now in control of Opium.",
                       user_id: user2.id, book_id: book5.id,
                       title: "My Summary", keypoint: "Opium - The country between Aztlán and the United States, which El Patrón rules. It's basically a giant drug empire.
                       Aztlán - Where El Patrón grew up. Used to be called Mexico.
                       Eejit - A slave who has a computer chip in their brain to make them docile. They don't have a mind of their own, and always follow orders to the death.
                       Keepers - People in Aztlán who recruit young teenagers to do their work while they smuggle drugs into Aztlán.
                       Farm Patrol - The police force of Opium, who make sure no immigrants get through, and nobody escapes.")
recap6 = Recap.create!(summary: "A Wrinkle in Time is a young adult novel written by American author Madeleine L'Engle. First published in 1962, the book won the Newbery Medal, the Sequoyah Book Award, the Lewis Carroll Shelf Award, and was runner-up for the Hans Christian Andersen Award. The main characters—Meg Murry, Charles Wallace Murry, and Calvin O'Keefe—embark on a journey through space and time, from galaxy to galaxy, as they endeavor to save the Murrys' father and the world. The novel offers a glimpse into the war between light and darkness, and good and evil, as the young characters mature into adolescents on their journey.
                       The novel wrestles with questions of spirituality and purpose, as the characters are often thrown into conflicts of love, divinity, and goodness. It is the first book in L'Engle's Time Quintet, which follows the Murrys and Calvin O'Keefe.
                       L'Engle modeled the Murry family on her own. Scholar Bernice E. Cullinan noted that L'Engle created characters who \"share common joy with a mixed fantasy and science fiction setting.\" The novel's scientific and religious undertones are therefore highly reflective of the life of L'Engle.",
                       user_id: user4 .id, book_id: book6.id, title: "What happened",
                       keypoint: "Margaret \"Meg\" Murry - Meg is the oldest child of scientists Alex and Kate Murry, about thirteen years old. Introduced on the first page of the book, she is the story's main protagonist One of Kate Murry's \"abnormal\" children, she seems to have a temper and a difficult time focusing in school.
                       Charles Wallace Murry - Charles Wallace is the youngest Murry child, at six years old. Charles Wallace speaks only to his family, but can empathically or telepathically read certain people's thoughts and feelings.
                       Calvin O'Keefe - Calvin is the third oldest of Paddy and Branwen O'Keefe's eleven children: a tall, thin, red-haired 14-year-old high school junior.")
recap7 = Recap.create!(summary: "In Charlie Hall's world, shadows can be altered, for entertainment and cosmetic preferences—but also to increase power and influence. You can alter someone's feelings—and memories—but manipulating shadows has a cost, with the potential to take hours or days from your life. Your shadow holds all the parts of you that you want to keep hidden—a second self, standing just to your left, walking behind you into lit rooms. And sometimes, it has a life of its own.
                       Charlie is a low-level con artist, working as a bartender while trying to distance herself from the powerful and dangerous underground world of shadow trading. She gets by doing odd jobs for her patrons and the naive new money in her town at the edge of the Berkshires. But when a terrible figure from her past returns, Charlie's present life is thrown into chaos, and her future seems at best, unclear—and at worst, non-existent. Determined to survive, Charlie throws herself into a maelstrom of secrets and murder, setting her against a cast of doppelgangers, mercurial billionaires, shadow thieves, and her own sister—all desperate to control the magic of the shadows.
                       With sharp angles and prose, and a sinister bent, Holly Black is a master of shadow and story stitching. Remember while you read, light isn't playing tricks in Book of Night, the people are.",
                       user_id: user7.id, book_id: book7.id, title: "The recap",
                       keypoint: "#1 New York Times bestselling author Holly Black makes her stunning adult debut with Book of Night, a modern dark fantasy of shadowy thieves and secret societies in the vein of Ninth House and The Night Circus")
recap8 = Recap.create!(summary: "On their fifth wedding anniversary, writing teacher Nick Dunne returns home to find his wife Amy missing. Her disappearance receives press coverage, as Amy was the inspiration for her parents' popular Amazing Amy children's books. Detective Rhonda Boney finds poorly concealed evidence of a struggle in the house. Suspicion mounts around Nick, whose apathy is interpreted by the media as characteristic of a sociopath and even sows doubt in his twin sister Margot.
                       In the past Amy revealed to Nick that Amazing Amy was a perfected version made up of the real Amy's failures. Their marriage disintegrated over time; both lost their jobs in the recession and moved from New York City to Nick's hometown of North Carthage, Missouri, to care for his dying mother. Nick became lazy and distant, and began cheating on Amy with Andie, one of his students, while Amy became increasingly resentful towards Nick for making her move with him to Missouri.",
                       user_id: user8.id, book_id: book8.id, title: "Gone Girl recap",
                       keypoint: "Nick intends to leave Amy, but she reveals she is pregnant, having inseminated herself with Nick's sperm stored at a fertility clinic. Nick reacts violently to Amy's insistence that they remain married, but feels responsible for the child. Despite Margot's objections, he reluctantly decides to stay with Amy. The \"happy\" couple announce on a television interview that they are expecting a child.")
recap9 = Recap.create!(summary: "If someone were to ask Jasmine Santos to describe the last few years of her life with a single word, it would definitely be a four-letter one.After seventeen years—and countless broken bones and broken promises—she knows her window to compete in figure skating is coming to a close.But when the offer of a lifetime comes in from an arrogant idiot she's spent the last decade dreaming about pushing in the way of a moving bus, Jasmine might have to reconsider everything.Including Ivan Lukov.",
                       user_id: user1.id, book_id: book9.id, title: "My Love for Lukov",
                       keypoint: "From Lukov with love is my favorite book by Mariana Zapata
                       I loved Kulti - so I just had to add from Lukov with love to my ''to be read list'' - guys I wasn't disappointed. I enjoyed the banter too much and the slow build up was everything I didn't know I wanted. This book was humorous and Jasmine's family oh boy I wish my family was like that! I laughed so much, I didn't care if people saw me laughing randomly in public.
                       I highly recommend this book if you just love a good slow burn!")
recap10 = Recap.create!(summary: "Grimms' Fairy Tales, originally known as the Children's and Household Tales (German: Kinder- und Hausmärchen, is a German collection of fairy tales by the Grimm brothers or \"Brothers Grimm\", Jacob and Wilhelm, first published on 20 December 1812. This first edition contained 86 stories, and by the seventh edition in 1857, it had 210 unique fairy tales.",
                        user_id: user3.id, book_id: book10.id, title: "Fairytails in short",
                        keypoint: "Achim von Arnim and Clemens Brentano were good friends of the brothers and wanted to publish folk tales, so they asked the brothers to collect oral tales for publication. The Grimms collected many old books and asked friends and acquaintances in Kassel to tell tales and to gather stories from others. Jacob and Wilhelm sought to collect these stories in order to write a history of old German Poesie and to preserve history.")
recap11 = Recap.create!(summary: "The narrative alternates between the point of view of Nick and Amy Dunne (née Amy Elliott). Nick's narration begins shortly after arriving home on his fifth wedding anniversary to find Amy is missing from their home; there are signs of a struggle. Amy's narration comes in the form of her diaries and follows the earlier stages of their relationship.
                        The diary entries describe how Amy met Nick in New York City, where they both worked as writers. Nick was a journalist who wrote movie and TV reviews, while Amy wrote personality quizzes for women's magazines. After two years of dating, they married. The couple lived in a beautiful brownstone home in Brooklyn where they were happy.
                        In 2009, both Nick and Amy lost their jobs following the Great Recession; Amy's parents Rand and Marybeth, meanwhile, had written a successful childhood book series called \"Amazing Amy,\" based on Amy's life experiences. However, when sales from the books started declining and Rand and Marybeth didn't curb their spending, they also started facing financial issues. Their solution was to ask Amy for money from the trust fund they started for her.",
                        user_id: user2.id, book_id: book8.id, title: "Gone recap girl",
                        keypoint: "Jim Gilpin: A detective who participated in Nick's investigation. He is described by Nick as having \"fleshy bags under his eyes\" and \"scraggly white whiskers in his mustache.\"")
recap12 = Recap.create!(summary: "A Court of Thorns and Roses is a new adult high fantasy novel series by American author Sarah J. Maas, beginning with the novel of the same name, released in May 2015. The story follows the journey of mortal Feyre Archeron after she is brought into the faerie lands of Prythian for murdering a faerie, and the epic love story and fierce struggle that happens after she enters the fae lands.",
                        user_id: user8.id, book_id: book3.id, title: "Roses recapped",
                        keypoint: "In March 2021, it was announced that A Court of Thorns and Roses series had been opted for a television adaptation by Hulu. The series is set to be developed by Ronald D. Moore, alongside Maas")
recap13 = Recap.create!(summary: "In March 2021, it was announced that A Court of Thorns and Roses series had been opted for a television adaptation by Hulu. The series is set to be developed by Ronald D. Moore, alongside Maas",
                        user_id: user7.id, book_id: book4.id, title: "Pawned or Recapped",
                        keypoint: "Previously titled Masked.")
recap14 = Recap.create!(summary: "Ever since Harry Potter had come home for the summer, the Dursleys had been so mean and hideous that all Harry wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as he's packing his bags, Harry receives a warning from a strange impish creature who says that if Harry returns to Hogwarts, disaster will strike.
                        And strike it does. For in Harry's second year at Hogwarts, fresh torments and horrors arise, including an outrageously stuck-up new professor and a spirit who haunts the girls' bathroom. But then the real trouble begins - someone is turning Hogwarts students to stone. Could it be Draco Malfoy, a more poisonous rival than ever? Could it possible be Hagrid, whose mysterious past is finally told? Or could it be the one everyone at Hogwarts most suspects… Harry Potter himself! ",
                        user_id: user6.id, book_id: book2.id, title: "Secret of HPCOS",
                        keypoint: "Book two in the Harry Potter Series")

# Rating seeds
puts "Creating ratings"
Rating.create!(comment: "This a very good recap. It really helped me to remember.",
               star: "4", user_id: user5.id, recap_id: recap1.id)
Rating.create!(comment: "Very descriptive.",
               star: "5", user_id: user1.id, recap_id: recap1.id)
Rating.create!(comment: "Great recap. Thanks!",
               star: "3", user_id: user2.id, recap_id: recap1.id)
Rating.create!(comment: "Not sufficient. I missed the part where Harry Potters and Ron did have this huge fight.",
               star: "2", user_id: user1.id, recap_id: recap2.id)
Rating.create!(comment: "Really helped me to catch up on everything and prepare for the next part.",
               star: "5", user_id: user6.id, recap_id: recap3.id)
Rating.create!(comment: "Loved this!!!",
               star: "5", user_id: user3.id, recap_id: recap4.id)
Rating.create!(comment: "This a very a very bad summary. There was missing a really important part.",
               star: "2", user_id: user3.id, recap_id: recap5.id)
Rating.create!(comment: "This sucked I loved this book but this is not what happened",
               star: "1", user_id: user4.id, recap_id: recap5.id)
Rating.create!(comment: "Boo",
               star: "1", user_id: user5.id, recap_id: recap15.id)
Rating.create!(comment: "So poor Harry is stuck back with the Dursley's on Privet Drive.",
               star: "2", user_id: user7.id, recap_id: recap15.id)
Rating.create!(comment: "This was a cute middle grade book. Even though it was slow, I liked it a little more than the first book since at this point the world has already been established and now we get to see more of the characters and the setting.",
               star: "3", user_id: user6.id, recap_id: recap15.id)
Rating.create!(comment: "I really enjoyed this one (as did millions of others, obviously) and, with this installment, I am definitely seeing why this is such a beloved series. The magical wizarding world of Harry, his friends, and the folks at Hogwart's is just FUN to read about.",
               star: "4", user_id: user8.id, recap_id: recap14.id)
Rating.create!(comment: "The Foundation series is a science fiction book series written by Russian American author Isaac Asimov.",
               star: "3", user_id: user6.id, recap_id: recap13.id)
Rating.create!(comment: "Honestly, I don't get why this book/series is so popular.",
               star: "5", user_id: user4.id, recap_id: recap12.id)
Rating.create!(comment: "Comparing this to the prequels, indeed, any of the prequels, only makes THIS book shine like a diamond.",
               star: "4", user_id: user8.id, recap_id: recap10.id)
Rating.create!(comment: "I tend to love the concepts but the writing is usually dry and the sexism/racism/homophobia tends to ruin it for me. ",
               star: "4", user_id: user8.id, recap_id: recap9.id)
Rating.create!(comment: "Second reading: I really like that Isaac Asimov's The Foundation holds up! I'd been looking forward to reading the first three books in the series in one go and I'm excited to continue.",
               star: "4", user_id: user1.id, recap_id: recap8.id)
Rating.create!(comment: "Absolutely Loved it! Hail Asimov! He is brilliant! His writing is enchanting and filled with awe inspiring genius. Work of sheer Ingenuity! Height of Inventiveness!",
               star: "5", user_id: user2.id, recap_id: recap7.id)
Rating.create!(comment: "Great recap thanks a ton!",
               star: "4", user_id: user8.id, recap_id: recap6.id)

# Favorites seeds
puts "Creating favorites"
Favorite.create!(user_id: user5.id, recap_id: recap1.id)
Favorite.create!(user_id: user1.id, recap_id: recap2.id)
Favorite.create!(user_id: user4.id, recap_id: recap10.id)
Favorite.create!(user_id: user3.id, recap_id: recap4.id)
Favorite.create!(user_id: user2.id, recap_id: recap5.id)
Favorite.create!(user_id: user6.id, recap_id: recap6.id)
Favorite.create!(user_id: user4.id, recap_id: recap8.id)
Favorite.create!(user_id: user5.id, recap_id: recap11.id)
Favorite.create!(user_id: user4.id, recap_id: recap13.id)
Favorite.create!(user_id: user8.id, recap_id: recap12.id)

puts 'All done seeding'
