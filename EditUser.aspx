<%@ Page Language="C#" Title="Edit User" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="AldingAssignment.EditUser" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Edit User</h2>
    <form id="form1" runat="server">
        <div class="form-group">
            <asp:Label ID="FirstName" Text="First Name:" AssociatedControlID="firstNameBox" runat="server">
                <asp:TextBox class="form-control" ID="firstNameBox" runat="server"/>
                <asp:RequiredFieldValidator ID="ValidatorFN" runat="server" ControlToValidate="firstNameBox" ErrorMessage="First name is required" ForeColor="Red" Display="Dynamic"/>
            </asp:Label> <br />
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
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                    <asp:ListItem Value="Other">Other</asp:ListItem>
                    <asp:ListItem Value="Prefer Not To Say" Selected="True">Prefer Not To Say</asp:ListItem>
                </asp:RadioButtonList>
            </asp:Label> <br />
        </div>

        <div class="form-group">
            <asp:Label ID="FavouriteFood" Text="Favourite food(Select all the may apply)?" AssociatedControlID="foodCheckList" runat="server">
                <asp:CheckBoxList ID="foodCheckList" runat="server">
                    <asp:ListItem Value="Pizza">Pizza</asp:ListItem>
                    <asp:ListItem Value="Burgers">Burgers</asp:ListItem>
                    <asp:ListItem Value="Soup">Soup</asp:ListItem>
                    <asp:ListItem Value="Chips">Chips</asp:ListItem>
                    <asp:ListItem Value="Salad">Salad</asp:ListItem>
                </asp:CheckBoxList>
                <asp:CustomValidator ID="CustomValidatorFF" ErrorMessage="Pick at least one" ForeColor="Red" ClientValidationFunction="ValidateFoodCheckList"
                    runat="server" Display="Dynamic"/>
            </asp:Label> <br />
        </div>
        <asp:Button class="btn btn-primary" ID="submitButton" Text="Submit" runat="server" OnClick="SubmitEvent" CausesValidation="true"/>
    </form>
</asp:Content>
