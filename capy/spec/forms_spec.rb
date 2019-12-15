describe 'Forms' do
    it 'successful login' do
        visit 'http://training-wheels-protocol.herokuapp.com/login'

        # functions from Capybara
        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'

        expect(find('#flash').visible?).to be true

        # include is equivalent to 'contains'
        # 'contains' check in string
        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'

        # 'have_content' checks directly in element
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end
end