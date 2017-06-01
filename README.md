# C80News

This gem adds news to site.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'c80_news'
```

And then execute:

```bash
$ bundle
```

## Usage

1) `rake db:migrate`
2) `vi db/seed/07_fill_news_props.rb`:

```ruby
# rake db:seed:07_fill_news_props
   
C80News::Prop.delete_all
C80News::Prop.create!({ per_page:8, per_widget:4 })
```

3) `rake db:seed:07_fill_news_props`

4) Add the line to application's routes file:

```ruby
mount C80News::Engine => '/'
```

5) Add this line to `application.js.coffee`:

```coffee
#= require c80_news
```

6) Add this line to `application.scss`:

```scss
@import "c80_news";
```

7) Add this line to `application_controller.rb`:

```ruby
helper C80News::Engine.helpers
```

20161009:

```bash
scout@scout-VirtualBox:~/git/bitbucket
$ grep c80_news . -r --include=Gemfile
./vape_store/Gemfile:gem 'c80_news'#, '0.1.0.4', :github => 'c80_news/c80_news', :branch => 'master'
./sass_seo/Gemfile:gem 'c80_news'#, '0.1.0.4', :github => 'c80_news/c80_news', :branch => 'master'
./techz/Gemfile:gem 'c80_news_tz', '0.1.1.26'#, :github => 'c80_news_tz/c80_news_tz', :branch => 'feature_list_companies'
./real_estate/Gemfile:gem 'c80_news', '0.1.0.6'
./photostudio/Gemfile:gem 'c80_news', '0.1.0.7', :github => 'c80_news/c80_news', :branch => 'master'
./patron/Gemfile:gem 'c80_news'#, '0.1.0.4', :github => 'c80_news/c80_news', :branch => 'master'
```

## Available helper methods

```ruby
render_news_block
render_one_fact

render_news_block(false, params[:page], {:partial_name => 'fact_inverted', :thumb_size => 'thumb_preview', :css_class_news_block => 'style_photostudio'})
render_news_block(true, params[:page], {:partial_name => 'fact_inverted', :thumb_size => 'thumb_md', :css_class_news_block => 'style_photostudio'})
```