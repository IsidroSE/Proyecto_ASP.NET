<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Borrar_Carreras.aspx.cs" Inherits="Borrar_Carreras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>
    <tr>
        <td colspan="2">
            <center><h2>Borrar usuario</h2>
        </td>
    </tr>
    <tr>
        <td>Carrera a borrar: </td>
        <td>
            <asp:DropDownList ID="ddl_carrera_a_buscar" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id_carrera">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" DeleteCommand="DELETE FROM carreras WHERE (id_carrera = @id_carrera)" SelectCommand="SELECT [id_carrera], [descripcion] FROM [carreras]">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="ddl_carrera_a_buscar" Name="id_carrera" PropertyName="SelectedValue" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <asp:Button ID="btn_borrar" runat="server" Text="Borrar" OnClick="btn_borrar_Click" />
            </center>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lbl_resultado" runat="server"></asp:Label>
        </td>
    </tr>
</table>

</asp:Content>

