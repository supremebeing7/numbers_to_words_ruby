def num_under_hundred(number)
  hash_one = { 0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine",
 # 10 => "ten",11 => "eleven",12 => "twelve",13 => "thirteen",14 => "fourteen",
 #    15 => "fifteen",16 => "sixteen",17 => "seventeen",18 => "eighteen",19 => "nineteen"
  }

  hash_decade = { 1 => 'ten', 2 => "twenty",3 => "thirty",4 => "forty",5 => "fifty",6 => "sixty",7 => "seventy",
8 => "eighty",9 => "ninety"}

  if number > 9
    digits = number.divmod(10)
    hash_decade[digits[0]] + " " + hash_one[digits[1]]
  else
    hash_one[number]
  end
end

puts num_under_hundred(12)

def num_under_thousand(number)
  hash_one = { 0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",11 => "eleven",12 => "twelve",13 => "thirteen",14 => "fourteen",
    15 => "fifteen",16 => "sixteen",17 => "seventeen",18 => "eighteen",19 => "nineteen"
  }
  if number > 99
    digits = number.divmod(100)
    hash_one[digits[0]] + " hundred " + num_under_hundred(number%100)
  else
    num_under_hundred(number)
  end
end

puts num_under_thousand(222)

def numbers_to_words(number)
   hash_one = { 0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",11 => "eleven",12 => "twelve",13 => "thirteen",14 => "fourteen",
    15 => "fifteen",16 => "sixteen",17 => "seventeen",18 => "eighteen",19 => "nineteen"
  }

  hash_decade = { 20 => "twenty",30 => "thirty",40 => "forty",50 => "fifty",60 => "sixty",70 => "seventy",
80 => "eighty",90 => "ninety"}

  hash_large_numbers = { 3 => 'thousand', 6 => 'million', 9 => 'billion', 12 => 'trillion'}

  number_length_minus_one = Math.log10(number).to_i

  result = ""


  if number >= 1000000000000 && number < 1000000000000000
    result = num_under_thousand(number/1000000000000) + ' trillion ' + numbers_to_words(number%1000000000000)
  elsif number >= 1000000000 && number < 1000000000000
    result = num_under_thousand(number/1000000000) + ' billion ' + numbers_to_words(number%1000000000)
  elsif number >= 1000000 && number < 1000000000
    result = num_under_thousand(number/1000000) + ' million ' + numbers_to_words(number%1000000)
  elsif number >= 1000 && number < 1000000
    result = num_under_thousand(number/1000) + ' thousand ' + numbers_to_words(number%1000)
  elsif number < 1000
    result = num_under_thousand(number)
  end


  result.gsub!(/ten one/, "eleven")
  result.gsub!(/ten two/, "twelve")
  result.gsub!(/ten three/, "thirteen")
  result.gsub!(/ten four/, "fourteen")
  result.gsub!(/ten five/, "fifteen")
  result.gsub!(/ten six/, "sixteen")
  result.gsub!(/ten seven/, "seventeen")
  result.gsub!(/ten eight/, "eighteen")
  result.gsub!(/ten nine/, "nineteen")
  result
end

puts numbers_to_words(945289952712112)






# (3..number_length_minus_one).step(3) do |x|
#         if number < 10**x
#       result = num_under_thousand(number)
#     elsif number < 10**(x+3)
#       result = num_under_thousand(number/10**x) + " " hash_large_numbers[x] " " + numbers_to_words(number%10**x)
#     end
#   end
