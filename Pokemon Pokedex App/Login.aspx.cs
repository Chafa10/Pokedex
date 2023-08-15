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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                usuario = new Usuario(txtUsuario.Text, txtPassword.Text, false);
                if (negocio.Logear(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Menu.aspx", false);

                }
                else
                {
                    Session.Add("error", "Usuario o password incorrectos");
                    Response.Redirect("Error.aspx", false);
                }
                
               

                
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);

            }
        }
    }
}