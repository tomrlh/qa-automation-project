describe 'checkboxes', :checkbox do

    before(:each) do
        visit '/checkboxes'
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