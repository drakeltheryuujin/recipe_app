class ChangeCommentsToReviews < ActiveRecord::Migration[5.0]
  def change
    rename_table :comments, :reviews
  end
end
