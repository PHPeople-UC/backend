class BaseSerializer < ActiveModel::Serializer
  def deep?
    @instance_options[:deep]
  end

  def with_parent?
    @instance_options[:with_parent]
  end

  private

  def puts_association(serializer)
    {
      id: serializer.object.id.to_s,
      type: serializer._type,
      attributes: serializer.attributes
    }
  end
end
