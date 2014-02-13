<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SailingSales._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <asp:GridView ID="GridViewBoats" CssClass="table" runat="server" DataSourceID="SqlDataSourceSailingSales" AutoGenerateColumns="False" OnRowCommand="GridViewBoats_RowCommand">
        <Columns>
            <asp:ImageField DataImageUrlField="Pictures"></asp:ImageField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year"></asp:BoundField>
            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length"></asp:BoundField>
            <asp:BoundField DataField="Beam" HeaderText="Beam" SortExpression="Beam"></asp:BoundField>
            <asp:BoundField DataField="Draft" HeaderText="Draft" SortExpression="Draft"></asp:BoundField>
            <asp:BoundField DataField="Hull" HeaderText="Hull" SortExpression="Hull"></asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"></asp:BoundField>

            <asp:ButtonField Text="Buy" ButtonType="Button" ></asp:ButtonField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceSailingSales" ConnectionString='<%$ ConnectionStrings:SailingSalesDBConnectionString %>' SelectCommand="SELECT * FROM [Boats]"></asp:SqlDataSource>


<!-- Modal for contact form -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">Contact</h4>
      </div>
        <div class="modal-body">
            <table>
                <tr>
                    <td><label>First Name:</label></td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Last Name:</label></td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Email:</label></td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Message to Sales:</label></td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="TextBoxMessage" TextMode="MultiLine" Columns="60" Rows="6"  runat="server"></asp:TextBox></td>
                </tr>   
            </table>


        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


</asp:Content>
