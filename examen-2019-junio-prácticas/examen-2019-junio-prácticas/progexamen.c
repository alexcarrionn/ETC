/* Compilar con: gcc -Wall -g -std=c11 -oprogexamen progexamen.c mips-runtime.c keyio.c */

#include <stdbool.h>
#include "mips-runtime.h"

/* Pregunta una cadena de longitud máxima max caracteres y la almacena
 * en buffer */
void preguntar_cadena(char* mensaje, char* buffer, int max) {
  print_string(mensaje);
  read_string(buffer, max);
}

/* Compara los primeros num_caracteres de dos cadenas (s1 y s2),
 * devolviendo true si y solo si sus primeros num_caracteres son
 * iguales o si ambas cadenas son iguales y tienen menos de
 * num_caracteres */
bool compara_cadena_prefijos(char *s1, char *s2, int num_caracteres) {
  for (int i = 0; i < num_caracteres && (s1[i] != '\0' || s2[i] != '\0'); ++i) {
    if (s1[i] != s2[i]) {
      return false;
    }
  }
  return true;
}

/* Cuenta el número de caracteres de una cadena */
int cadena_longitud(char* str) {
  int l = 0;
  while (str[l] != '\0') {
    ++l;
  }
  return l;
}

/* Si la cadena texto tiene al menos i líneas, copia la línea iésima
 * de texto en buffer (que debe de tener suficiente espacio) y
 * devuelve true. Si la cadena tiene menos de i líneas, devuelve
 * false */
bool extraer_linea(char *texto, int i, char *buffer) {
  char *p = texto;
  int nl = 0;
  while (nl < i && *p != '\0') {
    if (*p == '\n') {
      ++nl;
    }
    ++p;
  }
  if (nl == i) {
    char *q = buffer;
    while (*p != '\n' && *p != '\0') {
      *q = *p;
      ++p;
      ++q;
    }
    *q = '\0';
    return true;
  } else {
    return false;
  }
}

/* Comprueba si una cadena (nombre) es subcadena de otra (linea) */
bool aparece_nombre(char *linea, char *nombre) {
  char *p = linea;
  int ln = cadena_longitud(nombre);
  while (*p != '\0') {
    if (compara_cadena_prefijos(p, nombre, ln)) {
      return true;
    }
    ++p;
  }
  return false;
}

char buffer_contar_apariciones[1024]; // para almacenar una línea de texto

