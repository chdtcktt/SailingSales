using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SailingSales.Models;

namespace SailingSales
{
    public partial class _Default : Page
    {
       
      
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListID.Items.Insert(0, new ListItem("-- Select --", "0"));
        }


        /// <summary>
        /// once the customer clicks on a button in the gridview the modal will drop down with autopopulated values of the boat chosen. The customer can then enter his info to be contacted
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridViewBoats_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var boatRecord = Convert.ToInt32(e.CommandArgument);
            boatRecord++;



            using (var db = new SailingSalesDBEntities())
            {
                var q = db.Boats.Where(x => x.ID == boatRecord);

                foreach (var x in q)
                {
                    string message = string.Format("Hey Sailing Sales! I would love you to contact me about the {0} {1}", x.Year, x.Description);
                    DropDownListID.SelectedValue = Convert.ToString(x.ID);
                    TextBoxMessage.Text = message;
                }

                DropModal();

            }
        }

      


        /// <summary>
        /// this button saves the info from the modal to the database so the sales team can contact
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonSaveContactForm_Click(object sender, EventArgs e)
        {
          if(Page.IsValid)
          {
              using (var db = new SailingSalesDBEntities())
              {
                  var customer = new Customer
                  {
                      FirstName = TextBoxFirstName.Text,
                      LastName = TextBoxLastName.Text,
                      Email = TextBoxEmail.Text,
                      Message = TextBoxMessage.Text,
                      BoatID = Convert.ToInt32(DropDownListID.SelectedValue)

                  };

                  //if customer does not provide email do not save to db
                  if (customer.Email != string.Empty)
                  {
                      db.Customers.Add(customer);
                      db.SaveChanges();

                      Response.Redirect("~/thankyou");

                  }
              }
          }
          else
          {
              AlertMessage("Your data was not saved for some reason, please contact the site administrator");

          }
     

        }


        //utilities

        private void AlertMessage(string str)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alerts('" + str + "');", true);
        }

        private void DropModal()
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#myModal').modal('show')", true);
        }

     


       
    }
}