defmodule LeaveApp.PageControllerTest do
  use LeaveApp.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Leave Request"
  end

  test "GET /email", %{conn: conn} do
    conn = get conn, "/email"
    assert html_response(conn, 200) =~ "Leave Request"
  end
end
