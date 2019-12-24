describe 'Radio Buttons', :radio do
    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/radios'
    end

    it 'selection by ID' do
        choose('cap')
    end

    it 'selection by CSS selector' do
        find('input[value=guardians]').click
    end

    after(:each) do
        sleep 3
    end

end
