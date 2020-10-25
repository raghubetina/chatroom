# frozen_string_literal: true

namespace :dev do
  desc 'Create some sample data'
  task prime: :environment do
    User.destroy_all
    Team.destroy_all
    Room.destroy_all

    usernames = %w(alice bob carol doug)
    usernames.each do |username|
      User.create email: "#{username}@example.com", password: 'password', username: username
    end

    users = User.all

    team = Team.create name: "firstdraft", creator: users.first

    room = team.rooms.create name: "general", creator: users.first

    10.times do
      root_message = room.root_messages.create(
        topic_name: Faker::Lorem.words(number: rand(2..5), supplemental: true),
        body: Faker::Lorem.paragraphs(number: [1, 1, 1, 1, 2, 2, 3, 4].sample, supplemental: true).join("\n\n"),
        user: users.sample
      )

      create_children(root_message, users)
    end
  end
end

def create_children(parent, users)
  [1, 1, 2, 2, 3, 4, 5, 0, 0, 0, 0].sample.times do
    parent = Message.create(
      room: parent.room,
      parent: parent,
      body: Faker::Lorem.paragraphs(number: [1, 1, 1, 1, 2, 2, 3, 4].sample, supplemental: true).join("\n\n"),
      user: users.sample
    )

    parent.children.each do |message|
      create_children(message)
    end
  end  
end
