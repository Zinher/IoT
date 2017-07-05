<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sensores.aspx.cs" Inherits="IoTWeb.Sensores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Professor, aqui estou utilizando uma classe do bootstrap, ok? -->
        <h1 class="text-info">
            Sensores <br />
            <small>Listagem de Sensores</small>
        </h1>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IoTDB %>" SelectCommand="SELECT [ID], [Tipo], [Nome] FROM [Dispositivo] WHERE ([Tipo] = @Tipo)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="Tipo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:ListView ID="ListViewSensores" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <a href='DetalheDispositivo.aspx?id=<%# Eval("Id") %>'><asp:Label ID="TipoLabel" runat="server" Text='<%# Eval("Tipo") %>' /></a>
                </td>
                <td>
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                </td>
                <td>
                    <a href='AlterarDispositivo.aspx?id=<%# Eval("Id") %>'>Alterar</a>
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <a href='DetalheDispositivo.aspx?id=<%# Eval("Id") %>'><asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' /></a>
                </td>
                <td>
                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                </td>
                <td>
                    <a href='AlterarDispositivo.aspx?id=<%# Eval("Id") %>'>Alterar</a>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <a href='DetalheDispositivo.aspx?id=<%# Eval("Id") %>'><asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' /></a>
                </td>
                <td>
                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                </td>
                <td>
                    <a href='AlterarDispositivo.aspx?id=<%# Eval("Id") %>'>Alterar</a>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <a href='DetalheDispositivo.aspx?id=<%# Eval("Id") %>'><asp:Label ID="TipoLabel" runat="server" Text='<%# Eval("Tipo") %>' /></a>
                </td>
                <td>
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                </td>
                <td>
                    <a href='AlterarDispositivo.aspx?id=<%# Eval("Id") %>'>Alterar</a>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th class="text-center text-uppercase" runat="server">Tipo</th>
                                <th class="text-center text-uppercase" runat="server">Nome</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <a href='DetalheDispositivo.aspx?id=<%# Eval("Id") %>'><asp:Label ID="TipoLabel" runat="server" Text='<%# Eval("Tipo") %>' /></a>
                </td>
                <td>
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                </td>
                <td>
                    <a href='AlterarDispositivo.aspx?id=<%# Eval("Id") %>'>Alterar</a>
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
