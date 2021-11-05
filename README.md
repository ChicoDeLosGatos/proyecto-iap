# Proyecto DCU-IAP

## Entregable 1: Módulo de integración
El objetivo de este ejercicio es diseñar una solución haciendo uso de un
middleware para la integración de aplicaciones que permita realizar la
integración de datos entre los sistemas de PoliformaT, Aplicación de Configuración
de Grupos y Entregas, PADRINO y el GGAE. Los procesos de integración son los
siguientes:
- ✅ Importación de Alumnos desde PoliformaT a GGAE 
- Importación de Alumnos en Asignaturas desde PoliformaT a GGAE
- Importación de Grupos desde Aplicación de Grupos y Entregas a GGAE
- Importación de Entregas desde Aplicación de Grupos y Entregas a GGAE
- Exportación de Notas Individuales desde GGAE a PADRINO
### Importación de Alumnos desde PoliformaT a GGAE
El objetivo de este proceso es introducir los alumnos disponibles en PoliformaT e importarlos (crearlos) en la BD de GGAE (tabla 'alumnos').
La aplicación de PoliformaT permite generar un fichero con los alumnos disponibles siguiendo el siguiente formato (en CSV):
```
<apellidos>, <nombre>, <dni>, <email>
<apellidos>, <nombre>, <dni>, <email>
...
<apellidos>, <nombre>, <dni>, <email>
```
### Importación de Alumnos en Asignaturas desde PoliformaT a GGAE
El objetivo de este proceso es introducir los alumnos matriculados en una asignatura (disponibles en PoliformaT) e importarlos (crearlos) en la BD de GGAE (tabla 'alumnos_asignaturas').
La aplicación de PoliformaT permite generar un fichero con los alumnos matriculados en una asignatura con el siguiente formato (en CSV):
```
<dni>
<dni>
...
```
Donde el nombre del fichero indica el código de la asignatura.
### Importación de Grupos desde Aplicación de Grupos y Entregas a GGAE
El objetivo de este proceso es crear los grupos que los alumnos han configurado en la aplicación e importarlos (crearlos) en la BD de GGAE (tablas 'grupos' y 'alumnos_grupos').
La aplicación de Configuración de Grupos y Entregas permite generar un fichero con los grupos y sus alumnos en una asignatura con el siguiente formato (en JSON):
```
[
	{
		"grupo": < id >,
		"asignatura": "<id_asig>",
		"alumnos": ["<email>", "<email>", "<email>"]
		},
		{
		"grupo": < id > ,
		"asignatura": "<id_asig>",
		"alumnos":["<email>","<email>","<email>","<email>"]
	},
	…
]
```
### Importación de Entregas desde Aplicación de Grupos y Entregas a GGAE
El objetivo de este proceso es crear una entrega de un grupo para un acto de evaluación (y establecer una nota) en la BD de GGAE (tabla 'entregas').
La aplicación de Configuración de Grupos y Entregas permite generar un fichero con las entregas de los grupos con el siguiente formato (en JSON):
```
[
	{
		"grupo": <id>,
		"acto_eval": "<id>",
		"nota": float* ,
		"a-tiempo": 0/1
	},
	{
		"grupo": < id > ,
		"acto_eval": "<id>",
		"nota": float * ,
		"a-tiempo": 0 / 1
	},
	...
]
```
### Exportación de Notas Individuales desde GGAE a PADRINO
El objetivo de este proceso es exportar notas individuales (no grupales) para que sean importadas por el programa PADRINO. Para ello, se le indicará a este proceso de integración qué acto de evaluación se desea exportar, y se generará un fichero grades.csv, siguiendo el formato PADRINO.
Para empezar, se deberá atender a peticiones de generación de notas siguiendo los siguientes formatos:
#### CSV
`<id-acto-evaluacion>`
Ejemplo CSV Solicitud Generación Notas (generaPADRINO.IAP.2021.ACTO.E1.csv)
```
IAP.2021.ACTO.E1
```
#### XML
`<ActoEvaluacion>id-acto</ActoEvaluacion>`
Ejemplo XML Solicitud Generación Notas (generaPADRINO.IAP.2021.ACTO.E1.xml)
```
<ActoEvaluacion>IAP.2021.ACTO.E1</ActoEvaluacion>
```
#### JSON
`{"acto-evaluacion":<id-acto>}`
Ejemplo JSON Solicitud Generación Notas (generaPADRINO.IAP.2021.ACTO.E1.json)
```
{"acto-evaluacion":"IAP.2021.ACTO.E1"}
```
Para cada solicitud recibida, el proceso debe generar un fichero llamado `grades.csv` con la siguiente estructura:
```
"<nombre-acto-evaluacion>";"SCORE_GRADE_TYPE"
""
"ID";"Apellidos";"Nombre";"Calificacion";"Entrega Retrasada"
"<dni>";"<apellidos>";"<nombre>";"<nota>";"!<a-tiempo>"
"<dni>";"<apellidos>";"<nombre>";"<nota>";"!<a-tiempo>"
...
```
NOTA 1: Este documento tiene:
- una primera línea de cabecera formada por dos campos: el nombre del acto de
evaluación, y un campo fijo "SCORE_GRADE_TYPE"
- una segunda línea con el contenido ""
- una tercera línea con la cabecera (fija) de los datos
- el resto de líneas constituyen calificaciones individuales a alumnos

NOTA 2: Las calificaciones en PADRINO se introducen en formato 'float' con un
decimal (redondeo al número más próximo), y con el separador decimal ',' (coma).

NOTA 3: El campo 'Entrega Retrasada' es el contrario lógico (not) a 'a tiempo' (que se
importa de la aplicación de Configuración de Grupos y Entregas y se almacena en BD).