describe 'Upload', :upload do
    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/upload'
        
        @file = Dir.pwd + '/spec/fixtures/file.txt'
        @image = Dir.pwd + '/spec/fixtures/image.jpg'
    end

    it 'upload with file.txt' do
        attach_file('file-upload', @file)
        click_button 'Upload'

        div_result = find('#uploaded-file')
        expect(div_result.text).to eql 'file.txt'
    end

    it 'upload with image.jpg', :image_upload do
        attach_file('file-upload', @image)
        click_button 'Upload'

        div_result = find('#new-image')
        expect(div_result[:src]).to include 'image.jpg'
    end

    after(:each) do
        sleep 3
    end

end
