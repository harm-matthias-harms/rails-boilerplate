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

  %i[labeled_text_field labeled_number_field labeled_email_field labeled_password_field labeled_phone_field
     labeled_date_field labeled_datetime_field].each do |input|
       describe ".#{input}" do
         let(:field) { builder.send(input, :name) }

         it 'contains form_control' do
           expect(field).to include('<div class="form-control w-full max-w-xs mb-2">')
         end

         it 'contains label' do
           expect(field).to match(/<label .* class="label" for="object_name"/)
         end

         it 'contains input' do
           expect(field).to match(/<input.*class="input input-bordered.*".*name="object\[name\].*id="object_name"/)
         end
       end
     end

  describe '.labeled_check_box' do
    let(:field) { builder.labeled_check_box(:name) }

    it 'contains form_control' do
      expect(field).to include('<div class="form-control w-full max-w-xs mb-2">')
    end

    it 'contains label' do
      expect(field).to match(/<label .* class="label cursor-pointer justify-start" for="object_name"/)
    end

    it 'contains input inside the label' do
      regex = %r{<label.*>.*<input.*class="checkbox checkbox-primary.*".*name="object\[name\].*>.*<span.* class="label-text.*>Name</span></label>} # rubocop:disable Layout/LineLength

      expect(field).to match(regex)
    end
  end

  describe '.submit' do
    it 'returns submit' do
      allow(template).to receive(:submit_tag)
        .with('Create Dummy', { class: ['btn btn-primary btn-full'] })
        .and_return('submit')

      expect(builder.submit).to eq('<div class="form-control w-full max-w-xs mb-2">submit</div>')
    end
  end
end
