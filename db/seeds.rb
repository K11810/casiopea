10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
  )
end

30.times do |timesCount|
  title = "スターウォーズセリフNo.#{timesCount}"
  word = Faker::Movies::StarWars.quote
  source = Faker::Movies::StarWars.character
  comment = "May the Forth be with you"
  user_id = 1
  Word.create!(title: title,
               word: word,
               source: source,
               comment: comment,
               user_id: user_id
               )
end

ActsAsTaggableOn::Tag.create!([
  {name: '気晴らし'},
  {name: '退屈'},
  {name: '感嘆'},
  {name: '優位'},
  {name: '皮肉'},
  {name: '羨望'},
  {name: '悲観'},
  {name: '心配'},
  {name: '信頼'},
  {name: '畏敬'},
  {name: '感傷'},
  {name: '喜び'},
  {name: '楽観'},
  {name: '安心'},
  {name: '不安'},
  {name: '驚愕'},
  {name: '興奮'},
  {name: '好奇心'},
  {name: '冷静'},
  {name: '焦燥'},
  {name: '不思議'},
  {name: '困惑'},
  {name: '幸福'},
  {name: '幸運'},
  {name: '緩和'},
  {name: '緊張'},
  {name: '名誉'},
  {name: '責任'},
  {name: '尊敬'},
  {name: '親近感'},
  {name: '情景'},
  {name: '意欲'},
  {name: '恐怖'},
  {name: '勇気'},
  {name: '快感'},
  {name: '後悔'},
  {name: '満足'},
  {name: '不満'},
  {name: '無念'},
  {name: '嫌悪'},
  {name: '恥'},
  {name: '軽蔑'},
  {name: '嫉妬'},
  {name: '罪悪感'},
  {name: '殺意'},
  {name: 'シャーデンフロイデ'},
  {name: 'サウダージ'},
  {name: '期待'},
  {name: '優越感'},
  {name: '劣等感'},
  {name: '恨み'},
  {name: '怨念'},
  {name: '苦しみ'},
  {name: '悲しみ'},
  {name: '切なさ'},
  {name: '感動'},
  {name: '怒り'},
  {name: '悩み'},
  {name: '諦念'},
  {name: '絶望'},
  {name: '希望'},
  {name: '憎悪'},
  {name: '愛憎'},
  {name: '愛しさ'},
  {name: '空虚'},
  {name: '笑い'}
])
