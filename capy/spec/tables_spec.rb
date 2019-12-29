describe 'Tables', :tables, :smoke do
    before(:each) do
        visit '/tables'
    end

    it 'should display Stark salary' do
        lines = all('table tbody tr')

        stark = lines.detect {
            |actor| actor.text.include?('Robert Downey Jr')
        }
        expect(stark.text).to include '10.000.000'
    end

    it 'should display Vin Diesel salary' do
        diesel = find('table tbody tr', text: '@vindiesel')

        expect(diesel).to have_content '10.000.000'
    end

    it 'should display Fast and Furious movie name' do
        diesel = find('table tbody tr', text: '@vindiesel')

        movie = diesel.all('td')[2].text

        expect(movie).to eql 'Velozes e Furiosos'
    end

    it 'should display Chris Evans instagram' do
        evans = find('table tbody tr', text: '@teamcevans')

        instagram = evans.all('td')[4].text

        expect(instagram).to eql '@teamcevans'
    end

    it 'should select Chris Pratt to remove' do
        prat = find('table tbody tr', text: '@prattprattpratt')

        prat.find('a', text: 'delete').click
        # or
        # prat.all('a')[1].click

        msg = page.driver.browser.switch_to.alert.text

        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'should select Chris Pratt to remove' do
        prat = find('table tbody tr', text: '@prattprattpratt')

        prat.find('a', text: 'edit').click
        # or
        # prat.all('a')[1].click

        msg = page.driver.browser.switch_to.alert.text

        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    end
end
