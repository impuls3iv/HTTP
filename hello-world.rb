require 'sinatra'
require 'sinatra/reloader'

get '/' do
  "Hello World"
end

get '/time' do
  "the current time is #{Time.now.ctime}"
end



get '/name/matt' do
  "SAM"
end

#if you do just /name in this case, it will give us a failure

get '/name/mina' do
  "MINA"
end

#if we did every name in the class, and wrote a get for it, we would end up with dozens of routes
#so we can make the /name/.... dynamic

get '/name/:name' do
  result = 2 + 1
  "i like candy"
  "result is #{result} and stident is #{prarams[:name]}"
  params[:name] #returns the name in :name as text on page
end

get '/dogs/:breed/:colour/:name' do
  params.to_s #this will show us the hashes it created if its the las line
  "i am a #{params[:breed]} who is #{params[:colour]} names #{params[:name]}"
end

get '/products' do
  params.to_s
#in browser we can do http://localhost:4567/products?search=brooms&colour=brown and it will
#make hash with search=>brooms colour=>brown

end

get '/index' do #convention dictates that it will call the views folder
  erb(:index)
end

get '/todos' do
  @to_do_count = 1 + 3 #the @ shares from the rb to the erb
  @todos = ["buy a dog", "???", "profit"]
  erb(:todos)
end
