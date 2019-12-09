class CurrentAccount
    attr_accessor :balance, :message

    def initialize(balance)
        self.balance = balance
    end

    def withdraw(amount)
        if(amount > self.balance)
            self.message = 'Balance is insuficient'
        else
            self.balance -= amount
        end
    end
end



describe CurrentAccount do
    
    describe 'Withdraw' do
        context 'when amount is positive' do
            before(:all) do
                @account = CurrentAccount.new(1000.00)
                @account.withdraw(200.00)
            end

            it 'then update balance' do
                expect(@account.balance).to eql 800.00
            end
        end

        context 'when balance is insuficient' do
            before(:all) do
                @account = CurrentAccount.new(0.00)
                @account.withdraw(200.00)
            end

            it 'see message' do
                expect(@account.message).to eql 'Balance is insuficient'
            end
            it 'balance still with 0' do
                expect(@account.balance).to eql 0.00
            end
        end
    end
    
end