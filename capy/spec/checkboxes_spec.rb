describe 'checkboxes', :checkbox do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/checkboxes'
    end

    after(:each) do
        sleep 3
    end

    it 'checking option' do
        check('thor')
    end



    it 'unchecking option' do
        uncheck('antman')
    end
end