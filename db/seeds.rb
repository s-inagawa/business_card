# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
create_company_count = 10
create_group_count = 10
create_user_count = 10
create_name_card_count = 10

Company.delete_all

create_company_count.times do |count|

  puts "create companies #{count + 1}..."

  Company.create!(
    name: "company_#{count + 1}",
    address: "会社住所その#{count + 1}",
    tel: "0120-333-906#{count}",
    fax: "0120-117-117#{count}",
    url: "http://example.com/company#{count + 1}"
  )
end

Group.delete_all

Company.all.each do |company|
  create_group_count.times do |count|

    puts "create groups #{count + 1}..."

    company.groups.build(
      name: "group_name_#{count}"
    )
    company.save!
  end
end

User.delete_all

Group.all.each do |group|
  create_user_count.times do |count|

    puts "create users #{count + 1}..."

    group.users.build(
      name: "骨川筋右衛門#{count + 1}",
      mail: "test#{count}@example.com",
      tel: "0120-194-223#{count}",
    )
    group.save!
  end
end

NameCard.delete_all

User.all.each do |user|
  create_name_card_count.times do |count|

    puts "create name cards #{count + 1}..."

    user.name_cards.build(
      name: "company_#{count + 1}",
      address: "名刺住所その#{count + 1}",
      tel: "0120-33-90#{count}",
      fax: "0120-117-117#{count}",
      url: "http://example.com/company#{count + 1}"
    )
    user.save!
  end
end
