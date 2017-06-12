using System;
using IoTBLL;
using IoTModel;

namespace IoTWeb
{
    public partial class DetalheDispositivo : System.Web.UI.Page
    {
        static private DispositivoService dispositivoService = new DispositivoService();

        protected void Page_Load(object sender, EventArgs e)
        {
            String qid = Request.QueryString["id"];
            int id;
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
                id = (int)Session["id"];
            }
            if (Session["id"] != null)
            {
                if (id > 0)
                {
                    LabelResultadoMsg.Text = (string)Session["msg"];
                    Session["msg"] = "";
                    Dispositivo dispositivo = dispositivoService.obter(id);
                    TextId.Text = "" + dispositivo.Id;
                    TextNome.Text = dispositivo.Nome;
                    EstadoDispositivo ultimoEstado = dispositivoService.ultimoEstado(dispositivo.Id);
                    RadioButtonTipo.SelectedValue = dispositivo.Tipo.ToString();
                    // Session["Tipo"] é usado na tela de histórico
                    Session["Tipo"] = dispositivo.Tipo;
                    if (dispositivo.Tipo == 0)
                    {
                        DivControleAtuador.Visible = false;
                        labelValorAtualLigado.Visible = false;
                        labelValorAtualDesligado.Visible = false;
                        labelValorAtual.Visible = true;
                        if (ultimoEstado != null)
                        {
                            labelValorAtual.Text = "" + ultimoEstado.Valor;
                        }
                        else
                        {
                            labelValorAtual.Text = "Desconhecido";
                        }
                    }
                    else
                    {
                        DivControleAtuador.Visible = true;
                        labelValorAtualLigado.Visible = false;
                        labelValorAtualDesligado.Visible = false;
                        labelValorAtual.Visible = false;
                        if (ultimoEstado != null)
                        {
                            if (ultimoEstado.Valor == 1)
                            {
                                labelValorAtualLigado.Visible = true;
                            }
                            else
                            {
                                labelValorAtualDesligado.Visible = true;
                            }
                        }
                        else
                        {
                            labelValorAtual.Visible = true;
                            labelValorAtual.Text = "Desconhecido";
                        }
                    }
                }
            }
        }

        protected void ButtonLigar_Click(object sender, EventArgs e)
        {
            alterarEstado(true);
            LabelResultadoMsg.Text = "Atuador Ligado";
                labelValorAtualLigado.Visible = true;
                labelValorAtualDesligado.Visible = false;
                labelValorAtual.Visible = false;
        }

        protected void ButtonDesligar_Click(object sender, EventArgs e)
        {
            alterarEstado(false);
            LabelResultadoMsg.Text = "Atuador Desligado";
            labelValorAtualLigado.Visible = false;
            labelValorAtualDesligado.Visible = true;
            labelValorAtual.Visible = false;
        }
        private void alterarEstado(bool ligado)
        {
            EstadoDispositivo estado = new EstadoDispositivo();
            estado.Data = DateTime.Now;
            estado.DispositivoId = (int)Session["id"];
            estado.Valor = ligado ? 1 : 0;
            dispositivoService.alterarEstado(estado);
        }

        protected void ButtonAlterar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AlterarDispositivo.aspx");
        }

        protected void ButtonHistorico_Click(object sender, EventArgs e)
        {
            Response.Redirect("Historico.aspx");
        }
    }
}