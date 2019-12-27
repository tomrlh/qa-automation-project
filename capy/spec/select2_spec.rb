describe 'Select2', :select2 do

    describe('single', :single) do
        before(:each) do
            visit 'http://training-wheels-protocol.herokuapp.com/apps/select2/single.html'
        end

        it 'select actor by name' do
            find('.select2-selection--single').click
            sleep 1
            find('.select2-results__option', text: 'Adam Sandler').click
            sleep 3
        end

        it 'search and select actor by name' do
            find('.select2-selection--single').click
            sleep 1
            find('.select2-search__field').set 'Chris Rock'
            sleep 1
            find('.select2-results__option').click
            sleep 3
        end
    end



    describe('multiple') do
        before(:each) do
            visit 'http://training-wheels-protocol.herokuapp.com/apps/select2/multi.html'
        end
    end

end