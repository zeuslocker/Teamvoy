require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'securerandom'
require 'aes'

KEY = 'dfgert45fg4thvb6gh88989u64ggh'
enable :sessions

set :bind, '0.0.0.0'  # bind to all interfaces

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  erb :index
end

post '/' do
  @message = Message.new(params[:message])
  encrMsg = AES.encrypt(@message.body, KEY)
  @message.body = encrMsg
  @message.link = SecureRandom.uuid.tr('-', '')
  if @message.destroy_type == 0
    @message.expires_at = Time.now + params[:num].to_i.hour
  else
    @message.visit_counter = params[:num].to_i
  end
  if @message.save
    @decrMsgBody = AES.decrypt(@message.body, KEY)
    erb :after_create
  else
    erb :index
  end
end

get '/:id' do
  @message = Message.actual.find_by_link(params[:id])
  if @message.present?
  if @message.destroy_type == 1
    @message.update_attribute(:visit_counter, @message.visit_counter-1)
  end
  @decrMsgBody = AES.decrypt(@message.body, KEY)
  erb :show_message
  else
    erb :'404'
  end
end
