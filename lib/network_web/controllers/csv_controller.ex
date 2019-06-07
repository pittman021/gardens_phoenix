defmodule NetworkWeb.CsvController do
    use NetworkWeb, :controller


    # def import(conn, %{"contact" => contact_params}) do
    #     contact_params["file"]
    #     |> File.stream!()
    #     |> CSV.decode
    #     |> Enum.each(fn(contact) -> Contact.changeset(%Contact{}, %{name: Enum.at(user, 0), email: Enum.at(user, 1)}) |> Repo.insert end)
    #     conn
    #     |> put_flash(:info, "Imported")
    #     |> redirect(to: user_path(conn, :index))
    #   end


    # def import(conn, _params) do
    #     conn
    #     |> put_resp_content_type("text/csv")
    #     |> put_resp_header("content-disposition", "attachment; filename=\"A Real CSV.csv\"")
    #     |> send_resp(200, csv_content)

    # defp csv_content do
    #     csv_content = [['a', 'list'],['of', 'lists']]
    #     |> CSV.encode
    #     |> Enum.to_list
    #     |> to_string
    # end
    # end
end