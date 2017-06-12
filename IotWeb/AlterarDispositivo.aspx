<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AlterarDispositivo.aspx.cs" Inherits="IoTWeb.AlterarDispositivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h5><asp:Label ID="LabelResultadoMsg" runat="server" Text=""></asp:Label></h5>
    <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Label">Id:</asp:Label>
        <asp:TextBox ID="TextId" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group"> 
        <asp:Label ID="Label1" runat="server" Text="Label">Nome:</asp:Label>
        <asp:TextBox ID="TextNome" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="O nome do dispositivo deve ser preenchido" ControlToValidate="TextNome" BorderColor="Red" BorderStyle="Dashed"></asp:RequiredFieldValidator>
    </div>
    <asp:Label ID="tipoLabel" runat="server" Text="Label">Tipo:</asp:Label>
    <asp:RadioButtonList ID="RadioButtonTipo" runat="server" Enabled="False">
        <asp:ListItem Value="0">Sensor</asp:ListItem>
        <asp:ListItem Value="1">Atuador</asp:ListItem>
    </asp:RadioButtonList>
    <asp:Button ID="ButtonAlterar" runat="server" OnClick="ButtonAlterar_Click" Text="Alterar" CssClass="btn btn-primary floatRight"/>
    </div>
</asp:Content>
