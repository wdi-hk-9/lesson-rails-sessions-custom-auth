class PagesController < ApplicationController
  before_action :authenticate, only: [:logged_in]
  before_action :authenticate_denis, only: [:denis]

  def everyone
  end

  def logged_in
  end

  def denis
  end
end
