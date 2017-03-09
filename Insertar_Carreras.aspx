<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Insertar_Carreras.aspx.cs" Inherits="Insertar_Carreras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>
    <tr>
        <td colspan="2"> <center><h2>Insertar carrera</h2></center> </td>
    </tr>
    <tr>
        <td>Número de carrera: </td>
        <td>
            <asp:TextBox ID="txt_num_carrera" runat="server" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="El campo número de dorsal no puede estar vacío." ControlToValidate="txt_num_carrera" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Descripción:</td>
        <td><asp:TextBox ID="txt_descripcion" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_descripcion" ErrorMessage="El campo descripción no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Fecha:</td>
        <td><asp:TextBox ID="txt_fecha" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_fecha" ErrorMessage="El campo fecha no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Distancia:</td>
        <td><asp:TextBox ID="txt_distancia" runat="server" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_distancia" ErrorMessage="El distancia de apellidos no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Hora de inicio:</td>
        <td><asp:TextBox ID="txt_hora_inicio" runat="server" TextMode="Time"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_hora_inicio" ErrorMessage="El campo hora de inicio no puede estar vacío." ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <asp:Button ID="btn_insertar" runat="server" Text="Insertar" OnClick="btn_insertar_Click" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" InsertCommand="INSERT INTO carreras(num_carrera, descripcion, fecha, distancia, hora_inicio) VALUES (@num_carrera, @descripcion, @fecha, @distancia, @hora_inicio)" ProviderName="<%$ ConnectionStrings:carrerasConnectionString.ProviderName %>">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txt_num_carrera" Name="num_carrera" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_descripcion" Name="descripcion" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_fecha" Name="fecha" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_distancia" Name="distancia" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_hora_inicio" Name="hora_inicio" PropertyName="Text" />
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