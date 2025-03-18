defmodule Drogueria do
  def main do
    mapa_mensual = %{"día 1" => 4, "día 2" => 3, "día 3" => 6, "día 4" => 8, "día 5" => 11, "día 6" => 10, "día 7" => 6, "día 8" => 3, "día 9" => 5, "día 10" => 4}

    analizar_ventas(mapa_mensual)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp analizar_ventas(mapa) do

    case Map.keys(mapa) do
      [] -> {0, 0, "No hay datos"}
      _ ->
        ventas_diarias = Map.values(mapa)
        total_ventas = Enum.reduce(ventas_diarias, 0, fn x, acc -> acc + x end)
        promedio_diario = total_ventas/map_size(mapa)
        maximas_ventas_diarias = Enum.max(ventas_diarias)
        {dia,_} = Enum.find(mapa, fn {_, ventas} -> ventas == maximas_ventas_diarias end)

        {total_ventas, promedio_diario, dia}
    end

  end

  defp generar_mensaje(reporte) do
    reporte = inspect(reporte)
    "#{reporte}"
  end

end

Drogueria.main()
