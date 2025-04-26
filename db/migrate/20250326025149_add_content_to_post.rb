class AddContentToPost < ActiveRecord::Migration[8.0]
    def change
      add_column :posts, :content, :string
    end
  end