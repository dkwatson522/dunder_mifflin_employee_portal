puts 'Creating Human Resource user..'
FactoryBot.create(:user, name: 'Toby Flenderson', department: 'Human Resources')

puts 'Creating Management user..'
FactoryBot.create(:user, name: 'Michael Scott', department: 'Management')

puts 'Creating 5 random users'
FactoryBot.create_list(:user, 5)
