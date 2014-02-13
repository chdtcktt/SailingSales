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
                var item = db.Boats.Where(x => x.ID == boatRecord);



                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#myModal').modal('show')", true);


            }
            
            


           


        }

       
    }
}