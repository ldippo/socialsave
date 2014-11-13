class CreateBookmarksTags < ActiveRecord::Migration
  def change
    create_table :bookmarks_tags do |t|
      t.references :bookmark, index: true
      t.references :tag, index: true
    end
  end
end
