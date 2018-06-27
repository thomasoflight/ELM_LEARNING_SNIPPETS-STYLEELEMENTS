module Main exposing (..)

import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Html
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font


type MyStyles
    = None
    | Small
    | GrayFill
    | PinkFill
    | CoralFillA
    | CoralFillB
    | CoralFillC
    | CoralFillD
    | Title


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
        ]



-- Element.layout renders the elements as html
-- Every layout requires a stylesheet.


view =
    Element.layout stylesheet <|
        -- An el is the most basic element, like a <div>
        --el Title [ center, width (px 600) ] (text "hello!")
        column None
            [ spacing 30, padding 20 ]
            [ el Title [] (text "Sandbox 05 - Spacing + Padding")
            , el Small [] (text "spacing, pixels")
            , row None
                [ spacing 15 ]
                [ el CoralFillA [ height (px 200), width (px 200) ] (text "box")
                , el CoralFillB [ height (px 200), width (px 200), padding 20 ] (text "box with 20px padding")
                , el CoralFillC [ height (px 200), width (px 200), padding 40 ] (text "box with 40px padding")
                , el CoralFillD [ height (px 200), width (px 200), padding 60 ] (text "box with 60px padding")
                ]
            , el Small [] (text "spacing and padding, pixels")
            , row GrayFill
                [ spacing 15, padding 15, width (px 875) ]
                [ el CoralFillA [ height (px 200), width (px 200) ] (text "box")
                , el CoralFillB [ height (px 200), width (px 200), padding 20 ] (text "box with 20px padding")
                , el CoralFillC [ height (px 200), width (px 200), padding 40 ] (text "box with 40px padding")
                , el CoralFillD [ height (px 200), width (px 200), padding 60 ] (text "box with 60px padding")
                ]
            , el Small [] (text "spacing and padding, paddingXY")
            , row GrayFill
                [ paddingXY 25 20 ]
                [ el CoralFillA [ height (px 120), width (px 120) ] (text "box")
                , el CoralFillB [ height (px 120), width (px 120), paddingXY 30 5 ] (text "box with paddingXY 20 5")
                , el CoralFillC [ height (px 120), width (px 120), paddingXY 20 10 ] (text "box with paddingXY 20 10")
                , el CoralFillD [ height (px 120), width (px 120), paddingXY 10 15 ] (text "box with paddingXY 20 15")
                ]
            ]


main =
    view
