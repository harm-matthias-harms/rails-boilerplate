# frozen_string_literal: true

class ActiveRecordActor < ApplicationActor
  fail_on ActiveModel::UnknownAttributeError,
          ActiveRecord::RecordInvalid,
          ActiveRecord::RecordNotSaved,
          ActiveRecord::NestedAttributes::TooManyRecords
end
