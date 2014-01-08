require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "displays some users available" do
    	visit users_path
    	page.should have_content "List of users"
    end
  end
end
