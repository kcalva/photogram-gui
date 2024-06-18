class UsersController < ApplicationController
  def index
    users = User.all
    @list_of_users = users.order({:username=>:asc})
    render({:template=>"user_templates/index"})
  end

  def show
    # Parameters: {"path_username"=>"117"}
    url_username = params.fetch("path_username")
    pp "fetching #{url_username}"
    matching_username = User.where({:username => url_username})
    pp "something  #{matching_username}"
    @the_user = matching_username.first
    render({:template=>"user_templates/show"})
  end

  def create
    input_username = params.fetch("input_username")

    a_new_user = User.new
    a_new_user.username = input_username

    a_new_user.save

    redirect_to("/users/#{a_new_user.username}")
  end

  def update
    the_username = params.fetch("modify_username")
    matching_users = User.where(username:the_username)
    the_user = matching_users.first

    input_username = params.fetch("input_username")
    the_user.username = input_username

    the_user.save

    redirect_to("/users/#{the_user.username}")

  end
end
