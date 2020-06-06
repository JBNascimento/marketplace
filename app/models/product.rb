class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: Float
  field :installments, type: Integer
  field :image, type: String
  field :url, type: String
  belongs_to :store
  mount_uploader :image, ImageUploader

  searchkick match: :word_start, searchable: [:name]

  def search_data
    { 
      name: name,
      store_id: store.id.to_s
    }
  end
end
