describe 'My first script' do

    it 'visit page' do
        visit '/'
        expect(page.title).to eql 'Training Wheels Protocol'
    end

end