describe 'My first script' do

    it 'visit page' do
        visit 'https://training-wheels-protocol.herokuapp.com'
        expect(page.title).to eql 'Training Wheels Protocol'
    end

end