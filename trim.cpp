/*----------------------------------------------------------
 *				HTBLA-Leonding / Klasse: <your class>
 * ---------------------------------------------------------
 * Exercise Number: 0
 * Title:			trim.cpp
 * Author:			David Kraus
 * Due Date:		Dec 17, 2018
 * ----------------------------------------------------------
 * Description:
 * Test functions for trim.h
 * ----------------------------------------------------------
 */
#include "trim.h"
#include "string.h"
#include <stdbool.h>

//Function prototypes
//
void copy_substring(const char* source, char* dest, int start, int stop);

/*
 * Diese Funktion ist über den Header frei
 * zugänglich - Dies ist für die Unit-Tests
 * wichtig, da diese darauf zugreifen.
 */
void trim(const char* source, char* trimmed_string)
{
    //Copy contents
    *trimmed_string = *source;

    if (strlen(source) > 0)
    {
        //Find start-position
        int startIndex = 0;
        bool isBlank = true;
        for (int i = 0; isBlank && i < strlen(source); i++)
        {
            if (!(isBlank && source[i] == ' '))
            {
                isBlank = false;
                startIndex = i;
            }
        }

        //Find end-position
        int endIndex = strlen(source);
        isBlank = true;
        for (int i = strlen(source) - 1; isBlank && i > startIndex; i--) {
            if (!(isBlank && source[i] == ' '))
            {
                isBlank = false;
                endIndex = i + 1;
            }
        }

        //Copy from position
        copy_substring(source, trimmed_string, startIndex, endIndex);
    }
}

/*
 * Diese Funktion ist private, da ich verhindern möchte, dass man von
 * außerhalb darauf zugreifen kann. Dies ist möglich, da der
 * Funktionsprototyp nicht im Header definiert ist.
 */
void copy_substring(const char* source, char* dest, int start, int stop)
{
    for (int i = start; i < stop; i++) {
        dest[i - start] = source[i];
    }
}
