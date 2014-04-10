class TopicSearch < Spree::Core::Search::Base
  Spree::Config.searcher_class = self

  def get_base_scope
    tags = current_user.try(:topics).to_a
    base_scope = super
    if tags.present?
      join_table = Spree::ProductProperty.unscoped
                     .select('COUNT(*) AS count, product_id')
                     .where(:value => tags)
                     .group(:product_id).to_sql
      base_scope = base_scope.joins("LEFT JOIN (#{join_table}) AS tags ON tags.product_id = spree_products.id")
      base_scope = base_scope.reorder('tags.count')
    end
    base_scope
  end
end
