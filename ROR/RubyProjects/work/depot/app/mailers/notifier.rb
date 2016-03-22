class Notifier < ApplicationMailer

  default :from => 'Sam Ruby <depot@example.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_recerived.subject
  #
  def order_recerived(order)
    @order = order
    mail :to => order.email, :subject => 'Paragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order
    mail :to => order.email, :subject => 'Paragmatic Store Order Shipped'
  end
end