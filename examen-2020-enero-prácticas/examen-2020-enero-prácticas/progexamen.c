/* Compilar con: gcc -Wall -g -std=c11 -oprogexamen progexamen.c mips-runtime.c keyio.c */

#include <stdbool.h>
#include "mips-runtime.h"

/* Pregunta un entero cuyo valor debe ser mayor o igual que min y
 * menor o igual que max */
int preguntar_entero(char* mensaje, int min, int max) {
  /* POR HACER */
}

char convierte_a_minuscula(char c) {
  if (c >= 'A' && c <= 'Z') {
    return c + ('a' - 'A'); // c + 32
  } else {
    return c;
  }
}

int contar_apariciones(char *str, char c) {
  c = convierte_a_minuscula(c);
  int cuenta = 0;
  for (int i = 0; str[i] != '\0'; ++i) {
    if (convierte_a_minuscula(str[i]) == c) {
      cuenta = cuenta + 1;
    }
  }
  return cuenta;
}

void imprimir_rectangulo(int ancho, int alto, char relleno) {
  /* POR HACER */
}

typedef struct {
  int x;
  int y;
  int z;
} Vector;

Vector vectores[10] = {
  { 1, 2, 3 },
  { 3, 2, 1 },
  { -200, 101, 0 },
  { 2000, 1111, 0 },
  { 100, 101, 0 },
  { -70, 71, 0 },
  { 2, 1111, 0 },
  { 21, 33, 0 },
  { 8, 9, 0 },
  { 13, 1, 0 }
};

void sumar_vectores(Vector *resultado, Vector *array, int num_elementos) {
  resultado->x = 0;
  resultado->y = 0;
  resultado->z = 0;
  for (int i = 0; i < num_elementos; ++i) {
    resultado->x = resultado->x + array[i].x;
    resultado->y = resultado->y + array[i].y;
    resultado->z = resultado->z + array[i].z;
  }
}

void print_vector(Vector* v) {
  print_character('(');
  print_integer(v->x);
  print_character(',');
  print_integer(v->y);
  print_character(',');
  print_integer(v->z);
  print_character(')');
}

void concatenar_cadenas(char* dst, char* src_a, char* src_b) {
  /* POR HACER */
}

int main(int argc, char* argv[]) {
  clear_screen();
  while (true) {
    print_string("\n\nExamen de ETC de ensamblador\n"
                 "\n"
                 " 1. Lectura de un entero\n"
                 " 2. Contar apariciones de una letra en un texto\n"
                 " 3. Dibujar un rectángulo\n"
                 " 4. Sumar array de vectores\n"
                 " 5. Concatenar cadenas\n"
                 " 0. Salir\n\n"
                 "Elige una opción: ");
    char opc = read_character();
    print_string("\n\n");
    if (opc == '1') {
      int i = preguntar_entero("Introduce un entero entre 15 y 25: ", 15, 25);
      print_string("El entero leído ha sido: ");
      print_integer(i);
      print_string(".\n");
    } else if (opc == '2') {
      char texto[] = "En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que...";
      print_string("En el texto: «");
      print_string(texto);
      print_string("»\n");
      char letras[] = {'e', 'l', 'm', 'M' };
      for (int i = 0; i < sizeof(letras) / sizeof(letras[0]); ++i) {
        print_string("   la letra «");
        print_character(letras[i]);
        print_string("» aparece ");
        print_integer(contar_apariciones(texto, letras[i]));
        print_string(" veces.\n");
      }
      contar_apariciones(texto, 'e');
    } else if (opc == '3') {
      print_string("Introduzca el ancho deseado para el rectángulo: ");
      int w = read_integer();
      print_string("Introduzca el alto deseado para el rectángulo: ");
      int h = read_integer();
      print_string("Introduzca el carácter de relleno para el rectángulo: ");
      char c = read_character();
      print_character('\n');
      imprimir_rectangulo(w, h, c);
    } else if (opc == '4') {
      for (int i = 0; i < sizeof(vectores) / sizeof(vectores[0]); ++i) {
        if (i == 0) {
          print_string("   ");
        } else {
          print_string("\n + ");
        }
        print_vector(&vectores[i]);
      }
      print_string("\n = ");
      Vector v;
      sumar_vectores(&v, vectores, sizeof(vectores) / sizeof(vectores[0]));
      print_vector(&v);
    } else if (opc == '5') {
      struct { char* a; char* b; } tests[] = {
        { "aaaaa", "bbbbb" },
        { "anti", "congelante" },
        { "Estructura y ", "Tecnología de Computadores" },
        { "E", "TC" },
      };
      char buffer[200];
      for (int i = 0; i < sizeof(tests) / sizeof(tests[0]); ++i) {
        print_string("La concatenación de «");
        print_string(tests[i].a);
        print_string("» y «");
        print_string(tests[i].b);
        print_string("» es «");
        concatenar_cadenas(buffer, tests[i].a, tests[i].b);
        print_string(buffer);
        print_string("».\n");
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
  

