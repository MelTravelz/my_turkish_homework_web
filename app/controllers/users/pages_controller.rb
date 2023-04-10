class Users::PagesController < ApplicationController
  def new
    @prompt = RandomPromptFacade.new.get_prompt(params[:user_id])
  end
end