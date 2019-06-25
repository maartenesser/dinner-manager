# First destroy all the data still in the database
puts "Deleting dinners from dinners table..."
Dinner.destroy_all
puts "Deleting memberschip from memberschips table..."
Membership.destroy_all
puts "Deleting group from groups table..."
Group.destroy_all
puts "Deleting all users from users table..."
User.destroy_all

# Generating Users for Database
puts "Generating new users....."
maarten = User.create!(user_name: "Maarten", first_name: "Maarten", last_name: "Esser", email: "maarten@example.com",password: "123456")
santi = User.create!(user_name: "Santi", first_name: "Santiago", last_name: "Schanches", email: "Santiago@example.com", password: "123456")
stefanie = User.create!(user_name: "Stefanie", first_name: "Stefanie", last_name: "Waller", email: "Stefanie@example.com", password: "123456")
marie_louise = User.create!(user_name: "Marie-Louise", first_name: "Marie-Louise", last_name: "Esser", email: "Marie-Louise@example.com", password: "123456")
tim = User.create!(user_name: "Tim", first_name: "Tim", last_name: "Tok", email: "Tim@example.com", password: "123456")

# Generating Groups
puts "Generating new Groups...."
group1 = Group.create!(name: "Berliner Group", user: maarten)
group2 = Group.create!(name: "Dutchies Group", user: stefanie)

puts "Generating new memberships..."
maarten_membership_group1 = Membership.create!(user: maarten , group: group1 , email: maarten.email , attending: true , guests: 0 )
maarten_membership_group2 = Membership.create!(user: maarten , group: group2 , email: maarten.email , attending: false , guests: 0 )
santi_membership_group1 = Membership.create!(user: santi , group: group1 , email: santi.email , attending: false , guests: 0 )
stefanie_membership_group2 = Membership.create!(user: stefanie , group: group2 , email: stefanie.email , attending: true , guests: 0 )
stefanie_membership_group1 = Membership.create!(user: stefanie , group: group1 , email: stefanie.email , attending: true , guests: 0 )
marie_louise_membership_group1 = Membership.create!(user: marie_louise , group: group1 , email: marie_louise.email , attending: true , guests: 0 )
tim_membership_group2 = Membership.create!(user: tim , group: group2 , email: tim.email , attending: true , guests: 0 )

puts "Generating new Dinners...."
dinner1 = Dinner.create!(name: "Maartens last Dinner", date: "25-07-2019", group: group1)
dinner2 = Dinner.create!(name: "Maartens fist Dinner", date: "31-07-2019", group: group1)
dinner3 = Dinner.create!(name: "Steefs goodby dinner", date:"2-08-2019", group: group2)
dinner4 = Dinner.create!(name: "networking Dinner", date:"15-08-2019", group: group2)
