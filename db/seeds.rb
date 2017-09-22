100.times do |i|
    Note.create title: Faker::Lorem.sentence(3), body: Faker::Lorem.paragraphs.join("\n\n")
end