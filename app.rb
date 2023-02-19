# frozen_string_literal: true

require File.expand_path('config/environment', __dir__)

require_relative 'app/models/init'
require_relative 'app/helpers/init'
require_relative 'app/serializers/init'

require_relative 'app/controllers/application_controller'
require_relative 'app/controllers/articles_controller'
require_relative 'app/controllers/authors_controller'
