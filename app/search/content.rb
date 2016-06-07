class Search::Content < Search::Base
  ATTRIBUTES = %i(
    name
    tag_name
    type
    validity_start_date
    validity_end_date
    enabled
  )
  attr_accessor(*ATTRIBUTES)

  def matches
    t = ::Content.arel_table
    results = ::Content.all
    results = results.where(contains(t[:type], type)) if type.present?
    results = results.where(contains(t[:name], name)) if name.present?
    results = results.where("content_tags.tag_id in ('#{Tag.where("name like '%#{tag_name}%'").pluck(:id).join(',')}')") if tag_name.present?
    results = results.where(t[:price].gteq(price_from)) if price_from.present?
    results = results.where(t[:price].lteq(price_to)) if price_to.present?
    if purchase_cost_from.present?
      results = results.where(t[:purchase_cost].gteq(purchase_cost_from))
    end
    if purchase_cost_to.present?
      results = results.where(t[:purchase_cost].lteq(purchase_cost_to))
    end
    results = results.where(availability: true) if value_to_boolean(availability)
    results
  end
end