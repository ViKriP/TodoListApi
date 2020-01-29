class ErrorsService
  def initialize(errors)
    @messages = errors
  end

  def call
    {
      errors: @messages.flat_map do |key, values|
        values.map do |value|
          { title: key.to_s.capitalize, detail: value }
        end
      end
    }
  end
end
