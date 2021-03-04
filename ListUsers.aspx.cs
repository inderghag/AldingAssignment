using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AldingAssignment
{
    public partial class ListUsers : System.Web.UI.Page
    {
        private readonly string connectionStr = ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
        MySqlConnection connection;
        MySqlCommand command;
        string queryStr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                BindGridView();
            }
        }

        protected void BindGridView()
        {
            connection = new MySqlConnection(connectionStr);
            connection.Open();

            queryStr = "SELECT * FROM user_info JOIN favourite_foods ON user_info.user_id = favourite_foods.user_id";

            command = new MySqlCommand(queryStr, connection);
            MySqlDataAdapter sqlAdapter = new MySqlDataAdapter(command);

            DataTable dtable = new DataTable();
            sqlAdapter.Fill(dtable);

            connection.Close();

            GridViewUser.DataSource = dtable;
            GridViewUser.DataBind();
            
            ViewState["dirState"] = dtable;
            ViewState["sortdr"] = "Asc";
        }

        protected void OnSearch(object sender, EventArgs e)
        {
            string searchTerm = searchBox.Text.ToLower();

            if (searchTerm.Length >= 3)
            {
                if (ViewState["dirState"] == null)
                    return;

                DataTable dtable = ViewState["dirState"] as DataTable;

                DataTable dtableNew = dtable.Clone();

                foreach (DataRow row in dtable.Rows)
                {
                    if (row["first_name"].ToString().ToLower().Contains(searchTerm))
                    {
                        dtableNew.Rows.Add(row.ItemArray);
                    }
                }

                GridViewUser.DataSource = dtableNew;
                GridViewUser.DataBind();
            }
        }


        protected void OnResetSearch(object sender, EventArgs e)
        {
            if (ViewState["dirState"] == null)
                return;

            DataTable dtable = ViewState["dirState"] as DataTable;
            searchBox.Text = "";

            GridViewUser.DataSource = dtable;
            GridViewUser.DataBind();
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewUser.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                DataTable dtable = ViewState["dirState"] as DataTable;
                dtable.DefaultView.Sort = Session["SortedView"].ToString();
                GridViewUser.DataSource = dtable;
                GridViewUser.DataBind();
            }
            else
            {
                BindGridView();
            }

        }

        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtable = ViewState["dirState"] as DataTable;

            if(dtable.Rows.Count > 0)
            {
                if(Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtable.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";

                    Session["SortedView"] = e.SortExpression + " Desc";
                }
                else
                {
                    dtable.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";

                    Session["SortedView"] = e.SortExpression + " Asc";
                }

                GridViewUser.DataSource = dtable;
                GridViewUser.DataBind();
            }
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(GridViewUser.DataKeys[e.RowIndex].Values[0]);

            string connectionStr = ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            using(MySqlConnection connect = new MySqlConnection(connectionStr))
            {
                using(MySqlCommand command = new MySqlCommand("DELETE FROM user_info WHERE user_id = @UserId"))
                {
                    command.Parameters.AddWithValue("@UserId", userId);
                    command.Connection = connect;
                    connect.Open();
                    command.ExecuteNonQuery();
                    connect.Close();
                }
            }
            this.BindGridView();
        }

        protected void OnRowEdit(object sender, GridViewEditEventArgs e)
        {
            int userId = Convert.ToInt32(GridViewUser.DataKeys[e.NewEditIndex].Value);
            Response.Redirect("EditUser.aspx?UserID=" + userId);
        }
    }
}