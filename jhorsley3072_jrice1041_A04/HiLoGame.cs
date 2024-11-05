﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
        internal int MaxGuess { get; set; }//MaxGuess set by player, later used in the game


        //BOUNDARIES UPDATED DURING GUESS LOOP
        internal int LowBoundary { get; set; }
        internal int HighBoundary { get; set; }

        internal HiLoGame()
        {
            this.State = GameState.Start;
        }

    }
}