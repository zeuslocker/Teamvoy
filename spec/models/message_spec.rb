require 'spec_helper'

feature "Message form" do
  scenario "create a valid message" do
    visit "/"

    fill_in "message[body]", with: 'Take all my money and be mine!'
    select 'Number of hours', from: 'message[destroy_type]'
    fill_in 'num', with: '1'
    click_button "createComment"

    expect(page).to have_text("You create a message!")
  end
end

describe "Message validation" do
  let(:valid_params) { {body: 'beauty body', destroy_type: 1, visit_counter: 2, link: 'f4tvbgrt5'} }
  let(:invalid_body_params) { {body: '', destroy_type: 1, visit_counter: 2, link: 'f4tvbgrt5'} }
  let(:invalid_destroy_type_params) { {body: 'beauty body', destroy_type: 'o mama mia!', visit_counter: 2, link: 'f4tvbgrt5'} }
  let(:invalid_link_params) { {body: 'beauty body', destroy_type: 'o mama mia!', visit_counter: 2, link: 'f4tvbgrt5'} }
  let(:invalid_expires_at_params) { {body: 'Кожен з нас щось може... :)', destroy_type: 0, link: 'f4tvbgrt5'} }
  let(:invalid_visit_counter_params) { {body: 'Let the sound rise up... :)', destroy_type: 1, link: 'f4tvbgrt5'} }

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

  it "invalid link message" do
    m = Message.new(invalid_link_params)
    expect(m.valid?).to eq false
  end

  it "invalid expires_at message when destroy_type = 0" do
    m = Message.new(invalid_expires_at_params)
    expect(m.valid?).to eq false
    expect(m.errors.details).to eq({:expires_at=>[{:error=>:blank}]})
  end

  it "invalid visit_counter message when destroy_type = 1" do
    m = Message.new(invalid_visit_counter_params)
    expect(m.valid?).to eq false
  end
end
