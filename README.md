# C80News

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/c80_news`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'c80_news'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install c80_news

## Usage

1. `rake db:migrate`
2. `vi db/seed/07_fill_news_props.rb`:

```
# rake db:seed:07_fill_news_props
   
C80News::Prop.delete_all
C80News::Prop.create!({ per_page:8, per_widget:4 })
```
3. `rake db:seed:07_fill_news_props`
4. Add the line to application's routes file:
```
mount C80News::Engine => '/'
```
5. Add this line to `application.js.coffee`:
```
#= require c80_news
```
6. Add this line to `application.scss`:
```
@import "c80_news/application";
```
7. Add this line to `application_controller.rb`:
```
helper C80News::Engine.helpers
```

## Available helper methods

```
render_news_block
render_one_fact
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/c80_news/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
