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

  def view_distance_too_high
    if @params[:'view-distance'].to_i > 18
      return true
    end

    false
  end
end