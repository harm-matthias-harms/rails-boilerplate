# frozen_string_literal: true

class Dummy
  include ActiveModel::Model
  include ActiveModel::Attributes
  attribute :name
end

RSpec.describe TailwindFormBuilder do
  subject(:builder) { described_class.new(:object, object, template, {}) }

  let(:template) { ActionView::Base.new(ActionController::Base.view_paths, {}, ActionController::Base.new) }
  let(:object) { Dummy.new }

  describe '.submit' do
    it 'returns submit' do
      allow(template).to receive(:submit_tag)
        .with('Create Dummy', { class: ['btn btn-primary btn-full'] })
        .and_return('submit')

      expect(builder.submit).to eq('<div class="form-control w-full max-w-xs">submit</div>')
    end
  end

  %i[labeled_text_field labeled_number_field labeled_email_field labeled_password_field labeled_phone_field
     labeled_date_field labeled_datetime_field].each do |input|
       describe ".#{input}" do
         let(:field) { builder.send(input, :name) }

         it 'contains form_control' do
           expect(field).to include('<div class="form-control w-full max-w-xs">')
         end

         it 'contains label' do
           expect(field).to match(/<label .* class="label" for="object_name"/)
         end

         it 'contains input' do
           expect(field).to match(/<input.*class="input input-bordered.*".*name="object\[name\].*id="object_name"/)
         end
       end
     end
end
