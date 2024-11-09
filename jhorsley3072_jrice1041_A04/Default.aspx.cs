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
        HiLoGame game = new HiLoGame(HiLoGame.GameState.Start);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Name_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                game.PlayerName = Input_Name.Text;
                game.State = HiLoGame.GameState.MaxGuess;
                game.UpdatePanelVisibility(Panel_Name, Panel_MaxGuess, Panel_Guess);

            }
        }
        
        protected void Validator_Name_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(Input_Name.Text.Contains(" ")){
                args.IsValid = false;
            }
        }
    }
}