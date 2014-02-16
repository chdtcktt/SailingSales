<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesAdmin.aspx.cs" Inherits="SailingSales.SalesAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>List of Customers</h3>
    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceSalesAdmin">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="CustomerID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
            <asp:BoundField DataField="BoatID" HeaderText="BoatID Interest" SortExpression="BoatID"></asp:BoundField>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message"></asp:BoundField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlDataSourceSalesAdmin" ConnectionString='<%$ ConnectionStrings:SailingSalesDBConnectionString %>' SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>

    <asp:Button ID="ButtonExport" runat="server" CssClass="btn btn-primary" Text="Export to .txt" OnClick="ButtonExport_Click" />

</asp:Content>
