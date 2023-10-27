defmodule BroadcastDemoWeb.ErrorJSONTest do
  use BroadcastDemoWeb.ConnCase, async: true

  test "renders 404" do
    assert BroadcastDemoWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert BroadcastDemoWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
