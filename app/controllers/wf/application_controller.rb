# frozen_string_literal: true

module Wf
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user

    breadcrumb 'Home', :root_path

    def current_user
      Wf::User.first
    end
  end
end
