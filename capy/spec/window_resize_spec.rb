describe 'Window Resize', :window_resize do

    before(:each) do
        page.current_window.resize_to(1900, 1200)
    end

    it 'visit page' do
        visit '/'
        expect(page.title).to eql 'Training Wheels Protocol'
    end

end