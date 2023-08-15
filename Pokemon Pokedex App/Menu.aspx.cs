using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pokemon_Pokedex_App
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Session.Add("error", "Debes logearte primero");
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("PerfilUsuario.aspx", false);
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("PerfilAdmin.aspx", false);
        }
    }
}