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
                    TextBoxItemID.Text = Convert.ToString(x.ID);
                    TextBoxMessage.Text = message;
                }

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#myModal').modal('show')", true);

            }
        }


        /// <summary>
        /// this button saves the info from the modal to the database so the sales team can contact
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonSaveContactForm_Click(object sender, EventArgs e)
        {



            using (var db = new SailingSalesDBEntities())
            {

                var customer = new Customer
                {
                    FirstName = TextBoxFirstName.Text,
                    LastName = TextBoxLastName.Text,
                    Email = TextBoxEmail.Text,
                    Message = TextBoxMessage.Text,
                    BoatID = Convert.ToInt32(TextBoxItemID.Text)

                };

                //if customer does not provide email do not save to db
                if (customer.Email != string.Empty)
                {
                    db.Customers.Add(customer);
                    db.SaveChanges();

                }



            }
               
            


        }


     


       
    }
}