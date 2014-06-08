require 'sinatra'

get '/' do
  erb :welcome
end

post '/' do
  @printed_result = Calculate.new(params[:amount])
  
  erb :result
end

class Calculate

  attr_accessor :amount

  def initialize(amount)
    check_layout(amount)
    check_number(@number)
  end

  def number
    @number
  end

  def check_layout(original_imput)
    if original_imput.match(/[.?]/) 
      when_decimal(original_imput)
    else
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
    @number
  end

  def when_decimal(original_imput)
    if original_imput.match(/\d+(\.\d)?/)
        letters_removed = original_imput.gsub(/[^0-9, .]/, '')
      if letters_removed.match(/\.\d{2}/)
        decimal_number = letters_removed.to_f
        number = decimal_number.round(2)
        @number = (number * 100).to_i
      else letters_removed.match(/\.\d{1}/)
        decimal_number = letters_removed.to_f
        @number = (decimal_number * 100).to_i  
      end
    end
  end

  def check_number(number)
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
    end
  end

  def two_pounds(number)
    @two_coin = number / 200
    @running_number = number - @two_coin * 200
    
    @two = "#{@two_coin} x £2 coins,"
  end

  def one_pound(number)
    @one_coin = number / 100
    @running_number = number - @one_coin * 100
    @one =  "#{@one_coin} x £1 coins,"
  end

  def fifty_pence(number)
    @fif_coin = number / 50
    @running_number = number - (@fif_coin * 50)
    @fifty = "#{@fif_coin} x 50p coins,"
  end

  def twenty_pence(number)
    @twen_coin = number / 20
    @running_number = number - (@twen_coin * 20)
    @twenty = "#{@twen_coin} x 20p coins,"
  end

  def ten_pence(number)
    @ten_coin = number / 10
    @running_number = number - (@ten_coin * 10)
    @ten = "#{@ten_coin} x 10p coins,"
  end

  def five_pence(number)
    @five_coin = number / 5
    @running_number = number - (@five_coin * 5)
    @five = "#{@five_coin} x 5p coins,"
  end

  def two_pence(number)
    @t_coin = number / 2
    @running_number = number - (@t_coin * 2)
    @tpence = "#{@t_coin} x 2p coins,"
  end

  def one_pence(number)
    @coin = number / 1
    @opence = "#{@coin} x 1p"
  end

  def result
    "You need #{@two} #{@one} #{@fifty} #{@twenty} #{@ten} #{@five} #{@tpence} #{@opence}"
  end
end