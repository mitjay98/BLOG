class ApplicationController < ActionController::Base
  include Pundit
  include Authorization
  include Pagy::Backend
  include ErrorHandling
  include Authentication
  include Internationalization
end
