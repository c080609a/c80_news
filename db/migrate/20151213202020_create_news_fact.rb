class CreateNewsFact < ActiveRecord::Migration
  def change
    create_table :c80_news_facts, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :title
      t.string :sub_title
      t.text :short
      t.text :full
      t.string :keywords
      t.string :description
      t.string :slug

      t.timestamps
    end
  end
end