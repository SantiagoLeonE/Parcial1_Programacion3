defmodule Proyecto do
  def main do
    nombre_estudiante = "Ingrese su nombre: "
    |> Util.ingresar(:texto)

    mapa_profesor = %{"Santiago" => [8,4,7], "Juan" => [7,4,6]}

    evaluar_proyecto(mapa_profesor, nombre_estudiante)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp evaluar_proyecto(mapa, estudiante) do
    nombres = Map.keys(mapa)

    if Enum.member?(nombres, estudiante) do
      notas_estudiante = Map.get(mapa, estudiante)
      suma_total_notas = Enum.reduce(notas_estudiante, 0, fn x, acc -> acc + x end)
      promedio = suma_total_notas/length(notas_estudiante)
      cond do
        promedio >= 6 -> {promedio, "Aprobado"}
        promedio < 6 -> {promedio, "Reprobado"}
      end
    else
      {0.0, "No encontrado"}
    end

  end

  defp generar_mensaje({a, b}) do
    {promedio, estado} = {a, b}
    promedio = Float.round(promedio, 2)
    "{#{promedio}, #{estado}}"
  end

end

Proyecto.main()
