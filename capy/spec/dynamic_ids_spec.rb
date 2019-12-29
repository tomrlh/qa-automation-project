describe 'Dynamic Ids', :dynamic_ids do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/access'
    end

    it 'regiser' do

        # REGEX selectors used
        # $ starts with
        # ^ ends with
        # * contains

        find('input[id$=UsernameInput]').set 'tomrlh'
        find('input[id^=PasswordInput]').set '123456'
        find('a[id*=GetStartedButton]').click

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end
end
