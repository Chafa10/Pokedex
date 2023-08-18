using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using Microsoft.Win32;

namespace negoocio
{
    public class TraineeNegocio
    {
        //id
        //email
        //pass
        //admin false

        //nombre, apellido, fecha, imagen

        public int saveUser(Trainee usuario)
        {
            AccesoDatos datos= new AccesoDatos();

            try
            {
                datos.setearProcedure("insertarNuevo");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Pass);
                return datos.ejecutarAccionScalar();

                
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
