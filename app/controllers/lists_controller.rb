class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def create
    @list = List.new(valid_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  def show
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
  end

  def destroy
    @list.destroy
    redirect_to list_index_path
  end

  private

    def set_list
      @list = List.find(params[:id])
    end

    def valid_params
      params.require(:list).permit(:name)
    end
end