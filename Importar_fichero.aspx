<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Importar_fichero.aspx.cs" Inherits="Importar_fichero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>
        <tr>
            <td colspan="2">
                <h1>
                    Importa un fichero para actualizar los tiempos de los
                    participantes.
                </h1>
            </td>
        </tr>
        <tr>
            <td>Seleccione un archivo a subir:</td>
            <td>
                <asp:FileUpload ID="filup_fichero" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btn_confirmar" runat="server" Text="Confirmar" OnClick="btn_confirmar_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbl_resultado" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>

