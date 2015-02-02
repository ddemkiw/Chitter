require 'spec_helper'

require_relative 'helpers/session'

feature "User posts a new peep" do

  include SessionHelpers

   before(:each) do
    User.create(:name => 'tester',
                :username => 'username_test',
                :email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
    end

  scenario "after adding peep, peep should be displayed on homepage" do
    sign_in('test@test.com', 'test')
    expect(Peep.count).to eq(0)
    visit '/'
    post_peep("This is my second peep")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.text).to eq("This is my second peep")
  end

# writing test to fix the bug
  scenario "I should be able to add more than one peep" do
    sign_in('test@test.com', 'test')
    expect(Peep.count).to eq(0)
    visit '/'
    post_peep("This is my first peep")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.text).to eq("This is my first peep")
    post_peep("This is my second peep")
    expect(Peep.count).to eq(2)
    peep = Peep.last
    expect(peep.text).to eq("This is my second peep")
  end 

 scenario "peeps should be listed on homepage after peeping" do
      sign_in('test@test.com', 'test')
    expect(Peep.count).to eq(0)
    visit '/'
    post_peep("This is my first peep")
    expect(Peep.count).to eq(1)
    expect(page).to have_content("This is my first peep")
  end


  def post_peep(text)
    within('#new-peep') do
      fill_in 'text', :with => text
      click_button 'Peep'
    end
  end
end