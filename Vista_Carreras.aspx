<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vista_Carreras.aspx.cs" Inherits="Vista_Carreras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_carrera" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id_carrera" HeaderText="ID" ReadOnly="True" SortExpression="id_carrera" />
            <asp:BoundField DataField="num_carrera" HeaderText="Número de carrera" SortExpression="num_carrera" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
            <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
            <asp:BoundField DataField="distancia" HeaderText="Distancia" SortExpression="distancia" />
            <asp:BoundField DataField="hora_inicio" HeaderText="Hora de inicio" SortExpression="hora_inicio" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" DeleteCommand="DELETE FROM [carreras] WHERE [id_carrera] = @id_carrera" InsertCommand="INSERT INTO [carreras] ([num_carrera], [descripcion], [fecha], [distancia], [hora_inicio]) VALUES (@num_carrera, @descripcion, @fecha, @distancia, @hora_inicio)" ProviderName="<%$ ConnectionStrings:carrerasConnectionString.ProviderName %>" SelectCommand="SELECT [id_carrera], [num_carrera], [descripcion], [fecha], [distancia], [hora_inicio] FROM [carreras]" UpdateCommand="UPDATE [carreras] SET [num_carrera] = @num_carrera, [descripcion] = @descripcion, [fecha] = @fecha, [distancia] = @distancia, [hora_inicio] = @hora_inicio WHERE [id_carrera] = @id_carrera">
        <DeleteParameters>
            <asp:Parameter Name="id_carrera" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="num_carrera" Type="Int32" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="fecha" Type="DateTime" />
            <asp:Parameter Name="distancia" Type="Int32" />
            <asp:Parameter DbType="Time" Name="hora_inicio" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="num_carrera" Type="Int32" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="fecha" Type="DateTime" />
            <asp:Parameter Name="distancia" Type="Int32" />
            <asp:Parameter DbType="Time" Name="hora_inicio" />
            <asp:Parameter Name="id_carrera" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
&nbsp;

</asp:Content>

