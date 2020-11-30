class ApplicationService
  extend ActiveModel::Naming
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations

  def self.execute(attributes = {})
    service_instance = new(attributes)
    service_instance.execute
    service_instance
  end

  def execute
    raise NotImplementedError.new('Need to implement this method in each sub classes')
  end

  def initialize(attributes = {})
    @errors = ActiveModel::Errors.new(self)
    assign_attributes(attributes.with_indifferent_access)
  end

  def failed?
    errors.present?
  end

  def success?
    !failed?
  end
end
