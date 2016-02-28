require "jquery_responses/engine"
require "jquery_responses/jqcontroller"
require "jquery_responses/jq_model"

module JqueryResponses
end
ActionController::Base.send :include, JqueryResponses::Jqcontroller
ActiveRecord::Base.send :include,JqueryResponses::JqModel

