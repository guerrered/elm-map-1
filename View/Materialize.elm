module View.Materialize exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


materialize : Html a
materialize =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.4/css/materialize.min.css"
            ]

        children =
            []
    in
        node tag attrs children


materializeJS : Html a
materializeJS =
    let
        tag =
            "script"

        attrs =
            [ attribute "src" "https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.4/js/materialize.min.js" ]

        children =
            []
    in
        node tag attrs children


container : List (Html a) -> Html a
container =
    div [ class "container" ]

row : List (Html a) -> Html a
row =
    div [ class "row" ]