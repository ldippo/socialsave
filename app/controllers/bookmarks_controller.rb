class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  before_action :authenticate_user!
  def index
    @bookmarks = current_user.bookmarks
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
    @bookmark.user = current_user
    tag_names = params[:bookmark][:tags].split(',').map(&:strip)
    @bookmark.tags = tag_names.map{|n| Tag.where(name: n ).first_or_create} 
    flash[:notice] = 'Bookmark was successfully created.' if @bookmark.save
    respond_with(@bookmark)
    NewBookmarkEmail.new_bookmark_email(@bookmark).deliver
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
