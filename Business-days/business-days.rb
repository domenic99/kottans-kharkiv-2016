require "holidays"

BusnessDays.new(start: Date.parse('2016-05-01'), region: :fr)
  .reject { |d| d.wday == 5 }.take(5)
# => возвращает 5 бизнес-дней, начиная с 1 мая, кроме пятниц