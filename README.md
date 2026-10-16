# 📖 Agenda de Contactos CLI

> 🔗 **Repositorio remoto:** https://github.com/XanaduZephyr/contact_list

## 📝 Descripción del Proyecto

Este es un proyecto de consola desarrollado en **Dart** que permite gestionar una agenda telefónica básica. La aplicación cuenta con un menú interactivo con opciones para agregar, listar, buscar y eliminar contactos.

El propósito principal de este repositorio es aplicar y documentar el uso de la metodología **Gitflow** para el trabajo colaborativo, demostrando la gestión de ramas (`main`, `develop`, `feature`, `release`) y la resolución de conflictos en equipo.

## 👥 Equipo de Trabajo y Roles

A continuación, se detalla el equipo de aprendices involucrados en el desarrollo y sus responsabilidades técnicas y de control de versiones:

| Nombre del Aprendiz | Rol en Gitflow | Tareas Asignadas (Dart) |
| :--- | :--- | :--- |
| **Jadilson Marin** | **Líder de Repositorio** (Ramas `main`, `develop`) | Estructura inicial, menú base, opción de **Agregar** contacto. Gestión de integración. |
| **[Nombre Aprendiz 2]** | **Desarrollador Feature** (Rama `feature/listar`) | Creación del modelo `Contacto` y lógica de la opción de **Listar** contactos. |
| **[Nombre Aprendiz 3]** | **Desarrollador Feature** (Rama `feature/gestion`) | Implementación de los algoritmos para **Buscar** y **Eliminar** contactos en la lista. |

> ⚠️ **Para completar la entrega:** reemplaza `[Nombre Aprendiz 2]` y `[Nombre Aprendiz 3]` por los nombres reales del equipo.
>
> 📌 **Estado de publicación:** repositorio publicado en `https://github.com/XanaduZephyr/contact_list` con las ramas `main`, `develop`, `release/1.0.0`, `feature/agregar`, `feature/listar`, `feature/gestion` y los tags de versión `v1.0.0` / `v1.0.1`.

## 🧱 Estructura de Carpetas

```text
contact list/
├── bin/
│   └── JadilsonMarin/          # Carpeta de algoritmos (clases, entrada de datos y ciclos)
│       ├── a1.dart             # Distancia en MRU
│       ├── a2.dart             # Total devengado de un empleado
│       ├── a3.dart             # Hipotenusa de un triángulo rectángulo
│       ├── a4.dart             # Conversión de °C a °F
│       └── a5.dart             # Serie Fibonacci hasta 100
├── lib/
│   ├── main.dart               # Punto de entrada de la aplicación y menú interactivo
│   └── contact.dart            # Definición de la clase Contacto (Modelo)
├── .gitignore                  # Archivos y carpetas que Git no debe rastrear
└── README.md                   # Documentación general del proyecto y roles del equipo
```

## 🚀 Instrucciones de Ejecución

Para ejecutar este proyecto en tu entorno local, asegúrate de tener el SDK de Dart instalado y ejecuta el siguiente comando en la raíz del proyecto:

```bash
dart run lib/main.dart
```

Verificación estática del código (opcional, recomendada antes de cada commit):

```bash
dart analyze lib bin
```

> 📌 El punto de entrada (`main.dart`) se ubica en `lib/` según el encarpetado de la actividad y el modelo en `lib/contact.dart`, por eso el comando apunta a `lib/main.dart`.

## 🧩 Funcionalidades y Responsables

| Opción | Función | Responsable | Rama Gitflow |
| :--- | :--- | :--- | :--- |
| 1 | Agregar contacto (valida teléfonos duplicados) | Aprendiz 1 (Líder) | `feature/agregar` |
| 2 | Listar contactos (recorrido de la lista con `for`) | Aprendiz 2 | `feature/listar` |
| 3 | Buscar contacto (coincidencia parcial, sin distinguir mayúsculas) | Aprendiz 3 | `feature/gestion` |
| 4 | Eliminar contacto (selector cuando hay varias coincidencias) | Aprendiz 3 | `feature/gestion` |
| 5 | Salir | Aprendiz 1 (Líder) | `main` / `develop` |

