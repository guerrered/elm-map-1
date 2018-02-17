-- Each file seems to correspond to a module. Modules must be declared from the start. 
module App exposing(..)

-- Modules must be imported explicitly; specific functions (like .text) can be imported atomically.
-- Html is a module, but also a type. That's exciting? 
import Html exposing(..)
import Html.Attributes exposing (..)

-- Module : all components are composed into a single state tree. 

type alias Model = String

init : ( Model, Cmd Msg)
init = ( "Currently under construction...", Cmd.none )


-- Messages : events that the component can respond to (e.g., an Expand message might be used to collapse a component).

type Msg = NoOp


bootstrap =
   let
      tag = "link"
      attrs =
         [ attribute "rel"       "stylesheet"
         , attribute "property"  "stylesheet"
         , attribute "href"      "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
         ]
      children = []
   in
      node tag attrs children

-- View : the View function renders an HTML element using the application model. The output is an HTML element
--        that is tagged with Msg. This is helpful for making the page interactive. 
--        26 is the signature; 27+ is the implementation. 
--        div is a function(?); the first thing is the property array; the second is the contents. 

view : Model -> Html Msg 
view model =
   div [] 
      [ bootstrap
      , div [class "container"]
         [ h1 [class "text-center"] [text "Elm Map App"]
         , h4 [class "text-center"] [text model]
         ]
      , iframe
         [ src "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2894845.151280407!2d-91.81269158456534!3d44.882705568577954!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x52a8f40f9384e3af%3A0xf2d5d5b8f88649d6!2sWisconsin!5e0!3m2!1sen!2sus!4v1518911214871"
         , width 800
         , height 600
         , style [("border", "0")]
         ] []
      ]

-- Update : a function called by Html.program when a message is received. The Update function responds to messages 
--          updating the model as needed. In this example, NoOp is the only message, and the model is returned unchanged.
--          Also, Cmd.none means that no command is performed.

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
   case msg of
      NoOp ->
         ( model, Cmd.none )



-- Subscriptions : have something to do with listening to external input. 

subscriptions : Model -> Sub Msg
subscriptions model =
   Sub.none


-- Main

-- main is the function that returns an element to draw on the page.  
main : Program Never Model Msg
main = program
   { init = init
   , view = view
   , update = update
   , subscriptions = subscriptions
   }