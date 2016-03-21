enable :sessions


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
 
  url = Url.create(long_url: params[:long_url])
  
  @urls = Url.all

  # short_url = Url.shorten 
  # url.update(short_url: short_url)
  # redirect to '/'
 # @urls = Url.all

  erb :"static/index"
end


get '/:short_url' do
  @short_url = params[:short_url]

  @url = Url.where(short_url: @short_url).first
  

  @url.counter_plus
 
  redirect to @url.long_url


end


 