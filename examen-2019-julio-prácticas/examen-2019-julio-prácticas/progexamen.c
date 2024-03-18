/* Compilar con: gcc -Wall -g -std=c11 -oprogexamen progexamen.c mips-runtime.c keyio.c */

#include <stdbool.h>
#include "mips-runtime.h"

/* Pregunta un entero cuyo valor debe ser mayor o igual que min y
 * menor o igual que max */
int preguntar_entero(char* mensaje, int min, int max) {
  /* POR HACER */
}

/* Compara dos cadenas (s1 y s2) devolviendo true si y solo si son
 * iguales */
bool compara_cadena(char *s1, char *s2) {
  for (int i = 0; s1[i] != '\0' || s2[i] != '\0'; ++i) {
    if (s1[i] != s2[i]) {
      return false;
    }
  }
  return true;
}

typedef struct { // Información sobre un país
  char nombre[64];
  int habitantes;
  int pib_per_capita;
} Pais;

Pais paises[] = { // todas las países de la  base de datos
  { "Liechtenstein", 38547, 166 },
  { "Mónaco", 38897, 165 },
  { "Luxemburgo", 602005, 106 },
  { "Bermudas", 71176, 102 },
  { "Macao", 653100, 81 },
  { "Suiza", 8508898, 80 },
};
int num_paises = sizeof(paises) / sizeof(paises[0]); // es decir: 6

/* Busca en el array paises el país indicado y devuelve el producto de su número de habitantes y su pib_per_capita */
int obtener_pib(char *nombre) {
  for (int p = 0; p < num_paises; ++p) {
    if (compara_cadena(nombre, paises[p].nombre)) {
      return paises[p].habitantes * paises[p].pib_per_capita;
    }
  }
  return -1;
}

/* Elimina de la cadena str todas las apariciones de c */
void cadena_eliminar(char *str, char c) {
  int eliminados = 0;
  int i = 0; 
  while (str[i + eliminados] != '\0') {
    while (str[i + eliminados] == c) {
      ++eliminados;
    }
    str[i] = str[i + eliminados];
    ++i;
  }
  str[i] = '\0';
}

int imprimir_y_contar_paises_mas_poblados(int min_habitantes) {
  /* POR HACER */
}

void invertir_array_int(int *array, int size) {
  /* POR HACER */
}

int main(int argc, char* argv[]) {
  clear_screen();
  print_string("\nExamen de ETC de ensamblador\n");
  while (true) {
    print_string("\n"
                 " 1. Lectura de un entero\n"
                 " 2. Calcular PIB de varios paises\n"
                 " 3. Eliminar un carácter de una cadena\n"
                 " 4. Filtrar paises por población\n"
                 " 5. Invertir array\n"
                 " 0. Salir\n\n"
                 "Elige una opción: ");
    char opc = read_character();
    print_string("\n\n");
    if (opc == '1') {
      int i = preguntar_entero("Introduce un entero entre 20 y 40: ", 20, 40);
      print_string("El entero leído ha sido: ");
      print_integer(i);
      print_string(".\n");
    } else if (opc == '2') {
      struct { char *pais; } tests[] = {
        { "Suiza" },
        { "Mónaco" },
        { "España" },
        { "Liechtenstein" },
      };
      for (int i = 0; i < sizeof(tests) / sizeof(tests[0]); ++i) {
        print_string("El PIB de «");
        print_string(tests[i].pais);
        int pib = obtener_pib(tests[i].pais);
        if (pib < 0) {
          print_string("» no se conoce.\n");
        } else {
          print_string("» es de ");
          print_integer(pib);
          print_string(" miles de dólares.\n");
        }
      }
    } else if (opc == '3') {
      char texto[] = "Bienvenidos al examen de ensamblador.";
      char caracteres[] = { ' ', 'a', 'e', 'i', 'o', 'u' };
      print_string("Texto inicial:                             «");
      print_string(texto);
      print_string("»\n");
      for (int i = 0; i < sizeof(caracteres) / sizeof(caracteres[0]); ++i) {
        print_string("Texto después de eliminar el carácter «");
        print_character(caracteres[i]);
        print_string("»: «");
        cadena_eliminar(texto, caracteres[i]);
        print_string(texto);
        print_string("»\n");
      }
    } else if (opc == '4') {
      int tests[] = { 100000, 1000000, 10000000 };
      for (int i = 0; i < sizeof(tests) / sizeof(tests[0]); ++i) {
        print_string("Países con más de ");
        print_integer(tests[i]);
        print_string(" habitantes:\n");
        int total = imprimir_y_contar_paises_mas_poblados(tests[i]);
        print_string("Total de paises encontrados: ");
        print_integer(total);
        print_string("\n\n");
      }      
    } else if (opc == '5') {
      struct { int array[16]; int size; } tests[] = {
        { { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, 10 },
        { { 9, 4, 2, 1, 3, }, 5 }
      };
      for (int i = 0; i < sizeof(tests) / sizeof(tests[0]); ++i) {
        print_string("Array:           ");
        for (int j = 0; j < tests[i].size; ++j) {
          print_integer(tests[i].array[j]);
          print_string(" ");
        }
        invertir_array_int(tests[i].array, tests[i].size);
        print_string("\nArray invertido: ");
        for (int j = 0; j < tests[i].size; ++j) {
          print_integer(tests[i].array[j]);
          print_string(" ");
        }
        print_string("\n");
      }
    } else if (opc == '0') {
      print_string("¡Adiós!\n");
      mips_exit(0);
    } else {
      print_string("Opción incorrecta. Pulse cualquier tecla para seguir.\n");
      read_character();
    }
  }
}
  

