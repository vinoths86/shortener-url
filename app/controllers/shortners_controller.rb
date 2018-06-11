class ShortnersController < ApplicationController

  def create
    if params[:auth_token].blank? or params[:original_url].blank?
      render json: {
          status: false,
          data: []
      }, status: :unprocessable_entity
      return
    end
    user = User.find_by_auth_token(params[:auth_token])
    unless user
      render json: {
          status: false,
          data: 'Invalid Auth Token'
      }
      return
    end

    shortner = user.shortners.new(original_url: params[:original_url])
    if shortner.save
      url = request.host + ':' + request.port.to_s + '/' + shortner.short_url
      render json: {
          status: true,
          data: url
      }, status: :created
    else
      render json: {
          status: false,
          data: user.errors.full_messages
      }
    end
  end

  def redirect
    byebug
    url = Shortner.find_by_short_url(params[:url])
    unless url
      head :not_found
      return
    end

    redirect_to 'http://' + url.original_url
  end
end

