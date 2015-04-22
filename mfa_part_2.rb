require 'json'
f = File.new("./mfa.txt", "r")
data = JSON.parse(f.read)
f.close

# gets user email and password
puts "Email?"
email = gets.chomp
record = data[email]
if record == nil
  puts "Invaild user"
  exit
else
  puts "Password?"
  password_recieved = gets.chomp
  require 'digest/md5'
  password = 'password'
  hashed_password = Digest::MD5.hexdigest(password_recieved)
  final_password = record[password]
  if final_password != hashed_password
    puts "invalid password"
    exit
  else
    puts "favorite color?"
    color_got = gets.chomp
    favorite_color = 'favorite_color'
    color = record[favorite_color]
    if color != color_got
      puts "invalid color"
      exit
    else
      puts "favorite animal?"
      animal_recieved = gets.chomp
      favorite_animal = 'favorite_animal'
      animal = record[favorite_animal]
      if animal != animal_recieved
        puts "invalid animal"
        exit
      else
        puts "User Authenticated!"
      end
    end
  end
end