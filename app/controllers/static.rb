enable :sessions

get '/error' do
  erb :"static/error"
end


get '/' do
  puts "[LOG] Getting/"
  puts "[LOG] Params: #{params.inspect}"
  # all = Url.all
  # n = 1
  # all.each do |x|
  #   puts ["#{n}. ===>" + " #{x.short_url} "]
  #   n += 1
  # end

   @urls = Url.all  
  erb :"static/index"
end

post '/urls' do

  @url = Url.new(long_url: params[:long_url])
  # byebug

  if @url.save
    
    @urls = Url.all

    @url.to_json 
    #return the result to be in a json form
  else
    @errors = @url.errors.full_messages
    erb :"static/error"
  end

  # short_url = Url.shorten 
  # url.update(short_url: short_url)
  # redirect to '/'
 # @urls = Url.all

  
end


get '/:short_url' do

  @short_url = params[:short_url]

  @url = Url.where(short_url: @short_url).first
  
  unless @url == nil
  
    @url.counter_plus

 
    redirect to @url.long_url
  end

end


 