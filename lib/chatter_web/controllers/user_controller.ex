defmodule ChatterWeb.UserController do
  use ChatterWeb, :controller

  alias Chatter.User

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => params}) do
  end
end
