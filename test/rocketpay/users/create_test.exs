defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.Users.Create
  alias Rocketpay.User

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        age: 20,
        name: "Matheus",
        password: "1234567",
        nickname: "Palinkas31",
        email: "palinkas31@email.com"
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      user = Repo.get(User, user_id)

      assert %User{name: "Matheus", age: 20, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        age: 10,
        name: "Matheus",
        nickname: "Palinkas31",
        email: "palinkas31@email.com"
      }

      {:error, changeset} = Create.call(params)

      expect_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expect_response
    end
  end
end
