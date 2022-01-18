defmodule Gbenga.TopicController do
  use Gbenga.Web, :controller

  alias Gbenga.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(_conn, params) do
#    IO.inspect params
    %{"topic" => topic } =  params
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} -> IO.inspect(changeset)
    end
  end
end
