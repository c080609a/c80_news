class CreateNewsProps < ActiveRecord::Migration
  def change
    create_table :c80_news_props, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.integer :per_page
      t.integer :per_widget
      t.integer :thumb_preview_width
      t.integer :thumb_preview_height
      t.integer :thumb_sm_width
      t.integer :thumb_sm_height
      t.integer :thumb_md_width
      t.integer :thumb_md_height
      t.integer :thumb_lg_width
      t.integer :thumb_lg_height
      t.timestamps
    end
  end
end