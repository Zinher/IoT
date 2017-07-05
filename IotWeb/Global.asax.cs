using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using IoTBLL;
using IoTModel;
using System.Web.Mvc;

namespace IoTWeb
{
    public class Global : System.Web.HttpApplication
    {
        static private DispositivoService dispositivoService = new DispositivoService();

        protected void Application_Start(object sender, EventArgs e)
        {
            AreaRegistration.RegisterAllAreas(); 
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}