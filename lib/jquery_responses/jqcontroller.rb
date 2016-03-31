module JqueryResponses
  module Jqcontroller
    extend ActiveSupport::Concern
    included do
    end
    module ClassMethods
      def hasjquery(options={})
        include JqueryResponses::Jqcontroller::LocalInstanceMethods
        extend JqueryResponses::Jqcontroller::LocalClassMethods
      end
    end
    module LocalClassMethods
    end
    module LocalInstanceMethods
      private
      def jq_render 
        render js: yield.to_s
      end
      def jq_alert(txt)
        return "alert('#{txt}');"
      end
      def jq_replace(id, notice=nil)
        return (render_to_string(partial: "jquery/replace", format: :js, locals: {id: id, content: yield.to_s, notice: notice})).to_s
      end
      def jq_html(id, notice=nil)
        return (render_to_string(partial: "jquery/html", format: :js, locals: {id: id, content: yield.to_s, notice: notice})).to_s
      end
      def jq_render_replace(id, notice=nil)
        jq_render {
          jq_replace(id,notice) {yield.to_s}
          }
      end
    end
  end
end
