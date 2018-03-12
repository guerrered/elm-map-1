module State exposing (..)

import Types exposing (..)


init : ( Model, Cmd Msg )
init =
    ( { state = "Alabama"
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        ChangeState newState ->
            ( { model | state = newState }
            , Cmd.none
            )

        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
