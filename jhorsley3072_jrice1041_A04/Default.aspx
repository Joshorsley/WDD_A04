<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="jhorsley3072_jrice1041_A04._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<!--
FILE : Default.aspx
PROJECT : A04 - Hi-Lo ASP.NET
PROGRAMMER : Josh Horsley, Josh Rice
FIRST VERSION : 2024-11-04
DESCRIPTION :

    Only this page for the whole game.

    Each "screen" is a panel with input, validator, and submit button.

    Default.aspx.cs handles Show/Hide logic on top of validation, etc.

-->
    <main>
        <section class="row" aria-labelledby="aspnetTitle">


            
                <div class="border1">
                    <div class="border2">
                        <div class="border3">
                            <div class="content">
                                <div class="gameContainer">

                                    <asp:Panel
                                        ID="Panel_DisplayName"
                                        runat="server"
                                        Visible="false"
                                        Style="text-align: center">
                                        <asp:Label
                                            ID="PlayerName"
                                            runat="server"
                                            Visible="false">
                                        </asp:Label>
                                    </asp:Panel>
                                    

                                    <!-- Name Panel -->
                                    <asp:Panel
                                        ID="Panel_Name"
                                        runat="server"
                                        Style="text-align: center"
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
                                            ValidationGroup="ValidationGroup_Name" />
                                    </asp:Panel>

                                    <!-- Max Guess Panel -->
                                    <asp:Panel
                                        ID="Panel_MaxGuess"
                                        runat="server"
                                        Style="text-align: center"
                                        Visible="false">
                                        Enter a maximum guess for the game <br /> (1-999)
                                        <br />
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
                                            ValidationGroup="ValidationGroup_MaxGuess" />
                                    </asp:Panel>

                                    <!-- Guess Panel -->
                                    <asp:Panel
                                        ID="Panel_Guess"
                                        runat="server"
                                        Style="text-align: center"
                                        Visible="false">
                                        <asp:Label
                                            ID="Label_Guess"
                                            runat="server"
                                            Text="Enter your guess:">
                                        </asp:Label>
                                        <br />
                                        <br />
                                        <asp:TextBox
                                            ID="Input_Guess"
                                            runat="server"
                                            TextMode="Number">
                                        </asp:TextBox>
                                        <br />
                                        <asp:CustomValidator 
                                            ID="Validator_Guess" 
                                            runat="server"
                                            CssClass="validator"
                                            ErrorMessage="[no error message provided]" 
                                            OnServerValidate="Validator_Guess_ServerValidate"
                                            ValidationGroup="ValidationGroup_Guess"
                                            ></asp:CustomValidator>

                                        <br />
                                        <asp:Button
                                            ID="Submit_Guess"
                                            runat="server"
                                            OnClick="Submit_Guess_Click"
                                            Text="Guess"
                                            ValidationGroup="ValidationGroup_Guess" />
                                    </asp:Panel>

                                    <!-- Win Panel -->
                                    <asp:Panel
                                        ID="Panel_Win"
                                        runat="server"
                                        Style="text-align: center"
                                        Visible="false">
                                        <asp:Label
                                            ID="Label_Win"
                                            runat="server"
                                            Text="You Win!">
                                        </asp:Label>
                                        <br />
                                        <br />
                                        <asp:Button
                                            ID="Button_PlayAgain"
                                            runat="server"
                                            OnClick="PlayAgain_Click"
                                            Text="Play Again" />
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </main>

</asp:Content>
