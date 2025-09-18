package nl.han.APP.Challenge;

public class Challenge {

    public String simpleCompressNonFunctionally(String input) {
        StringBuilder output = new StringBuilder();
        char prevChar = input.charAt(0);
        int count = 1;

        for (int i = 0; i < input.length(); i++) {

            if (i == input.length() - 1) {
                prevChar = input.charAt(i);
                String t = prevChar + String.valueOf(count);
                output.append(t);
            } else if (input.charAt(i) == prevChar) {
                count++;
            } else if (input.charAt(i) != prevChar) {
                String t = prevChar + String.valueOf(count);
                output.append(t);
                count = 1;
                prevChar = input.charAt(i);
            }

        }

        return output.toString();
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

