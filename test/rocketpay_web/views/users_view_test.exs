defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias RocketpayWeb.UsersView
  alias Rocketpay.{User, Account}

  test "renders create.json" do
    params = %{
      age: 20,
      name: "Matheus",
      password: "1234567",
      nickname: "Palinkas31",
      email: "palinkas31@email.com"
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Rocketpay.create_user(params)

    expect_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Matheus",
        nickname: "Palinkas31"
      }
    }

    response = render(UsersView, "create.json", user: user)

    assert expect_response == response
  end
end
