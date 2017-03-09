<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Insertar_Participantes.aspx.cs" Inherits="Insertar_Participantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>
    <tr>
        <td colspan="2"> <center><h2>Insertar participante</h2></center> </td>
    </tr>
    <tr>
        <td>Número de carrera: </td>
        <td>
            <asp:DropDownList ID="ddl_numero_carrera" runat="server" DataSourceID="SqlDataSource1" DataTextField="num_carrera" DataValueField="num_carrera"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" SelectCommand="SELECT [num_carrera] FROM [carreras]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>Dorsal:</td>
        <td>
            <asp:DropDownList ID="ddl_dorsal" runat="server" DataSourceID="SqlDataSource2" DataTextField="dorsal" DataValueField="dorsal">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" SelectCommand="SELECT [dorsal] FROM [codigo_chips]"></asp:SqlDataSource>
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
                <asp:Button ID="btn_insertar" runat="server" Text="Insertar" OnClick="btn_insertar_Click" />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" InsertCommand="INSERT INTO Participantes(num_carrera, dorsal, apellidos, nombre, club) VALUES (@num_carrera, @dorsal, @apellidos, @nombre, @club)" ProviderName="<%$ ConnectionStrings:carrerasConnectionString.ProviderName %>">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="ddl_numero_carrera" Name="num_carrera" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddl_dorsal" Name="dorsal" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txt_apellidos" Name="apellidos" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_nombre" Name="nombre" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_club" Name="club" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
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

