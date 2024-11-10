/*
FILE : HiLoGame.cs
PROJECT : A04 - Hi-Lo ASP.NET
PROGRAMMER : Josh Horsley, Josh Rice
FIRST VERSION : 2024-11-04
DESCRIPTION :

    Game object.

    Has properties to store all needed variables.

    Function to set panel show/hide based on GameState enum.

    Function to generate random number when game begins.

*/


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jhorsley3072_jrice1041_A04
{
    public class HiLoGame
    {
        internal enum GameState {
            Start,
            MaxGuess,
            GuessLoop,
            Won
        };

        //Readonly, just allows us to avoid hardcoding "1" every time
        internal const int minGuess = 1;

        internal GameState State { get; set; }
        internal string PlayerName { get; set; }
        internal int MinGuess { get { return minGuess; } }//READONLY

        internal int TargetNumber { get; set; } //Random number they're trying to guess

        //BOUNDARIES UPDATED DURING GUESS LOOP
        internal int LowBoundary { get; set; }
        internal int HighBoundary { get; set; }

        internal HiLoGame(GameState startingState)
        {
            this.State = startingState;
            this.LowBoundary = 1;
            this.HighBoundary = 999;
        }

        internal void GenerateTargetNumber()
        {
            Random rand = new Random(DateTime.Now.Second);
            TargetNumber = rand.Next(HighBoundary) + 1;
        }

        internal void UpdatePanelVisibility(Panel displayName, Panel name, Panel maxGuess, Panel guess, Panel win)
        {
            switch (State)
            {
                case GameState.Start:
                    displayName.Visible = false;
                    name.Visible = true;
                    maxGuess.Visible = false;
                    guess.Visible = false;
                    win.Visible = false;
                    break;
                case GameState.MaxGuess:
                    displayName.Visible = true;
                    name.Visible = false;
                    maxGuess.Visible = true;
                    guess.Visible = false;
                    win.Visible = false;
                    break;
                case GameState.GuessLoop:
                    displayName.Visible = true;
                    name.Visible = false;
                    maxGuess.Visible = false;
                    guess.Visible = true;
                    win.Visible = false;
                    break;
                case GameState.Won:
                    displayName.Visible = false;
                    name.Visible = false;
                    maxGuess.Visible = false;
                    guess.Visible = false;
                    win.Visible = true;
                    break;
            }
        }
    }
}