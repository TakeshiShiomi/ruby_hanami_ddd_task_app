# frozen_string_literal: true

module HanamiDddSampleTaskApp
  class Routes < Hanami::Routes
    root to: 'tasks.index'
    get '/tasks', to: 'tasks.index'
    get '/tasks/new', to: 'tasks.new', as: :new_task
    post '/tasks', to: 'tasks.create'
    patch '/tasks/:id/postpone', to: 'tasks.postpone'
  end
end
