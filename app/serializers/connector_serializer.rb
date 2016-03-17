class ConnectorSerializer < ActiveModel::Serializer
  attributes :id, :connector_name, :provider, :format, :data

  has_many :connector_params

  def data
    object.data(@options[:query_filter])
  end

  def provider
    object.provider_txt
  end

  def format
    object.format_txt
  end

  def include_associations!
    include! :connector_params, serializer: ParamsSerializer
  end
end