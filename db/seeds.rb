require 'faker'
Faker::Config.locale = 'ko'

4.times do
    user = User.create(email: Faker::Internet.email, name: Faker::Name.name, password: "111111", password_confirmation: "111111")
    
    user.boards.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph)
end

Board.all.each do |board|
    3.times do
        board.comments.create(body: Faker::Kpop.iii_groups, user: User.first)
    end
end