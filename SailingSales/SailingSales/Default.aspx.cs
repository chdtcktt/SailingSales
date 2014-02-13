using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SailingSales
{
    public partial class _Default : Page
    {
       
      
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void GridViewBoats_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var boatRecord = Convert.ToInt32(e.CommandArgument);
            boatRecord++;



            using (SailingSalesdbDataContext db = new SailingSalesdbDataContext())
            {
                var q = db.Boats.Where(x => x.ID == boatRecord);

                foreach (var x in q)
                {
                    string message = string.Format("Hey Sailing Sales! I would love you to contact me about the {0} {1} \n ITEM NUMBER: {2}", x.Year, x.Description, x.ID);
                    TextBoxMessage.Text = message;
                }

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#myModal').modal('show')", true);


            }
        }

       
    }
}