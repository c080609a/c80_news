class CreateNewsFphotos < ActiveRecord::Migration
  def change
    create_table :news_fphotos, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :image
      t.references :fact, index: true

      t.timestamps null: false
    end

  end
end