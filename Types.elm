module Types exposing (..)


type alias Model =
    { state : String,
      capitals : Bool
    , startLoc : String
    , endLoc : String
    }

type Msg
    = NoOp
    | ChangeState String
    | ToggleCapitals
    | ChangeStart String
    | ChangeEnd   String

