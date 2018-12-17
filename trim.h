/*----------------------------------------------------------
 *				HTBLA-Leonding / Klasse: <your class>
 * ---------------------------------------------------------
 * Exercise Number: 0
 * Title:			trim.h
 * Author:			David Kraus
 * Due Date:		Dec. 17, 2018
 * ----------------------------------------------------------
 * Description:
 * Interface for trim
 * ----------------------------------------------------------
 */
 #ifndef __TRIM_H
 #define __TRIM_H

//Würde der Wert zu klein sein, wird der sich dahinter befindende einfach
//überschrieben
#define STRLEN 16

void trim(const char* source, char* trimmed_string);

#endif
