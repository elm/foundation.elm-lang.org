module Main exposing (main)


import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Skeleton



-- MAIN


main =
  Browser.document
    { init = \() -> ( (), Cmd.none )
    , view = view
    , update = \_ _ -> ( (), Cmd.none )
    , subscriptions = \_ -> Sub.none
    }



-- VIEW


view : () -> Browser.Document msg
view _ =
  Skeleton.viewBody "Elm Software Foundation" Skeleton.Other
    [ section []
        [ h2 [] [ text "Mission Statement" ]
        , p []
            [ text "The mission of the Elm Software Foundation is to promote, protect, and advance the Elm programming language, and to support and facilitate the growth of a diverse and international community of Elm programmers."
            ]
        ]
    , section []
        [ h2 [] [ text "Elm Overview" ]
        , p []
            [ text "Elm sits at the intersection of web development and academic research on functional programming languages. It has a strong focus on bridging this divide by sharing experience and knowledge between these two very different communities. "
            , strong [] [ text "This communication is hugely valuable to the overall programming community!" ]
            ]
        ]
    , section []
        [ h2 [] [ text "Elm Software Foundation" ]
        , ul []
            [ li [] [ text "501(c)(3) nonprofit organization, established 29 January 2016" ]
            , li [] [ text "funded by individual and corporate sponsors" ]
            , li [] [ text "operated by volunteers serving as directors and officers" ]
            , li [] [ a [ href "http://elm-lang.org/blog/new-adventures-for-elm" ] [ text "Announcement" ] ]
            ]
        ]
    , section []
        [ h2 [] [ text "Directors and Officers" ]
        , ul []
            [ li [] [ a [ href "https://twitter.com/czaplic"    ] [ text "Evan Czaplicki"   ], text ", President" ]
            , li [] [ a [ href "https://twitter.com/avh4"       ] [ text "Aaron VonderHaar" ], text ", Treasurer" ]
            , li [] [ a [ href "https://twitter.com/ravi_chugh" ] [ text "Ravi Chugh"       ], text ", Secretary" ]
            ]
        ]
    , section []
        [ h2 [] [ text "Public Records" ]
        , ul []
            [ li [] [ a [ href "records/articles-of-incorporation.pdf" ] [ text "Articles of Incorporation" ] ]
            , li [] [ a [ href "records/exemption-application.pdf" ] [ text "Application for 501(c)(3) Exemption" ] ]
            , li [] [ a [ href "records/determination-letter.pdf" ] [ text "501(c)(3) Determination Letter" ] ]
            , li [] [ a [ href "records/entity-status-letter.pdf" ] [ text "Entity Status Letter" ] ]
            ]
        ]
    , section []
        [ h2 [] [ text "Donations" ]
        , ul []
            [ li [] [ text "Since ESF is recognized by the IRS as a 501(c)(3) organization, US taxpayers’ donations to ESF are tax deductible. For donors outside the US, please consult your tax advisor for rules as they apply to your situation." ]
            , li [] [ text "Elm Software Foundation would like to thank Prezi, our founding donor, for their generous support." ]
            ]
        ]
    ]
