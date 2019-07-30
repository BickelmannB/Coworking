class MailJob < ApplicationJob
  queue_as :default

  def perform(request)
    # Do something later
    @requests = Request.confirmed
    @requests.each do |r|
      if r.updated_at + 7884000 > Date.now
  end
end
