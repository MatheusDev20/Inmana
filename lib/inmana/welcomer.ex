defmodule Inmana.Welcomer do
  # Receber um nome e uma idade
  # Se o usuário chamar "Banana" e tiver idade "42" Receberá uma mensagem especial
  # Se o user for maior de idade ele recebe uma msg normal
  # Se o user for menor de idade retornamos um erro
  # Tratar o nome do usuário para entradas erradas como "BaNaNa" , "Banana /n"

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)
    IO.inspect(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very Special banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome#{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end
