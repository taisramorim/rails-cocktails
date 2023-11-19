class PagesController < ApplicationController
  before_action :set_active_storage_options

  def home
    @cocktails = Cocktail.all.limit(5)
  end

  private

  def set_active_storage_options
    ActiveStorage::Current.url_options = { host: request.base_url }
  end
end
