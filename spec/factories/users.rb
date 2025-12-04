FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {'abc123'}
    password_confirmation {password}
    lastname_kanji { '山田' }
    firstname_kanji { '太郎' }
    lastname_kana { 'ヤマダ' }
    firstname_kana { 'タロウ' }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 80) }

  end
end