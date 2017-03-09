<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Borrar_Participantes.aspx.cs" Inherits="Borrar_Participantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table>
    <tr>
        <td colspan="2">
            <h2>Borrar Participantes</h2>
        </td>
    </tr>
    <tr>
        <td>
            Participante a borrar:
        </td>
        <td>
            <asp:DropDownList ID="ddl_participante_buscado" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre_completo" DataValueField="id_participante"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" SelectCommand="SELECT [id_participante], [nombre] + ' ' + [apellidos] as nombre_completo FROM [Participantes]" DeleteCommand="DELETE FROM Participantes WHERE (id_participante = @id_participante)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="ddl_participante_buscado" Name="id_participante" PropertyName="SelectedValue" />
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

