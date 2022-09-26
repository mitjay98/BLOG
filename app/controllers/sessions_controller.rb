# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy

  def new; end

  def create
    user = User.find_by email: params[:email]
    if user&.uid.present? && user&.password_digest.nil?
      $ouath_user = user
      flash.now[:warning] = 'This email is in a system but you dont have password'
      redirect_to oauth_user_url($ouath_user)
    elsif user&.authenticate(params[:password])
      do_sign_in user
    else
      flash.now[:warning] = 'Incorrect email and/or password!'
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = 'See you later!'
    redirect_to root_path
  end

  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    sign_in user
    redirect_to root_path
  end

  private

  def do_sign_in(user)
    sign_in user
    remember(user) if params[:remember_me] == '1'
    flash[:success] = "Welcome back, #{current_user.name_or_email}!"
    redirect_to root_path
  end
end
