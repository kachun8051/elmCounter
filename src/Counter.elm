module Counter exposing (main)
import Html exposing (..)
import Html.Events exposing(..)
import Browser

type alias Model = Int
myModel: Model
myModel = 0

type Msg = IncrementMsg | DecrementMsg

myView: Model -> Html Msg
myView model =
    div [][ 
        button [onClick DecrementMsg] [text "-" ]
       ,text (String.fromInt model)
       ,button [onClick IncrementMsg] [text "+"]
    ]

myUpdate: Msg -> Model -> Model
myUpdate msg model = 
   case msg of
       IncrementMsg -> model + 1
       DecrementMsg -> model - 1

main: Program() Model Msg
main = 
    Browser.sandbox
        {
            init = myModel
            ,view = myView
            ,update = myUpdate
        }
