module Main exposing (..)

import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Html
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font
import Task
import Window


type alias Model =
    { device : Device }


type Msg
    = NoOp
    | Resize Window.Size


type MyStyles
    = None
    | Small
    | GrayFill
    | GrayFillDark
    | PinkFill
    | BlueFill
    | GreenFill
    | CoralFillA
    | CoralFillB
    | CoralFillC
    | CoralFillD
    | Title
    | LargeText
    | WhiteP


stylesheet =
    Style.styleSheet
        [ Style.style None
            []
        , Style.style Small
            [ Font.size 14
            , Color.text Color.blue
            , Font.lineHeight 1
            ]
        , Style.style Title
            [ Color.text Color.blue
            , Font.size 30 -- all units given as px
            ]
        , Style.style GrayFill
            [ Color.background Color.lightCharcoal ]
        , Style.style GrayFillDark
            [ Color.background Color.darkCharcoal ]
        , Style.style BlueFill
            [ Color.background Color.blue ]
        , Style.style GreenFill
            [ Color.background (Color.rgba 131 184 110 1) ]
        , Style.style PinkFill
            [ Color.background (Color.rgba 245 80 110 0.7) ]
        , Style.style CoralFillA
            [ Color.background (Color.rgba 251 139 105 0.8) ]
        , Style.style CoralFillB
            [ Color.background (Color.rgba 251 139 105 0.6) ]
        , Style.style CoralFillC
            [ Color.background (Color.rgba 251 139 105 0.4) ]
        , Style.style CoralFillD
            [ Color.background (Color.rgba 251 139 105 0.2) ]
        , Style.style WhiteP
            [ Color.text Color.white ]
        , Style.style LargeText
            [ Font.size 45 ]
        ]


update msg model =
    case msg of
        NoOp ->
            model ! []

        Resize size ->
            { model | device = classifyDevice size } ! []


view model =
    Element.layout stylesheet <|
        let
            fillColor =
                if model.device.phone then
                    BlueFill
                else
                    GreenFill

            maxWidth =
                if model.device.phone then
                    px 500
                else
                    fill

            sizeText =
                if model.device.phone then
                    "Phone"
                else
                    "Desktop"
        in
        column None
            []
            [ el None [ width maxWidth, center ] <|
                column None
                    [ padding 20 ]
                    [ viewHeader sizeText
                    , row None
                        [ padding 30, spacing 30 ]
                        [ el fillColor [ width fill, height (px 30) ] empty ]
                    ]
            ]


viewHeader varText =
    el Title [] (text ("Sandbox 10 - Window Sizing: " ++ varText))


subscriptions model =
    Window.resizes (\size -> Resize size)


initDevice =
    Device 0 0 False False False False False


init =
    Model initDevice ! []


main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
