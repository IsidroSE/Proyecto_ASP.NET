<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Insertar_Chips.aspx.cs" Inherits="Insertar_Chips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>
    <tr>
        <td colspan="2">
            <center><h2>Insertar chips</h2></center>
        </td>
    </tr>
    <tr>
        <td>Código:</td>
        <td><asp:TextBox ID="txt_codigo" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_codigo" ErrorMessage="El campo código no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Dorsal:</td>
        <td><asp:TextBox ID="txt_dorsal" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_dorsal" ErrorMessage="El campo dorsal no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <asp:Button ID="btn_insertar" runat="server" Text="Insertar" OnClick="btn_insertar_Click" />
            </center>
            <asp:Label ID="lbl_resultado" runat="server"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" InsertCommand="INSERT INTO codigo_chips(codigo, dorsal) VALUES (@codigo, @dorsal)" ProviderName="<%$ ConnectionStrings:carrerasConnectionString.ProviderName %>">
                <InsertParameters>
                    <asp:ControlParameter ControlID="txt_codigo" Name="codigo" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_dorsal" Name="dorsal" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>

</asp:Content>

