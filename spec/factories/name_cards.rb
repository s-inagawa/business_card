# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :name_card_1, class: "NameCard" do
    name     "テスト"
    address  "東京都台東区駒形バンダイのがんぐだい"
    tel      "00-000-0000"
    fax      "11-1111-1111"
    url      "http://example.com"
  end
end
