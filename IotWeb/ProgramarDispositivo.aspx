<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProgramarDispositivo.aspx.cs" Inherits="IoTWeb.ProgramarDispositivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <!-- Professor, aqui estou utilizando uma classe do bootstrap, ok? -->
        <h1 class="text-info">
            Programar dispositivo <br />
            <small>Página para programação de dispositivo</small>
        </h1>
        <h5>
            <asp:Label ID="LabelResultadoMsg" runat="server" Text=""></asp:Label></h5>
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

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Label">Ligar:</asp:Label>
            <asp:TextBox ID="TextLigarHora" runat="server" placeholder="Hora (0 a 23)" CssClass="form-control col-lg-3"></asp:TextBox>
            <asp:TextBox ID="TextLigarMinuto" runat="server" placeholder="Minuto (0 a 59)" CssClass="form-control col-lg-3"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Label">Desligar:</asp:Label>
            <asp:TextBox ID="TextDesligarHora" runat="server" placeholder="Hora (0 a 23)" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="TextDesligarMinuto" runat="server" placeholder="Minuto (0 a 59)" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="ButtonProgramar" runat="server" OnClick="ButtonProgramar_Click" Text="Programar" CssClass="btn btn-primary floatRight" />
    </div>
</asp:Content>
