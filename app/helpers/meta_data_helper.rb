# frozen_string_literal: true

module MetaDataHelper
  def page_title(**)
    I18n.t("helpers.meta.title.#{controller_name}.#{action_name}",
           default: I18n.t('helpers.meta.title.default'),
           **)
  end

  def page_description(**)
    I18n.t("helpers.meta.description.#{controller_name}.#{action_name}",
           default: I18n.t('helpers.meta.description.default'),
           **)
  end

  def page_keywords(**)
    I18n.t("helpers.meta.keywords.#{controller_name}.#{action_name}",
           default: I18n.t('helpers.meta.keywords.default'),
           **)
  end

  def page_robots(**)
    I18n.t("helpers.meta.robots.#{controller_name}.#{action_name}",
           default: I18n.t('helpers.meta.robots.default'),
           **)
  end
end
