FactoryBot.define do
  factory :item do
    item_name {'test'}
    description {'test'}
    price {7777}
    category_id {2}
    status_id {2}
    delibery_id {2}
    area_id {2}
    guideline_id {2}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/flag.png'), filename: 'flag.png')
    end
  end
end
