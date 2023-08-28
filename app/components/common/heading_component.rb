# frozen_string_literal: true

class Common::HeadingComponent < ApplicationComponent
  attr_reader :tag

  def size
    {
      h1: 'text-4xl',
      h2: 'text-3xl',
      h3: 'text-2xl',
      h4: 'text-xl font-bold',
      h5: 'text-lg font-bold',
      h6: 'text-base font-bold'
    }[tag.to_sym]
  end

  def color
    {
      h1: 'text-primary',
      h2: 'text-secondary',
      h3: 'text-secondary',
      h4: 'text-base-content',
      h5: 'text-base-content',
      h6: 'text-base-content'
    }[tag.to_sym]
  end

  def margin
    {
      h1: 'mb-4',
      h2: 'mb-4',
      h3: 'mb-4',
      h4: 'mb-4',
      h5: 'mb-2',
      h6: 'mb-2'
    }[tag.to_sym]
  end
end
