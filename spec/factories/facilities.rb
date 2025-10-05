FactoryBot.define do
  factory :facility do
    name { "Restaurant A" }
    close_time { "07:00" }
    open_time { "10:00" }
    note {"朝食会場です"}
  end
end