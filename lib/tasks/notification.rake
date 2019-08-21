namespace :notification do
# リマインドメールの頻度：その言葉が投稿されてから
#「1日後」「3日後」「7日後」「14日後」「1か月後」
#「3か月後」「半年後」「1年後」「3年後」「5年後」

  desc '昨日投稿した言葉のリマインドメール'
  task yesterday_words: :environment do
    @users = User.all
    @users.each do |user|
      @words = Word.where(user_id: user.id, created_at: 1.day.ago.all_day)
        if @words.count != 0
          NotificationMailer.notification(user, @words).deliver
        end
      end
  end

  desc '三日前投稿した言葉のリマインドメール'
  task three_days_ago_words: :environment do
    @users = User.all
    @users.each do |user|
      @words = Word.where(user_id: user.id, created_at: 3.day.ago.all_day)
        if @words.count != 0
          NotificationMailer.notification(user, @words).deliver
        end
      end
  end

  desc '一週間前投稿した言葉のリマインドメール'
  task one_week_ago_words: :environment do
    @users = User.all
    @users.each do |user|
      @words = Word.where(user_id: user.id, created_at: 1.week.ago.all_day)
        if @words.count != 0
          NotificationMailer.notification(user, @words).deliver
        end
      end
  end

  desc '二週間前投稿した言葉のリマインドメール'
  task two_week_ago_words: :environment do
    @users = User.all
    @users.each do |user|
      @words = Word.where(user_id: user.id, created_at: 2.week.ago.all_day)
        if @words.count != 0
          NotificationMailer.notification(user, @words).deliver
        end
      end
  end

  desc '一ヶ月前投稿した言葉のリマインドメール'
  task one_month_ago_words: :environment do
    @users = User.all
    @users.each do |user|
      @words = Word.where(user_id: user.id, created_at: 1.month.ago.all_day)
        if @words.count != 0
          NotificationMailer.notification(user, @words).deliver
        end
      end
  end

  desc '三ヶ月前投稿した言葉のリマインドメール'
  task three_months_ago_words: :environment do
    @users = User.all
    @users.each do |user|
      @words = Word.where(user_id: user.id, created_at: 3.month.ago.all_day)
        if @words.count != 0
          NotificationMailer.notification(user, @words).deliver
        end
      end
  end

  desc '半年前投稿した言葉のリマインドメール'
  task six_months_ago_words: :environment do
    @users = User.all
    @users.each do |user|
      @words = Word.where(user_id: user.id, created_at: 6.month.ago.all_day)
        if @words.count != 0
          NotificationMailer.notification(user, @words).deliver
        end
      end
  end

  desc '一年前投稿した言葉のリマインドメール'
  task one_year_ago_words: :environment do
    @users = User.all
    @users.each do |user|
      @words = Word.where(user_id: user.id, created_at: 1.year.ago.all_day)
        if @words.count != 0
          NotificationMailer.notification(user, @words).deliver
        end
      end
  end

  desc '三年前投稿した言葉のリマインドメール'
  task three_years_ago_words: :environment do
    @users = User.all
    @users.each do |user|
      @words = Word.where(user_id: user.id, created_at: 3.year.ago.all_day)
        if @words.count != 0
          NotificationMailer.notification(user, @words).deliver
        end
      end
  end

  desc '五年前投稿した言葉のリマインドメール'
  task five_years_ago_words: :environment do
    @users = User.all
    @users.each do |user|
      @words = Word.where(user_id: user.id, created_at: 5.year.ago.all_day)
        if @words.count != 0
          NotificationMailer.notification(user, @words).deliver
        end
      end
  end

end
