class WelcomeController < ApplicationController
  def index
  end
  def show_dealer
	@dealers = User.where(:dealer => true)
  end
end
