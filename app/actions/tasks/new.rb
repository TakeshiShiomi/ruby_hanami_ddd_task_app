module HanamiDddSampleTaskApp
  module Actions
    module Tasks
      class New < Hanami::Action
        include Deps[view: 'views.tasks.new']

        def handle(_req_, res)
          res.render view
        end
      end
    end
  end
end
