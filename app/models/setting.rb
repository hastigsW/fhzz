# encoding: utf-8
class Setting < Settingslogic
  source "#{Rails.root}/config/setting.yml"
  namespace Rails.env
  if Rails.env.development?
    load!
  end
end
