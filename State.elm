module State exposing (..)

import Types exposing (..)


init : ( Model, Cmd Msg )
init =
    ( { state = "Alabama"
      ,  startLoc = ""
      ,  endLoc = ""
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        ChangeState newState-> 
        ( { model 
        | state = newState
        , startLoc = ""
        , endLoc = "" }
        , Cmd.none
        )
             
        ChangeStart newState -> 
        ( {model | startLoc = newState
            }
        , Cmd.none
        )

        ChangeEnd newState -> 
        ( {model | endLoc = newState
            }
        , Cmd.none
        )

        NoOp ->
        (model, Cmd.none)
    {-}
        ChangeEnd newEnd ->
        ( {model | endLoc = newEnd}
        , Cmd.none
        )
        _ ->
         ( model, Cmd.none)
  -}      
        
{-}
updateStart : Msg ->  Start -> ( Start, Cmd Msg )
updateStart action model = 
    case action of
        ChangeStart newStart ->
        ( {model | startLoc = newStart}
        , Cmd.none
        )
        _ ->
         ( model, Cmd.none)

updateEnd : Msg -> End -> ( End, Cmd Msg )
updateEnd action model = 
    case action of
        ChangeEnd newEnd ->
        ( {model | endLoc = newEnd}
        , Cmd.none
        )
        _ -> 
            ( model, Cmd.none)
-}

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
