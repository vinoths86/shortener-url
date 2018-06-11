class ApplicationController < ActionController::Base

  def home
    render json: {
        status: true,
        data: 'Start by creating short urls'
    }
  end
end
