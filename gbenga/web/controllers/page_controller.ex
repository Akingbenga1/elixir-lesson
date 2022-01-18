defmodule Gbenga.PageController do
  use Gbenga.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
