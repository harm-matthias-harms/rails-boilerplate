# frozen_string_literal: true

class Common::HeroComponentPreview < ViewComponent::Preview
  def default
    render(Common::HeroComponent.new) do |hero|
      hero.with_heading { 'Build your next app faster' }
      hero.with_paragraph { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' }
      hero.with_image(src: 'https://picsum.photos/500/600', alt: 'Random photo', width: 500, height: 600)
      hero.with_action(button: :primary) { 'Get Started' }
    end
  end
end
