defmodule NetworkWeb.ContactController do
    use NetworkWeb, :controller

    alias Network.Contact
    alias Network.User
    alias Network.Repo

    plug Network.Plugs.RequireAuth when action in [:index, :edit]

    # plug Discuss.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]
    # plug :check_topic_owner when action in [:update, :edit, :delete]
    # import can take all functions and stick across modules
    # alias
    # use

    def index(conn,_params) do
        user = Repo.get(User, conn.assigns.user.id) |> Repo.preload(:contacts)


        render conn, "index.html", contacts: user.contacts
    end

    def show(conn, %{"id" => contact_id }) do
        contact = Repo.get!(Contact, contact_id)
        render conn, "show.html", contact: contact
    end

    def new(conn, _params) do
        changeset = Contact.changeset(%Contact{}, %{})

        render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"contact" => contact}) do

        IO.inspect(contact)

        changeset = conn.assigns.user # WTF??
            |> Ecto.build_assoc(:contacts)
            |> Contact.changeset(contact)

       case Repo.insert(changeset) do
        {:ok, _topic} ->
          conn
            |> put_flash(:info, "Contact Created")
            |> redirect(to: Routes.contact_path(conn, :index))
        {:error, changeset} ->
          render conn, "new.html", changeset: changeset  
       end
    #   case Repo.insert(changeset) do
    #       {:ok, _topic} -> 
    #         conn
    #         |> put_flash(:info, "Topic Created")
    #         |> redirect(to: Routes.topic_path(conn, :index))
    #       {:error, changeset} -> 
    #         render conn, "new.html", changeset: changeset
    #   end
    # end
    end

    def edit(conn, %{"id" => contact_id}) do
      contact = Repo.get(Contact, contact_id)
      changeset = Contact.changeset(contact)

      render conn, "edit.html", changeset: changeset, contact: contact
    end

    def update(conn, %{"id" => contact_id, "contact" => contact}) do
        old_contact = Repo.get(Contact, contact_id)
        changeset = Contact.changeset(old_contact, contact)

        case Repo.update(changeset) do
            {:ok, _contact} ->
                conn
                |> put_flash(:info, "Contact Updated")
                |> redirect(to: Routes.contact_path(conn, :index))
            {:error, changeset} -> 
                render conn, "edit.html", changeset: changeset, contact: old_contact
        end
    end

    # def update(conn, %{"id" => topic_id, "topic" => topic}) do
    #   old_topic = Repo.get(Topic, topic_id)
    #   changeset = Topic.changeset(old_topic, topic)

    #   case Repo.update(changeset) do
    #     {:ok, _topic} ->
    #       conn
    #       |> put_flash(:info, "Topic Updated")
    #       |> redirect(to: Routes.topic_path(conn, :index))
    #     {:error, changeset} -> 
    #       render conn, "edit.html", changeset: changeset, topic: old_topic
    #   end

    # end

    def delete(conn, %{"id" => contact_id}) do
      Repo.get!(Contact, contact_id) |> Repo.delete!

      conn
      |> put_flash(:info, "Contact Deleted")
      |> redirect(to: Routes.contact_path(conn, :index))
    end

    # def check_topic_owner(conn, _params) do
    #   %{params: %{"id" => topic_id }} = conn # WTF
      
    #   if Repo.get(Topic, topic_id).user_id == conn.assigns.user.id do
    #     conn
    #   else
    #     conn
    #     |> put_flash(:error, "You cannot edit that!")
    #     |> redirect(to: Routes.topic_path(conn, :index))
    #     |> halt()
    #   end
    # end
 
end