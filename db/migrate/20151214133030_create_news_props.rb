class CreateNewsProps < ActiveRecord::Migration
  def change
    create_table :news_props, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.integer :per_page
      t.integer :per_widget
      t.timestamps
    end
  end
end