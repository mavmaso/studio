defmodule StudioWeb.LightLive do
  use StudioWeb, :live_view

  def mount(_params, _session, socket) do
    # if connected?(socket), do: schedule_refresh()

    {:ok, assign(socket, brilho: 10, unit: 0, workers: get_workers(), type: "")}
  end

  def render(assigns) do
    StudioWeb.LightView.render("show.html", assigns)
  end

  def handle_event("on", _value, socket) do
    socket = assign(socket, :brilho, 100)

    {:noreply, socket}
  end

  def handle_event("off", _value, socket) do
    socket = assign(socket, :brilho, 0)

    {:noreply, socket}
  end

  def handle_event("up", _value, socket) do
    {:noreply, update(socket, :brilho, &(&1 + 10))}
  end

  def handle_event("update", %{"unit" => value}, socket) do
    value = String.to_integer(value)
    {:noreply, update(socket, :unit, fn _ -> value * 20 end )}
  end

  def handle_info(:tick, socket) do
    {:noreply, update(socket, :workers, get_workers())}
  end

  defp get_workers, do: Enum.random(5..20)

  defp schedule_refresh do
    Process.send_after(self(), :tick, 1000)
  end
end
