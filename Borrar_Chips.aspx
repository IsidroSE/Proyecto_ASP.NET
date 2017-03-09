<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Borrar_Chips.aspx.cs" Inherits="Borrar_Chips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table>
    <tr>
        <td colspan="2">
            <center><h2>Borrar chips</h2></center>
        </td>
    </tr>
    <tr>
        <td>Dorsal a borrar:</td>
        <td>
            <asp:DropDownList ID="ddl_dorsal" runat="server" DataSourceID="SqlDataSource1" DataTextField="dorsal" DataValueField="dorsal">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" SelectCommand="SELECT [dorsal] FROM [codigo_chips]" DeleteCommand="DELETE FROM codigo_chips WHERE (dorsal = @dorsal)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="ddl_dorsal" Name="dorsal" PropertyName="SelectedValue" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btn_borrar" runat="server" Text="Borrar" OnClick="btn_borrar_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lbl_resultado" runat="server"></asp:Label>
        </td>
    </tr>
</table>

</asp:Content>