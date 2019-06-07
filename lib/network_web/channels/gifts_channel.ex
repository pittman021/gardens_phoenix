defmodule Network.GiftsChannel do
    use NetworkWeb, :channel

    alias Network.{ Gift, Contact}
    alias Network.Repo

    # need to pull out the 'id' on the name attribute via pattern matching
    def join("gifts:" <> contact_id, _params, socket) do
        # id needs to be an integer. 
       contact_id = String.to_integer(contact_id)
       contact = Repo.get(Contact, contact_id) |> Repo.preload(:gifts)

    #    same as:
    #    contact = Contact
    #    |> Repo.get(topic_id)
    #    |> Repo.preload(:comments)
        
        # using assing function to assign contact to, so we can reference in handle_in
        {:ok ,%{gifts: contact.gifts }, assign(socket, :contact, contact)}
    
    end

    # called when pushed to channel
    def handle_in(name, %{"content" => content}, socket) do

        contact = socket.assigns.contact
        user_id = socket.assigns.contact.user_id

        IO.inspect(user_id)
        
        changeset = contact
        |> Ecto.build_assoc(:gifts, user_id: user_id)
        |> Gift.changeset(content)

        case Repo.insert(changeset) do
            {:ok, gift} ->
                broadcast!(socket, "gifts:#{socket.assigns.contact.id}:new", %{ gift: gift })
                {:reply, :ok, socket}
            {:error, _reason} ->
                {:reply, {:error, %{errors: changeset }}, socket }
        end
    end
end
