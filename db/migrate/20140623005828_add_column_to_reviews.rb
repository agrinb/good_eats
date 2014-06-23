class AddColumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :review_value, :string
  end
end
