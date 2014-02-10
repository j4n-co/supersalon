require 'spec_helper'

describe Spree::OrdersController do
  let(:user) { create(:user) }
  let(:order) { Spree::Order.new }

  before do
    controller.stub(:try_spree_current_user => user)
  end

  context '#populate' do
    it 'should ajax post correctly' do
      spree_post :populate, :format => :js
      assert_response :success
    end
  end
end