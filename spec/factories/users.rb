FactoryBot.define do
  factory :user do
    nickname {'test'}
    email {'test@test'}
    password {'a00000'}
    familyname {'田中'}
    firstname {'一郎'}
    family_kana {'タナカ'}
    first_kana {'イチロウ'}
    birthday {'19880712'}
  end
end