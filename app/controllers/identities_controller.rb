# frozen_string_literal: true

class IdentitiesController < ApplicationController
  def destroy
    identity = authorize Identity.find(params[:id])

    if identity.destroy
      set_flash(:success)
    else
      set_flash(:error)
    end

    redirect_to edit_user_registration_path, status: :see_other
  end
end
