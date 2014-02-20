<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SailingSales._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView runat="server" CssClass="table" DataSourceID="SqlDataSourceBoatGrid" AutoGenerateColumns="False" OnRowCommand="GridViewBoats_RowCommand">
        <Columns>


            <asp:ImageField DataImageUrlField="Pictures" ></asp:ImageField>
            <asp:BoundField DataField="ID" HeaderText="Item Number"  SortExpression="ID" InsertVisible="False" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year"></asp:BoundField>
            <asp:BoundField DataField="Length" HeaderText="Length(ft)" SortExpression="Length"></asp:BoundField>
            <asp:BoundField DataField="Beam" HeaderText="Beam(ft)" SortExpression="Beam"></asp:BoundField>
            <asp:BoundField DataField="Draft" HeaderText="Draft(ft)" SortExpression="Draft"></asp:BoundField>
            <asp:BoundField DataField="Hull" HeaderText="Hull" SortExpression="Hull"></asp:BoundField>

            <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" SortExpression="Price"></asp:BoundField>
            <asp:ButtonField Text="Inquire" ControlStyle-CssClass="btn btn-primary" ButtonType="Button" ></asp:ButtonField>
        </Columns>
    </asp:GridView>


    <!-- Modal for contact form -->
    <asp:SqlDataSource runat="server" ID="SqlDataSourceBoatGrid" ConnectionString='<%$ ConnectionStrings:SailingSalesDBConnectionString %>' SelectCommand="SELECT * FROM [Boats]"></asp:SqlDataSource>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h3 class="modal-title" id="myModalLabel">Contact Us</h3>
          </div>
          <div class="modal-body">

              <h4>Address</h4>
              <address>
                  Sailing Sales<br />
                  145 Ocean View W<br />
                  Seattle, WA 98113<br />
              </address>

              <h4>Contact</h4>
              <address>
                  sales@sailingsales.com<br />
                  www.sailingsales.com
              </address>

              <hr />

              <h4>Send a message to sales</h4>
              <table>
                  <tr>
                    <td><label>First Name:</label></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFN" runat="server" ControlToValidate="TextBoxFirstName" ErrorMessage="Your first name is required"></asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td><label>Last Name:</label></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLN" runat="server" ControlToValidate="TextBoxLastName" ErrorMessage="Your last name is required"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td><label>Email:</label></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Your email is required"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td><label>Boat Intereded in:</label></td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="DropDownListID" runat="server" DataSourceID="SqlDataSourceBoatGrid" DataTextField="Description" DataValueField="ID" AppendDataBoundItems="True"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorID"  ControlToValidate="DropDownListID" runat="server" InitialValue="0" ErrorMessage="You must select a boat" ></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><label>Message to Sales(optional):</label></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxMessage" TextMode="MultiLine" Columns="60" Rows="6"  runat="server" ></asp:TextBox>
                    </td>
                </tr>   
            </table>


        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <asp:Button ID="ButtonSaveContactForm" CssClass="btn btn-primary" OnClick="ButtonSaveContactForm_Click" runat="server" Text="Send" />
      </div>
    </div>
  </div>
</div>


</asp:Content>
