module Remotipart
  # Responder used to automagically wrap any non-xml replies in a text-area
  # as expected by iframe-transport.
  module RenderOverrides
    include ERB::Util

    def self.included(base)
      base.class_eval do        
        before_action :set_response_content_type
      end
    end


    def set_response_content_type
       if remotipart_submitted?
         response.content_type = Mime[:JS]
       end
     end
  end
end
