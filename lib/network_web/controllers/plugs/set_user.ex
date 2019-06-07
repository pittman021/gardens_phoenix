defmodule Network.Plugs.SetUser do
    import Plug.Conn # bunch of helpers to work with conn object
    import Phoenix.Controller

    # goal of this plug is to grab user id in session. fetch user session. 
    # do tiny transformation & add user details to the model 
    # to get access to all of users information

    alias Network.Repo
    alias Network.User

    # no initial setup to do so this is blank
    def init(_params) do
    end

    def call(conn, _params) do
        # get_session comes from Phx.Controller module
        user_id = get_session(conn, :user_id)

        # 1st condition runs that is true. similar to case, but not. 
        cond do
             # check out how elixir does boolean logic
             # if 2nd option returns true its assigned.
             # also if both are true its truthy & code run in block (user_id)
             # so ultimately checks if user exsists & assigns to user.
            user = user_id && Repo.get(User, user_id) ->
                # the function to modify a connection is called 'assign'
                # not to be confused with the 'assigns' object on conn. eek. 
                # to takes conn, creates user object on assigns, assigns 'user' data to it
                assign(conn, :user, user)
                # conn.assigns.user => user struct
            true ->
                assign(conn, :user, nil)
        end
    end
end