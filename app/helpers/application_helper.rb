module ApplicationHelper

#Return the badge of the user
  def badge_image
    @user = User.find(params[:id])

    if @user.posts.count <= 1
      @badge = "https://image.flaticon.com/icons/svg/2826/2826429.svg"
      @title = 'Nouvel arrivant'
    elsif @user.posts.count < 10
      @badge = 'https://image.flaticon.com/icons/svg/2828/2828290.svg'
      @title = 'Contributeur intermédiaire'
    elsif @user.posts.count >= 10
      @badge = 'https://image.flaticon.com/icons/svg/1144/1144441.svg'
      @title = 'Contributeur Expert'
    end

    return @badge

  end

  def badge_img
    @user = current_user

    if @user.posts.count <= 1
      @badge = "https://image.flaticon.com/icons/svg/2826/2826429.svg"
      @title = 'Nouvel arrivant'
    elsif @user.posts.count < 10
      @badge = 'https://image.flaticon.com/icons/svg/2828/2828290.svg'
      @title = 'Contributeur intermédiaire'
    elsif @user.posts.count >= 10
      @badge = 'https://image.flaticon.com/icons/svg/1144/1144441.svg'
      @title = 'Contributeur Expert'
    end

    return @badge

  end

end
