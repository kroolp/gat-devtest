class RootValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value

    record.errors.add attribute, "must be the root node" unless value.root?
  end
end
