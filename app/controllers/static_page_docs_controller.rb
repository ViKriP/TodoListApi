class StaticPageDocsController < ActionController::Base
  def docs
    render file: '/public/docs/v1.html'
  end
end
