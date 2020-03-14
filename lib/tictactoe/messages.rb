module Tictactoe
    ALL_MESSAGES=[
        #english
        {
          "invalid_input" => "invalid input, symbol be either 'x' or 'o' lowercase",
          "out_of_range" => "position out of range, enter from 1 to 9",
          "position_taken" => "position has been taken, choose another one",
          "welcome" => "Welcome to Tic-Tac-Toe",
          "symbols" => "Use 'x' or 'o'",
          "enter_symbol" => "Enter symbol",
          "enter_position" => "Enter position",
          "double_play" => "You cannot play consecutively",
          "player_wins" => "Player using '%{symbol}' has won!",
          "draw" => " IT'S A DRAW!",
          "play_again"=> "Enter '1' to play again or any other key to quit"
        },
        #french
        {
          "invalid_input" => "entrée non valide, le symbole doit être 'x' ou 'o' en minuscules",
          "out_of_range" => "position hors plage, entrez de 1 à 9",
          "position_taken" => "position a été prise, choisissez-en une autre",
          "welcome" => "Bienvenue chez Tic-Tac-Toe",
          "symbols" => "Utilisez 'x' ou 'o'",
          "enter_symbol" => "Entrez le symbole",
          "enter_position" => "Entrez la position",
          "double_play" => "Vous ne pouvez pas jouer consécutivement",
          "player_wins" => "Le joueur utilisant '%{symbol}' a gagné!",
          "play_again"=> "Entrez '1' pour jouer à nouveau ou toute autre touche pour quitter",
          "draw" => "C'EST UN DESSIN!",
          },
        #mandarin
        {
          "invalid_input" => '输入无效，符号为“ x”或“ o”小写',
          "out_of_range" => "位置超出范围，输入1到9",
          "position_taken" => "位置已定，请选择另一个",
          "welcome" => "欢迎来到井字游戏",
          "symbols" => "使用'x'或'o'",
          "enter_symbol" => "输入符号",
          "enter_position" => "输入位置",
          "double_play" => "您不能连续播放",
          "player_wins" => "使用“％{symbol}”的玩家赢了！",
          "play_again" => "输入 '1' 再次播放或输入其他任意键退出",
          "draw" => " 这是一个平局！",
          },
      ]

  class Messages
    def initialize(messages, index)
      @messages = messages
      @index = index
    end

    def get_message(key,symbol=nil)
        if symbol
            return @messages[@index][key] % {:symbol => symbol}
        end
        return @messages[@index][key]

    end
  end
end
