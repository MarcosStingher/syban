defmodule SybanPnxWeb.DispositivoHTML do
  use SybanPnxWeb, :html

  embed_templates "dispositivo_html/*"

  @doc """
  Renders a dispositivo form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def dispositivo_form(assigns)
end
