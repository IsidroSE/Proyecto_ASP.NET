<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Editar_Chips.aspx.cs" Inherits="Editar_Chips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table>
    <tr>
        <td>Dorsal a buscar:</td>
        <td>
            <asp:DropDownList ID="ddl_dorsal_a_buscar" runat="server" DataSourceID="SqlDataSource1" DataTextField="dorsal" DataValueField="dorsal">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" SelectCommand="SELECT [dorsal] FROM [codigo_chips]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <asp:Button ID="btn_buscar" runat="server" Text="Buscar" CausesValidation="False" OnClick="btn_buscar_Click" UseSubmitBehavior="False" />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" ProviderName="<%$ ConnectionStrings:carrerasConnectionString.ProviderName %>" SelectCommand="SELECT codigo_chips.* FROM codigo_chips WHERE dorsal = @dorsal" UpdateCommand="UPDATE codigo_chips SET codigo = @codigo, dorsal = @dorsal WHERE (dorsal = @codigo_buscar)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_dorsal_a_buscar" Name="dorsal" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txt_codigo" Name="codigo" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_dorsal" Name="dorsal" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddl_dorsal_a_buscar" Name="codigo_buscar" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </center>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center><h2>Editar chips</h2></center>
        </td>
    </tr>
    <tr>
        <td>Código:</td>
        <td><asp:TextBox ID="txt_codigo" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_codigo" ErrorMessage="El campo código no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Dorsal:</td>
        <td><asp:TextBox ID="txt_dorsal" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_dorsal" ErrorMessage="El campo dorsal no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <asp:Button ID="btn_editar" runat="server" Text="Editar" OnClick="btn_editar_Click" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
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

