# Jungle

A mini e-commerce application built with Rails 4.2

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed db
4. Run `bin/rails s -b 0.0.0.0` to start the server
5. Explore all the various products in the jungle!

## Final Product

### Home Screen

![""](https://github.com/kevinmacarthur/jungle-rails/blob/master/images/Home%20Screen.png)

### Individual Product Page

#### Log in to leave your own comment and rating!

![""](https://github.com/kevinmacarthur/jungle-rails/blob/master/images/Individual%20Product.png)

### Add items to your cart

![""](https://github.com/kevinmacarthur/jungle-rails/blob/master/images/My%20Cart.png)

### Order Confirmation and email with line item details will be sent after checkout

![""](https://github.com/kevinmacarthur/jungle-rails/blob/master/images/Order%20Confirmation.png)

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
