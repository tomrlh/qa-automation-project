describe 'My first script' do

    it 'visit page' do
        visit 'https://training-wheels-protocol.herokuapp.com/'
        puts page.title
    end
end