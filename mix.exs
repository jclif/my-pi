defmodule MyPi.MixProject do
  use Mix.Project

  @all_targets [:rpi, :rpi0, :rpi2, :rpi3, :rpi3a]

  def project do
    [
      app: :my_pi,
      name: "MyPi",
      version: "0.1.0",
      elixir: "~> 1.8",
      archives: [nerves_bootstrap: "~> 1.5"],
      start_permanent: Mix.env() == :prod,
      build_embedded: true,
      aliases: [loadconfig: [&bootstrap/1]],
      deps: deps()
    ]
  end

  # Starting nerves_bootstrap adds the required aliases to Mix.Project.config()
  # Aliases are only added if MIX_TARGET is set.
  def bootstrap(args) do
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {MyPi.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Dependencies for all targets
      {:nerves, "~> 1.4", runtime: false},
      {:nerves_hub_cli, "~> 0.7", runtime: false},
      {:shoehorn, "~> 0.4"},
      {:ring_logger, "~> 0.6"},
      {:toolshed, "~> 0.2"},
      {:nerves_runtime, "~> 0.9"},
      {:nerves_hub, "~> 0.5"},
      {:nerves_time, "~> 0.2"},

      # Dependencies for all targets except :host
      {:nerves_init_gadget, "~> 0.6", targets: @all_targets},
      {:nerves_network, "~> 0.5", targets: @all_targets},

      # Dependencies for specific targets
      {:nerves_system_rpi, "~> 1.7", runtime: false, targets: :rpi},
      {:nerves_system_rpi0, "~> 1.7", runtime: false, targets: :rpi0},
      {:nerves_system_rpi2, "~> 1.7", runtime: false, targets: :rpi2},
      {:nerves_system_rpi3, "~> 1.7", runtime: false, targets: :rpi3},
      {:nerves_system_rpi3a, "~> 1.7", runtime: false, targets: :rpi3a},
    ]
  end
end
