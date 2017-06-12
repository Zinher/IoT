<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Atuadores.aspx.cs" Inherits="IoTWeb.Atuadores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Professor, aqui estou utilizando uma classe do bootstrap, ok? -->
        <h1 class="text-info">
            Atuadores <br />
            <small>Listagem de Atuadores</small>
        </h1>
    <asp:ListView ID="ListViewSensores" runat="server"
        ItemPlaceholderID="itemPlaceHolder1"
        OnPagePropertiesChanging="ListViewSensores_PagePropertiesChanging"
        Enabled="False">
        <LayoutTemplate>
    <table runat="server">
        <tr runat="server">
            <td runat="server">
                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;width:400px">
                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                        <th runat="server">Id</th>
                        <th runat="server">Nome</th>
                        <th runat="server">Tipo</th>
                        <th></th>
                    </tr>
                    <tr id="itemPlaceHolder1" runat="server">
                    </tr>
                </table>
            </td>
        </tr>
        <tr runat="server">
            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
            </td>
        </tr>
    </table>
</LayoutTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <a href='DetalheDispositivo.aspx?id=<%# Eval("Id") %>'><asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' /></a>
                </td>
                <td>
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                </td>
                <td>
                    <asp:Label ID="TipoLabel" runat="server" Text='<%# Eval("Tipo") %>' />
                </td>
                <td>
                    <a href='AlterarDispositivo.aspx?id=<%# Eval("Id") %>'>Alterar</a>
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <a href='DetalheDispositivo.aspx?id=<%# Eval("Id") %>'><asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>' /></a>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Nome") %>' />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Tipo") %>' />
                </td>
                <td>
                    <a href='AlterarDispositivo.aspx?id=<%# Eval("Id") %>'>Alterar</a>
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            
            </table>
        </EmptyDataTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Nome") %>' />
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Tipo") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="ListViewSensores" PageSize="3">
        <Fields>
            <asp:NumericPagerField ButtonType="Link" />
        </Fields>
    </asp:DataPager>
</asp:Content>
