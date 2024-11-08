﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="jhorsley3072_jrice1041_A04._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">

            <!-- Name Panel -->
            <asp:Panel 
                ID="Panel_Name" 
                runat="server" 
                style="text-align: center" 
                Visible="true">
                <asp:Label 
                    ID="Label_Name" 
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

            <!-- Max Guess Panel -->
        <asp:Panel 
            ID="Panel_MaxGuess" 
            runat="server" 
            style="text-align: center"
            Visible="false">
            Enter a maximum guess to start the game (1-999)<br /><br />
            <asp:TextBox 
                ID="Input_MaxGuess" 
                runat="server"
                TextMode="Number">
            </asp:TextBox>
            <br />
            <asp:CustomValidator 
                ID="Validator_MaxGuess" 
                CssClass="validator" 
                runat="server"
                ErrorMessage="[no error message provided]"
                OnServerValidate="Validator_MaxGuess_ServerValidate"
                ValidationGroup="ValidationGroup_MaxGuess">
            </asp:CustomValidator>
            <br />
            <asp:Button 
                ID="Submit_MaxGuess"
                runat="server" 
                OnClick="Submit_MaxGuess_Click" 
                Text="Submit"
                ValidationGroup="ValidationGroup_MaxGuess"/>
        </asp:Panel>

        <!-- Guess Panel -->
        <asp:Panel 
            ID="Panel_Guess" 
            runat="server" 
            style="text-align: center"
            Visible="false">
            <asp:Label 
                ID="Label_Guess" 
                runat="server" 
                Text="Enter your guess:">
            </asp:Label>
            <br /><br />
            <asp:TextBox 
                ID="Input_Guess" 
                runat="server"
                TextMode="Number">
            </asp:TextBox>
            <br />
            <asp:RangeValidator 
                ID="Validator_Guess" 
                CssClass="validator" 
                runat="server"
                ControlToValidate="Input_Guess"
                MinimumValue="1"
                MaximumValue="1000"
                Type="Integer"
                ErrorMessage="[no error message provided]"
                ValidationGroup="ValidationGroup_Guess">
            </asp:RangeValidator>
            <br />
            <asp:Button 
                ID="Submit_Guess"
                runat="server" 
                OnClick="Submit_Guess_Click" 
                Text="Guess"
                ValidationGroup="ValidationGroup_Guess"/>
        </asp:Panel>

        <!-- Win Panel -->
        <asp:Panel 
            ID="Panel_Win" 
            runat="server" 
            style="text-align: center"
            Visible="false">
            <asp:Label 
                ID="Label_Win" 
                runat="server" 
                Text="You Win!">
            </asp:Label>
            <br /><br />
            <asp:Button 
                ID="Button_PlayAgain"
                runat="server" 
                OnClick="PlayAgain_Click" 
                Text="Play Again"/>
        </asp:Panel>

    </section>
</main>

</asp:Content>
