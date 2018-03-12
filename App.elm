-- http://blog.jenkster.com/2016/04/how-i-structure-elm-apps.html
-- https://github.com/krisajenkins?utf8=%E2%9C%93&tab=repositories&q=&type=&language=elm
-- https://github.com/krisajenkins/elm-hack-night/tree/master/spotify/src

module App exposing (main)

import Html
import State
import Types exposing (..)
import View

main : Program Never Model Msg
main =
    Html.program
        {   init = State.init
        ,   update = State.update
        ,   subscriptions = State.subscriptions
        ,   view = View.root
        }