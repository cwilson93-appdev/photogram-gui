class UsersController < ApplicationController
  def index
    matching_users = User.all
    
    @list_of_users = matching_users.order({:username => :asc})
    render({ :template => "user_templates/index.html.erb"})
  end

  def show
      url_username = params.fetch("path_username")

      matching_usernames = User.where({ :username => url_username})

      @the_user = matching_usernames.first

      render({ :template => "user_templates/show.html.erb"})

  end

  def create

    input_user = params.fetch("query_user")

    a_new_user = User.new
    a_new_user.username = input_user

    a_new_user.save

    # render({ :template => "photo_templates/create.html.erb"})

    redirect_to("/users/"+ a_new_user.username.to_s)

  end

  def update
    the_user = params.fetch("modify_user")

    matching_users = User.where({ :username => the_user})

    the_user = matching_users.at(0)

    input_user = params.fetch("query_user")

    the_user.username = input_user

    the_user.save


    #render ({ :template => "photo_templates/update.html.erb"})

    redirect_to("/users/" + the_user.username.to_s)
  end

  def comment
    the_comment = params.fetch("modify_comment")

    matching_commentss = User.where({ :username => the_user})

    the_user = matching_users.at(0)

    input_user = params.fetch("query_user")

    the_user.username = input_user

    the_user.save


    #render ({ :template => "photo_templates/update.html.erb"})

    redirect_to("/users/" + the_user.username.to_s)
  end


end
