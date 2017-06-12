<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IncluirDispositivo.aspx.cs" Inherits="IoTWeb.IncluirDispositivo" %>

<asp:Content runat="server" ID="head" ContentPlaceHolderId="head">
</asp:Content>

<asp:Content runat="server" ID="content" ContentPlaceHolderId="ContentPlaceHolder1">
    <div class="container">
    <h5><asp:Label ID="LabelResultadoMsg" runat="server" Text=""></asp:Label></h5>
    <div class="form-group"> 
        <asp:Label ID="Label1" runat="server" Text="Label">Nome:</asp:Label>
        <asp:TextBox ID="TextNome" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="O nome do dispositivo deve ser preenchido" ControlToValidate="TextNome" BorderColor="Red" BorderStyle="Dashed"></asp:RequiredFieldValidator>
    </div>
    <asp:Label ID="tipoLabel" runat="server" Text="Label">Tipo:</asp:Label>
    <asp:RadioButtonList ID="RadioButtonTipo" runat="server">
        <asp:ListItem Value="0">Sensor</asp:ListItem>
        <asp:ListItem Value="1">Atuador</asp:ListItem>
    </asp:RadioButtonList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="O tipo do dispositivo deve ser informado" ControlToValidate="RadioButtonTipo" BorderColor="Red" BorderStyle="Dashed"></asp:RequiredFieldValidator>
    <asp:Button ID="ButtonIncluir" runat="server" OnClick="ButtonIncluir_Click" Text="Incluir" CssClass="btn btn-primary floatRight"/>
    </div>
</asp:Content>
