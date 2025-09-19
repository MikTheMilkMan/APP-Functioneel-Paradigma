package nl.han.APP.Challenge;

public class Challenge {

    public String simpleCompressNonFunctionally(String input, int index, int count) {
        if (index == input.length() - 1) {
            if (input.charAt(index) != input.charAt(index - 1)) {
                return (String.valueOf(input.charAt(index - 1)) + count + input.charAt(index) + 1);
            } else {
                return String.valueOf(input.charAt(index)) + (count + 1);
            }
        }

        if (input.charAt(index) != input.charAt(index - 1)) {
            return String.valueOf(input.charAt(index - 1)) + count + simpleCompressNonFunctionally(input, index + 1, 1);
        } else {
            return simpleCompressNonFunctionally(input, index + 1, count + 1);
        }


        //iterate through string
        //check current char against previous char
        //if the same, recursion && count++
        //if different, return previous char + count + recursion
    }
}


// String bestaat uit 5x A, 5x B, 3x C, 4x D en 6x E.
// Als deze String door een RLE-compressie-algoritme wordt gehaald, moet het resultaat
// dus "A5B5C3D4E6" zijn

// Wat wil ik bereiken hier?
// RLE-compressie
// Hoe ga ik dat doen?
// 1. Begin met het comprimeren van een String
// 2. Ga daarna aan de slag met het decomprimeren van die String
// 3. Als dat werkt, begin met het uitlezen van de data van een kleine en simpele zwart-wit afbeelding,
// 4. Comprimeer de uitgelezen data en print deze
// Victorie !! Het werkt !!
// 5. Doe dit ook voor een grotere en ingewikkeldere afbeelding.
// 6. Mocht dit binnen de gegeven tijd zijn gelukt, zou je kunnen kijken of de compressie ook werkt voor een gif.
// Victorie^2 !!! Het werkt nog beter !!!

