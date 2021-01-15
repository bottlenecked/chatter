defmodule ChatterWeb.UserController do
  use ChatterWeb, :controller

  alias Doorman.Login.Session
  alias Chatter.Accounts

  def new(conn, _params) do
    changeset = Accounts.new_user()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => params}) do
    params
    |> Accounts.create_user()
    |> case do
      {:ok, user} ->
        conn
        |> Session.login(user)
        |> redirect(to: "/")

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
