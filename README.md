# elm-json-field-value

This package is intended to make it easier to work with complicated JSON decoders suitable for parsing ASTs from JSON in Elm.


## Install

```

elm-package install --yes eeue56/elm-json-field-value

```

## Usage


```elm

import Json.Decode
import Json.Decode.FieldValue exposing (fieldValue)

type Animal = Dog | Cat

decodeAnimal : Json.Decode.Decoder Animal
decodeAnimal = 
    Json.Decode.oneOf
        [ decodeDog
        , decodeCat
        ]

decodeDog : Json.Decode.Decoder Animal
decodeDog =
    Json.Decode.map (\_ -> Dog)
        (Json.Decode.field "type" <| fieldValue "dog")

decodeCat : Json.Decode.Decoder Animal
decodeCat =
    Json.Decode.map (\_ -> Cat)
        (Json.Decode.field "type" <| fieldValue "cat")

```