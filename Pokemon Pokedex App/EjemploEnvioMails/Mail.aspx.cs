using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negoocio;

namespace Pokemon_Pokedex_App.EjemploEnvioMails
{
    public partial class Mail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            EmailService negocioEmail = new EmailService();
            negocioEmail.armarCorreo(txtEmail.Text, txtAsunto.Text, txtMensaje.Text);
            try
            {
                negocioEmail.enviarEmail();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}