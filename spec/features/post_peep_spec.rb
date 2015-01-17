require 'spec_helper'

feature "User adds a new peep" do

  scenario "when browsing the homepage" do
    expect(Peep.count).to eq(0)
    visit '/'
    post_peep("This is my second peep")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.text).to eq("This is my second peep")
  end

  def post_peep(text)
    within('#new-peep') do
      fill_in 'text', :with => text
      click_button 'Peep'
    end
  end
end