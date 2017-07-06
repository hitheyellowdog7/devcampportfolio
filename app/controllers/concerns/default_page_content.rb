module DefaultPageContent
    extend ActiveSupport::Concern
   
   
   included do
       before_action :set_page_defaults
   end
   
    def set_page_defaults
      @page_title = "Devcampportfolio | My Portfolio Website"
      @seo_keywords = "Chance McKean's Portfolio"
    end
end  