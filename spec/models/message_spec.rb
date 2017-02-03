
require File.expand_path '../../spec_helper.rb', __FILE__
let(:good_params) { {body: 'super body', destroy_type: 1, visit_counter: 2, link: 'sdft45GRttdggty546ytr'} }
describe '#create' do
  context 'good params' do
    it "create a message" do
      Message.create!(:good_params)
    end
  end
end
