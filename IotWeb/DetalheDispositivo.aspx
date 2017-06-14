<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalheDispositivo.aspx.cs" Inherits="IoTWeb.DetalheDispositivo" %>

<asp:Content runat="server" ID="head" ContentPlaceHolderId="head">
</asp:Content>

<asp:Content runat="server" ID="content" ContentPlaceHolderId="ContentPlaceHolder1">
    <div class="container">
        <!-- Professor, aqui estou utilizando uma classe do bootstrap, ok? -->
        <h1 class="text-info">
            Detalhes do dispositivo <br />
            <small>Página de exibição de detalhes</small>
        </h1>
        <h5><asp:Label ID="LabelResultadoMsg" runat="server" Text="Label"></asp:Label></h5>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Label" CssClass="col-sm-2 control-label">Id:</asp:Label>
            <asp:TextBox ID="TextId" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Label">Nome:</asp:Label>
            <asp:TextBox ID="TextNome" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Label ID="tipoLabel" runat="server" Text="Label">Tipo:</asp:Label>
        <asp:RadioButtonList ID="RadioButtonTipo" runat="server" Enabled="false">
            <asp:ListItem Value="0">Sensor</asp:ListItem>
            <asp:ListItem Value="1">Atuador</asp:ListItem>
        </asp:RadioButtonList>
        <div class="panel panel-default">
            <div class="panel-heading">Estado Atual</div>
            <div class="panel-body">
                <asp:Label ID="labelValorAtual" runat="server" Text=""></asp:Label>
                <asp:Label ID="labelValorAtualLigado" runat="server" Text="">Ligado</asp:Label>
                <asp:Label ID="labelValorAtualDesligado" runat="server" Text="">Desligado</asp:Label>
            </div>
        </div>
        <div id="DivControleAtuador" runat="server" class="panel panel-default">
            <div class="panel-heading">Atuador</div>
            <div class="panel-body">
                <asp:Button ID="ButtonLigar" runat="server" Text="Ligar" CssClass="btn btn-primary" OnClick="ButtonLigar_Click"/>
                <asp:Button ID="ButtonDesligar" runat="server" Text="Desligar" CssClass="btn btn-primary marginLeft" OnClick="ButtonDesligar_Click"/>
            </div>
        </div>
        <asp:Button ID="ButtonAlterar" runat="server" Text="Alterar" OnClick="ButtonAlterar_Click" CssClass="btn btn-primary marginLeft" />
        <asp:Button ID="ButtonHistorico" runat="server" Text="Histórico" OnClick="ButtonHistorico_Click" CssClass="btn btn-primary marginLeft" />
        <asp:Button ID="ButtonProgramar" runat="server" Text="Programar" OnClick="ButtonProgramar_Click" CssClass="btn btn-primary marginLeft" />
    </div>
</asp:Content>