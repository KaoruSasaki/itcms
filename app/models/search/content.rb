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
    results = results.where(t[:validity_start_date].gteq(validity_start_date)) if validity_start_date.present?
    results = results.where(t[:validity_end_date].lteq(validity_end_date)) if validity_end_date.present?
    results = results.where(availability: true) if value_to_boolean(enabled)

    results
  end
end