ActiveAdmin.register C80News::Fact, :as => 'Fact' do

  before_filter :skip_sidebar!, :only => :index

  menu :label => 'Новости'

  permit_params :short,
                :title,
                :full,
                # :keywords,
                # :description,
                :fphotos_attributes => [:id,:image,:_destroy]

  # controller do
  #   cache_sweeper :suit_sweeper, :only => [:update,:create,:destroy]
  # end

  index do
    selectable_column
    id_column
    column :title
    column :created_at do |fact|
      local_time(fact[:created_at], format: '%e.%m.%Y')
    end

    column '' do |fact|
      if fact.fphotos.count > 0
        image_tag(fact.fphotos.first.image.thumb_preview)
      end
    end

    column :short
    column :full

    actions
  end

  form(:html => {:multipart => true}) do |f|
    f.inputs 'Свойства' do
      f.input :title

      f.inputs 'Фото' do
        f.has_many :fphotos, :allow_destroy => true do |fphoto|
          fphoto.input :image,
                       :as => :file,
                       :hint => image_tag(fphoto.object.image.thumb_preview)
        end
      end

      f.input :short
      f.input :full, :as => :ckeditor


      # f.input :keywords,
      #         :input_html => {
      #             :class => 'code_area',
      #             :rows => 2
      #         }#,
      # :hint => "[SEO] meta Keywords; Поле можно оставить пустым, тогда будут использованы ключевые слова сайта:<br> #{SiteProps.first.keywords}".html_safe
      #f.input :description, :hint => "[SEO] meta Description; Поле можно оставить пустым, тогда будут использованы 200 первых символов новости."

    end
    f.actions
  end

end