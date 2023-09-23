# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    skip_policy_scope
  end

  def legal_notice
    skip_authorization
  end

  def privacy_policy
    skip_authorization
  end

  def terms_of_service
    skip_authorization
  end
end
