class MessageBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      ActionCable.server.broadcast(build_conversation_id(message.conversation.id), message)
    end
    
    def build_conversation_id(id)
      "Conversation-#{id}"
    end
  end