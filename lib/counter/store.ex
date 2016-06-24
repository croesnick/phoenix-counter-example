defmodule Counter.Store do
  def start_link do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end

  def increment do
    Agent.update(__MODULE__, fn count -> count + 1 end)
  end

  def value do
    Agent.get(__MODULE__, fn count -> count end)
  end
end
