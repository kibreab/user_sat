require 'spec_helper'

describe "Users" do
    before do
        @user = Factory.create(:user, :name => "Kibreab", :age => 22, :idnumber => 000233)
    end

  describe "GET /users" do
    it "displays some users available" do
    	
    	visit users_path
    	page.should have_content "List of users"
    end

    it "should create valid user" do
    	visit users_path
    	fill_in 'user_name', :with => "Kibreish"
    	fill_in "user_age", :with => 29
    	fill_in "user_idnumber", :with => 4545454
    	click_button "Create User"
    	current_path.should == users_path
    	page.should have_content "Kibreish"
    end
  end

  describe "PUT /users" do
    it "should edit users" do
        visit users_path
        find("#user_#{@user.id}").click_link "Edit"
        current_path.should == edit_user_path(@user)
        #page.should input "Update User"
        find_field('user_name').value.should eq 'Kibreab'
        fill_in 'user_name', :with => "Kibreab_Updated"
        fill_in 'user_age', :with => 99
        fill_in 'user_idnumber', :with => 199
        click_button 'Update User'
        current_path.should == users_path
        page.should have_content "Kibreab_Updated"
    end
  end
end
