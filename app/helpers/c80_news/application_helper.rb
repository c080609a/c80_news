
module C80News
  module ApplicationHelper

    include LocalTimeHelper

    def render_news_block(is_news_page=false, page=1, options={})

      # 1. на странице НОВОСТИ выводим per_page новостей, в виджете выводим per_widget новостей
      # 2. на странице НОВОСТИ div.news_block имеет класс is_news_page
      # 3. к div.news_block можно дописать стиль, типа style_photostudio

      per_page = Prop.first.per_widget
      css_class_news_block = ''
      if is_news_page
        css_class_news_block = 'is_news_page'
        per_page = Prop.first.per_page
      end
      per_block_row = Prop.first.per_widget

      #
      if options[:css_class_news_block].present?
        css_class_news_block += " #{options[:css_class_news_block]}"
      end

      news = Fact.paginate(:page => page, :per_page => per_page)

      render :partial => "shared/news_block",
             :locals => {
                 :news_list => news,
                 :is_news_page => is_news_page,
                 :per_block_row => per_block_row,
                 :partial_name => options[:partial_name],
                 :is_render_paginator => options[:is_render_paginator],
                 :thumb_size => options[:thumb_size],
                 :css_class_news_block => css_class_news_block
             }
    end

    def render_one_fact(fact, partial_name='fact',thumb_size='thumb_md')


      unless thumb_size.present?
        thumb_size = 'thumb_md'
      end

      Rails.logger.debug "[TRACE] <render_one_fact> thumb_size: #{thumb_size}"

      # свойства модуля
      p = Prop.first

      # чтобы вёрстка не прыгала - зафиксируем размер картинки
      w = p.send("#{thumb_size}_width")
      h = p.send("#{thumb_size}_width")

      render :partial => "shared/#{partial_name}",
             :locals => {
                 fact: fact,
                 css_common_width_height: "width:#{w}px;height:#{h}px",
                 css_common_width: "width:#{w}px;",
                 thumb_size:thumb_size
             }
    end

    def url_for_fact(fact)
      "/news/#{fact.slug}"
    end

  end
end
