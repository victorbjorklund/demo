defmodule DemoWeb.PageController do
  use DemoWeb, :controller

  def home(conn, _params) do
    session_data = get_session(conn)
    IO.inspect(session_data)
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
