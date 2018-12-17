#include "trim.h"
#include <stdio.h>

int main(int argc, const char* argv[])
{
    printf("=== Trim ===");
    if (argc > 0)
    {
        char trimmed_string[STRLEN];
        trim(argv[0], &trimmed_string);

        printf("Source string: %s", argv[0]);
        printf("Trimmed string: %s", trimmed_string);
    }
    return 0;
}
