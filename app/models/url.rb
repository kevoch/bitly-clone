class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
before_create :shorten
validates :long_url, presence: true
validates :short_url, uniqueness: true
validates :long_url, format: {with: /(http:\/\/|https:\/\/)([a-z].*)/, message: "input is invalid!"}



  def shorten

    short_url = [*'0'..'9',*'A'..'Z',*'a'..'z'].sample(7).join

    temp = Url.where(short_url:short_url)
    if temp.empty?
      self.short_url = "#{short_url}"
    else
      shorten
    end
    
  end


  def counter_plus

    self.click_count += 1
    self.save

  end

end
