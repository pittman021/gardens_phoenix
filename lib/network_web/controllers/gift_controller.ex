defmodule NetworkWeb.GiftController do
    use NetworkWeb, :controller
    
    alias Network.Gift
    alias Network.User
    alias Network.Repo

    def index(conn, _params) do

       gifts = Repo.all(Gift) |> Repo.preload(:contact)
       render conn, "index.html", gifts: gifts

    end

     def delete(conn, %{"id" => gift_id}) do
     
      Repo.get!(Gift, gift_id) |> Repo.delete!

      conn
      |> put_flash(:info, "Gift Deleted")
      |> redirect(to: Routes.gift_path(conn, :index))
    end

end