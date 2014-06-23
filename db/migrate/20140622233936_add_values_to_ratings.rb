class AddValuesToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :value, :string
  end
end
