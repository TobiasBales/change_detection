module Crono
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate

    private

    def authenticate
      if (session = Session.find_by_id(cookies.signed[:session_token]))
        Current.session = session
      else
        redirect_to '/sign_in'
      end
    end
  end
end
