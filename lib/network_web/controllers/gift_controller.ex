defmodule NetworkWeb.GiftController do
    use NetworkWeb, :controller
    
    alias Network.Gift
    alias Network.User
    alias Network.Repo

    def index(conn, _params) do

       gifts = Repo.all(Gift) |> Repo.preload(:contact)

        render conn, "index.html", gifts: gifts
    end

end