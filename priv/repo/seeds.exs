# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Network.Repo.insert!(%Network.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Network.Repo
alias Network.Contact

# user = Repo.get(User, 1)
# |> Ecto.build_assoc(:contacts)
# |> Contact.changeset(contact)

# Repo.insert!(changeset)

# changeset = conn.assigns.user # current user
#         |> Ecto.build_assoc(:topics) # user passed to build an association. 
#         |> Topic.changeset(topic) # builds a topic struct that is piped in & referenced to user

#       case Repo.insert(changeset) do
#           {:ok, _topic} -> 
#             conn
#             |> put_flash(:info, "Topic Created")
#             |> redirect(to: Routes.topic_path(conn, :index))
#           {:error, changeset} -> 
#             render conn, "new.html", changeset: changeset
#       end


# Repo.insert! %Contact{
#     first_name: "Timothy",
#     last_name: "Pittman",
#     address: "1809 Palma Plaza, Austin, TX 78703",
#     date_of_birth: ~D[2017-06-12],
#     notes: "this is great!"
# }

# Repo.insert! %Contact{
#     first_name: "Katharine",
#     last_name: "Mohana",
#     address: "1809 Palma Plaza, Austin, TX 78703",
#     date_of_birth: Timex.Date.cast!("2014-04-17"),
#     notes: "this is great!"
# }

# Repo.insert! %Contact{
#     first_name: "Travis",
#     last_name: "Pittman",
#     address: "9607 Mercedes Drive, Manassas, VA 20110",
#     date_of_birth: Timex.Date.cast!("2014-04-17"),
#     notes: "this is great!"
# }