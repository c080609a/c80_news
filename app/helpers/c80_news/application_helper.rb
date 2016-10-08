
module C80News
  module ApplicationHelper

    include LocalTimeHelper

    def render_news_block(is_news_page=false, page=1, options={})

      # на странице НОВОСТИ выводим per_page новостей, в виджете выводим per_widget новостей
      per_page = Prop.first.per_widget
      if is_news_page
        per_page = Prop.first.per_page
      end
      per_block_row = Prop.first.per_widget

      news = Fact.paginate(:page => page, :per_page => per_page)

      render :partial => "shared/news_block",
             :locals => {
                 :news_list => news,
                 :is_news_page => is_news_page,
                 :per_block_row => per_block_row,
                 :partial_name => options[:partial_name],
                 :is_render_paginator => options[:is_render_paginator]
             }
    end

    def render_one_fact(fact, partial_name='fact')


      render :partial => "shared/#{partial_name}",
             :locals => {
                 fact: fact
             }
    end

    def url_for_fact(fact)
      "news/#{fact.slug}"
    end

  end
end
