<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Editar_Participantes.aspx.cs" Inherits="Editar_Participantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>
    <tr>
        <td>Participante a buscar:</td>
        <td>
            <asp:DropDownList ID="ddl_participante_buscado" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre_completo" DataValueField="id_participante">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" SelectCommand="SELECT [nombre] + ' ' + [apellidos] as nombre_completo, [id_participante] FROM [Participantes]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <asp:Button ID="btn_buscar_carrera" runat="server" Text="Buscar" CausesValidation="False" OnClick="btn_buscar_carrera_Click" UseSubmitBehavior="False" />
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" SelectCommand="SELECT id_participante, num_carrera, dorsal, apellidos, nombre, club FROM Participantes WHERE id_participante = @id_participante" UpdateCommand="UPDATE Participantes SET apellidos = @apellidos, nombre = @nombre, club = @club WHERE id_participante = @id_participante">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_participante_buscado" Name="id_participante" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txt_apellidos" Name="apellidos" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_nombre" Name="nombre" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_club" Name="club" PropertyName="Text" />
                        <asp:ControlParameter Name="id_participante" ControlID="txt_id" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </center>
        </td>
    </tr>
    <tr>
        <td colspan="2"> <center><h2>Editar participante</h2></center> </td>
    </tr>
    <tr>
        <td>ID:</td>
        <td>
            <asp:TextBox ID="txt_id" runat="server" Enabled="False" EnableTheming="True"></asp:TextBox>
        </td
    </tr>
    <tr>
        <td>Carrera: </td>
        <td>
            <asp:TextBox ID="txt_carrera" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Dorsal:</td>
        <td>
            <asp:TextBox ID="txt_dorsal" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Nombre:</td>
        <td><asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_nombre" ErrorMessage="El campo nombre no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Apellidos:</td>
        <td><asp:TextBox ID="txt_apellidos" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_apellidos" ErrorMessage="El campo de apellidos no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Club:</td>
        <td><asp:TextBox ID="txt_club" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_club" ErrorMessage="El campo club no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <asp:Button ID="btn_editar" runat="server" Text="Editar" OnClick="btn_insertar_Click" Height="26px" />
            </center>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lbl_resultado" runat="server"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </td>
    </tr>
</table>

</asp:Content>