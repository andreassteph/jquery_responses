module JqueryResponses
  module JqModel
    extend ActiveSupport::Concern
    included do
      include JqueryResponses::JqModel::LocalInstanceMethods
      extend JqueryResponses::JqModel::LocalClassMethods
    end
    module ClassMethods
#      def hasjquery(options={})
#      end
    end
    module LocalClassMethods
      def find_by_jq(id)
        id=id.split("_#")
        c=id[0].gsub("_",":").constantize
        c1=c
        is_superclass = self==c1
        while not is_superclass and not c1.superclass.nil?
          c1=c1.superclass
          is_superclass=self==c1
        end
        if is_superclass
          c.find(id[1])
        else
          nil
        end
      end
    end
    module LocalInstanceMethods
      def jq_id
        if self.persisted?
          self.class.to_s.gsub(":","_") + "_" + self.id.to_s
        else
          self.class.to_s.gsub(":","_") + "_" + "new"
        end
      end
    end
  end
end
