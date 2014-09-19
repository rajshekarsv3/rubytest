class Gemchallenge
def self.filter_number(array)
  array.each do |n|
    if(yield(n))
      puts n
    end
  end
end
end