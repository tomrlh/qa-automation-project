require_relative '../../app/bank'

describe CurrentAccount do
    
    describe 'Withdraw' do
        context 'when amount is positive' do
            before(:all) do
                @cc = CurrentAccount.new(1000.00)
                @cc.withdraw(200.00)
            end

            it 'then update balance' do
                expect(@cc.balance).to eql 795.00
            end
        end



        context 'when balance is 0' do
            before(:all) do
                @cc = CurrentAccount.new(0.00)
                @cc.withdraw(200.00)
            end

            it 'see message' do
                expect(@cc.message).to eql 'Balance is insuficient'
            end
            it 'balance still with 0' do
                expect(@cc.balance).to eql 0.00
            end
        end



        context 'when balance is insuficient' do
            before(:all) do
                @cc = CurrentAccount.new(100.00)
                @cc.withdraw(200.00)
            end

            it 'then display message' do
                expect(@cc.message).to eql 'Balance is insuficient'
            end
            it 'and balance still with initial value' do
                expect(@cc.balance).to eql 100.00
            end
        end



        context 'when withdraw value is higher than transaction limit' do
            before(:all) do
                @cc = CurrentAccount.new(1000.00)
                @cc.withdraw(701.00)
            end

            it 'then display message' do
                expect(@cc.message).to eql 'Transaction limit is R$' + @cc.transaction_limit.to_s
            end
            it 'and balance still with initial value' do
                expect(@cc.balance).to eql 1000.00
            end
        end
    end
    
end