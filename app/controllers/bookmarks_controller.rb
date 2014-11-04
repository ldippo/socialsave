class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  def index
    @bookmarks = Bookmark.all
    respond_with(@bookmarks)
  end

  def show
    respond_with(@bookmark)
  end

  def new
    @bookmark = Bookmark.new
    respond_with(@bookmark)
  end

  def edit
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    flash[:notice] = 'Bookmark was successfully created.' if @bookmark.save
    respond_with(@bookmark)
  end

  def update
    flash[:notice] = 'Bookmark was successfully updated.' if @bookmark.update(bookmark_params)
    respond_with(@bookmark)
  end

  def destroy
    @bookmark.destroy
    respond_with(@bookmark)
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:url)
    end
end
