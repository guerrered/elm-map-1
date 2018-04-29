module Types exposing (..)


type alias Model =
    { state : String
    , startLoc : String
    , endLoc : String
    }

type Msg
    = NoOp
    | ChangeState String
    | ChangeStart String
    | ChangeEnd   String

