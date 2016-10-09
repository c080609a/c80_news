# rake db:seed:c80_news_01_fill_props

C80News::Prop.delete_all
C80News::Prop.create!({
                                  thumb_lg_width: 640,
                                  thumb_lg_height: 400,

                                  thumb_md_width: 320,
                                  thumb_md_height: 200,

                                  thumb_sm_width: 80,
                                  thumb_sm_height: 50,
                                  
                                  per_widget: 3,
                                  per_page: 6,
                                  preview_width: 250,
                                  preview_height: 164

                              })