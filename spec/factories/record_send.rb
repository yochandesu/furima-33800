FactoryBot.define do
  factory :record_send do
    postal_code {'111-1111'}
    area_id {2}
    municipality {'町田市'}
    address {'1-1'}
    building {'山田ビル'}
    phone {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end  