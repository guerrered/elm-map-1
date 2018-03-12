module Types exposing (..)


type alias Model =
    { state : String
    }


type Msg
    = NoOp
    | ChangeState String
