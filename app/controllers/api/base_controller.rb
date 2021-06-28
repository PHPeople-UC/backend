class Api::BaseController < PowerApi::BaseController
  before_action :authenticate_user!
end
