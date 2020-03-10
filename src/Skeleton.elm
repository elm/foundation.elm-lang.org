module Skeleton exposing
  ( Tab(..)
  , viewBody
  )


import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Lazy exposing (..)
import Svg exposing (Svg, polygon, svg)
import Svg.Attributes as A



-- SKELETON


viewBody : String -> Tab -> List (Html msg) -> Browser.Document msg
viewBody title tab content =
  { title = title
  , body =
      [ lazy viewHeader tab
      , div [ class "site-content" ] content
      , viewFooter
      ]
  }



-- HEADER


type Tab
  = About
  | Donate
  | Other



-- VIEW HEADER


viewHeader : Tab -> Html msg
viewHeader tab =
  header
    [ style "display" "flex"
    , style "flex-direction" "row"
    , style "justify-content" "center"
    ]
    [ div
        [ class "site-header"
        ]
        [ viewLogo
        , div [ class "site-header-tabs" ]
            [ viewTab tab About "about" "/about"
            , viewTab tab Donate "donate" "/donate"
            ]
        ]
    ]


viewTab : Tab -> Tab -> String -> String -> Html msg
viewTab currentTab targetTab name link =
  let
    attrs =
      if currentTab == targetTab then
        [ style "font-weight" "bold" ]
      else
        []
  in
  a (href link :: attrs) [ text name ]



-- LOGO


viewLogo : Html msg
viewLogo =
  a
    [ class "site-header-logo"
    , href "/"
    ]
    [ viewHeart 60
    , span
        [ style "font-size" "36px"
        , style "padding-right" "12px"
        ]
        [ text "elm"
        ]
    ]


viewHeart : Int -> Html msg
viewHeart n =
  svg
    [ A.viewBox "-600 -560 1200 1200"
    , A.width (String.fromInt n)
    , A.height (String.fromInt n)
    ]
    [ polygon [ A.fill "#ed0878", A.points "-440,-30 -160,-310 120,-30" ] []
    , polygon [ A.fill "#ed0878", A.points "430,0 150,280 -130,0" ] []
    , polygon [ A.fill "#ed0878", A.points "-457,0 -177,0 -177,280" ] []
    , polygon [ A.fill "#ed0878", A.points "-130,300 0,430 130,300 0,170" ] []
    , polygon [ A.fill "#ed0878", A.points "40,-152 300,-152 422,-30 162,-30" ] []
    , polygon [ A.fill "#ed0878", A.points "20,-180 150,-310 280,-180" ] []
    , polygon [ A.fill "#ed0878", A.points "-150,20 -20,150 -150,280" ] []
    ]



-- FOOTER


viewFooter : Html msg
viewFooter =
  footer
    [ class "site-footer"
    ]
    [ viewFooterLink "Home Page"   "https://elm-lang.org"
    , text " — "
    , viewFooterLink "Site Source" "https://github.com/elm/foundation.elm-lang.org/"
    , text " — © 2020 Evan Czaplicki"
    ]


viewFooterLink : String -> String -> Html msg
viewFooterLink name url =
  a [ class "site-footer-link", href url ] [ text name ]
