using dominio;
using negoocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pokemon_Pokedex_App
{
    public partial class FormularioPokemon : System.Web.UI.Page
    {
		public bool ConfirmarEliminacion { get; set; }

		protected void Page_Load(object sender, EventArgs e)
        {
			txtId.Enabled = false;
			ConfirmarEliminacion = false;
			try
			{

				//configuracion inicial de la pantalla.
				if (!IsPostBack)
				{
					ElementoNegocio negocio = new ElementoNegocio();
					List<Elemento> listaElementos = negocio.listar();

					ddlTipo.DataSource = listaElementos;
					ddlTipo.DataValueField = "id";
					ddlTipo.DataTextField = "descripcion";
					ddlTipo.DataBind();
                    ddlDebilidad.DataSource = listaElementos;
                    ddlDebilidad.DataValueField = "id";
                    ddlDebilidad.DataTextField = "descripcion";
                    ddlDebilidad.DataBind();
                }

				//configuracion si estamos modificando.
				string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";

                if (id != "" && !IsPostBack)
				{
					
					PokemonNegocio negocio = new PokemonNegocio();
					//List<Pokemon> lista = negocio.listar(id);
					//Pokemon seleccionado = lista[0];

					//lo hago con una linea asi

					Pokemon seleccionado = (negocio.listar(id))[0];
					//guardo el objeto en session para usarlo despues

					Session.Add("pokeSeleccionado", seleccionado);

                    txtId.Text = seleccionado.Id.ToString();
					txtNumero.Text = seleccionado.Numero.ToString();
					txtNombre.Text = seleccionado.Nombre;
					txtDescripcion.Text = seleccionado.Descripcion;
					txtUrlImagen.Text = seleccionado.UrlImagen;

					ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
					ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();
					txtUrlImagen_TextChanged(sender, e); // fuerzo el metodo para que 
														 // cargue la imagen

					//configurar acciones
					if (!seleccionado.Activo)
						btnActivo.Text = "Reactivar";


                }

			}
			catch (Exception ex)
			{
				Session.Add("error", ex);
				throw;
			}
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
			try
			{
				Pokemon pokemon = new Pokemon();
				PokemonNegocio negocio = new PokemonNegocio();

				pokemon.Numero = int.Parse(txtNumero.Text);
				pokemon.Nombre = txtNombre.Text;
				pokemon.Descripcion = txtDescripcion.Text;
				pokemon.UrlImagen = txtUrlImagen.Text;
				pokemon.Tipo = new Elemento();
				pokemon.Tipo.Id = int.Parse(ddlTipo.SelectedValue);
				pokemon.Debilidad = new Elemento();
				pokemon.Debilidad.Id = int.Parse(ddlDebilidad.SelectedValue);

				if (Request.QueryString["id"] != null)
				{
					pokemon.Id = int.Parse(txtId.Text);

                    negocio.modificarConSp(pokemon);         
				}	
				else			 
                    negocio.agregarPokemonConSp(pokemon);

                Response.Redirect("ListadoPokemon.aspx", false);
                
				
				
			}
			catch (Exception ex)
			{
				Session.Add("error", ex);
				throw;
			}
        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgPokemon.ImageUrl = txtUrlImagen.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
			ConfirmarEliminacion = true;
        }

        protected void btnEliminarFinal_Click(object sender, EventArgs e)
        {
			try
			{
				if (chbConfirmarEliminacion.Checked)
				{
                    PokemonNegocio negocio = new PokemonNegocio();
                    negocio.eliminarPokemon(int.Parse(txtId.Text));
                    Response.Redirect("ListadoPokemon.aspx", false);
                }
				
			}
			catch (Exception ex)
			{
				Session.Add("error", ex);
				
			}
        }

        protected void btnActivo_Click(object sender, EventArgs e)
        {
			try
			{
				PokemonNegocio negocio = new PokemonNegocio();
				Pokemon seleccionado = (Pokemon)Session["pokeSeleccionado"];

				negocio.eliminarPokemonLogico(seleccionado.Id, !seleccionado.Activo);
				Response.Redirect("ListadoPokemon.aspx", false);
				
			}
			catch (Exception ex)
			{

                Session.Add("error", ex);
            }
        }
    }
}