describe 'Keyboard', :key do

    before(:each) do
        visit '/key_presses'
    end

    it 'sending keys' do
        keys = %i[tab escape space enter shift control alt]

        keys.each do |t|
            find('#campo-id').send_keys t
            expect(page).to have_content 'You entered: ' + t.to_s.upcase
            sleep 0.5
        end
    end

    it 'sending letters' do
        letters = %w[a s d f g h j k l]

        letters.each do |l|
            find('#campo-id').send_keys l
            expect(page).to have_content 'You entered: ' + l.to_s.upcase
            sleep 0.5
        end
    end


end
