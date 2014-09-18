module Calculate
  SALE_TAX_PERCENT = 0.10
  def Calculate.final_sale_price(price)
    if price == 0
      raise "Enter a New price and Check Final Sale PRice again"
    end
    final_price = price + (price * SALE_TAX_PERCENT)
    puts "Final Price is #{final_price}"
    rescue Exception => e
     puts e.message
  end
end


module Task
  class Book
    attr_accessor :id,:name,:price
    include Calculate
    @@count_of_books = 0
    @@instance_collector = []
    def initialize(price = 100,name="something")  
      @@instance_collector << self
      @id = @@count_of_books    
      @name = name
      @@count_of_books +=1
      @price = price
      Calculate.final_sale_price(@price)    
    end
    def self.search_for(book_to_be_searched)    
      @@instance_collector.each do |book_object|
        if book_object.name.downcase == book_to_be_searched.downcase        
          puts "The cost price of the book #{book_object.name}  is #{book_object.price}"
          return
        end  
      end
      puts "Book Not Available"
    end
    
        
  end 
  
  class Edition < Book
    attr_accessor :edition
    def initialize(price,name,edition=1)
      super(price,name)
      @edition = edition
      
    end  
    
    def self.printBooks
      @@instance_collector.each do |book_object|
        puts "Id : #{book_object.id} "
        puts "Price : #{book_object.price}"
        puts "Name : #{book_object.name}"
        puts book_object.edition ? "Edition : #{book_object.edition}" : "This is the first Edition"
      end
    end
  end
end

Task::Edition.new(200,"Quants")

Task::Edition.new(100,"Q2",2)

Task::Edition.printBooks