
module C80News
  module ApplicationHelper

    include LocalTimeHelper

    def render_news_block(is_news_page=false, page=1, options={})

      per_block_row = 0

      if is_news_page
        per_page = C80News::Prop.first.per_page
        per_block_row = C80News::Prop.first.per_widget
        news = Fact.paginate(:page => page,:per_page => per_page)
      else
        per_block_row = C80News::Prop.first.per_widget
        news = Fact.limit(per_block_row)
      end

      render :partial => "shared/news_block",
             :locals => {
                 :news_list => news,
                 :is_news_page => is_news_page,
                 :per_block_row => per_block_row,
                 :partial_name => options[:partial_name]
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
