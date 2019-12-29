describe 'iframes' do
    describe 'good', :nice_iframe do

        before(:each) do
            visit '/nice_iframe'
        end

        it 'add to cart' do
            within_frame('burgerId') do
                product = find('.menu-item-info-box', text: 'REFRIGERANTE')
                product.find('a').click
                sleep 3
                expect(find('#cart')).to have_content 'R$ 4,50'
                sleep 3
            end
        end
    end



    describe 'bad', :bad_iframe do

        before(:each) do
            visit '/bad_iframe'
        end

        it 'cart is empty' do

            scriptToAddIdToIframe = '$(".box-iframe").attr("id", "tempId")'

            page.execute_script(scriptToAddIdToIframe)

            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
            end
        end
    end
end