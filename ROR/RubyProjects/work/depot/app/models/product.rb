class Product < ActiveRecord::Base



	# default_scope order: 'title'
	default_scope { order(created_at: :desc) }
	scope :ordered_by_title, -> { reorder(title: :asc) }

	
	has_many :line_items
	has_many :orders, :through => :line_items
	# before_destory :ensure_not_referenced_by_any_line_item

	def self.included(base)
    base.send :include, The_hook
    base.before_destroy :ensure_not_referenced_by_any_line_item
  	end




	validates :title, :description, :image_url, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
	validates :title, :uniqueness => true
	validates :image_url, :format => {
		:with => %r{\.(gif|jpg|png)$}i,
		:message => 'must be a URL for GIF, JPG or PNG image.',
		:multiline => true
	}


	private
	module The_hook
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end
	end

end
