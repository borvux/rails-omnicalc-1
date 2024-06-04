class OmniController < ApplicationController
  def square
    render(template: "templates/square")
  end

  def square_result
    render(template: "templates/square_result")
  end

  def square_root
    render(template: "templates/square_root")
  end

  def square_root_result
    render(template: "templates/square_root_result")
  end

  def payment
    render(template: "templates/payment")
  end

  def payment_result
    render(template: "templates/payment_result")
  end

  def random
    render(template: "templates/random")
  end

  def random_result
    render(template: "templates/random_result")
  end
end
