using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using IoTBLL;
using IoTModel;
namespace IoTWeb
{
    public class Global : System.Web.HttpApplication
    {
        static private DispositivoService dispositivoService = new DispositivoService();

        protected void Application_Start(object sender, EventArgs e)
        {

        }
        protected void Session_Start(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}