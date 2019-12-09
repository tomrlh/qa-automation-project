class Account
    attr_accessor :balance, :message, :transaction_limit, :tax

    def initialize(balance)
        self.balance = balance
    end

    def withdraw(amount)
        if(amount > self.balance)
            self.message = 'Balance is insuficient'
        elsif(amount > self.transaction_limit)
            self.message = 'Transaction limit is R$' + self.transaction_limit.to_s
        else
            self.balance -= amount + tax
        end
    end
end

class CurrentAccount < Account
    def initialize(balance)
        self.balance = balance
        self.transaction_limit = 700.00
        self.tax = 5.00
    end

    def withdraw(amount)
        super
    end
end



class SavingsAccount < Account
    def initialize(balance)
        self.balance = balance
        self.transaction_limit = 500.00
        self.tax = 2.00
    end

    def withdraw(amount)
        super
    end
end