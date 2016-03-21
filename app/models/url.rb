class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
before_create :shorten

  def shorten

    short_url = [*'0'..'9',*'A'..'Z',*'a'..'z'].sample(7).join

    temp = Url.where(short_url:short_url)
    if temp.empty?
      self.short_url = "#{short_url}"
    else
      shorten
    end
    
  end
end
