defmodule Network.Plugs.RequireAuth do

    import Plug.Conn #brings in halt()
    import Phoenix.Controller

    alias NetworkWeb.Router.Helpers

    def init(_params) do
        
    end

    # params does not refer to params in routes, obviously.
    def call(conn, _params) do

        if conn.assigns[:user] do
          conn
        else 
          conn
            |> put_flash(:error, "You must be logged in.")
            |> redirect(to: Helpers.page_path(conn, :index))
            # this prevents conn from being passed on. maybe like done() ?
            |> halt()
        end
    end

end