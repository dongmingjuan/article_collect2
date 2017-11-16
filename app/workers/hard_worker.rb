class HardWorker
  include Sidekiq::Worker
  def perform()
    message = Message.create(title: "新消息", content: "早上好！")
  end
end
