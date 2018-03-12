module View exposing (root)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import View.Materialize exposing (..)


root : Model -> Html Msg
root model =
    div [ style [ ( "height", "100%" ) ], class "blue-grey darken-4 blue-grey-text text-lighten-5" ]
        [ materialize
        , navbar
        , materializeJS
        , container
            [ h4 [ class "center-align" ] [ text "Pick a state to see it in the map!" ]
            , stateDropdown
            , stateMap model.state
            ]
        ]


navbar : Html Msg
navbar =
    nav [ class "blue darken-4 blue-grey-text text-lighten-5" ]
        [ div [ class "nav-wrapper" ]
            [ a [ href "#", class "brand-logo" ] [ text " Elmy Maps" ]
            ]
        ]


stateDropdown : Html Msg
stateDropdown =
    div [ class "row" ]
        [ div [ class "col s4 offset-s4" ]
            [ select [ style [ ( "display", "block" ) ], Html.Events.onInput ChangeState ]
                [ option [ value "Alabama" ] [ text "Alabama" ]
                , option [ value "Alaska" ] [ text "Alaska" ]
                , option [ value "Arizona" ] [ text "Arizona" ]
                , option [ value "Arkansas" ] [ text "Arkansas" ]
                , option [ value "California" ] [ text "California" ]
                , option [ value "Colorado" ] [ text "Colorado" ]
                , option [ value "Connecticut" ] [ text "Connecticut" ]
                , option [ value "Delaware" ] [ text "Delaware" ]
                , option [ value "Florida" ] [ text "Florida" ]
                , option [ value "Georgia" ] [ text "Georgia" ]
                , option [ value "Hawaii" ] [ text "Hawaii" ]
                , option [ value "Idaho" ] [ text "Idaho" ]
                , option [ value "Illinois" ] [ text "Illinois" ]
                , option [ value "Indiana" ] [ text "Indiana" ]
                , option [ value "Iowa" ] [ text "Iowa" ]
                , option [ value "Kansas" ] [ text "Kansas" ]
                , option [ value "Kentucky" ] [ text "Kentucky" ]
                , option [ value "Louisiana" ] [ text "Louisiana" ]
                , option [ value "Maine" ] [ text "Maine" ]
                , option [ value "Maryland" ] [ text "Maryland" ]
                , option [ value "Massachusetts" ] [ text "Massachusetts" ]
                , option [ value "Michigan" ] [ text "Michigan" ]
                , option [ value "Minnesota" ] [ text "Minnesota" ]
                , option [ value "Mississippi" ] [ text "Mississippi" ]
                , option [ value "Missouri" ] [ text "Missouri" ]
                , option [ value "Montana" ] [ text "Montana" ]
                , option [ value "Nebraska" ] [ text "Nebraska" ]
                , option [ value "Nevada" ] [ text "Nevada" ]
                , option [ value "New Hampshire" ] [ text "New Hampshire" ]
                , option [ value "New Jersey" ] [ text "New Jersey" ]
                , option [ value "New Mexico" ] [ text "New Mexico" ]
                , option [ value "New York" ] [ text "New York" ]
                , option [ value "North Carolina" ] [ text "North Carolina" ]
                , option [ value "North Dakota" ] [ text "North Dakota" ]
                , option [ value "Ohio" ] [ text "Ohio" ]
                , option [ value "Oklahoma" ] [ text "Oklahoma" ]
                , option [ value "Oregon" ] [ text "Oregon" ]
                , option [ value "Pennsylvania" ] [ text "Pennsylvania" ]
                , option [ value "Rhode Island" ] [ text "Rhode Island" ]
                , option [ value "South Carolina" ] [ text "South Carolina" ]
                , option [ value "South Dakota" ] [ text "South Dakota" ]
                , option [ value "Tennessee" ] [ text "Tennessee" ]
                , option [ value "Texas" ] [ text "Texas" ]
                , option [ value "Utah" ] [ text "Utah" ]
                , option [ value "Vermont" ] [ text "Vermont" ]
                , option [ value "Virginia" ] [ text "Virginia" ]
                , option [ value "Washington" ] [ text "Washington" ]
                , option [ value "West Virginia" ] [ text "West Virginia" ]
                , option [ value "Wisconsin" ] [ text "Wisconsin" ]
                , option [ value "Wyoming" ] [ text "Wyoming" ]
                ]
            , label [] [ text "State Selector" ]
            ]
        ]


stateMap : String -> Html Msg
stateMap state =
    iframe
        [ src ("https://www.google.com/maps/embed/v1/place?q=" ++ state ++ "&key=AIzaSyCxw5Ao25vChvrxHrKzW8BH7CjVOYL4G1E")
        , style [ ( "border", "0" ), ( "width", "100%" ), ( "height", "700px" ) ]
        ]
        []
