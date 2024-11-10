using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jhorsley3072_jrice1041_A04
{
    public partial class _Default : Page
    {
        internal HiLoGame game;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["game"] == null)
            {
                Session["game"] = new HiLoGame(HiLoGame.GameState.Start);
            }
        }

        protected void Submit_Name_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var game = (HiLoGame)Session["game"];
                game.PlayerName = Input_Name.Text;
                game.State = HiLoGame.GameState.MaxGuess;
                game.UpdatePanelVisibility(Panel_Name, Panel_MaxGuess, Panel_Guess, Panel_Win);
                Session["game"] = game;
            }
            

        }
        protected void Submit_MaxGuess_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Set high boundary to MaxGuess, generate random target number
                game.HighBoundary = int.Parse(Input_MaxGuess.Text);
                game.GenerateTargetNumber();

                //Update show/hide panels
                game.State = HiLoGame.GameState.GuessLoop;
                game.UpdatePanelVisibility(Panel_Name, Panel_MaxGuess, Panel_Guess, Panel_Win);
                Label_Guess.Text = $"Please enter a guess between {game.LowBoundary} - {game.HighBoundary}";
            }
        }
        protected void Submit_Guess_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int guess = int.Parse(Input_Guess.Text);
                Input_Guess.Text = "";
                if(guess > game.TargetNumber)
                {
                    game.HighBoundary = guess - 1; 
                }
                if (guess < game.TargetNumber)
                {
                    game.LowBoundary = guess + 1;
                }
                else
                {
                game.State = HiLoGame.GameState.Won;
                game.UpdatePanelVisibility(Panel_Name, Panel_MaxGuess, Panel_Guess, Panel_Win);
                }
                Label_Guess.Text = $"Please enter a guess between {game.LowBoundary} - {game.HighBoundary}";
            }
        }

        protected void PlayAgain_Click(object sender, EventArgs e)
        {
            game.LowBoundary = 1;
            game.HighBoundary = 999;
            game.TargetNumber = -1;

            game.State = HiLoGame.GameState.MaxGuess;
            game.UpdatePanelVisibility(Panel_Name, Panel_MaxGuess, Panel_Guess, Panel_Win);
        }

        protected void Validator_Name_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Input_Name.Text.Contains(" "))
            {
                args.IsValid = false;
                Validator_Name.ErrorMessage = "Name cannot contain any blank characters.";
            }
            else if (Input_Name.Text.IsNullOrWhiteSpace())
            {
                args.IsValid = false;
                Validator_Name.ErrorMessage = "Name cannot be left blank.";
            }
        }
        protected void Validator_MaxGuess_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int maxGuess;
            bool successfulParse = int.TryParse(Input_MaxGuess.Text, out maxGuess);
            
            if (Input_MaxGuess.Text.IsNullOrWhiteSpace())
            {
                args.IsValid = false;
                Validator_MaxGuess.ErrorMessage = "Max guess cannot be left blank.";
            }
            else if (!successfulParse)
            {
                args.IsValid = false;
                Validator_MaxGuess.ErrorMessage = "Thats.. not an int? It's not blank, but it still failed to parse.";
            }
            else if (maxGuess < 1 || maxGuess > 999)
            {
                args.IsValid = false;
                Validator_MaxGuess.ErrorMessage = "Number not in range (1-999)";
            }
        }
        


        protected void Validator_Guess_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int guess;
            bool successfulParse = int.TryParse(Input_Guess.Text, out guess);

            if (Input_Guess.Text.IsNullOrWhiteSpace())
            {
                args.IsValid = false;
                Validator_Guess.ErrorMessage = "Guess cannot be left blank.";
            }
            else if (!successfulParse)
            {
                args.IsValid = false;
                Validator_Guess.ErrorMessage = "That's.. not an int? It's not blank, but it still failed to parse.";
            }
            else if(guess < game.LowBoundary || guess > game.HighBoundary)
            {
                args.IsValid = false;
                Validator_Guess.ErrorMessage = $"Your guess is out of range ({game.LowBoundary} - {game.HighBoundary})";
            }
        }
    }
}