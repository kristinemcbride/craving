# class SearchProducts
#   attr_accessor :params

#   def initialize(attributes = {})
#     @params = attributes[:params]
#     @scope = attributes[:scope] || Product.all
#   end

#   def call
#     @scope = filter_by_dish(@scope, params[:dish]) if params[:dish].present?
#     @scope = filter_by_price(@scope, params[:price]) if params[:price].present?
#     # @scope = filter_by_distance(@scope, params[:address]) if params[:address].present?
#     @scope
#   end

#   private

#   def filter_by_price(scope, max, min)
#     scope = min.present? ? scope.where('price >= ?', min) : scope
#     scope
#   end

#   def filter_by_dish(scope, name)
#     scope.where("scope.name ILIKE ?", "%#{params[:dish]}%")
#   end

#   def filter_by_distance(scope, address)
#     # scope.where('name @@ ?', name)
#   end
# end
