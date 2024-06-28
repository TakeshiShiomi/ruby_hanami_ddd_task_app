Hanami.app.register_provider :persistence, namespace: true do
  prepare do
    require "rom"

    config = ROM::Configuration.new(:sql, target["settings"].database_url)

    register "config", config
    register "db", config.gateways[:default].connection
  end

  start do
    config = target["persistence.config"]

    config.auto_registration(
      target.root.join("lib/hanami_ddd_sample_task_app/persistence"),
      namespace: "HanamiDddSampleTaskApp::Persistence"
    )

    register "rom", ROM.container(config)
  end
end
