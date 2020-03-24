# First destroy all the data still in the database
puts "deleting all attendies from attendent"
Attendee.destroy_all
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
admin = User.create!(user_name: "admin", first_name: "admin", last_name: "admin", email: "admin@example.com",password: "123456", admin: true)
admin[:user_photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1562688946/bj3pvxinvzmavzpjcxbm.png"
admin.save!
maarten = User.create!(user_name: "Maarten", first_name: "Maarten", last_name: "Esser", email: "maarten@example.com",password: "123456")
maarten[:user_photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1562688946/bj3pvxinvzmavzpjcxbm.png"
maarten.save!
santi = User.create!(user_name: "Santi", first_name: "Santiago", last_name: "Schanches", email: "Santiago@example.com", password: "123456")
santi[:user_photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1562688946/bj3pvxinvzmavzpjcxbm.png"
santi.save!
stefanie = User.create!(user_name: "Stefanie", first_name: "Stefanie", last_name: "Waller", email: "Stefanie@example.com", password: "123456")
stefanie[:user_photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1562688946/bj3pvxinvzmavzpjcxbm.png"
stefanie.save!
marie_louise = User.create!(user_name: "Marie-Louise", first_name: "Marie-Louise", last_name: "Esser", email: "Marie-Louise@example.com", password: "123456")
marie_louise[:user_photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1562688946/bj3pvxinvzmavzpjcxbm.png"
marie_louise.save!
tim = User.create!(user_name: "Tim", first_name: "Tim", last_name: "Tok", email: "Tim@example.com", password: "123456")
tim[:user_photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1562688946/bj3pvxinvzmavzpjcxbm.png"
tim.save!

# Generating Groups
puts "Generating new Groups...."
group1 = Group.create!(name: "Berliner Group", user: maarten)
group2 = Group.create!(name: "Dutchies Group", user: stefanie)

puts "Generating new memberships..."
maarten_membership_group1 = Membership.create!(user: maarten , group: group1 , email: maarten.email)
maarten_membership_group2 = Membership.create!(user: maarten , group: group2 , email: maarten.email)
santi_membership_group1 = Membership.create!(user: santi , group: group1 , email: santi.email)
stefanie_membership_group1 = Membership.create!(user: stefanie , group: group1 , email: stefanie.email)
stefanie_membership_group2 = Membership.create!(user: stefanie , group: group2 , email: stefanie.email)
marie_louise_membership_group1 = Membership.create!(user: marie_louise , group: group1 , email: marie_louise.email)
tim_membership_group2 = Membership.create!(user: tim , group: group2 , email: tim.email)


puts "Generating new Dinners...."
dinner1 = Dinner.create!(name: "Maartens last Dinner", datetime: DateTime.now, group: group1, organizer_id: maarten.id)
dinner2 = Dinner.create!(name: "Maartens fist Dinner",  datetime:DateTime.tomorrow, group: group1, organizer_id: maarten.id)
dinner3 = Dinner.create!(name: "Steefs goodby dinner", datetime:DateTime.tomorrow, group: group2, organizer_id: stefanie.id)
dinner4 = Dinner.create!(name: "networking Dinner", datetime:DateTime.now, group: group2, organizer_id: stefanie.id)

puts "Generating new Attendees"
maarten_attendee_dinner1 = Attendee.create!(membership: maarten_membership_group1, dinner: dinner1, attending: true, guests: 1, comment: "I'm taking my girlfriend with me")
maarten_attendee_dinner2 = Attendee.create!(membership: maarten_membership_group1, dinner: dinner2, attending: true, guests: 1, comment: "Can't wait to see you guys")
maarten_attendee_dinner3 = Attendee.create!(membership: maarten_membership_group2, dinner: dinner3, attending: false, guests: 0, comment: "unfourtunatelly i'm not in Holland")
maarten_attendee_dinner4 = Attendee.create!(membership: maarten_membership_group2, dinner: dinner4, attending: true, guests: 1, comment: "Bring my girlfriend")

santi_attendee_dinner1 = Attendee.create!(membership: santi_membership_group1, dinner: dinner1, attending: false, guests: 0)
santi_attendee_dinner2 = Attendee.create!(membership: santi_membership_group1, dinner: dinner2, attending: true, guests: 0)

stefanie_attendee_dinner1 = Attendee.create!(membership: stefanie_membership_group1, dinner: dinner1, attending: true, guests: 0)
stefanie_attendee_dinner2 = Attendee.create!(membership: stefanie_membership_group1, dinner: dinner2, attending: true, guests: 0)
stefanie_attendee_dinner3 = Attendee.create!(membership: stefanie_membership_group2, dinner: dinner3, attending: true, guests: 1, comment: "I'm taking my boyfrined with me")
stefanie_attendee_dinner4 = Attendee.create!(membership: stefanie_membership_group2, dinner: dinner4, attending: true, guests: 1, comment: "I'm taking my boyfrined with me")

marie_louise_attendee_dinner1 = Attendee.create!(membership: marie_louise_membership_group1, dinner: dinner1, attending: true, guests: 0)
marie_louise_attendee_dinner2 = Attendee.create!(membership: marie_louise_membership_group1, dinner: dinner2, attending: true, guests: 0)

tim_attendee_dinner1 = Attendee.create!(membership: tim_membership_group2, dinner: dinner1, attending: true, guests: 0)
tim_attendee_dinner2 = Attendee.create!(membership: tim_membership_group2, dinner: dinner2, attending: true, guests: 0)

puts "Prefect Seeds are done"

