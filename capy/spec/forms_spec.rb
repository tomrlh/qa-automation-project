describe 'Forms' do
    it 'successful login' do
        visit 'http://training-wheels-protocol.herokuapp.com/login'

        # functions from Capybara
        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'

        expect(find('#flash').visible?).to be true
    end
end