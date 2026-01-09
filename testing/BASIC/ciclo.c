#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "8BP.h"
#include "minibasic.h"


/*******************************************
    MAIN
*******************************************/
int main()
{
  _basic_border(7);
  char cad[] = "has fracasado en tu mision"; // la inicializamos con una frase
  _basic_print(cad);
  return 0;
}
