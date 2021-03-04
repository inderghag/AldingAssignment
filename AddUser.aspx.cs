using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AldingAssignment
{
    public partial class AddUsers : System.Web.UI.Page
    {
        private readonly string connectionStr = ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
        MySqlConnection connection;
        MySqlCommand command;
        string queryStr;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitEvent(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                EnterUser();
                EnterCheckBox();
                Response.Redirect("ListUsers.aspx");
            }
        }

        private void EnterUser()
        {
            connection = new MySqlConnection(connectionStr);
            connection.Open();

            queryStr = "INSERT INTO aldingmodel.user_info (first_name, last_name, birth_date, gender, email, password, title) " +
                "VALUES('" + firstNameBox.Text + "','" + lastNameBox.Text + "','" + birthDateBox.Text + "','" + radioButtonGenderList.SelectedValue + "','" + 
                emailBox.Text + "','" + passwordBox.Text + "','" + prefTitleDropDown.SelectedValue +"');";

            command = new MySqlCommand(queryStr, connection);
            command.ExecuteNonQuery();

            connection.Close();
        }

        private void EnterCheckBox()
        {
            connection = new MySqlConnection(connectionStr);
            connection.Open();

            string chkBoxVals = "'";
            for (int i = 0; i < foodCheckList.Items.Count; i++)
            {
                if (foodCheckList.Items[i].Selected)
                {
                    chkBoxVals += ",1";
                }
                else
                {
                    chkBoxVals += ",0";
                }
            }
            chkBoxVals += ");";

            int lastId = (int)command.LastInsertedId;
            queryStr = "INSERT INTO aldingmodel.favourite_foods (user_id, pizza, burgers, soup, chips, salad) " +
                "VALUES ('" + lastId + chkBoxVals;

            command = new MySqlCommand(queryStr, connection);
            command.ExecuteNonQuery();

            connection.Close();

        }
    }
}