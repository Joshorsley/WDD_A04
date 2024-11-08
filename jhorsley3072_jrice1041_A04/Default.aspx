<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="jhorsley3072_jrice1041_A04._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <asp:Panel 
                ID="Panel_Name" 
                runat="server" 
                style="text-align: center" 
                Visible="true">
                <asp:Label 
                    ID="Label1" 
                    runat="server" 
                    Text="Please enter your name:">
                </asp:Label>
                <br />
                <br />
                <asp:TextBox 
                    ID="Input_Name" 
                    runat="server">
                </asp:TextBox>
                <br />
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator1" 
                    runat="server" 
                    ControlToValidate="Input_Name"
                    ErrorMessage="RequiredFieldValidator"
                    ValidationGroup="ValidationGroup_Name">
                </asp:RequiredFieldValidator>
                <br />
                <asp:CustomValidator 
                    ID="Validator_Name" 
                    CssClass="validator" 
                    runat="server" 
                    ErrorMessage="Name must not contain any blank characters."
                    OnServerValidate="Validator_Name_ServerValidate"
                    ValidationGroup="ValidationGroup_Name">
                </asp:CustomValidator>
                <br />
                <asp:Button 
                    ID="Submit_Name"
                    runat="server" 
                    OnClick="Submit_Name_Click" 
                    Text="Submit"
                    ValidationGroup="ValidationGroup_Name"/>
            </asp:Panel>

            <asp:Panel 
                ID="Panel_MaxGuess" 
                runat="server" 
                style="text-align: center"
                Visible="false">
                Please enter a max guess (1-999):<br />
                <br />
                <asp:TextBox 
                    ID="TextBox2" 
                    runat="server">
                </asp:TextBox>
            </asp:Panel>
            <asp:Panel 
                ID="Panel_Guess" 
                runat="server" 
                style="text-align: center"
                Visible="false">
                Please enter your next guess:<br />
                <br />
                <asp:TextBox 
                    ID="TextBox3" 
                    runat="server">
                </asp:TextBox>
            </asp:Panel>
        </section>
    </main>

</asp:Content>
