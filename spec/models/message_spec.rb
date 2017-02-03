require 'spec_helper'

describe "Message" do
  let(:valid_params) { {body: 'beauty body', destroy_type: 1, visit_counter: 2, link: 'f4tvbgrt5'} }
  let(:invalid_body_params) { {body: '', destroy_type: 1, visit_counter: 2, link: 'f4tvbgrt5'} }
  let(:invalid_destroy_type_params) { {body: 'beauty body', destroy_type: 'o mama mia!', visit_counter: 2, link: 'f4tvbgrt5'} }

  it "valid message" do
    m = Message.new(valid_params)
    expect(m.valid?).to eq true
  end

  it "invalid body message" do
    m = Message.new(invalid_body_params)
    expect(m.valid?).to eq false
    expect(m.errors.details).to  eq ({:body=>[{:error=>:blank}]})
  end

  it "invalid destroy_type message" do
    m = Message.new(invalid_destroy_type_params)
    expect(m.valid?).to eq false
  end
end
