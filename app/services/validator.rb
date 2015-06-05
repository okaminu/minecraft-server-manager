class Validator

  def initialize(params)
    @params = params
  end

  def difficulty_too_low
    if @params[:difficulty].to_i == 0
      return true
    end

    false
  end

end