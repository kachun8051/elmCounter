module Counter exposing (main)
import Html exposing (..)
import Html.Events exposing(..)
import Browser

-- model is int
type alias Model = Int
myModel: Model
myModel = 0

-- message type
type Msg = IncrementMsg | DecrementMsg

myView: Model -> Html Msg
myView model =
    div [][ 
        button [onClick DecrementMsg] [text "-" ]
       ,text (String.fromInt model)
       ,button [onClick IncrementMsg] [text "+"]
    ]

-- input which message & old data -> new data
myUpdate: Msg -> Model -> Model
myUpdate msg model = 
   case msg of
       IncrementMsg -> model + 1
       DecrementMsg -> if model > 0 then model - 1 else model

main: Program() Model Msg
main = 
    Browser.sandbox
        {
            init = myModel
            ,view = myView
            ,update = myUpdate
        }
