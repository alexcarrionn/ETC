/* Compilar con: gcc -Wall -g -std=c11 -oprogexamen progexamen.c mips-runtime.c keyio.c */

#include <stdbool.h>
#include "mips-runtime.h"

long unsigned int strlen(const char* s) {
  const char* p = s;
  while (*p != '\0') {
    ++p;
  };
  return p - s;
}

int strcmp(const char* s1, const char* s2) {
  while (*s1 == *s2 && *s1 != '\0') {
    ++s1;
    ++s2;
  };
  return *s1 - *s2;
}

#define MAX_LONGITUD_NOMBRE 15
struct CiudadRep {
  char nombre_ciudad[MAX_LONGITUD_NOMBRE];
  char nombre_pais[MAX_LONGITUD_NOMBRE];
  int poblacion;
  int porcentaje_variacion_anual;
};
typedef struct CiudadRep Ciudad;

#define MAX_CIUDADES 100
Ciudad ciudades[MAX_CIUDADES] = {
  { "Tokyo", "Japan", 37400068, -5 },
  { "Delhi", "India", 28514000, 9 },
  { "Shanghai", "China", 25582000, 7 },
  { "Sao Paulo", "Brazil", 21650000, 3 },
  { "Mexico City", "Mexico", 21581000, 4 },
  { "Cairo", "Egypt", 20076000, -2 },
  { "Mumbai", "India", 19980000, 8 },
  { "Beijing", "China", 19618000, 3 },
  { "Dhaka", "Bangladesh", 19578000, 8 },
  { "Osaka", "Japan", 19281000, -1 },
  { "New York City", "United States ", 18819000, 2 },
  { "Karachi", "Pakistan", 15400000, 8 },
  { "Buenos Aires", "Argentina", 14967000, -1 },
  { "Chongqing", "China", 14838000, 4 },
  { "Istanbul", "Turkey", 14751000, 4 },
  { "Kolkata", "India", 14681000, 7 },
};
int num_ciudades = 16;

void listar_ciudades(void) {
  for (int i = 0; i < num_ciudades; ++i) {
    print_string(ciudades[i].nombre_ciudad);
    for (int j = strlen(ciudades[i].nombre_ciudad); j < MAX_LONGITUD_NOMBRE + 2; ++j) {
      print_character(' ');
    }
    print_string(ciudades[i].nombre_pais);
    for (int j = strlen(ciudades[i].nombre_pais); j < MAX_LONGITUD_NOMBRE + 2; ++j) {
      print_character(' ');
    }
    print_integer(ciudades[i].poblacion);
    print_character('\t');
    print_integer(ciudades[i].porcentaje_variacion_anual);
    print_character('\n');
  }
}

void intercambiar_ciudades(int a, int b) {
  Ciudad t = ciudades[a];
  ciudades[a] = ciudades[b];
  ciudades[b] = t;
}

/* EJERCICIO 1 */
void ordenar_ciudades_alfabeticamente(void) {
  int g = num_ciudades;
  bool finish = false;
  while (!finish) {
    g = g * 10 / 13;
    if (g < 1) {
      g = 1;
      finish = true;
    }
    for (int i = 0; i + g < num_ciudades; ++i) {
      if (strcmp(ciudades[i].nombre_ciudad, ciudades[i + g].nombre_ciudad) > 0) {
        finish = false;
        intercambiar_ciudades(i, i + g);
      }
    }
  }   
}

void copiar_ciudad(int pos_origen, Ciudad* array_destino, int pos_destino) {
  array_destino[pos_destino] = ciudades[pos_origen];
}

/* EJERCICIO 2 */
int seleccionar_ciudades_por_pais(char* pais, Ciudad* array_destino) {
  int longitud_pais = strlen(pais);
  int num_copiadas = 0;
  for (int i = 0; i < num_ciudades; ++i) {
    bool copiar = true;
    for (int j = 0; j < longitud_pais; ++j) {
      if (ciudades[i].nombre_pais[j] != pais[j]) {
        copiar = false;
      }
    }
    if (copiar) {
      copiar_ciudad(i, array_destino, num_copiadas);
      num_copiadas = num_copiadas + 1;
    }
  }
  return num_copiadas;
}

/* EJERCICIO 3 */
int actualiza_poblacion(int num_anos) {
  /* POR HACER */
}

int main(int argc, char* argv[]) {
  clear_screen();
  while (true) {
    print_string("\n\nExamen de ETC de ensamblador\n\n"
                 " 1. Ordenar ciudades alfabéticamente\n"
                 " 2. Seleccionar ciudades por país\n"
                 " 3. Actualizar población de las ciudades\n"
                 " 0. Salir\n\n"
                 "Elige una opción: ");
    char opc = read_character();
    print_string("\n\n");
    if (opc == '1') {
      print_string("Listado de ciudades:\n");
      listar_ciudades();
      print_string("\nListado de ciudades ordenado alfabéticamente:\n");
      ordenar_ciudades_alfabeticamente();
      listar_ciudades();
    } else if (opc == '2') {
      char* paises[] = { "Japan", "China", "India", "Bangladesh", "Egypt", "Spain" };
      Ciudad destino[MAX_CIUDADES];
      for (int i = 0; i < sizeof(paises) / sizeof(paises[0]); ++i) {
        print_string("Ciudades de ");
        print_string(paises[i]);
        print_string(": ");
        int n = seleccionar_ciudades_por_pais(paises[i], destino);
        for (int j = 0; j < n; ++j) {
          print_string(destino[j].nombre_ciudad);
          print_character(' ');
        }
        print_character('\n');
      }
    } else if (opc == '3') {
      print_string("Listado de ciudades:\n");
      listar_ciudades();
      print_string("\nListado de ciudades 5 años después:\n");
      int total = actualiza_poblacion(5);
      listar_ciudades();
      print_string("\nVariación total de población: ");
      print_integer(total);
    } else if (opc == '0') {
      print_string("¡Adiós!\n");
      mips_exit(0);
    } else {
      print_string("Opción incorrecta. Pulse cualquier tecla para seguir.\n");
      read_character();
    }
  }
}
