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
    public partial class Default : System.Web.UI.Page
    {

        public List<Pokemon> listaPokemon { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            PokemonNegocio negocio = new PokemonNegocio();
            listaPokemon = negocio.listarConSP();

            if (!IsPostBack)
            {
                repRepetidor.DataSource = listaPokemon;
                repRepetidor.DataBind();
            }




          

        }

        protected void btnEjemplo_Click(object sender, EventArgs e)
        {

        }
    }
}