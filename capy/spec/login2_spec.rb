describe 'Login 2', :login2 do
    # common function
    def login(
        url, user, password, user_field, password_field,
        submit_button, message_field, expected_message
    )
        visit url

        find('#userId').set user
        find('#passId').set password

        login_form = find('#login')

        case login_form.text
        when /Dia/
            find('#day').set '29'
        when /Mês/
            find('#month').set '05'
        when /Ano/
            find('#year').set '1970'
        end

        sleep 2

        click_button submit_button
        expect(find(message_field)).to have_content expected_message
    end



    # global variables
    $url = '/login2'
    $user = 'stark'
    $password = 'jarvis!'
    $wrong_user = 'wrong_user'
    $wrong_password = 'wrong_password'

    $user_field = 'userId'
    $password_field = 'password'
    $submit_button = 'Login'
    $message_field = '#flash'



    it 'successful login' do
        # @ for local variables
        @expected_message = 'Olá, Tony Stark. Você acessou a área logada!'

        login(
                $url, $user, $password, $user_field, $password_field,
                $submit_button, $message_field, @expected_message
        )
    end
end