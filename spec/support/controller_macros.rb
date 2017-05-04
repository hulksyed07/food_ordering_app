module ControllerMacros
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  #   end
  # end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      User.instance_eval do
      	attr_accessor :confirmed_at
  		end
      user = FactoryGirl.create(:user, :email => 'test2@tester.com', :username => 'tester2', :password => '123456')
      # user = instance_double("User",:id => 1, :email => 'test1@tester.com', 
      # 	:username => 'tester1', :password => '123456', :confirmed_at => Time.now )



      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      # allow(user).to receive(:confirmed_at).and_return( Time.now )
      sign_in user
    end
  end
end