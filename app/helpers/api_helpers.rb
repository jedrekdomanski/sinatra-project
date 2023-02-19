# frozen_string_literal: true

module ApiHelpers
  def serialize(resource)
    serializer_class = "#{Object.const_get(resource.class.name)}Serializer".constantize
    serializer_class.new(resource).to_json
  end

  def json_params
    JSON.parse(request.body.read)
  rescue
    halt 400, { message: 'Invalid JSON' }.to_json
  end

  def base_url
    @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
  end

  def halt_if_not_found!(resource)
    halt(404, { message: "#{resource.class.name} Not Found" }.to_json) unless resource
  end

  def authenticate!
    halt 403, { message: 'Unauthorized!' }.to_json unless authorized?
  end

  def article
    @article ||= Article.find(params['id'])
  end

  private

  def authorized?
    request.env['HTTP_AUTHORIZATION'] == 'Bearer 123qweasd'
  end
end
