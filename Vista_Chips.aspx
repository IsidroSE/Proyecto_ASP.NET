<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vista_Chips.aspx.cs" Inherits="Vista_Chips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="dorsal" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar.">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="codigo" HeaderText="Código" SortExpression="codigo" />
        <asp:BoundField DataField="dorsal" HeaderText="Dorsal" ReadOnly="True" SortExpression="dorsal" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carrerasConnectionString %>" DeleteCommand="DELETE FROM [codigo_chips] WHERE [dorsal] = @dorsal" InsertCommand="INSERT INTO [codigo_chips] ([codigo], [dorsal]) VALUES (@codigo, @dorsal)" ProviderName="<%$ ConnectionStrings:carrerasConnectionString.ProviderName %>" SelectCommand="SELECT [codigo], [dorsal] FROM [codigo_chips]" UpdateCommand="UPDATE [codigo_chips] SET [codigo] = @codigo WHERE [dorsal] = @dorsal">
    <DeleteParameters>
        <asp:Parameter Name="dorsal" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="codigo" Type="String" />
        <asp:Parameter Name="dorsal" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="codigo" Type="String" />
        <asp:Parameter Name="dorsal" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
&nbsp;

</asp:Content>

