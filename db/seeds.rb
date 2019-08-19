30.times do |n|
  title = Faker::Movies::StarWars.call_sign
  word = Faker::Movies::StarWars.quote
  source = Faker::Movies::StarWars.character
  comment = "はじめに言葉ありき"
  user_id = 1
  Word.create!(title: title,
               word: word,
               source: source,
               comment: comment,
               user_id: user_id
               )
end
