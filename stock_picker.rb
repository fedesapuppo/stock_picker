# Stock Picker

# examples

# > stock_picker([5,2,4,1,7])
#  => [3,4]

# > stock_picker([17,3,6,9,15,8,6,1,10])
#  => [1,4]

# type

# mothod wich takes a an array as parameter, and returns an array

# header

# stock_picker(prices_array)

# description

# takes an array "prices_array" of numbers wich represent prices of a stock, finds the biggests difference between two numbers "buy_price" and "sell_price" in wich the index of "buy_price" must be lower than the index of "sell_price" (because such indexes represent the buying day and the selling day). Returns an array "trade" with two numbers in wich the first number is the buyign day (index of "buy_price") and the second number is the selling day (index of "sell_price") of the array taken as parameter. 

# body

def stock_picker(prices_array)
profit = 0
trade = [0,1]

  prices_array.each_with_index do |buy_price, buy_day|
    prices_array.each_with_index do |sell_price,       sell_day|
      if buy_day >= sell_day
        next
      elsif sell_price - buy_price >= profit
        profit = sell_price - buy_price
        trade[0] = buy_day
        trade[1] = sell_day
      end
    end
  end
  trade
end     

# test

p stock_picker([5,2,4,1,7])
# => [3,4]

# works properly if the lowest price day is the last day
p stock_picker([7,9,10,8,6,4])
# => [0,2]

# works properly if the highest price day is the first day and there are repeted prices in the prices array
p stock_picker([25,23,22,18,24,20,18,22])
# => [3,4]

# works properly if buy_day must not represent the index of the minimum price in the prices_array and sell_day must not represent the index of the maximum price in the prices_array
p stock_picker([17,3,6,9,15,8,6,1,10])
#  => [1,4]