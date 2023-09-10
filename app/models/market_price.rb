class MarketPrice < ApplicationRecord
  scope :active_on, lambda { |date|
    where(time: date.beginning_of_day..date.end_of_day)
  }
end
