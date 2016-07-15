class ChangeCommentsToReviews < ActiveRecord::Migration[5.0]
  def change
    rename_table :reviews, :reviews
  end
end
