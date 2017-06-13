<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sensores.aspx.cs" Inherits="IoTWeb.Sensores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Professor, aqui estou utilizando uma classe do bootstrap, ok? -->
        <h1 class="text-info">
            Sensores <br />
            <small>Listagem de Sensores</small>
        </h1>
    <asp:ListView ID="ListViewSensores" runat="server" DataKeyNames="Id">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
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
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <a href='DetalheDispositivo.aspx?id=<%# Eval("Id") %>'><asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' /></a>
                </td>
                <td>
                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
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
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
                </td>
                <td>
                    <a href='AlterarDispositivo.aspx?id=<%# Eval("Id") %>'>Alterar</a>
                </td>
            </tr>
        </InsertItemTemplate>
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
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">Id</th>
                                <th runat="server">Nome</th>
                                <th runat="server">Tipo</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <a href='DetalheDispositivo.aspx?id=<%# Eval("Id") %>'><asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
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
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IoTDB %>" SelectCommand="SELECT [Id], [Nome], [Tipo] FROM [Dispositivo] WHERE ([Tipo] = @Tipo)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="Tipo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="ListViewSensores" PageSize="3">
        <Fields>
            <asp:NumericPagerField ButtonType="Link" />
        </Fields>
    </asp:DataPager>

</asp:Content>
