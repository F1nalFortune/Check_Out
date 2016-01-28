require 'rails_helper'

feature 'empty classroom index', js: true do

  before(:each) do
    visit root_path
  end

  scenario 'correct no classrooms message' do
    Classroom.destroy_all
    no_classrooms_header = page.find('#no_classrooms_header')
    binding.pry
    expect(no_classrooms_header.text).to eq('No classrooms JA RULE BABY!!')
  end

  scenario 'new classroom link exists' do
    expect(page.find_link('New Classroom')).to_not be(nil)
  end
end
