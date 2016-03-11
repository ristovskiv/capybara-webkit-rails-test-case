require 'rails_helper'

feature 'URI fragment conversion in query string', :js => true do
  context 'with simple script in the sessions new view' do
    scenario 'after redirect when visiting the root page', :driver => :webkit do
      visit '/#something'
      puts current_url
      expect(URI(current_url).query).to match(/fragment=something/)
    end

    scenario 'directly visiting the sign in page', :driver => :webkit do
      visit '/users/sign_in#something'
      puts current_url
      expect(URI(current_url).query).to match(/fragment=something/)
    end
  end
end