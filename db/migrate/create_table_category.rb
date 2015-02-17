class AddTweetCategories < ActiveRecord::Migration
  def change
    create_table :categories do |c|
      c.string :name
    end
    create_table :categorizations do |ca|
      ca.integer :tweet_id
      ca.integer :category_id
    end
  end 
end
