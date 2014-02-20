using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SailingSales.Models;
using System.IO;

namespace SailingSales
{
    public partial class SalesAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["authenticated"] != "10-56-34-67-85")
            {
                Response.Redirect("/");

            }
           
        }

        protected void ButtonExport_Click(object sender, EventArgs e)
        {
            //string fileName = "Content/data/path.txt";
            //string fullPath = Path.GetFullPath(fileName);

            using (var w = new StreamWriter(Server.MapPath("~/exportdata/customerlist.txt"), true))
            {
                w.WriteLine(DateTime.Now); 


                using (var db = new SailingSalesDBEntities())
                {
                    var q = db.Customers;

                    foreach (var item in q)
                    {
                        w.Write("First Name: ");
                        w.WriteLine(item.FirstName);
                        w.Write("Last Name: ");
                        w.WriteLine(item.LastName);
                        w.Write("Email: ");
                        w.WriteLine(item.Email);
                        w.Write("Message: ");
                        w.WriteLine(item.Message);
                        w.Write("Item Desired: ");
                        w.WriteLine(item.BoatID);

                    }
                    w.WriteLine("");
                }


            }

            Response.Redirect("~/exportdata/customerlist.txt");
        }


    }
}