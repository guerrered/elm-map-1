module View exposing (root)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import View.Materialize exposing (..)


root : Model -> Html Msg
root model =
    div [ style [ ( "display", "block"), ( "overflow", "auto")], class "blue-grey darken-4 blue-grey-text text-lighten-5" ]
        [ materialize
        , navbar
        , materializeJS
        , container
            [ h4 [ class "center-align" ] [ text (if model.capitals then "Select a state capital to see it on the map" else "Select a state to see it on the map") ]
            , dropdownArea model
            , stateMap model.state
            ]
        , pageFooter
        ]


navbar : Html Msg
navbar =
    nav [ class "blue darken-4 blue-grey-text text-lighten-5" ]
        [ div [ style [ ("padding-left", "25px") ], class "nav-wrapper" ]
            [ a [ href "#", class "brand-logo" ] [ text "ELMap" ]
            ]
        ]

capitalToggle : Model -> Html Msg
capitalToggle model =
    p [] 
        [ label []
            [ input [ type_ "checkbox", Html.Events.onClick ToggleCapitals ] []
            , span [] [ text "Use State Capitals" ]
            ]
        ]

stateList : List (String, String)
stateList = [("Alabama", "Montgomery, AL"),
             ("Alaska", "Juneau, AK"),
             ("Arizona", "Phoenix, AZ"),
             ("Arkansas", "Little Rock, AR"),
             ("California", "Sacramento, CA"),
             ("Colorado", "Denver, CO"),
             ("Connecticut", "Hartford, CT"),
             ("Delaware", "Dover, DE"),
             ("Florida", "Tallahassee, FL"),
             ("Georgia", "Atlanta, GA"),
             ("Hawaii", "Honolulu, HI"),
             ("Idaho", "Boise, ID"),
             ("Illinois", "Springfield, IL"),
             ("Indiana", "Indianapolis, IN"),
             ("Iowa", "Des Moines, IA"),
             ("Kansas", "Topeka, KS"),
             ("Kentucky", "Frankfort, KY"),
             ("Louisiana", "Baton Rouge, LA"),
             ("Maine", "Augusta, ME"),
             ("Maryland", "Annapolis, MD"),
             ("Massachusetts", "Boston, MA"),
             ("Michigan", "Lansing, MI"),
             ("Minnesota", "St Paul, MN"),
             ("Mississippi", "Jackson, MS"),
             ("Missouri", "Jefferson City, MO"),
             ("Montana", "Helena, MT"),
             ("Nebraska", "Lincoln, NE"),
             ("Nevada", "Carson City, NV"),
             ("New Hampshire", "Concord, NH"),
             ("New Jersey", "Trenton, NJ"),
             ("New Mexico", "Santa Fe, NM"),
             ("New York", "Albany, NY"),
             ("North Carolina", "Raleigh, NC"),
             ("North Dakota", "Bismark, ND"),
             ("Ohio", "Columbus, OH"),
             ("Oklahoma", "Oklahoma City, OK"),
             ("Oregon", "Salem, OR"),
             ("Pennsylvania", "Harrisburg, PA"),
             ("Rhode Island", "Providence, RI"),
             ("South Carolina", "Columbia, SC"),
             ("South Dakota", "Pierre, SD"),
             ("Tennessee", "Nashville, TN"),
             ("Texas", "Austin, TX"),
             ("Utah", "Salt Lake City, UT"),
             ("Vermont", "Montpelier, VT"),
             ("Virginia", "Richmond, VA"),
             ("Washington", "Olympia, WA"),
             ("West Virginia", "Charleston, WV"),
             ("Wisconsin", "Madison, WI"),
             ("Wyoming", "Cheyenne, WY")
            ]

makeStateOption : Bool -> (String, String) -> Html Msg
makeStateOption useCapitals stateTuple =
    let
        (stateName, stateCapital) = stateTuple
    in
        option [ value (if useCapitals then stateCapital else stateName) ] [ text (if useCapitals then stateCapital else stateName) ]

dropdownArea : Model -> Html Msg
dropdownArea model =
    div [ class "row" ]
        [ div [ class "col s4 offset-s4" ]
            [ select [ style [ ( "display", "block" ) ], Html.Events.onInput ChangeState ]
                (List.map (\x -> (makeStateOption model.capitals x)) stateList)
            ],
            capitalToggle model
        ]


stateMap : String -> Html Msg
stateMap state =
    iframe
        [ src ("https://www.google.com/maps/embed/v1/place?q=" ++ state ++ "&key=AIzaSyCxw5Ao25vChvrxHrKzW8BH7CjVOYL4G1E")
        , style [ ( "border", "0" ), ( "width", "100%" ), ( "height", "700px" ), ("padding-bottom", "20px") ]
        ]
        []

pageFooter : Html Msg
pageFooter =
    footer [ class "blue darken-4 page-footer" ] [
        container [
            row [
                div [ ] [
                    h5 [ class "blue-grey-text text-lighten-5" ] [
                        text "Links for CPD"
                    ],
                    ul [] [
                        li [] [
                            a [ class "blue-grey-text text-lighten-5", href "https://guide.elm-lang.org/install.html"] [ text "Elm's Offical Getting Started guide"]
                        ],
                        li [] [
                            a [ class "blue-grey-text text-lighten-5", href "http://elmprogramming.com/"] [ text "Beginning Elm - 'A gentle introduction to the Elm Programming Language'"]
                        ], --https://www.elm-tutorial.org/en/
                         li [] [
                            a [ class "blue-grey-text text-lighten-5", href "https://www.elm-tutorial.org/en/"] [ text "Elm Tutorial - A tutorial on developing SPAs with Elm."]
                        ]
                    ]
                ]
            ]
        ]
    ]