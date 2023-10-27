defmodule BroadcastDemoWeb.DemoLive do
  use BroadcastDemoWeb, :live_view
  alias BroadcastDemo.Demo

  import BroadcastDemoWeb.CoreComponents

  def render(assigns) do
    ~H"""
    <div class="flex items-center justify-center h-[100vh] bg-slate-200">
      <div class="flex flex-col shadow-2xl p-10 rounded-xl w-[400px] bg-white">
        <div class="font-bold text-lg text-center pb-4 whitespace-nowrap">Broadcast Demo</div>
        
        <div class="flex flex-row">
          <div class="font-bold w-[60px]">Name:</div>
          
          <form phx-submit={JS.focus(to: "#fetch")} ;>
            <input
              name="myname"
              class="mb-4"
              placeholder="type your name"
              value={@myname}
              phx-change="name-changed"
            />
          </form>
        </div>
        
        <div class="flex flex-row mb-5">
          <div class="font-bold w-[60px]">Status:</div>
          
          <div :if={!is_nil(@fruit)}>
            <%= "#{@fruit.name} fetched by #{@fetched_by}" %>
          </div>
        </div>
        
        <.button id="fetch" class="px-5 self-center bg-blue-500 border shadow" phx-click="fetch-fruit">
          FETCH FRUIT
        </.button>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    Demo.subscribe()

    socket = assign(socket, myname: nil, fruit: nil, fetched_by: nil)

    {:ok, socket, layout: false}
    # {:ok, socket}
  end

  def handle_event("name-changed", %{"myname" => name}, socket) do
    socket = assign(socket, myname: name)
    {:noreply, socket}
  end

  def handle_event("fetch-fruit", _, socket) do
    Demo.fetch_next_fruit(socket.assigns.myname, socket.assigns.fruit)
    {:noreply, socket}
  end

  def handle_info(message, socket) do
    IO.inspect(message)
    socket = assign(socket, fruit: message.fruit, fetched_by: message.user)
    {:noreply, socket}
  end
end
