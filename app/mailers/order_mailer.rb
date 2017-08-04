class OrderMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def order_email(order)
    puts "ORDER MAILER IS RUNNING"
    @order = order
    @items = @order.line_items
    puts "ORDER EMAIL: #{@order.email}"
    mail(to: @order.email, subject: "Your Jungle Order Details!")
 end

 def self.whatever
  puts "This is a test"
end

end
