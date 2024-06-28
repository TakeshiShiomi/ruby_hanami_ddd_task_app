# frozen_string_literal: true

module HanamiDddSampleTaskApp
  class Settings < Hanami::Settings
    setting :database_url, constructor: Types::String
  end
end