## 🌳 Flujo de Trabajo con Gitflow

### 1. Inicialización del repositorio (Aprendiz 1 - Líder)

```bash
git init
git add .
git commit -m "chore: estructura inicial del proyecto"
git branch -M main
git remote add origin url_repositorio
git push -u origin main

git checkout -b develop
git push -u origin develop
```

### 2. Sincronización de los colaboradores (Aprendices 2 y 3)

```bash
git clone url_repositorio
cd contact-list
git checkout develop
git pull origin develop
```

### 3. Ramas feature (cada aprendiz trabaja por separado)

```bash
git checkout -b feature/listar develop      # Aprendiz 2
git checkout -b feature/agregar develop     # Aprendiz 1
git checkout -b feature/gestion develop     # Aprendiz 3

git add lib/contact.dart
git commit -m "feat(modelo): definir clase Contacto en lib/contact.dart"
git push -u origin feature/listar
```

Cada `feature` se integra con **Pull Request** hacia `develop`, o localmente con merge explícito para conservar la topología Gitflow:

```bash
git checkout develop
git pull origin develop
git merge --no-ff feature/listar -m "Merge branch 'feature/listar' into develop"
git push origin develop
```

### 4. Cierre de la versión (rama `release`)

```bash
git checkout -b release/1.0.0 develop
git add README.md
git commit -m "chore(release): documentar version 1.0.0"

git checkout main
git merge --no-ff release/1.0.0 -m "chore(release): integrar release/1.0.0 en main"
git tag -a v1.0.0 -m "Version 1.0.0 - Agenda de Contactos CLI"
git push origin main --tags

git checkout develop
git merge --no-ff release/1.0.0 -m "chore: sincronizar develop con release/1.0.0"
git push origin develop
```

### 5. Resolución de conflictos en equipo

Un conflicto aparece cuando dos ramas modifican **las mismas líneas** del mismo archivo (por ejemplo, el bloque `switch` de `lib/main.dart`). Pasos para resolverlo:

```bash
git checkout develop
git merge --no-ff feature/gestion      # Git reporta CONFLICT
git status                             # lista los archivos en conflicto
# Se edita el archivo conservando las dos versiones necesarias
# y se eliminan los marcadores <<<<<<< , ======= , >>>>>>>
git add lib/main.dart
git commit -m "merge: resolver conflicto en el menu de opciones"
```

Si la resolución se complica, se puede deshacer y reintentar:

```bash
git merge --abort
git checkout develop
git pull origin develop
```

**Acuerdos del equipo:** mantener cada opción del menú dentro de su propio bloque `case` para reducir conflictos, integrar `develop` en la feature (`git merge develop`) antes de abrir el Pull Request y ejecutar `dart analyze` antes de cada `push`.

## 📊 Evidencia del Historial Gitflow

```text
*   b917a6a Merge branch 'feature/gestion' into develop
|\
| * 24e2951 feat(gestion): implementar opciones 3 y 4 (buscar y eliminar contacto)
|/
*   8120882 Merge branch 'feature/agregar' into develop
|\
| * 1536330 feat(agregar): agregar auxiliar leerTexto e implementar opcion 1
|/
*   6ca7626 Merge branch 'feature/listar' into develop
|\
| * 9352215 feat(listar): implementar opcion 2 (ver contactos) del menu
| * 1bd37c8 feat(modelo): definir clase Contacto en lib/contact.dart
|/
* ef6ea6a (main) chore: estructura inicial del proyecto
```

## ✍️ Convención de Commits

Se usa **Conventional Commits**: `feat(...)` para nuevas funcionalidades, `chore(...)` para estructura o mantenimiento, `merge(...)` para integraciones entre ramas y `docs(...)` para documentación.

