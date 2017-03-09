<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Editar_Carreras.aspx.cs" Inherits="Editar_Carreras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
    <tr>
        <td>Carrera a buscar: </td>
        <td>
            <asp:DropDownList ID="ddl_numero_carrera" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id_carrera">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" SelectCommand="SELECT [id_carrera], [descripcion] FROM [carreras]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <asp:Button ID="btn_buscar" runat="server" Text="Buscar" OnClick="btn_buscar_Click" UseSubmitBehavior="false" CausesValidation="False" />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" ProviderName="<%$ ConnectionStrings:carrerasConnectionString.ProviderName %>" SelectCommand="SELECT id_carrera, num_carrera, descripcion, fecha, distancia, hora_inicio FROM carreras WHERE (id_carrera = @id_carrera)" UpdateCommand="UPDATE carreras SET descripcion = @descripcion, fecha = @fecha, distancia = @distancia, hora_inicio = @hora_inicio WHERE id_carrera = @id_carrera">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_numero_carrera" Name="id_carrera" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txt_descripcionE" Name="descripcion" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_fechaE" Name="fecha" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_distanciaE" Name="distancia" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_hora_inicioE" Name="hora_inicio" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_id_carrera" Name="id_carrera" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </center>
        </td>
    </tr>
    <tr>
        <td colspan="2"> <center><h2>Editar carrera</h2>
            </center> </td>
    </tr>
    <tr>
        <td>ID: </td>
        <td>
            <asp:TextBox ID="txt_id_carrera" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Número de carrera: </td>
        <td>
            <asp:TextBox ID="txt_num_carreraE" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Descripción:</td>
        <td><asp:TextBox ID="txt_descripcionE" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_descripcionE" ErrorMessage="El campo descripción no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Fecha:</td>
        <td><asp:TextBox ID="txt_fechaE" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_fechaE" ErrorMessage="El campo fecha no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Distancia:</td>
        <td><asp:TextBox ID="txt_distanciaE" runat="server" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_distanciaE" ErrorMessage="El distancia de apellidos no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Hora de inicio:</td>
        <td><asp:TextBox ID="txt_hora_inicioE" runat="server" TextMode="Time"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_hora_inicioE" ErrorMessage="El campo hora de inicio no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <asp:Button ID="btn_editar" runat="server" Text="Editar" OnClick="btn_editar_Click" />
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