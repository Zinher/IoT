using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IoTBLL;
using IoTModel;

namespace IoTWeb
{
    public partial class IncluirDispositivo : System.Web.UI.Page
    {
        static private DispositivoService dispositivoService = new DispositivoService();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonIncluir_Click(object sender, EventArgs e)
        {
            // todo: validar dados
            Dispositivo dispositivo = new Dispositivo();
            dispositivo.Nome = TextNome.Text;
            dispositivo.Tipo = RadioButtonTipo.SelectedValue == "1" ? 1 : 0;
            int id = dispositivoService.incluir(dispositivo);
            Session["id"] = id;
            Session["msg"] = "Dispositivo incluido com sucesso";
            //LabelResultadoMsg.Text = (string)Session["msg"];
            //Session["msg"] = "";
            Response.Redirect("DetalheDispositivo.aspx");
        }
    }
}