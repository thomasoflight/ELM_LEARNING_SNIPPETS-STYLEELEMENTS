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
        viewAlignedRows


viewAlignedRow boxSize alignment =
    let
        rowHeight =
            boxSize + 20
    in
    row None
        [ height (px rowHeight), spacing 15, alignment ]
        [ el CoralFillA [ height (px boxSize), width (px boxSize) ] (text "")
        , el CoralFillB [ height (px boxSize), width (px boxSize) ] (text "")
        , el CoralFillC [ height (px boxSize), width (px boxSize) ] (text "")
        , el CoralFillD [ height (px boxSize), width (px boxSize) ] (text "")
        ]


viewAlignedRows =
    column None
        [ spacing 30, paddingXY 300 20 ]
        [ el Title [] (text "Sandbox 06 - Alignment")
        , el Small [] (text "Align Left")
        , viewAlignedRow 120 alignLeft
        , el Small [] (text "Align Center")
        , viewAlignedRow 120 center
        , el Small [] (text "Align Right")
        , viewAlignedRow 120 alignRight
        , el Small [] (text "Align Center, El Alignments")
        , row GrayFill
            [ height (px 140), spacing 15, center ]
            [ el CoralFillA [ height (px 50), width (px 100), alignTop ] (text "alignTop")
            , el CoralFillA [ height (px 50), width (px 100), verticalCenter ] (text "verticalCenter")
            , el CoralFillA [ height (px 50), width (px 100), alignBottom ] (text "alignBottom")
            , el CoralFillB [ height (px 50), width (px 50), alignBottom, moveDown 50 ] (text "moveDown")
            ]
        ]


main =
    view
