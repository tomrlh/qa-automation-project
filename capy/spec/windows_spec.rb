describe 'alternating windows', :windows do
    before(:each) do
        visit '/windows'
    end

    it 'new window' do

        new_window = window_opened_by {click_link 'Clique aqui'}

        within_window -> {page.title == 'Nova Janela'} do
            expect(page).to have_content 'Aqui temos uma nova janela \o/'
        end

        new_window.close

        sleep 3

    end
end