using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negoocio;

namespace Pokemon_Pokedex_App
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Trainee user = new Trainee();
                TraineeNegocio negocio = new TraineeNegocio();
                EmailService emailService= new EmailService();
                user.Email = txtEmail.Text;
                user.Pass = txtPassword.Text;
                int id = negocio.saveUser(user);

                emailService.armarCorreo(user.Email, "Bienvenida Trainer", "Hola te damos la bienvenida a la aplicacion");
                emailService.enviarEmail();
                Response.Redirect("Default.aspx", false);


            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }
    }
}