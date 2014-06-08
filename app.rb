require 'sinatra'

get '/' do
  erb :welcome
end

post '/' do
  @result = Calculate.new(params[:amount]).number
  @face = "face"
  erb :result
end

class Calculate

  attr_accessor :amount

  def initialize(amount)
    check_layout(amount)
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

  def number
    @number
  end
end