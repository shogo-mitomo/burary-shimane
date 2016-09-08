# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @answers=Answer.all
  end
end
