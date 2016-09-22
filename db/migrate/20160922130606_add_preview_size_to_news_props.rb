class AddPreviewSizeToNewsProps < ActiveRecord::Migration
  def change
    add_column :c80_news_props, :preview_width, :integer
    add_column :c80_news_props, :preview_height, :integer
  end
end