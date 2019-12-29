describe 'JS alerts', :alerts do
    before(:each) do
        visit '/javascript_alerts' 
    end

    it 'alert' do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text

        expect(msg).to eql 'Isto é uma mensagem de alerta'
    end

    it 'confirmation confirm' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'confirmation cancel' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'accept prompt', :accept_prompt do
        name = 'tomrlh'

        accept_prompt(with: name) do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, ' + name
        sleep 2
    end

    # challenge

    it 'accept prompt', :dismiss_prompt do

        dismiss_prompt() do
            click_button 'Prompt'
        end
        
        expect(page).to have_content 'Olá, null'
        sleep 2
    end    
end