/* Cuenta cuántas líneas de texto tienen a nombre como subcadena */
int contar_apariciones(char *texto, char *nombre) {
  int cuenta = 0;
  int nl = 0;
  while (extraer_linea(texto, nl, buffer_contar_apariciones)) {
    ++nl;
    if (aparece_nombre(buffer_contar_apariciones, nombre)) {
      ++cuenta;
    }
  }
  return cuenta;
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

typedef struct { // alacena el resultado de una cuenta de vocales
  int num_a;
  int num_e;
  int num_i;
  int num_o;
  int num_u;
} CuentaVocales;

/* Cuenta cuántas veces aparece cada vocal minúscula y sin acento
 * (caracteres aeiou) en la cadena texto, y rellena la estructura
 * resultado con el resultado */
void contar_vocales(char *texto, CuentaVocales *resultado) {
  /* por hacer */
}

typedef struct { // Información sobre una cuenta corriente
  char titular[100];
  int saldo;
} CuentaCorriente;

CuentaCorriente cuentas[] = { // Todas las Cuentas del banco
  { "Pepe Fulanito Mengano", 123453 },
  { "Pepa Fulanito del Monte", 213441 },
  { "Pepe Segundo", 1457894 },
  { "Manuel Zutano", 457814 },
};
int num_cuentas = sizeof(cuentas) / sizeof(cuentas[0]); // es decir: 4

/* Devuelve el saldo del cliente titular de acuerdo al array cuentas,
 * o 0 si no se encuentra al cliente */
int obtener_saldo(char *titular) {
  /* por hacer */
}

int main(int argc, char* argv[]) {
  clear_screen();
  print_string("\nExamen de ETC de ensamblador\n");
  while (true) {
    print_string("\n\n"
                 " 1. Lectura de una cadena por teclado\n"
                 " 2. Comparar cadenas (prefijos)\n"
                 " 3. Buscar cuantas veces aparece un nombre o teléfono en una agenda\n"
                 " 4. Contar vocales\n"
                 " 5. Buscar en tabla de saldos\n"
                 " 0. Salir\n\n"
                 "Elige una opción: ");
    char opc = read_character();
    print_string("\n\n");
    if (opc == '1') {
      char buffer[20];
      preguntar_cadena("Introduce una cadena: ", buffer, sizeof(buffer) / sizeof(buffer[0]));
      // normalmente buffer contendrá un \n final puesto que la
      // llamada al sistema lo incluye si no se leen más caracteres de
      // los indicados. Lo eliminamos.
      cadena_eliminar(buffer, '\n');
      print_string("\nLa cadena leída ha sido: «");
      print_string(buffer);
      print_string("».\n");
    } else if (opc == '2') {
      struct { int n; char *s1; char *s2; } tests[] = {
        { 5, "aaaaaaaa", "bbbbbbbbb" },
        { 5, "abcdef", "abcdeg" },
        { 6, "abcdef", "abcdeg" },
        { 9, "abcdef", "abcdef" },
        { 9, "abcdef", "abcd" },
      };
      for (int i = 0; i < sizeof(tests) / sizeof(tests[0]); ++i) {
        print_string("Los primeros ");
        print_integer(tests[i].n);
        print_string(" caracteres de las cadenas «");
        print_string(tests[i].s1);
        print_string("» y «");
        print_string(tests[i].s2);
        print_string(compara_cadena_prefijos(tests[i].s1, tests[i].s2, tests[i].n) ?
                     "» son iguales.\n" : "» son distintos.\n");
      }
    } else if (opc == '3') {
      char *agenda =
        "Pepe Pérez López: 679876543\n"
        "Pepa López Pérez: 654783421\n"
        "Tío Pepe: 679876543\n"
        "Manuel Gómez Martínez: 666457482\n"
        ;
      struct { char *nombre; } tests[] = {
        { "Pepe" },
        { "Gómez Martínez" },
        { "Sánchez" },
        { "679876543" },
      };
      print_string("En la siguiente agenda: \n");
      print_string(agenda);
      print_string("\n");
      for (int i = 0; i < sizeof(tests) / sizeof(tests[0]); ++i) {
        print_string("El nombre o teléfono «");
        print_string(tests[i].nombre);
        print_string("» aparece ");
        print_integer(contar_apariciones(agenda, tests[i].nombre));
        print_string(" veces.\n");
      }
    } else if (opc == '4') {
      char *texto = "En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que vivía un hidalgo de los de lanza en astillero, adarga antigua, rocín flaco y galgo corredor. Una olla de algo más vaca que carnero, salpicón las más noches, duelos y quebrantos los sábados, lantejas los viernes, algún palomino de añadidura los domingos, consumían las tres cuartas partes de su hacienda. El resto della concluían sayo de velarte, calzas de velludo para las fiestas, con sus pantuflos de lo mesmo, y los días de entresemana se honraba con su vellorí de lo más fino.";
      print_string("En el siguiente texto: \n«");
      print_string(texto);
      print_string("»\n\n");
      CuentaVocales res = { 0, 0, 0, 0, 0 };
      contar_vocales(texto, &res);
      print_string("Aparecen ");
      print_integer(res.num_a);
      print_string(" aes, ");
      print_integer(res.num_e);
      print_string(" es, ");
      print_integer(res.num_i);
      print_string(" íes, ");
      print_integer(res.num_o);
      print_string(" oes, y ");
      print_integer(res.num_u);
      print_string(" úes minúsculas y sin tilde.\n");
    } else if (opc == '5') {
      struct { char *nombre; } tests[] = {
        { "Pepe Fulanito Mengano" },
        { "Juana Menganita" },
        { "Pepa Fulanito del Monte" },
        { "Manuel Zutano" },
      };
      for (int i = 0; i < sizeof(tests) / sizeof(tests[0]); ++i) {
        print_string("El saldo de «");
        print_string(tests[i].nombre);
        print_string("» es de ");
        print_integer(obtener_saldo(tests[i].nombre));
        print_string(" pesetas.\n");
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
  

