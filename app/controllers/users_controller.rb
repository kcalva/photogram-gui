class UsersController < ApplicationController
  def index
    users = User.all
    @list_of_users = users.order({:username=>:asc})
    render({:template=>"user_templates/index"})
  end
end
