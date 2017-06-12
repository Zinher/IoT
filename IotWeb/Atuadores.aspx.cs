using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IoTBLL;
using IoTModel;
namespace IoTWeb
{
    public partial class Atuadores : System.Web.UI.Page
    {
        static private DispositivoService dispositivoService = new DispositivoService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListViewSensores.DataSource = dispositivoService.obterAtuadores();
                ListViewSensores.DataBind();
            }
        }
        protected void ListViewSensores_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            //set current page startindex, max rows and rebind to false
            lvDataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            ListViewSensores.DataSource = dispositivoService.obterAtuadores();

            //rebind List View
            ListViewSensores.DataBind();
        }
    }
}