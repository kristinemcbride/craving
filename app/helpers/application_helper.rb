module ApplicationHelper
  def distance_to_user(user_location, object)
    # binding.pry
    # object.distance_to(user_location)
    distance = object.distance_to(user_location)
    if distance.nan?
    else
      "#{distance.truncate(2)} km"
    end
  end
end
