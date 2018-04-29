module Types exposing (..)


type alias Model =
    { state : String,
      capitals : Bool
    }


type Msg
    = NoOp
    | ChangeState String
    | ToggleCapitals
