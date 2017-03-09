<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vista_Participantes.aspx.cs" Inherits="Vista_Participantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_participante" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id_participante" HeaderText="ID" ReadOnly="True" SortExpression="id_participante" />
            <asp:BoundField DataField="num_carrera" HeaderText="Número de carrera" SortExpression="num_carrera" />
            <asp:BoundField DataField="dorsal" HeaderText="Dorsal" SortExpression="dorsal" />
            <asp:BoundField DataField="apellidos" HeaderText="Apellidos" SortExpression="apellidos" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
            <asp:BoundField DataField="club" HeaderText="Club" SortExpression="club" />
            <asp:BoundField DataField="posicion_general" HeaderText="Posición General" SortExpression="posicion_general" />
            <asp:BoundField DataField="tiempo_oficial" HeaderText="Tiempo oficial" SortExpression="tiempo_oficial" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" DeleteCommand="DELETE FROM [Participantes] WHERE [id_participante] = @id_participante" InsertCommand="INSERT INTO [Participantes] ([num_carrera], [dorsal], [apellidos], [nombre], [club], [posicion_general], [tiempo_oficial]) VALUES (@num_carrera, @dorsal, @apellidos, @nombre, @club, @posicion_general, @tiempo_oficial)" ProviderName="<%$ ConnectionStrings:carrerasConnectionString.ProviderName %>" SelectCommand="SELECT [id_participante], [num_carrera], [dorsal], [apellidos], [nombre], [club], [posicion_general], [tiempo_oficial] FROM [Participantes]" UpdateCommand="UPDATE [Participantes] SET [num_carrera] = @num_carrera, [dorsal] = @dorsal, [apellidos] = @apellidos, [nombre] = @nombre, [club] = @club, [posicion_general] = @posicion_general, [tiempo_oficial] = @tiempo_oficial WHERE [id_participante] = @id_participante">
        <DeleteParameters>
            <asp:Parameter Name="id_participante" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="num_carrera" Type="Int32" />
            <asp:Parameter Name="dorsal" Type="Int32" />
            <asp:Parameter Name="apellidos" Type="String" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="club" Type="String" />
            <asp:Parameter Name="posicion_general" Type="Int32" />
            <asp:Parameter Name="tiempo_oficial" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="num_carrera" Type="Int32" />
            <asp:Parameter Name="dorsal" Type="Int32" />
            <asp:Parameter Name="apellidos" Type="String" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="club" Type="String" />
            <asp:Parameter Name="posicion_general" Type="Int32" />
            <asp:Parameter Name="tiempo_oficial" Type="DateTime" />
            <asp:Parameter Name="id_participante" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

