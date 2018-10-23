class ParentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value

    record.errors.add attribute, "can't be assigned to itself" if record == value
  end
end
