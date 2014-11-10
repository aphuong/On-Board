# users
def adduser(email, password)
  @user = User.invite!(:email => email) do |u|
  u.skip_invitation = true
  end
  token = Devise::VERSION >= "3.1.0" ? @user.instance_variable_get(:@raw_invitation_token) : @user.invitation_token
  User.accept_invitation!(:invitation_token => token, :password => password, :password_confirmation => password)

  puts "Created User #{email} with password #{password}"
  @user
end

user1 = adduser("anh@nycda.com", "12345678")
user2 = adduser("nathan@nycda.com", "12345678")
user3 = adduser("alex@nycda.com", "12345678")
user4 = adduser("keika@nycda.com", "12345678")
user5 = adduser("angas@nycda.com", "12345678")
user6 = adduser("ben@nycda.com", "12345678")
user7 = adduser("emerson@nycda.com", "12345678")
user8 = adduser("franky@nycda.com", "12345678")
user9 = adduser("ken@nycda.com", "12345678")
user10 = adduser("maneesh@nycda.com", "12345678")
user11 = adduser("shoaib@nycda.com", "12345678")
user12 = adduser("jason@nycda.com", "12345678")
user13 = adduser("eric@nycda.com", "12345678")


# ----users profile----
user1.fname = "Anh"
user1.lname = "LaRusso"
user1.location = "Booklyn"
user1.github_username = "aphuong"
user1.twitter_username = "aphu420"
user1.tumblr_username = "aphu420"
user1.linkedin_username = "anhlarusso"
user1.goal = "I want to develop the skills to be a junior developer."
user1.fun_fact = "I ride a tandem bike."
user1.pre_wdi = "I was a former NYC teacher and College Academic and Career Advisor."
user1.save

user2.fname = "Nathan"
user2.lname = "Brown"
user2.location = "Queens"
user2.github_username = "nkabrown"
user2.twitter_username = "nkabrownie"
user2.tumblr_username = "nkabrown"
user2.linkedin_username = "nkabrown"
user2.goal = "To meet great people."
user2.fun_fact = "I went through kindergarden twice."
user2.pre_wdi = "I was locked in a cubical as a prisoner of a bank."
user2.save 

user3.fname = "Alex"
user3.lname = "Handler"
user3.save         

user4.fname = "Keika"
user4.lname = "Jones"
user4.save

user5.fname = "Angas"
user5.lname = "Reid"
user5.save

user6.fname = "Ben"
user6.lname = "Loustau"
user6.save

user7.fname = "Emerson"
user7.lname = "Scherer"
user7.save

user8.fname = "Franky"
user8.lname = "Ni"
user8.save

user9.fname = "Ken"
user9.lname = "Guie"
user9.save

user10.fname = "Maneesh"
user10.lname = "Anand"
user10.save

user11.fname = "Shoaib"
user11.lname = "Shaikh"
user11.save

user12.fname = "Jason"
user12.lname = "Yim"
user12.save

user13.fname = "Eric"
user13.lname = "Herskovic"
user13.save


# ----admin----
admin = Admin.create do |a|
  a.fname = "Robin"
  a.email = "robin@nycda.com"
  a.password = "12345678"
end

# ----announcements----
announ1 = Announcement.create do |a|
  a.body = "Please note that Thinkful will be closing access to their online portal for WDI students on September 14."
end

announ2 = Announcement.create do |a|
  a.body = "To email your class as a whole, please use: wdisept2014@nycda.com"
end


# ----todos----
todo1 = Todo.create do |t|
  t.body = "Install the latest version of Ruby, Git, and other developer tools on your system"
end

todo2 = Todo.create do |t|
  t.body = "Complete HTML101"
end

todo3 = Todo.create do |t|
  t.body = "Complete sections 1 and 2 of FEWD001"
end

todo4 = Todo.create do |t|
  t.body = "Optional: complete section 3 and 4"
end

todo5 = Todo.create do |t|
  t.body = "Setup a HipChat account"
end

todo6 = Todo.create do |t|
  t.body = "Start a blog on Tumblr, share your Tweets and create a LinkedIn account"
end

# ----projects----
project_1 = Project.create do |p|
  p.user_id = 1
  p.title = "Shopping List App"
  p.project_url = "http://aphuong.github.io/shoppinglist/"
  p.string = "shoppinglist.png"
  p.description = "This project was built using JavaScript and JQuery."
end

project_2 = Project.create do |p|
  p.user_id = 1
  p.title = "Dog Breed Quiz"
  p.project_url = "http://aphuong.github.io/dog_breed_quiz/"
  p.string = "quiz.png"
  p.description = "Play the Mystery Dog Breed Game!"
end

project_3 = Project.create do |p|
  p.user_id = 1
  p.title = "FizzBuzz Refactor"
  p.project_url = "http://aphuong.github.io/fizzbuzz-refactor/"
  p.string = "fizzbuzz.png"
  p.description = "The FizzBuzz Refactor tells you if your number fizz, buzz or fizzbuzzes!"
end






