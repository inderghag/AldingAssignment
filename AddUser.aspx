<%@ Page Title="Add User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="AldingAssignment.AddUsers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add User</h2>
    <form id="form1" runat="server">

        <div class="form-group">
            <asp:Label ID="FirstName" Text="First Name:" AssociatedControlID="firstNameBox" runat="server">
                <asp:TextBox class="form-control" ID="firstNameBox" runat="server"/>
                <asp:RequiredFieldValidator ID="ValidatorFN" runat="server" ControlToValidate="firstNameBox" ErrorMessage="First name is required" ForeColor="Red" Display="Dynamic"/>
            </asp:Label>
        </div>

        <div class="form-group">
            <asp:Label ID="LastName" Text="Last Name:" AssociatedControlID="lastNameBox" runat="server">
                <asp:TextBox class="form-control" ID="lastNameBox" runat="server"/>
                <asp:RequiredFieldValidator ID="ValidatorLN" runat="server" ControlToValidate="lastNameBox" ErrorMessage="Last name is required" ForeColor="Red" Display="Dynamic"/>
            </asp:Label> <br />
        </div>

        <div class="form-group">
            <asp:Label ID="DateOfBirth" Text="Date of Birth:" AssociatedControlID="birthDateBox" ClientIDMode="Static" runat="server">
                <asp:TextBox class="form-control" ID="birthDateBox" ClientIDMode="Static" runat="server" />
                <asp:RequiredFieldValidator ID="ValidatorDOB" runat="server" ControlToValidate="birthDateBox" ErrorMessage="Date of birth is required" ForeColor="Red" Display="Dynamic"/>
            </asp:Label> <br />
        </div>

        <div class="form-group">
            <asp:Label ID="Email" Text="Email:" AssociatedControlID="emailBox" runat="server">
                <asp:TextBox class="form-control" ID="emailBox" runat="server" />
                <asp:RequiredFieldValidator ID="ValidatorEM" runat="server" ControlToValidate="emailBox" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic"/>
            </asp:Label> <br />
        </div>
        
        <div class="form-group">
            <asp:Label ID="Password" Text="Password:" AssociatedControlID="passwordBox" runat="server">
                <asp:TextBox class="form-control" ID="passwordBox" TextMode="Password" runat="server" />
                <asp:RequiredFieldValidator ID="ValidatorPS" runat="server" ControlToValidate="passwordBox" ErrorMessage="Password is required" ForeColor="Red"  Display="Dynamic"/>
                <asp:RegularExpressionValidator ID="RegularExpressValidatorPS" ControlToValidate="passwordBox" runat="server" ErrorMessage="Must be 7 characters long and have 2 Upper Case, 3 Special Characters, and 1 Number" 
                    ValidationExpression="^.*(?=(?:.*?\d){1})(?=(?:.*?[A-Z]){2})(?=(?:.*?[!*@#$%^&+=]){3}).{7,}$" ForeColor="Red" Display="Dynamic"/>
            </asp:Label> <br />
        </div>
        
        <div class="form-group">
            <asp:Label ID="PreferredTitle" Text="Preferred Title:" AssociatedControlID="prefTitleDropDown" runat="server">
                <asp:DropDownList class="custom-select" ID="prefTitleDropDown" runat="server">
                    <asp:ListItem Value="Mr.">Mr.</asp:ListItem>
                    <asp:ListItem Value="Mrs.">Mrs.</asp:ListItem>
                    <asp:ListItem Value="Ms.">Ms.</asp:ListItem>
                    <asp:ListItem Value="Dr.">Dr.</asp:ListItem>
                    <asp:ListItem Value="None">None</asp:ListItem>
                </asp:DropDownList>
            </asp:Label> <br />
        </div>

        <div class="form-group">
            <asp:Label ID="Gender" Text="Gender:" AssociatedControlID="radioButtonGenderList" runat="server">
                <asp:RadioButtonList ID="radioButtonGenderList" runat="server">
                    <asp:ListItem Value="Male">&nbsp Male</asp:ListItem>
                    <asp:ListItem Value="Female">&nbsp Female</asp:ListItem>
                    <asp:ListItem Value="Other">&nbsp Other</asp:ListItem>
                    <asp:ListItem Value="Prefer Not To Say" Selected="True">&nbsp Prefer Not To Say</asp:ListItem>
                </asp:RadioButtonList>
            </asp:Label> <br />
        </div>

        <div class="form-group">
            <asp:Label ID="FavouriteFood" Text="Favourite food(Select all the may apply)?" AssociatedControlID="foodCheckList" runat="server">
                <asp:CheckBoxList ID="foodCheckList" runat="server">
                    <asp:ListItem Value="Pizza">&nbsp Pizza</asp:ListItem>
                    <asp:ListItem Value="Burgers">&nbsp Burgers</asp:ListItem>
                    <asp:ListItem Value="Soup">&nbsp Soup</asp:ListItem>
                    <asp:ListItem Value="Chips">&nbsp Chips</asp:ListItem>
                    <asp:ListItem Value="Salad">&nbsp Salad</asp:ListItem>
                </asp:CheckBoxList>
                <asp:CustomValidator ID="CustomValidatorFF" ErrorMessage="Pick at least one" ForeColor="Red" ClientValidationFunction="ValidateFoodCheckList"
                    runat="server" Display="Dynamic"/>
            </asp:Label> <br />
        </div>

        <asp:Button class="btn btn-primary" ID="submitButton" Text="Submit" runat="server" OnClick="SubmitEvent" CausesValidation="true"/>
    </form>
</asp:Content>
