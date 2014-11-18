class FavoritesController < ApplicationController
	def create
   @bookmark = Bookmark.find(params[:bookmark_id])
   favorite = current_user.favorites.build(bookmark: @bookmark)
   #authorize favorite
   if favorite.save
     flash[:notice] = "Favorite was saved."
       # Add code to generate a success flash and redirect to @post
       # Remember the path shortcut: [@post.topic, @post]
     else
       flash[:alert] = "Favorite was not saved"
     end
     redirect_to [@bookmark]
   end

   def destroy
     favorite = current_user.favorites.find(params[:id])
     #authorize favorite
     if favorite.destroy
       flash[:notice] = "Favorite was removed"
     else
       flash[:alert] = "Favorite was not removed"
     end
     redirect_to [favorite.bookmark]
   end
end