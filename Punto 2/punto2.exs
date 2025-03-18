defmodule Inventario do
  def main do
    inventario = %{"Cereal" => 10, "Carne" => 8, "Huevos" => 15}

    producto_a_comprar = "Ingrese el producto que desea comprar: "
    |> Util.ingresar(:texto)

    cantidad_a_comprar = "Ingrese la cantidad que desea comprar: "
      |> Util.ingresar(:entero)

    inventario_actualizado = actualizar_inventario(inventario, producto_a_comprar, cantidad_a_comprar)

    generar_mensaje(inventario_actualizado)
    |> Util.mostrar_mensaje()
  end

  defp actualizar_inventario(inventario, producto, cantidad) do
    productos = Map.keys(inventario)

    if Enum.member?(productos, producto) do
      case Map.get(inventario, producto) > cantidad do
        true -> %{inventario | producto => Map.get(inventario, producto) - cantidad}
        _ -> "Stock insuficiente"
      end
    else
      "Producto no encontrado"
    end
  end

  defp generar_mensaje(inventario) do
    inventario = inspect(inventario)
    "#{inventario}"
  end

end

Inventario.main()
