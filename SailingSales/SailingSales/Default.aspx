<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SailingSales._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<%--    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
    </div>--%>
<%--    <div class="row ">--%>
        <asp:GridView  ID="GridView1" CssClass="table" runat="server" DataSourceID="SqlDataSourceSailingSales" AutoGenerateColumns="False">
            <Columns>
                                <asp:ImageField DataImageUrlField="Pictures"></asp:ImageField>

                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year"></asp:BoundField>
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length"></asp:BoundField>
                <asp:BoundField DataField="Beam" HeaderText="Beam" SortExpression="Beam"></asp:BoundField>
                <asp:BoundField DataField="Draft" HeaderText="Draft" SortExpression="Draft"></asp:BoundField>
                <asp:BoundField DataField="Hull" HeaderText="Hull" SortExpression="Hull"></asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"></asp:BoundField>

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSourceSailingSales" ConnectionString='<%$ ConnectionStrings:SailingSalesDBConnectionString %>' SelectCommand="SELECT * FROM [Boats]"></asp:SqlDataSource>
<%--    </div>--%>

</asp:Content>
