# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

start_date = 1.week.ago.to_i
end_date = 1.week.from_now.to_i

(start_date..end_date).step(3.hour) do |date_time|
  MarketPrice.create(time: Time.zone.at(date_time), value: rand(99.99..100.99))
end
