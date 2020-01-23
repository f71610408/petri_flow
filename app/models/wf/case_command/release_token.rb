module Wf::CaseCommand
  class ReleaseToken
    prepend SimpleCommand
    attr_reader :workitem
    def initialize(workitem)
      @workitem = workitem
    end

    def call
      Wf::Token.where(locked_workitem_id: workitem.id).locked.each do |token|
        AddToken.call(token.case, token.place)
        token.update!(state: :canceled, canceled_at: Time.now)
      end
    end
  end
end