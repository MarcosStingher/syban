defmodule SybanPnxWeb.EventoHTML do
  use SybanPnxWeb, :html

  embed_templates "evento_html/*"

  @doc """
  Renders a evento form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def evento_form(assigns)
end
