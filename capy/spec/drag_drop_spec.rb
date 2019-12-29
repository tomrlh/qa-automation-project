describe 'Drag and Drop', :drop do

    before(:each) do
        visit '/drag_and_drop'
    end

    it 'Spider-Man is from Stark team' do
        stark = find('.team-stark .column')
        cap = find('.team-cap .column')

        spiderman = find('img[alt*=Aranha]') # * is regex
        spiderman.drag_to stark

        expect(stark).to have_css 'img[alt$=Aranha]'
        expect(cap).not_to have_css 'img[alt$=Aranha]'
    end

end