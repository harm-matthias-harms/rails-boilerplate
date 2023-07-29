# frozen_string_literal: true

module MetaDataHelper
  def page_title(**kwargs)
    I18n.t("helpers.meta.title.#{controller_name}.#{action_name}",
           default: I18n.t('helpers.meta.title.default'),
           **kwargs)
  end

  def page_description(**kwargs)
    I18n.t("helpers.meta.description.#{controller_name}.#{action_name}",
           default: I18n.t('helpers.meta.description.default'),
           **kwargs)
  end

  def page_keywords(**kwargs)
    I18n.t("helpers.meta.keywords.#{controller_name}.#{action_name}",
           default: I18n.t('helpers.meta.keywords.default'),
           **kwargs)
  end

  def page_robots(**kwargs)
    I18n.t("helpers.meta.robots.#{controller_name}.#{action_name}",
           default: I18n.t('helpers.meta.robots.default'),
           **kwargs)
  end
end
