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
    public partial class EditUser : System.Web.UI.Page
    {
        private readonly string connectionStr = ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
        MySqlConnection connection;
        MySqlCommand command;
        string queryStr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                UserLoad();
            }
        }

        protected void UserLoad()
        {
            connection = new MySqlConnection(connectionStr);
            connection.Open();
            string userId = Request.QueryString["UserID"];

            queryStr = "SELECT * FROM user_info INNER JOIN favourite_foods WHERE user_info.user_id = " + userId + " and favourite_foods.user_id = " + userId + ";";

            command = new MySqlCommand(queryStr, connection);

            MySqlDataReader myReader = command.ExecuteReader();

            while(myReader.Read())
            {
                firstNameBox.Text = (myReader["first_name"].ToString());
                lastNameBox.Text = (myReader["last_name"].ToString());
                birthDateBox.Text = (string.Join("-", myReader["birth_date"].ToString().Substring(0, 10).Split('/').Reverse()));
                prefTitleDropDown.Items.FindByValue(myReader["title"].ToString()).Selected = true;
                radioButtonGenderList.Items.FindByValue(myReader["gender"].ToString()).Selected = true;

                foreach(var checkBox in foodCheckList.Items)
                {
                    if(myReader[checkBox.ToString()].ToString() == "1")
                    {
                        foodCheckList.Items.FindByValue(checkBox.ToString()).Selected = true;
                    }
                }
            }
            connection.Close();
        }

        protected void SubmitEvent(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                connection = new MySqlConnection(connectionStr);
                connection.Open();

                string userId = Request.QueryString["UserID"];
                queryStr = $"UPDATE user_info SET first_name='{firstNameBox.Text}', last_name='{lastNameBox.Text}', birth_date='{birthDateBox.Text}', gender='{radioButtonGenderList.SelectedValue}', " +
                    $"title='{prefTitleDropDown.SelectedValue}' WHERE user_id={userId};\n";

                queryStr += "UPDATE favourite_foods SET ";
                for (int i = 0; i < foodCheckList.Items.Count; i++)
                {
                    if (foodCheckList.Items[i].Selected == true)
                    {
                        queryStr += $"{foodCheckList.Items[i].Value.ToLower()}= 1";
                    }
                    else
                    {
                        queryStr += $"{foodCheckList.Items[i].Value.ToLower()}= 0";
                    }

                    if (i != foodCheckList.Items.Count - 1)
                    {
                        queryStr += ", ";
                    }
                }
                queryStr += $" WHERE user_id={userId};";

                command = new MySqlCommand(queryStr, connection);
                command.ExecuteNonQuery();
                connection.Close();

                Response.Redirect("ListUsers.aspx");
            }
        }
    }
}