describe 'Dropdown', :dropdown do
    it 'simple specific item' do
        visit '/dropdown'
        select('Loki', from: 'dropdown')
        sleep 3
    end



    it 'specific item with find' do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
        sleep 3
    end



    it 'any item', :sample do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
        sleep 3
    end
end