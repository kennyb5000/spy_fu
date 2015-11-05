module SpyFu
  class Request
    attr_reader :path, :required_parameters, :parameters

    def initialize(path, required_parameters, parameters = {})
      @path = path
      @required_parameters = required_parameters
      @parameters = parameters
    end

    def send_request
      check_required_parameters
      response = SpyFu::BuildRequest.new(path, parameters).build_request
      SpyFu::Response.new(response).call
    end

    def check_required_parameters
      included_parameters = parameters.slice(*required_parameters)
      return unless included_parameters.count < required_parameters.count && included_parameters.values.none?(&:blank?)
      missing_params = required_parameters - included_parameters.keys
      fail SpyFu::Errors::MissingRequireParameters, "Missing #{missing_params.join(', ')}"
    end
  end
end
