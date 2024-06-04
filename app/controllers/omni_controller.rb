class OmniController < ApplicationController
  def square
    render(template: "templates/square")
  end

  def square_result
    @user_input = params.fetch("square_number").to_f
    @square = @user_input ** 2
    render(template: "templates/square_result")
  end

  def square_root
    render(template: "templates/square_root")
  end

  def square_root_result
    @user_input_square = params.fetch("square_root_number")
    @square_root = Math.sqrt(@user_input_square.to_f)
    render(template: "templates/square_root_result")
  end

  def payment
    render(template: "templates/payment")
  end

  def payment_result
    @user_apr = params.fetch("user_apr").to_f
    @user_years = params.fetch("user_years")
    @user_principal = params.fetch("user_principal").to_f

    @r = (@user_apr / 100) / 12
    @n = @user_years.to_i * 12

    @numerator = @r * @user_principal
    @denominator = 1 - ((1 + @r) ** -@n)

    @payment = @numerator / @denominator

    @fromatted_apr = "#{"%.4f" % @user_apr}%"
    @fromatted_principal = format("%.2f", @user_principal).reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    @formatted_payment = format("%.2f", @payment).reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    render(template: "templates/payment_result")
  end

  def random
    render(template: "templates/random")
  end

  def random_result
    @user_min = params.fetch("user_min").to_f
    @user_max = params.fetch("user_max").to_f
    @random_number = rand(@user_min..@user_max)
    render(template: "templates/random_result")
  end
end
