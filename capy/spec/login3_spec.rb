describe 'Succecssful login', :login_dynamic_id_fields do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/access'
    end

    it 'login with dynamic id fields' do
        login_form = find('#login')

        login_form.find('input[name=username]').set 'stark'
        login_form.find('input[name=password]').set 'jarvis!'

        click_button 'Entrar'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'login using elements scope' do
        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'
            click_button 'Entrar'
        end

        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'successful register' do
        within('#signup') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'
            click_link 'Criar Conta'
        end

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end
end