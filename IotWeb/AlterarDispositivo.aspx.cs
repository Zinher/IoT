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
    public partial class AlterarDispositivo : System.Web.UI.Page
    {
        static private DispositivoService dispositivoService = new DispositivoService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String qid = Request.QueryString["id"];
                int id = 0;
                try
                {
                    // verifica se o id foi fornecido pela URL
                    // o id é fornecido pela URL quando selecionamos um link na tela de 
                    // sensores ou de atuadores
                    id = int.Parse(qid);
                    Session["id"] = id;
                }
                catch (Exception)
                {
                    // se o id do dispositivo não foi passado pela URL, então tenta obter na sessão
                    if (Session["id"] != null)
                    {
                        id = (int)Session["id"];
                    }
                }
                // obtém a identificação do dispositivo a ser alterado
				if (id > 0)
				{
					LabelResultadoMsg.Text = (string)Session["msg"];
					Session["msg"] = "";
					Dispositivo dispositivo = dispositivoService.obter(id);
					TextId.Text = "" + dispositivo.Id;
					TextNome.Text = dispositivo.Nome;
					RadioButtonTipo.SelectedValue = dispositivo.Tipo.ToString();
				}
            }
        }

        protected void ButtonAlterar_Click(object sender, EventArgs e)
        {
            dispositivoService.alterarNome(int.Parse(TextId.Text), TextNome.Text);
            Session["msg"] = "Dispositivo alterado com sucesso";
            Response.Redirect("DetalheDispositivo.aspx");
        }
    }
}