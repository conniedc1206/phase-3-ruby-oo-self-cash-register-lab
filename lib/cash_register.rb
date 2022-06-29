require 'pry'

class CashRegister

    attr_accessor :total, :discount, :price, :add_item, :title, :items, :price_array
    
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items =[]
      @price_array = []
    end

    # for 1 item
    def add_item(title, price, quantity = 1)
        @title = title
        @price = price
        @total += price * quantity
        # while loop
        i = 1
        while i <= quantity do
            @items << title
            i += 1
        end
        # when item is added, track the prices in an array
        @price_array << price
    end

    def apply_discount
        if (@discount > 0)
            @total = (@price - (@price * (@discount.to_f / 100.0))).to_i
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    # Hint #3: The void_last_transaction method will remove the last transaction from the total. You'll need to make an additional attribute accessor and keep track of that last transaction amount somehow. In what method of the class are you working with an individual item?

    def void_last_transaction
        # pop off last element in @price_array (returns the element taken out)
        @price_array.pop
        # sum of all the integers in the @price_array
        @total = @price_array.sum
    end

end
cash_register = CashRegister.new
cash_register.add_item("apple", 0.99)
cash_register.add_item("tomato", 1.76)
binding.pry