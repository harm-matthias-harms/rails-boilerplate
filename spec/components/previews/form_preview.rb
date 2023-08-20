# frozen_string_literal: true

class FormPreview < ViewComponent::Preview
  class Dummy
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :name, :string
    attribute :age, :integer
    attribute :email, :string
    attribute :password, :string
    attribute :phone, :string
    attribute :date, :date
    attribute :datetime, :datetime
    attribute :remember_me, :boolean

    validates :name, presence: true
  end

  def default; end
end
