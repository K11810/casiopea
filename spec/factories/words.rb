FactoryBot.define do

    factory :word do
      title { 'test_word_01' }
      word { 'testtesttest_01' }
    end

    factory :second_word, class: Word do
      title { 'test_word_02' }
      word { 'testtesttest_02' }
    end
  end
