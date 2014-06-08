require 'sinatra'

get '/' do
  erb :welcome
end

post '/' do
  @result = Calculate.new(params[:amount])
  puts @result
end