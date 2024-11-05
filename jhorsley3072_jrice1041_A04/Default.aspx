<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="jhorsley3072_jrice1041_A04._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <asp:Panel ID="Panel1" runat="server" style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="Please enter your name:"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" style="text-align: center">
                Please enter a max guess (1-999):<br />
                <br />
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" style="text-align: center">
                Please enter your next guess:<br />
                <br />
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </asp:Panel>
        </section>
    </main>

</asp:Content>
