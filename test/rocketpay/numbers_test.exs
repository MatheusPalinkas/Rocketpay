defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "quando houver um arquivo com o mesmo nome, retornamos a soma dos numeros" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "quando não houver um arquivo com o mesmo nome, retornamos um erro" do
      response = Numbers.sum_from_file("banana")

      expected_response = {:error, %{message: "Invalid File!"}}

      assert response == expected_response
    end
  end
end
