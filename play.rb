puts 'please enter your price'
original_imput = gets.chomp
@running_number = @number

def check_number(number)
  # @running_number = number
  if number >= 200
    two_pounds(number)
    one_pound(@running_number)
    fifty_pence(@running_number)
    twenty_pence(@running_number)
    ten_pence(@running_number)
    five_pence(@running_number)
    two_pence(@running_number)
    one_pence(@running_number)
  elsif number >= 100
    one_pound(number)
    fifty_pence(@running_number)
    twenty_pence(@running_number)
    ten_pence(@running_number)
    five_pence(@running_number)
    two_pence(@running_number)
    one_pence(@running_number)    
  elsif number >= 50
    fifty_pence(number)
    twenty_pence(@running_number)
    ten_pence(@running_number)
    five_pence(@running_number)
    two_pence(@running_number)
    one_pence(@running_number) 
  elsif number >= 20
    twenty_pence(number)
    ten_pence(@running_number)
    five_pence(@running_number)
    two_pence(@running_number)
    one_pence(@running_number) 
  elsif number >= 10
    ten_pence(number)
    five_pence(@running_number)
    two_pence(@running_number)
    one_pence(@running_number) 
  elsif number >= 5
    five_pence(number)
    two_pence(@running_number)
    one_pence(@running_number) 
  elsif number >= 2
    two_pence(number)
    one_pence(@running_number) 
  elsif number >= 1
    one_pence(number) 
  else 
    puts 'wrong number!'
  end


end

def two_pounds(number)
  puts "foo face"
  puts number
  two_coin = number / 200
  @running_number = number - two_coin * 200
  puts "#{two_coin} x £2 coin"
end

def one_pound(number)
  one_coin = number / 100
  @running_number = number - one_coin * 100
  puts "#{one_coin} x £1 coin"
end

def fifty_pence(number)
  fif_coin = number / 50
  @running_number = number - (fif_coin * 50)
puts "#{fif_coin} x 50p"
end

def twenty_pence(number)
  twen_coin = number / 20
  @running_number = number - (twen_coin * 20)
  puts "#{twen_coin} x 20p coin"
end

def ten_pence(number)
  ten_coin = number / 10
  @running_number = number - (ten_coin * 10)
  puts "#{ten_coin} x 10p coin"
end

def five_pence(number)
  five_coin = number / 5
  @running_number = number - (five_coin * 5)
  puts "#{five_coin} x 5p coin"
end

def two_pence(number)
  t_coin = number / 2
  @running_number = number - (t_coin * 2)
  puts "#{t_coin} x 2p coin"
end

def one_pence(number)
  coin = number / 1
  puts "#{coin} x 1p"
end

def check_layout(original_imput)


  if original_imput.match(/[.?]/) 
    puts "there is a decimal point"

    when_decimal(original_imput)

  else
    puts "there is no decimal point"

    if original_imput.match(/[£]/)
      letters_removedm = original_imput.gsub(/[^0-9]/, '')
      letters_removed = original_imput.gsub(/[^0-9, .]/, '').to_i
      @number = letters_removed * 100

    elsif original_imput.match(/[p]/)
      letters_removed = original_imput.gsub(/[^0-9]/, '')
      @number = original_imput.gsub(/[^0-9, .]/, '').to_i

    elsif original_imput.match(/[^£p, 0-9, .]/)
      puts "not valid input, I am sorry"
    

    else
      @number = original_imput.to_i
    end

  end 
end

def when_decimal(original_imput)
  if original_imput.match(/\d+(\.\d)?/)
      puts "there is a decimal point"
      letters_removed = original_imput.gsub(/[^0-9, .]/, '')

    if letters_removed.match(/\.\d{2}/)
      puts "this has two digits after decimal"

      puts "woop"
      puts letters_removed
      puts original_imput

      decimal_number = letters_removed.to_f
      puts "decimal_number"
      puts decimal_number

      number = decimal_number.round(2)
      puts "number"
      puts number
      @number = (number * 100).to_i

    else letters_removed.match(/\.\d{1}/)
      puts "this has one digit after the decimal"

      decimal_number = letters_removed.to_f
      @number = (decimal_number * 100).to_i
 
    end
  end
end


check_layout(original_imput)
puts @number
puts "you need"
check_number(@number)