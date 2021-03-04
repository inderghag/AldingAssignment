<%@ Page Language="C#" Title="User List" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListUsers.aspx.cs" Inherits="AldingAssignment.ListUsers" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div>
            <asp:TextBox class="form-control mr-sm-2"  ID="searchBox" runat="server" Text="Search First Name"></asp:TextBox>
            <asp:Button class="btn btn-primary" ID="searchButton" runat="server" Text="search" OnClick="OnSearch" />
            <asp:Button class="btn btn-secondary" ID="reset" runat="server" Text="reset" OnClick="OnResetSearch" />

            <asp:GridView class="table table-hover" ID="GridViewUser" runat="server" AutoGenerateColumns="false" DataKeyNames="user_id" AllowPaging="true"
                PageSize="5" OnPageIndexChanging="OnPageIndexChanging" AllowSorting="true" OnSorting="OnSorting" OnRowDeleting="OnRowDeleting"
                OnRowEditing="OnRowEdit">
                <Columns>
                    <asp:BoundField DataField="user_id" HeaderText="User Id" SortExpression="user_id" />
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                    <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
                    <asp:BoundField DataField="birth_date" HeaderText="Date of Birth" DataFormatString="{0:d}" SortExpression="birth_date" />
                    <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="pizza" HeaderText="Pizza" SortExpression="pizza" />
                    <asp:BoundField DataField="burgers" HeaderText="Burgers" SortExpression="burgers" />
                    <asp:BoundField DataField="soup" HeaderText="Soup" SortExpression="soup" />
                    <asp:BoundField DataField="chips" HeaderText="Chips" SortExpression="chips" />
                    <asp:BoundField DataField="salad" HeaderText="Salad" SortExpression="salad" />

                    <asp:CommandField ShowEditButton="true" />
                    <asp:CommandField ShowDeleteButton="true"/>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
