# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    skip_policy_scope
  end
end
