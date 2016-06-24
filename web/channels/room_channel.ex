defmodule Counter.RoomChannel do
  use Counter.Web, :channel

  require Logger

  def join("rooms:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (rooms:lobby).
  def handle_in("increment", _payload, socket) do
    #TODO Increment the counter, save it via a genserver, and send
    #     the new state to all clients
    count = 1

    Logger.info "Count: #{inspect count}"

    broadcast socket, "update", %{count: count}
    {:noreply, socket}
  end

  # This is invoked every time a notification is being broadcast
  # to the client. The default implementation is just to push it
  # downstream but one could filter or change the event.
  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
