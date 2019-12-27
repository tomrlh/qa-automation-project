describe 'Forms' do
    # common function
    def login(
        url, user, password, user_field, password_field,
        submit_button, message_field, expected_message
    )
        visit url

        fill_in user_field, with: user
        fill_in password_field, with: password

        click_button submit_button

        expect(find(message_field).visible?).to be true

        expect(find(message_field)).to have_content expected_message
    end



    # global variables
    $url = 'http://training-wheels-protocol.herokuapp.com/login'
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



    it 'wrong password' do
        @expected_message = 'Senha é invalida!'
        login(
                $url, $user, $wrong_password, $user_field, $password_field,
                $submit_button, $message_field, @expected_message
        )
    end



    it 'unexistent user' do
        @expected_message = 'O usuário informado não está cadastrado!'

        login(
            $url, $wrong_user, $password, $user_field, $password_field,
            $submit_button, $message_field, @expected_message
        )
    end
end