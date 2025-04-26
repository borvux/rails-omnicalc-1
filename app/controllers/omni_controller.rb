class OmniController < ApplicationController
  def square
    render(template: "omni/square")
  end

  def square_results
    # @number = params.fetch("number").to_f
    @number = params[:number].to_f
    @square = @number ** 2
    render(template: "omni/square_results")
  end

  def square_root
    render(template: "omni/square_root")
  end

  def square_root_results
    @number = params[:number].to_f
    @square = Math.sqrt(@number)
    render(template: "omni/square_root_results")
  end

  def payment
    render(template: "omni/payment")
  end

  def payment_results
    apr = params[:apr].to_f
    @years = params[:years].to_i
    principal = params[:principal].to_f

    r = (apr / 100) / 12
    n = @years * 12

    numerator = r * principal
    denominator = 1 - ((1 + r) ** -n)

    payment = numerator / denominator

    @apr = apr.to_fs(:percentage, { :precision => 4 })
    @principal = principal.to_fs(:currency)
    @payment = payment.to_fs(:currency)
    render(template: "omni/payment_results")
  end

  def random
    render(template: "omni/random")
  end

  def random_results
    @min = params[:min].to_f
    @max = params[:max].to_f
    @random_number = rand(@min..@max)
    render(template: "omni/random_results")
  end
end
