
module C80News
  module ApplicationHelper

    include LocalTimeHelper

    def render_news_block(is_news_page=false,page=1)


      if is_news_page
        per_page = C80News::Prop.first.per_page
        news = Fact.paginate(:page => page,:per_page => per_page)
      else
        per_widget = C80News::Prop.first.per_widget
        news = Fact.limit(per_widget)
      end

      render :partial => "shared/news_block",
             :locals => {
                 :news_list => news,
                 :is_news_page => is_news_page
             }
    end

    def render_one_fact(fact)
      render :partial => "shared/fact",
             :locals => {
                 fact: fact
             }
    end

    def url_for_fact(fact)
      "news/#{fact.slug}"
    end

  end
end
