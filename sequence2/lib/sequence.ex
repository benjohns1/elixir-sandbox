defmodule Sequence do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, initial_number) do
    # List all child processes to be supervised
    children = [
      # Supervisor.Spec.worker(Sequence.Server, [123])
      # Starts a worker by calling: Sequence.Worker.start_link(arg)
      {Sequence.Supervisor, initial_number},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sequence]
    Supervisor.start_link(children, opts)
  end
end