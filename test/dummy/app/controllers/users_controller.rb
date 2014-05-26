class UsersController < ApplicationController
  def index
    render plain: "index"
  end

  def create
    render plain: "create"
  end

  def delete
    render plain: "delete"
  end

  def show
    render plain: "show"
  end
end
