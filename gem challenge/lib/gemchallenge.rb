class Gemchallenge
def self.filter_number(array,type)
  array.each do |n|
  	if type=="even"
  		remainder=0
  	elsif type=="odd"
  		remainder=1
  	else
  		puts "Second Argument should be odd or even" 
  		return
  	end
    if n%2==remainder 
    	yield n 
    end
  end
end
end