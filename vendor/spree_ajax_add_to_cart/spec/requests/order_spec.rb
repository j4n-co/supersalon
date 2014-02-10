require 'spec_helper'

describe 'Orders' do
  let!(:product) { create(:product, :available_on => 1.day.ago) }

  stub_authorization!

  it 'should allow a user to add product to cart with ajax', :js => true do
    
    visit spree.root_path
    click_link product.name
    
    expect(find('.product-title').text).to eq(product.name)

    click_button 'Add To Cart'
    sleep(2)

    expect(find('#link-to-cart a').text).to eq("#{Spree.t(:cart).upcase}: (1) $#{product.price}")
  end
end
